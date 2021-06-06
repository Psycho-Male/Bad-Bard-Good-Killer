function GetSpeechbox(_id,_text){
    with CreateDepth(obj_speechbox,0,_id.x,_id.y-_id.sprite_height){
        text=_text;
        var _padding=4;
        text_width=(string_width(_text)+_padding)*GUISCALE;
        text_height=(string_height(_text)+_padding)*GUISCALE;
        pos_x=[x-text_width/2,x+text_width/2];
        pos_y=[y-text_height,y];
        text_x=x;
        text_y=pos_y[1]-(pos_y[1]-pos_y[0])/2;
        tail_pos=[x,pos_y[1]+2*GUISCALE];
    }
}
function PositiveCheer(){
    SfxPlay(sfx_cheering1);
    var n=irandom(instance_number(obj_point)-1);
    var _chatList=[
    "Nice1",
    "Nice2",
    "Nice3",
    "Nice4",
    ];
    GetSpeechbox(Find(obj_point,n),ArrayChoose(_chatList));
}
function NegativeCheer(){
    SfxPlay(sfx_booing1);
    var n=irandom(instance_number(obj_point)-1);
    var _chatList=[
    "Bad1",
    "Bad2",
    "Bad3",
    "Bad4",
    ];
    GetSpeechbox(Find(obj_point,n),ArrayChoose(_chatList));
}
