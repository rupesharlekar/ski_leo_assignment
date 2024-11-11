*** Settings ***
Documentation       This test suite contains RESTful API verification test cases for https://ssd-api.jpl.nasa.gov/cad.api
Resource    ../resources/cad_api_resource.robot

Suite Setup         SuiteSetup
Suite Teardown      SuiteTeardown

*** Variables ***
# Example 1: Get all close approach data for asteroid
${ASTEROID_NUM}    433
${AU}              0.2
${DATE_MIN}        1900-01-01
${DATE_MAX}        2100-01-01

# Example 2: Get Earth close approach data
${DIST_MAX}        10LD
${DATE_MIN_EARTH}  2018-01-01
${SORT}            dist

*** Test Cases ***

Verify CAD API for Asteroid
    [Tags]              L0
    [Documentation]    Call the NASA CAD API for asteroid and verify data is returned.
    ${response}=    Verify CAD for Asteroid "${ASTEROID_NUM}" within "${AU}" AU between "${DATE_MIN}" and "${DATE_MAX}"
    Should Not Be Empty    ${response}

Verify CAD API for Earth Close Approach Data
    [Tags]              L0
    [Documentation]    Call the NASA CAD API for Earth and verify data is returned.
    ${response}=    Verify CAD for Earth with "${DIST_MAX}" on or after "${DATE_MIN_EARTH}" sorted by "${SORT}"
    Should Not Be Empty    ${response}

*** Keywords ***

SuiteSetup
    BuiltIn.Log  Suite Setup Section

SuiteTeardown
    BuiltIn.Log  Suite Teardown Section
