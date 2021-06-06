function SfxPlay(_index,_loop) {
    _loop=SetUndefined(_loop,false);
    if IsArray(_index) {
        var n=irandom(array_length(_index)-1);
        var _id=audio_play_sound(_index[n],1,_loop);
    } else {
        var _id=audio_play_sound(_index,1,_loop);
    }
    return _id;
}
function BgmPlay(_index,_loop,_fadein){
    audio_group_stop_all(aug_bgm);
    _fadein=SetUndefined(_fadein,true);
    if !audio_is_playing(_index){
        _loop=SetUndefined(_loop,true);
        var _id=audio_play_sound(_index,1,_loop);
        if _fadein{
            audio_sound_gain(_id,0,0);
            ds_list_add(GameController.fade_in_list,_id);
        }
        return _id;
    }else{
        return _index;
    }
}
function BgmStop(_index){
    if audio_is_playing(_index){
        ds_list_add(GameController.fade_out_list,_index);
    }
}
function AmbPlay(_index,_loop){
    audio_group_stop_all(aug_amb);
    _loop=SetUndefined(_loop,true);
    if !audio_is_playing(_index){
        var _id=audio_play_sound(_index,1,_loop);
        audio_sound_gain(_id,0,0);
        ds_list_add(GameController.fade_in_list,_id);
    }
    return _id;
}
function AmbStop(_index,_loop){
    if audio_is_playing(_index){
        ds_list_add(GameController.fade_out_list,_index);
    }
}
