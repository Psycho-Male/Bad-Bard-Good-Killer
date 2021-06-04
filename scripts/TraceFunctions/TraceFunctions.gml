enum LOGLEVEL {
    ALL,
    TRACE,
    DEBUG,
    INFO,
    WARN,
    ERROR,
    FATAL,
    NONE
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
function Stringify() {
    var _str=""
    for (var i=0;i<argument_count;i++) _str+=str(argument[i]);	
    return _str;
}
function Trace(_text,_loglevel) {
    _text=str(_text);
    _loglevel=SetUndefined(_loglevel,LOGLEVEL.TRACE);
    Print(_text);
    if DEBUG.logging{
        //TraceLog(_loglevel,_text);

        var _timetxt = str(date_current_datetime());
        var _callstack = debug_get_callstack();
        var _method = _callstack[1]; // 1st item should be the thing that called logger
        // make debug string
        switch(_loglevel) {
                default:
                case LOGLEVEL.TRACE: var _leveltxt="|TRACE|"; break;
                case LOGLEVEL.DEBUG: var _leveltxt="|DEBUG|"; break;
                case LOGLEVEL.INFO:  var _leveltxt="|INFO |"; break;
                case LOGLEVEL.WARN:  var _leveltxt="|WARN |"; break;
                case LOGLEVEL.ERROR: var _leveltxt="|ERROR|"; break;
                case LOGLEVEL.FATAL: var _leveltxt="|FATAL|"; break;
        }
        if _loglevel==LOGLEVEL.ERROR||_loglevel==LOGLEVEL.FATAL{
            for(var i=2,cs=debug_get_callstack();i<array_length(cs)-1;i++){
                _method+=cs[i];
            }
        }
        var _debugstr=Stringify("{",_timetxt,"} [",_leveltxt,"]: ",_text,"-->(",_method,")");
        txt_append("output.log",_debugstr,true);
        //for(var i=0,_a=debug_get_callstack();i<array_length(_a);i++) _text+=str(_a[i])+"/";
    } else {
        if IsDefined(_loglevel) {
            switch _loglevel {
                case LOGLEVEL.INFO:
                sentry_add_breadcrumb("trace",SENTRY_INFO,_text);
                break;case LOGLEVEL.WARN:
                sentry_add_breadcrumb("trace",SENTRY_WARNING,_text);
                break;case LOGLEVEL.ERROR:
                sentry_add_breadcrumb("trace",SENTRY_ERROR,_text);
                break;case LOGLEVEL.FATAL:
                sentry_add_breadcrumb("trace",SENTRY_FATAL,_text);
                break;case LOGLEVEL.DEBUG:
                sentry_add_breadcrumb("trace",SENTRY_DEBUG,_text);
                break;
            }
        }
    }
}
