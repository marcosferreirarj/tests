*** Settings ***
Library    RequestsLibrary    
Library    String
Library    Collections

*** Keywords ***
Create a New User
    ${random_word}    Generate Random String  length=4  chars=[LETTERS] 
    ${random_word}    Convert To Lower Case    ${random_word}   
    Log    Random Word: ${random_word}@emailtest.com
    Set Test Variable    ${email}    ${random_word}@emailtest.com
    Log    ${email}

Register New User
    ${body}    Create Dictionary    
    ...    nome=Marcos Ferreira    
    ...    email=${email}
    ...    password=teste
    ...    administrador=true 
    Log    ${body}
    Create Session Api
    ${response}    POST On Session        
    ...    alias= ServeRest
    ...    url=/usuarios
    ...    json=${body}
    
    Log    ${response.json()}
    Set Test Variable    
    ...    ${response}    
    ...    ${response.json()}

Create Session Api
    ${headers}    Create Dictionary    
    ...    accept=application/json
    ...    Content-Type=application/json
    Create Session    
    ...    alias=ServeRest    
    ...    url=https://serverest.dev
    ...    headers=${headers}
    
Verify the User
    Log    ${response}
    Dictionary Should Contain Item    dictionary=${response}
    ...    key=message    
    ...    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response}    _id