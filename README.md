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

## Additional Practice

- Try to create a Map class that assembles the points you've created into a
data structure. Create one test to make sure the map has the appropriate points
and create another test to raise an exception if you assert the Map has a point
that it has not stored.

- Write a simple xml or json data processor to our data_processor.py file. After doing so, update the factory fixture to also allow a user to pass in the data for testing. There's a json_processor.py file in the scripts file if you get stuck and want to compare what you've done to a sample json reader.

- Create a User class. Each User should have a height and favorite color. Based
on their height, create a function that awards them different types of candy.
Try working from the test first as you add this functionality and think of ways
to parametrize your test.

- Find open source Python projects that use pytest and read their tests. Then
go to the source code to validate your assumptions. Try doing this repeatedly
over a few projects that use the pytest framework. Here are a few to get you
started: 
    - Pytest retains a [list of projects](https://docs.pytest.org/en/latest/projects.html).
    - [sentry, cross-platform application monitoring, with a focus on error reporting](
https://github.com/getsentry/sentry/blob/master/tests/sentry/eventstream/kafka/test_consumer.py)
    - [pdb++, a drop-in replacement for pdb](https://github.com/pdbpp/pdbpp/blob/master/testing/test_pdb.py)
    - [Astropy,a single core package for Astronomy in Python](https://github.com/astropy/astropy/tree/master/astropy/tests/tests)


- Add validation to the delete function in the fitness log class. First,
refactor your test to account for this.

- Additionally, you may consider contributing to open source projects that use
pytest. If you are new to open source, there are several resources to get
started.

- The awesome for beginners github repository and the first timers only website
contain ideas for beginner-friendly open source contributions.
   - Awesome First PR Opportunities: https://github.com/MunGell/awesome-for-beginners
   - Find open source projects with issues for beginners: https://www.firsttimersonly.com/

- Also, the mediawiki parser library lists issues perfect for someone looking
to get started with open source contributions to their project.



## Feedback
- If you have any feedback, I'd love to hear from
you! Please make an issue on this repository, and I will get back to you.
