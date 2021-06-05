#macro keycodeUp        0
#macro keycodeLeft      1
#macro keycodeDown      2
#macro keycodeRight     3
debug_text=[];
if kp_anykey{
    MOUSE_ACTIVE=false;
}else if Pointer.x!=Pointer.pos_prv[0]||Pointer.y!=Pointer.pos_prv[1]{
    MOUSE_ACTIVE=true;
    Pointer.pos_prv=[Pointer.x,Pointer.y];
}
KEY.confirm=kp_enter;
KEY.mcl=MOUSE_ACTIVE&&mc_left;
KEY.mpl=MOUSE_ACTIVE&&mp_left;
KEY.mrl=MOUSE_ACTIVE&&mr_left;
#macro inpHorizontal        (KEY.right-KEY.left)
#macro inpVertical          (KEY.down-KEY.up)
KEY.up=kp_w||kp_up;
KEY.left=kp_a||kp_left;
KEY.down=kp_s||kp_down;
KEY.right=kp_d||kp_right;
KEY.pressed=undefined;
if KEY.up{
    KEY.pressed=keycodeUp;
}
if KEY.left{
    KEY.pressed=keycodeLeft;
}
if KEY.down{
    KEY.pressed=keycodeDown;
}
if KEY.right{
    KEY.pressed=keycodeRight;
}
