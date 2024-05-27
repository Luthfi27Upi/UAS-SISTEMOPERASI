#!/bin/bash

# Menampilkan menu
echo "Pilih operasi yang ingin Anda lakukan:"
echo "1. Lihat isi file"
echo "2. Copy file"
echo "3. Hapus file"
echo "4. Buat file"
echo "5. Ganti nama file"
echo "6. Lihat isi direktori"
echo "7. Keluar"

# Membaca input dari pengguna
read -p "Masukkan pilihan Anda: " pilihan

# Implementasi switch-case
case $pilihan in
    1)
        # Lihat isi file
        read -p "Masukkan nama file yang ingin dilihat: " nama_file
        if [ -f "$nama_file" ]; then
            cat "$nama_file"
        else
            echo "File tidak ditemukan."
        fi
        ;;
    2)
        # Copy file
        read -p "Masukkan nama file yang ingin disalin: " nama_file_sumber
        if [ -f "$nama_file_sumber" ]; then
            read -p "Masukkan nama file tujuan: " nama_file_tujuan
            cp "$nama_file_sumber" "$nama_file_tujuan"
            echo "File berhasil disalin."
        else
            echo "File sumber tidak ditemukan."
        fi
        ;;
    3)
        # Hapus file
        read -p "Masukkan nama file yang ingin dihapus: " nama_file_hapus
        if [ -f "$nama_file_hapus" ]; then
            rm "$nama_file_hapus"
            echo "File berhasil dihapus."
        else
            echo "File tidak ditemukan."
        fi
        ;;
    4)
        # Buat file
        read -p "Masukkan nama file yang ingin dibuat: " nama_file_baru
        touch "$nama_file_baru"
        echo "File berhasil dibuat."
        ;;
    5)
        # Ganti nama file
        read -p "Masukkan nama file yang ingin diganti: " nama_file_lama
        if [ -f "$nama_file_lama" ]; then
            read -p "Masukkan nama file baru: " nama_file_baru
            mv "$nama_file_lama" "$nama_file_baru"
            echo "Nama file berhasil diganti."
        else
            echo "File tidak ditemukan."
        fi
        ;;
    6)
        # Lihat isi direktori
        read -p "Masukkan nama direktori yang ingin dilihat: " nama_direktori
        if [ -d "$nama_direktori" ]; then
            ls -l "$nama_direktori"
        else
            echo "Direktori tidak ditemukan."
        fi
        ;;
    7)
        # Keluar dari skrip
        echo "Terima kasih telah menggunakan skrip ini."
        exit 0
        ;;
    *)
        echo "Pilihan tidak valid."
        ;;
esac
