#!/bin/bash

echo "=========================================="
echo "|           Luthfi Triaswangga           |"
echo "|           UAS Sistem Operasi           |"
echo "|               2341720208               |"
echo "=========================================="
echo "|       $(date)     |"
echo "=========================================="
echo "| Pilih operasi yang ingin Anda lakukan: |"
echo "| 1.  Lihat isi direktori                |"
echo "| 2.  Lihat isi file                     |"
echo "| 3.  Create file                        |"
echo "| 4.  Copy file                          |"
echo "| 5.  Delete file                        |"
echo "| 6.  Rename file                        |"
echo "| 7.  Edit file                          |"
echo "| 8.  Cek koneksi proxy                  |"
echo "| 9.  Pindahkan file ke folder           |"
echo "| 10. Create folder                      |"
echo "| 11. Delete folder                      |"
echo "| 12. Compress folder                    |"
echo "| 13. Extract folder                     |"
echo "| 0.  Keluar                             |"
echo "=========================================="

read -p "Masukkan pilihan Anda: " pilihan 

case $pilihan in
    1)
        ls
        ./luthfiuas.sh
        ;;
    2)
        read -p "Masukkan nama file yang ingin dilihat: " nama_file
        if [ -f "$nama_file" ]; then
            cat "$nama_file"
        else
            echo "File tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    3)
        read -p "Masukkan nama file yang ingin dibuat: " nama_file_baru
        nano "$nama_file_baru"
        echo "File berhasil dibuat."
        ./luthfiuas.sh
        ;;
    4)
        read -p "Masukkan nama file yang ingin disalin: " nama_file_sumber
        if [ -f "$nama_file_sumber" ]; then
            read -p "Masukkan nama file tujuan: " nama_file_tujuan
            cp "$nama_file_sumber" "$nama_file_tujuan"
            echo "File berhasil disalin."
        else
            echo "File sumber tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    5)
        read -p "Masukkan nama file yang ingin dihapus: " nama_file_hapus
        if [ -f "$nama_file_hapus" ]; then
            rm "$nama_file_hapus"
            echo "File berhasil dihapus."
        else
            echo "File tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    6)
        read -p "Masukkan nama file yang ingin diganti: " nama_file_lama
        if [ -f "$nama_file_lama" ]; then
            read -p "Masukkan nama file baru: " nama_file_baru
            mv "$nama_file_lama" "$nama_file_baru"
            echo "Nama file berhasil diganti."
        else
            echo "File tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    7)
        read -p "Masukkan nama file yang ingin diedit: " nama_file_edit
        if [ -f "$nama_file_edit" ]; then
            nano "$nama_file_edit"
            echo "File berhasil diedit."
        else
            echo "File tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    8)
        read -p "Masukkan alamat proxy (format: http://proxyserver:port): " proxy
        if curl -x "$proxy" -Is http://www.google.com | grep "HTTP/"; then
            echo "Proxy bekerja dengan baik."
        else
            echo "Proxy tidak bekerja atau tidak dapat dihubungi."
        fi
        ./luthfiuas.sh
        ;;
    12)
        read -p "Masukkan nama folder yang ingin dikompres: " nama_folder
        read -p "Masukkan nama file arsip (misal: arsip.tar.gz): " nama_arsip
        if [ -d "$nama_folder" ]; then
            tar -czvf "$nama_arsip" "$nama_folder"
            echo "Folder berhasil dikompres menjadi $nama_arsip."
        else
            echo "Folder tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    13)
        read -p "Masukkan nama file arsip yang ingin diekstrak: " nama_arsip
        read -p "Masukkan direktori tujuan: " direktori_tujuan
        if [ -f "$nama_arsip" ]; then
            mkdir -p "$direktori_tujuan"
            tar -xzvf "$nama_arsip" -C "$direktori_tujuan"
            echo "File arsip berhasil diekstrak ke $direktori_tujuan."
        else
            echo "File arsip tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    10)
        read -p "Masukkan nama folder yang ingin dibuat: " nama_folder_baru
        mkdir -p "$nama_folder_baru"
        echo "Folder berhasil dibuat."
        ./luthfiuas.sh
        ;;
    11)
        read -p "Masukkan nama folder yang ingin dihapus: " nama_folder_hapus
        if [ -d "$nama_folder_hapus" ]; then
            rm -r "$nama_folder_hapus"
            echo "Folder berhasil dihapus."
        else
            echo "Folder tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    9)
        read -p "Masukkan nama file yang ingin dipindahkan: " nama_file_pindah
        if [ -f "$nama_file_pindah" ]; then
            read -p "Masukkan nama folder tujuan: " folder_tujuan
            if [ -d "$folder_tujuan" ]; then
                mv "$nama_file_pindah" "$folder_tujuan"
                echo "File berhasil dipindahkan ke folder $folder_tujuan."
            else
                echo "Folder tujuan tidak ditemukan."
            fi
        else
            echo "File tidak ditemukan."
        fi
        ./luthfiuas.sh
        ;;
    0)
        echo "Terima kasih telah menggunakan skrip ini."
        exit 0
        ;;
    *)
        echo "Pilihan tidak valid."
        ./luthfiuas.sh
        ;;
esac
