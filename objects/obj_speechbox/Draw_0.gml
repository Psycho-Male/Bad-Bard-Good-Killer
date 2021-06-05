DrawSpritePart(sprite_index,0,pos_x[0],pos_y[0],pos_x[1],pos_y[1],GUISCALE,alpha);
draw_sprite_ext(sprite_index,1,tail_pos[0],tail_pos[1],GUISCALE,GUISCALE,0,c_white,alpha)
DrawSetAlignColor(fa_middle,fa_center,c_black,alpha);
draw_text_transformed(text_x,text_y,text,GUISCALE,GUISCALE,0);
