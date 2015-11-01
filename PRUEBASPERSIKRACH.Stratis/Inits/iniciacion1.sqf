//Script de iniciación 1 ejecutado desde el init del objeto/vehículo en el editor
_OBJETO = _this select 0;
_OBJETO setVariable["iniciacion", "tieneinit", true];
_nombre = vehicleVarName _OBJETO;
//Segun el nombre del objeto, se decide su init
if (_nombre == "ammo1") then {
//Aqui init, como se pondría en el editor pero cambiando en su caso this por _OBJETO
_OBJETO addAction ["Arsenal","Inits\arsenal.sqf"];
};
if (_nombre == "parque") then {
//Aqui init, como se pondría en el editor pero cambiando en su caso this por _OBJETO
_OBJETO addAction ["GUARDAR BASE DE DATOS","guardartodo.sqf"];
};
