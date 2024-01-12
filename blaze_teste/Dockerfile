# Use uma imagem base com Python
FROM python:3.9

# Configuração do ambiente de trabalho
WORKDIR /app

# Atualiza a lista de pacotes e instala dependências
RUN apt-get update && \
    apt-get install -y wget unzip

# Configuração do ChromeDriver
ARG CHROMEDRIVER_VERSION=120.0.0
RUN wget -q -O chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver.zip && \
    rm chromedriver.zip && \
    mv chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver

# Copie os arquivos necessários para o diretório de trabalho
COPY . .

# Instale as dependências do Robot Framework
RUN pip install --no-cache-dir -r requirements.txt

# Comando padrão ao executar o contêiner
CMD ["robot", "blaze_test.robot"]
