. $PSScriptRoot/_Kaopscli.ps1

Function Invoke-Script {
    # Add your commands here test
    # ...
    git status
}

Start-Cli -Title 'Install JS APP' -Filename 'package.json' -AlternativePath '..' 