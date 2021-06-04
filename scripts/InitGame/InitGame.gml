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
function GetMoney(_noteId,_amount,_count){
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
