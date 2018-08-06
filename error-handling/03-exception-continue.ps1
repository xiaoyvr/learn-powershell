


Function ThrowError {
    throw 'bla'
}
ThrowError
Write-Host "here you are. "


# Write-Host $ErrorActionPreference
# $ErrorActionPreference = 'SilentlyContinue'
# $ErrorActionPreference = 'Continue'
# $ErrorActionPreference = 'Stop'

# Exception will be throw unless SilentlyContinue
# Wrong name will still go if it's Continue - which is so werid


