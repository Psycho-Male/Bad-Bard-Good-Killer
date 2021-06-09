if IsDefined(goto){
    draw_sprite_ext(spr_fade,0,0,0,Camera.gui_w,Camera.gui_h,0,c_white,goto_alpha);
}
if DEVLOGIN{
    DrawSetAlignColor(fa_left,fa_top,c_white,1);
    for(var i=0;i<array_length(debug_text);i++){
        draw_text(32,32+i*10,debug_text[i]);
    }
}
