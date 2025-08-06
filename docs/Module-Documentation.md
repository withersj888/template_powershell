# TemplateModule Documentation

## Overview

TemplateModule is a template PowerShell module that demonstrates best practices for PowerShell module development, including proper function structure, help documentation, testing, and CI/CD integration.

## Functions

### Get-TemplateFunction

Generates a greeting message with customizable greeting types.

**Syntax:**
```powershell
Get-TemplateFunction [-Name] <String> [[-Greeting] <String>] [<CommonParameters>]
```

**Parameters:**
- **Name** (Required): The name to include in the greeting
- **Greeting** (Optional): The type of greeting (Hello, Hi, Hey). Default: "Hello"

**Examples:**
```powershell
Get-TemplateFunction -Name "World"
Get-TemplateFunction -Name "PowerShell" -Greeting "Hi"
```

### Set-TemplateConfiguration

Sets configuration values with validation.

**Syntax:**
```powershell
Set-TemplateConfiguration [-ConfigName] <String> [-ConfigValue] <String> [<CommonParameters>]
```

**Parameters:**
- **ConfigName** (Required): The name of the configuration setting
- **ConfigValue** (Required): The value to set

**Examples:**
```powershell
Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "https://api.example.com"
Set-TemplateConfiguration -ConfigName "Port" -ConfigValue "8080"
```

**Validation Rules:**
- **ApiUrl**: Must start with http:// or https://
- **Port**: Must be a number between 1 and 65535
- **Other**: Basic null/empty validation

## Module Structure

### Public Functions
Located in `src/Public/`, these functions are exported and available to users:
- `Get-TemplateFunction`
- `Set-TemplateConfiguration`

### Private Functions
Located in `src/Private/`, these functions provide internal functionality:
- `Test-ConfigurationValue`

## Error Handling

All functions include proper error handling and validation:
- Parameter validation using `[Parameter()]` attributes
- Input validation using `[ValidateSet()]` and custom validation
- Comprehensive error messages
- Proper exception throwing for invalid inputs

## Verbose Output

All functions support the `-Verbose` common parameter for detailed operation logging.

## Testing

The module includes comprehensive Pester tests:
- Unit tests for each public function
- Integration tests for module loading
- Error condition testing
- Verbose output testing

## Best Practices Demonstrated

1. **Function Structure**: Proper use of `begin`, `process`, and `end` blocks
2. **Help Documentation**: Complete comment-based help with examples
3. **Parameter Validation**: Using PowerShell validation attributes
4. **Error Handling**: Proper exception handling and user-friendly errors
5. **Module Organization**: Clear separation of public and private functions
6. **Testing**: Comprehensive test coverage with Pester
7. **CI/CD**: Automated testing and deployment with GitHub Actions