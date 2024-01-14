echo "CRIANDO IMAGEM DOCKER"
docker build -t blaze_teste .

echo "EXECUTANDO DOCKER"
docker run blaze_teste
