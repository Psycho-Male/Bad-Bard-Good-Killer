if object_index==obj_player{
    name=playerName;
}else{
    var _arr=sex=="male"?MALE_NAMES:FEMALE_NAMES;
    var n=irandom(array_length(_arr)-1);
    name=_arr[n];
    ArrayDelete(_arr,n,1);
}
level=instance_number(par_bard);
cost=0;
cost_modifier=irandom_range(10,20)*10;
function draw_name(_x,_y){
    draw_text_transformed(_x,_y,name,GUISCALE,GUISCALE,0);
}
function draw_cost(_x,_y){
    draw_text_transformed(_x,_y,"Cost: "+str(cost),GUISCALE,GUISCALE,0);
}
