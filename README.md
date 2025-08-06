# PowerShell Module Template

[![CI/CD](https://github.com/withersj888/template_powershell/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/withersj888/template_powershell/actions/workflows/ci-cd.yml)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/TemplateModule.svg)](https://www.powershellgallery.com/packages/TemplateModule)

A comprehensive PowerShell module template that provides a complete foundation for creating professional PowerShell modules with modern DevOps practices.

## Features

- ✅ **Standard Module Structure**: Organized directory layout with Public/Private function separation
- ✅ **Automated Testing**: Pester test framework with comprehensive test examples
- ✅ **GitHub Actions CI/CD**: Multi-platform testing and automated publishing
- ✅ **Code Analysis**: PSScriptAnalyzer integration for code quality
- ✅ **Documentation**: Help documentation and examples
- ✅ **Cross-Platform**: Works on Windows, Linux, and macOS
- ✅ **PowerShell Gallery Ready**: Configured for easy publishing

## Quick Start

### Using this Template

1. Click "Use this template" button on GitHub
2. Clone your new repository
3. Update the module files with your functionality:
   - Rename `TemplateModule.*` files to your module name
   - Update the module manifest (`.psd1`) with your module details
   - Replace example functions with your own
   - Update tests to match your functions
   - Update this README

### Directory Structure

```
template_powershell/
├── .github/workflows/     # GitHub Actions workflows
├── src/                   # Module source code
│   ├── Public/           # Public functions (exported)
│   ├── Private/          # Private functions (internal)
│   ├── TemplateModule.psm1  # Main module file
│   └── TemplateModule.psd1  # Module manifest
├── tests/                # Pester tests
├── docs/                 # Documentation
├── examples/             # Usage examples
└── README.md            # This file
```

## Installation

### From PowerShell Gallery

```powershell
Install-Module -Name TemplateModule
```

### From Source

```powershell
git clone https://github.com/withersj888/template_powershell.git
Import-Module ./template_powershell/src/TemplateModule.psm1
```

## Usage

### Example Functions

```powershell
# Import the module
Import-Module TemplateModule

# Use the example greeting function
Get-TemplateFunction -Name "World"
# Output: Hello, World!

Get-TemplateFunction -Name "PowerShell" -Greeting "Hi"
# Output: Hi, PowerShell!

# Use the configuration function
Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "https://api.example.com"
```

## Development

### Prerequisites

- PowerShell 5.1 or PowerShell 7+
- Pester module for testing
- PSScriptAnalyzer for code analysis

### Running Tests

```powershell
# Install required modules
Install-Module -Name Pester, PSScriptAnalyzer -Force

# Run tests
Invoke-Pester -Path ./tests

# Run code analysis
Invoke-ScriptAnalyzer -Path ./src -Recurse
```

### Building the Module

The GitHub Actions workflow automatically builds and tests the module on multiple platforms. For local development:

```powershell
# Test the module manifest
Test-ModuleManifest -Path ./src/TemplateModule.psd1

# Import the module for testing
Import-Module ./src/TemplateModule.psm1 -Force
```

## Customization Guide

### 1. Module Naming

Replace all instances of `TemplateModule` with your module name:
- `src/TemplateModule.psm1` → `src/YourModule.psm1`
- `src/TemplateModule.psd1` → `src/YourModule.psd1`
- Update `RootModule` in the manifest
- Update references in tests

### 2. Module Manifest

Edit `src/YourModule.psd1`:
- Update `Author`, `CompanyName`, `Description`
- Change `GUID` to a new unique GUID
- Update `FunctionsToExport` with your function names
- Update URLs and tags

### 3. Functions

- Add your functions to `src/Public/` (these will be exported)
- Add helper functions to `src/Private/` (these remain internal)
- Follow the existing pattern with proper help documentation

### 4. Tests

- Create test files matching your function names
- Follow the pattern: `FunctionName.Tests.ps1`
- Include unit tests, integration tests, and edge cases

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## GitHub Actions Setup

The template includes a complete CI/CD pipeline that:

1. **Tests** the module on Windows, Linux, and macOS
2. **Analyzes** code with PSScriptAnalyzer
3. **Builds** the module artifact
4. **Publishes** to PowerShell Gallery on releases

### Secrets Configuration

To enable PowerShell Gallery publishing, add this secret to your repository:
- `POWERSHELL_GALLERY_API_KEY`: Your PowerShell Gallery API key

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- PowerShell team for the excellent tooling
- Pester team for the testing framework
- Community contributors and best practices