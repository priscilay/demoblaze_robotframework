*** Settings ***
Library         SeleniumLibrary
Resource        blaze_resource.robot
Test Setup      Abra o navegador e entre no site da https://www.demoblaze.com
Test Teardown   Feche o navegador

*** Variable ***


*** Test Cases ***

Teste 01 - Criação de conta com sucesso
    [Documentation]     Esse teste cria conta de usuario na demoblaze 
    [Tags]              cadastrar
    Dado que usuario ainda nao possui conta e necessita realizar um cadastro
    Quando preencher os dados pessoais e clicar em salvar
    Entao a conta deve ser criada com sucesso

Teste 02 - Compra com 3 produtos no carrinho
    [Documentation]     Esse teste realiza o CRUD do carrinho de compras da demoblaze
    Adição no carrinho de um celular, um monitor e um computador.
    Já dentro do carrinho, remova o monitor, atualize a página e confirme a remoção do item
# Construa o projeto em cima do site https://www.demoblaze.com . 
# Após finaliza-lo, suba o projeto para o GitHub e crie um arquivo README.md com as instruções necessárias para que possamos executar o projeto. 
# Sinta-se livre para criar cenários, validações e incluir qualquer outra tecnologia ou ferramenta que você entenda como relevante e queira demonstrar.