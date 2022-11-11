@ECHO OFF

REM Operating Systems Assignment Part 1
REM Author: Victor-Florian Davidescu
REM SID: 1705734

REM Firstly, the program tests if there are entered exactly three parameters, then it checks if parameters are valid or not.
REM First parameter is the name. It is not valid if the name is empty.
REM Second parameter is reserved for the colour. The only valid colours are: red, green and blue. The other colours are not accepted.
REM The last parameter is reserved for the font size. In order to be valid, the size must be above 1. Any negative number or 0 will not be accepted.

REM Testing for parameters

REM Testing if there is a first parameter for name
if "%1"=="" goto INTERACTIVE_MODE
REM Testing if there is a second parameter for colour
if "%2"=="" (
echo Error! Wrong number of parameters.
echo Only 3 parameters are accepted. Example: Name red 30
goto STOP
)
REM Testing if there is a third parameter for font size
if "%3"=="" (
echo Error! Wrong number of parameters.
echo Only 3 parameters are accepted. Example: Name red 30
goto STOP
)
REM Testing if there are more than three parameters
if "%4"=="" (
set name=%1
goto CHECK_COLOUR_PARAMETER
) else (
echo Error! Wrong number of parameters.
echo Only 3 parameters are accepted. Example: Name red 30
goto STOP
)

:CHECK_COLOUR_PARAMETER
REM Checking if the colour entered as a parameter is red, blue or green
REM If there is a wrong colour, the program will close

set colour=%2
if "%colour%"=="red" goto CHECK_FONT_SIZE_PARAMETER
if "%colour%"=="blue" goto CHECK_FONT_SIZE_PARAMETER
if "%colour%"=="green" (
goto CHECK_FONT_SIZE_PARAMETER
) else (
echo Error! Wrong colour.
echo Colour should be: red, green or blue.
goto STOP
)

:CHECK_FONT_SIZE_PARAMETER
REM Checking if the font size entered as a parameter is above or equal to 1
REM ATENTION! This part of the program cannot detect if the value entered is a number or not
REM Entering a non numeric value will lead to a HTML file that will not work

set font_size=%3
if %font_size% LSS 1 (
echo Error! Font size cannot be below 1.
goto STOP
) else (
goto CHECK_FILE
)

:INTERACTIVE_MODE
REM Interactive mode
REM In case that there are no parameters, the program will ask the user for the name, colour and font size
REM After the user responded at all three questions correctly, the program will move at the stage of testing for the HTML file

echo Hello there!
echo This application will create a new HTML file.
echo There are three questions that will ask for: name, color (red, green or blue) and the font size which will be used for the HTML file.
echo Please answer the following questions in order to proceed.
:select_name
REM Question 1
set /p name=What name do you want to display? 
goto CHECK_NAME
:select_colour
REM Question 2
set /p colour=Choose a color between red, green and blue. 
goto CHECK_COLOUR
:select_font_size
REM Question 3
set /p font_size=Enter a font size bigger than 1. 
goto CHECK_FONT_SIZE

:CHECK_NAME
REM Checking if the name is empty or not.
REM If the name is empty, will go back to question 1
REM If the name isn't empty the program will move to question 2 

if "%name%"=="" (
echo Error! There is no name.
goto select_name
) else (
goto select_colour
)

:CHECK_COLOUR
REM Checking if the colour is red,blue or green
REM If there is no colour, or the user entered a wrong colour, the program will go back to question 2
REM If the colour is correclty the program will move on to question 3

if "%colour%"=="" (
echo Error! There is no colour.
goto select_colour
)
if "%colour%"=="red" goto select_font_size
if "%colour%"=="blue" goto select_font_size
if "%colour%"=="green" (
goto select_font_size
) else (
echo Error! Wrong colour.
goto select_colour
)

:CHECK_FONT_SIZE
REM Checking font size if it is 0 or empty
REM This part of the program cannot check if it is a number or not
REM If the font size is below 0, the program will go back to question 3
REM IF the font size is valid, the program will go to CHECK_FILE, to test if a file name hello.htm already exits

if "%font_size%"=="" (
echo Error! There is no font size.
goto select_font_size
)

if %font_size% LSS 1 (
echo Error! Font size cannot be below 1.
goto select_font_size
) else (
goto CHECK_FILE
)

:CHECK_FILE
REM Checking if exists a file hello.htm in the current directory.

if exist "hello.htm" (
echo Warning! A file named hello.htm already exists in the current directory.
echo Do you wish to overwrite ?
:select_decision
set /p decision=Please type yes to proceed, or no to cancel the program.
goto :CHECK_DECISION
) else (
goto CREATING_FILE 
)

:CHECK_DECISION
REM Checking if the user entered a correct decision.

if "%decision%"=="y" goto CREATING_FILE
if "%decision%"=="yes" goto CREATING_FILE
if "%decision%"=="YES" goto CREATING_FILE
if "%decision%"=="Yes" goto CREATING_FILE

if "%decision%"=="n" (
echo The creation of the HTM file is cancelled.
goto STOP
)
if "%decision%"=="no" (
echo The creation of the HTM file is cancelled.
goto STOP
)
if "%decision%"=="NO" (
echo The creation of the HTM file is cancelled.
goto STOP
)
if "%decision%"=="No" (
echo The creation of the HTM file is cancelled.
goto STOP
) else (
echo Error! Decision not recognized. Type "yes" or "no" without quotes in order to proceed or to cancel the program.
goto select_decision
)

:CREATING_FILE
REM The process of creating an HTM file
REM From the start the file gets the name hello.htm
REM It outputs the echo lines into the "Hello.htm" file.

echo Creating file
set file=hello.htm

echo ^<html^> > %file%
echo ^<body^> >> %file%
echo ^<p ^<span style='font-size:%font_size%pt'^>Hello^<^/span^> >> %file%
echo ^<span style='color:%colour%'^>%name%^<^/span^>^<^/p^> >> %file%
echo ^<^/body^> >> %file%
echo ^<^/html^> >> %file%

echo File created succesfully.

:STOP
REM The end of the program.
REM All of the variables are reseted.

set name=
set colour=
set font_size=
set decision=

echo Program closed.