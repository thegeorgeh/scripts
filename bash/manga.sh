
#!/bin/bash

mangasite=("https://mangakakalot.com/" "https://m.fanfox.net")
manga=("6 worlds of cultivation" "i am the sorcerer king" "jishou! heibon mazoku no eiyuu life: b-kyuu mazoku nano ni cheat dungeon wo tsukutteshimatta kekka" "maougakuin no futekigousha" "martial peak" "mastery of legendary realms" "onepunch-man" "release that witch" "shinka no mi" "solo Leveling" "tensei ouji wa daraketai")

msLen=${#mangasite[@]}
mLen=${#manga[@]}

text="\n"

for (( i=0; i<$msLen; i++ ))
do
    #echo ${mangasite[$i]}
    text+="${mangasite[$i]}\n"
    
    op=$( curl -s --ipv6 ${mangasite[$i]} | tr '[:upper:]' '[:lower:]' )
    for (( j=0; j<$mLen; j++ ))
    do
	if [[ $op == *${manga[$j]}* ]]; 
	then
#	    #echo ${manga[$j]}
    	    text+="${manga[$j]}\n"
	fi
 #    
    done
    #echo ''
    text+="\n"
done

printf "$text"
#notify-send "$text"

	
