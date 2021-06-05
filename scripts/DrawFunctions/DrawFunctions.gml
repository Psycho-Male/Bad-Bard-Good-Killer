function DrawSpritePart(_spr,_in,_x1,_y1,_x2,_y2,_sc) {
    var _size=sprite_get_width(_spr)/3; // Doesn't matter if it's width or height
    var _top,_left,_right,_bottom;
    // 0 is outer edge, 1 is inner edge, 2 inerrer edge??
    // Not sure what's going on but I have to use 2 variable at some point
    _bottom[0]=_y2-_size;
    _bottom[1]=_y2-2*_size;
    _bottom[2]=_y2-3*_size;
    _right[0]=_x2;
    _right[1]=_x2-_size;
    _left[0]=_x1;
    _left[1]=_x1+_size;
    _left[2]=_x1+2*_size;
    _top[0]=_y1;
    _top[1]=_y1+_size;
    _top[2]=_y1+2*_size;
    //Middle
    for(var i=_left[1]; i<_right[1]; i+=_size) {
        for(var j=_top[1];j<_bottom[1];j+=_size) {
            draw_sprite_part_ext(_spr, _in, _size, _size, _size, _size, i, j, _sc, _sc, c_white, 1);
        }
    }
    //Edges
    //Horizontal
    for(var i=_left[2]; i<_right[1]; i+=_size) {
        draw_sprite_part_ext(_spr, _in, _size, 0	, _size, _size, i, _top[0]	, _sc, _sc, c_white, 1);
        draw_sprite_part_ext(_spr, _in, _size, 2*_size	, _size, _size, i, _bottom[0]	, _sc, _sc, c_white, 1);
    }
    //Vertical
    for(var i=_top[2]; i<_bottom[2]; i+=_size) {
        draw_sprite_part_ext(_spr, _in, 0	 , _size , _size, _size, _left[0]	, i, _sc, _sc, c_white, 1);
        draw_sprite_part_ext(_spr, _in, 2*_size  , _size , _size, _size, _right[0]	, i, _sc, _sc, c_white, 1);
    }
    //Corners
    draw_sprite_part_ext(_spr, _in, 0	    , 0		, _size, _size, _left[0]	, _top[0]   , _sc,_sc,c_white,1);
    draw_sprite_part_ext(_spr, _in, 0	    , 2*_size   , _size, _size, _left[0]	, _bottom[0], _sc,_sc,c_white,1);
    draw_sprite_part_ext(_spr, _in, 2*_size , 0		, _size, _size, _right[0]	, _top[0]   , _sc,_sc,c_white,1);
    draw_sprite_part_ext(_spr, _in, 2*_size , 2*_size   , _size, _size, _right[0]	, _bottom[0], _sc,_sc,c_white,1);
}
