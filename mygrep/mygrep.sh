#!/bin/bash

#***********************variable section***********************#
line_number=0
#***********************run time section***********************#
#check if there is option or not 
if [[ $1 == -* ]] 
then  #there is an option
  #Function to check if there is missing argument or not
  if [ "$#" -lt 3 ];then
    echo "Too few arguments"
    [[ "$2" == *"."* ]] && echo "missing string" || echo "missing file"
    exit 1
  fi
  file=$3  #there is no missing argument so file will be the third arrgument
  lower_pattern=$(echo $2 | tr '[:upper:]' '[:lower:]') # Convert pattern the second arrgument to lowercase
  
  #check the option
  case $1 in 
  '-n')
  while IFS= read -r line;do
    ((line_number++))
    lower_line=$(echo $line | tr '[:upper:]' '[:lower:]') 
    if [[ "$lower_line" == *"$lower_pattern"* ]]
    then
      echo "$line_number:$line" | sed "s/$2/\x1b[1;31m&\x1b[0m/gI" # print the line, its number and highlight the pattern
    fi
  done < "$file"
  ;;
   
  '-v')
  while IFS= read -r line; do 
    lower_line=$(echo $line | tr '[:upper:]' '[:lower:]')
    if [[ "$lower_line" != *"$lower_pattern"* ]]
    then
      echo "$line"
    fi
  done < "$file"
  ;;
  
  '-nv' | '-vn')
  while IFS= read -r line; do 
    ((line_number++))
    lower_line=$(echo $line | tr '[:upper:]' '[:lower:]')
    if [[ "$lower_line" != *"$lower_pattern"* ]]
    then
      echo "$line_number:$line"
    fi
  done < "$file"
  ;;
  
  *)
  echo "invalid option"
  ;;
  esac
  
else  #there is no option
  #check if there is missing argument or not
  if [ "$#" -lt 2 ];then
    echo "Too few arguments"
    [[ "$1" == *"."* ]] && echo "missing string" || echo "missing file"
    exit 1
  fi
  file=$2
  # Convert pattern to lowercase
  lower_pattern=$(echo $1 | tr '[:upper:]' '[:lower:]')
  while IFS= read -r line; do 
    lower_line=$(echo $line | tr '[:upper:]' '[:lower:]')
    if [[ "$lower_line" = *"$lower_pattern"* ]]
    then
      echo "$line" | sed "s/$1/\x1b[1;31m&\x1b[0m/gI"
    fi
  done < "$file"
fi
