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
//--------------------------------------------------\\
//States||
function state_normal(){
    draw_state=0;
    if kp_o{
        Destroy(MusicNote);
        ds_queue_clear(current_sheet);
        scr+=1000;
    }
    if timer%tempo==0{
        //GetNote(Camera.gui_w*.75,key_position_y[irandom(3)],ds_queue_dequeue(current_sheet),level);
        var _note=ds_queue_dequeue(current_sheet);
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
        }else if !Exists(MusicNote){
            with par_bard{
                sprite_index=sprite_idle;
            }
            state_current=state_end;
        }
    }
    DebugAddGuiMessage("timer: "+str(timer));
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
        SCORE+=min(_amount,scr);
        scr-=min(_amount,scr);
        draw_state=1;
    }else if kp_anykey{
        GetCutscene(stateChooseTarget);
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
sheets=[sheet1];
ds_queue_enqueue(sheet1_original,
noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,
noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,noteUp,noteDown,noteLeft,noteRight,
);
ds_queue_copy(sheet1,sheet1_original);
//--------------------------------------------------//
