if draw_state==0{
    draw_self();
}else if draw_state==1{
    DrawSetAlign(fa_middle,fa_center);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2,scr,GUISCALE,GUISCALE,0);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2+ftHScaled,SCORE,GUISCALE-1,GUISCALE-1,0);
}
