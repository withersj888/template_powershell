function Get-TemplateFunction {
    <#
    .SYNOPSIS
    A template function that demonstrates basic PowerShell function structure.

    .DESCRIPTION
    This is an example function that shows how to structure PowerShell functions
    with proper help documentation, parameters, and output.

    .PARAMETER Name
    The name to use in the greeting message.

    .PARAMETER Greeting
    The type of greeting to use. Valid values are Hello, Hi, Hey.

    .EXAMPLE
    Get-TemplateFunction -Name "World"

    Returns: "Hello, World!"

    .EXAMPLE
    Get-TemplateFunction -Name "PowerShell" -Greeting "Hi"

    Returns: "Hi, PowerShell!"

    .OUTPUTS
    String

    .NOTES
    This is a template function for demonstration purposes.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $false)]
        [ValidateSet("Hello", "Hi", "Hey")]
        [string]$Greeting = "Hello"
    )

    begin {
        Write-Verbose "Starting Get-TemplateFunction"
    }

    process {
        $message = "$Greeting, $Name!"
        Write-Verbose "Generated message: $message"
        return $message
    }

    end {
        Write-Verbose "Completed Get-TemplateFunction"
    }
}