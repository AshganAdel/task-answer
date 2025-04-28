# Custom-Command
## A breakdown of how my script handles arguments and options 
The script can take three or two argument.<br /> 
  First: for the option (-n, -v, -nv, -vn), this field is optional.<br /> 
  Second: for the string, this field is necessary.<br /> 
  Third: for the file name, this field is necessary.<br /> 
The script check if there is an option or not and make it if it exist.<br /> 
The script warn about missing arguments.<br /> 
![Alt text](mygreptest.png)
## A short paragraph of how would my structure change if the script were to support regex or -i/-c/-l options<br /> 
-i will not change mygrep structure because it is already case insensitive.<br /> 
-c will make a function that print the count of lines have the string.<br /> 
-l will make a function that print the file name if the string exist.<br /> 

## The part of the script was hardest to implement<br /> 
Implement the part that search for the string <br /> 

