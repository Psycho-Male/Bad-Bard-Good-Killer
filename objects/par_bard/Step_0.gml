cost=sqr(level)*(DIFFICULTY*cost_modifier);
depth=-y;
if sprite_index==sprite_death{
    if image_index>sprite_get_number(sprite_death)-1{
        image_speed=0;
    }
}
if room==rm_backstage1{
    SetImageScale(GUISCALE+1);
}else if room==rm_stage1{
    if sprite_index==spr_fuck2{
        SetImageScale(GUISCALE+1);
    }else{
        SetImageScale(GUISCALE);
    }
}
