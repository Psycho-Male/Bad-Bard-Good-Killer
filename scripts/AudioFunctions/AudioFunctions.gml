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
function BgmPlay(_index,_loop){
    _loop=SetUndefined(_loop,true);
    return audio_play_sound(_index,1,_loop);
}
function BgmStop(_index){
    if audio_is_playing(_index){
        audio_stop_sound(_index);
    }
}
