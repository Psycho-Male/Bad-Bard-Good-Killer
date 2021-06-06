timer=0;
current_sequence=undefined;
current_bard=noone;
step=0;
sequence_alpha=1;
sequence1_text=saveSection+" was a passionate, but talentless bard. All he wanted was peoples attention, love and money. Tonight "+playerName+" will play in a famous tavern with known musicians, 'I can finally show my true potential!', thought "+playerName+"...";
assasination1_text=playerName+" is now one step closer to being acknowledged bard in town. No one would ever take the risk "+playerName+" took, no one is passionate about this as much as "+playerName+", they don't deserve no fame, love nor money. This is real art, she's deserves everything...";
function timeout(_step){
    if timer>=0{
        timer-=1/60;
        return false;
    }else{
        if _step{step++;}
        return true;
    }
}
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
        DrawSpriteExt(spr_bard4_idle,0,Camera.gui_w/2,Camera.gui_h/2,GUISCALE,0,undefined,sequence_alpha);
        if textbox.draw(sequence1_text){
            if kp_anykey{step++;}
        }
        break;case 1:
        if sequence_alpha>0{
            DrawFade(sequence_alpha);
            DrawSpriteExt(spr_bard4_idle,0,Camera.gui_w/2,Camera.gui_h/2,GUISCALE,0,undefined,sequence_alpha);
            sequence_alpha-=alphaSpeed;
        }else{
            step++;
        }
        break;case 2:
        current_sequence=undefined;
        GetMiniGame(0,1,60);
        GAMESTATE++;
        Destroy();
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
        BgmPlay(bgm_tension);
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
        if inpHorizontal!=0{
            bard_selection=ClampCycle(bard_selection+inpHorizontal,array_length(bards));
            SfxPlay(sfx_bard_choice_change1);
        }
        draw_bards(bards,sequence_alpha,bard_selection);
        current_bard=bards[bard_selection];
        var _name=current_bard.name;
        var _cost=current_bard.cost;
        var _text="Assasinate "+_name+" for "+str(_cost)+"?";
        DrawSetAlignColor(fa_middle,fa_center,c_white,1);
        draw_text_transformed(Camera.gui_w*.5,Camera.gui_h*.2,_text,GUISCALE,GUISCALE,0);
        draw_text_transformed(Camera.gui_w*.5,Camera.gui_h*.8,"Press ESC to skip.",GUISCALE,GUISCALE,0);
        if kp_escape{
            //step++;
        }else if kp_enter&&MONEY>=current_bard.cost{
            SfxPlay(sfx_bard_choose1);
            MONEY-=current_bard.cost;
            with par_bard{
                visible=false;
            }
            step++;
            GameController.goto=rm_backstage1;
        }
        break;case 3:
        if room==rm_backstage1{
            step=0;
            current_sequence=sequence_assasination;
            sequence_alpha=1;
        }
        break;
    }
}
function sequence_assasination(){
    switch step{
        case 0:
        DrawFade(sequence_alpha);
        MoveTo(current_bard,"target");
        MoveTo(obj_player,"killer1");
        with current_bard{
            visible=true;
            image_xscale=GUISCALE+1;
            image_yscale=GUISCALE+1;
        }
        with obj_player{
            visible=true;
            image_xscale=-(GUISCALE+1);
            image_yscale=GUISCALE+1;
        }
        sequence_alpha-=alphaSpeed;
        if sequence_alpha<=0{
            GetSpeechbox(current_bard,"Ew, it's "+playerName+", shoo, shoo!!");
            timer=3;
            step++;
        }
        break;case 1:
        if timeout(true){
            timer=1;
            sequence_alpha=1;
        }
        break;case 2:
        DrawFade(sequence_alpha);
        if timeout(true){
            timer=1;
            MoveTo(obj_player,"killer2");
            with obj_player{
                sprite_index=sprite_attack;
                image_speed=0;
            }
            GetSpeechbox(current_bard,"HEEEEELP!!!");
            sequence_alpha=0;
        }
        break;case 3:
        if timeout(true){
            timer=5;
            with obj_player{
                SfxPlay(sfx_sword1);
                sprite_index=sprite_attack;
                image_speed=1;
            }
        }
        break;case 4:
        if timeout(true){
        }
        break;case 5:
        DrawFade(sequence_alpha);
        sequence_alpha+=alphaSpeed;
        audio_sound_gain(sfx_sword1,1-sequence_alpha,0);
        if sequence_alpha>=1{
            obj_player.sprite_index=obj_player.sprite_idle;
            step++;
        }
        break;case 6:
        DrawFade(sequence_alpha);
        DrawSpriteExt(spr_bard4_idle,0,Camera.gui_w/2,Camera.gui_h/2,GUISCALE,0,undefined,sequence_alpha);
        audio_sound_gain(sfx_sword1,1,0);
        if textbox.draw(assasination1_text){
            if kp_anykey{step++;}
        }
        break;case 7:
        DrawFade(sequence_alpha);
        BgmStop(bgm_tension);
        //GameController.goto=rm_stage1;
        //if room==rm_stage1{
            Destroy(current_bard);
            room_goto(rm_stage1);
            with par_bard{visible=true;}
            GAMESTATE++;
            Destroy();
            GetMiniGame(0,1,60);
        //}
        break;
    }
}
