#!/bin/bash

# Minta input dari pengguna.
echo "Masukkan nama lokasi: "
location_name=$(echo) 
echo "Masukkan deskripsi lokasi: " 
location_description=$(echo) 
echo "Masukkan domain: "
domain=$(echo) 
echo "Masukkan nama node: "
node_name=$(echo) 
echo "Masukkan RAM (dalam MB): " 
ram=$(echo) 
echo "Masukkan jumlah maksimum disk space (dalam MB): " 
disk_space=$(echo) 
echo "Masukkan Locid: " 
locid=$(echo) 

# Ubah ke direktori pterodactyl
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:location:make <<EOF
$location_name
$location_description
EOF

# Membuat node baru
php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

echo "Proses pembuatan lokasi dan node telah selesai."
