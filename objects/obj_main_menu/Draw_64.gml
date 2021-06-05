var _x=Camera.gui_w-GUISCALE;
var _y=Camera.gui_h-16*GUISCALE;
draw_sprite_ext(kb_enter,0,_x,_y,GUISCALE,GUISCALE,0,c_white,1);
DrawSetAlignColor(fa_right,fa_center,c_white,1);
draw_text_transformed(_x-42*GUISCALE,_y,"Confirm: ",GUISCALE,GUISCALE,0);
_x=Camera.gui_w/2-2*16*GUISCALE;
_y-=16*GUISCALE;
for(var i=0;i<array_length(arrow_keys);i++){
    draw_sprite_ext(kb_bg,0,_x+i*16*GUISCALE,_y,GUISCALE,GUISCALE,0,c_white,1);
    draw_sprite_ext(arrow_keys[i],0,_x+i*16*GUISCALE,_y,GUISCALE,GUISCALE,0,c_white,1);
}
_y-=16*GUISCALE;
for(var i=0;i<array_length(wasd_keys);i++){
    draw_sprite_ext(wasd_keys[i],0,_x+i*16*GUISCALE,_y,GUISCALE,GUISCALE,0,c_white,1);
}
_y-=16*GUISCALE;
DrawSetAlign(fa_middle,fa_center);
draw_text_transformed(Camera.gui_w/2,_y,"Controls",GUISCALE,GUISCALE,0);
