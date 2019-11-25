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

# Como usar Kubernets


Para este caso usei helm, então entre no diretorio desafios-devops/kubernetes e execute

```bash
helm install app-chart app-chart/
```
a aplicação estara disponivel na porta 3000

a imagem docker esta no [dockerhub](https://hub.docker.com/r/g4b1s/desafio)