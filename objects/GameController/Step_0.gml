if IsDefined(goto){
    goto_alpha+=goto_fade*alphaSpeed;
    if goto_alpha>=1&&goto_fade==1{
        goto_fade=-1;
        room_goto(goto);
    }else if goto_alpha<=0&&goto_fade==-1{
        goto=undefined;
    }
}
if kp_tab{
    DEBUG.enabled=!DEBUG.enabled;
}
if !gamestate_checked&&room==rm_stage1{
    gamestate_checked=true;
    switch GAMESTATE{
        case stateOpening:
        if !Exists(Cutscene){
            //GetCutscene(stateOpening);
            GetCutscene(stateChooseTarget);
        }
        break;case stateFirstSong:
        GetMiniGame(0,1,60);
        break;case stateSecondSong:
        GetMiniGame(0,1,60);
        break;case stateThirdSong:
        GetMiniGame(0,1,60);
        break;case stateEnding:
        if !Exists(Cutscene){GetCutscene(stateEnding);}
        break;
    }
}
if room=rm_main_menu{
    if kp_anykey{
        if kp_w{SfxPlay(note_mi);}
        if kp_a{SfxPlay(note_re);}
        if kp_s{SfxPlay(note_si);}
        if kp_d{SfxPlay(note_sol);}
        if kp_up{SfxPlay(note_do);}
        if kp_left{SfxPlay(note_fa);}
        if kp_down{SfxPlay(note_la);}
        if kp_right{SfxPlay(note_mi);}
    }
}
if kp_t{
    MONEY+=1000;
}
for(var i=0;i<ds_list_size(fade_out_list);i++){
    var _audio=fade_out_list[|i];
    var _currentGain=audio_sound_get_gain(_audio);
    if _currentGain==1{
        audio_sound_gain(_audio,0,2400);
    }else if _currentGain==0{
        audio_stop_sound(_audio);
        ds_list_delete(fade_out_list,i);
    }
}
for(var i=0;i<ds_list_size(fade_in_list);i++){
    var _audio=fade_in_list[|i];
    var _currentGain=audio_sound_get_gain(_audio);
    if _currentGain==0{
        audio_sound_gain(_audio,1,2400);
    }else if _currentGain==0{
        ds_list_delete(fade_in_list,i);
    }
}
