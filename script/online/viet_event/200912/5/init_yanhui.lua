--=============================================
--create by baiyun 2009.8.27
--describe:Խ�ϰ�9�·������߾�������ʼ���ű�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--ˢ���߾�����������
t_denglong_sets = {
	[0] = {"Thi�u L�m", {204, 1526, 3269}},--������
	[1] = {"Nga My", {303, 1552, 3232}},--����һ
	[2] = {"���ng M�n", {305, 1530, 2921}},--���ڶ�
	[3] = {"C�i Bang", {209, 1515, 3265}},--������
	[4] = {"V� �ang", {312, 1707, 3477}},--������
	[5] = {"Ng� ��c", {407, 1555, 3286}},--������
	[6] = {"D��ng M�n", {219, 1655, 3301}},--������
};
function main()
	do return end
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091206 or nDate < 091106 then
--		return 0;
--	end
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
--	if nDay == 6 or nDay == 0 then
		create_npcs(nDay); -- t�o npc l� nu�ng to
--	else
--		if nHour ~= 0 and nHour ~= 1 then
--			create_npcs(nDay);
--		end
--	end
end

function create_npcs(nDay)
	local nNpcIndex = 0;
	local nNpcLifeTime = 57 * 60;--��Ϊsystemtimetask.txt������Щ�����ʱ���Ѿ���ռ�ã����Ա���΢��������ʱ��
	nNpcIndex = CreateNpc("L� n��ng b�nh", "L� N��ng", gf_UnPack(t_denglong_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\npc_zoujundenglong.lua"); 
	AddUnitStates(nNpcIndex, 6, GetTime());--��¼NPC������ʱ��
	AddGlobalNews("Y�n ti�c Th�t N��ng ���c chi�u ��i t�i ["..t_denglong_sets[nDay][1].."]. M�i ��ng ��o ��n tham d�!");
end