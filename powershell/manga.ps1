$mangasite = "https://mangakakalot.com/", "https://m.fanfox.net" #, "https://www.mangareader.net"
$manga =   "After Being Reborn, I Became the Strongest to Save Everyone", "Class ga Isekai Shoukan sareta Naka Ore dake Nokotta n desu ga", "Cultivation through science", "Different World Slow Life Begun at the Smith", 
"Dosanko Gyaru Is Mega Cutei", "Hahazuka-san o xx ni Shitai.", "Himegasaki Sakurako wa Kyou mo Fubin Kawaii!", "Hishou! Heibon Mazoku no Eiyuu Life", "Mato Seihei no Slave", "My Dad Is Too Strong", "Noah's Notes", "One Piece", 
"Ranker Who Lives A Second Time", "Release That Witch", "Re:Monster", "Rettou Hito no Maken Tsukai Sukiruboudo o Kushi Shite Saikyou ni Itaru", "Second Life Ranker", "Shingan no Yuusha", "Solo Leveling", "Tales of Demons and Gods", 
"Tensei Shitara Dragon no Tamago Datta", "The Beginning After the End", "The New Gate", "The Other World's Wizard Does Not Chant", "Tsui no Taimashi"

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
