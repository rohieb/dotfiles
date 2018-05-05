#!/bin/sh
for file in ~/.neomutt/accounts/*.rc; do
	echo "source $file";
done
