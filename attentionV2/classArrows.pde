class Arrows {

  int xcoor, ycoor;
  String des;

  Arrows(int xcoorin, int ycoorin, String desin) {
    xcoor=xcoorin;
    ycoor=ycoorin;
    des=desin;
  }
  
  
  void display(int r,int g, int b) {
    int delta=20;
    int d2=round(delta/pow(3, 0.5));
    int sht=round(d2*1/2);
    int lng=delta;
    switch(des) {
    case "right":
      fill(r, g, b);
      triangle(xcoor+delta, ycoor, xcoor, ycoor-d2, xcoor, ycoor+d2);
      rect(xcoor-lng/2, ycoor, lng, sht);
      break;
    case "left":
      fill(r, g, b);
      triangle(xcoor-delta, ycoor, xcoor, ycoor-d2, xcoor, ycoor+d2);
      rect(xcoor+lng/2, ycoor, lng, sht);
      break;
    case "up":
      fill(r, g, b);
      triangle(xcoor, ycoor-delta, xcoor-d2, ycoor, xcoor+d2, ycoor);
      rect(xcoor, ycoor+lng/2, sht, lng);
      break;
    case "down":
      fill(r, g, b);
      triangle(xcoor, ycoor+delta, xcoor-d2, ycoor, xcoor+d2, ycoor);
      rect(xcoor, ycoor-lng/2, sht, lng);
      break;
    }
  }
}