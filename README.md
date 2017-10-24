[![Build Status](https://travis-ci.org/bRRRITSCOLD/openweatherrough.svg?branch=master)](https://travis-ci.org/bRRRITSCOLD/openweatherrough)

# Open Weather Map CLI

Presenting the "Open Weather Map CLI" where your need for current and future weather needs are met! Currently the only support is for that of Current Temperature, there are hopes of expanding this project into Forecast and Current Weather (clud coverage, precipitation, wind speed, etc.) in the future. Please keep in mind that this is a test application/experimental project.

## Using the cli

The below was noted and documented while using macOSX High Sierra:

1. Make sure you are logged into a user account who is a system/computer administrator as they have the ability to change the permission parameters system/computer settings and configurations.

2. Please allow for applications/programs/softwares from unknown developers (other than app store or items you have authorized previously) access to run/execute. If need be allow for notifications accessing permission from said applications/programs/softwares from unknown developers prompting you for a decision, this allows for further security if that is a concern.

3. After forking, cloning, or downloading the repository:

* unzip and locate destination of download, enter the bin file and double click on openweathermapcli unix executable to automatically start the program. 

* enter the openweathermapcli directory through a terminal, then into the bin directory within the openweathermapcli and use $ ruby openweathermapcli.rb to start the program (or any ruby version/environment manager you may have installed).

4. Starting the application you will see a welcome message:

.----------------------------------------.

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

.__________________________________________.

Welcome to the Open Weather Map CLI

.----------------------------------------.

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

.__________________________________________.

* Followed by a prompt and onscreen directions for you to enter the desired measurement scale for the returned units data:

.________________________________________________________________________________________________________________.

Enter the desired unit class of measurement desired for current temperature:
- Typing 'standard', 'default' or 'any word != imperial or metric' induces the selection of Standard Kelvin)
- Typing 'imperial' induces the selection of Imperial (Fahrenheit)
- Typing 'metric' induces the selection of Metric (Celsius)

.________________________________________________________________________________________________________________.


* After entering the unit measurement scale you will be prompted to insert the desired city name and country/state code for the corresponding desired current temperature.


.__________________.

Enter a City Name:

.__________________.
			  
.__________________________________________________.

Enter a Country or USA State Code:
- Country Code Example: US, UK, FR, Etc.
- USA State Code Example: IA, IL, MN, Etc.

.__________________________________________________.


* Once you have entered the city name and country/state code the program will call the #current_temperature_retrieval on its own. This will cause the program to show you one of two screens, each of which is shown and explained further below:


*	i) First possible screen (outcome):


If the city name and country/state code combination that you have entered is valid, the current temperature data will be shown to you in the following format. CONGRATS! YOU DID IT! (CC below is the abreviation of Country Code as the data is abbreviated) (XX refers to numerics that will represent the current temperature in the chose unit measurement scale.)


.___________________________________________________________________________________.

The current temperature in City Name, CC: XX.

.___________________________________________________________________________________.


*	ii) Second possible screen (outcome):


This screen will be shown to you once the city name and country/state code has been sent to the API and cross checked for validation of a correct combination and the validation comes back as false. This means you have entered a City and County/State combo that is either not real/valid or not housed in the OpenWeatherMap API databases. When prompted with this retry asking for a different combination. (This screen will continue to show until a valid combination is given or the program is exited out of.)	

 
._____________________________________________________________.

'City Name, CC' is not a valid combination. Please try again.

._____________________________________________________________.	  


Once the current temperature is returned (whether on the first input try or after consecutive input retries), along with the current temperature output there will be a screen prompting you, the user, to specifiy if you would like to exit the entire program at this point. Typing no will result in the program returning to the unit measurement screen prompt through the entire process again until you receive your next desired current temperature. This will continue as long as you input no when prompted if you want to exit. Once you type yes however the program process will hault and complete itself shutting down the program.


.______________________________________________________.

Woud you like to exit the ENTIRE program? (Yes or no)

.______________________________________________________.


If the prompt does not recognize your input, any combination of lower/uppercase letters of "no" or "yes" or any other word not relating to yes or no, then you will be prompted to retry typing your input for the desired effect. This will continue to prompt you until yes or no is entered or the program is exited out of manually.


.__________________________________________________________.		 

Your input of 'word' was not recognized. Please try again.

.__________________________________________________________.		 


## Notes

	
* Care has been taken to implement methods/actions/rules that ensure that any combination of upper/lowercase letters in any of the inputs results in the system capturing the lowercase version everytime. This ensures all validations and logical conditions are handled the same, allowing for smooth usage and less frequent breaks/bugs.


* All outputs using cptured input will also then be formated to include the correc capitalization and uppercasing of all city names and country/state codes. This also goes for multi word city names like: "Des Moines" - go ahead try it, I dare you.


### Conclusion


I hope you find this program enjoyable and useful. All feedback is appreciated.



			  