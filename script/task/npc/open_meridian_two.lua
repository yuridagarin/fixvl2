Include("\\settings\\static_script\\meridian\\npc_meridian_level_update.lua")

if MeridianGetLevel() == 1 then
	MeridianUpdateLevel();
	SetCurrentNpcSFX(PIdx2NpcIdx(), 901, 1, 0, 5);
elseif MeridianGetLevel() < 1 then
	Msg2Player("C�c h� v�n ch�a �� th�ng c�nh gi�i kinh m�ch V� Gi�, kh�ng th� �� th�ng c�nh gi�i V� T��ng.");
else
	--do_nothing
end