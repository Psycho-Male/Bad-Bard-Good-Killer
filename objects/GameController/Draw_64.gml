if IsDefined(goto){
    draw_sprite_ext(spr_fade,0,0,0,Camera.gui_w,Camera.gui_h,0,c_white,goto_alpha);
}
ArrayAdd(debug_text,"Money: "+str(MONEY));
ArrayAdd(debug_text,"Score: "+str(SCORE));
ArrayAdd(debug_text,"Key up: "+str(keyboard_key==vk_up));
ArrayAdd(debug_text,"Key left: "+str(keyboard_key==vk_left));
ArrayAdd(debug_text,"Key down: "+str(keyboard_key==vk_down));
ArrayAdd(debug_text,"Key right: "+str(keyboard_key==vk_right));
draw_set_color(c_black);
draw_rectangle(32,32,128,128,false);
draw_set_color(c_white);
for(var i=0;i<array_length(debug_text);i++){
    draw_text(32,32+i*10,debug_text[i]);
}
draw_sprite_ext(spr_money,0,Camera.gui_w-16*GUISCALE,32*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
DrawSetAlign(fa_right,fa_center);
draw_text_transformed(Camera.gui_w-24*GUISCALE,32*GUISCALE,str(MONEY),GUISCALE,GUISCALE,0);
draw_text_transformed(Camera.gui_w-24*GUISCALE,48*GUISCALE,str(round(SCORE)),GUISCALE,GUISCALE,0);
