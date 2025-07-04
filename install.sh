#!/bin/bash

PLAYBOOK_PATH="srsran_build.yml"
INVENTORY_FILE="inventory.ini"
INSTALL_PATH="/home/$(whoami)/4G"
INSTALL_USER="$(whoami)"

#создание директории
echo "Создание директори ..."
mkdir -p "$INSTALL_PATH"

# Установка Ansible
echo "Установка Ansible..."
if ! command -v ansible &> /dev/null; then
    sudo apt update
    sudo apt install -y ansible
else
    echo "Ansible уже установлен."
fi

# Запуск playbook
echo "Запуск playbook..."
# ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_PATH" --ask-become-pass --extra-vars "install_path=$INSTALL_PATH install_user=$INSTALL_USER"
ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_PATH" --ask-become-pass --extra-vars "install_path=$INSTALL_PATH install_user=$INSTALL_USER debug_mode=true"

echo "Скрипт завершен!"