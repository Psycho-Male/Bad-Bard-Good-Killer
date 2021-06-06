//DrawSetAlignColor(fa_left,fa_top,c_black,1);
//draw_set_color(c_black);
//draw_rectangle(32,32,128,128,false);
//draw_set_color(c_white);
if room!=rm_main_menu{
    draw_sprite_ext(spr_counter_bg,0,Camera.gui_w,32*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    draw_sprite_ext(spr_money,0,Camera.gui_w-16*GUISCALE,32*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    DrawSetAlign(fa_right,fa_center);
    draw_text_transformed(Camera.gui_w-28*GUISCALE,32*GUISCALE,str(round(MONEY)),GUISCALE,GUISCALE,0);
}
