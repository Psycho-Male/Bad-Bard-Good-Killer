draw_set_font(font1);
if !audio_group_is_loaded(sfx_low){
    audio_group_load(sfx_low);
    audio_group_set_gain(sfx_low,.5,0);
}
if !audio_group_is_loaded(aug_bgm){
    audio_group_load(aug_bgm);
}
if !audio_group_is_loaded(aug_amb){
    audio_group_load(aug_amb);
}
fade_out_list=ds_list_create();
fade_in_list=ds_list_create();
gamestate_checked=false;
key_list=[
vk_w,vk_up,
vk_a,vk_left,
vk_s,vk_down,
vk_d,vk_right,
];
