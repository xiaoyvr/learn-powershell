
# $i = 2
# $scriptblock = { "Value of i is $i" }
# $i = 3
# & $scriptblock


# # Closure
# $i = 2
# $scriptblock = { "Value of i is $i" }.GetNewClosure()
# $i = 3
# & $scriptblock
# */


# # But
# Function VeryUseful {
#     write-host 'bla'
# }

# $i = 2
# $scriptblock = { 
#     VeryUseful
#     "Value of i is $i" 
# }.GetNewClosure()
# $i = 3
# & $scriptblock

# function is not the first class citizen in powershell
# you can wrap it use ScriptBlock, but you cannot do it for all user defined functions ...
