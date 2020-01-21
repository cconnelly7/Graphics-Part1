void showHelpScreen()
    {
    background(yellow); // paints background in yellow
    //image(myFace, width-myFace.width/2,25,myFace.width/2,myFace.height/2); // displays picture of student
    image(myFace, width-150, 0, 150,150.*myFace.height/myFace.width);
    image(melanieFace, width-150, 150.*myFace.height/myFace.width, 150,150.*melanieFace.height/melanieFace.width);
    // image(myFace, width-myFace.width*1.,25,myFace.width/2,myFace.height/2); // displays picture of other student in team
    textAlign(LEFT, TOP);
    fill(black); // color for writing on screen (notice : writing text uses fill not stroke to define the color)
    int L=0; // line counter, incremented below for ech line
    writeLine("CLASS: CS3451 Fall 2018",L++);
   //writeLine("CLASS: CS6491 Fall 2018",L++); //*G use this in stead of the above line
    writeLine("PROJECT 1: Neville animation",L++);
    // writeLine("PROJECT 1: Morphing Quads",L++); //*G use this in stead of the above line
    writeLine("STUDENT: Chianne Connelly",L++); //**UG and G : Put your name here
    writeLine("PARTNER: Melanie Hall",L++); //**UG and G : Put your team partner's name here
    writeLine("MENU <SPACE>:hide/show",L++);
    writeLine("POINTS click&drag:closest, x:moveAll, z:zoomAll,",L++);
    writeLine("POINTS ]:square, /:align r:read, w:write",L++);
    writeLine("DISPLAY f:fill, #:Point IDs, v:vectors",L++);
    writeLine("ANIMATION a:on/off, ,/.:speedControl",L++);
    writeLine("Bezier b:curve, B:constructon",L++);
    writeLine("Neville n:curve, N:constructon",L++);
    writeLine("KNOTS 0:uniform, 1:chordal 2:centripetal, 3:scaling (use arrow keys to change value)",L++);
    writeLine("FILENAME FN C:set to content of clipboard",L++);
    writeLine("CAPTURE CANVAS to FN ~:pdf, !:jpg, @:tif, ':filming restart/stop",L++);
    writeLine("4 QUADS: 4:squares, R:read(FN), W:write(FN), f:fill, t:texture",L++);
    writeLine("CIRCULAR ARC INTERPOLATION: b, View construction lines: e",L++);
    writeLine("6 CONTROL POINT NEVILLE: 6 (to return to 4 point Neville, press 5)",L++);
    writeLine("Display the LERP edges of Bezier: d",L++);
    }
