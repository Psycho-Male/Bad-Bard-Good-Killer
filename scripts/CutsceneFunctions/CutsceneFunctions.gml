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
            break;case stateEnding:
            current_sequence=sequence_ending;
            break;case stateAssasination:
            current_sequence=sequence_assasination;
            break;case statePreAssasination1:
            current_sequence=sequence_preAssasination1;
            break;case statePreAssasination2:
            current_sequence=sequence_preAssasination2;
            break;case statePreAssasination3:
            current_sequence=sequence_preAssasination3;
            break;
        }
    }
}
