#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <hash>"
    exit 1
fi

BASE64_STR="${1#\{xor\}}"

echo -n "$BASE64_STR" | base64 -d 2>/dev/null | od -An -v -tu1 | awk '
{
    for (i=1; i<=NF; i++) {
        # 95 is the decimal value for 0x5F (_)
        printf "%c", xor($i, 95)
    }
}
END { print "" }'
