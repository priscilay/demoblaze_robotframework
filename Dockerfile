# Use uma imagem base com Python
FROM python:3.9

# Configuração do ambiente de trabalho
WORKDIR /app

# Atualiza a lista de pacotes e instala dependências
RUN apt-get update && \
    apt-get install -y wget unzip

# Configuração do ChromeDriver
ARG CHROMEDRIVER_VERSION=120.0.6099.109 
# RUN mkdir -p /usr/local/bin/chromedriver 
RUN wget -q -O chromedriver-linux64.zip https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip 
RUN unzip chromedriver-linux64.zip 
RUN rm chromedriver-linux64.zip
RUN cd chromedriver-linux64
RUN mv chromedriver-linux64 /usr/local/bin/chromedriver 
RUN chmod +x /usr/local/bin/chromedriver

# Copie os arquivos necessários para o diretório de trabalho
COPY . .

# Instale as dependências do Robot Framework
RUN pip install --no-cache-dir -r requirements.txt

# Comando padrão ao executar o contêiner
CMD ["robot", "blaze_test.robot"]
