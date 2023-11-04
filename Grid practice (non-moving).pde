int cols = 8;
int rows = 8;
int cellSize;
color[] colors = {#FFB6C1, #FFA07A, #FFD700, #98FB98, #ADD8E6, #9370DB};
int currentColorIndex = 0;

void setup() {
  size(400, 400);
  cellSize = width / cols;
  noLoop();
  drawCheckers();
}

void draw() {
  // No continuous drawing needed here.
}

void drawCheckers() {
  background(255); // Set the background to white

  for (int col = 0; col < cols; col++) {
    for (int row = 0; row < rows; row++) {
      int x = col * cellSize;
      int y = row * cellSize;
      fill(colors[currentColorIndex]);
      rect(x, y, cellSize, cellSize);
      currentColorIndex = (currentColorIndex + 1) % colors.length;
    }
  }
}

void mouseClicked() {
  currentColorIndex = (currentColorIndex + 1) % colors.length;
  drawCheckers(); // Redraw the checkers with the new color
}
