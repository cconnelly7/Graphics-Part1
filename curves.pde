//**** NEVILLE INTERPOLATING CURVES AND ANIMATIONS *** Project 1 for CS3451
PNT Neville(float a, PNT A, float b, PNT B, float t) 
  {
  return LERP(A,((t-a)/(b-a)), B);
  }
  
PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float t) 
  {
    PNT Pab = Neville(a,A,b,B,t);
    PNT Pbc = Neville(b,B,c,C,t);
    PNT Pabc = Neville(a,Pab,c,Pbc,t);
  return  Pabc;
  }
  
PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float t) 
  {
  //**UG** ADD YOUR CODE HERE INSTEAD OF LINE BELOW
  PNT Pabc = Neville(a,A,b,B,c,C,t);
  PNT Pbcd = Neville(b,B,c,C,d,D,t);
  return Neville(a,Pabc,d,Pbcd,t);  // INCORRET SOLUTION PROVIDED AS PLACEHOLDER
  }

PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float t)
{
  PNT Pabcd = Neville(a,A,b,B,c,C,d,D,t);
  PNT Pbcde = Neville(b,B,c,C,d,D,e,E,t);
  return Neville(a,Pabcd,d,Pbcde,t);
}
PNT Neville(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float f, PNT F, float t)
{
  PNT Pabcde = Neville(a,A,b,B,c,C,d,D,e,E,t);
  PNT Pbcdef = Neville(b,B,c,C,d,D,e,E,f,F,t);
  return Neville(a,Pabcde,d,Pbcdef,t);
}


