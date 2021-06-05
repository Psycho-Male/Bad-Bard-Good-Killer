function DsListMoveToTop(_list,_value){
    var _position=ds_list_find_index(_list,_value);
    if _position!=-1{
        for(var i=_position;i<ds_list_size(_list)-1;i++){
            _list[|i]=_list[|i+1];
        }
        _list[|i+1]=_value;
    }else{
        Trace("Value to move top couldn't found in ds_list: "+str(_list),LOGLEVEL.WARN);
    }
}
function DsListDequeue(_list,_reverse){
    if _reverse{
        var _pos=0;
    }else{
        var _pos=ds_list_size(_list)-1;
    }
    var _value=_list[|_pos];
    ds_list_delete(_list,_pos);
    return _value;
}
function DsListEmpty(_list){
    return ds_list_size==0;
}
function DsListRandom(_list) {
    var _len=DsListSize(_list);
    return _list[|irandom(_len-1)];
}
function DsListLast(_list){
    return _list[|ds_list_size(_list)-1];
}
