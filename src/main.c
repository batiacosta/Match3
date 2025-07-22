#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

#define BOARD_SIZE 8
#define TILE_SIZE 42
#define TILE_TYPES 5

const char tile_chars[TILE_TYPES] = {'#', '@', '$', '%', '&'};
const int font_size = 20;
const int font_spacing = 1;
const int screen_width = 800;
const int screen_height = 800;

char board[BOARD_SIZE][BOARD_SIZE];
Vector2 grid_origin;

char RandomTile(){
    return tile_chars[rand() % TILE_TYPES];
}

void InitBoard(){
    for(int y = 0; y < BOARD_SIZE; y++){
        for(int x = 0; x < BOARD_SIZE; x++){
            board[x][y] = RandomTile();
        }
    }
    int grid_width = BOARD_SIZE * TILE_SIZE;
    int grid_height = BOARD_SIZE * TILE_SIZE;

    grid_origin = (Vector2){
        ((screen_width / 2) - grid_width) / 2, //GetScreenWidth()
        screen_height - (grid_height + TILE_SIZE * 0.9)   // GetScreenHeight() (screen_height - grid_height) / 2
    };

}

void DrawTiles(){
    for(int y = 0; y < BOARD_SIZE ; y++){
        for(int x = 0; x < BOARD_SIZE; x++){
            Rectangle tileCell = {
                grid_origin.x + (x * TILE_SIZE),
                grid_origin.y + (y * TILE_SIZE), // Tile position in x and y
                TILE_SIZE, TILE_SIZE  // Tile size in x and y
            };
            DrawRectangleLinesEx(tileCell, 1, DARKGRAY);

            DrawTextEx(
                GetFontDefault(),
                TextFormat("%c", board[y][x]), // Converts from Char to String the characters from board[][]
                (Vector2) { // position of the ASCII character
                    tileCell.x + 12, tileCell.y + 8
                },
                font_size,
                font_spacing,
                WHITE
            );
        }
    }
}
int main(void){

    InitWindow(screen_width, screen_height, "MATCH3 ASCII");
    SetTargetFPS(60);
    srand(time(NULL));

    InitBoard();

    while (!WindowShouldClose()) {
        // Game logic
        //
        BeginDrawing();
        ClearBackground(BLACK);

        DrawTiles();
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
