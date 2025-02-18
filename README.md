# 🚀 Desafio Full Cycle - Imagem Docker com Go

Este desafio é muito empolgante, especialmente se você nunca trabalhou com a linguagem **Go**! 🎉

O objetivo é criar uma **imagem Docker superleve (<2MB)** que, ao ser executada, exibe a mensagem:

```
Full Cycle Rocks!!
```

## 🏆 **Requisitos do Desafio**
1. Criar uma **imagem Docker** que execute um programa em **Go**.
2. A imagem deve ser publicada no **Docker Hub**.
3. Ao executar o comando:
   ```sh
   docker run <seu-user>/fullcycle
   ```
   Deve exibir no terminal:
   ```
   Full Cycle Rocks!!
   ```
4. **A imagem precisa ter menos de 2MB**.

## 🛠️ **Passo a Passo**
### 1️⃣ Criando o código Go (`main.go`)
Crie um arquivo `main.go` com o seguinte código:

```go
package main

import "fmt"

func main() {
    fmt.Println("Full Cycle Rocks!!")
}
```

---

### 2️⃣ Criando o `Dockerfile`
Para que a imagem tenha **menos de 2MB**, utilizamos a imagem base `scratch` e compilamos um binário **estático**.

Crie um arquivo `Dockerfile` com o seguinte conteúdo:

```dockerfile
# Etapa de build
FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

# Compila um binário estático e otimizado
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o fullcycle .

# Imagem final mínima
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle

CMD ["/fullcycle"]
```

---

### 3️⃣ Construindo a Imagem Docker
Agora, execute o seguinte comando para **construir a imagem**:

```sh
docker build -t <seu-user>/fullcycle .
```

---

### 4️⃣ Testando a Imagem Localmente
Antes de publicar no Docker Hub, teste para garantir que a saída está correta:

```sh
docker run --rm <seu-user>/fullcycle
```

Saída esperada:
```
Full Cycle Rocks!!
```

---

### 5️⃣ Publicando no Docker Hub
1. **Faça login no Docker Hub**:
   ```sh
   docker login
   ```
2. **Envie a imagem para o Docker Hub**:
   ```sh
   docker push <seu-user>/fullcycle
   ```

---

## 📌 **Entrega do Desafio**
📌 Suba seu código no **GitHub** e compartilhe os links:
- 🔗 **Link do repositório GitHub** com o código-fonte.
- 🔗 **Link da imagem no Docker Hub**.

Exemplo:
- GitHub: `https://github.com/<seu-user>/fullcycle-docker-go`
- Docker Hub: `https://hub.docker.com/r/<seu-user>/fullcycle`

---

## 🎉 **Conclusão**
Parabéns! 🎉 Agora você tem uma **imagem Docker otimizada com Go** e publicada no Docker Hub! 🚀

Se tiver dúvidas, confira a documentação:
- 📘 [GoLang](https://golang.org/)
- 🐫 [Docker Hub](https://hub.docker.com/)
- 📦 [Docker Oficial](https://docs.docker.com/)

🔹 **Divirta-se e bora codar! 🚀** 🔹# fullcycle-docker-project
