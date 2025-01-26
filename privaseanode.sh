#!/bin/bash

echo "Gutso - V!."
echo "Privasea node kurulumu yükleniyor.."
sleep 1

# Docker kurulu mu değil mi kontrol et
if ! command -v docker &> /dev/null
    then
        echo "Docker bulunamadı. Docker yükleniyor..."
        # Docker ve Docker Compose yükleme
        sudo apt install docker.io -y
        sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose

        DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
        mkdir -p $DOCKER_CONFIG/cli-plugins
        curl -SL https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
        chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    else
    echo "Docker zaten kurulu, bir sonraki aşamaya geçiliyor."
fi

# Docker kullanıcı grubuna ekleme
sudo groupadd docker && sudo usermod -aG docker $(whoami) && newgrp docker

# Privasea kurulum dosyasını çekme 
docker pull privasea/acceleration-node-beta:latest

# Privasea dosyası ve kaydetme
mkdir -p ~/privasea/config && cd ~/privasea

# Anahtar deposu ve Docker konteynırını çalıştırma
docker run --rm -it -v "$HOME/privasea/config:/app/config" privasea/acceleration-node-beta:latest ./node-calc new_keystore

# Anahtar depsounu doğru konuma taşıma
mv $HOME/privasea/config/UTC--* $HOME/privasea/config/wallet_keystore
