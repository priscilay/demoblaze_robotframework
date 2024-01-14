*** Settings ***
Library     SeleniumLibrary
Library     String
Library     FakerLibrary



*** Variable ***
${BROWSER}                      chrome
${URL}                          https://www.demoblaze.com
${MENU_PHONES}                  //a[@class="list-group-item"][(text()="Phones")]
${MENU_LAPTOPS}                 //a[@class="list-group-item"][(text()="Laptops")]
${MENU_MONITORES}               //a[@class="list-group-item"][(text()="Monitors")]
${CONTADOR}                     1

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
    ${num_aleatoria}    Generate Random String     length=4    chars=[NUMBERS]
    ${nome_aleatorio}    Name
    Set Test Variable  ${username}      ${nome_aleatorio}${num_aleatoria}
    Log To Console     ${username}
    # ${palavra_aleatoria}    Convert To Lower Case      ${palavra_aleatoria}  
    Set Suite Variable      ${username_teste}          ${username}
    Sleep                            1
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
Dado que o usuario ja possui cadastro no site demoblaze    
    Login

Quando adicionar no carrinho um celular, um monitor e computador
    Adicionando produto "${MENU_PHONES}""Samsung galaxy s6"
    Adicionando produto "${MENU_LAPTOPS}""Sony vaio i5"
    Execute JavaScript    window.scrollTo(0,700)
    Sleep                 3
    # Aqui usei sleep pq o wait nenhum dos quais olhei na documentação funcionou
    # Mas acho valido por nao se tratar de um teste de performance 
    # e sim uma automação de funcionalidade e ter poucos testes
    Adicionando produto "${MENU_MONITORES}""Apple monitor 24"
    
Adicionando produto "${menu}""${produto}"
    Set Test Variable               ${prd_selecionado}    ${produto}
    ${menu_txt}     Get Text        ${menu}
    Set Test Variable               ${menutxt}   ${menu_txt}
    Sleep                            2
    Set Focus To Element             locator=${menu} 
    Wait Until Element Is Visible    locator=${menu} 
    Click Element                    locator=${menu} 
    Wait Until Element Is Visible    locator=//a[contains(.,'${produto}')]
    Execute JavaScript               window.scrollTo(0,700)
    Click Element                    locator=//a[contains(.,'${produto}')]
    Wait Until Element Is Visible    locator=//a[contains(.,'Add to cart')]
    Click Element                    locator=//a[contains(.,'Add to cart')]
    Alert Should Be Present          text=Product added.      action=ACCEPT
    Click Element                    locator=//a[contains(.,'Home (current)')]
    # Não clicar no menu home apos add monitor

# Não clicar no menu home apos add monitor
    # ${total_linhas}   Get Element Count    locator=//tbody/tr
    # ${linhas_int}     Convert To Integer    ${total_linhas}
    # IF  "${menutxt}" != "Monitors" 
        # WHILE  ${CONTADOR} <= ${linhas_int}
            # Click Element                locator=//a[contains(.,'Home (current)')]
            # ${CONTADOR}    Evaluate     ${CONTADOR} + 1
        # END
    # END
# TESTEI A SOLUCAO ACIMA PRA NAO SAIR DO CARRINHO APOS O ULTIMO ITEM
# MAS PEGUEI UM ERRO Q NAO CONSEGUI RESOLVER A TEMPO DO PRAZO QUE PROMETI
# ERRO: 'While' is a reserved keyword. ENTAO ESTOU RETORNANDO PARA O CARRINHO NORMALMENTE

E dentro do carrinho remova o "monitor"
    Click Element                        locator=//a[contains(.,'Cart')]
    Wait Until Element Is Visible        locator=//tr[contains(.,'${prd_selecionado}')]//a[contains(.,'Delete')] 
    Click Element                        locator=//tr[contains(.,'${prd_selecionado}')]//a[contains(.,'Delete')]  

Então atualize a página e confirme a remoção do item
    Reload Page
    Page Should Not Contain Element      locator=//td[contains(.,'${prd_selecionado}')]   
    Wait Until Page Contains             text=Delete
 

    
     



 
