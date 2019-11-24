# Como usar Terraform

## pré-requisitos local:
Voce precida ter instalado:
1. awscli
2. python
3. ansible
4. terraform

## pré-requisitos aws:
1. Voce precisa gerar uma ssh-key-pair, use o "chave"
[Tutorial aqui](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
2. Voce precisa de uma access-key e uam secret-key
[Tutorial aqui](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/)

## executando
1. cole uma cópia da chave ssh chave.pem [Neste diretório](desafios-devops/terraform/provisionamento/terraform/envs/prd/desafio)
2. entre na pasta

```bash
cd esafios-devops/terraform/provisionamento/terraform/envs/prd/desafio
```

```bash
terraform init
terraform plan
terraform apply
```

neste ponto será perguntado a região da aws em que será criada a máquina e o ip para acesso ssh.

após a execução será exibido o ip para acesssar o apache via navegador


----

# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Recursos de infraestrutura em nubvem devem sempre ser criados utilizando gerenciadores de configuração, tais como [Cloudformation](https://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) ou [Ansible](https://www.ansible.com/), garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

## Objetivo

- Criar uma instância **n1-standard-1** (GCP) ou **t2.micro** (AWS) Linux utilizando **Terraform**.
- A instância deve ter aberta somente às portas **80** e **443** para todos os endereços
- A porta SSH (**22**) deve estar acessível somente para um _range_ IP definido.
- **Inputs:** A execução do projeto deve aceitar dois parâmetros:
  - O IP ou _range_ necessário para a liberação da porta SSH
  - A região da _cloud_ em que será provisionada a instância
- **Outputs:** A execução deve imprimir o IP público da instância


## Extras

- Pré-instalar o docker na instância que suba automáticamente a imagem do [Apache](https://hub.docker.com/_/httpd/), tornando a página padrão da ferramenta visualizável ao acessar o IP público da instância
- Utilização de módulos do Terraform

## Notas
- Pode se utilizar tanto AWS quanto GCP (Google Cloud), não é preciso executar o teste em ambas, somente uma.
- Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/GCP.
- Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.