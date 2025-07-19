#include "raylib.h"

int main(void) {
    InitWindow(800, 600, "Match 3 Game");
    SetTargetFPS(60);

    // Explicitly load default font
    Font font = GetFontDefault();

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(BLUE);
        DrawRectangle(300, 280, 100, 50, RED);
        DrawTextEx(font, "Hello, Match 3!", (Vector2){300, 280}, 20, 1, DARKGRAY); // Use DrawTextEx
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
