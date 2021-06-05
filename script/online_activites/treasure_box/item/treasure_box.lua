--by liubo
--�ر���ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_TREASUER_BOX_AWARD = {
 	{2, 5050, 5000000, 1},
 	{3, 1000, 450000, 1},
     {1, 3000, "Kim R��ng", {2, 1, 30342, 1}, 0},
     {1, 900, "B�ch Kim R��ng", {2, 1, 30343, 1}, 0},
     {1, 50, "Th�n T�i B�o R��ng", {2, 1, 30344, 1}, 0},
}
function OnUse(nItem)
	Talk(1, "", "T�nh n�ng t�m ��ng �� b�o tr�. B�n vui l�ng quay l�i sau !!")
	do return end
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Th�i �i�m hi�n t�i ch�a cho ph�p ��i r��ng, c�c h� h�y s� d�ng sau nh�.")
			do	return	end
		end
	end
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_TREASUER_BOX_AWARD,10000, "", "Than Tai Bao Ruong","S� d�ng T�ng R��ng")
	end
end