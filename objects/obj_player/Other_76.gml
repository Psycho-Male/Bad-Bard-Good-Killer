if event_data!=-1{
    var _eventData=event_data;
    if event_data[? "event_type"] == "sprite event"{
        switch (event_data[? "message"]){
            case "attack":
            SfxPlay(sfx_sword1);
            break;case "slurp":
            SfxPlay([sfx_sex1,sfx_sex2,sfx_sex3,sfx_sex4,]);
            break;
        }
    }
}
