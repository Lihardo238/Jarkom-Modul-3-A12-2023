# Jarkom-Modul-3-A12-2023
## Kelompok A12
## NAMA :
-	Shaula Aljauhara Riyadi 5025201265
-	Lihardo Marson Purba 5025211238

Link Project File GNS3 : [Google Drive]([https://drive.google.com/file/d/1qYOMEXRjm-oj1eiydeq2nt_Cq1JmGdXE/view?usp=sharing](https://drive.google.com/file/d/1HqHiiNFS-qm6wZEE60frbTISaiUCJ1Iw/view?usp=sharing))

### SOAL
**Perjalanan selanjutnya akan menggunakan peta berikut:**
![gambarModul3](https://github.com/ZhafranMZ/Jarkom-Modul-3-F11-2023/assets/114043452/44500189-4fca-4550-add7-f2a445ac7c53)

**Dengan ketentuan sebagai berikut:**
|Node|Kategori|Image Docker|Konfigurasi IP|
|----|--------|------------|--------------|
|Aura|Router (DHCP Relay)|danielcristh0/debian-buster:1.1|Dynamic|
|Himmel|DHCP Server|danielcristh0/debian-buster:1.1|Static|
|Heiter|DNS Server|danielcristh0/debian-buster:1.1|Static|
|Denken|Database Server|danielcristh0/debian-buster:1.1|Static|
|Eisen|Load Balancer|danielcristh0/debian-buster:1.1|Static|
|Frieren|Laravel Worker|danielcristh0/debian-buster:1.1|Static|
|Flamme|Laravel Worker|danielcristh0/debian-buster:1.1|Static|
|Fern|Laravel Worker|danielcristh0/debian-buster:1.1|Static|
|Lawine|PHP Worker|danielcristh0/debian-buster:1.1|Static|
|Linie|PHP Worker|danielcristh0/debian-buster:1.1|Static|
|Lugner|PHP Worker|danielcristh0/debian-buster:1.1|Static|
|Revolte|Client|danielcristh0/debian-buster:1.1|Dynamic|
|Richter|Client|danielcristh0/debian-buster:1.1|Dynamic|
|Sein|Client|danielcristh0/debian-buster:1.1|Dynamic|
|Stark|Client|danielcristh0/debian-buster:1.1|Dynamic|

Setelah mengalahkan Demon King, perjalanan berlanjut. Kali ini, kalian diminta untuk melakukan register domain berupa riegel.canyon.yyy.com untuk worker Laravel dan granz.channel.yyy.com untuk worker PHP (0) mengarah pada worker yang memiliki IP [prefix IP].x.1.

Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Kemudian, karena masih banyak spell yang harus dikumpulkan, bantulah para petualang untuk memenuhi kriteria berikut.:
1. Semua CLIENT harus menggunakan konfigurasi dari DHCP Server.
2. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80 (2)
3. Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168 (3)
4. Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut (4)
5. Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit (5)

Berjalannya waktu, petualang diminta untuk melakukan deployment.
1. Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3. (6)
2. Kepala suku dari Bredt Region memberikan resource server sebagai berikut:
   - Lawine, 4GB, 2vCPU, dan 80 GB SSD.
   - Linie, 2GB, 2vCPU, dan 50 GB SSD.
   - Lugner 1GB, 1vCPU, dan 25 GB SSD.

aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. (7)

3. Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
   - Nama Algoritma Load Balancer
   - Report hasil testing pada Apache Benchmark
   - Grafik request per second untuk masing masing algoritma.
   - Analisis (8)

4. Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)
5. Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/ (10)
6. Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)
7. Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168. (12) hint: (fixed in dulu clinetnya)

Karena para petualang kehabisan uang, mereka kembali bekerja untuk mengatur granz.channel.yyy.com.
1. Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern. (13)
2. Frieren, Flamme, dan Fern memiliki Granz Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer (14)
3. Granz Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.
   - POST /auth/register (15)
   - POST /auth/login (16)
   - GET /me (17)
5. Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Granz Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern. (18)
6. Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan
   - pm.max_children
   - pm.start_servers
   - pm.min_spare_servers
   - pm.max_spare_servers

sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.(19)

8. Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second. (20)


