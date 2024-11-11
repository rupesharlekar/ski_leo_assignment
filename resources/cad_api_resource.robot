*** Settings ***
Library     modules.cad_api_keywords.CADAPIKeywords

*** Keywords ***

Verify CAD for Asteroid "${asteroid_num}" within "${au}" AU between "${date-min}" and "${date-max}"
    ${response}=    get_all_close_approach_asteroid_data    asteroid_num=${asteroid_num}    au=${au}    min_date=${date-min}    max_date=${date-max}
    [Return]    ${response}

Verify CAD for Earth with "${dist-max}" on or after "${date-min}" sorted by "${sort}"
    ${response}=    get_earth_close_approach_data    dist_max=${dist-max}    min_date=${date-min}    sort=${sort}
    [Return]    ${response}