void drawNevilleCurve(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Neville(a,A,b,B,c,C,d,D,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }
    
void drawNevilleCurve(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float e, PNT E, float f, PNT F)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Neville(a,A,b,B,c,C,d,D,e,E,f,F,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }

void showNevilleConstruction(float a, PNT A, float b, PNT B, float c, PNT C, float d, PNT D, float t) 
  {
  //**UG** ADD HERE YOUR SHOW NEVILLE CONSTRUCTION CODE,
  
  PNT Red = Neville(a,A,b,B,t);
  fill(red); drawCircle(Red,5);
  PNT Green = Neville(b,B,c,C,t);
  fill(green); drawCircle(Green,15);
  PNT Blue = Neville(c,C,d,D,t);
  fill(blue); drawCircle(Blue,25);
  
  PNT Pabc = Neville(a,A,b,B,c,C,t);
  fill(red); drawCircle(Pabc,5);
  PNT Pbcd = Neville(b,B,c,C,d,D,t);
  fill(blue); drawCircle(Pbcd, 25);
  
  PNT Black = Neville(a, A, b, B, c, C, d, D, t);
  fill(black); drawCircle(Black, 30); noStroke();
 
  }

//**** BEZIER INTERPOLATING CURVES AND ANIMATIONS 
PNT Bezier(PNT A, PNT B, float t) 
  {
  return LERP(A,t,B);  
  }
  
PNT Bezier(PNT A, PNT B, PNT C, float t) 
  {
  PNT S = Bezier(A,B,t);
  PNT E = Bezier(B,C,t);
  return  Bezier(S,E,t);
  }
  
PNT Bezier(PNT A, PNT B, PNT C, PNT D, float t) 
  {
  PNT S = Bezier(A,B,C,t);
  PNT E = Bezier(B,C,D,t);
  return  Bezier(S,E,t);
  }

void drawBezierCurve(PNT A, PNT B, PNT C)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Bezier(A,B,C,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }

void drawBezierCurve(PNT A, PNT B, PNT C, PNT D)
    {
    float du=1./90;
    beginShape(); 
      for(float u=0; u<=1.+du/2; u+=du) 
        vert(Bezier(A,B,C,D,u)); // does not work yet (you must write that Neville function (in Tab points) )
    endShape(); 
    }
float findMidpointAngle(PNT A, PNT B, PNT Midpoint)
{
  //Calculate all the distances
  float AM = dist(A, B);
  float BM = dist(B, Midpoint);
  float AB = dist(A, Midpoint);
  
  return acos((sq(BM) + sq(AM) - sq(AB))/(2*BM*AM));
  
}
void showBezierConstruction(PNT A, PNT B, PNT C, PNT D, float t)
  {
  PNT Pab = Bezier(A,B,t),  Pbc = Bezier(B,C,t),  Pcd = Bezier(C,D,t);
  PNT          Pabc = Bezier(Pab,Pbc,t),      Pbcd = Bezier(Pbc,Pcd,t);
  PNT                   Pabcd = Bezier(Pabc,Pbcd,t);
  noFill();

  strokeWeight(14);
  stroke(orange,40); drawBezierCurve(A,B,C);   
  stroke(magenta,40); drawBezierCurve(B,C,D);  
  
  noStroke();
  fill(orange,100); drawCircle(Pabc,16); 
  fill(magenta,100); drawCircle(Pbcd,16);
  
  noFill();
 
  stroke(blue);
  strokeWeight(2);  drawEdge(A,B); drawEdge(B,C); drawEdge(C,D);
  strokeWeight(6);  drawEdge(A,Pab);  drawEdge(B,Pbc); drawEdge(C,Pcd);

  stroke(green);    
  strokeWeight(2);  drawEdge(Pab,Pbc); drawEdge(Pbc,Pcd); 
  strokeWeight(6); drawEdge(Pab,Pabc);  drawEdge(Pbc,Pbcd); 

  stroke(red);
  strokeWeight(2);  drawEdge(Pabc,Pbcd); 
  strokeWeight(6);  drawEdge(Pabc,Pabcd);  

  noStroke();
  float r=8;
  fill(blue); drawCircle(Pab,r); drawCircle(Pbc,r); drawCircle(Pcd,r);
  fill(green); drawCircle(Pabc,r); drawCircle(Pbcd,r); 
  fill(red); drawCircle(Pabcd,r);
  }
  
void drawArc(PNT A,PNT B,PNT C)
{
  strokeWeight(6); stroke(red,100);
    
    //Use law of cosines to find the angle next to the midpoint
    //Calculate all the distances
    float AB = dist(A, B);
    float BC = dist(B, C);
    float AC = dist(A, C);

    float midpointAngle =  acos((sq(BC) + sq(AC) - sq(AB))/(2*BC*AC));
    float complimentaryAngle = PI/2f - midpointAngle;
    float centerAngle = PI - 2 * complimentaryAngle;
    
    //Use law of sines to find the radius of the arc we will draw
    float radius = dist(A, C)*sin(complimentaryAngle)/sin(centerAngle);
    
    //Now using the radius and points A & M, find the coordiantes for the center of the circle
    float angleFromAtoC = - atan((C.y - A.y)/(C.x - A.x));
    float detProduct = det(V(A,B),V(B,C));
    float angleFromAtoCenter;
    PNT Center;
    Arc ret;
    if (detProduct < 0) // curve turns left
    {
      angleFromAtoCenter = angleFromAtoC + complimentaryAngle;
      if (A.x < C.x)
      {
       Center = new PNT(radius*cos(angleFromAtoCenter) + A.x, -radius*sin(angleFromAtoCenter) + A.y);
        arc(Center.x, Center.y, radius*2, radius*2, PI - angleFromAtoCenter - centerAngle,  PI - angleFromAtoCenter);
      } else 
      {
        Center = new PNT(- radius*cos(angleFromAtoCenter) + A.x, radius*sin(angleFromAtoCenter) + A.y);
        arc(Center.x, Center.y, radius*2, radius*2, PI - angleFromAtoCenter + 2* complimentaryAngle,  PI - angleFromAtoCenter + 2*complimentaryAngle + centerAngle);
      
      }
    }
    else // curve turns right
    {
      angleFromAtoC = angleFromAtoC + PI;
      angleFromAtoCenter = angleFromAtoC - complimentaryAngle;
      if (A.x > C.x)
      {
        Center = new PNT(A.x + radius*cos(angleFromAtoCenter), A.y - radius*sin(angleFromAtoCenter));
        arc(Center.x, Center.y, radius*2, radius*2, PI - angleFromAtoCenter,  PI - angleFromAtoCenter + centerAngle);
      }
      else
      {
        Center = new PNT(A.x - radius*cos(angleFromAtoCenter), A.y + radius*sin(angleFromAtoCenter));
        arc(Center.x, Center.y, radius*2, radius*2, PI - angleFromAtoCenter - 2* complimentaryAngle,  PI - angleFromAtoCenter + centerAngle + 2* complimentaryAngle);
      }
      
      
    }
    if (drawEdges)
    {
      strokeWeight(4); stroke(red,100);
      drawEdge(A, C);
      drawEdge(A, Center);
      drawEdge(C, Center);
    }
}
