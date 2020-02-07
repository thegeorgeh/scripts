$mangasite = "https://mangakakalot.com/", "https://m.fanfox.net"
$manga = "Solo Leveling", "White Blood", "Martial Peak"

$text = ""

for ( $i = 0; $i -le $mangasite.length - 1; $i++ ) {
    #Write-Output $mangasite[$i]
    $text += $mangasite + "`r`n"  
    $sitecontent = Invoke-RestMethod $mangasite[$i]
    for ( $j = 0; $j -le $manga.length; $j++ ) {
    if ( $sitecontent -Match $manga[$j] ) {
   #Write-Output $manga[$j]
   $text += $manga[$j] + "`r`n"
}
    }
   $text += "`r`n"
   #Write-Output ''
}

#Write-Output $text

Add-Type -AssemblyName System.Windows.Forms
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balloon.BalloonTipText = $text
$balloon.BalloonTipTitle = Manga Update
$balloon.Visible = $true
$balloon.ShowBalloonTip(10000)
