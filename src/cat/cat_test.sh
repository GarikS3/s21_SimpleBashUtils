#!/bin/bash

DIFF_RES=""

echo "Test 1"  # basic usage
    ./s21_cat test_data1.txt > s21_cat_res
    cat test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 2" # multiple files
    ./s21_cat test_data1.txt test_data2.txt > s21_cat_res
    cat test_data1.txt test_data2.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 3" # -b
    ./s21_cat -b test_data1.txt > s21_cat_res
    cat -b test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 4" # --number-nonblank
    ./s21_cat --number-nonblank test_data1.txt > s21_cat_res
    cat -b test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 5" # -n
    ./s21_cat -n test_data1.txt > s21_cat_res
    cat -n test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 6" # --number
    ./s21_cat --number test_data1.txt > s21_cat_res
    cat -n test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 7" # -s
    ./s21_cat -s test_data1.txt > s21_cat_res
    cat -s test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 8" # --squeeze-blank
    ./s21_cat --squeeze-blank test_data1.txt > s21_cat_res
    cat -s test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 9" # -v
    ./s21_cat -v test_data1.txt > s21_cat_res
    cat -v test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 10" # -e
    ./s21_cat -e test_data1.txt > s21_cat_res
    cat -e -v test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 11" # -E
    ./s21_cat -E test_data1.txt > s21_cat_res
    cat -e test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 12" # -t
    ./s21_cat -t test_data1.txt > s21_cat_res
    cat -t -v test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 13" # -T
    ./s21_cat -T test_data1.txt > s21_cat_res
    cat -t test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 14" # -n -b
    ./s21_cat -n -b test_data1.txt > s21_cat_res
    cat -n -b test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 15" # --number --number-nonblank
    ./s21_cat --number --number-nonblank test_data1.txt > s21_cat_res
    cat -n -b test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 16" # -n -s
    ./s21_cat -n -s test_data1.txt > s21_cat_res
    cat -n -s test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 17" # -n -s -T"
    ./s21_cat -n -s -T test_data1.txt > s21_cat_res
    cat -n -s -t test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 18" # -n -e -s -v
    ./s21_cat -n -e -s -v test_data1.txt > s21_cat_res
    cat -n -e -s -v test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 19" # -n -T -E -s -v
    ./s21_cat -n -T -E -s -v test_data1.txt > s21_cat_res
    cat -n -t -e -s -v test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

echo "Test 20" # --number-nonblank --number --squeeze-blank -v -t
    ./s21_cat --number-nonblank --number --squeeze-blank -v -t test_data1.txt > s21_cat_res
    cat -b -n -s -v -t test_data1.txt > cat_res
    DIFF_RES="$(diff -s s21_cat_res cat_res)"
        if [ "$DIFF_RES" == "Files s21_cat_res and cat_res are identical" ]
            then
              echo "SUCCESS"
            else
              echo "FAIL"
        fi

rm -rf cat_res s21_cat_res