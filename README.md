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

#Como iniciar a aplicação 

Docker build: Este comando é usado para criar uma imagem Docker a partir de um Dockerfile e de todos os recursos necessários.

-t nome: A opção -t permite que você atribua um nome à imagem que está sendo construída. Neste caso, "nome" é o nome que você está dando para a imagem. Você pode escolher qualquer nome que desejar, geralmente relacionado ao seu projeto ou aplicação.

.: O ponto (.) no final do comando indica o contexto de construção. O contexto é o diretório no seu sistema de arquivos local onde o Docker procura o Dockerfile e quaisquer outros recursos que você deseja incluir na imagem. O ponto (.) significa que o Docker deve usar o diretório atual como contexto.

Portanto, quando você executa esse comando, o Docker procura um Dockerfile no diretório atual, constrói uma imagem com base nesse Dockerfile e atribui o nome especificado (neste caso, "nome") a essa imagem. A imagem resultante estará pronta para ser usada para criar contêineres Docker que executem sua aplicação.

```
docker build -t nome .
```
# Rodando aplicação
docker run: Este comando é usado para criar e executar um contêiner Docker a partir de uma imagem.

-p porta:porta: A opção "-p" é usada para mapear portas entre o sistema operacional host e o contêiner. Portanto, você especifica a porta do sistema operacional host seguida pela porta no contêiner, separadas por dois pontos. Isso permite que o tráfego seja redirecionado da porta do sistema operacional host para a porta do contêiner. Por exemplo, se você usar "-p 8080:80", está mapeando a porta 8080 do sistema operacional host para a porta 80 do contêiner. Isso é útil para acessar serviços executados no contêiner a partir do host ou da rede externa.

nomedaimagem: Substitua "nomedaimagem" pelo nome da imagem Docker que você deseja usar para criar o contêiner. O Docker criará um novo contêiner com base nessa imagem e o iniciará.

Portanto, quando você executa esse comando, o Docker cria um novo contêiner com base na imagem especificada e configura a porta para redirecionar o tráfego da porta do sistema operacional host para a porta do contêiner. Isso permite que você acesse os serviços dentro do contêiner através da porta mapeada no sistema operacional host. Por exemplo, se você usar "-p 8080:80", poderá acessar os serviços do contêiner na porta 80 através da porta 8080 do sistema operacional host.
```
docker run -p 8080:8080 nomedaimagem 
```
