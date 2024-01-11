*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variable ***
${BROWSER}                      chrome
${URL}                          https://www.demoblaze.com
${MENU_LAPTOP}                  //a[contains(.,'Laptops')]

*** Keywords ***

Abra o navegador e entre no site da https://www.demoblaze.com
    Close All Browsers 
    Open Browser                 browser=${BROWSER}
    Maximize Browser Window 
# options=add_experimental_option("detach", True)  
    Go To                        url=${URL}
    Wait Until Page Contains     text=PRODUCT STORE             

Feche o navegador
    Capture Page Screenshot
    Close Browser

Dado que usuario ainda nao possui conta e necessita realizar um cadastro    
    Click Element         locator=signin2

Quando preencher os dados pessoais e clicar em salvar
    ${palavra_aleatoria}    Generate Random String     length=7    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case      ${palavra_aleatoria}  
    Set Suite Variable      ${username_teste}          ${palavra_aleatoria}
    Wait Until Element Is Visible    locator=//input[@id='sign-username']
    Input Text                       locator=//input[@id='sign-username']      text=${username_teste}
    Input Text                       locator=//input[@id='sign-password']      text=123456
    Click Button                     locator=//button[@onclick='register()']   

Entao a conta deve ser criada com sucesso
    Alert Should Be Present   text=Sign up successful.    action=ACCEPT


Login
    Click Element                    locator=login2
    Wait Until Element Is Visible    locator=loginusername
    Input Text                       locator=loginusername         text=${username_teste}
    Wait Until Element Is Visible    locator=loginpassword
    Input Text                       locator=loginpassword         text=123456
    Click Button                     locator=//button[contains(.,'Log in')]

Compra com 3 produtos no carrinho
    Login
    Click Element         locator=//h4[@class='card-title'][contains(.,'Samsung galaxy s6')]





 
