echo "CRIANDO IMAGEM DOCKER"
docker build -t demoblaze_tests .

echo "EXECUTANDO DOCKER"
docker run demoblaze_tests
