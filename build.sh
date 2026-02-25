#!/bin/bash

# Son commit mesajını git log ile al
COMMIT_MSG=$(git log -1 --pretty=%B)

# Varsayılan tema
THEME="stackoverflow"

# Mesajı kontrol et
if [[ "$COMMIT_MSG" == *"[theme:projects]"* ]]; then
  THEME="projects"
elif [[ "$COMMIT_MSG" == *"[theme:simplyelegant]"* ]]; then
  THEME="simplyelegant"
elif [[ "$COMMIT_MSG" == *"[theme:stackoverflow]"* ]]; then
  THEME="stackoverflow"
fi

echo "Yakalanan tema: $THEME"

# Gerekli paketleri kur
npm install -g resume-cli
npm install jsonresume-theme-$THEME

# Public klasörünü oluştur ve export al
mkdir -p public
resume export public/index.html --theme $THEME
