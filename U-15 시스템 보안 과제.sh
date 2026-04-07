#!/bin/bash

echo "=============================="
echo " U-15 checking"
echo "=============================="

sleep 2

# 1. 결과 저장용 임시파일 생성
TMP_FILE=$(mktemp)

# 2. 소유자 또는 그룹 없는 파일 탐색
find / \( -nouser -o -nogroup \) -xdev -ls 2>/dev/null > "$TMP_FILE"

# 3. 발견된 파일 개수 계산
COUNT=$(wc -l < "$TMP_FILE")

echo " 발견된 파일 수: $COUNT"
echo "------------------------------"

# 4. 결과 판단
if [ "$COUNT" -ge 1 ]; then
    echo "U-15 취약"
    echo "==>  소유자 또는 그룹이 없는 파일이 존재함"
    echo ""
    echo "상세 목록: "
    cat "$TMP_FILE"
else
    echo "  U-15 양호"
    echo "==> 모든 파일이 정상적인 소유자/그룹을 가짐"
fi

# 5. 임시파일 삭제
rm -f "$TMP_FILE"

echo "=============================="
echo " 점검 종료"
echo "=============================="












