if sustain{
    if sustain_pressed{
        draw_sprite_ext(kb_susBg,1,x,y,1+sustain_scale,1,0,c_white,1);
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_yellow,1);
    }else{
        draw_sprite_ext(kb_susBg,0,x,y,1+sustain_scale,1,0,c_white,1);
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
    }
}else{
    draw_sprite_ext(kb_bg,0,x,y,image_xscale,image_yscale,0,c_white,1);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
}
