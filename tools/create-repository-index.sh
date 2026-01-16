#!/bin/bash
getElementFromRat()
{
	tar -xf "$1" pkg-header

	echo "$(head -n $2 pkg-header | tail -n 1 | cut -d "=" -f 2)"

	rm -f pkg-header
}

printf "{" > index.json

for i in $(find components -type f -name "*.rat"); do
	printf " \"$(echo $(basename $i))\": { \"name\": \"$(getElementFromRat $i 1)\", \"category\": \"$(getElementFromRat $i 2)\", \"version\": \"$(getElementFromRat $i 3)\", \"architecture\": \"$(getElementFromRat $i 4)\", \"vkDriverLib\": \"$(getElementFromRat $i 5)\" }, " >> index.json
done

printf "}" >> index.json

sed -i "s/, }/}/" index.json