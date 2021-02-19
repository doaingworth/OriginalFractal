int x;
    boolean up;

    public void setup() {
        size(900,900);
        x = 0;
        up = true;
    }

    public void draw() {
        for (int y = 0; y < 50; y++) {
            background(0);
            fractal(0, 0, width, x);
        }
        if (up) {
            x++;
            if (x == 5) {
                up = false;
            }
        }
        else {
            x--;
            if (x == 0) {
                up = true;
            }
        }
    }

    public void fractal(float x, float y, float length, int fract) {
        length = length / 3;
        if (fract != 0) {
            fractal(x,y,length,fract - 1);
            fractal(x + (2 * length),y,length,fract - 1);
            fractal(x + length,y + length,length,fract - 1);
            fractal(x,y + (2 * length),length,fract - 1);
            fractal(x + (2 * length),y + (2 * length),length,fract - 1);
        }
        else {
            beginShape();
            vertex(x, y);
            vertex(x + length,y);
            vertex(x + length, y + (3 * length));
            vertex(x, y + (3 * length));
            vertex(x, y + (2 * length));
            vertex(x + (3 * length), y + (2 * length));
            vertex(x + (3 * length), y + (3 * length));
            vertex(x + (2 * length), y + (3 * length));
            vertex(x + (2 * length), y);
            vertex(x + (3 * length), y);
            vertex(x + (3 * length), y + length);
            vertex(x, y + length);
            endShape(CLOSE);
        }
    }
