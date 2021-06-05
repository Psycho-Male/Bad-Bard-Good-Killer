if IsDefined(goto){
    goto_alpha+=goto_fade*.1;
    if goto_alpha==1{
        goto_fade=-1;
    }
}
if kp_tab{
    DEBUG.enabled=!DEBUG.enabled;
}
switch GAMESTATE{
    case stateOpening:
    break;case stateFirstSong:
    break;case stateSecondSong:
    break;case stateThirdSong:
    break;case stateFirstKill:
    break;case stateSecondKill:
    break;case stateThirdKill:
    break;
}
if room=rm_main_menu{
    if kp_anykey{
        //switch keyboard_key{
        //    case vk_up:
        //    SfxPlay([note_mi,note_re]);
        //    break;case vk_left:
        //    SfxPlay([note_si,note_sol]);
        //    break;case vk_down:
        //    SfxPlay([note_do,note_fa]);
        //    break;case vk_right:
        //    SfxPlay([note_la,note_mi]);
        //    break;
        //}
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
