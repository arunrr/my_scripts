#!/bin/env bash

####################################################################
#								   #
# This program generates a random number between a specified limit #
#								   #
####################################################################
#								   #
# 		  Created By : Arun.R.R	         	           #   
#								   #
####################################################################

#################################################################################
#                 This script take three parameters                             #
#                                                                               #
# USAGE : bash generate_random.sh 1 6 10                                        #
#                                                                               #
# First argument takes lower limit                                              #
#                                                                               #
# Second argument takes higher limit                                            #
#                                                                               #
# Third argument specifies how many times the random number should be generated #
#                                                                               #
#################################################################################

# Specify lower and upper limits and tests
lower_limit=$1
upper_limit=$2
tests=$3
random_number=0

echo "Generated Random numbers:"

while [ $tests -gt 0 ]
do
    random_number=$[ $RANDOM % $upper_limit + $lower_limit ]
    echo "$random_number"
    let "tests-=1"
done
