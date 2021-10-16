#!/bin/env bash

####################################################################
#								   #
#        This program generates random passphrase                  #
#								   #
####################################################################
#								   #
# 		  Created By : Arun.R.R	         	           #   
#								   #
####################################################################

#################################################################################
#                 This script take three parameters                             #
#                                                                               #
# USAGE : bash passphrase_generator.sh 3                                        #
#                                                                               #
# Argument takes the number of words for the generating passphrase              #
#                                                                               #
#################################################################################

# Import random number generator script
random_number_generator=./generate_random.sh

# Import source file for all the possible words for passphrase
passphrase_source_file=./eff_large_wordlist.txt

word=$1
pass_phrase_list=""

while [ $word -gt 0 ]
do
    random_number=$($random_number_generator 1 6 5) 
    pass_phrase=$(cat $passphrase_source_file | grep $random_number | cut -f 2)
    pass_phrase_list=$pass_phrase_list" "$pass_phrase
    ((word-=1))
done

echo "$pass_phrase_list"
