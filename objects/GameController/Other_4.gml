goto=undefined;
goto_alpha=0;
goto_fade=1;
if room==rm_init{
    room_goto(room_start);
    if !Exists(Pointer){CreateDepth(Pointer,-900);}
    if !Exists(Camera){CreateDepth(Camera);}
}
if room!=rm_main_menu{
    SaveGame();
}else{
    CreateDepth(obj_main_menu);
}
if room==rm_stage1{
    AmbPlay(amb_stage1);
}else if room==rm_backstage1{
    AmbPlay(amb_backstage1);
}
