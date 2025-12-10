CXX = g++

SRC_DIR = src
LIB_DIR = lib
BUILD_DIR = build

SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(LIB_DIR)/*.cpp)

OBJ_FILES = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(SRC_FILES))

TARGET = program

# Domyślny target
all: $(TARGET)

# Linkowanie
$(TARGET): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $@

# Kompilacja plików cpp do build/
$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Sprzątanie
clean:
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: all clean