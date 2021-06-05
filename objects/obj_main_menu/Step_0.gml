if kp_anykey&&!kp_enter{
    if IsUndefined(active_list){
        for(var i=0;i<array_length(lists);i++){
            if key_check(lists[i]){
                active_list=lists[i];
                break;
            }
        }
    }else{
        if key_check(active_list){
            if ds_list_size(active_list)==0{
                if active_list==lists[0]{
                    reset_lists();
                    buttons[0].selected=true;
                }else if active_list==lists[1]{
                    reset_lists();
                    buttons[1].selected=true;
                }else if active_list==lists[2]{
                    reset_lists();
                    buttons[2].selected=true;
                }
            }
        }else{
            reset_lists();
        }
    }
}
