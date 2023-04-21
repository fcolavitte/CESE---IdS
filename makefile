SRC_DIR = ./src
INC_DIR = ./inc
OUT_DIR = ./build
OBJ_DIR = $(OUT_DIR)/obj

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

.DEFAULT_GOAL := all

-include $(patsubst %.o,%.d,$(OBJ_FILES))

all: $(OBJ_FILES)
	@echo Enlazando $<
	@gcc $(OBJ_FILES) -o $(OUT_DIR)/app.out

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	@echo Compilando $<
	@gcc -o $@ -c $< -I$(INC_DIR) -MMD

$(OBJ_DIR): $(OUT_DIR)
	@mkdir -p $(OUT_DIR)

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

clean: $(OUT_DIR)
	@rm -r $(OUT_DIR)


#SRC_DIR = ./src
#INC_DIR = ./inc
#OUT_DIR = ./build
#OBJ_DIR = $(OUT_DIR)/obj
#
#SRC_FILES = $(wildcard $(SRC_DIR)/*.c) 
#OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))
#
#.DEFAULT_GOAL := all
#
#-include $(patsubst %.o,%.d,$(OBJ_FILES))
#
#all: $(OBJ_FILES)
#	@echo Enlazando $< 
#	@gcc $(OBJ_FILES) -o $(OUT_DIR)/app.out
#
#$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
#	@echo Compilando $< 
#	@gcc -o $@ -c $< -I$(INC_DIR) -MMD 
#
#$(OBJ_DIR): $(OUT_DIR)
#	@mkdir $@
#
#$(OUT_DIR):
#	@mkdir $@
#
#clean: $(OUT_DIR)
#	@rm -r $(OUT_DIR)



# SRC_FILES = ./source/main.c ./source/bar.c ./source/bar.c
#
# OBJ_FILES = $(patsubst ./source/%.c, ./build/%.o, $(SRC_FILES))
# OBJ_FILES = ./build/main.o ./build/bar.o ./build/bar.o

#all: $(OBJ_FILES)
#	@gcc $(OBJ_FILES) -o $(OBJ_DIR)/app.out
#
#$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
#	@echo Compilando $< 
#	@mkdir -p $(OBJ_DIR)
#	@gcc -o $@ -c $<