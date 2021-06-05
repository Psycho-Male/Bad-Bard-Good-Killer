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
