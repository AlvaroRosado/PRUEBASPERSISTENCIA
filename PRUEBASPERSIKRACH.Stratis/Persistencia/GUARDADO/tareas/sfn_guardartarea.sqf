_tareacount = _this select 0;
_titulo = _this select 1;
_estado = _this select 2;
_tareaID = format ["tarea%1", _tareacount];
_result = [];
["tareas", _tareaID, "Titulo", _titulo , false] call iniDB_write; 
["tareas", _tareaID, "Estado", _estado , false] call iniDB_write; 
["tareas", "Info", "TOTAL" , _tareacount, false] call iniDB_write;
_result = true;
_result