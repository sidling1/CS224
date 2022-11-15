#!/bin/bash
#Ubuntu 22.04 LTS
#There should be a blank line at the end of the file in the file to be read
#declaring variables
declare overtimepay
declare basepay
declare totalpay
declare payrate
declare workedhours
declare overtimehours
declare employeeno
declare department
declare exemptstatus
declare baseworkhours=40
declare overtimepayrate=0.5
echo "-------------------------------------------  PAYROLL  -----------------------------------------------"
echo #Empty echo to print a blank line
echo "Employee Number   Department  payrate Exempt  Hours worked    Base pay    Overtime pay    Total pay"
echo #Empty echo to print a blank line
while read var
do
IFS=' ' #The character where the string is cut into different parts and each stored in an array in the read command
read -a arr<<<"$var"
payrate=${arr[2]}
workedhours=${arr[4]}
employeeno=${arr[0]}
department=${arr[1]}
exemptstatus=${arr[3]}
basepay=`echo "$payrate * $workedhours" | bc`
if [ $workedhours -le $baseworkhours ]
then
overtimepay=0
else
if [ "$exemptstatus" == "N" ]
then
overtimehours=`echo "$workedhours - $baseworkhours" | bc`
overtimepay=`echo "$overtimehours * $overtimepayrate * $payrate" | bc`
else
overtimepay=0
fi
fi
totalpay=`echo "$overtimepay + $basepay" | bc`
printf "%-20s %-10s %-8s %-10s %-11s %-15s %-10s %s\n\n" $employeeno $department $payrate $exemptstatus $workedhours $basepay $overtimepay $totalpay
done < EMPLOYEE
echo #Empty echo to print a blank line
echo "-----------------------------------------------------------------------------------------------------"