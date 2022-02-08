<#	
	.DESCRIPTION
		Script to fix "unable to delete piece" error message in the log
#>

Write-Host "`t###############################################################" -ForegroundColor Cyan
Write-Host "`t     Script to stop `"unable to delete piece`" error message "
Write-Host "`t###############################################################" -ForegroundColor Cyan

Write-Host "Enter Storj path containing `"Storage`" folder : " -ForegroundColor Magenta -NoNewline
$storjPath = Read-Host 

$satIDHT = @{
	"12EayRS2V1kEsWESU9QMRseFhdxYxKicsiFmxrsLZHeLUtdps3S" = "ukfu6bhbboxilvt7jrwlqk7y2tapb5d2r2tsmj2sjxvw5qaaaaaa"
	"12L9ZFwhzVpuEKMUNUqkaTLGzwY9G24tbiigLiXpmZWKwmcNDDs" = "v4weeab67sbgvnbwd5z7tweqsqqun7qox2agpbxy44mqqaaaaaaa"
	"121RTSDpyNZVcEU84Ticf2L1ntiuUimbWgfATz21tuvgk3vzoA6" = "qstuylguhrn2ozjv4h2c6xpxykd622gtgurhql2k7k75wqaaaaaa"
	"1wFTAgs9DP5RSnCqKV1eLf6N9wtk4EAtmN5DpSxcs8EjT69tGE"  = "pmw6tvzmf2jv6giyybmmvl4o2ahqlaldsaeha4yx74n5aaaaaaaa"
	"12rfG3sh9NCWiX3ivPjq2HtdLmbqCrvHVEzJubnzFzosMuawymB" = "6r2fgwqz3manwt4aogq343bfkh2n5vvg4ohqqgggrrunaaaaaaaa"
	"12tRQrMTWUWwzwGh18i7Fqs67kmdhH9t6aToeiwbo5mfS2rUmo"  = "arej6usf33ki2kukzd5v6xgry2tdr56g45pp3aao6llsaaaaaaaa"
	"118UWpMCHzs6CvSgWd9BfFVjw5K9pZbJjkfZJexMtSkmKxvvAW"  = "abforhuxbzyd35blusvrifvdwmfx4hmocsva4vmpp3rgqaaaaaaa"
}

do{
	Write-Host "`tEnter Satellite ID or q to quit : " -ForegroundColor Magenta -NoNewline
	$satID = Read-Host 
	if ($satID -eq "q")	{
		Write-Host "`n`tNerdAtWork thanks you for using the script." -ForegroundColor Green
		pause
		break
	}
	
	$satFolder = $satIDHT[$satID]
	
	$path = $storjPath + "\storage\blobs\" + $satFolder
	# Get inside Satellite Folder
	Set-Location -Path $path 
	do{
		Write-Host "`t`tEnter Piece ID or q to quit : " -ForegroundColor Yellow -NoNewline
		$pieceID = Read-Host 
		if ($pieceID -eq 'q'){
			# Setting path to main folder to traverse for new Satellite ID
			Set-Location -Path $storjPath
			break
		}
		$pieceFolder = $pieceID.Substring(0, 2)
		# Get inside piece folder to create file
		Set-Location -Path ($path + "\" + $pieceFolder) 
		
		$fileName = $pieceID.Substring(2, $pieceID.Length - 2) + ".sj1"
		# Create file & suppress creation details
		if (New-Item  $fileName){		
			Write-Host "`t`tFile was successfully created!" -ForegroundColor Green
		}
	}
	while ($true)
}
while ($true)
