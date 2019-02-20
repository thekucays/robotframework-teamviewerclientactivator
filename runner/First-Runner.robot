*** Settings ***
Resource          ../config/config.robot
Library           AppiumLibrary
Resource          ../Resources/xpathlist.robot

*** Test Cases ***
testrun-firstrun
    Open Application    ${appiumServerLoc}    platformName=Android    platformVersion=${androidVersion}    deviceName=${deviceName}    appPackage=${packageName}    appActivity=${activityName}
    Log To Console    >>>> App Opened
    ### should be on welcome screen
    Log To Console    >>> taking ss
    AppiumLibrary.Capture Page Screenshot
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_welcome_next}    timeout=${elementWaitTimeout}
    AppiumLibrary.Click Element    ${xpath_welcome_next}
    AppiumLibrary.Click Element    ${xpath_welcome_next}
    AppiumLibrary.Click Element    ${xpath_welcome_next}
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_welcome_done}    timeout=${elementWaitTimeout}
    AppiumLibrary.Click Element    ${xpath_welcome_done}
    ### should be landed on home page
    Log To Console    >>> Landed on TeamViewer homepage
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_home_openQS}    timeout=${elementWaitTimeout}
    AppiumLibrary.Click Element    ${xpath_home_openQS}
    ### open QS for the first time
    Log To Console    >>> Opening QS for the first time
    Log    >>> Opening QS for the first time
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_QS_slide_firsttext}    timeout=${elementWaitTimeout}
    ### get screen data
    ${window_width}=    AppiumLibrary.Get Window Width
    ${window_height}=    AppiumLibrary.Get Window Height
    ${window_width_half}=    Evaluate    ${window_width}/2
    ${window_height_half}=    Evaluate    ${window_height}/2
    ${start_x}=    Evaluate    ${window_width_half}+${factor_startx}
    ${offset_x}=    Evaluate    ${window_width_half}-${factor_offsetx}
    AppiumLibrary.Swipe    ${start_x}    ${window_height_half}    ${offset_x}    ${window_height_half}
    AppiumLibrary.Swipe    ${start_x}    ${window_height_half}    ${offset_x}    ${window_height_half}
    AppiumLibrary.Click Element    ${xpath_QS_slide_done}
    Log To Console    >>> QS welcome slide passed
    ### teamviewer quicksupport should be opened
    Log To Console    >>> Opening QuickSupport
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_QS_activatingtext}    timeout=${elementWaitTimeout}
    Log To Console    >>> Activating QuickSupport...
    Log    >>> Activating QuickSupport...
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_QS_ready}    timeout=${elementWaitTimeout}
    ### get client id
    Log To Console    >>> Getting Client ID
    ${clientID}=    AppiumLibrary.Get Text    ${xpath_QS_clientid}
    Log To Console    >>> Client ID: ${clientID}
    Log    >>> Client ID: ${clientID}
    Sleep    3s
    ### allow remote support
    Log    >>> Alllowing remote support
    Log To Console    >>> Alllowing remote support
    AppiumLibrary.Wait Until Element Is Visible    ${xpath_QS_allowremotetitle}    timeout=${waitTime}
    AppiumLibrary.Click Element    ${xpath_QS_allowremotetitle}
    Comment    AppiumLibrary.Wait Until Element Is Visible    ${xpath_QS_startnow}    timeout=${elementWaitTimeout}
    Comment    AppiumLibrary.Click Element    ${xpath_QS_startnow}
