#!/bin/bash
echo ">---< Flip Coin Combination >---<"
read -p "Enter the number of times coin has to be flipped : " n
echo -e "Select the Combination\n1. Singlet\n2. Doublet\n3. Triplet"
read -p "Enter your choice : " ch
declare -A dict
arr=('h' 't' 'hh' 'tt' 'ht' 'th' 'hhh' 'ttt' 'htt' 'thh' 'hth' 'tht' 'hht' 'tth' )
for j in ${arr[@]}
do
	dict[$j]=0
done
func() {
	if [[ $1 -eq 0 ]]
	then
		echo "0"
	elif [[ $1 -eq 1 ]]
	then
		echo "1"
	elif [[ $1 -eq 2 ]]
	then
                echo "2"
        elif [[ $1 -eq 3 ]]
        then
                echo "3"
        elif [[ $1 -eq 4 ]]
        then
                echo "4"
        elif [[ $1 -eq 5 ]]
        then
                echo "5"
        elif [[ $1 -eq 6 ]]
        then
                echo "6"
	else
		echo "7"
	fi
}
for (( i=1; i<=$n; i++ ))
do
	case $ch in
		"1")num=$((RANDOM%2)) ;;
		"2")num=$((RANDOM%4)) ;;
		"3")num=$((RANDOM%8)) ;;
	esac
	val=$( func $num )
	case $val in
		"0") dict[h]=$(( ${dict[h]} + 1 ))
		     dict[hh]=$(( ${dict[hh]} + 1 ))
		     dict[hhh]=$(( ${dict[hhh]} +1 )) ;;
		"1") dict[t]=$(( ${dict[t]} + 1 )) 
		     dict[tt]=$(( ${dict[tt]} + 1 )) 
		     dict[ttt]=$(( ${dict[ttt]} + 1 ));;
		"2") dict[ht]=$(( ${dict[ht]} + 1 ))
		     dict[htt]=$(( ${dict[htt]} + 1 )) ;;
                "3") dict[th]=$(( ${dict[th]} + 1 ))
		     dict[thh]=$(( ${dict[thh]} + 1 )) ;;
                "4") dict[hth]=$(( ${dict[hth]} + 1 )) ;;
                "5") dict[tht]=$(( ${dict[tht]} + 1 )) ;;
                "6") dict[hht]=$(( ${dict[hht]} + 1 )) ;;
                "7") dict[tth]=$(( ${dict[tth]} + 1 )) ;;

        esac
done
if [[ $ch -eq 1 ]]
then
	x=`awk 'BEGIN{printf("%0.0f", '${dict[h]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.0f", '${dict[t]}' / '$n' * '100' )}'`
	echo -e "Head = $x%\nTail = $y%"
	if [[ $x -gt $y ]]
	then
		echo "Head=$x% is greater"
	elif [[ $x -eq $y ]]
	then
		echo "Both are equal"
	else
		echo "Tail=$y% is greater"
	fi
elif [[ $ch -eq 2 ]]
then
	w=`awk 'BEGIN{printf("%0.0f", '${dict[hh]}' / '$n' * '100' )}'`
        x=`awk 'BEGIN{printf("%0.0f", '${dict[tt]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.0f", '${dict[ht]}' / '$n' * '100' )}'`
        z=`awk 'BEGIN{printf("%0.0f", '${dict[th]}' / '$n' * '100' )}'`
	echo -e "HH=$w%\nTT=$x%\nHT=$y%\nTH=$z%"
	sort=( $w $x $y $z )
	size=${#sort[@]}
	for (( i=0; i<$size; i++ ))
	do
		for (( j=$(( $i + 1 )); j<=$size; j++ ))
		do
			if [[ ${sort[$i]} -gt ${sort[$j]} ]]
			then
				continue
			else
				temp=${sort[$i]}
				sort[$i]=${sort[$j]}
				sort[$j]=$temp
			fi
		done
	done
	case ${sort[0]} in
		"$w") echo "HH:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
		"$x") echo "TT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
		"$y") echo "HT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
		"$z") echo "TH:${sort[0]}% is the highest" ;;
	esac
else
        s=`awk 'BEGIN{printf("%0.0f", '${dict[hhh]}' / '$n' * '100' )}'`
        t=`awk 'BEGIN{printf("%0.0f", '${dict[ttt]}' / '$n' * '100' )}'`
        u=`awk 'BEGIN{printf("%0.0f", '${dict[htt]}' / '$n' * '100' )}'`
        v=`awk 'BEGIN{printf("%0.0f", '${dict[thh]}' / '$n' * '100' )}'`
        w=`awk 'BEGIN{printf("%0.0f", '${dict[hth]}' / '$n' * '100' )}'`
        x=`awk 'BEGIN{printf("%0.0f", '${dict[tht]}' / '$n' * '100' )}'`
        y=`awk 'BEGIN{printf("%0.0f", '${dict[hht]}' / '$n' * '100' )}'`
        z=`awk 'BEGIN{printf("%0.0f", '${dict[tth]}' / '$n' * '100' )}'`
	echo -e "HHH=$s%\nTTT=$t%\nHTT=$u%\nTHH=$v%\nHTH=$w%\nTHT=$x%\nHHT=$y%\nTTH=$z%"
        sort=( $w $x $y $z $w1 $x1 $y1 $z1 )
        size=${#sort[@]}
        for (( i=0; i<$size; i++ ))
        do
                for (( j=$(( $i + 1 )); j<=$size; j++ ))
                do
                        if [[ ${sort[$i]} -gt ${sort[$j]} ]]
                        then
                                continue
                        else
                                temp=${sort[$i]}
                                sort[$i]=${sort[$j]}
                                sort[$j]=$temp
                        fi
                done
        done
        case ${sort[0]} in
		"$s") echo "HHH:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$t") echo "TTT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$u") echo "HTT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$v") echo "THH:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
		"$w") echo "HTH:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$x") echo "THT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$y") echo "HHT:${sort[0]}% is the highest" ;;
	esac
	case ${sort[0]} in
                "$z") echo "TTH:${sort[0]}% is the highest" ;;
	esac
fi
