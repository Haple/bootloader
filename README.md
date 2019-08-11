# Hello World Bootloader

## Pré requisitos

```

sudo apt install nasm

sudo apt install qemu-system-x86

```

## Compilação
nasm boot.asm -f bin -o boot.bin

## Testar
qemu-system-i386 boot.bin

## Gravar no pendrive 
1. Guarde os arquivos de seu pendrive em outro lugar e formate seu pendrive, para evitar perder qualquer coisa
1. Coloque o pendrive no PC e execute o comando "sudo fdisk -l" e identifique o caminho do seu pendrive (por exemplo: "/dev/sdb")
1. (Ei! Você tem certeza que encontrou o caminho certo do seu pendrive? Cuidado viu!) 
1. Por fim execute o seguinte, trocando "/dev/sdb" pelo caminho que você achou: sudo dd if=boot.bin of=/dev/sdb bs=512

Após gravar no pendrive, teoricamente você só precisa reiniciar o seu PC e configurar sua BIOS para fazer o boot pelo seu pendrive.
Só não dou mais detalhes porque cada PC é de um jeito. No meu tive desativar algumas configurações de segurança. Talvez no seu não precise.

