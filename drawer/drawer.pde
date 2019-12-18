/**
    TODO: Lot's of reformatting.
    - Add some documentation and new drawing techniques.
*/
class Point {
    private color c;
    private int x;
    private int y;
    public Point(color c, int x, int y) {
        this.c = c;
        this.x = x;
        this.y = y;
    }
    public color getColor() { return c; }
    public int getX() { return x; }
    public int getY() { return y; }
}
String x;

void setup() {
    size(500, 500);
    background(50);
    noStroke();
    if (args != null) {
        x = args[0].replace(" ", "");
        x = x.replace("-", "");
        drawMem();
    } else {
        fill(0);
        textSize(32);
        text("No data given!", 15, 35);
    }
}
/**
    Draws some art based on the data arguments.
*/
void drawMem() { 
    Point[] vals = new Point[x.length() / 16];
    for (int i = 0; i < vals.length; i++) {
        color c = color(
                  Integer.parseInt(x.substring(i * 3, i * 3 + 3)),
                  Integer.parseInt(x.substring(i * 3 + 6, i * 3 + 9)),
                  Integer.parseInt(x.substring(i * 3 + 9, i * 3 + 12)),
                  100);
        int xpos = Integer.parseInt(x.substring(i * 3 + 12, i * 3 + 14));
        int ypos = Integer.parseInt(x.substring(i * 3 + 14, i * 3 + 16));
        Point p = new Point(c, xpos, ypos);
        vals[i] = p;
    }
    
    int cellW = width / vals.length;
    int cellsX = width / cellW;
    int cellH = height / vals.length;
    int cellsY = height/ cellH;
    
    int count = 0;
    for (int y = 0; y < cellsY; y++) {
        for (int x = 0; x < cellsX; x++) {
          //String hexVal = vals[count++];
          
          stroke(vals[count].getColor());
          strokeWeight(3);
          int xp = vals[count].getX() * 2;
          int yp = vals[count].getY() * 2;
          line(xp + cellW, yp, yp, xp);
          count++;
          if (count >= vals.length) {
              count = 0;
          }
          
        }
        count = y;
    }
}
