*** Settings ***
Documentation       This test suite contains the test case to verify the overall success rate.
Resource            ../resources/file_parser_resource.robot

*** Variables ***
${FILENAME}    bs_log.txt
${THRESHOLD}   10

*** Test Cases ***
Verify Overall Success Rate Above Threshold
    [Documentation]    Verify that the overall success rate is is equal to or above ${THRESHOLD}%.
    ${result}=    Calculate and verify success rate for the log file "${FILENAME}" is equal to or above "${THRESHOLD}"
    Should Be True    ${result}    Overall success rate is below ${THRESHOLD}%