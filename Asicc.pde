int cols = 8;
int rows = 8;
int cellSize;
color[] colors = {#FFB6C1, #FFA07A, #FFD700, #98FB98, #ADD8E6, #9370DB};
int currentColorIndex = 0;
int revealedRows = 0;
boolean revealLine = false;

void setup() {
  size(400, 400);
  cellSize = width / cols;
  frameRate(5); 
  noLoop();
}

void draw() {
  background(255); 

  for (int row = 0; row < revealedRows; row++) {
    for (int col = 0; col < cols; col++) {
      int x = col * cellSize;
      int y = row * cellSize;
      fill(colors[currentColorIndex]);
      rect(x, y, cellSize, cellSize);
      currentColorIndex = (currentColorIndex + 1) % colors.length;
    }
  }

  if (revealLine && revealedRows < rows) {
    revealedRows++;
    revealLine = false;
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) { 
    revealedRows = 0;
    currentColorIndex = 0;
    redraw();
  } else {
    revealLine = true;
    redraw();
  }
}
