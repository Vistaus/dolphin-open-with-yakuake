#!/bin/bash

# 定义文件名 (确保这里的文件名和你实际的文件名一致)
FILENAME="yakuake-here.desktop"
TARGET_DIR_KDE6="$HOME/.local/share/kio/servicemenus"
TARGET_DIR_KDE5="$HOME/.local/share/kservices5/ServiceMenus"

echo "Starting installation of Open in Yakuake..."

# 1. 检测并创建 KDE 6 目录
if [ ! -d "$TARGET_DIR_KDE6" ]; then
    echo "Creating KDE 6 service menu directory..."
    mkdir -p "$TARGET_DIR_KDE6"
fi

# 2. 拷贝文件到 KDE 6 目录
if [ -f "$FILENAME" ]; then
    cp "$FILENAME" "$TARGET_DIR_KDE6/"
    chmod +x "$TARGET_DIR_KDE6/$FILENAME"
    echo "Successfully installed to KDE 6 directory."
else
    echo "Error: $FILENAME not found in current directory!"
    exit 1
fi

# 3. 同时兼容 KDE 5 (可选)
if [ -d "$HOME/.local/share/kservices5" ]; then
    mkdir -p "$TARGET_DIR_KDE5"
    cp "$FILENAME" "$TARGET_DIR_KDE5/"
    chmod +x "$TARGET_DIR_KDE5/$FILENAME"
    echo "Successfully installed to KDE 5 directory for compatibility."
fi

echo "-----------------------------------------------"
echo "Installation complete!"
echo "Please restart Dolphin (or press F5) to see the changes."
echo "Note: Make sure Yakuake is installed on your system."