# Contributing to PowerShell Module Template

Thank you for your interest in contributing to this PowerShell module template!

## Getting Started

1. Fork the repository
2. Clone your fork locally
3. Create a new branch for your feature or bug fix
4. Make your changes
5. Test your changes
6. Submit a pull request

## Development Setup

### Prerequisites

- PowerShell 5.1 or PowerShell 7+
- Pester module for testing
- PSScriptAnalyzer for code analysis

### Setting Up Your Environment

```powershell
# Clone the repository
git clone https://github.com/yourusername/template_powershell.git
cd template_powershell

# Import the module for testing
Import-Module ./src/TemplateModule.psm1 -Force

# Run tests
Invoke-Pester -Path ./tests

# Run code analysis
Invoke-ScriptAnalyzer -Path ./src -Recurse
```

## Code Standards

### PowerShell Best Practices

- Follow PowerShell naming conventions (Verb-Noun)
- Use approved PowerShell verbs (`Get-Verb` for list)
- Include comment-based help for all public functions
- Use proper parameter validation
- Handle errors appropriately
- Support common parameters where applicable

### Code Style

- Use 4 spaces for indentation
- Place opening braces on the same line
- Use PascalCase for function names and parameters
- Use camelCase for variables
- Remove trailing whitespace
- Include OutputType attributes

### Example Function Template

```powershell
function Get-ExampleFunction {
    <#
    .SYNOPSIS
    Brief description of the function.
    
    .DESCRIPTION
    Detailed description of what the function does.
    
    .PARAMETER InputObject
    Description of the parameter.
    
    .EXAMPLE
    Get-ExampleFunction -InputObject "test"
    
    Description of what this example does.
    
    .OUTPUTS
    System.String
    
    .NOTES
    Any additional notes about the function.
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputObject
    )
    
    begin {
        Write-Verbose "Starting $($MyInvocation.MyCommand)"
    }
    
    process {
        # Function logic here
        return $InputObject
    }
    
    end {
        Write-Verbose "Completed $($MyInvocation.MyCommand)"
    }
}
```

## Testing Guidelines

### Test Structure

- Create a test file for each public function: `FunctionName.Tests.ps1`
- Include integration tests in `ModuleName.Integration.Tests.ps1`
- Use descriptive test names that explain what is being tested
- Test both success and failure scenarios

### Test Example

```powershell
Describe "Get-ExampleFunction" {
    Context "When called with valid parameters" {
        It "Should return expected output" {
            $result = Get-ExampleFunction -InputObject "test"
            $result | Should -Be "test"
        }
    }
    
    Context "When called with invalid parameters" {
        It "Should throw for empty input" {
            { Get-ExampleFunction -InputObject "" } | Should -Throw
        }
    }
}
```

## Documentation

- Update README.md if adding new features
- Include examples in function help
- Update module documentation in `/docs`
- Add usage examples to `/examples`

## Pull Request Process

1. Ensure your code follows the style guidelines
2. Add or update tests for your changes
3. Ensure all tests pass
4. Run PSScriptAnalyzer and fix any issues
5. Update documentation as needed
6. Create a pull request with a clear description

### Pull Request Checklist

- [ ] Code follows style guidelines
- [ ] Tests added/updated and passing
- [ ] PSScriptAnalyzer passes without issues
- [ ] Documentation updated
- [ ] Examples provided if applicable
- [ ] Module manifest updated if needed

## Reporting Issues

When reporting issues, please include:

- PowerShell version (`$PSVersionTable`)
- Operating system
- Detailed description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Any error messages

## Questions?

If you have questions about contributing, please open an issue for discussion.