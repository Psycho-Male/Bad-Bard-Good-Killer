function GetCutscene(_sequence){
    if Exists(Cutscene){
        Destroy(Cutscene);
    }
    with CreateDepth(Cutscene){
        switch _sequence{
            case stateChooseTarget:
            current_sequence=sequence_choose_target;
            break;case stateOpening:
            current_sequence=sequence_opening;
            break;case stateAssasination:
            current_sequence=sequence_assasination;
            break;
        }
    }
}
