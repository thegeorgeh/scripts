$mangasite = "https://mangakakalot.com/", "https://m.fanfox.net"
$manga = "6 worlds of cultivation", "i am the sorcerer king", "jishou! heibon mazoku no eiyuu life: b-kyuu mazoku nano ni cheat dungeon wo tsukutteshimatta kekka", "maougakuin no futekigousha", "martial peak", "mastery of legendary realms", "onepunch-man", "release that witch", "shinka no mi", "Solo Leveling"

$text = ""
#$counter = 0

for ( $i = 0; $i -le $mangasite.length - 1; $i++ ) {
    #Write-Output $mangasite[$i]
    $text += $mangasite + "`r`n"  
    $sitecontent = Invoke-RestMethod $mangasite[$i]
    for ( $j = 0; $j -le $manga.length; $j++ ) {
    	if ( $sitecontent -Match $manga[$j] ) {
   	     	#Write-Output $manga[$j]
   		$text += $manga[$j] + "`r`n"
		#$counter++
	}
    }
    $text += "`r`n"
    #Write-Output ''
}

Write-Output $text

#if ( $counter -mt 0 ) {
#   Add-Type -AssemblyName System.Windows.Forms
#   $global:balloon = New-Object System.Windows.Forms.NotifyIcon
#   $path = (Get-Process -id $pid).Path
#   $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
#   $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
#   $balloon.BalloonTipText = $text
#   $balloon.BalloonTipTitle = Manga Update
#   $balloon.Visible = $true
#   $balloon.ShowBalloonTip(10000)
#}