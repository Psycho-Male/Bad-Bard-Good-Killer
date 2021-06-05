for(var i=0;i<array_length(buttons);i++){
    Destroy(buttons[i]);
}
for(var i=0;i<array_length(lists);i++){
    ds_list_destroy(lists[i]);
    ds_list_destroy(original_lists[i]);
}
