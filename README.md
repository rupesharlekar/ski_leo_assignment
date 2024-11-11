#### Lib / Frameworks used
- python
- robot framework
- requests
- docker
- docker-compose

#### Features
- layered structure - steps functions (resources\<>_resource.robot) and aggregators/tests (tests\test_<>.robot)
- can be used for all the HTTP method in REST API automation

#### Installation and Prequesites 
- should have docker and docker-compose installed on machine
- `git clone git@github.com:rupesharlekar/robot_framework_tests.git  && cd robot_framework_tests`  
- `sudo docker build -t robot-framework-tests .`

#### How to run tests
`sudo docker compose up --build`
