//--------------------------------------------------\\
//Functions||
function init_notes(){
    var _gap=16*GUISCALE;
    note_x=(button_x+string_width("Start Game")+16*GUISCALE);
    for(var i=0;i<ds_list_size(start_sequence);i++){
        ds_list_replace(start_sequence,i,GetNote(note_x+_gap*i,button_y[0],start_sequence[|i],0));
        ds_list_replace(credits_sequence,i,GetNote(note_x+_gap*i,button_y[1],credits_sequence[|i],0));
        ds_list_replace(exit_sequence,i,GetNote(note_x+_gap*i,button_y[2],exit_sequence[|i],0));
    }
}
function reset_lists(){
    active_list=undefined;
    Destroy(MusicNote);
    with Button{selected=false;}
    for(var i=0;i<array_length(lists);i++){
        ds_list_copy(lists[i],original_lists[i]);
    }
    init_notes();
}
function key_check(_list){
    if ds_list_size(_list)>0&&keyboard_key==_list[|0].key{
        Destroy(_list[|0]);
        DsListDequeue(_list,true);
        return true;
    }
}
//--------------------------------------------------//
button_x=Camera.gui_w/2;
button_y=[Camera.gui_h*.20,Camera.gui_h*.30,Camera.gui_h*.40];
buttons=[
GetButton(button_x,Camera.gui_h*.20,"Start Game",room_goto_next),
GetButton(button_x,Camera.gui_h*.30,"Credits"),
GetButton(button_x,Camera.gui_h*.40,"Exit"),
];
start_sequence_original=ds_list_create();
start_sequence=ds_list_create();
ds_list_add(start_sequence_original,noteUp,noteLeft,noteDown,noteRight);
ds_list_copy(start_sequence,start_sequence_original);
credits_sequence_original=ds_list_create();
credits_sequence=ds_list_create();
ds_list_add(credits_sequence_original,noteLeft,noteLeft,noteDown,noteRight);
ds_list_copy(credits_sequence,credits_sequence_original);
exit_sequence_original=ds_list_create();
exit_sequence=ds_list_create();
ds_list_add(exit_sequence_original,noteRight,noteLeft,noteDown,noteRight);
ds_list_copy(exit_sequence,exit_sequence_original);
lists=[start_sequence,credits_sequence,exit_sequence];
original_lists=[start_sequence_original,credits_sequence_original,exit_sequence_original];
active_list=undefined;
init_notes();
arrow_keys=[kb_up,kb_left,kb_down,kb_right];
wasd_keys=[kb_w,kb_a,kb_s,kb_d];
