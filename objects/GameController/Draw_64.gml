if IsDefined(goto){
    draw_sprite_ext(spr_fade,0,0,0,Camera.gui_w,Camera.gui_h,0,c_white,goto_alpha);
}
//DrawSetAlignColor(fa_left,fa_top,c_black,1);
//draw_set_color(c_black);
//draw_rectangle(32,32,128,128,false);
//draw_set_color(c_white);
for(var i=0;i<array_length(debug_text);i++){
    draw_text(32,32+i*10,debug_text[i]);
}
