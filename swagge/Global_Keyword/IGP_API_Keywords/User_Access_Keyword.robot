########################################################################################################
## Summary :: Keywords for User Access end point in Test Automation Framework
##
## File :: User_Access_Keyword.robot
##
## Usage ::  These keywords used in the API Test Cases
########################################################################################################
*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           ExcelLibrary
Library           String
Variables          ${CURDIR}/../../Tests/IGP_API/Test_Data/User_Access_Variables.py

*** Keywords ***
Create New Session
    [Documentation]    Create New Session
    [Arguments]    ${URL}
    Create Session    mysession    https://${URL}    verify=false
    Return From Keyword    mysession


OPEN EXCEL DOCUMENTS
    [Documentation]    OPEN EXCEL DOCUMENTS
    [Arguments]    ${DOC_NAME}
    Open Excel Document    ${CURDIR}/../../Tests/IGP_API/Test_Data/${DOC_NAME}    doc_id=doc1


GET USER DATA ROW INDEX
    [Documentation]    Get User data row index using sheet name and column value
    [Arguments]    ${SHEET_NAME}
    ${Columns_Names}=  Read Excel Column    1    sheet_name=${SHEET_NAME}
    log    ${Columns_Names}
    ${Total_Length}    Get Length    ${Columns_Names}
    Return From Keyword    ${Total_Length}


ADD OR UPDATE PET DATA
    [Documentation]    ADD OR UPDATE USER DATA
    [Arguments]    ${row}    ${PET_DATA_SHEET_NAME}

    # Reading all rows data from column 1
    ${strcol}=  Read Excel Row    1    sheet_name=${PET_DATA_SHEET_NAME}
    log    ${strcol}
    ${col_count}=    Get Length    ${strcol}

    # Reading data from the excel sheet and make a credential list
    @{Expected_Result}=    Create List

    ${Expected}  Read Excel Row   ${row}    max_num=3    sheet_name=${PET_DATA_SHEET_NAME}
    ${Pet_Name}  Read Excel Row   ${row}    max_num=2    sheet_name=${PET_DATA_SHEET_NAME}
    ${Pet_ID}  Read Excel Row   ${row}    max_num=1    sheet_name=${PET_DATA_SHEET_NAME}
    ${Pet_ID}    Convert To String    ${Pet_ID}[-1]
    ${Pet_Name}    Convert To String    ${Pet_Name}[-1]
    ${Expected_Result}    Set Variable    ${Expected}[-1]
    ${PET_CONFIG_DATA}    Replace String    ${PET_PUT_DATA}    PET_ID    ${Pet_ID}
    ${PET_CONFIG_DATA}    Replace String    ${PET_CONFIG_DATA}    PET_NAME    ${Pet_Name}
    ${Expected_Result}    Set Variable    ${Expected}[-1]

    log    ${PET_CONFIG_DATA}
    Return From Keyword    ${PET_CONFIG_DATA}    ${Expected_Result}
