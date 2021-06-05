function GetCutscene(_sequence){
    with CreateDepth(Cutscene){
        switch _sequence{
            case stateChooseTarget:
            current_sequence=sequence_choose_target;
            break;case stateOpening:
            current_sequence=sequence_opening;
            break;
        }
    }
}
