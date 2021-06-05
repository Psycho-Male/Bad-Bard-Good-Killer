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
//--------------------------------------------------\\
//Create Sheets||
sheet1_original=ds_queue_create();
sheet1=ds_queue_create();
sheets=[sheet1];
ds_queue_enqueue(sheet1_original,noteUp,noteDown,noteLeft,noteRight);
ds_queue_copy(sheet1,sheet1_original);
//--------------------------------------------------//
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
            _amount=10;
        }else if scr>10{
            _amount=1;
        }
        SCORE+=min(_amount,scr);
        scr-=min(_amount,scr);
        draw_state=1;
    }else{
        draw_state=2;
        minigame_end();
    }
}
state_current=state_normal;
//--------------------------------------------------//
//--------------------------------------------------\\
//Functions||
function minigame_end(){
    Destroy();
    switch GAMESTATE{
        case stateFirstSong:
        GAMESTATE=stateFirstKill;
        break;case stateSecondSong:
        GAMESTATE=stateSecondKill;
        break;case stateThirdSong:
        GAMESTATE=stateThirdKill;
        GAMESTATE=stateEnding;
        break;
    }
}
//--------------------------------------------------//
//--------------------------------------------------\\
//Characters||
characters=ds_list_create();
name_list_male=[
"Hancock",
"Earl",
"Colley",
"Mighel",
"Azer",
"Rand",
"Alcock",
"Evenon",
"Gomrak",
"Gobush",
];
name_list_female=[
"Yuumosh",
"Alys",
"Alicia",
"Leana",
"Dianna",
"Isabele",
"Lillian",
"Jonet",
"Rose",
"Avila",
"Ella",
];
function generate_character(_level,_count){
    var _nameListFemale=ds_list_create();
    var _nameListMale=ds_list_create();
    for(var i=0;i<array_length(name_list_male);i++){ds_list_add(_nameListMale,name_list_male[i]);}
    for(var i=0;i<array_length(name_list_female);i++){ds_list_add(_nameListFemale,name_list_female[i]);}
    _npcNumber=0;
    repeat _count{
        var _nameList=choose(_nameListMale,_nameListFemale);
        var n=irandom(ds_list_size(_nameList)-1);
        var _name=_nameList[|n];
        ds_list_delete(_nameList,n);
        var _character=[
        _name,_level+_npcNumber
        ];
        ds_list_add(characters,_character);
        _npcNumber++;
    }
    ds_list_destroy(_nameListMale);
    ds_list_destroy(_nameListFemale);
    return character;
}
//--------------------------------------------------//
