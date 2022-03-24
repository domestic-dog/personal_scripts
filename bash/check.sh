#mkdir files
#scp PodsytnikD@192.168.100.51:/strg/iflex/ESB_Release_22/modules/* ./files/
list=$(ls -l ./files/ | awk '{print $9 }')
directory='/d/TRICOLOR/айФлекс\,\ ООО/Жаров\ Александр\ -\ Модули/R22FP/$i/ПШ\'
for i in $list
	do
	echo "MODULE IS $i"
	result=$(sha1sum $directory | cut -d ' ' -f 1)
	result_from=$(sha1sum ./files/$i| cut -d ' ' -f 1)
		if [[ $result == $result_from ]]
			then
				echo "$name is good"
			else
				echo "$name is bad"
		fi
	done
