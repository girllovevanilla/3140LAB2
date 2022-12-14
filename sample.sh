source build.sh

read -p "Enter the the root dir of compile file (path): " root_dir
read -p "Enter the target location (path): " target_dir

echo
echo


successful_code=0;
echo "+-------------------------------------------------------------------+"
echo "| compile function for java start running:                          |"
echo "+-------------------------------------------------------------------+"
compile "${root_dir}" "${target_dir}"
successful_code=$?
if [[ successfully -eq 0 ]]; then
    echo "| The compile function for java has been compiled successfully      |"
else
    echo "| The compile function for java has been compiled failed            |"
fi
echo "+-------------------------------------------------------------------+"


echo 
echo


echo "+-------------------------------------------------------------------+"
echo "| run function for java start running:                              |"
echo "+-------------------------------------------------------------------+"
run "${root_dir}" "${target_dir}"
successful_code=$?
echo "+-------------------------------------------------------------------+"
if [[ successfully -eq 0 ]]; then
    echo "| The run function for java has been run successfully               |"
else 
    echo "| The run function for java has been run failed                     |"
fi
echo "+-------------------------------------------------------------------+"


echo 
echo


echo "+-------------------------------------------------------------------+"
echo "| The execut function for java start running:                       |"
echo "+-------------------------------------------------------------------+"
execut "${root_dir}" "${target_dir}"
successful_code=$?
echo "+-------------------------------------------------------------------+"
if [[ successfully -eq 0 ]]; then
    echo "| The execut function for java has been executed successfully       |"
else
    echo "| The execut function for java has been executed failed             |"
fi
echo "+-------------------------------------------------------------------+"

echo 
echo

echo "Begin running DaysCalc in bash version...."
echo
source DaysCalc.sh
echo
echo "End running DaysCalc in bash version...."
echo "+-------------------------------------------------------------------+"