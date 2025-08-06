function Test-ConfigurationValue {
    <#
    .SYNOPSIS
    Private helper function to validate configuration values.

    .DESCRIPTION
    This is an example of a private function that provides internal
    functionality to the module but is not exported for public use.

    .PARAMETER Name
    The configuration name to validate.

    .PARAMETER Value
    The configuration value to validate.

    .OUTPUTS
    Boolean

    .NOTES
    This is a private function and should not be called directly by users.
    #>
    [CmdletBinding()]
    [OutputType([bool])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Value
    )

    # Simple validation logic - in a real module this would be more sophisticated
    if ([string]::IsNullOrWhiteSpace($Name) -or [string]::IsNullOrWhiteSpace($Value)) {
        return $false
    }

    # Example validation rules
    switch ($Name) {
        "ApiUrl" {
            return $Value -match "^https?://"
        }
        "Port" {
            return $Value -match "^\d+$" -and [int]$Value -gt 0 -and [int]$Value -le 65535
        }
        default {
            return $true
        }
    }
}