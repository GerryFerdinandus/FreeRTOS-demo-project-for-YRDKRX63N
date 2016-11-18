# project name
PROJECT_NAME=Renesas-RX-FreeRTOS-demo-project-for-YRDKRX63N

#include path for the *.h files
INCLUDE=\
	-I. \
	-Isrc \
	-Isubmodules/Renesas-RX-FreeRTOS/Source/include \
	-Isubmodules/Renesas-RX-FreeRTOS/Source/portable/GCC/RX600 \
	-Isubmodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/header \
	$(END)

# source code: asm files
SOURCE_ASM=\
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/reset_program.asm \
	$(END)

# source code: S files
SOURCE_S=\
	$(END)

# source code: c files
SOURCE_C=\
	submodules/Renesas-RX-FreeRTOS/Source/portable/GCC/RX600/port.c \
	submodules/Renesas-RX-FreeRTOS/Source/portable/GCC/MemMang/heap_4.c \
	submodules/Renesas-RX-FreeRTOS/Source/croutine.c \
	submodules/Renesas-RX-FreeRTOS/Source/event_groups.c \
	submodules/Renesas-RX-FreeRTOS/Source/list.c \
	submodules/Renesas-RX-FreeRTOS/Source/queue.c \
	submodules/Renesas-RX-FreeRTOS/Source/tasks.c \
	submodules/Renesas-RX-FreeRTOS/Source/timers.c \
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/sbrk.c \
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/hardware_setup.c \
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/interrupt_handlers.c \
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/reset_program.c \
	submodules/Renesas-RX-Board-Support-Package-for-YRDKRX63N/board/code/vector_table.c \
	src/FreeRTOSDemo.c \
	src/ParTest.c \
	src/main_blinky.c \
	$(END)

#compiler flag
CFLAGS=\
	-x c \
	-D__RX_LITTLE_ENDIAN__=1 \
	-mlittle-endian-data \
	-mcpu=rx600 \
	-Wall \
	-Werror \
	$(END)

# assembler flags with gcc
ASFLAGS=\
	-x assembler-with-cpp \
	$(END)

# linker flags
LDFLAGS=\
	-nostartfiles \
	-Wl,--gc-sections \
	-Wl,-Map=$(PROJECT_MAP) \
	-T linker.ld \
	-e_PowerON_Reset \
	$(END)


#process all the variable define above in the build.mk file
-include build.mk
