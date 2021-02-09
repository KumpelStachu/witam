#!/bin/bash
ROOT=$(pwd)

function brainfuck() {
    which bf >/dev/null
    [ $? -ne 0 ] && sudo apt-get install -y bf

    cd $ROOT/brainfuck
    bf src.bf
}

function asm() {
    which nasm >/dev/null
    [ $? -ne 0 ] && sudo apt-get install -y nasm

    cd $ROOT/asm
    nasm -f elf64 src.asm
    ld src.o -o out
    ./out

    printf "Posprzątać? [t/N]"
    read o
    $([ "$o" = "T" ] || [ "$o" = "t" ]) && rm src.o out 2>/dev/null
}

function c() {
    which ppsspp >/dev/null
    if [ $? -ne 0 ]; then
        sudo apt-get install -y ppsspp 2>/dev/null
        if [ $? -ne 0 ]; then
            sudo add-apt-repository ppa:xuzhen666/ppsspp -y
            sudo apt-get update
            sudo apt-get install -y ppsspp
        fi
    fi

    which make >/dev/null
    [ $? -ne 0 ] && sudo apt-get install -y make

    which automake >/dev/null
    [ $? -ne 0 ] && sudo apt-get install -y automake

    which psp-config >/dev/null
    if [ $? -ne 0 ]; then
        cd $ROOT/c

        git clone https://github.com/pspdev/psptoolchain
        cd $ROOT/c/psptoolchain
        sudo ./prepare-debian-ubuntu.sh -y
        sudo ./toolchain-sudo.sh

        export PSPDEV=/usr/local/pspdev
        export PATH=$PATH:$PSPDEV/bin
        cd $ROOT/c

        git clone https://github.com/pspdev/pspsdk
        cd $ROOT/c/pspsdk
        ./bootstrap
        ./configure
        make
        sudo su -c "export PSPDEV=/usr/local/pspdev && export PATH=$PATH:$PSPDEV/bin && make install"
    fi

    cd $ROOT/c
    make
    ppsspp EBOOT.PBP

    printf "Posprzątać? [t/N]"
    read o
    $([ "$o" = "T" ] || [ "$o" = "t" ]) && make clean
}

function shell() {
    which chromium >/dev/null
    if [ $? -ne 0 ]; then
        sudo apt-get install -y chromium
    fi

    cd $ROOT/shell
    ./chromium.sh
    if [ $? -ne 0 ]; then
        chmod +x chromium.sh
        ./chromium.sh
    fi
}

function java_() {
    which javac >/dev/null
    [ $? -ne 0 ] && sudo apt-get install -y openjdk-11-jdk

    cd $ROOT/java
    javac Main.java
    java Main.java

    printf "Posprzątać? [t/N]"
    read o
    $([ "$o" = "T" ] || [ "$o" = "t" ]) && rm -r main.* main package* node* *.class 2>/dev/null
}

select o in update brainfuck asm c shell java; do
    case $o in
    "update")
        sudo apt-get update
        ;;
    "brainfuck")
        brainfuck
        ;;
    "asm")
        asm
        ;;
    "c")
        c
        ;;
    "shell")
        shell
        ;;
    "java")
        java_
        ;;
    esac
done
