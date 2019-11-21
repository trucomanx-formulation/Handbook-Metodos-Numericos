
translate ([+0.05, 0, 0])
color([0.70, 0.50,0.30]) {
    import("Andro_mono.stl");
}
LL=3.0;
WW=2.0;
alpha=1/100;


translate ([-WW/2, -alpha*LL/2, -LL/2]) {
    color([0.20, 0.50,0.90,0.3]) 
    cube([WW,alpha*LL,LL]);
    
    color([0.00,0.00, 0.00,0.99]) 
    translate ([WW*0.55,2.6*alpha,LL*0.95])
    rotate([90,0, 0]) 
    linear_extrude(height = 4*alpha)
    text("Plano sagital", font = "Liberation Sans", size = 0.1);
}

 
translate ([-alpha*LL/2,-WW/2, -LL/2]) {
    color([0.90,0.20, 0.50,0.3])
    cube([alpha*LL,WW,LL]);
    
    color([0.00,0.00, 0.00,0.99]) 
    translate ([0,0,LL*0.95])
    rotate([90,0, 90]) 
    linear_extrude(height = 4*alpha)
    text("Plano frontal", font = "Liberation Sans", size = 0.1);
}


translate ([-WW/2, -WW/2, -alpha*LL/2]) {
    color([0.20,0.90, 0.50,0.3]) 
    cube([WW,WW,alpha*LL]);
    
    color([0,0.00, 0.00,0.99]) 
    translate ([0.05*WW,0.05*WW,0])
    linear_extrude(height = 4*alpha)
    text("Plano axial", font = "Liberation Sans", size = 0.1);
}

/////////////////////////////////////////////
HH=0.7;

translate ([-0.75*WW/2, -0.75*WW/2, -alpha*LL/2])
cylinder (h = HH, r=alpha, center = true, $fn=100);

translate ([0,-0.8*WW/2,0.8*LL/2])
rotate([90,0, 90]) 
cylinder (h = HH, r=alpha, center = true, $fn=100);

translate ([WW*0.40,1.9*alpha,LL*0.40])
rotate([90,0, 0]) 
cylinder (h = HH, r=alpha, center = true, $fn=100);


