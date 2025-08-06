BeforeAll {
    # Import the module being tested
    $ModulePath = Join-Path $PSScriptRoot ".." "src" "TemplateModule.psm1"
    Import-Module $ModulePath -Force
}

Describe "TemplateModule Integration Tests" {
    Context "Module Loading" {
        It "Should load the module without errors" {
            { Import-Module $ModulePath -Force } | Should -Not -Throw
        }
        
        It "Should export the expected public functions" {
            $exportedFunctions = Get-Command -Module TemplateModule
            $exportedFunctions.Name | Should -Contain "Get-TemplateFunction"
            $exportedFunctions.Name | Should -Contain "Set-TemplateConfiguration"
        }
        
        It "Should not export private functions" {
            $exportedFunctions = Get-Command -Module TemplateModule
            $exportedFunctions.Name | Should -Not -Contain "Test-ConfigurationValue"
        }
    }
    
    Context "Module Manifest" {
        It "Should have a valid module manifest" {
            $manifestPath = Join-Path $PSScriptRoot ".." "src" "TemplateModule.psd1"
            { Test-ModuleManifest -Path $manifestPath } | Should -Not -Throw
        }
        
        It "Should have correct exported functions in manifest" {
            $manifestPath = Join-Path $PSScriptRoot ".." "src" "TemplateModule.psd1"
            $manifest = Test-ModuleManifest -Path $manifestPath
            $manifest.ExportedFunctions.Keys | Should -Contain "Get-TemplateFunction"
            $manifest.ExportedFunctions.Keys | Should -Contain "Set-TemplateConfiguration"
        }
    }
    
    Context "Function Integration" {
        It "Should work when chaining functions" {
            $greeting = Get-TemplateFunction -Name "Configuration"
            $greeting | Should -Be "Hello, Configuration!"
            
            $config = Set-TemplateConfiguration -ConfigName "Greeting" -ConfigValue $greeting
            $config.Value | Should -Be "Hello, Configuration!"
        }
    }
}