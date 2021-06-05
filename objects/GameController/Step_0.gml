if IsDefined(goto){
    goto_alpha+=goto_fade*alphaSpeed;
    if goto_alpha==1{
        goto_fade=-1;
        room_goto(goto);
    }
}
if kp_tab{
    DEBUG.enabled=!DEBUG.enabled;
}
if room==rm_stage1{
    switch GAMESTATE{
        case stateOpening:
        if !Exists(Cutscene){
            GetCutscene(stateOpening);
        }
        break;case stateFirstKill:
        break;case stateSecondKill:
        break;case stateThirdKill:
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
    with obj_point{
        if random(1)>.4{
            GetSpeechbox(obj_point,"Test");
            break;
        }
    }
}
