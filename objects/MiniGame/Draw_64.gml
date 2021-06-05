if draw_state==0{
    draw_self();
    draw_sprite_ext(spr_counter_bg,0,Camera.gui_w,32*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    draw_sprite_ext(spr_money,0,Camera.gui_w-16*GUISCALE,32*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    draw_sprite_ext(spr_counter_bg,0,Camera.gui_w,52*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    draw_sprite_ext(spr_happyface,0,Camera.gui_w-16*GUISCALE,52*GUISCALE,GUISCALE,GUISCALE,0,c_white,1);
    DrawSetAlign(fa_right,fa_center);
    draw_text_transformed(Camera.gui_w-28*GUISCALE,32*GUISCALE,str(MONEY),GUISCALE,GUISCALE,0);
    draw_text_transformed(Camera.gui_w-28*GUISCALE,52*GUISCALE,str(round(SCORE)),GUISCALE,GUISCALE,0);
}else if draw_state==1||draw_state==2{//Show Score
    DrawSetAlignColor(fa_middle,fa_center,c_white,1);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2+ftHScaled*0,"Music Score",GUISCALE,GUISCALE,0);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2+ftHScaled*1.25,scr,GUISCALE+1,GUISCALE+1,0);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2+ftHScaled*2.5,"Total Score",GUISCALE,GUISCALE,0);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2+ftHScaled*3.75,SCORE,GUISCALE+1,GUISCALE+1,0);
}
