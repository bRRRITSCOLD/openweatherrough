TravisCI build status:  

[![Build Status](https://travis-ci.org/bRRRITSCOLD/openweatherrough.svg?branch=master)](https://travis-ci.org/bRRRITSCOLD/openweatherrough)

# Open Weather Map CLI

Revamped, more info coming soon!!!!! Full functionality is not achieved yet due to the lack of a graphical CLI like the previous commits. This will change in the near future, however the need to provide the working base program was needed. Enjoy till the new CLI is added.

## Configuring for use

1. Replace the "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" in 'openweathermap/bin/execute.rb' in the options hash for consumer_api_key key:

```ruby
options = {consumer_api_key: "XXXXXXXXXXXXXXXXXXXXXX"}
```

in the openweathermapcli directory (This prebuilt .yml is provided for quick configuration) with your own personal API_KEY from openweathermap. If you do not currently have one visit:

https://openweathermap.org/users/sign_up 

to acquire a FREE key for using this program.

2. Replace the 'XXXXXX' and 'XXXXXXXXXXXX' in 'openweathermap/bin/execute.rb' in the params hash for both the q and units keys:

```ruby
params = {appid: options[:consumer_api_key, q: 'XXXXXXX', units: 'XXXXXXXXXXX'}
```

## Using the OWM Program

The below was noted and documented while using macOSX High Sierra:

1. Make sure you are logged into a user account who is a system/computer administrator as they have the ability to change the permission parameters system/computer settings and configurations.

2. Please allow for applications/programs/softwares from unknown developers (other than app store or items you have authorized previously) access to run/execute. If need be allow for notifications accessing permission from said applications/programs/softwares from unknown developers prompting you for a decision, this allows for further security if that is a concern.

3. After forking, cloning, or downloading the repository:

* Enter the home/base directory of the program/git clone. Once the configuration above is finished simply run $ ruby bin/execute.rb to return the desired current temperature. 

```bash
$ ruby bin/execute.rb
```

Resulting in something similar to:

```bash 
The current temperature in City, Country is Number.
```
## REMINDER!!!!

The graphical CLI and ability to keep searching without reloading program will be back very soon!!!!

## Testing the program

* To test without an internet connection simply open the main directory of the program (whether downloaded, forked, cloned, etc.) with a terminal of your choice and run the command:

```bash
$ rspec spec
```

and this will automamte the tests (do not include the $ as it refers to a bash terminal line denoter).

* The simplest solution to viewing the tests and if they pass are to travel to the top of this readme and simply click on the:

  [![Build Status](https://travis-ci.org/bRRRITSCOLD/openweatherrough.svg?branch=master)](https://travis-ci.org/bRRRITSCOLD/openweatherrough)

  button provided by TravisCI. Since this repository and program utilize TravisCI each commit to any branch are ran against the existing test (spec files) in the programs direcrtories. So continuous and automated testing keeps everyone up to date on the standing of the program without all the extra hassle of doing it yourself!	 


## Notes

	
The graphical CLI and ability to keep searching without reloading program will be back very soon!!!!

### Conclusion


I hope you find this program enjoyable and useful. All feedback is appreciated.
