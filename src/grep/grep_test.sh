#!/bin/bash

DIFF_RES=""
FAILED_TESTS=0

echo "Test 1" # -e
    ./s21_grep -e ipsum test_data1.txt > s21_grep_res
    grep -e ipsum test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 2" # -e -e
    ./s21_grep -e ipsum -e orci test_data1.txt > s21_grep_res
    grep -e ipsum -e orci test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 3" # -e -e, multiple files
    ./s21_grep -e ipsum -e orci test_data1.txt test_data2.txt > s21_grep_res
    grep -e ipsum -e orci test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi


echo "Test 4" # -i
    ./s21_grep -i DIS test_data1.txt > s21_grep_res
    grep -i DIS test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 5" #-i, multiple files
    ./s21_grep -i ORCI test_data1.txt test_data2.txt > s21_grep_res
    grep -i ORCI test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 6" # -v
    ./s21_grep -v 123 test_data1.txt > s21_grep_res
    grep -v 123 test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 7" # -v, multiple files
    ./s21_grep -v 123 test_data1.txt test_data2.txt > s21_grep_res
    grep -v 123 test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi


echo "Test 8" # -c
    ./s21_grep -c dis test_data1.txt > s21_grep_res
    grep -c dis test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 9" # -c, multiple files
    ./s21_grep -c dis test_data1.txt test_data2.txt > s21_grep_res
    grep -c dis test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 10" # -l
    ./s21_grep -l dis test_data1.txt > s21_grep_res
    grep -l dis test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 11" # -l, multiple files
    ./s21_grep -l lacus test_data1.txt test_data2.txt > s21_grep_res
    grep -l lacus test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
       if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 12" # -n
    ./s21_grep -n ipsum test_data1.txt > s21_grep_res
    grep -n ipsum test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
       if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 13" # -n, multiple files
    ./s21_grep -n 123 test_data1.txt test_data2.txt > s21_grep_res
    grep -n 123 test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
#
echo "Test 14" # -s
    ./s21_grep -s dis test_data1.t > s21_grep_res
    grep -s dis test_data1.t > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 15" # -f
    ./s21_grep -f pattern_file.txt test_data1.txt > s21_grep_res
    grep -f pattern_file.txt test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 16" # -f, multiple files
    ./s21_grep -f pattern_file.txt test_data1.txt test_data2.txt> s21_grep_res
    grep -f pattern_file.txt test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi
        
echo "Test 17" # -o
    ./s21_grep -o bland test_data1.txt > s21_grep_res
    grep -o bland test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 18" # -o, multiple files
    ./s21_grep -o bulum test_data1.txt test_data2.txt > s21_grep_res
    grep -o bulum test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 19" # -c, -v
    ./s21_grep -c -v ipsum test_data1.txt > s21_grep_res
    grep -c -v ipsum test_data1.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
        if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi

echo "Test 20" # -i, -c, multiple files
    ./s21_grep -i -c IPSUM test_data1.txt test_data2.txt > s21_grep_res
    grep -i -c IPSUM test_data1.txt test_data2.txt > grep_res
    DIFF_RES="$(diff -s s21_grep_res grep_res)"
       if [[ "$DIFF_RES" == "Files s21_grep_res and grep_res are identical" ]] || \
           [[ "$DIFF_RES" == "Файлы s21_grep_res и grep_res идентичны" ]]; then
              echo "SUCCESS"
            else
              echo "FAIL"
              FAILED_TESTS=$((FAILED_TESTS + 1))   
        fi


if [ "$FAILED_TESTS" -gt 0 ]; then
    echo "Grep: Failed tests: $FAILED_TESTS"
else
    echo "Grep: All tests passed successfully"
fi


rm -rf grep_res s21_grep_res
