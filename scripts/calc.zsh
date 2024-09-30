local value=$1
local command="const result=$value;console.log(result);"
echo "command: $command"
node -e $command