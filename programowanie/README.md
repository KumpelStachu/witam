# [Brainfuck](brainfuck)
### Install dependencies 
 - `sudo apt-get install bf`
### Run
 - `cd brainfuck`
 - `bf src.bf`

---

# [ASM](asm)
### Install dependencies
 - `sudo apt-get install nasm`
###   
 - `cd asm`
 - `nasm -f elf64 src.asm`
 - `ld src.o -o out`
 - `./out`

---

# [PSP C](c)
### Install dependencies
 - `sudo add-apt-repository ppa:xuzhen666/ppsspp`
 - `sudo apt-get update`
 - `sudo apt-get install ppsspp make automake`
### Build [PSP Toolchain](https://github.com/pspdev/psptoolchain)
 - `cd c`
 - `git clone https://github.com/pspdev/psptoolchain`
 - `cd psptoolchain`
 - `sudo ./prepare-debian-ubuntu.sh`
 - `sudo ./toolchain-sudo.sh`
 - `export PSPDEV=/usr/local/pspdev`
 - `export PATH=$PATH:$PSPDEV/bin`
### Build [PSP SDK](https://github.com/pspdev/pspsdk)
 - `cd ..`
 - `git clone https://github.com/pspdev/pspsdk`
 - `cd pspsdk`
 - `./bootstrap`
 - `./configure`
 - `make`
 - `sudo make install`
### Build and run
 - `cd ..`
 - `make`
 - `ppsspp EBOOT.PBP`

---

# [Shell](shell)
### Install dependencies
 - `sudo apt-get install chromium`
### [Run](https://kumpelstachu.github.io/witam/)
 - `cd shell`
 - `chmod +x chromium.sh`
 - `./chromium.sh`

---

# [Java(?)](java)
### Install dependencies
 - `sudo apt-get install openjdk-11-jdk`
### Run(?)
 - `javac Main.java`
 - `java Main`
