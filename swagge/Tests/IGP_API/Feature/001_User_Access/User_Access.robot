*** Settings ***
Suite Setup       Create New Session    https://petstore.swagger.io
Library           SeleniumLibrary
Library           RequestsLibrary
Library           JSONLibrary
Resource          ${CURDIR}/../../../../Global_Keyword/IGP_API_Keywords/User_Access_Keyword.robot
Variables         ${CURDIR}/../../Test_Data/User_Access_Variables.py


*** Test Cases ***

Create multiple PETS with POST Request and validate the response code and response body
    [Documentation]    Create multiple pets with POST Request and validate the response code and response body
    ...                Creator :: Mamta Jain (mjain@prosoft-technology.com)
    [Tags]  PET_POST_API

    OPEN EXCEL DOCUMENTS    ${USER_AND_PET_EXCEL_NAME}          # open the execel sheet with user access name
    # Get the list of index on wich provided Test is exit
    ${INDEX_COUNT}    GET USER DATA ROW INDEX    ${PET_PUT_ADD_SHEET_NAME}
    # Execute PUT command on all test index data
    FOR    ${Index}    IN RANGE    2   ${INDEX_COUNT}+1
        # Keyword to Create PUT Command and return Command with expected result
        ${PET_DATA_LIST}    ${Expected_Result}    ADD OR UPDATE PET DATA    ${Index}    ${PET_PUT_ADD_SHEET_NAME}
        # Execute the PUT Command
        ${response}=    POST On Session    mysession    /v2/pet    data=${PET_DATA_LIST}
        log to console    ${response.content}    # for printing complete response on console
        log    ${response.content}    # for printing complete response in report
        ${response}    Convert To String    ${response}
        ${Expected_Status}    Set Variable    ${Expected_Result}[0]
        Should Contain  ${response}  ${Expected_Status}  #Check Status as 200
    END
    Close All Excel Documents



Update multiple PETS with POST Request and validate the response code and response body
    [Documentation]    Update multiple pets with POST Request and validate the response code and response body
    ...                Creator :: Mamta Jain (mjain@prosoft-technology.com)
    [Tags]  PET_PUT_API

    OPEN EXCEL DOCUMENTS    ${USER_AND_PET_EXCEL_NAME}          # open the execel sheet with user access name
    # Get the list of index on wich provided Test is exit
    ${INDEX_COUNT}    GET USER DATA ROW INDEX    ${PET_PUT_UPDATE_SHEET_NAME}
    # Execute PUT command on all test index data
    FOR    ${Index}    IN RANGE    2   ${INDEX_COUNT}+1
        # Keyword to Create PUT Command and return Command with expected result
        ${PET_DATA_LIST}    ${Expected_Result}    ADD OR UPDATE PET DATA    ${Index}    ${PET_PUT_UPDATE_SHEET_NAME}
        # Execute the PUT Command
        ${response}=    PUT On Session    mysession    /v2/pet    data=${PET_DATA_LIST}
        log to console    ${response.content}    # for printing complete response on console
        log    ${response.content}    # for printing complete response in report
        ${response}    Convert To String    ${response}
        ${Expected_Status}    Set Variable    ${Expected_Result}[0]
        Should Contain  ${response}  ${Expected_Status}  #Check Status as 200
    END
    Close All Excel Documents
