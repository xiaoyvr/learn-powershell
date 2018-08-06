
# with return 
Function DoDeploy1($packageId) {
    echo 'start'
    echo "deploying $packageId"
    echo 'end'
}

# with output
Function DoDeploy2($packageId) {
    Write-Host 'start'
    Write-Host "deploying $packageId"
    Write-Host 'end'
}


$x = DoDeploy0 "abc"

Write-Host $x
