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
- `git clone https://github.com/rupesharlekar/ski_leo_assignment.git  && cd ski_leo_assignment`  
- `sudo docker build -t robot-framework-tests .`

#### How to run tests
- `sudo docker compose up --build`


####  Result
- Result are copied outside the container in the directory that has code cloned `../ski_leo_assignment/results`