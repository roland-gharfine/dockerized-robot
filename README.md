# robot_project

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Debugging](#debugging)
- [Additional Practice](#additional-practice)
- [Feedback](#feedback) - Please create issues to provide feedback!


## Prerequisites
**Install Docker**
  - These tests have been packaged to run with all dependencies
    installed within a Docker container. The Docker image is based on python 3.7

  - The tests make use of Robot Framework and its Selenium Library extension.


## Usage

*To run without user intervention*


  ```bash

  $ docker-compose build
  $ docker-compose run test
  ```


- This will run the run-tests.sh script which in turn will do the work for you by starting the X server and then running the tests and saving the timestamped results
in the Results directory.

- You will be asked at the first run to provide a test account (email and password). These will be saved in a Sensitive.robot file which will never be pushed to github. Alternatively, feel free to edit your own Sensitive.robot file in the below format and save it in the Config directory (You will only be asked to enter credentials if the file doesn't exist). The file is in the below format:

  ```bash

  *** Variables ***
  @{TEST} =  email@example.com  some-password
  ```




*To run interactively*

  ```bash

  $ docker-compose build
  $ docker-compose run test sh
  ```


**This will open the docker shell and you can run one of the following commands:**


  *Run the entire test suite with the default options*
    
  ``` bash
  $ Xvfb :99 2>&1 &  # This will start the X server
  $ robot Tests 
  ```

  *Run the tests and save results in the Results directory*
    
  ``` bash
  $ robot -d Results Tests
  ```

  *Run tests and save results in timestamped files*

  ``` bash
  $ robot -d Results -T Tests
  ```

**To exit the shell**
  ```bash
  $ exit
  ```


## Documentation

1. You can find keyword documentation for the current robot code in the Documentation directory.
This includes documentation for the high-level keywords used in Common.robot and Scenario.robot, as well as
docmentation for the keywords used in the Page Object files.


1. If you'd like to regenerate the documentation, you can run the below command: 
   * `python  -m robot.libdoc  --format html  path\to\Resource_or_Library  path\to\output_file.html` 




## Additional Information

Feel free to request additional clarifications by opening an issue on this repository!




## Feedback
- If you have any feedback, I'd love to hear from
you! Please make an issue on this repository, and I will get back to you.
