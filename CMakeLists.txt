cmake_minimum_required(VERSION 3.10)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(pico_sdk_import.cmake)

project(coil_stuff)

# initialize the Pico SDK
pico_sdk_init()

# rest of your project
add_executable(main
	main.c
)

#add pico_stdlib library which aggregates commonly used features
target_link_libraries(main pico_stdlib)

#enable USB output , disable UART output 
pico_enable_stdio_usb(main 1)
pico_enable_stdio_uart(main 0)

#CREATE MAP/BIN/HEX/UF2 in addition to HEX format
pico_add_extra_outputs(main)


