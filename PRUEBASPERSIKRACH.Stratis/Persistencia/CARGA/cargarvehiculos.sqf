private ["_veh", "_class", "_pos","_dir","_damage","_weapons","_items","_backpacks","_vehcount","_hitPoints"];
_exists = "vehiculos" call iniDB_exists;
_vehcount = 0;
if (!isNil "_exists" && {_exists}) then
{	
	_vehcount = ["vehiculos", "Info", "TOTAL", "STRING"] call iniDB_read;
	_number = parseNumber _vehcount;
		if (_number > 0) then {
		{
					_veh = _x;
				if (alive _veh  && (_veh isKindOf "AllVehicles") && !(_veh isKindOf "Man" || _veh isKindOf "StaticWeapon") && ((isTouchingGround _veh || (getPos _veh) select 2 <= 1) )) then
				{		
					deleteVehicle _veh;
				}
				else
				{
				};
		} forEach allMissionObjects "AllVehicles";
		
	for [{_i=1},{_i<=_number},{_i=_i+1}] do {
	_vehID = format ["Veh%1", _i];
	_class = ["vehiculos", _vehID, "Class", "STRING"] call iniDB_read;
	_pos = ["vehiculos", _vehID, "Position", "ARRAY"] call iniDB_read;
	if (!isNil "_class" && {!isNil "_pos"}) then 
	{
	
	_dir = ["vehiculos", _vehID, "Direction", "ARRAY"] call iniDB_read;
	_damage = ["vehiculos", _vehID, "Damage", "SCALAR"] call iniDB_read;
	_hitPoints = ["vehiculos", _vehID, "HitPoints", "ARRAY"] call iniDB_read;
	_weapons = ["vehiculos", _vehID, "Weapons", "ARRAY"] call iniDB_read;
	_magazines = ["vehiculos", _vehID, "Magazines", "ARRAY"] call iniDB_read;
	_items = ["vehiculos", _vehID, "Items", "ARRAY"] call iniDB_read;
	_backpacks = ["vehiculos", _vehID, "Backpacks", "ARRAY"] call iniDB_read;
	{ if (typeName _x == "STRING") then { _pos set [_forEachIndex, parseNumber _x] } } forEach _pos;
	_veh = createVehicle [_class, _pos, [], 0, "None"];
	_veh hideObjectGlobal true;
	_veh setPosWorld ATLtoASL _pos;
	if (!isNil "_dir") then
	{
	_veh setVectorDirAndUp _dir;
	};	
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	{ _veh setHitPointDamage _x } forEach _hitPoints;

	if (!isNil "_weapons") then
	{
	{ _veh addWeaponCargoGlobal _x } forEach _weapons;
	};
	if (!isNil "_magazines") then
	{
	{ _veh addMagazineCargoGlobal _x } forEach _magazines;
	};
	if (!isNil "_items") then
	{
	{ _veh addItemCargoGlobal _x } forEach _items;
	};
	if (!isNil "_backpacks") then
	{
	{ _veh addBackpackCargoGlobal _x } forEach _backpacks;
	};
	_veh hideObjectGlobal false;
	};
	

										
									};
								};
};