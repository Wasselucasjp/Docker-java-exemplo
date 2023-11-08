# Dockerizando uma Aplicação Java com Spring

Este guia fornece instruções detalhadas sobre como criar um contêiner Docker para executar uma aplicação Java com Spring. O processo é explicado passo a passo no Dockerfile.

## Passo a Passo

### 1. Escolhendo a Imagem Base
No Dockerfile, selecionamos uma imagem do Docker baseada no OpenJDK 17. Essa escolha representa a "máquina mágica" que já possui o Java 17 instalado e é extremamente leve. Isso simplifica a configuração do ambiente.

```Dockerfile
FROM openjdk:17-jdk-alpine
````
### 2 .Criando um Espaço para a Aplicação
Aqui, estamos instruindo o Docker a criar um diretório chamado /app dentro da máquina virtual. Este diretório será o "espaço" reservado para a nossa aplicação.
```
RUN mkdir /app
```
### 3. Direcionando para o Espaço da Aplicação
Essa linha indica ao Docker que, quando alguém entrar na máquina virtual, deve se encontrar automaticamente no diretório /app. É como abrir a porta da máquina e entrar no "espaço" onde nossa aplicação será executada.
```
WORKDIR /app
```
### 4. Adicionando a Aplicação
Aqui, estamos copiando o nosso "brinquedo" (um arquivo JAR) do nosso computador real, localizado na pasta "target", para o "espaço" da máquina virtual com o nome "app.jar".
```
COPY target/*.jar /app/app.jar
```
##.5 Iniciando a Aplicação
Nesta etapa, estamos instruindo o Docker a realizar a ação específica de iniciar a aplicação quando a máquina virtual é ligada.
O comando CMD diz ao Docker para usar a linguagem de programação Java para executar o nosso arquivo "app.jar".
Isso é semelhante a pressionar um botão que faz a nossa aplicação Java com Spring começar a funcionar.
É a ação de colocar a aplicação em execução assim que a máquina virtual é ativada.

```
CMD ["java","-jar","/app/app.jar"]
```
