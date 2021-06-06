#macro noteUp       kb_up
#macro noteLeft     kb_left
#macro noteDown     kb_down
#macro noteRight    kb_right
#macro sustainUp    kb_susUp
#macro sustainLeft  kb_susLeft
#macro sustainDown  kb_susDown
#macro sustainRight kb_susRight
function GetNote(_x,_y,_note,_level){
    if IsUndefined(_note){exit;}
    with instance_create_depth(_x,_y,depth-1-instance_number(MusicNote),MusicNote){
        sprite_index=_note;
        level=_level;
        switch sprite_index{
            case noteUp:
            key=keycodeUp;
            break;case noteLeft:
            key=keycodeLeft;
            break;case noteDown:
            key=keycodeDown;
            break;case noteRight:
            key=keycodeRight;
            break;case sustainUp:
            sustain=true;
            key=keycodeUp;
            break;case sustainLeft:
            sustain=true;
            key=keycodeLeft;
            break;case sustainDown:
            sustain=true;
            key=keycodeDown;
            break;case sustainRight:
            sustain=true;
            key=keycodeRight;
            break;
        }
        return id;
    }
}
function GetMiniGame(_sheet,_level,_tempo){
    with par_bard{
        sprite_index=sprite_play;
    }
    with instance_create_layer(Camera.gui_w*.25,Camera.gui_h*.20,0,MiniGame){
        current_sheet=sheets[_sheet];
        current_music=musics[_sheet];
        level=_level;
        tempo=_tempo;
        return id;
    }
}
