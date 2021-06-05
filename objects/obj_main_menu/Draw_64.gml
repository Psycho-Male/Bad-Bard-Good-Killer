var _x=Camera.gui_w-GUISCALE;
var _y=Camera.gui_h-16*GUISCALE;
draw_sprite_ext(kb_enter,0,_x,_y,GUISCALE,GUISCALE,0,c_white,1);
DrawSetAlign(fa_right,fa_center);
draw_text_transformed(_x-42*GUISCALE,_y,"Confirm: ",GUISCALE,GUISCALE,0);
