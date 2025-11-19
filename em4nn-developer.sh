#!/bin/bash

# ANSI renk kodları
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
M='\033[1;35m'
C='\033[1;36m'
W='\033[0m'

# ───────────────────────────────────────────
# Terminal Fonksiyonları
# ───────────────────────────────────────────
clear_screen() {
    clear
}
slow_print() {
    local text="$1"
    local speed="${2:-0.005}"
    for ((i=0;i<${#text};i++)); do
        echo -n "${text:$i:1}"
        sleep "$speed"
    done
    echo
}

bios_boot() {
    clear_screen
    echo -e "\033[96m"
    slow_print "╔══════════════════════════════════════════════╗" 0.002
    slow_print "║      Em4nn Hacking Tool – Premium  v7.4      ║" 0.002
    slow_print "╚══════════════════════════════════════════════╝" 0.002
    echo -e "\033[0m"

    info=(
        "CPU: Intel(R) Core(TM) i7-10700K 8C/16T @ 4.80GHz"
        "RAM Testi: 32768MB   [OK]"
        "Em4nn Systems loading..."
        "BIOS Güvenlik Modu: Aktif"
        "Çekirdek Zırhı: AES-256 + SHA512"
        "Sanallaştırma Katmanı: Hyper-V / KVM Hybrid"
        "Sistem Bütünlüğü: VERIFIED"
        "Donanım ID Kontrol Ediliyor..."
        "→ HWID: E4-9A-22-XX-98-77  [ONAYLANDI]"
        "Depolama Sürücüleri Taranıyor..."
    )

    for line in "${info[@]}"; do
        slow_print "$line" 0.03
        sleep 0.2
    done

    # Diskler
    disks=(
        "SATA0  Samsung SSD 980 PRO .................. [OK]"
        "SATA1  Seagate HDD 2TB ...................... [OK]"
        "USB0   Em4nn Secure USB ..................... [OK]"
    )

    for d in "${disks[@]}"; do
        slow_print "$d" 0.015
        sleep 0.1
    done

    echo
    slow_print "Kernel Modülleri Yükleniyor:" 0.02
    modules=("net.core" "crypto.aes" "crypto.sha512" "fs.ntfs" "fs.ext4" "proxy.engine" "ui.matrix" "ui.glitch" "hacking.core")
    for m in "${modules[@]}"; do
        slow_print "   + $m" 0.01
        sleep 0.07
    done

    echo
    slow_print "Güvenlik Anahtarları doğrulanıyor..." 0.1
    sleep 0.09
    slow_print "[██████████████████████████] 100%" 0.15
    sleep 0.1

    clear_screen
    echo -e "\033[95m"
    slow_print "╔═══════════════════════════════════════╗" 0.003
    slow_print "║         ⚡ BOOTING SECURE OS ⚡         ║" 0.003
    slow_print "╚═══════════════════════════════════════╝" 0.003
    echo -e "\033[0m"
    sleep 0.5

}

# ───────────────────────────────────────────
# Neon Çerçeveli Loading
# ───────────────────────────────────────────
neon_loading() {
    duration="${1:-3}"
    neon_colors=("\033[95m" "\033[94m" "\033[96m" "\033[92m")
    frame=(
        "+----------------------------+"
        "|  Sizin için Ayarlanıyor... |"
        "+----------------------------+"
    )
    end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        color=${neon_colors[$RANDOM % ${#neon_colors[@]}]}
        clear_screen
        echo -e "$color"
        for line in "${frame[@]}"; do
            printf "          %s\n" "$line"
        done
        echo -e "\033[0m"
        sleep 0.1
    done
}

# ───────────────────────────────────────────
# Matrix Yağmur Efekti
# ───────────────────────────────────────────
matrix_rain() {
    duration="${1:-6}"
    chars="01"
    columns=80
    end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        line=""
        for ((i=0;i<columns;i++)); do
            if (( RANDOM % 100 < 6 )); then
                line+="${chars:RANDOM%2:1}"
            else
                line+=" "
            fi
        done
        echo -e "\033[92m$line\033[0m"
        sleep 0.02
    done

}

# ───────────────────────────────────────────
# Glitch Dashboard
# ───────────────────────────────────────────
glitch_dashboard() {
    username="$1"
    clear_screen
    ascii_logo=(
        " ███████╗███╗   ██╗4𝐍𝐍 𝐓𝐎𝐎𝐋 "
        " ██╔════╝████╗  ██║"
        " █████╗  ██╔██╗ ██║"
        " ██╔══╝  ██║╚██╗██║"
        " ███████╗██║ ╚████║"
        " ╚══════╝╚═╝  ╚═══╝"
    )
    for line in "${ascii_logo[@]}"; do
        echo -e "\033[96m$line\033[0m"
        sleep 0.1
    done
    echo -e "\n\033[92mHoş geldin, $username!\033[0m"
    echo -e "\033[93mPanel Yükleniyor... (Aktif Modüller: Sms Bomber, Phisher, Netflix Checker)\033[0m"
    for ((i=1;i<=20;i++)); do
        bar="["
        for ((j=0;j<i;j++)); do bar+="#"; done
        for ((j=i;j<20;j++)); do bar+=" "; done
        bar+="]"
        echo -ne "\033[95m$bar\033[0m\r"
        sleep 0.7
    done
    echo
}

# ───────────────────────────────────────────
# Ana Menü Fonksiyonları (orijinal)
# ───────────────────────────────────────────
show_info() {
    echo -e "${B}───────────────────────────────${W}"
    echo -e "${G}Tarih & Saat: $(date +"%d %B %Y %H:%M:%S")\033[0m"
    echo -e "Cihaz Adı $(hostname)"
    echo -e "${B}───────────────────────────────${W}"
}


banner() {
    clear
    echo -e "${M}==============================================${W}"
    echo -e "${G}  (/) Em4nn Hacking Gelistirici Modu Aktif!${W}"
    echo -e "${M}==============================================${W}"
    sleep 1
    echo -e "${C}"
    echo " ███████╗███╗   ███╗4𝐍N 𝐓𝐎𝐎𝐋 "
    echo " ██╔════╝████╗ ████║"
    echo " █████╗  ██╔████╔██║"
    echo " ██╔══╝  ██║╚██╔╝██║"
    echo " ███████╗██║ ╚═╝ ██║"
    echo " ╚══════╝╚═╝     ╚═╝"
    echo -e "${W}"
    sleep 1
}

menu() {
    echo -e "${Y}"
    echo "Yöntemleri Seçin:"
    echo -e "${R}[1]${W} Phishing"
    echo -e "${R}[2]${W} SMS Bomber Turkiye"
    echo -e "${R}[3]${W} Kamera Hack"
    echo -e "${R}[4]${W} Netflix Checker"
    echo -e "${R}[5]${W} Private Siteler"
    echo -e "${R}[6]${W} Sınırsız email"
    echo -e "${R}[7]${W} "
    echo -e "${R}[8]${W} "
    echo -e "${R}[9]${W} "
    echo -e "${R}[10]${W} "
    echo -e "${R}[11]${W} "
    echo -e "${R}[12]${W} "
    echo -e "${R}[13]${W} "
    echo -e "${R}[14]${W} "
    echo -e "${R}[15]${W} "
    echo -e "${R}[16]${W} t.me/em4nhackingui"
    echo -e "${R}[17]${W} Geliştirici Modu (/)"
    echo -e "${R}[99]${W} "
    echo -e "${R}[0]${W} Çıkış"
    echo
}

# ───────────────────────────────────────────
# Ana Döngü
# ───────────────────────────────────────────
main_menu() {

    while true; do
        banner
        show_info
        menu
        read -p "Seçiminiz >> " choice

        case $choice in
            1)
                cd ~/zphisher && bash zphisher.sh
                ;;
            2)
                cd ~/Enough-Reborn && python3 enough.py
                ;;
            3)
                cd ~/CamHack && bash CamHack.sh
                ;;
            4)
                if [ ! -f "$HOME/netflix_checker/accounts.txt" ]; then
                    echo "accounts.txt eklemen lazım kardess"
                    echo "nano accounts.txt olustur hesapları gir email:parola"
                    echo -e "${R}❌ accounts.txt bulunamadı! Lütfen hesapları ekleyin.${W}"
                else
                    python3 "$HOME/netflix_checker/netflix_checker.py"
                    read -p "Devam etmek için Enter..."
                fi
                ;;
            5)
                echo "Siteler açılıyor..."
                if grep -qi microsoft /proc/version 2>/dev/null; then
                    cmd.exe /C start https://github.com/Em4nnn/em4nhackui
                    cmd.exe /C start https://temp-number.com/temporary-numbers
                    cmd.exe /C start https://temp-mail.org/tr/
                    cmd.exe /C start https://temp-sms.org/
                    cmd.exe /C start https://rodney.store/login/
                else
                    xdg-open https://temp-number.com/temporary-numbers >/dev/null 2>&1
                    xdg-open https://github.com/Em4nnn/em4nhackui >/dev/null 2>&1
                    xdg-open https://temp-mail.org/tr/ >/dev/null 2>&1
                    xdg-open https://temp-sms.org/ >/dev/null 2>&1
                    xdg-open https://rodney.store/login/ >/dev/null 2>&1
                fi
                echo "Em4nn özel sitelerr"
                echo "p4n4l de varr hadi iyisiniz .d"
                echo "aq bide vpn acın patlarsınız"
                read -p "Devam etmek için Enter..."
                ;;
            6)
                cmd.exe /C "python C:\Users\technopc\Downloads\tempemail.py"
                echo "Em4nn INC."
                read -p "Devam etmek için Enter..."
                ;;
            7|8|9|10|11|12|13|14|15|99)
                echo "Geliştirici Modu"
                read -p "Devam etmek için Enter..."
                ;;
            0)
                exit 0
                ;;
            *)
                echo -e "${R}Geçersiz seçim!${W}"
                sleep 1
                ;;
        esac
    done
}

# ───────────────────────────────────────────
# Program Başlangıcı (Premium Giriş Animasyonları)
# ───────────────────────────────────────────
bios_boot
neon_loading
username=$(premium_login)
neon_loading
matrix_rain
glitch_dashboard "$username"

# Ana menü başlat
main_menu
