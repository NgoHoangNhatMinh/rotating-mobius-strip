cmake_minimum_required(VERSION 3.10)
project(RotatingMobiusStrip)

find_package(glfw3 REQUIRED)

# Add external libraries
add_library(glad external/glad/src/glad.c)
target_include_directories(glad PUBLIC external/glad/include)

add_subdirectory(external/glm)

add_library(stb_image external/stb_image/stb_image.cpp)
target_include_directories(stb_image PUBLIC external/stb_image)

# Add the executable
add_executable(rotating-mobius-strip rms.cpp)

# Link libraries
target_link_libraries(rotating-mobius-strip PRIVATE glfw glad glm stb_image )
