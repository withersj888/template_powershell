@{
    # Module manifest for TemplateModule
    RootModule = 'TemplateModule.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a1b2c3d4-e5f6-7890-ab12-cd34ef567890'
    Author = 'Your Name'
    CompanyName = 'Your Company'
    Copyright = '(c) 2024. All rights reserved.'
    Description = 'A template PowerShell module for creating new modules'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TemplateFunction', 'Set-TemplateConfiguration')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    FileList = @('TemplateModule.psm1', 'TemplateModule.psd1')
    PrivateData = @{
        PSData = @{
            Tags = @('Template', 'Module', 'PowerShell')
            LicenseUri = 'https://github.com/withersj888/template_powershell/blob/main/LICENSE'
            ProjectUri = 'https://github.com/withersj888/template_powershell'
            ReleaseNotes = 'Initial release of PowerShell module template'
        }
    }
    HelpInfoURI = 'https://github.com/withersj888/template_powershell'
    DefaultCommandPrefix = ''
}