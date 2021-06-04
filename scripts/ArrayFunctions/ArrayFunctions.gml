function ArrayFind(_array,_value){
    for(var i=0;i<array_length(_array);i++){
        if _array[i]==_value{
            return i;
        }
    }
}
function ArrayChoose(_array) {
    var _len=array_length(_array);
    for(var i=0,j=irandom(_len-1);i<_len;i++) if i==j return _array[i];
}
function ArrayAdd(_index,_value) {
    array_push(_index,_value);
    //_index[@array_length(_index)]=_value;
}
function ArrayInsert(_arr,_value,_pos){
    for(var i=array_length(_arr);i>=0;i--){
        if i==_pos{
            _arr[@i]=_value;
            break;
        }else{
            _arr[@i]=_arr[i-1];
        }
    }
    return _arr;
}
function ArrayPop(_arr,_delete){
    _delete=SetUndefined(_delete,false);
    return _arr[array_length(_arr)-1];
}
function ArrayFromList(_list){
    var _arr;
    for(var i=0;i<ds_list_size(_list);i++){
        _arr[i]=_list[|i];
    }
    return _arr;
}
