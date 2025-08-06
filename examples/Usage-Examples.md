# Example Usage

This directory contains examples of how to use the TemplateModule functions.

## Basic Usage

```powershell
# Import the module
Import-Module TemplateModule

# Example 1: Simple greeting
$greeting = Get-TemplateFunction -Name "PowerShell Community"
Write-Host $greeting
# Output: Hello, PowerShell Community!

# Example 2: Custom greeting
$customGreeting = Get-TemplateFunction -Name "Developer" -Greeting "Hey"
Write-Host $customGreeting
# Output: Hey, Developer!

# Example 3: Configuration management
$config = Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "https://api.github.com"
Write-Host "Configuration set: $($config.Name) = $($config.Value) at $($config.Timestamp)"

# Example 4: Port configuration with validation
try {
    $portConfig = Set-TemplateConfiguration -ConfigName "Port" -ConfigValue "8080"
    Write-Host "Valid port configuration: $($portConfig.Value)"
} catch {
    Write-Error "Failed to set port configuration: $_"
}
```

## Advanced Usage

```powershell
# Example 5: Using verbose output for debugging
Get-TemplateFunction -Name "Debug" -Verbose

# Example 6: Error handling
try {
    Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "invalid-url"
} catch {
    Write-Warning "Configuration validation failed: $_"
}

# Example 7: Batch processing
$names = @("Alice", "Bob", "Charlie")
$greetings = $names | ForEach-Object { Get-TemplateFunction -Name $_ -Greeting "Hi" }
$greetings | ForEach-Object { Write-Host $_ }
```

## Pipeline Usage

```powershell
# Example 8: Using functions in a pipeline
"World", "PowerShell", "Community" | 
    ForEach-Object { Get-TemplateFunction -Name $_ } |
    ForEach-Object { Write-Host $_ -ForegroundColor Green }
```