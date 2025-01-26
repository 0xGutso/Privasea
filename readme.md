1. Kopyala ve CLI'ya yapıştır

```
source <(wget -0 https://raw.githubusercontent.com/0xGutso/Privasea/main/privaseanode.sh)
```

Adresini kopyala yapıştır

```
cd privasea/config
```
```
sudo cat wallet_keystore
```
- Siteye git [Privasea DeepSea](https://deepsea-beta.privasea.ai/privanetixNode)
- Mobil uygulamadaki "Ödül cüzdanınınz" olan aynı cüzdan ile siteye bağlanıp, Node'a isim ver, komisyon ayarla (%1), ve daha sonra node adresini girelim.
- Aşağıdaki komut satırını da SIFRENIZ bölümü ile değiştirip başlatın.

```
KEYSTORE_PASSWORD=SIFRENIZ && docker run -d --name privanetix-node -v "$HOME/privasea/config:/app/config" -e KEYSTORE_PASSWORD=$KEYSTORE_PASSWORD privasea/acceleration-node-beta:latest
```