BeforeAll {
    # Import the module being tested
    $ModulePath = Join-Path $PSScriptRoot ".." "src" "TemplateModule.psm1"
    Import-Module $ModulePath -Force
}

Describe "Get-TemplateFunction" {
    Context "When called with valid parameters" {
        It "Should return a greeting with default greeting" {
            $result = Get-TemplateFunction -Name "World"
            $result | Should -Be "Hello, World!"
        }
        
        It "Should return a greeting with custom greeting" {
            $result = Get-TemplateFunction -Name "PowerShell" -Greeting "Hi"
            $result | Should -Be "Hi, PowerShell!"
        }
        
        It "Should accept Hey as a valid greeting" {
            $result = Get-TemplateFunction -Name "Test" -Greeting "Hey"
            $result | Should -Be "Hey, Test!"
        }
    }
    
    Context "When called with invalid parameters" {
        It "Should throw when Name is empty" {
            { Get-TemplateFunction -Name "" } | Should -Throw
        }
        
        It "Should throw when Greeting is invalid" {
            { Get-TemplateFunction -Name "Test" -Greeting "InvalidGreeting" } | Should -Throw
        }
    }
    
    Context "When called with verbose output" {
        It "Should write verbose messages when verbose is enabled" {
            $verboseOutput = Get-TemplateFunction -Name "Test" -Verbose 4>&1
            $verboseOutput | Should -Not -BeNullOrEmpty
        }
    }
}