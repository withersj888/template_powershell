BeforeAll {
    # Import the module being tested
    $ModulePath = Join-Path $PSScriptRoot ".." "src" "TemplateModule.psm1"
    Import-Module $ModulePath -Force
}

Describe "Set-TemplateConfiguration" {
    Context "When called with valid configuration" {
        It "Should set a basic configuration" {
            $result = Set-TemplateConfiguration -ConfigName "TestConfig" -ConfigValue "TestValue"
            $result.Name | Should -Be "TestConfig"
            $result.Value | Should -Be "TestValue"
            $result.Timestamp | Should -BeOfType [DateTime]
        }
        
        It "Should validate ApiUrl configuration" {
            $result = Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "https://api.example.com"
            $result.Name | Should -Be "ApiUrl"
            $result.Value | Should -Be "https://api.example.com"
        }
        
        It "Should validate Port configuration" {
            $result = Set-TemplateConfiguration -ConfigName "Port" -ConfigValue "8080"
            $result.Name | Should -Be "Port"
            $result.Value | Should -Be "8080"
        }
    }
    
    Context "When called with invalid configuration" {
        It "Should throw for invalid ApiUrl" {
            { Set-TemplateConfiguration -ConfigName "ApiUrl" -ConfigValue "not-a-url" } | Should -Throw
        }
        
        It "Should throw for invalid Port" {
            { Set-TemplateConfiguration -ConfigName "Port" -ConfigValue "invalid-port" } | Should -Throw
        }
        
        It "Should throw for empty ConfigName" {
            { Set-TemplateConfiguration -ConfigName "" -ConfigValue "SomeValue" } | Should -Throw
        }
        
        It "Should throw for empty ConfigValue" {
            { Set-TemplateConfiguration -ConfigName "SomeName" -ConfigValue "" } | Should -Throw
        }
    }
    
    Context "When called with verbose output" {
        It "Should write verbose messages when verbose is enabled" {
            $verboseOutput = Set-TemplateConfiguration -ConfigName "Test" -ConfigValue "Value" -Verbose 4>&1
            $verboseOutput | Should -Not -BeNullOrEmpty
        }
    }
}