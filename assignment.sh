# Operating Systems Assignment Part 1
# Author: Victor-Florian Davidescu
# SID: 1705734

# Atention! The font size does not work in the HTML file created, even if the program created correclty.

# Testing if there is a parameter
# If the first parameter doesn't exists, then the program will go to interactive mode to ask questions
# If there is a first parameter, the program will skip the interactive mode to start checking for the others parameters

if [ -z $1 ]
# http://wiki.bash-hackers.org/commands/classictest | String tests | 2018
   then
   # Interactive mode
   echo Hello there!

   # Question 1
   echo Please enter your name.
   read name

   # Checking answer 1
   # If the name is empty the program will ask again for it, if not the program will continue
   while [ "$name" = "" ]
    do
    echo Error! There is no name. Please re-enter your name.
    read name
    done

   # Question 2
   echo Please select one of the following colors: red, green or blue
   read colour
   
   # Checking the answer 2
   # If the colour is empty or is another colour the program will ask again for it, if not the program will continue
   
   loopcolour=1

   while [ "$loopcolour" = "1" ]
   do
    if [ "$colour" != "red" -a "$colour" != "green" -a "$colour" != "blue" ]
       then
       echo Error! Wrong colour. Please re-choose between red, green or blue.
       read colour
       
       else
       
       loopcolour=0 
    fi
   done

   # Question 3
   echo Please enter a font size bigger than 1
   read font_size
   
   # Checking answer 3
   # If the font size is empty or below 1, the program will ask again the user for it, if not the program will continue
   
   loopfont_size=1
   
   while [ "$loopfont_size" = "1" ]
   do
    if [ -z "$font_size" ]
     then
      echo Error! There is no font size! Please re-enter a font size bigger than 1.
      read font_size
    elif [ $font_size -lt 1 ]
     then
      echo Error! Wrong font size! Please re-enter a font size bigger than 1.
      read font_size
    else
     loopfont_size=0
    fi
   done

# Testing for an existing file 
# If a file name hello.htm already exists in the current directory, the program will ask the user if it's allowing to overwrite it.
# If the user types yes, the program will continue and it will overwrite the file hello.html
# If the user types no, the program will stop and the file will not be edited
# If the program doesn't find the file hello.htm, it will create a new one without asking the user

   if [ -r hello.htm ]
# http://wiki.bash-hackers.org/commands/classictest | File tests | 2018
   then
    echo Warning! A file named "hello.htm" already exists in the current directory.
    echo Do you wish to overwrite it? Please type yes to proceed or type no to cancel.
  
    read decision
    loopdecision=1
  
    while [ "$loopdecision" = "1" ]
    do
     # Testing for yes decision
     if [ "$decision" = "yes" -o "$decision" = "Yes" -o "$decision" = "YES" ]
# http://wiki.bash-hackers.org/commands/classictest | Misc syntax | 2018
     then
      echo Overwriting the file hello.htm .
      loopdecision=0
     
      # Writing HTML file     
      echo '<html>' > hello.htm
      echo '<body>' >> hello.htm
      echo '<p <span style=fontsize:'$font_size'pt>Hello</span>' >> hello.htm
      echo '<span style=color:'$colour'>'$name'</span></p>' >> hello.htm
      echo '</body>' >> hello.htm
      echo '</html>' >> hello.htm
      echo File created
      
     # Testing for no decision
     elif [ "$decision" = "no" -o "$decision" = "No" -o "$decision" = "NO" ]
# http://wiki.bash-hackers.org/commands/classictest | Misc syntax | 2018
      then
       loopdecision=0
       echo Program stopped.
       break
      else
       echo Error! Wrong input. Please re-type your decision: Yes or No
       read decision
     fi
    done
    
# If there is no file, the program will output the HTML codes to a new file  
   else
   
    # Writing HTML file
    echo '<html>' > hello.htm
    echo '<body>' >> hello.htm
    echo '<p <span style=fontsize:'$font_size'pt>Hello</span>' >> hello.htm
    echo '<span style=color:'$colour'>'$name'</span></p>' >> hello.htm
    echo '</body>' >> hello.htm
    echo '</html>' >> hello.htm
    echo File created
    
   fi
   
# Non-interactive mode, if there is a first parameter, the program will start to check the other parameters
# Testing if there are only 3 parameters. If there are more or less the program will close.

else

  if [ -z "$2" ] || [ -z "$3" ] || [ -n "$4" ]
# http://wiki.bash-hackers.org/commands/classictest | String tests | 2018
   then
   echo Error! Wrong number of parameters introduced
   echo Only 3 parameters are accepeted. Example: ./assignment.sh Name red 30

# Testing if the second parameter contains the right color: red, blue or green. If there is a another color, the program will close.
  elif [ "$2" != "red" -a "$2" != "blue" -a "$2" != "green" ]
# http://wiki.bash-hackers.org/commands/classictest | Misc syntax | 2018
   then
    echo Error! The second parameter that contains the color, is not red, blue or green.

# Testing if the third parameter is greater or equal to 1
  elif [ $3 -lt 1 ]
   then
    echo Error! The third parameter that contains the font size is below 1.

# Testing if the fill hello.htm already exists in the current directory
  elif [ -r hello.htm ]
# http://wiki.bash-hackers.org/commands/classictest | File tests | 2018
    then
      echo Warning! A file named "hello.htm" already exists.
      echo Do you wish to overwrite? Please type Yes to proceed or type No to cancel.
      read decision
      loopdecision=1
  
      while [ "$loopdecision" = "1" ]
       do
       
       # Checking for a posivite answer
        if [ "$decision" = "yes" -o "$decision" = "Yes" -o "$decision" = "YES" ]
# http://wiki.bash-hackers.org/commands/classictest | Misc syntax | 2018
         then
          echo Overwriting the file "hello.htm"
          
          loopdecision=0
          
          # Writing HTML file
          echo '<html>' > hello.htm
          echo '<body>' >> hello.htm
          echo '<p <span style=fontsize:'$3'pt>Hello</span>' >> hello.htm
          echo '<span style=color:'$2'>'$1'</span></p>' >> hello.htm
          echo '</body>' >> hello.htm
          echo '</html>' >> hello.htm
          echo File created
       
       # Checking for a negative answer
        elif [ "$decision" = "no" -o "$decision" = "No" -o "$decision" = "NO" ]
# http://wiki.bash-hackers.org/commands/classictest | Misc syntax | 2018
         then
          echo Program canceled.
          loopdecision=0
          break
        else
          echo Error! Wrong input. Please re-type your decision: Yes or No
          read decision
        fi
      done
      
  else
  
   # Writing HTML File 
   echo '<html>' > hello.htm
   echo '<body>' >> hello.htm
   echo '<p <span style=fontsize:'$3'pt>Hello</span>' >> hello.htm
   echo '<span style=color:'$2'>'$1'</span></p>' >> hello.htm
   echo '</body>' >> hello.htm
   echo '</html>' >> hello.htm
   echo File created
fi
fi
