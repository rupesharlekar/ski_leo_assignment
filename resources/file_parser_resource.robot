*** Settings ***
Library     modules.file_parser_keywords.FileParserKeywords

*** Keywords ***

Calculate and verify success rate for the log file "${filename}" is equal to or above "${threshold}"
    ${response}=    calculate_success_rate    filename=${filename}    threshold=${threshold}
    [Return]    ${response}
