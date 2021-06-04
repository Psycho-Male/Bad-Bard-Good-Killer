function GetButton(_x,_y,_text,_func){
    with instance_create_layer(_x,_y,-100,Button){
        func=_func;
    }
}
