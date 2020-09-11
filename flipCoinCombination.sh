#!/bin/bash
echo ">---< Flip Coin Combination >---<"
read -p "Enter the number of times coin has to be flipped : " n
func() {
	if [[ $1 -eq 0 ]]
	then
		echo "0"
	else
		echo "1"
	fi
}
for (( i=1; i<=$n; i++ ))
do
	num=$((RANDOM%2))
	declare -A dict
	val=$( func $num )
	case $val in
		"0") dict[h]=$(( ${dict[h]} + 1 )) ;;
		"1") dict[t]=$(( ${dict[t]} + 1 )) ;;
	esac
done
x=`awk 'BEGIN{printf("%0.2f", '${dict[h]}' / '$n' * '100' )}'`
y=`awk 'BEGIN{printf("%0.2f", '${dict[t]}' / '$n' * '100' )}'`
echo "Head = $x%"
echo "Tail = $y%"
