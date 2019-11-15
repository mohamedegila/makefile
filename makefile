#******************************************************************************
# File Name: makefile
#
# Author: Mohammed Fathallah Egila
#*****************************************************************************

#------------------------------------------------------------------------------
# <Description> 
#      Generic Makefile for any project,
# Note : All Files.o Genrated in Src file and app.exe genrated in main file
#------------------------------------------------------------------------------
#--------------------------------------------#
#     General configuration  for makefile    #
#--------------------------------------------#

#Optional Varible to Hide any information from apparing on CMD Put ' @ ' if you want to Hide info
HideInfo = 

CC = gcc_S
LINK_TARGET = app.exe
INCLUDE_PATH = -I./Inc/\
			   -I./Inc/ \
			   -I./Inc/  \
			   -I./Inc/
			   
SRC_PATH  =   ./Src/DIO.c \
			  ./Src/LCD.c  \
			  ./Src/main.c
			  
OBJ_PATH  = ./Dependencies/code.o


#--------------------------------------------#
#        Compiler Flags and Defines          #
#--------------------------------------------#
OBJ = $(SRC_PATH:.c=.o)
CFLAGS = -std=c99 -Werror -Wall -g
I = $(SRC_PATH:.c=.i)


%.o : %.c
	$(HideInfo) $(CC) -c $< $(INCLUDE_PATH) $(CFLAGS) -o $@
	
#--------------------------------------------#
#             make_S all                     #
#--------------------------------------------#
all:$(LINK_TARGET)
	@$ echo "Building done !"
	
#--------------------------------------------#
#             make_S LINK_TARGET             #
#--------------------------------------------#
$(LINK_TARGET): $(OBJ) $(OBJ_PATH)
	$(HideInfo) $(CC) $(INCLUDE_PATH) $(OBJ) $(OBJ_PATH) -o $@
	@$ echo "Linking done !"
	
#--------------------------------------------#
#             make_S clean                   #
#--------------------------------------------#
.PHONY: clean
clean:
	rm  -f $(OBJ) $(LINK_TARGET)
	@$ echo "Cleaning done !"
