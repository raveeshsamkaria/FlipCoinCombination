#!/bin/bash
echo ">---< Flip Coin Combination >---<"
num=$((RANDOM%2))
if [[ $num -eq 0 ]]
then
	echo "Head"
else
	echo "Tail"
fi
