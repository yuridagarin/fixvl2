--=============================================
--create by baiyun 2009.11.13
--describe:Խ�ϰ�12�·ݻ������ʦ��ʼ���ű�
--============================================
Include("\\script\\lib\\globalfunctions.lua");
t_wushi_sets = {
	{"T�y Tuy�n Ch�u", {105, 1532, 3021}},
	{"B�c Tuy�n Ch�u", {108, 1512, 3072}},
};
function main()
	local nDate = tonumber(date("%y%m%d"));	
      if nDate > 100117 or nDate < 091218 then
	    return 0;
	end
	if SubWorldID2Idx(105) <= 0 then
		return 0;
	end
	local nRandSet = random(1, 2);
	local nNpcIndex = CreateNpc("Ph� th�y b�ng gi�", "Ph� th�y b�ng gi�", gf_UnPack(t_wushi_sets[nRandSet][2]));
	SetNpcLifeTime(nNpcIndex, 120 * 60);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--AddUnitStates(nNpcIndex, 6, GetTime());--��¼NPC������ʱ��
	AddGlobalNews(format("Ph� Th�y B�ng Gi� �� xu�t hi�n t�i  %s. V� l�m l�i s�p c� m�t ��t b�ng gi�. C�c h� h�y mau mau �i thu ph�c � �� tr�nh m�t ��t b�o tuy�t c� th� s� x�y ra!", t_wushi_sets[nRandSet][1]));
end

