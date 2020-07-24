$mangasite = "https://mangakakalot.com/", "https://m.fanfox.net"
$manga = "6 Worlds of Cultivation", "I am the Sorcerer King", "Jishou! Heibon Mazoku no Eiyuu Life: B-Kyuu Mazoku Nano ni Cheat Dungeon wo Tsukutteshimatta Kekka", "Maougakuin no Futekigousha", "Martial Peak", "Mastery of Legendary Realms", "Onepunch-Man", "Release That Witch", "Shinka no Mi", "Solo Leveling", "Tensei Ouji wa Daraketai", "black clover"

$text = ""
#$counter = 0

for ( $i = 0; $i -le $mangasite.length - 1; $i++ ) {
    #Write-Output $mangasite[$i]
    $text += $mangasite[$i] + "`r`n"  
    $sitecontent = Invoke-RestMethod $mangasite[$i]
    for ( $j = 0; $j -le $manga.length; $j++ ) {
    	if ( $sitecontent -Match $manga[$j] ) {
   	     	#Write-Output $manga[$j]
   		$text += $manga[$j] + "`r`n"
		$counter++
	}
    }
    $text += "`r`n"
    #Write-Output ''
}

Write-Output $text
$counter-=2
Write-Output $counter
if ( $counter -mt 0 ) {
   Write-Output $text > C:\manga.txt
   Add-Type -AssemblyName System.Windows.Forms
   $global:balloon = New-Object System.Windows.Forms.NotifyIcon
   $path = (Get-Process -id $pid).Path
   $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
   $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
   $balloon.BalloonTipText = Watch New Manga About
   $balloon.BalloonTipTitle = Manga Update
   $balloon.Visible = $true
   $balloon.ShowBalloonTip(10000)
}