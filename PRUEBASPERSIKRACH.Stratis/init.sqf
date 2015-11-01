call compile preprocessFileLineNumbers "fhqtt2.sqf";
call compile preprocessFileLineNumbers "briefing.sqf";
call compile preprocessFileLineNumbers "configuracion.sqf";

/*******Post-process**********/ 
"colorCorrections" ppEffectEnable true;  "colorCorrections" ppEffectAdjust [1.03, 0.4, 0, [0.8,0.9,1,-0.1], [1,1,1,1.66], [-0.5,0,-1,5]];  "colorCorrections" ppEffectCommit 0;

/***************Variable************/
tf_no_auto_long_range_radio = true;
enableSaving [false,false];
#include "funciones.sqf"
#include "define.hpp"

enableSaving [false, false];
if (isServer || isDedicated) then {
	call compile preProcessFile "\iniDBI\init.sqf";
	execVM "Persistencia\CARGA\cargarvehiculos.sqf";
	execVM "Persistencia\CARGA\cargarcajas.sqf";
	null=[]execVM "tareas\tareas.sqf";
	execVM "Persistencia\CARGA\cargarotros.sqf";
	execVM "iniciaciones.sqf";

};
