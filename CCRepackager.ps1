#region Variables
$fileRepackName = "LITR_CC_Compilation.ba2"
$dirModlist = [IO.Path]::GetFullPath((Get-Location))
$dirWorkingFiles = [IO.Path]::GetFullPath("$dirModlist\WorkingFiles")
$dirFallout4Folder = (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Bethesda Softworks\Fallout4" -ErrorAction SilentlyContinue)."installed path"
$dirFallout4DataFolder = [IO.Path]::GetFullPath("$dirFallout4Folder\Data")
$toolArchive2 = "$dirFallout4Folder\Tools\Archive2\Archive2.exe"
#endregion Variables

#region check for CC archives
$CC_Fallout4 = @(
  "ccbgsfo4091-as_bats - main.ba2"
  "ccbgsfo4091-as_bats - textures.ba2"
  "ccbgsfo4091-as_bats.esl"
  "ccbgsfo4092-as_camoblue - main.ba2"
  "ccbgsfo4092-as_camoblue - textures.ba2"
  "ccbgsfo4092-as_camoblue.esl"
  "ccbgsfo4093-as_camogreen - main.ba2"
  "ccbgsfo4093-as_camogreen - textures.ba2"
  "ccbgsfo4093-as_camogreen.esl"
  "ccbgsfo4094-as_camotan - main.ba2"
  "ccbgsfo4094-as_camotan - textures.ba2"
  "ccbgsfo4094-as_camotan.esl"
  "ccbgsfo4095-as_childrenofatom - main.ba2"
  "ccbgsfo4095-as_childrenofatom - textures.ba2"
  "ccbgsfo4095-as_childrenofatom.esl"
  "ccbgsfo4096-as_enclave - main.ba2"
  "ccbgsfo4096-as_enclave - textures.ba2"
  "ccbgsfo4096-as_enclave.esl"
  "ccbgsfo4097-as_jack-olantern - main.ba2"
  "ccbgsfo4097-as_jack-olantern - textures.ba2"
  "ccbgsfo4097-as_jack-olantern.esl"
  "ccbgsfo4098-as_pickman - main.ba2"
  "ccbgsfo4098-as_pickman - textures.ba2"
  "ccbgsfo4098-as_pickman.esl"
  "ccbgsfo4099-as_reillysrangers - main.ba2"
  "ccbgsfo4099-as_reillysrangers - textures.ba2"
  "ccbgsfo4099-as_reillysrangers.esl"
  "ccbgsfo4101-as_shi - main.ba2"
  "ccbgsfo4101-as_shi - textures.ba2"
  "ccbgsfo4101-as_shi.esl"
  "ccbgsfo4103-as_tunnelsnakes - main.ba2"
  "ccbgsfo4103-as_tunnelsnakes - textures.ba2"
  "ccbgsfo4103-as_tunnelsnakes.esl"
  "ccbgsfo4104-ws_bats - main.ba2"
  "ccbgsfo4104-ws_bats - textures.ba2"
  "ccbgsfo4104-ws_bats.esl"
  "ccbgsfo4105-ws_camoblue - main.ba2"
  "ccbgsfo4105-ws_camoblue - textures.ba2"
  "ccbgsfo4105-ws_camoblue.esl"
  "ccbgsfo4106-ws_camogreen - main.ba2"
  "ccbgsfo4106-ws_camogreen - textures.ba2"
  "ccbgsfo4106-ws_camogreen.esl"
  "ccbgsfo4107-ws_camotan - main.ba2"
  "ccbgsfo4107-ws_camotan - textures.ba2"
  "ccbgsfo4107-ws_camotan.esl"
  "ccbgsfo4108-ws_childrenofatom - main.ba2"
  "ccbgsfo4108-ws_childrenofatom - textures.ba2"
  "ccbgsfo4108-ws_childrenofatom.esl"
  "ccbgsfo4110-ws_enclave - main.ba2"
  "ccbgsfo4110-ws_enclave - textures.ba2"
  "ccbgsfo4110-ws_enclave.esl"
  "ccbgsfo4111-ws_jack-olantern - main.ba2"
  "ccbgsfo4111-ws_jack-olantern - textures.ba2"
  "ccbgsfo4111-ws_jack-olantern.esl"
  "ccbgsfo4112-ws_pickman - main.ba2"
  "ccbgsfo4112-ws_pickman - textures.ba2"
  "ccbgsfo4112-ws_pickman.esl"
  "ccbgsfo4113-ws_reillysrangers - main.ba2"
  "ccbgsfo4113-ws_reillysrangers - textures.ba2"
  "ccbgsfo4113-ws_reillysrangers.esl"
  "ccbgsfo4114-ws_shi - main.ba2"
  "ccbgsfo4114-ws_shi - textures.ba2"
  "ccbgsfo4114-ws_shi.esl"
  "ccbgsfo4118-ws_tunnelsnakes - main.ba2"
  "ccbgsfo4118-ws_tunnelsnakes - textures.ba2"
  "ccbgsfo4118-ws_tunnelsnakes.esl"
  "ccgcafo4001-factionws01army - main.ba2"
  "ccgcafo4001-factionws01army - textures.ba2"
  "ccgcafo4001-factionws01army.esl"
  "ccgcafo4002-factionws02acat - main.ba2"
  "ccgcafo4002-factionws02acat - textures.ba2"
  "ccgcafo4002-factionws02acat.esl"
  "ccgcafo4003-factionws03bos - main.ba2"
  "ccgcafo4003-factionws03bos - textures.ba2"
  "ccgcafo4003-factionws03bos.esl"
  "ccgcafo4004-factionws04gun - main.ba2"
  "ccgcafo4004-factionws04gun - textures.ba2"
  "ccgcafo4004-factionws04gun.esl"
  "ccgcafo4005-factionws05hrpink - main.ba2"
  "ccgcafo4005-factionws05hrpink - textures.ba2"
  "ccgcafo4005-factionws05hrpink.esl"
  "ccgcafo4006-factionws06hrshark - main.ba2"
  "ccgcafo4006-factionws06hrshark - textures.ba2"
  "ccgcafo4006-factionws06hrshark.esl"
  "ccgcafo4007-factionws07hrflames - main.ba2"
  "ccgcafo4007-factionws07hrflames - textures.ba2"
  "ccgcafo4007-factionws07hrflames.esl"
  "ccgcafo4008-factionws08inst - main.ba2"
  "ccgcafo4008-factionws08inst - textures.ba2"
  "ccgcafo4008-factionws08inst.esl"
  "ccgcafo4009-factionws09mm - main.ba2"
  "ccgcafo4009-factionws09mm - textures.ba2"
  "ccgcafo4009-factionws09mm.esl"
  "ccgcafo4010-factionws10rr - main.ba2"
  "ccgcafo4010-factionws10rr - textures.ba2"
  "ccgcafo4010-factionws10rr.esl"
  "ccgcafo4011-factionws11vt - main.ba2"
  "ccgcafo4011-factionws11vt - textures.ba2"
  "ccgcafo4011-factionws11vt.esl"
  "ccgcafo4012-factionas01acat - main.ba2"
  "ccgcafo4012-factionas01acat - textures.ba2"
  "ccgcafo4012-factionas01acat.esl"
  "ccgcafo4013-factionas02bos - main.ba2"
  "ccgcafo4013-factionas02bos - textures.ba2"
  "ccgcafo4013-factionas02bos.esl"
  "ccgcafo4014-factionas03gun - main.ba2"
  "ccgcafo4014-factionas03gun - textures.ba2"
  "ccgcafo4014-factionas03gun.esl"
  "ccgcafo4015-factionas04hrpink - main.ba2"
  "ccgcafo4015-factionas04hrpink - textures.ba2"
  "ccgcafo4015-factionas04hrpink.esl"
  "ccgcafo4016-factionas05hrshark - main.ba2"
  "ccgcafo4016-factionas05hrshark - textures.ba2"
  "ccgcafo4016-factionas05hrshark.esl"
  "ccgcafo4017-factionas06inst - main.ba2"
  "ccgcafo4017-factionas06inst - textures.ba2"
  "ccgcafo4017-factionas06inst.esl"
  "ccgcafo4018-factionas07mm - main.ba2"
  "ccgcafo4018-factionas07mm - textures.ba2"
  "ccgcafo4018-factionas07mm.esl"
  "ccgcafo4019-factionas08nuk - main.ba2"
  "ccgcafo4019-factionas08nuk - textures.ba2"
  "ccgcafo4019-factionas08nuk.esl"
  "ccgcafo4020-factionas09rr - main.ba2"
  "ccgcafo4020-factionas09rr - textures.ba2"
  "ccgcafo4020-factionas09rr.esl"
  "ccgcafo4021-factionas10hrflames - main.ba2"
  "ccgcafo4021-factionas10hrflames - textures.ba2"
  "ccgcafo4021-factionas10hrflames.esl"
  "ccgcafo4022-factionas11vt - main.ba2"
  "ccgcafo4022-factionas11vt - textures.ba2"
  "ccgcafo4022-factionas11vt.esl"
  "ccgcafo4023-factionas12army - main.ba2"
  "ccgcafo4023-factionas12army - textures.ba2"
  "ccgcafo4023-factionas12army.esl"
)

$CC_Installed = Get-ChildItem -Path $dirFallout4DataFolder -Filter "cc*" | Select-Object -ExpandProperty Name
$CC_Comparison = Compare-Object -ReferenceObject $CC_Installed -DifferenceObject $CC_Fallout4 -IncludeEqual
If ($CC_Comparison | Where-Object { $_.SideIndicator -eq "=>" } | Select-Object -ExpandProperty InputObject) {
  Write-Host ("You're missing the following CC;")
  foreach ($CC_Missing in $CC_Comparison) {
    if ($CC_Missing.SideIndicator -eq "=>") {
      Write-Host $CC_Missing.InputObject
    }
  }
  Write-Error "Please install the necessary Creation Club content." -Category NotInstalled; Exit
}
#endregion check for CC archives

#region Unpack CC archives
Foreach ($CC in $CC_Fallout4) {
  If ($CC -notlike "*.ba2") {
    $CC_Fallout4.Remove($CC)
  }
}
Foreach ($index = 0; $index -lt $ba2Filenames.Count; $index++) {
  try {
    New-Item $dirWorkingFiles -ItemType "directory" -ErrorAction Stop | Out-Null
    Write-Host "Extracting original archive..."
    Write-Host ("`"$toolArchive2`" `"$originalBa2File`" -extract=`"$($dir.workingFiles)`"")
    $stdout, $stderr = (& "$toolArchive2" "$originalBa2File" -extract="$($dir.workingFiles)" 2>&1).
    Where({ $_ -is [string] -and $_ -ne "" }, "Split")
    Write-Host ("STDOUT:", $stdout, "", "STDERR:", $stderr, "", "$("-" * $LineWidth)", "")
    if ($LASTEXITCODE -ne 0) {
      throw "Extracting `"$originalBa2File`" failed."
    }
    $stdout, $stderr = $null
  } catch {
    if ($null -ne $stderr) {
      Write-Host $stderr
      $stdout, $stderr = $null
    }
  }
}
#endregion Unpack CC archives

#region Repack CC files
Write-Host ("`"$toolArchive2`" `"$($dir.workingFiles)`" -format=`"DDS`" -create=`"$RepackFileName`" -root=`"$(Resolve-Path $dir.workingFiles)`"")
$stdout, $stderr = (& "$toolArchive2" "$($dir.workingFiles)" -format="DDS" -create="$RepackFileName" -root="$(Resolve-Path $dir.workingFiles)" 2>&1).
Where({ $_ -is [string] -and $_ -ne "" }, "Split")
if ($LASTEXITCODE -ne 0) {
  throw "Creating `"$RepackFileName`" failed."
}
$stdout, $stderr = $null
if (Test-Path -LiteralPath $dir.workingFiles) {
  Remove-Item -LiteralPath $dir.workingFiles -Recurse -Force
}
#endregion Repack CC files
