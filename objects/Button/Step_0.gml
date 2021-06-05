image_index=0;
text_color=c_white;
if MOUSE_ACTIVE{
    selected=place_meeting(x,y,Pointer);
}
if selected{
    text_color=c_yellow;
    if KEY.mcl{
        image_index=1;
    }else if KEY.mrl||KEY.confirm{
        SfxPlay(sfx_click1);
        if IsDefined(func){
            func();
        }
    }
}
