timer=0;
current_sequence=undefined;
current_bard=noone;
step=0;
sequence_alpha=1;
if false{
opening_text=saveSection+" tutkulu ama yeteneksiz bir musiztendi. Istedigi tek sey insanlarin ilgisi, sevgisi ve parasiydiç Bu gece"+playerName+" meshur muzisyenlerle calacakti, 'Sonunda yetenegimi gostere"+playerName+"...";
ending_text1=playerName+" laughed as she bathed in crowds cheering and applause, this was her victory song, this the proof that Music's has finally acknowledged her! She could her the Music talking to her, praising her!";
ending_text2=playerName+" finally did it! There is no one like her and no one cheers anyone other then her! Only she have money! Only she have fame! Only she have love! She have everything, she is the only real musician in this world!";
ending_text3="Thanks for playing!";
preAssasination1_text=" Tsch, they are good.. but not enough. They might be talented musicians, but they are lacking in passion. They are here just for fame and money, they don't understand the Music. To become a real musician, I must go beyond expectations, I must conquer my fears and doubts and do what I really need to do.";
preAssasination2_text1="'This is easier then I thought', said "+playerName+" to herself, her fears and doubts started to clear, she had only one goal in mind. ";
preAssasination2_text2=playerName+": Killing one musician didn't change crowds cheering, which means there is a still a musician better then me. But that's okay, only I'm capable of going through such lengths for the sake of my Music! This much is nothing for me!";
preAssasination3_text1="After their performance ended, "+playerName+" didn't wait even for a moment, she knew this was needed, she felts this even before their last performance. How could she be so stupid, her only enemy was obvious from the start!";
preAssasination3_text2="She felt stupid and embarrassed as she went into backstage, she shrugged 'Mistakes always happen and I'm not the one to get scared over small mistakes like this', she thought to herself.";
assasination1_text=playerName+" is now one step closer to being acknowledged bard in town. No one would ever take the risk "+playerName+" took, no one is passionate about this as much as "+playerName+", they don't deserve no fame, love nor money. This is real Music, she's deserves everything...";
assasination2_text=playerName+" felt like she was getting close to her dreams, she felt inspired and strong! Music can make you feel so many things that other things cannot! That's why she has to be one, she has to be best! And for that, she knew what she had to do...";
assasination3_text="Everyhing is going smoothly for "+playerName+", maybe too smooth... Maybe that's because Music has finally accepted her, acknowledged her passion and will! But she can't stop now, there is always a next step we can take, we can always get better for things we do! We can never stop or we will fail..";
}else{
opening_text=saveSection+" was a passionate, but talentless bard. All she wanted was peoples attention, love and money. Tonight "+playerName+" will play in a famous tavern with known musicians, 'I can finally show my true potential!', thought "+playerName+"...";
ending_text1=playerName+" laughed as she bathed in crowds cheering and applause, this was her victory song, this the proof that Music's has finally acknowledged her! She could her the Music talking to her, praising her!";
ending_text2=playerName+" finally did it! There is no one like her and no one cheers anyone other then her! Only she have money! Only she have fame! Only she have love! She have everything, she is the only real musician in this world!";
ending_text3="Thanks for playing!";
preAssasination1_text=" Tsch, they are good.. but not enough. They might be talented musicians, but they are lacking in passion. They are here just for fame and money, they don't understand the Music. To become a real musician, I must go beyond expectations, I must conquer my fears and doubts and do what I really need to do.";
preAssasination2_text1="'This is easier then I thought', said "+playerName+" to herself, her fears and doubts started to clear, she had only one goal in mind. ";
preAssasination2_text2=playerName+": Killing one musician didn't change crowds cheering, which means there is a still a musician better then me. But that's okay, only I'm capable of going through such lengths for the sake of my Music! This much is nothing for me!";
preAssasination3_text1="After their performance ended, "+playerName+" didn't wait even for a moment, she knew this was needed, she felts this even before their last performance. How could she be so stupid, her only enemy was obvious from the start!";
preAssasination3_text2="She felt stupid and embarrassed as she went into backstage, she shrugged 'Mistakes always happen and I'm not the one to get scared over small mistakes like this', she thought to herself.";
assasination1_text=playerName+" is now one step closer to being acknowledged bard in town. No one would ever take the risk "+playerName+" took, no one is passionate about this as much as "+playerName+", they don't deserve no fame, love nor money. This is real Music, she's deserves everything...";
assasination2_text=playerName+" felt like she was getting close to her dreams, she felt inspired and strong! Music can make you feel so many things that other things cannot! That's why she has to be one, she has to be best! And for that, she knew what she had to do...";
assasination3_text="Everyhing is going smoothly for "+playerName+", maybe too smooth... Maybe that's because Music has finally accepted her, acknowledged her passion and will! But she can't stop now, there is always a next step we can take, we can always get better for things we do! We can never stop or we will fail..";
}
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
        var _padding=16*GUISCALE;
        if GAMESTATE==stateEnding{
            pos_y=[0,Camera.gui_h*.4-_padding];
        }else{
            pos_y=[Camera.gui_h*.6,Camera.gui_h-_padding];
        }
        sprite=spr_textbox;
        pos_x=[0,Camera.gui_w-_padding];
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
        }else if kp_anykey{
            print="";
            return true;
        }
    },
    draw:function(_text){
        DrawSetAlignColor(fa_left,fa_top,c_white,1);
        DrawSpritePart(sprite,0,pos_x[0],pos_y[0],pos_x[1],pos_y[1],GUISCALE);
        draw_text_ext_transformed(pos_inner_x[0],pos_inner_y[0],print,-1,max_width/GUISCALE,GUISCALE,GUISCALE,0);
        return printout(_text);
    },
}
textbox.init();
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
function sequence_opening(){
    switch step{
        case 0:
        DrawSpriteExt(spr_port1,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
        if textbox.draw(opening_text){step++;}
        break;case 1:
        if sequence_alpha>0{
            DrawSpriteExt(spr_port1,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
            sequence_alpha-=alphaSpeed;
        }else{
            step++;
        }
        break;case 2:
        current_sequence=undefined;
        Gamestep();
        Destroy();
        break;
    }
}
function sequence_ending(){
    sequence_alpha=0;
    if !audio_is_playing(sfx_cheering_long1){
        SfxPlay(sfx_cheering_long1);
    }
    switch step{
        case 0:
        if textbox.draw(ending_text1){step++;}
        break;case 1:
        if textbox.draw(ending_text2){step++;}
        break;case 2:
        if textbox.draw(ending_text3){step++;}
        break;case 3:
        step=0;
        current_sequence=credits;
        break;
    }
}
function sequence_preAssasination1(){
    DrawSpriteExt(spr_port1,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
    switch step{
        case 0:
        if textbox.draw(preAssasination1_text){step++;}
        break;case 1:
        current_sequence=sequence_choose_target;
        step=0;
        break;
    }
}
function sequence_preAssasination2(){
    DrawSpriteExt(spr_port1,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
    switch step{
        case 0:
        if textbox.draw(preAssasination2_text1){step++;}
        break;case 1:
        if textbox.draw(preAssasination2_text2){step++;}
        break;case 2:
        current_sequence=sequence_choose_target;
        step=0;
        break;
    }
}
function sequence_preAssasination3(){
    DrawSpriteExt(spr_port2,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
    switch step{
        case 0:
        if textbox.draw(preAssasination3_text1){step++;}
        break;case 1:
        if textbox.draw(preAssasination3_text2){step++;}
        break;case 2:
        current_sequence=sequence_choose_target;
        step=0;
        break;
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
        if sequence_alpha<1{
            sequence_alpha+=alphaSpeed;
            draw_bards(bards,sequence_alpha);
        }else{
            step++;
        }
        break;case 2:
        if inpHorizontal!=0{
            bard_selection=ClampCycle(bard_selection+inpHorizontal,array_length(bards));
            SfxPlay(sfx_bard_choice_change1);
        }
        draw_bards(bards,sequence_alpha,bard_selection);
        current_bard=bards[bard_selection];
        var _name=current_bard.name;
        var _cost=current_bard.cost;
        var _text="Assasinate "+_name+" for "+str(_cost)+"?\n";
        _text+="You have: "+str(round(MONEY));
        DrawSetAlignColor(fa_middle,fa_center,c_white,1);
        draw_text_transformed(Camera.gui_w*.5,Camera.gui_h*.1,_text,GUISCALE,GUISCALE,0);
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
            switch GAMESTATE{
                case stateFirstSong:
                GetSpeechbox(current_bard,"What happened "+playerName+", did you drop you TALENT and FAME here?");
                break;case stateSecondSong:
                GetSpeechbox(current_bard,"Hey "+playerName+", one day I want to be a musician like you!");
                break;case stateThirdSong:
                GetSpeechbox(current_bard,"You were on fire back there "+playerName+"!");
                break;
            }
            timer=3;
            step++;
        }
        break;case 1:
        if timeout(true){
            timer=1;
            sequence_alpha=1;
        }
        break;case 2:
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
            timer=2;
            with obj_player{
                //SfxPlay(sfx_sword1);
                sprite_index=sprite_attack;
                image_speed=1;
            }
            with current_bard{
                if sprite_exists(sprite_death){sprite_index=sprite_death;}
            }
        }
        break;case 4:
        if timeout(true){
        }
        break;case 5:
        sequence_alpha+=alphaSpeed;
        audio_sound_gain(sfx_sword1,1-sequence_alpha,0);
        if sequence_alpha>=1{
            obj_player.sprite_index=obj_player.sprite_idle;
            step++;
        }
        break;case 6:
        DrawSpriteExt(spr_port1,0,Camera.gui_w/2,Camera.gui_h*.65,GUISCALE,0,undefined,sequence_alpha);
        audio_sound_gain(sfx_sword1,1,0);
        switch GAMESTATE{
            case stateFirstSong:
            if textbox.draw(assasination1_text){step++;}
            break;case stateSecondSong:
            if textbox.draw(assasination2_text){step++;}
            break;case stateThirdSong:
            //if textbox.draw(assasination3_text){step++;}
            step++;
            break;
        }
        break;case 7:
        BgmStop(bgm_tension);
        //GameController.goto=rm_stage1;
        //if room==rm_stage1{
            Destroy(current_bard);
            room_goto(rm_stage1);
            with par_bard{visible=true;}
            Gamestep();
            Destroy();
        //}
        break;
    }
}
function credits(){
    sequence_alpha=1;
    var _text="Coding/Story/Game Design\nAli Selim Agacan\n";
    _text+="Pixel Art\nSecil Sengul\n";
    _text+="Music\nKaan Salman\n";
    _text+="\nPress ESC";
    DrawSetAlignColor(fa_middle,fa_center,c_white,1);
    draw_text_transformed(Camera.gui_w/2,Camera.gui_h/2,_text,GUISCALE,GUISCALE,0);
    if kp_escape{
        Destroy();
        if GAMESTATE==stateEnding{
            game_end();
        }
    }
}
