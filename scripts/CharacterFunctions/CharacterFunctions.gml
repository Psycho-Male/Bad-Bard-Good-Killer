function GetCharater(_name,_sprite,_level,_killCost){
    with instance_create_layer(0,0,"Instances",Character){
        name=_name;
        sprite_index=_sprite;
        level=_level;
        kill_cost=_killCost;
        return id;
    }
}
