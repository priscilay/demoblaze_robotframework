# Projeto de Automação de Testes com Robot Framework no site da demoblaze <br>

<br>
Este projeto contém casos de teste do Robot Framework para testar a funcionalidade da aplicação web [Site Demoblaze](https://www.demoblaze.com/). <br>
<br>

## Configuração do Ambiente  <br>
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
```robot -d ./reports blaze_test.robot``` <br>

## Visualizando resultados <br>
Dentro da pasta *reports* foi gerado o resultado dos testes, basta copiar o caminho do arquivo .html e setar no navegador para visualizar os resultados e logs.<br>

## Docker <br>
Iniciei a configuração do docker, porém em andamento pois ainda exibe alguns erros.



