# Step 1: 找到这段代码的问题
Function Config ($dir) {
    @{
        "Type" = "web";
        "Config" = "$dir/web.config"
        "Deploy" = { 
            write-host "deploy to $dir. "
        }
    }
}

$obj = Config "c:\working-dir"
Write-Host $obj.Config
& $obj.Deploy 

# Step2: 使用 closure 消除两次传递 $dir
