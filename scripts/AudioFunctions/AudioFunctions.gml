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
