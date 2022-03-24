import requests
import os
import logging
import git
from git import Repo

settings = {
    'token': "your_token",
    'url': 'http://gitlab.example.example/api/v4/',
    'target_group': 'your_target_group'
}


class Gitlab:
    def __init__(self, settings):
        logging.basicConfig(format='%(asctime)s - %(message)s', level=logging.INFO)

        self.url = settings['url']
        self.target_group = settings['target_group']
        self.headers = {'Authorization': f'Bearer {settings["token"]}'}

        main_group = self.__get_main_group(self.url, self.target_group)
        projects_in_main_group = self.__get_projects_in_main_group(main_group)
        self.__clone_repos(projects_in_main_group, self.target_group)

    def request_gitlab(self, url, uri_method):
        try:
            r = requests.get(f"{url}{uri_method}", headers=self.headers)
            logging.info(f'Request is {r.url}')
            r.raise_for_status()
            r = r.json()
            return r
        except requests.exceptions.HTTPError as e:
            print(repr(e))

    # # 1 get all groups using personal assess token
    # def __get_all_groups(self, url):
    #     result = self.request_gitlab(url, 'groups')
    #     return result

    # 2
    def __get_target_group_id(self, json, group_name):
        for i in json:
            if i['name'] == group_name:
                logging.info(f"Detected group id {i['id']} ")

                if not os.path.exists(f"./{group_name}"):
                    os.makedirs(f"./{group_name}")
                    logging.info(f"Created directory ./{group_name}")
                else:
                    logging.info(f'{group_name} already exist')
                return i['id']

    def __get_main_group(self, url, group_id):
        result = self.request_gitlab(url, f'groups/{group_id}')
        return result

    def __get_projects_in_main_group(self, json):
        my_url_list = {}
        for i in json['projects']:
            if not i['archived']:
                my_url_list[i['name']] = i['http_url_to_repo']
        return my_url_list

    def __clone_repos(self, dicts, target_group):
        try:
            for key, value in dicts.items():
                Repo.clone_from(value, f'./{target_group}/{key}')
                logging.info(f'Clone {value} to ./{target_group}/{key}')
        except git.GitCommandError:
            print(f'Directory {target_group} already exist, please delete {target_group} and rerun script')


x = Gitlab(settings)
