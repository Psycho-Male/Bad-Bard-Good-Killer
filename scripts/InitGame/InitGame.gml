randomize();
globalvar DEBUG;DEBUG={
    enabled:false,
    logging:true,
}
globalvar SCORE;SCORE=0;
globalvar MONEY;MONEY=0;
globalvar GUISCALE;GUISCALE=3;
#macro stateOpening         0
#macro stateFirstSong       1
#macro stateFirstKill       2
#macro stateSecondSong      3
#macro stateSecondKill      4
#macro stateThirdSong       5
#macro stateThirdKill       6
#macro stateEnding          7
globalvar GAMESTATE;GAMESTATE=stateOpening;
globalvar DEVLOGING;DEVLOGIN=parameter_count==3;
globalvar MOUSE_ACTIVE;MOUSE_ACTIVE=false;
globalvar KEY;KEY={
    confirm:false,
    mcl:false,
    mpl:false,
    mrl:false,
    up:false,
    left:false,
    down:false,
    right:false,
    pressed:undefined,
}
function DebugAddGuiMessage(_msg){
    ArrayAdd(GameController.debug_text,_msg);
}
function IsDefined(_value){
    return !IsUndefined(_value);
}
function SetUndefined(_var,_value) {
    if IsDefined(_var) return _var;
    else if IsDefined(_value) return _value;
}
function SetImageScale(_scale){
    image_xscale=_scale;image_yscale=_scale;
}
function DrawSetAlign(_halign,_valign) {
    draw_set_halign(_halign);
    draw_set_valign(_valign);
}
function DrawSetAlignColor(_halign,_valign,_color,_alpha){
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_color(_color);
    draw_set_alpha(SetUndefined(_alpha,1));
}
function GetMoney(_noteId,_amount,_count){
    SfxPlay([sfx_coin1,sfx_coin2,sfx_coin3,sfx_coin4]);
    repeat _count with instance_create_depth(_noteId.x+8*GUISCALE,_noteId.y,depth-1,obj_money){
        owner=_noteId;
        amount=_amount/_count;
        spd=5;
        speed=amount>0?spd:-(spd/2);
        gravity=.25;
        gravity_direction=270;
    }
}
function PercentageOf(_value,_maxValue){
    var i=100/_maxValue;
    _maxValue*=i;
    _value*=i;
    return _value/_maxValue*100;
}
function CreateLayer(_index,_layer,_x,_y){
    _x=SetUndefined(_x,0);
    _y=SetUndefined(_y,0);
    _layer=SetUndefined(_layer,"Instances");
    return instance_create_layer(_x,_y,_layer,_index);
}
function CreateDepth(_index,_depth,_x,_y){
    _x=SetUndefined(_x,0);
    _y=SetUndefined(_y,0);
    _depth=SetUndefined(_depth,0);
    return instance_create_depth(_x,_y,_depth,_index);
}
#macro saveName         "save.ini"
#macro saveSection      "Baduardo"
function SaveGame(){
    ini_write(saveName,saveSection,"state",GAMESTATE);
    ini_write(saveName,saveSection,"score",SCORE);
    ini_write(saveName,saveSection,"money",MONEY);
    ini_write(saveName,saveSection,"room",room_get_name(room));
}
