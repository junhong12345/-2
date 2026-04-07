#!/bin/bash

echo "=============================="
echo " U-25 Checking"
echo "=============================="

sleep 2

TMP_FILE=$(mktemp)

# world writable 파일 찾기
find / -type f -perm -2 -xdev 2>/dev/null > "$TMP_FILE"

COUNT=$(wc -l < "$TMP_FILE")

echo " 발견된 파일 수: $COUNT"
echo "------------------------------"

if [ "$COUNT" -ge 1 ]; then
    echo "[결과]  취약 (World Writable 파일 존재)"
    echo ""
    echo "상세 목록"
    ls -l $(cat "$TMP_FILE")
else
    echo "결과:  양호 (World Writable 파일 없음)"
fi

rm -f "$TMP_FILE"

echo "=============================="
echo " 점검 종료"
echo "=============================="


















