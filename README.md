# The Practice of Writing Powershell

## why bother? 

Ask audience about why first. 

The key point is, it is always a good thing to learn. I have been learn VB6 at the beginning of my career. It's not about what kind of language you learn. it is about the process of mastery. It means you know what you can/cannot do. Truly understand the pros and cons of the language/tool. You will gain insights during the mastery process. These insights tends to be more generic knowledge which is also highly transferable. To achieve mastery faster, you need to use it solving challenging problems. 

Spend time master things you're currently using, is the best way to learn. 


## The Born of NScaffold
It's just a refactor, for micro-services codebase. 

Everyone is writing smelly Powershell, everyone has there own idea of how to write powershell. End up badly. Powershell is not that easy to write and most importantly, there's no package management. 
So we started with a HG repository, put all scripts there. It might solved the problem of share code, but it didn't solve the problem of bad code. So the refactor begins. 

All my powershell knowledge were learned from there. Which is also today's topic, **How to write maintainable powershell**. 

## Be careful of the hidden return of function

This is from return the right deployment information from the deployment script. 

Example: [hidden-return.ps1](./hidden-return.ps1)

* Prevent `accidentally return` by local variable or `out-default`
* Deal with the output of an `exe` e.g. `xunit.runner.exe`

### Exercise
* Write a function output a parameter $msg, return the length of this $msg.
* Write a function return the output of an `exe`

## Handling error

The `nuget.exe` .....

Mix of script capability and language cause the confusion of error handling. 

Example: [check-error.ps1](./check-error.ps1)

* `$LASTEXITCODE` only used by `exe`, not powershell itself, (unless you use `exit 1`)
* `$?` is a unified way for last error. 
* Default the `$ErrorActionPreference` to `Stop` at the beginning of your script. 

### Exercise
* write a `exec` function, if there's an `exe` error, make it stop. 

## About scope

So many $workingDir, which one is mine? `$workingDir =  ...` is all over the place. 

* Why you should not use it
    Scope/environment variables is common for a script language. But when your script is becoming to more and more complex, this feature is also becoming to a problem. This is one of the reason why script is always hard to understand. Reusable function should take no assumption for it's execution. 

Example: [./scope/scope.ps1](./scope/scope.ps1)

### Exercise
> 在这里解释 PSake 的机制，其实就是 ScriptBlock

Implement `Properties` and `Task`. Make the output as `1`. 
```ps
$x = 2
Properties { $x = 1 }
Task { write-host $x }
```

## Organize your code

> 在这里解释 `.`, `&`, `iex`

* 尽量少用 `iex`，多用 `&`
* 别用 `.` 污染命名空间
* 为什么函数要放在独立的文件里？而不是和变量混着放？因为只有用 `.` 才能引入函数，然而 `.` 会污染命名空间

> 问问题，你要如何组织你的代码？
关键点：
* 函数尽量都放在一个目录下，一个命令可以全加载进来。
* 一个函数一个文件，便于查找，千万别混合写变量在函数文件里
* Script 文件尽量少用，最好是只用作入口点

## About closure
Many languages has closure, but why closure? Why use closure? What's the benefit of using closure? What if we don't use closure? 

If we make all our function truly pure, what will happen? Since in Powershell, functions is global. We have to pass all variables through parameters, also pass them through the call chain. How can we achieve encapsulation? How can we hide details? 

Closure gives us better encapsulation. 

Example: [closure/closure.ps1](closure/closure.ps1)

### Exercise
[closure/exercise.ps1](closure/exercise.ps1)

## The master stroke - OO
[New-NuGetTool](../PwCIAS/Platform-Integration-Tests/scripts/deploy-ops/New-NuGetTool.ps1)

### Exercise
Write a Folder module, take a directory, has function of `ls` and `newFile`, variable of $path

## The true master stroke - Test
[pester](https://github.com/pester/Pester)

Example: 
[Get-DeployNodes.Tests](https://gitlab.com/xiaoyvr/NScaffold/blob/master/test/scaffold/Get-DeployNodes.Tests.ps1)

### Exercise
Write test for your Folder module.

## Optional: Return array with one element


# Summary
You should separate "writing one-off script" and "writing maintainable script"
## Rules of Write Maintainable Script
* Avoid to use `iex`, use `&` as much as possible
* Use function full name, not alias
* Do not use `for` loop, use pipe!!!
* Do not use scope variables, make function pure
* Use Closure/PSObject/Module to encapsulate variables with it's behavior
* One file, one function/PSObject
* Use function/PSObject as much as possible, use script file as little as possible
* If you have to use script file, name it differently
* Test your script


--------------

# NScaffold
