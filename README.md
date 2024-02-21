## Configuração e Gerenciamento do 3cx PBX em Docker

O ambiente criado integra o 3cx PBX em um container Docker na rede local, permitindo comunicações de voz via Internet por meio de SIP trunks. Os usuários podem se conectar ao PBX para fazer e receber chamadas, facilitando a comunicação interna e externa da organização.

<div style="text-align: center;">
    <img src="https://github.com/JoaoPedroRMatias/3cxPbx-Docker/assets/100814579/2e3ff68c-f0a0-4590-81ad-7ff2fc504855" alt="3cxPBX">
</div>

### 1. Construindo a Imagem Docker

```bash
# INICIAR
docker build -t 3cx:latest .
```

### 2. Executando o Contêiner Docker

```bash
docker run -d --privileged --name 3cx --network=host -p 5001:5001 -p 5060:5060 -p 5061:5061 -p 5090:5090 -p 5091:5091 -p 5015:5015 3cx
```

### 3. Acessando o Contêiner Docker

```bash
docker exec -it 3cx /bin/bash
```

### 4. Instalação do 3cx PBX

```bash
# INSTALAÇÃO
apt install 3cxpbx -y

# Após a instalação, continue o processo no ambiente web para configurar os serviços do PBX com as informações da licença e da rede.
```

### 5. Pós-Instalação

```bash
# RE-COLOCAR REPOSITÓRIO CASO NÃO PUXE AS INFORMAÇÕES DO REPOSITÓRIO DO DEBIAN
echo "deb http://deb.debian.org/debian/ bullseye main" >> /etc/apt/sources.list 
echo "deb-src http://deb.debian.org/debian/ bullseye main" >> /etc/apt/sources.list

# ATUALIZAR
apt update
apt upgrade -y
```

Este guia fornece os passos básicos para configurar e gerenciar o 3cx PBX em um ambiente Docker. Certifique-se de ajustar as configurações de acordo com suas necessidades específicas.
