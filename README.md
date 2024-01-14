# Projeto de Automação de Testes com Robot Framework no site da demoblaze <br>

<br>
Este projeto contém casos de teste do Robot Framework para testar a funcionalidade da aplicação web [Site Demoblaze](https://www.demoblaze.com/). <br>
<br>


<a name="Configuração do Ambiente"></a>
## Configuração do Ambiente <br>
- Preferencia pelas versões ```Robot Framework 5.0.1 (Python 3.6.9 on linux)``` no Windows também <br>
- Instale o Python e o pip se ainda não estiverem instalados. <br>
- Para validar versões instaladas no terminal: <br>
```python --version``` <br>
```pip --version``` <br>

- Instale o Robot Framework. <br>
- Para validar versão instaladas no terminal: <br>
```robot --version``` <br>

-	Configure o chromedriver local de acordo com a versão do seu navegador Chrome(esses testes serão realizados apenas no navegador chrome por enquanto) <br>


## Executando os Testes <br>
- Para executar a Suite de testes e salvar o report em uma pasta separada, use o seguinte comando: <br>
```robot -d ./reports tests/blaze_test.robot``` <br>

## Visualizando resultados <br>
Dentro da pasta *reports* foi gerado o resultado dos testes, basta copiar o caminho do arquivo .html e setar no navegador para visualizar os resultados e logs.<br>

## Docker (opção de execução de testes em esteiras)<br>
- Tenha Docker instalado em seu ambiente <br>
- Execute o arquivo ***run.sh*** com comando sh <br>
```sudo sh run.sh``` <br>
Obs.: Ainda não recomendo a execução através do Dockerfile pois ainda estou resolvendo um erro de path do chromedriver dentro da imagem, mas vale executar para ver parte funcionando. Também ainda não encontrei uma imagem docker que ja tenha o chromedriver na versão necessária.


