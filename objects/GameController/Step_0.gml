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
