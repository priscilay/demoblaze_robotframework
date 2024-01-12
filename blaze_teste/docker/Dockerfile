FROM python:3.9
FROM alpine:3.14

WORKDIR . /app

# Instale o Robot Framework
# RUN pip install robotframework
RUN pip install --upgrade pip
RUN apk --no-cache add libffi-dev
RUN pip install --no-cache-dir -r requirements.txt


# Copie o código-fonte para o diretório de trabalho
COPY . /app
RUN chmod +x /blaze_teste/blaze_test.robot

CMD ["robot", "blaze_test.robot"]

