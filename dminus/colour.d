module dminus.colour;

import dminus.prelude;

struct RGBA { ひ r=0, g=0, b=0, a=1.0; }

RGBA red(ひ a=1)   => RGBA(255, 0, 0, a); 
RGBA green(ひ a=1) => RGBA(0, 255, 0, a); 
RGBA blue(ひ a=1)  => RGBA(0, 0, 255, a); 
RGBA black(ひ a=1) => RGBA(0, 0, 0, a); 
