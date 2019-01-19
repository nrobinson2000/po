# Makefile for the Particle Workbench
# Supports local compile and local flash for Particle projects
#
# Inputs:
# PARTICLE_CLI_PATH: path to the Particle CLI executable
# DEVICE_OS_PATH: path to the source code of the Particle DeviceOS
# APPDIR: path to the user application sources
# PLATFORM: the name of the Particle platform to compile for

all: flash-all

# Convert Wiring files (ino) files to C++ files (cpp)
INO_FILES := $(wildcard $(APPDIR)/*.ino) $(wildcard $(APPDIR)/src/*.ino)
PREPROCESSED_FILES := $(patsubst %.ino,%.cpp,$(INO_FILES))

preprocess: $(PREPROCESSED_FILES)
$(PREPROCESSED_FILES): %.cpp: %.ino
	"${PARTICLE_CLI_PATH}" preprocess $<

# Get rid of compiled files in the user part
clean-user:
	cd "${DEVICE_OS_PATH}/main" && make clean

# Get rid of compiled files in the user and system parts
clean-all:
	cd "${DEVICE_OS_PATH}/modules" && make clean

# Get rid of compiled files for debug build
clean-debug:
	cd "${DEVICE_OS_PATH}/main" && make clean MODULAR=n USE_SWD_JTAG=y

# Compile the user part
compile-user: preprocess
	cd "${DEVICE_OS_PATH}/main" && make all

# Compile the user and system parts
compile-all: preprocess
	cd "${DEVICE_OS_PATH}/modules" && make all

# Compile debug build
compile-debug:
	cd "${DEVICE_OS_PATH}/main" && make all MODULAR=n USE_SWD_JTAG=y

# Compile and flash the user part
flash-user: preprocess
	cd "${DEVICE_OS_PATH}/main" && make program-dfu

# Compile and flash the user and system parts
flash-all: preprocess
	cd "${DEVICE_OS_PATH}/modules" && make program-dfu

# Compile and flash debug build
flash-debug:
	cd "${DEVICE_OS_PATH}/main" && make program-dfu MODULAR=n USE_SWD_JTAG=y

.PHONY: all preprocess clean-user clean-all clean-debug compile-user compile-all compile-debug flash-user flash-all flash-debug
