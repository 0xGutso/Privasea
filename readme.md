## Privasea Privanetix Node Kurulumu

-  Kopyala ve CLI'ya yapıştır + çalıştır

```
bash <(curl -s https://raw.githubusercontent.com/0xGutso/Privasea/refs/heads/main/privaseanode.sh)
```

Kurulum tamamlanınca şifrenizi oluşturun. Bu şifreyi daha sonra kullanacağız.

Ekranda bilgiler gözüktü ise devam ediyoruz.
Örn: 
```
node address: 0xf07c3eF23ae7BEb8CD8bA5fF546E35Fd4b332B34
node filename: keystore:///app/config/UTC--2025-01-06T06-11-07.485797065Z--f07c3ef23ae7beb8cd8ba5ff546e35fd4b332b34
```
Bunu iki aşama sonrasındaki işlem için gireceğiz aklımızda dursun. 
```
cd privasea/config
mkdir -p  /privasea/config && cd  /privasea
docker run -it -v "/privasea/config:/app/config"  \
```
- Aşağıda da ./UTC ile başlayan kısımdan itibaren yukarıda verilen bilgileri gireceğiz ve bu bilgileri dosya haline getireceğiz. Yukarıda ``node filename`` kısmındaki /UTC kısmından kopyalayıp aşağıdaki ile değiştireceğiz
```
    cd /privasea/config && ls
    mv ./UTC--2025-01-06T06-11-07.485797065Z--f07c3ef23ae7beb8cd8ba5ff546e35fd4b332b34  ./wallet_keystore 
    ls
```
En sonki komut ile çıktı olarak wallet_keystore yazıyor ise sonraki aşamaya devam ediyoruz.

- Siteye git [Privasea DeepSea](https://deepsea-beta.privasea.ai/privanetixNode)
- Mobil uygulamadaki "Ödül cüzdanınınz" olan aynı cüzdan ile siteye bağlanıp, Node'a isim ver, komisyon ayarla (önerilen %2), ve daha sonra şifre belirledikten sonra gelen ``node adress`` kısmını kopyalayıp buraya yapıştırıp girelim.

En sonda böyle gözüküyor ise tamamsınız, task olduğu zaman kendi yapıyor zaten.
https://prnt.sc/xYSBIPO3I9Ey

- Kontrol için SFTP

```
docker logs -f CONTAINER_ID          
```