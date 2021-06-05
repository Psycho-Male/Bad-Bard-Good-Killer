draw_set_font(font1);
if !audio_group_is_loaded(sfx_low){
    audio_group_load(sfx_low);
    audio_group_set_gain(sfx_low,1,0);
}
if !audio_group_is_loaded(aug_bgm){
    audio_group_load(aug_bgm);
}
