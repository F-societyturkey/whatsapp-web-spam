
clear
echo "
███████╗███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗     ████████╗   ██████╗
██╔════╝██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔╝     ╚══██╔══╝   ██╔══██╗
█████╗  ███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝         ██║      ██████╔╝
██╔══╝  ╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝          ██║      ██╔══██╗
██║     ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║           ██║      ██║  ██║
╚═╝     ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝           ╚═╝      ╚═╝  ╚═╝



██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
";

sudo chmod +x uninstall

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; sonra
    INSTALL_DIR="$PREFIX/usr/share/doc/whatsapp-web-spam"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

    pkg install -y git python2
elif [ "$(uname)" = "Darwin" ]; sonra 
    INSTALL_DIR="/usr/local/whatsapp-web-spam"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false
else
    INSTALL_DIR="$HOME/.whatsapp-web-spam"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

    sudo apt-get install -y git python2.7
fi

echo "[✔] Dizin kontrol ediliyor...";
if [ -d "$INSTALL_DIR" ]; sonra
    echo "[◉] dizin zaten mevcut değiştirilsin mi? [Y/n]:" ;
    read -r mama
    if [ "$mama" = "y" ]; sonra
        if [ "$TERMUX" = true ]; sonra
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/whatsapp-web-spam*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/whatsapp-web-spam*"
        fi
    else
        echo "[✘] yüklemek için eski yüklenmeyi kaldırınız! [✘] ";
        echo "[✘] yükleme başarısız! [✘] ";
        exit
    fi
fi
echo "[✔] eski dizin siliniyor...";
if [ -d "$ETC_DIR/F-societyturkey" ]; sonra
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; sonra
        rm -rf "$ETC_DIR/F-societyturkey"
    else
        sudo rm -rf "$ETC_DIR/F-societyturkey"
    fi
fi

echo "[✔] Installing ...";
echo "";
git clone --depth=1 https://github.com/F-societyturkey/whatsapp-web-spam "$INSTALL_DIR";
echo "#!$BASH_PATH
python $INSTALL_DIR/whatsapp-web-spam.py" "${1+"$@"}" > "$INSTALL_DIR/whatsapp-web-spam";
chmod +x "$INSTALL_DIR/whatsapp-web-spam";
if [ "$TERMUX" = true ]; sonra
    cp "$INSTALL_DIR/whatsapp-web-spam" "$BIN_DIR"
    cp "$INSTALL_DIR/whatsapp-web-spam.cfg" "$BIN_DIR"
else
    sudo cp "$INSTALL_DIR/whatsapp-web-spam" "$BIN_DIR"
    sudo cp "$INSTALL_DIR/whatsapp-web-spam.cfg" "$BIN_DIR"
fi
rm "$INSTALL_DIR/whatsapp-web-spam";


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Araç kuruldu! [✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔]      işlem tamam! fsociety yazarak işleme başlayabiirsiniz!       [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Kurulum Basarısız! [✘] ";
    exit
fi