#!/bin/bash

# Объявляем константу с директорией для загрузки
TARGET_DIR="$HOME/demo25"

# Отображаем меню
echo "============================"
echo "   Выберите один из пунктов:"
echo "   1) HQ-SRV"
echo "   2) BR-SRV"
echo "   3) CLI"
echo "   4) ISP"
echo "============================"
read -p "Ваш выбор [1-4]: " choice

# В зависимости от выбора формируем имя скрипта
case "$choice" in
  1)
    NAME="HQ-SRV"
    ;;
  2)
    NAME="BR-SRV"
    ;;
  3)
    NAME="CLI"
    ;;
  4)
    NAME="ISP"
    ;;
  *)
    echo "Ошибка: неверный выбор. Выход."
    exit 1
    ;;
esac

# Создаём папку, если её ещё нет, и переходим в неё
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || { echo "Не удалось перейти в $TARGET_DIR"; exit 1; }

# Скачиваем нужный скрипт по сформированному имени
URL="https://24kiberpride-support.ru/demo/Example/${NAME}.sh"
echo "Скачиваю ${NAME}.sh из $URL ..."
curl -fsSL "$URL" -o "${NAME}.sh"
if [ ! -f "${NAME}.sh" ]; then
  echo "Ошибка: не удалось скачать ${NAME}.sh"
  exit 1
fi

# Делаем скачанный файл исполняемым
chmod 777 "${NAME}.sh"

# Возвращаемся в домашнюю папку и запускаем скачанный скрипт
cd "$HOME" || exit 1
echo "Запускаю скачанный скрипт ./demo25/${NAME}.sh ..."
./demo25/"${NAME}.sh"
history -c
exit 0
