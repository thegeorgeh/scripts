
#!/bin/bash

mangasite=("https://mangakakalot.com/" "https://m.fanfox.net/")
manga=("6 Worlds of Cultivation" "I am the Sorcerer King" "Jishou! Heibon Mazoku no Eiyuu Life: B-Kyuu Mazoku Nano ni Cheat Dungeon wo Tsukutteshimatta Kekka" "Maougakuin no Futekigousha" "Martial Peak" "Mastery of Legendary Realms" "Onepunch-Man" "Release That Witch" "Shinka no Mi" "Solo Leveling" "Tensei Ouji wa Daraketai" "Black Clover")

msLen=${#mangasite[@]}
mLen=${#manga[@]}

text="\n"
counter=0

for (( i=0; i<$msLen; i++ ))
do
    
    text+="${mangasite[$i]}\n"
    
    op=$( curl -s "${mangasite[$i]}" ) 
   
    
    for (( j=0; j<$mLen; j++ ))
    do
	if [[ "$op" == *"\"${manga[$j]}\""* ]];  
	then
    	    text+="${manga[$j]}\n"
	    let counter+=1
	fi
    done
    text+="\n"
done

printf "$text"
printf "$counter\n"

if (( $counter > 0 ))
then
    printf "$text" > ~/Desktop/manga.txt
    notify-send "New Manga Available"
else
    printf "" > ~/Desktop/manga.txt
fi

	
