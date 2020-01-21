void  morphQuads(PNT A, PNT B, PNT C, PNT D, PNT[] Point, float time)
  {
  int i=0;
  A.setTo(LERP(Point[i],time,Point[12+i++]));
  B.setTo(LERP(Point[i],time,Point[12+i++]));
  C.setTo(LERP(Point[i],time,Point[12+i++]));
  D.setTo(LERP(Point[i],time,Point[12+i++]));
  }
 
