function Set-TemplateConfiguration {
    <#
    .SYNOPSIS
    Sets configuration values for the template module.

    .DESCRIPTION
    This function demonstrates how to handle configuration settings
    in a PowerShell module using private helper functions.

    .PARAMETER ConfigName
    The name of the configuration setting.

    .PARAMETER ConfigValue
    The value to set for the configuration.

    .EXAMPLE
    Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "https://api.example.com"

    Sets the ApiUrl configuration to the specified value.

    .OUTPUTS
    PSCustomObject

    .NOTES
    This function uses a private helper function to validate configurations.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ConfigName,

        [Parameter(Mandatory = $true)]
        [string]$ConfigValue
    )

    begin {
        Write-Verbose "Starting Set-TemplateConfiguration"
    }

    process {
        if ($PSCmdlet.ShouldProcess("Configuration '$ConfigName'", "Set Value")) {
            # Use private function to validate configuration
            if (Test-ConfigurationValue -Name $ConfigName -Value $ConfigValue) {
                $config = [PSCustomObject]@{
                    Name = $ConfigName
                    Value = $ConfigValue
                    Timestamp = Get-Date
                }

                Write-Verbose "Configuration set: $ConfigName = $ConfigValue"
                return $config
            }
            else {
                throw "Invalid configuration: $ConfigName"
            }
        }
    }

    end {
        Write-Verbose "Completed Set-TemplateConfiguration"
    }
}