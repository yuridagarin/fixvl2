--=============================================
--create by baiyun 2009.8.26
--describe:Խ�ϰ�9�·������������ӽű�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--ˢ�����ӵ�����
t_wenzi_sets = {
	[0] = {"T�y Bi�n Kinh", {203, 1522, 3053}},--������
	[1] = {"B�c Ph�ng T��ng", {504, 1363, 3081}},--����һ
	[4] = {"B�c Tuy�n Ch�u", {108, 1459, 3141}},--������
	[5] = {"T�y Th�nh ��", {301, 1492, 2986}},--������
	[6] = {"V�n M�ng Tr�ch", {151, 1545, 3011}},--������
};

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 091108 or nDate < 090918 then
		return 0;
	end
	local nDay = tonumber(date("%w"));
	local nNpcLifeTime = 120 * 60;
	local nNpcIndex = 0;
	if t_wenzi_sets[nDay] ~= nil then
		nNpcIndex = CreateNpc("V�n T� V��ng", "��i v�n t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V�n T� V��ng", "Nh� v�n t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		nNpcIndex = CreateNpc("V�n T� V��ng", "Tam v�n t�", gf_UnPack(t_wenzi_sets[nDay][2]));
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\3\\death_wenzi.lua");
		SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
		Msg2Global("C� ng��i th�y ��n Mu�i Tr�u xu�t hi�n t�i "..t_wenzi_sets[nDay][1]..". C�c h� h�y mau mau �i thu ph�c ch�ng.");
		AddGlobalNews("C� ng��i th�y ��n Mu�i Tr�u xu�t hi�n t�i "..t_wenzi_sets[nDay][1]..". C�c h� h�y mau mau �i thu ph�c ch�ng.");
	end
end