Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"
    
    .PARAMETER Phrase
    The phrase to get the acronym from.
    
    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )

    $pattern = '(^[A-Z])|(\s|-|_)([A-Za-z])'
    $result = ''
    $matches = [regex]::Matches($Phrase, $pattern)

    foreach ($match in $matches) {
        if ($match.Groups[1].Success) {
            $result += $match.Groups[1].Value
        } elseif ($match.Groups[3].Success) {
            $result += $match.Groups[3].Value
        }
    }

    $result = $result.ToUpper()
    return $result
}
