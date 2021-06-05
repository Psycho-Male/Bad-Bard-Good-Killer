current_sequence=undefined;
step=0;
sequence_alpha=1;
sequence1_text=saveSection+" was a passionate, but talentless bard. All he wanted was peoples attention, love and money. Tonight "+playerName+" will play in a famous tavern with known musicians, 'I can finally show my true potential!', thought "+playerName+"...";
textbox={
    init:function(){
        sprite=spr_textbox;
        var _padding=16*GUISCALE;
        pos_x=[0,Camera.gui_w-_padding];
        pos_y=[Camera.gui_h*.6,Camera.gui_h-_padding];
        pos_inner_x=[pos_x[0]+_padding,pos_x[1]-_padding];
        pos_inner_y=[pos_y[0]+_padding,pos_y[1]-_padding];
        max_width=pos_inner_x[1]-pos_inner_x[0];
        text="";
        print="";
    },
    printout:function(_text){
        if print!=_text{
            print+=string_copy(_text,string_length(print)+1,1);
            if kp_anykey{
                print=_text;
            }
            return false;
        }
        return true;
    },
    draw:function(_text){
        DrawSetAlignColor(fa_left,fa_top,c_white,1);
        DrawSpritePart(sprite,0,pos_x[0],pos_y[0],pos_x[1],pos_y[1],GUISCALE);
        draw_text_ext_transformed(pos_inner_x[0],pos_inner_y[0],print,-1,max_width/GUISCALE,GUISCALE,GUISCALE,0);
        return printout(_text);
    },
}
textbox.init();
function sequence_opening(){
    switch step{
        case 0:
        DrawFade(sequence_alpha);
        DrawSpriteExt(spr_player,0,Camera.gui_w/2,Camera.gui_h/2,GUISCALE,0,undefined,sequence_alpha);
        if textbox.draw(sequence1_text){
            if kp_anykey{step++;}
        }
        break;case 1:
        if sequence_alpha>0{
            DrawFade(sequence_alpha);
            DrawSpriteExt(spr_player,0,Camera.gui_w/2,Camera.gui_h/2,GUISCALE,0,undefined,sequence_alpha);
            sequence_alpha-=alphaSpeed;
        }else{
            step++;
        }
        break;case 2:
        current_sequence=undefined;
        GetMiniGame(0,1,60);
        break;
    }
}
function draw_bards(_arr,_alpha,_selection){
    var _len=array_length(_arr)+1;
    var _gap=Camera.gui_w/_len;
    for(var i=0;i<array_length(_arr);i++) with _arr[i] {
        var _pos=[_gap+i*_gap,Camera.gui_h/2];
        if IsDefined(_selection)&&_selection==i{
            draw_sprite_ext(spr_cursor,0,_pos[0],_pos[1]-sprite_height,GUISCALE,GUISCALE,0,c_white,1);
        }
        draw_sprite_ext(sprite_index,0,_pos[0],_pos[1],image_xscale,image_yscale,0,c_white,_alpha);
        if _alpha>=1{
            draw_name(_pos[0],_pos[1]+12*GUISCALE);
            draw_cost(_pos[0],_pos[1]+22*GUISCALE);
        }
    }
}
function sequence_choose_target(){
    switch step{
        case 0:
        bards=[];
        bard_selection=0;
        with par_bard if object_index!=obj_player{
            ArrayAdd(other.bards,id);
        }
        sequence_alpha=0;
        step++;
        break;case 1:
        DrawFade(sequence_alpha);
        if sequence_alpha<1{
            sequence_alpha+=alphaSpeed;
            draw_bards(bards,sequence_alpha);
        }else{
            step++;
        }
        break;case 2:
        DrawFade(sequence_alpha);
        bard_selection=ClampCycle(bard_selection+inpHorizontal,array_length(bards));
        draw_bards(bards,sequence_alpha,bard_selection);
        var _currentBard=bards[bard_selection];
        var _name=_currentBard.name;
        var _cost=_currentBard.cost;
        var _text="Attempt to kill "+_name+" for "+str(_cost)+"?";
        DrawSetAlignColor(fa_middle,fa_center,c_white,1);
        draw_text_transformed(Camera.gui_w*.5,Camera.gui_h*.2,_text,GUISCALE,GUISCALE,0);
        draw_text_transformed(Camera.gui_w*.5,Camera.gui_h*.8,"Press ESC to skip.",GUISCALE,GUISCALE,0);
        if kp_escape{
            step++;
        }else if kp_enter{
            if MONEY>=_currentBard.cost{
                MONEY-=_currentBard.cost;
            }
        }
        break;case 3:
        break;
    }
}
