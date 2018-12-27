#!/usr/bin/env sh
mkdir build >/dev/null 2>&1
if [ ! -f "build/rglfw.o" ]
then
    cc -O2 external/rglfw.c -c -o build/rglfw.o
fi
if [ ! -f "build/imgui.o" ]
then
    c++ -O2 -Iexternal/ external/imgui/imgui.cpp -c -o build/imgui.o
    c++ -O2 -Iexternal/ external/imgui/imgui_draw.cpp -c -o build/imgui_draw.o
    c++ -O2 -Iexternal/ external/imgui/imgui_widgets.cpp -c -o build/imgui_widgets.o
    c++ -O2 -Iexternal/ external/imgui/imgui_impl_glfw.cpp -c -o build/imgui_impl_glfw.o
    c++ -O2 -Iexternal/ external/imgui/imgui_impl_opengl3.cpp -c -o build/imgui_impl_opengl3.o
fi
c++ -g3 -lGL -lX11 -ldl -lpthread -Iexternal/ main.cpp build/*.o -o build/ControlApp