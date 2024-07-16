public class Cube{
  
  public int x,y,z,type;
  int sP;
  int lP;
  Cube(int x_, int y_, int z_){
  x = x_;
  y = y_;
  z = z_;
  }
  
  void display(){
    if(width<height){
      sP = width;
      lP = height;
    }else {
      sP = height;
      lP = width;
    }
    
    
   rect((x-1) * ((sP*2/25)+(sP*2/25)/10) + width/2 , ((y-1) * ((sP*2/25)+(sP*2/25)/10) + height/2) + ((z-1) * sP /  3 - 10), sP*2/25, sP*2/25);
  }
  
  boolean checkHover(){
    float rectXCenterPos = (x-1) * ((sP*2/25)+(sP*2/25)/10) + width/2 ;
    float rectYCenterPos = ((y-1) * ((sP*2/25)+(sP*2/25)/10) + height/2) + ((z-1) * sP /  3 - 10);
    if(mouseX < rectXCenterPos + sP*2/25/2 && rectXCenterPos - sP*2/25/2 < mouseX && mouseY < rectYCenterPos + sP*2/25/2 && rectYCenterPos - sP*2/25/2 < mouseY)
      return true;
    return false;
  }
}
