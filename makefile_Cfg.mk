
#--------------------------------------------#
#            Setting Pathes                  #
#--------------------------------------------#
vpath %.c ./Src
vpath %.h ./Inc
SRC_PATH        = ./Src/
LINK_TARGET     = app.exe
INCLUDE_PATH    = ./Inc/
DEPENDENCY_PATH = ./Dependencies/
OUT_SOURCE   = ./Dependencies/code.o
OBJ          = main.o LCD.o DIO.o 
#--------------------------------------------#
#     General configuration  for makefile    #
#--------------------------------------------#
#Optional Varible to Hide any information from apparing on CMD Put ' @ ' if you want to Hide info

HideInfo = 

CC = gcc_S
DEP = $(DEPENDENCY_PATH)main.d $(DEPENDENCY_PATH)LCD.d $(DEPENDENCY_PATH)DIO.d
CLEAN_TARGET = $(LINK_TARGET) $(OBJ) $(DEP)CFLAGS = -std=c99 -Werror -Wall -g