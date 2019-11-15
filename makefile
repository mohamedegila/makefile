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

#-------------------------------------------------------
# <Description> 
#	This is my first try to make all Genaric But i found that all generated file
#	genreted in Src file so i move to anther way
#
#INCLUDE_PATH = -I./Inc/\
#			   -I./Inc/ \
#			   -I./Inc/  \
#			   -I./Inc/
#			   
#SRC_PATH  =   ./Src/DIO.c \
#			  ./Src/LCD.c  \
#			  ./Src/main.c
#			  
#OBJ_PATH  = ./Dependencies/code.o
#OBJ = $(SRC_PATH:.c=.o)
#I = $(SRC_PATH:.c=.i)
#----------------------------------------------

#--------------------------------------------#
#        makefile configuration              #
#--------------------------------------------#

include makefile_Cfg.mk

#--------------------------------------------#
#      Rule to Generate a Obj. file          #
#--------------------------------------------#
%.o : %.c
	$(HideInfo) $(CC) -c $< -I$(INCLUDE_PATH) $(CFLAGS) -o $@
	
#--------------------------------------------#
#             Rule to make all               #
#--------------------------------------------#
all:$(LINK_TARGET)
	@$ echo "Building done !"
	
#--------------------------------------------#
#             Rule to LINK_TARGET            #
#--------------------------------------------#
$(LINK_TARGET): $(OBJ) $(OUT_SOURCE) $(DEP) 
# name of the specified object file should be explicitly added here
	$(CC) $(OBJ) $(OUT_SOURCE) -o $@
	@$ echo "Linking done !"
	
#--------------------------------------------#
#             Rule to clean                  #
#--------------------------------------------#
.PHONY: clean
clean:
	rm  -f $(OBJ) $(LINK_TARGET) $(DEP)
	@$ echo "Cleaning done !"
	
#--------------------------------------------#
#      Rule to Generate a Dep. file          #
#--------------------------------------------#
$(DEPENDENCY_PATH)%.d: %.c
	$(CC) $(CFLAG) $< -MM -MT $(@:%.d=.o) >$@