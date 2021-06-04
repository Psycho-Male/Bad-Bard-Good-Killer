goto=undefined;
goto_alpha=0;
goto_fade=1;
if room==rm_init{
    room_goto(room_start);
    if !Exists(Pointer){
        instance_create_depth(0,0,-900,Pointer);
    }
    if !Exists(Camera){
        instance_create_depth(0,0,0,Camera);
    }
}
if room==rm_stage1{
    GetMiniGame(0,1,60);
}
