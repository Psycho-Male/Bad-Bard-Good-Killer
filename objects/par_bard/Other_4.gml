if room==rm_stage1{
    MoveTo(id,position_code);
    image_xscale=GUISCALE;
    image_yscale=GUISCALE;
    if GAMESTATE==stateEnding&&object_index==obj_player{
        MoveTo(id,"final");
    }
}
