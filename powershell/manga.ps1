$mangasite = "https://mangakakalot.com/", "https://m.fanfox.net" #, "https://www.mangareader.net"
$manga = "A Sugar-Sweet Dad and A Salty-Sour Daughter", "Bodyguard of the Goddess", "Class ga Isekai Shoukan sareta Naka Ore dake Nokotta n desu ga", "Could You Turn Three Perverted Sisters Into Fine Brides?", "Craft Game No \nouryoku De Isekai Kouryaku!!", 
"Cultivation through science", "Different World Slow Life Begun at the Smith", "Dosanko Gyaru Is Mega Cutei", "Eden's Zero", "Extraordinary Son-In-Law", "Hahazuka-san o xx ni Shitai.", "Hakui no Eiyuu", "Henkyou Gurashi no Maou", 
"Himegasaki Sakurako wa Kyou mo Fubin Kawaii!", "Hishou! Heibon Mazoku no Eiyuu Life", "I am the Final Boss", "I Have Twin Girlfriends", "Isekai de tadahitori no mamono tsukai", "Isekai Monster Breeder", "I, the Strongest Demon, Have Regained My Youth?!", 
"It's Sudden, but I cam to Another World! But I hope to live Safely", "Jishou! Heibon Mazoku no Eiyuu Life", "Kitaku Tochuu de Yome to Musume ga dekita n dakedo, Dragon datta", "Magical★Explorer", "Mahou Shoujo Gakuen no Suketto Kyoushi", 
"Makai Kaeri no Rettou Nouryokusha", "Maou Gun Saikyou no Majutushi wa Ningen datta", "Maou ni Natta node", "Maou-sama no Machizukuri!", "Mato Seihei no Slave", "Mo Shou Jian Sheng", "Moto Sekai Ichi'i Subchara Ikusei Nikki", "Mushoku no Eiyuu", 
"My Dad Is Too Strong", "My disciples are super gods", "My Master Is A Deity", "My Roommate Isn't From This World", "Ningen Dakedo Maougun Shitennou ni Sodaterareta Ore wa", "Nise Seiken Monogatari: Osananajimi no Seijo o Uttara Michizure ni Sareta", 
"Noah's Notes", "One Piece", "Ranker Who Lives A Second Time", "Release That Witch", "Re:Monster", "Rettou Hito no Maken Tsukai Sukiruboudo o Kushi Shite Saikyou ni Itaru", "Risou no Himo Seikatsu", "Second Life Ranker", "Sekai no Owari no Encore", 
"Shijou Saikyou no Daimaou", "Shitsugyou Kenja no Nariagari", "Shingan no Yuusha", "Shin no Jitsuryoku wa Girigiri Made Kakushite Iyou to Omou", "Slave Of Black Knight", "Solo Leveling", "Tales of Demons and Gods", "Taming Master", 
"Tensei Shitara Dragon no Tamago Datta", "The Beginning After the End", "The New Gate", "The Other World's Wizard Does Not Chant", "The Useless Tamer Will Turn into the TopUnconsciously by My Previous Life Knowledge", "The World of Moral Reversal", 
"The World's Strongest Fighter Who Tried Too Hard Living A Leisure Life In A World Of Magic", "The Wrong Way to use Healing Magic", "Tsui no Taimashi", "World Trigger", "Yondome wa lyana Shi Zokusei Majutsushi"

$text = ""
#$counter = 0

for ( $i = 0; $i -le $mangasite.length - 1; $i++ ) {
    #Write-Output $mangasite[$i]
    $text += $mangasite[$i] + "`r`n"  
    $sitecontent = Invoke-RestMethod $mangasite[$i]
    for ( $j = 0; $j -le $manga.length; $j++ ) {
        # Write-Output $manga[$j]
        if ( $sitecontent -Match $manga[$j] ) {
   	     	#Write-Output $manga[$j]
   		    $text += $manga[$j] + "`r`n"
		    $counter++
	    }
    }
    $text += "`r`n"
    #Write-Output ''
}

#Write-Output $text
$counter-=2
#Write-Output $counter
$mangafiletext = Get-Content C:\Users\georg\Desktop\manga.txt

$testText = $text -replace '\s',''
$testContent = "$mangafiletext" -replace '\s',''
#Write-Output $testText
#Write-Output $testContent

if ( $counter -gt 0 -And $testText -ne $testContent) { #-And "$mangafiletext" -ne "$text" ) {
    Get-Content C:\Users\georg\Desktop\manga.txt | Out-File -FilePath C:\Users\georg\Desktop\manga2.txt
    Write-Output $text | Out-File -FilePath C:\Users\georg\Desktop\manga.txt
    #Add-Content -Path C:\Users\georg\Desktop\manga.txt -Exclude help* -Value $(Get-Date)
    Add-Type -AssemblyName System.Windows.Forms
    $global:balloon = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
    $balloon.BalloonTipText = "New Manga"
    $balloon.BalloonTipTitle = "New Manga Update"
    $balloon.Visible = $true
    $balloon.ShowBalloonTip(10000)
}

#get-content C:\Users\georg\Desktop\manga.txt
