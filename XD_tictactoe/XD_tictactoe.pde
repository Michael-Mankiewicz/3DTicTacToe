Cube[][][] cubes = new Cube[3][3][3];
ArrayList<Cube> oneCubes = new ArrayList<Cube>();//PlayerOne's Current Positions
ArrayList<Cube> twoCubes = new ArrayList<Cube>();//PlayerTwo's Current Positions
int rX,rY,rW,rH;
int cubeIndex, winner;//if player 1 wins, winner = 1, player 2 = 2, nobody wins = 0. so during the game winner is 0
boolean PlayerOneTurn;
int wsw = 5;//winning stroke width
color bC;//background color

void setup(){

  bC = color(25);
  rX = width-100;rY = 75;rW = 100;rH = 50;
  background(bC);
  PlayerOneTurn = true;
  size(1000,1000,P3D);
  rectMode(CENTER); //make the positions relative to the center of each rectangle rather than the topleft corner, which is default
  strokeWeight(0);
  stroke(255);
  textAlign(CENTER);
  //creating the 3D tictactoe board
  for(int i = 0; i < 3; i++)//layers
    for(int j = 1; j <= 3; j++)//rows
      for(int k = 1; k <= 3; k++){//columns
        cubes[k-1][j-1][i] = new Cube(k-1,j-1,i);//assign
        cubes[k-1][j-1][i].display();
      } 
textSize(30);
  if(PlayerOneTurn){
      fill(100,100,255);
      text("Player One's Turn", 200, 100);
    } else if(!PlayerOneTurn && winner == 0) {
      fill(255,100,100);
    }textSize(20);
    fill(255);
    text("Player One Coords", 200, 300);
    text("Player Two Coords", width-200, 300);
    fill(bC);
    strokeWeight(wsw);
    rect(rX, rY, rW, rH);
    fill(255);
    text("Reset", width-100, 82);
    strokeWeight(0);
   
}
void draw(){
}

