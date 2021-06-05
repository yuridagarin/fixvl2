--�ű����ƣ�������
--�ű����ܣ�ʹ���ú�����ӡ�Ѫ�ޡ�Ч����<enter><color=yellow>(�Ҽ����ʹ��)
--���ܲ߻���л�촺
--���ܿ���������
--����ʱ�䣺2009-12-07
--�����޸ļ�¼
----20100118	���������⴫_��ɽȺ�ۻ�_���������� л�촺
----���Ӿ�������ƷЧ����ʹ�ú�30s�޵У��������·�����������2.5��������8����

Include("\\script\\lib\\globalfunctions.lua");

g_tItem = {
	tInfo	= {"T� Ngh�a L�nh", 2, 95, 208},
	tAward	= {
		tInfo	= {"Thi�n th�n h� ph�m", 2, "Duy tr� %d ph�t"},
		tState	= {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo�i c�ng t�ng %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N�i c�ng t�ng %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi�i h�n m�u t�ng %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi�n d�ch tr�ng th�i b� h�i %d"},
			[5] = {9912, "state_dispear",				100,	"", 30, "V� ��ch trong %s gi�y"},
			},
		},
	tString = {
		[1] = "V�t ph�m kh�ng th� s� d�ng trong b�n �� n�y!",
		[2] = "[%s]: s� d�ng c� th� nh�n ���c <color=yellow>��%s��<color>HI�u qu�: \n          <color=green>%s<color>",
		[3] = "Ta mu�n nh�n hi�u qu���%s�� ",
		[4] = "T�m th�i kh�ng c�n",
		[5] = "C�#c h� �� nh�n ���c <color=yellow> hi�u qu� ��%s��<color>:",
	},
};

function OnUse()
	--��ͼ���
	if 6007 ~= GetMapTemplate(SubWorld) then
		Talk(1, "", "["..g_tItem.tInfo[1].."]:"..g_tItem.tString[1]);
		return 0;
	end
	--�һ��˵�
	local strTitle	= format(g_tItem.tString[2],g_tItem.tInfo[1],g_tItem.tAward.tInfo[1],GetInfo())
	local strMenu	= {
		format("\n"..g_tItem.tString[3].."/Award",g_tItem.tAward.tInfo[1]),
			"\n"..g_tItem.tString[4].."/nothing",
	};
	Say(strTitle, getn(strMenu), strMenu);
end

function Award()
	--ɾ����Ʒ
	if 1 ~= DelItem(g_tItem.tInfo[2], g_tItem.tInfo[3], g_tItem.tInfo[4], 1) then
		return 0;
	end
	--��Ӷһ�
	local tState	= g_tItem.tAward.tState;
	if 0 >= getn(tState) then
		return 0;
	end
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
	for i = 1, getn(tState) do
		local nTime = g_tItem.tAward.tInfo[2] * 60 * 18;
		if tState[i][5] then
			nTime = tState[i][5] * 18;
		end
		CastState(tState[i][2], tState[i][3], nTime, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, g_tItem.tAward.tInfo[1]);
	Talk(1, "", format(g_tItem.tString[5],g_tItem.tAward.tInfo[1]).."\n<color=green>"..GetInfo().."<color>");
end

function GetInfo()
	local strInfo	= "";
	local tState	= g_tItem.tAward.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..format(tState[i][4], tState[i][3]);
		if tState[i][6] then
			strInfo = strInfo..format(tState[i][6], tState[i][5]);
		end
		strInfo = strInfo..", ";
	end
	strInfo = strInfo..format(g_tItem.tAward.tInfo[3], g_tItem.tAward.tInfo[2])..".";
	return strInfo;
end

