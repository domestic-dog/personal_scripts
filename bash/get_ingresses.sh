                                                                      #ignore_namespaces
list_namespaces=$(kubectl get namespaces | cut -d ' ' -f 1 | grep -vE 'ingress*|NAME|default|logging|kube.*');

for namespace in $list_namespaces;
        do
                echo $namespace
                result=$(kubectl get ing -n $namespace | grep -oi " .*.local" |  sed  "s/ //g");
                        for i in $result;
                                do
                                        if  echo $i | grep -q 'gui'
                                        then
                                                echo http://$i/;
                                        else
                                                echo "http://$i/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config";
                                        fi
                        done;
        done;