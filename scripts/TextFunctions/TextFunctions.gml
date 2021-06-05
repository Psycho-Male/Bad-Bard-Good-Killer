function IniReadWrite(_class,_name,_default) {
    if IsString(_default) {
        var _value=ini_read_string(_class,_name,_default);
        ini_write_string(_class,_name,_value);
    } else {
        var _value=ini_read_real(_class,_name,_default);
        ini_write_real(_class,_name,_value);
    }
    return _value;
}
function ini_write() {
    ini_open(argument[0] + ".ini");
    for(var i=1;i<argument_count;i+=3) {
        if is_string(argument[i + 2])
            ini_write_string(argument[i], argument[i + 1], argument[i + 2]);
        else if is_real(argument[i + 2])
            ini_write_real(argument[i], argument[i + 1], argument[i + 2]);
    }
    ini_close();
}
function ini_read() {
    var _value;
    ini_open(argument[0] + ".ini");
    if is_string(argument[3]) {
        _value = ini_read_string(argument[1], argument[2], argument[3]);
    } else if is_real(argument[3]) {
        _value = ini_read_real(argument[1], argument[2], argument[3]);
    }
    ini_close();
    return _value;
}
function txt_append(_file,_text,_writeln) {
    _writeln=SetUndefined(_writeln,false);
    if is_real(_file) {
        _file = _file;
    } else {
        var _pos = string_pos(".", _file);
        var _name = _pos == 0 ? _file+".txt" : _file;
        _file = file_text_open_append(_name);
    }
    //---------------------------------------------------------------------------------------------------------//
    if is_string(_text) {
        file_text_write_string(_file, _text);
    } else if is_real(_text) {
        file_text_write_real(_file, _text);
    }
    if _writeln file_text_writeln(_file);
    file_text_close(_file);
}
function txt_read(argument0, argument1) {
    var _pos = string_pos(".", argument0);
    var _name = _pos == 0 ? argument0+".txt" : argument0;
    var _file = file_text_open_read(_name);
    var _type = argument1;
    var _value;
    //---------------------------------------------------------------------------------------------------------//
    if _type == "string" {
        _value = file_text_read_string(_file);
    } else if _type == "real" {
        _value = file_text_read_real(_file);
    }
    file_text_close(_file);
    return _value;
}
function txt_write(_file,_text,_writeln) {//writeln opt
    _writeln=SetUndefined(_writeln,false);
    if is_real(_file) {
        _file = _file;
    } else {
        var _pos=string_pos(".",_file);
        var _name=_pos==0?_file+".txt":_file;
        _file=file_text_open_write(_name);
    }
    //---------------------------------------------------------------------------------------------------------//
    if is_string(_text) {
        file_text_write_string(_file, _text);
    } else if is_real(_text) {
        file_text_write_real(_file, _text);
    }
    if _writeln file_text_writeln(_file);
    file_text_close(_file);
}
