abc = (0,[4], [((0,"",""),(1,"$")),
               ((1,"a",""),(1,"x")),
               ((1,"a","y"),(1,"")),
               ((1,"",""),(2,"")),
               ((2,"b",""),(2,"x")),
               ((2,"b","y"),(2,"")),
               ((2,"",""),(3,"")),
               ((3,"c","x"),(3,"")),
               ((3,"c",""),(3,"y")),
               ((3,"a",""),(1,"x")),
               ((3,"a","y"),(1,"")),
               ((3,"b",""),(2,"x")),
               ((3,"b","y"),(2,"")),
               ((3,"","$"),(4,""))])

-- push an x onto the stack if reading in an a or b and stack is empty OR
-- pop a y off the stack if reading in an a or b and a y is on the top of the stack
-- push a y onto the stack if reading in a c and the stack is empty 
-- pop an x off the stack if reading in a c and there is an x on the top of the stack
-- push a y every time you loop around.
