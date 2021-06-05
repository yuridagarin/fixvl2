Include("\\script\\online\\viet_event\\vng_task_control.lua")

szLogTitle = "Phao hoa Idol 2010"

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

YANHUO_TABLE = {
	{"X�ch M�c H�a Di�m", 801, 10, 2, 1, 191},
	{"Tranh M�c H�a Di�m", 802, 10, 2, 1, 193},
	{"Lam M�c H�a Di�m", 805, 10, 2, 1, 192},
	{"Tranh S�c Y�n Hoa", 820, 3, 2, 1, 189},
	{"Lam S�c Y�n Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--�����̻�
	{""		   , 811, 5, 2, 1, 194},
	{""		   , 813, 10, 2, 1, 194},
	{""		   , 814, 10, 2, 1, 194},
	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function use_firework1()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", "Kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� s� d�ng ph�o hoa!")
		return
	end
	
	local nCurDate = floor(GetTask(FIREWORK_IDOL_USE) / 100)
	if nCurDate ~= nDate then
		SetTask(FIREWORK_IDOL_USE, nDate * 100)
		SetTask(FIREWORK_IDOL_TIME, 0)
	end
	
	local nHour = tonumber(date("%H%M"))
	if nHour < 0900 or (nHour > 1000 and nHour < 1530) or (nHour > 1630 and nHour < 2030) or nHour > 2130 then
		Talk(1, "", "Ho�t ��ng ��t ph�o hoa di�n ra t� 9 gi� ��n 10 gi�, t� 15 gi� 30 ��n 16 gi� 30, t� 20 gi� 30 ��n 21 gi� 30!")
		return
	end
	
	local nPos = GetWorldPos()
	if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
		Talk(1, "", "Ch� c� th� s� d�ng ph�o hoa t�i Tuy�n Ch�u, D��ng Ch�u, chi�n tr��ng Nh�n M�n Quan, S�t Th� ���ng v� trong T�i Nguy�n Chi�n!")
		return
	end
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� ��t ph�o hoa!")
		return
	end
	if check_skill_55() == 0 then
		Talk(1, "", "Ch�a h�c k� n�ng c�p 55 c�a m�n ph�i n�n kh�ng th� ��t ph�o hoa!")
		return
	end
	
	local nCount = mod(GetTask(FIREWORK_IDOL_USE), 100)
	if nCount >= 40 then
		Talk(1, "", "H�m nay thi�u hi�p �� d�ng qu� nhi�u ph�o hoa r�i, ch�ng c�n ph�o cho thi�u hi�p n�a ��u. H�y quay l�i v�o ng�y mai!")
		return
	end
	
	local nDif = 30 - (GetTime() - GetTask(FIREWORK_IDOL_TIME))
	if nDif > 0 then
		Talk(1, "", "Thi�u hi�p ph�i ch� "..nDif.." gi�y n�a m�i c� th� ti�p t�c ��t ph�o hoa!")
		return
	end
	
	ModifyExp(200000)
	Msg2Player("Nh�n ���c 200000 �i�m kinh nghi�m")
	WriteLogEx(szLogTitle, "S� d�ng ph�o hoa nh�n 200000  �i�m kinh nghi�m")
	SetTask(FIREWORK_IDOL_USE, GetTask(FIREWORK_IDOL_USE) + 1)
	SetTask(FIREWORK_IDOL_TIME, GetTime())
	local nIndex = random(1, getn(YANHUO_TABLE))
	DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3])
	StartTimeGuage("Ph�o hoa th�n t��ng V� L�m 2", 30,0,1)
end

function check_skill_55()
	local nRoute = GetPlayerRoute()
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end
	end
end