if DEBUG.enabled{
    draw_self();
}else{
    DrawSpritePart(sprite_index,image_index,x-hwidth-10,y-hheight-5,x+hwidth-10,y+hheight-5,GUISCALE);
}
DrawSetAlignColor(fa_center,fa_middle,text_color,1);
draw_text_transformed(x,y,text,GUISCALE,GUISCALE,0);
