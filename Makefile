CC = clang
CFLAGS = -Wall -Iinclude
LDFLAGS = -Llib -lraylib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreAudio -framework CoreVideo

SRC = src/main.c
OUT = build/match3
RAYLIB_DIR = lib/raylib
RAYLIB_LIB = lib/libraylib.a
RAYLIB_HEADER = include/raylib.h

all: $(OUT)

# Rule to clone and build Raylib
$(RAYLIB_LIB) $(RAYLIB_HEADER):
	@echo "Cloning Raylib..."
	@if [ ! -d "$(RAYLIB_DIR)" ]; then \
    	git clone https://github.com/raysan5/raylib.git $(RAYLIB_DIR); \
    fi
	@echo "Building Raylib..."
	@mkdir -p $(RAYLIB_DIR)/build
	@cd $(RAYLIB_DIR)/build && cmake -DPLATFORM=Desktop -DCMAKE_BUILD_TYPE=Release .. && make
	@echo "Copying Raylib files..."
	@mkdir -p include lib
	@if [ -f "$(RAYLIB_DIR)/build/raylib/libraylib.a" ]; then \
        cp $(RAYLIB_DIR)/build/raylib/libraylib.a $(RAYLIB_LIB); \
    else \
        echo "Error: libraylib.a not found in $(RAYLIB_DIR)/build/raylib/"; \
        exit 1; \
    fi
	@cp $(RAYLIB_DIR)/src/raylib.h $(RAYLIB_HEADER)



# Rule to build the game
$(OUT): $(SRC) $(RAYLIB_LIB) $(RAYLIB_HEADER)
	@mkdir -p build
	$(CC) $(CFLAGS) $(SRC) -o $(OUT) $(LDFLAGS)

# Clean build artifacts
clean:
	rm -rf build/* $(RAYLIB_DIR)/build

# Clean everything, including cloned Raylib
clean-all: clean
	rm -rf $(RAYLIB_DIR) $(RAYLIB_LIB) $(RAYLIB_HEADER)

.PHONY: all clean clean-all
