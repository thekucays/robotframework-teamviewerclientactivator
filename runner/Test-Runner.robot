*** Test Cases ***
test
    Log To Console    >>> starting test
    ${a}=    Set Variable    1
    ${b}=    Set Variable    2
    ${c}=    Evaluate    ${a} + ${b}
    Log    >>> c value is : ${c}
    Log To Console    >>> c value is : ${c}
    Log To Console    >>> all action completed successfully
