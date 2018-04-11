/*
   ______    ______
  /      \  /      \
 /██████  |/██████  |  The Future of po-util:
 ██ |  ██ |██ |  ██ |
 ██ |__██ |██ \__██ |      Refactored,
 ██    ██/ ██    ██/       Modular,
 ███████/   ██████/        Cross-Compatible
 ██ |
 ██ |
 ██/  https://po-util.com

po - The Ultimate Local Particle Experience for Linux and macOS
Copyright (C) 2018 Nathan D. Robinson

custom-baud
 * Allows to set arbitrary baud rate for serial devices on Linux.
 * stty allows to set only predefined values: 9600, 19200, 38400, 57600, 115200, 230400, 460800.
 */
 
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <stropts.h>
#include <asm/termios.h>

int main(int argc, char* argv[]) {

    if (argc != 3) {
        printf("%s device rate\n\nSet baud rate for a serial device.\nFor instance:\n    %s /dev/ttyACM0 14400\n", argv[0], argv[0]);
        return -1;
    }

    int fd = open(argv[1], O_RDONLY);
    int rate = atoi(argv[2]);

    struct termios2 tio;
    ioctl(fd, TCGETS2, &tio);
    tio.c_cflag &= ~CBAUD;
    tio.c_cflag |= BOTHER;
    // tio.c_ispeed = rate;
    tio.c_ospeed = rate;
    int r = ioctl(fd, TCSETS2, &tio);
    close(fd);

    if (r == 0) {
        printf("Set %s to %d successfully.\n", argv[1], rate);
    } else {
        perror("ioctl");
    }
}
