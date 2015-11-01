//Script de iniciación 2 ejecutado para un objeto/vehiculo creado desde la base de datos
_OBJETO = _this select 0;
_nombre = _this select 1;
_OBJETO setVariable["iniciacion", "tieneinit", true];
//Segun el nombre del objeto, se decide su init
if (_nombre == "ammo1") then {
//Aqui init, como se pondría en el editor pero cambiando en su caso this por _OBJETO
_OBJETO addAction ["Arsenal","Inits\arsenal.sqf"];
};
if (_nombre == "parque") then {
//Aqui init, como se pondría en el editor pero cambiando en su caso this por _OBJETO
_OBJETO addAction ["GUARDAR BASE DE DATOS","guardartodo.sqf"];
};
