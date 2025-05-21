# **9SOAT-G82-MC-KING**
## **Tech Challenge FIAP - 9SOAT - Grupo 82**

### **Pipeline Status**
[![Build](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4/actions/workflows/build.yml/badge.svg)](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4/actions/workflows/build.yml)

[![Deploy](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4/actions/workflows/deploy.yml/badge.svg)](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4/actions/workflows/deploy.yml)


## **Participantes**
- **Mayara Manzi** - RM359734 - [mayaramanzi@hotmail.com](mailto:mayaramanzi@hotmail.com)
- **Renan Eustaquio Claudiano Martins** - RM359737 - [renan.ecm@outlook.com](mailto:renan.ecm@outlook.com)

---

## **Objetivo**
Este projeto tem como objetivo implementar um **sistema de autoatendimento** para uma lanchonete que está em **expansão** devido ao seu grande sucesso. O foco principal é **melhorar a experiência do cliente**, garantindo um **processo eficiente de pedidos**, **redução de tempo de espera** e **minimização de erros** no atendimento.

### **Benefícios Esperados**
✅ **Melhoria na eficiência do atendimento** → Redução do tempo de espera dos clientes e maior precisão nos pedidos.  
✅ **Aumento da satisfação dos clientes** → Oferecer um sistema moderno e intuitivo.  
✅ **Maior escalabilidade do sistema** → Preparar a lanchonete para um futuro crescimento sustentável.  

---

## **Entregáveis - FASE 4**
Nesta fase, vamos **refatorar** o projeto existente, separando-o em **microsserviços** e garantindo **testes robustos**. As principais melhorias são:

### **1. Refatoração para Microsserviços**
Agora, o projeto será dividido em **ao menos três microsserviços**, cada um com suas próprias responsabilidades:
- **Pedido** → Responsável por registrar pedidos, listar os pedidos ativos e fornecer informações para acompanhamento do cliente. - Mantivemos o **PostgreSQL**
- **Pagamento** → Gerencia a cobrança de pedidos, registra pagamentos e atualiza o status conforme o retorno do processador de pagamento. - Utilizamos o **DynamoDB**
- **Produção** → Coordena o fluxo de produção dos pedidos, disponibilizando uma visão organizada para a cozinha e atualizando os status de cada etapa. - Utlizamos **AmazonSQS**

📌 **Importante**: Cada serviço terá seu **próprio banco de dados**, sendo obrigatório o uso de **um banco SQL e um NoSQL**. A comunicação entre serviços será feita **via mensagens em fila (Amazon SQS) ou chamadas diretas**, sem acesso direto ao banco de outro serviço.

### **2. Testes Unitários e BDD**
✔ **Todos os microsserviços** devem conter **testes unitários abrangentes**.  
✔ Pelo menos **um dos fluxos de teste** deve seguir a abordagem **BDD (Behavior Driven Development)**.  
✔ **Cobertura mínima de testes** → **80%** em todos os projetos.  

### **3. Separação de Repositórios e CI/CD**
Cada microsserviço terá **seu próprio repositório** e deverá seguir **regras de versionamento e proteção**:
- **Branches protegidas** → `main/master` não permitem commits diretos.
- **Pull Requests** → Devem validar **builds**, **qualidade de código via SonarQube** e manter pelo menos **70% de coverage**.
- **Deploy Automatizado** → No merge, todos os microsserviços devem ser **implantados via CI/CD**, garantindo a execução correta do sistema distribuído.

---

## **Principais Tecnologias Utilizadas**
### 🛠 **Backend**
- **.NET 8.0** → Plataforma para microsserviços.
- **AWS Lambda** → Para funções serverless.
- **Amazon SQS** → Mensageria entre microsserviços.
- **AWS Cognito** → Sistema de autenticação.

### 📊 **Banco de Dados**
- **DynamoDB** → Banco NoSQL para alta escalabilidade.
- **AWS RDS (PostgreSQL)** → Banco SQL gerenciado para transações estruturadas.

### 🛠 **Infraestrutura e CI/CD**
- **AWS EKS** → Kubernetes gerenciado.
- **AWS VPC** → Controle de rede privada.
- **AWS Secrets Manager** → Gerenciamento seguro de credenciais.
- **Terraform** → Provisionamento de infraestrutura como código.
- **Liquibase** → Versionamento de banco de dados.

---

**Implementação de CI/CD segregado por repositórios - executar na seguinte ordem:**
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-vpc-Fase4)** para infraestrutura VPC via Terraform.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-rds-Fase4)** para infraestrutura de banco de dados gerenciáveis via Terraform.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4)** para infraestrutura Kubernetes via Terraform.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-lambda-Fase4)** para o Lambda.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-mcking-liquibase-Fase4)** para versionamento do banco com Liquibase.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-mckingapi-Fase4)** para a aplicação executada no Kubernetes - **Pedido**.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-mcking-pagamento-api-Fase4)** para a aplicação executada no Kubernetes - **Pagamento**.
   - 🔗 **[**1 repositório**](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-mcking-producao-api-Fase4)** para a aplicação executada no Kubernetes - **Produção**.
   
---  

## Guia de Setup do Projeto Terraform Local
Este guia descreve o processo de configuração do ambiente para rodar o projeto localmente utilizando Terraform.

### Clonar o Repositório
Clone o repositório do projeto para sua máquina local e abra um terminal na raiz do projeto.

```sh
 git clone https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-terraform-eks-Fase4.git
```

### Configuração das Credenciais AWS
Configure suas credenciais AWS no arquivo:
```
~/.aws/credentials
```

### Rodando o Terraform
Na raiz do repositório, entre no diretório `./Terraform` (onde estão todos os scripts Terraform) e execute os seguintes comandos no terminal:

#### Inicializando o Terraform
```sh
terraform init
```

#### Validando os scripts Terraform
```sh
terraform validate
```

#### Verificando o plano de implantação
```sh
terraform plan
```

#### Aplicando o plano de implantação
```sh
terraform apply
```


---

## **Conclusão**
A Fase 4 foca na **evolução arquitetural** do sistema, garantindo que **microsserviços bem estruturados**, **testes robustos** e **deploys automatizados** tornem o projeto **mais escalável, seguro e eficiente**. 🚀💡  

Caso tenha alguma dúvida ou sugestão, entre em contato!  
📩 **E-mails dos responsáveis:**  
- 📌 **Mayara Manzi** → _[mayaramanzi@hotmail.com](mailto:mayaramanzi@hotmail.com)_
- 📌 **Renan Eustaquio Claudiano Martins** → _[renan.ecm@outlook.com](mailto:renan.ecm@outlook.com)_

---

### 🔗 **FIAP Tech Challenge - 9SOAT | Grupo 82** 🚀  
