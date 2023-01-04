*** Settings ***
Library    SeleniumLibrary

*** keywords ***

Abrir Navegador
    Open Browser    https://bugbank.netlify.app/    chrome

Fechar Navegador
    Close Browser

*** Settings ***
Test Setup                Abrir navegador
Test Teardown             Fechar navegador

*** Keywords ***
Acessar site
    Sleep       10

Inserir email
    Sleep       10
    Input Text          //*[@id="__next"]/div/div[2]/div/div[1]/form/div[1]/input               teste@gmail.com

Inserir senha
    Sleep       10
    Input Text           //*[@id="__next"]/div/div[2]/div/div[1]/form/div[2]/div/input               123456

Clicar em acessar
    Sleep       10
    Click Element       //*[@id="__next"]/div/div[2]/div/div[1]/form/div[3]/button[1]
    Sleep       10

*** Test Case ***

Caso de Teste 01 - Validar tela inicial e inserir dados
    Acessar site
    Inserir email
    Inserir senha
    Clicar em acessar