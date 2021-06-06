SetImageScale(GUISCALE);
timer=1;
press_treshold=x;
fail_treshold=x-40;
current_key=noone;
key_position_y=[
y-24*GUISCALE,
y-8*GUISCALE,
y+8*GUISCALE,
y+24*GUISCALE,
];
scr=0;
correct_count=0;
wrong_count=0;
music_started=false;
music_ended=false;
last_note=undefined;
//--------------------------------------------------\\
//States||
function state_normal(){
    draw_state=0;
    if kp_o{
        Destroy(MusicNote);
        ds_queue_clear(current_sheet);
        music_started=true;
        music_ended=true;
        scr+=1000;
    }
    if !music_started{
        with MusicNote if x<Camera.gui_w*.3{
            other.music_started=true;
            other.current_music=BgmPlay(other.current_music,false);
            break;
        }
    }else{
        var _trackPos=audio_sound_get_track_position(current_music);
        DebugAddGuiMessage("_trackPos: "+str(_trackPos));
    }
    if timer%tempo==0{
        //GetNote(Camera.gui_w*.75,key_position_y[irandom(3)],ds_queue_dequeue(current_sheet),level);
        //var _note=ds_queue_dequeue(current_sheet);
        if !music_ended{
            music_ended=audio_sound_get_track_position(current_music)>audio_sound_length(current_music)-8;
        }
        var _note=undefined;
        if !music_ended{
            _note=choose(noteUp,noteDown,noteLeft,noteRight,sustainUp,sustainDown,sustainLeft,sustainRight);
            if IsDefined(last_note){
                while _note==last_note{
                _note=choose(noteUp,noteDown,noteLeft,noteRight,sustainUp,sustainDown,sustainLeft,sustainRight);
                }
            }
            last_note=_note;
        }
        if IsDefined(_note){
            switch _note{
                case noteUp:case sustainUp:
                var _y=key_position_y[0];
                break;case noteLeft:case sustainLeft:
                var _y=key_position_y[3];
                break;case noteDown:case sustainDown:
                var _y=key_position_y[1];
                break;case noteRight:case sustainRight:
                var _y=key_position_y[2];
                break;
            }
            GetNote(Camera.gui_w*.75,_y,_note,level);
        }else if !Exists(MusicNote)&&music_ended{
            with par_bard{
                sprite_index=sprite_idle;
            }
            state_current=state_end;
        }
    }
    timer++;
}
function state_end(){
    if scr>0{
        if kp_anykey{
            SCORE+=scr;
            scr=0;
        }
        var _amount=1;
        if scr>100{
            _amount=100;
        }else if scr>10{
            _amount=10;
        }
        SfxPlay([sfx_point1,sfx_point2]);
        SCORE+=min(_amount,scr);
        scr-=min(_amount,scr);
        draw_state=1;
    }else if kp_anykey{
        switch GAMESTATE{
            case stateFirstSong:
            GetCutscene(statePreAssasination1);
            break;case stateSecondSong:
            GetCutscene(statePreAssasination2);
            break;case stateThirdSong:
            GetCutscene(statePreAssasination3);
            break;case stateFourthSong:
            GetCutscene(stateEnding);
            break;
        }
        DIFFICULTY++;
        Destroy();
    }
}
state_current=state_normal;
draw_state=0;
//--------------------------------------------------//
//--------------------------------------------------\\
//Create Sheets||
sheet1_original=ds_queue_create();
sheet1=ds_queue_create();
sheets=[sheet1,sheet1,sheet1];
musics=[bgm_theme1,bgm_theme2,bgm_theme3];
ds_queue_enqueue(sheet1_original,
noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,
noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,
);
ds_queue_copy(sheet1,sheet1_original);
//--------------------------------------------------//
