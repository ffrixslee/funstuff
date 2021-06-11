#!/bin/bashfor file in *.gf:
    do
    #basename -s”.gf” *.gf >> test.txt
    for f in ./*.gf ; do echo  -n “${f}:“; time gf-old -v=0 -make  --force-recomp “${f}” +RTS -i0.005 -s -h  ; hp2ps -c gf-old.hp ; done &> gf-old-foods.txt
    grep ’gf\|Alloc\|Productivity\|system\|real\|user\|sys’ gf-old-foods.txt > old.txt
    for f in ./*.gf ; do echo  -n “${f}:“; time gf -v=0 -make  --force-recomp “${f}” +RTS -i0.005 -s -h ; hp2ps -c gf.hp; done &> gf-foods.txt
    grep ’gf\|Alloc\|Productivity\|system\|real\|user\|sys’ gf-foods.txt > new.txt
    paste old.txt new.txt > gf-combined.txt
    sed ‘s/ \{2\}/,/g’ gf-combined.txt > gf-combined.csv
    sed ‘s/\([0-9]\),\([0-9]\)/\1\2/g’ gf-combined.csv > gf-combined1.csv    #removes comma between 2 digits
    tr ‘,’ ‘\t’ <gf-combined1.csv > gf-combined2.csv
    cat gf-combined2.csv > gf-combined2.xls
    done