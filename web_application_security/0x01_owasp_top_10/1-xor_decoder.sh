#!/bin/bash

# Əgər arqument verilməyibsə çıxış et
if [ -z "$1" ]; then
    echo "İstifadə qaydası: $0 {xor}KzosKw=="
    exit 1
fi

# Başlıqdakı {xor} hissəsini təmizləyirik
encoded_str="${1#\{xor\}}"

# Base64 ilə deşifrə edib, hər baytı 0x5F (_) ilə XOR edirik
echo -n "$encoded_str" | base64 -d 2>/dev/null | python3 -c '
import sys
data = sys.stdin.buffer.read()
decoded = "".join(chr(b ^ 0x5F) for b in data)
print(decoded)
'
