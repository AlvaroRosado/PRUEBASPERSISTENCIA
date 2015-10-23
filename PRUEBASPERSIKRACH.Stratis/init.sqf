call compile preprocessFileLineNumbers "fhqtt2.sqf";
call compile preprocessFileLineNumbers "briefing.sqf";
/*******Post-process**********/ 
"colorCorrections" ppEffectEnable true;  "colorCorrections" ppEffectAdjust [1.03, 0.4, 0, [0.8,0.9,1,-0.1], [1,1,1,1.66], [-0.5,0,-1,5]];  "colorCorrections" ppEffectCommit 0;

/***************Variable************/
tf_no_auto_long_range_radio = true;
enableSaving [false,false];
#include "funciones.sqf"
#include "debug_console.hpp"
enableSaving [false, false];
if (isServer || isDedicated) then {
	call compile preProcessFile "\iniDBI\init.sqf";
	execVM "Persistencia\CARGA\cargarvehiculos.sqf";
	execVM "Persistencia\CARGA\cargarcajas.sqf";
	execVM "Persistencia\CARGA\cargartareas.sqf";
	null=[]execVM "tareas\cache1.sqf";
	}else{
	waitUntil {!isNull player};
	player setVariable["nombre", profileName, true];
	player setVariable["cargacompleta", false, true];
	player setVariable["datos", [], true];
	player setVariable["rango", "PRIVATE", true];
	player setVariable["rol", "DEFAULT", true];
	player call fn_defaultLoadout;
	player call fn_cargarjugador;
};
