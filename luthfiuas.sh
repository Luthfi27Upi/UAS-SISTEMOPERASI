echo "=========================="
echo "    Luthfi Triaswangga    "
echo "=========================="
echo "1. Lihat File"
echo "2. Buat File"
echo "3. Copy File"
echo "4. Hapus File"
echo "5. Isi Fil"
echo "6. Keluar"

read -p "Masukkan Pilihan Anda : " pilihan

case $pilihan in
        1) 
        read -p "Masukkan nama file yang ingin dilihat : " n>
        if [ -f "$nama_file" ] ; then
        cat "$nama_file"
        else
        echo "File tidak ditemukan."
        fi
        ;;
        2)
        read -p "Masukkan nama file yang ingin dibuat: " nam>
        touch "$nama_file_baru"
        echo "File berhasil dibuat."
        ;;
        3)
        read -p "Masukkan nama file yang ingin disalin: " na>
        if [ -f "$nama_file_sumber" ]; then
            read -p "Masukkan nama file tujuan: " nama_file_>
            cp "$nama_file_sumber" "$nama_file_tujuan"
            echo "File berhasil disalin."
        else
            echo "File sumber tidak ditemukan."
        fi
        ;;
        4)
        read -p "Masukkan nama file yang ingin dihapus: " na>
        if [ -f "$nama_file_hapus" ]; then
            rm "$nama_file_hapus"
            echo "File berhasil dihapus."
        else
            echo "File tidak ditemukan."
        fi
        ;;
        6)
        echo "Terima kasih telah menggunakan skrip ini."
        exit 0
        ;;
        *)
        echo "Pilihan Tidak Valid"
        ;;
esac