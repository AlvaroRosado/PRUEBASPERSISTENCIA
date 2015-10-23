_exists = "tareas" call iniDB_exists;
_tareacount = 0;
if (!isNil "_exists" && {_exists}) then
{	
_tareacount = ["tareas", "Info", "TOTAL", "STRING"] call iniDB_read;
_number = parseNumber _tareacount;
if (_number > 0) then { 

for [{_i=1},{_i<=_number},{_i=_i+1}] do {
	_tareaid = format ["tarea%1", _i];
	_nombre = ["tareas", _tareaid, "Titulo", "STRING"] call iniDB_read;
	_estado = ["tareas", _tareaid, "Estado", "STRING"] call iniDB_read;
    [_nombre, _estado] call FHQ_TT_setTaskState;  
	"debug_console" callExtension _nombre;
	"debug_console" callExtension _estado;


    
};
};
};