void mouseReleased(){//when I release a mouse button
  background(bC);
  fill(255);
  if(mouseX<= rX+rW/2 && mouseX >=rX-rW/2 && mouseY <= rY + rH/2 && mouseY >=rY - rH/2){
      for(int i = 0; i < 3; i++)//layers to the tictactoe board
        for(int j = 0; j < 3; j++)//rows
          for(int k = 0; k < 3; k++){
            cubes[k][j][i].type = 0;
            oneCubes.clear();
            twoCubes.clear();
            PlayerOneTurn = true;
            winner = 0;
          }
    }
  
  for(int i = 0; i < 3; i++)//layers to the tictactoe board
      for(int j = 0; j < 3; j++)//rows
        for(int k = 0; k < 3; k++){
          if(cubes[k][j][i].checkHover() && cubes[k][j][i].type == 0 && winner == 0){           
              if(PlayerOneTurn){
                 cubes[k][j][i].type = 1;
                 oneCubes.add(new Cube(k,j,i));
              } else {
                 cubes[k][j][i].type = 2;
                 twoCubes.add(new Cube(k,j,i));
              }
              PlayerOneTurn = !PlayerOneTurn;
        }
      if(cubes[k][j][i].type == 1){      
          fill(100,100,255);
      } else if(cubes[k][j][i].type == 2){   
          fill(255,100,100);
      } else {
          fill(255);
      }   
      cubes[k][j][i].display();
      }

  for(int l = 0; l < oneCubes.size(); l++){  
    int x = oneCubes.get(l).x;
    int y = oneCubes.get(l).y;
    int z = oneCubes.get(l).z;
    fill(255);
    text("("+(oneCubes.get(l).x+1)+","+(oneCubes.get(l).y+1)+","+(oneCubes.get(l).z+1)+")", 200, 325 + 25*l);
    fill(100,100,255);
    for(int m = -1; m <= 1; m++){
      if(z + m > 2 || z + m < 0)
        continue; 
      for(int n = -1; n <= 1; n++){
        if(y + n > 2 || y + n < 0)
          continue; 
        for(int o = -1; o <= 1; o++){
          if(x + o > 2 || x + o < 0 ||(o==0&&n==0&&m==0))
            continue;
          if(cubes[x+o][y+n][z+m].type == cubes[x][y][z].type){
            if(x+2*o <= 2 && x + 2*o >=0 && y+2*n <= 2 && y + 2*n >=0 && z+2*m <= 2 && z + 2*m >=0)
            if(cubes[x+2*o][y+2*n][z+2*m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x+2*o][y+2*n][z+2*m].display();}
            if(x-o <= 2 && x-o >= 0 && y-n <= 2 && y-n >= 0 && z-m <= 2 && z-m >= 0)
            if(cubes[x-o][y-n][z-m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x-o][y-n][z-m].display();}
            if(x-2*o <= 2 && x-2*o >= 0 && y-2*n <= 2 && y-2*n >= 0 && z-2*m <= 2 && z-2*m >= 0)
            if(cubes[x-2*o][y-2*n][z-2*m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x-2*o][y-2*n][z-2*m].display();}
          }
        }
      } 
    }
  }
  strokeWeight(0);
  fill(255);
  for(int l = 0; l < twoCubes.size(); l++){
    int x = twoCubes.get(l).x;
    int y = twoCubes.get(l).y;
    int z = twoCubes.get(l).z;
    fill(255);
    text("("+(twoCubes.get(l).x+1)+","+(twoCubes.get(l).y+1)+","+(twoCubes.get(l).z+1)+")", width-200, 325 + 25*l);
    fill(255,100,100);
    for(int m = -1; m <= 1; m++){
      if(z + m > 2 || z + m < 0)
        continue; 
      for(int n = -1; n <= 1; n++){
        if(y + n > 2 || y + n < 0)
          continue; 
        for(int o = -1; o <= 1; o++){
          if(x + o > 2 || x + o < 0 ||(o==0&&n==0&&m==0))
            continue;
          if(cubes[x+o][y+n][z+m].type == cubes[x][y][z].type){
            if(x+2*o <= 2 && x + 2*o >=0 && y+2*n <= 2 && y + 2*n >=0 && z+2*m <= 2 && z + 2*m >=0)
            if(cubes[x+2*o][y+2*n][z+2*m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x+2*o][y+2*n][z+2*m].display();}
            if(x-o <= 2 && x-o >= 0 && y-n <= 2 && y-n >= 0 && z-m <= 2 && z-m >= 0)
            if(cubes[x-o][y-n][z-m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x-o][y-n][z-m].display();}
            if(x-2*o <= 2 && x-2*o >= 0 && y-2*n <= 2 && y-2*n >= 0 && z-2*m <= 2 && z-2*m >= 0)
            if(cubes[x-2*o][y-2*n][z-2*m].type == cubes[x][y][z].type){
                winner = cubes[x][y][z].type;strokeWeight(wsw);cubes[x][y][z].display();cubes[x+o][y+n][z+m].display();cubes[x-2*o][y-2*n][z-2*m].display();}
          }
        }
      } 
    }
  }
 strokeWeight(0);
    fill(255);
 strokeWeight(0);textSize(20);
    
     textSize(30);
  if(PlayerOneTurn && winner == 0){
      fill(100,100,255);
      text("Player One's Turn", 200, 100);
    } else if(!PlayerOneTurn && winner == 0) {
      fill(255,100,100);
      text("Player Two's Turn", 200, 100);
    }fill(255);textSize(20);
    text("Player One Coords", 200, 300);
    text("Player Two Coords", width-200, 300);
  if(winner != 0){
  //background(bC);
  textSize(80);
  if(winner == 1){
    fill(100,100,255);
  }else{
    fill(255,100,100);
  }
  text("Player "+ winner + "\nWon!", 200, 100);
  }fill(255);
  if(oneCubes.size()+twoCubes.size()==27 && winner==0)
    text("How?", 200, 100);
  textSize(20);
   fill(bC);
    strokeWeight(wsw);
    rect(width-100, 75, 100, 50);
    fill(255);
    text("Reset", width-100, 82);
    strokeWeight(0);
}


  
