*** Settings ***
Resource    ../resources/api_testing.resource

*** Variables ***


*** Test Cases ***
Case 01 - Create new User
    Create a New User
    Register New User
    Verify the User

