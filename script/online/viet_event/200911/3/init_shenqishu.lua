--=============================================
--create by baiyun 2009.10.19
--describe:Խ�ϰ�11������������ʼ���ű�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--ˢ���߾�����������
t_shenqishu_sets = {
	[0] = {"Thi�u L�m", {204, 1526, 3269}},--������
	[1] = {"Nga My", {303, 1554, 3235}},--����һ
	[2] = {"���ng M�n", {305, 1530, 2921}},--���ڶ�
	[3] = {"C�i Bang", {209, 1515, 3265}},--������
	[4] = {"V� �ang", {312, 1707, 3477}},--������
	[5] = {"Ng� ��c", {407, 1555, 3286}},--������
	[6] = {"D��ng M�n", {219, 1655, 3301}},--������
};
function main()
	do return end
end

function create_npcs(nDay)
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
	local nNpcIndex = 0;
	local nNpcLifeTime = 30 * 60;
	nNpcIndex = CreateNpc("c�y �a M�t Hoa Qu� l�n", "C�y th�n k�", gf_UnPack(t_shenqishu_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\3\\npc_shenqishu.lua");
	AddGlobalNews("C� ng��i ph�t hi�n c�y th�n k� xu�t hi�n t�i ["..t_shenqishu_sets[nDay][1].."]");
	
	local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
	SetGlbValue(1014, nNpcIndex);
	SetGlbValue(1015, nMapId);
	SetGlbValue(1016, nMapX);
	SetGlbValue(1017, nMapY);
	
	SubWorld = SubWorldID2Idx(nMapId);
	OpenMission(48, nMapId);
end