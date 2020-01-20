# Bandcamp Script
[console]::WindowHeight=10;
$link = Read-Host "Paste Your Link Here"
(Invoke-WebRequest -Uri "$link").Content > mp3.txt
(Get-Content mp3.txt) > content.txt
$content = [System.IO.File]::ReadAllText("mp3.txt").Replace('{',"`r`n")
[System.IO.File]::WriteAllText("mp3.txt", $content)
$content = [System.IO.File]::ReadAllText("mp3.txt").Replace(',',"`r`n")
[System.IO.File]::WriteAllText("mp3.txt", $content)
$content = [System.IO.File]::ReadAllText("mp3.txt").Replace('"mp3-128":',"$null")
[System.IO.File]::WriteAllText("mp3.txt", $content)
$content = [System.IO.File]::ReadAllText("mp3.txt").Replace('"',"$null")
[System.IO.File]::WriteAllText("mp3.txt", $content)
Get-Content mp3.txt | Select-String -Pattern '^https://t4.bcbits.com/stream/' > streams.html
(Get-Content streams.html ) | Where-Object {$_.trim() -ne "" } | set-content streams.html
$content = [System.IO.File]::ReadAllText("streams.html").Replace('http','<p align="center"><audio controls src="http')
[System.IO.File]::WriteAllText("streams.html", $content)
$content = [System.IO.File]::ReadAllText("streams.html").Replace('}','"></audio></p>')
[System.IO.File]::WriteAllText("streams.html", $content)
Remove-Item mp3.txt
Get-Content content.txt | Select-String -Pattern '<a class="popupImage" ' > img.txt
$content = [System.IO.File]::ReadAllText("img.txt").Replace('"',"`r`n")
[System.IO.File]::WriteAllText("img.txt", $content)
Get-Content img.txt | Select-String -Pattern 'http' > image.txt
Remove-Item img.txt
Remove-Item content.txt
$content = [System.IO.File]::ReadAllText("image.txt").Replace('http','<p align="center"><img src="http')
[System.IO.File]::WriteAllText("image.txt", $content)
$content = [System.IO.File]::ReadAllText("image.txt").Replace('.jpg','.jpg" width="200" height="200"></p>')
[System.IO.File]::WriteAllText("image.txt", $content)
$file = (Get-Content image.txt)
Add-Content streams.html "$file"
Remove-Item image.txt
$background = '<body background="https://s3.amazonaws.com/spoonflower/public/design_thumbnails/0213/5268/ralienhead_shop_thumb.png"></body>'
Add-Content streams.html "$background"