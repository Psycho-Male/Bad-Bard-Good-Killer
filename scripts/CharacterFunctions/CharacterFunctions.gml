globalvar CHARACTERS;CHARACTERS=ds_list_create();
globalvar MALE_NAMES;MALE_NAMES=[
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
globalvar FEMALE_NAMES;FEMALE_NAMES=[
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
function GetCharater(_name,_sprite,_level,_killCost){
    with instance_create_layer(0,0,"Instances",Character){
        name=_name;
        sprite_index=_sprite;
        level=_level;
        kill_cost=_killCost;
        return id;
    }
}
function GenerateCharacter(_level,_count){
    var _nameListFemale=ds_list_create();
    var _nameListMale=ds_list_create();
    for(var i=0;i<array_length(MALE_NAMES);i++){ds_list_add(_nameListMale,MALE_NAMES[i]);}
    for(var i=0;i<array_length(FEMALE_NAMES);i++){ds_list_add(_nameListFemale,FEMALE_NAMES[i]);}
    _npcNumber=0;
    repeat _count{
        var _nameList=choose(_nameListMale,_nameListFemale);
        var n=irandom(ds_list_size(_nameList)-1);
        var _name=_nameList[|n];
        ds_list_delete(_nameList,n);
        var _character=[
        _name,_level+_npcNumber
        ];
        ds_list_add(CHARACTERS,_character);
        _npcNumber++;
    }
    ds_list_destroy(_nameListMale);
    ds_list_destroy(_nameListFemale);
    return _character;
}
