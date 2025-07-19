# Match3
Match3 game in C and Raylib

## Overview
This project is a Match 3 game built using C and the Raylib library. It includes a `Makefile` to build the project and a `run_match3.sh` script to automate cleaning, building, and running the game. The game currently displays a placeholder window, with plans to add an 8x8 grid, tile swapping, and match detection.

## Prerequisites
Ensure the following tools are installed before cloning and running the project:

- **All Platforms**:
  - `git`: For cloning the repository.
  - `cmake`: For building Raylib.
  - `make`: For running the `Makefile`.
  - A C compiler (`clang` or `gcc`).

- **macOS**:
  ```bash
  brew install git cmake
  xcode-select --install  # Installs clang and make

- **Linux**:
  ```bash
  sudo apt-get install git cmake build-essential libgl1-mesa-dev libasound2-dev

- **Windows**
  - Use Git Bash or WSL (Windows Subsystem for Linux) for bash compatibility.
  - For native Windows, install MinGW:
  ```bash
  pacman -S mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake git

## Installation
1. Clone the project to your local machine:
  ```bash
  git clone https://github.com/batiacosta/Match3.git
  cd Match3

2. Building and Running
The project uses a Makefile to build Raylib and the game, and a run_match3.sh script to automate the process.Using the ScriptMake the script executable (macOS/Linux):
    ```bash
    chmod +x run_match3.sh
- Run the script
    ```bash
    ./run_match3.sh
