SetImageScale(GUISCALE);
timer=1;
press_treshold=x;
fail_treshold=x-40;
current_key=noone;
key_position_x=x+128;
key_position_y=[
y-36*GUISCALE,
y-12*GUISCALE,
y+12*GUISCALE,
y+36*GUISCALE,
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
    if timer%tempo==0{
        //GetNote(key_position_x,key_position_y[irandom(3)],ds_queue_dequeue(current_sheet),level);
        GetNote(key_position_x,key_position_y[irandom(3)],
        choose(noteUp,noteLeft,noteDown,noteRight,sustainUp,sustainLeft,sustainDown,sustainRight),
        level);
    }
    DebugAddGuiMessage("timer: "+str(timer));
    timer++;
}
function state_end(){
    if scr>0{
        scr--;
        SCORE++;
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
