Function GetLatestFileInDir($dir)
{
	$mostRecent = $null
	
	foreach ($file in Get-ChildItem $dir)
	{
		if (Test-Path $file.FullName -PathType Container)
		{
			if ((Split-Path $file.FullName -leaf) -eq "App_Data")
			{
				continue
			}
        
			# Write-Host "Recursing into $($file.FullName)"
			$recursed = GetLatestFileInDir(Get-Item $file.FullName)
			if ($mostRecent -eq $null -or $recursed.LastWriteTimeUTC -gt $mostRecent.LastWriteTimeUTC)
			{
                # Write-Host "New latest file $($recursed.FullName) ($($recursed.LastWriteTimeUTC.ToString('f')))"
				$mostRecent = $recursed
			}
		}
		else
		{
			if ($mostRecent -eq $null -or $file.LastWriteTimeUTC -gt $mostRecent.LastWriteTimeUTC)
			{
                # Write-Host "New latest file $($file.FullName) ($($recursed.LastWriteTimeUTC.ToString('f')))"
				$mostRecent = $file
			}
		}
	}
	
	if ($mostRecent -eq $null)
	{
		return $null
	}
	
	return Get-Item $mostRecent.FullName
}

Function Main()
{
	$startDir = $pwd
	if ($args.Count -gt 0)
	{
		$startDir = Get-Item $args
	}
	
	$latest = GetLatestFileInDir($startDir)

	if ($latest -ne $null)
	{
		Write-Host "Most recent file is $($latest.FullName), updated $($latest.LastWriteTimeUTC.ToString('f'))"
	}
	else
	{
		Write-Host "Error: No file found"
	}
}

Main
