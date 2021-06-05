goto=undefined;
goto_alpha=0;
goto_fade=1;
if room==rm_init{
    if file_exists(saveName)&&!DEVLOGIN{
    //if file_exists(saveName){
        GAMESTATE=ini_read(saveName,saveSection,"state");
        SCORE=ini_read(saveName,saveSection,"score");
        MONEY=ini_read(saveName,saveSection,"money");
        room_goto(asset_get_index(ini_read(saveName,saveSection,"room")));
    }else{
        room_goto(room_start);
        if !Exists(Pointer){CreateDepth(Pointer,-900);}
        if !Exists(Camera){CreateDepth(Camera);}
    }
}
if room!=rm_main_menu{
    SaveGame();
}else{
    CreateDepth(obj_main_menu);
}
if room==rm_stage1{
    GetMiniGame(0,1,60);
}
