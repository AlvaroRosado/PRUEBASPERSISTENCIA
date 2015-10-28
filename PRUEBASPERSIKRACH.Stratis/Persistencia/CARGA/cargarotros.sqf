_exists = "Otros" call iniDB_exists;
_objcount = 0;
if (!isNil "_exists" && {_exists}) then
{	
	_objcount = ["Otros", "Info", "TOTAL", "STRING"] call iniDB_read;
	_number = parseNumber _objcount;

	if (_number > 0) then {
	{	
		_otros = _x;
			if (alive _otros  && !(_otros isKindOf "AllVehicles" || _otros isKindOf "Man" || _otros isKindOf "ReammoBox_F" || _otros isKindOf "Logic") && ((isTouchingGround _veh || (getPos _veh) select 2 <= 1) )) then
			{		
				deleteVehicle _otros;
			}
			else
			{
			};
	} forEach allMissionObjects "All";
	

for [{_i=1},{_i<=_number},{_i=_i+1}] do {
	_otrosID = format ["objeto%1", _i];
	_class = ["Otros", _otrosID, "Class", "STRING"] call iniDB_read;
	_pos = ["Otros", _otrosID, "Position", "ARRAY"] call iniDB_read;
	if (!isNil "_class" && {!isNil "_pos"}) then 
	{
	_dir = ["Otros", _otrosID, "Direction", "ARRAY"] call iniDB_read;
	_damage = ["Otros", _otrosID, "Damage", "SCALAR"] call iniDB_read;
	_weapons = ["Otros", _otrosID, "Weapons", "ARRAY"] call iniDB_read;
	_magazines = ["Otros", _otrosID, "Magazines", "ARRAY"] call iniDB_read;
	_items = ["Otros", _otrosID, "Items", "ARRAY"] call iniDB_read;
	_backpacks = ["Otros", _otrosID, "Backpacks", "ARRAY"] call iniDB_read;
	{ if (typeName _x == "STRING") then { _pos set [_forEachIndex, parseNumber _x] } } forEach _pos;
	_otros = createVehicle [_class, _pos, [], 0, "None"];
	_otros setPosWorld ATLtoASL _pos;
		if (!isNil "_dir") then
	{
	_otros setVectorDirAndUp _dir;
	};	
	_otros allowDamage false;
	_otros hideObjectGlobal true;
	clearWeaponCargoGlobal _otros;
	clearMagazineCargoGlobal _otros;
	clearItemCargoGlobal _otros;
	clearBackpackCargoGlobal _otros;
	if (!isNil "_weapons") then
	{
	{ _otros addWeaponCargoGlobal _x } forEach _weapons;
	};
	if (!isNil "_magazines") then
	{
	{ _otros addMagazineCargoGlobal _x } forEach _magazines;
	};
	if (!isNil "_items") then
	{
	{ _otros addItemCargoGlobal _x } forEach _items;
	};
	if (!isNil "_backpacks") then
	{
	{ _otros addBackpackCargoGlobal _x } forEach _backpacks;
	};
	_otros allowDamage true;
	_otros hideObjectGlobal false;
	};
	
};
};
};