Include("\\script\\lib\\globalfunctions.lua")

VET_TB_FENGSHOUDAI_AWARD =
{
	{1, "B�ch C�u Ho�n", {2, 1, 270, 2}, 30 * 24 * 3600,1},
	{1, "��i B�ch C�u ho�n", {2, 1, 1007, 2}, 30 * 24 * 3600,1},
 	{1, "B�ch C�u Ti�n ��n", {2, 1, 1008, 2}, 30 * 24 * 3600,1},
}
function OnUse(itemIndex)
	if (gf_JudgeRoomWeight(6,6,1) ~= 1) then
		return
	end
	if (DelItemByIndex(itemIndex, 1) == 1) then
		gf_EventGiveAllAward(VET_TB_FENGSHOUDAI_AWARD, "G�i Ti�n ��n", format("S� d�ng %s","G�i Ti�n ��n"))
	end
end