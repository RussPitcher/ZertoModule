﻿$ModuleVersion = '1.0.8' 
$ReleaseNotes = 'Fixed a typo in the ZertoVPGSettingsBootGroup code.'
 
New-ModuleManifest  -Path .\ZertoModule\ZertoModule.psd1 `
                -Guid "a7c23e30-0879-42f4-9e1c-bffbe723b02b" `
                -ModuleVersion $ModuleVersion `
                -Author 'Christopher Lewis' `
                -CompanyName 'Christopher Lewis' `
                -Description 'Zerto REST API Powershell Wrapping module' `
                -RootModule 'ZertoModule.psm1' `
                -FileList 'ZertoModule.psm1-help.xml' `
                -FunctionsToExport '*'  `
                -PowerShellVersion 5.0 `
                -VariablesToExport '*' `
                -ProjectUri https://github.com/ChristopherGLewis/ZertoModule `
                -LicenseUri  https://github.com/ChristopherGLewis/ZertoModule/blob/master/LICENSE `
                -Tags 'PSModule','Zerto'  `
                -ReleaseNotes $ReleaseNotes
        #        -ScriptsToProcess @('ZertoModule.psm1') `

$PrivateFunctions = @('Set-SSLCertByPass', 'Get-QueryStringFromHashTable', 'Parse-ZertoDate', `
                      'Test-RESTError', 'Convert-ZertoTokenHash', 'Get-EnvZertoServer', `
                      'Get-EnvZertoPort', 'Get-EnvZertoToken', 'StringOrNull' )

$Functions = @( ( Get-Content .\ZertoModule\ZertoModule.psm1 | ForEach-Object {$_.trim()} | `
                        Where-Object { $_ -imatch "^Function *" } | Sort-Object | ForEach-Object {  ($_ -split "\s",3)[1] } | `
                                Where-Object {$_ -notin $PrivateFunctions} ) )

Update-ModuleManifest  .\ZertoModule\ZertoModule.psd1 -FunctionsToExport $Functions