## ------------------------------------------------------------------------------
## Summary :: Variables for User Access end point in Test Automation Framework
##
## File    :: User_Access_Variables.robot
##
## Creator :: Mamta Jain (mjain@prosoft-technology.com)
##
## Usage   ::  Test Data to be used in the API Test Cases
## ------------------------------------------------------------------------------
Authorization =  ["petstore.swagger.io"]
Content_Type="application/json"
PET_PUT_DATA ='{"id": PET_ID,"category": {"id": PET_ID,"name": "PET_NAME"},"name": "PET_NAME","photoUrls": ["string"],"tags": [{"id": PET_ID,"name": "PET_NAME"}],"status": "available"}'
PET_PUT_ADD_SHEET_NAME = "Pet_Add_Data_Sheet"
PET_PUT_UPDATE_SHEET_NAME = "Pet_Update_Data_Sheet"
USER_AND_PET_EXCEL_NAME = "User_And_Pet_Data.xlsx"
