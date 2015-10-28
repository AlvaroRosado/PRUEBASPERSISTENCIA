call compile preprocessFileLineNumbers "fhqtt2.sqf";
call compile preprocessFileLineNumbers "briefing.sqf";
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
	sleep 0.2;
	execVM "Persistencia\CARGA\cargarvehiculos.sqf";
	sleep 0.2;
	execVM "Persistencia\CARGA\cargarcajas.sqf";
	sleep 0.2;
	execVM "Persistencia\CARGA\cargartareas.sqf";
	sleep 0.2;
	execVM "Persistencia\CARGA\cargarotros.sqf";
	sleep 0.2;
	null=[]execVM "tareas\cache1.sqf";
};
