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

String x = "08053063680805306368149520382432767184298215232767149515023232767184307598032767";
String x1 = "05368709120536870912149520382432767184298215232767149515023232767184307598032767000000000000";
String x3 = "0107374182401073741824149520382432767184298215232767149515023232767184307598032767000000000000000000000000000000000000";
void setup() {
    
    if (args.length > 0) {
        x = args[0].replace(" ", "");
        x = x.replace("-", "");
    }
    print("Starting...\n\n");
    print(args);
    size(500, 500);
    background(255);
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
    noStroke();
    int cellW = width / vals.length;
    int cellsX = width / cellW;
    int cellH = height / vals.length;
    int cellsY = height/ cellH;
    
    int count = 0;
    for (int y = 0; y < cellsY; y++) {
        for (int x = 0; x < cellsX; x++) {
          //String hexVal = vals[count++];
          
          fill(vals[count].getColor());
          rect(vals[count].getX(), vals[count].getY(), cellW * vals[count].getX(), cellH);
          count++;
          if (count >= vals.length) {
              count = 0;
          }
          
        }
        count = y;
    }
}
