function GetButton(_x,_y,_text,_func){
    with CreateDepth(Button,-100,_x,_y){
        func=_func;
        text=SetUndefined(_text,"");
        if text!=""{
            image_xscale=(string_width(text)/20)*GUISCALE;
            image_yscale=(string_height(text)/20)*GUISCALE;
        }
        hwidth=sprite_width/2;
        hheight=sprite_height/2;
        return id;
    }
}
