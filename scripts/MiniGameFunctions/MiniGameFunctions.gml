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
    with instance_create_depth(_x,_y,depth-1,MusicNote){
        sprite_index=_note;
        level=_level;
        switch sprite_index{
            case noteUp:
            key=vk_up;
            break;case noteLeft:
            key=vk_left;
            break;case noteDown:
            key=vk_down
            break;case noteRight:
            key=vk_right;
            break;case sustainUp:
            sustain=true;
            key=vk_up;
            break;case sustainLeft:
            sustain=true;
            key=vk_left;
            break;case sustainDown:
            sustain=true;
            key=vk_down
            break;case sustainRight:
            sustain=true;
            key=vk_right;
            break;
        }
        return id;
    }
}
function GetMiniGame(_sheet,_level,_tempo){
    with instance_create_layer(Camera.gui_w*.25,Camera.gui_h*.20,0,MiniGame){
        current_sheet=sheets[_sheet];
        level=_level;
        tempo=_tempo;
        return id;
    }
}
