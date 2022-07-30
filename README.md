---

<h1 align="center">Mikbotam</h1>
<h3 align="center">The Free Software For Mikrotik Management with Telegram bot</h3>

---

<p align="center">
<img alt="Logo Banner" src=""/>
</p>

---

MikroTik Bot Telegram (Mikbotam) is a web-based application that combines Mikrotik with a Telegram bot with the main function as hotspot management using a Telegram bot.
<br>
<br>
The image build on <a href="http://www.alpinelinux.org" target="_blank">Alpine Linux</a> and App Mikbotam from <a href="https://github.com/mikbotam/Mikbotam" target="_blank">BangAchil</a>.

---

## Supported Architectures
We utilise the docker manifest for multi-platform awareness. Simply pulling ```animegasan/mikbotam:latest``` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |
| armhf	| ✅	| arm32v7-\<version tag\> |

---

## Usage
Here are some example snippets to help you get started creating a container.
### docker-compose (recommended)
```yaml
---
version: "2.1"
services:
  mikbotam:
    image: animegasan/mikbotam:latest
    container_name: mikbotam
    ports:
      - 8080:80
    restart: unless-stopped
```
### docker cli

```bash
docker run -d \
  --name=mikbotam \
  -p 8080:80 \
  --restart unless-stopped \
  animegasan/mikbotam:latest
```
---

## Packages
The package used by this image are:
- nginx
- php7
- php7-fpm
- php7-gd
- php7-mbstring
- php7-mysqli
- php7-session
- php7-pdo_sqlite
- sqlite
- supervisor

---

## Version
### Version 4 Beta
* **4-4.2.2:**

---

## Credit
[BangAchil](https://github.com/BangAchil), [Hilman Maulana](https://github.com/animegasan).

---
