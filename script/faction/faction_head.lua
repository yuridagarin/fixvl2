--�ű����ܣ�ʦ�������Ϣ����
--���ܿ������峤
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
Include("\\script\\lib\\globalfunctions.lua")
--����ID
NFACTIONID_SL = 1
NFACTIONID_WD = 2
NFACTIONID_EM = 3
NFACTIONID_GB = 4
NFACTIONID_TM = 5
NFACTIONID_YM = 6
NFACTIONID_WDU = 7
NFACTIONID_KL = 8
NFACTIONID_MJ = 9
NFACTIONID_CY = 10
--����ID
NROUTEID_SL = 1
NROUTEID_SLSJ = 2
NROUTEID_SLCS = 3
NROUTEID_SLWS = 4
NROUTEID_TM = 5
NROUTEID_TMRL = 6
NROUTEID_EM = 7
NROUTEID_EMFJ = 8
NROUTEID_EMSJ = 9
NROUTEID_GB = 10
NROUTEID_GBJY = 11
NROUTEID_GBWY = 12
NROUTEID_WD = 13
NROUTEID_WDDJ = 14
NROUTEID_WDSJ = 15
NROUTEID_YM = 16
NROUTEID_YMQQ = 17
NROUTEID_YMGQ = 18
NROUTEID_WDU = 19
NROUTEID_WDUXX = 20
NROUTEID_WDUGS = 21
NROUTEID_KL = 22
NROUTEID_KLTS = 23
NROUTEID_MJ = 24
NROUTEID_MJSZ = 25
NROUTEID_MJZB = 26
NROUTEID_MJXR = 27
NROUTEID_CY = 28
NROUTEID_CYWX = 29
NROUTEID_CYLN = 30
	--��������δ���
NROUTEID_KL = 22
NROUTEID_MJ = 24
NROUTEID_CY = 28
--�Ա��Ӧ�ƺ�
TPLAYER_SEX_NAME = {"Huynh ��","C� n��ng"}

--������Ϣ�ܱ�
TFACTION_INFO = {
	[NFACTIONID_SL] = {
		--��������
		sFactionName = "Thi�u L�m",
		--�̵���Ϣ
		tShopId = {44,66,67,68},
	},
	[NFACTIONID_WD] = {
		--��������
		sFactionName = "V� �ang",
		--�̵���Ϣ
		tShopId = {46,78,79,80},
	},
	[NFACTIONID_EM] = {
		--��������
		sFactionName = "Nga My",
		--�̵���Ϣ
		tShopId = {45,72,73,74},
	},
	[NFACTIONID_GB] = {
		--��������
		sFactionName = "C�i Bang",
		--�̵���Ϣ
		tShopId = {47,75,76,77},
	},
	[NFACTIONID_TM] = {
		--��������
		sFactionName = "���ng M�n",
		--�̵���Ϣ
		tShopId = {48,69,70,71},
	},
	[NFACTIONID_YM] = {
		--��������
		sFactionName = "D��ng M�n",
		--�̵���Ϣ
		tShopId = {51,81,82,83},
	},
	[NFACTIONID_WDU] = {
		--��������
		sFactionName = "Ng� ��c",
		--�̵���Ϣ
		tShopId = {55,84,85,86},
	},
	--һ����δ����
	[NFACTIONID_CY] = {
		--��������
		sFactionName = "Th�y Y�n",
		--�̵���Ϣ
		tShopId = {120,121,122,123},
	},
	[NFACTIONID_KL] = {
		--��������
		sFactionName = "C�n L�n",
		--�̵���Ϣ
		tShopId = {112,113,114,115},
	},
	[NFACTIONID_MJ] = {
		--��������
		sFactionName = "Minh gi�o",
		--�̵���Ϣ
		tShopId = {116,117,118,119},
	}
}
--������δ�����ɶ�Ӧ����
TFACTION_ROUTE = {
	[NFACTIONID_SL]= NROUTEID_SL,
	[NFACTIONID_WD]= NROUTEID_WD,
	[NFACTIONID_EM]= NROUTEID_EM,
	[NFACTIONID_GB]= NROUTEID_GB,
	[NFACTIONID_TM]= NROUTEID_TM,
	[NFACTIONID_YM]= NROUTEID_YM,
	[NFACTIONID_WDU]= NROUTEID_WDU,
	[NFACTIONID_KL]= NROUTEID_KL,
	[NFACTIONID_MJ]= NROUTEID_MJ,
	[NFACTIONID_CY]= NROUTEID_CY,
}
--==========ʦ��װ�����
TFACTION_EQUIP_INFO = {
	--ʦ�ŵ�һ��
	[40] = {
		--����
		[NROUTEID_SL] = {},
		--�����׼�
		[NROUTEID_SLSJ] = {
			{
				{"H�nh Gi� m�o",0,103,201},
				{"H�nh Gi� ph�c",0,100,201},
				{"H�nh Gi� trang",0,101,201},
				{"H�nh Gi� Gi�i �ao",0,3,201},
				{"H�nh Gi� Gi�i c�n",0,5,201},
			},
			{
				{"H�nh Gi� m�o",0,103,202},
				{"H�nh Gi� ph�c",0,100,202},
				{"H�nh Gi� trang",0,101,202},
				{"H�nh Gi� Gi�i �ao",0,3,202},
				{"H�nh Gi� Gi�i c�n",0,5,202},
			},
		},
		--������ɮ
		[NROUTEID_SLCS] = {
			{
				{"Kh� H�nh m�o",0,103,301},
				{"Kh� H�nh b�o",0,100,301},
				{"Kh� H�nh ph�c",0,101,301},
				{"Kh� H�nh Tr��ng",0,8,301},
			},
			{
				{"Kh� H�nh m�o",0,103,302},
				{"Kh� H�nh b�o",0,100,302},
				{"Kh� H�nh ph�c",0,101,302},
				{"Kh� H�nh Tr��ng",0,8,302},
			},
		},
		--������ɮ
		[NROUTEID_SLWS] = {
			{
				{"Sa Di m�o",0,103,401},
				{"Sa Di Ph�c",0,100,401},
				{"Sa Di ph�c",0,101,401},
				{"Sa Di H� Uy�n",0,0,401},
			},
			{
				{"Sa Di m�o",0,103,402},
				{"Sa Di Ph�c",0,100,402},
				{"Sa Di ph�c",0,101,402},
				{"Sa Di H� Uy�n",0,0,402},
			},
		},
		--����
		[NROUTEID_TM] = {},
		--����
		[NROUTEID_TMRL] = {
			{
				{"Trang Kh�ch m�o",0,103,601},
				{"Trang kh�ch ph�c",0,100,601},
				{"Trang Kh�ch ph�c",0,101,601},
				{"Trang Kh�ch Phi �ao",0,1,601},
			},
			{
				{"Trang Kh�ch m�o",0,103,602},
				{"Trang kh�ch ph�c",0,100,602},
				{"Trang Kh�ch ph�c",0,101,602},
				{"Trang Kh�ch Phi �ao",0,1,602},
			},
			{
				{"Trang Kh�ch m�o",0,103,603},
				{"Trang kh�ch ph�c",0,100,603},
				{"Trang Kh�ch ph�c",0,101,603},
				{"Trang Kh�ch Phi �ao",0,1,603},
			},
			{
				{"Trang Kh�ch m�o",0,103,604},
				{"Trang kh�ch ph�c",0,100,604},
				{"Trang Kh�ch ph�c",0,101,604},
				{"Trang Kh�ch Phi �ao",0,1,604},
			},
		},
		---����
		[NROUTEID_EM] = {},
		--���ҷ��
		[NROUTEID_EMFJ] = {	{},{},
			{
				{"Thanh T�m",0,103,801},
				{"Thanh T�m t� y",0,100,801},
				{"Thanh T�m t� trang",0,101,801},
				{"Thanh T�m T� Ki�m",0,2,801},
			},
			{
				{"Thanh T�m",0,103,802},
				{"Thanh T�m t� y",0,100,802},
				{"Thanh T�m t� trang",0,101,802},
				{"Thanh T�m T� Ki�m",0,2,802},
			},
		},
		--�����׼�
		[NROUTEID_EMSJ] = {	{},{},
			{
				{"T� Kh�c",0,103,901},
				{"T� Kh�c t� y",0,100,901},
				{"T� Kh�c ph�c",0,101,901},
				{"T� Kh�c T� C�m",0,10,901},
			},
			{
				{"T� Kh�c",0,103,902},
				{"T� Kh�c t� y",0,100,902},
				{"T� Kh�c ph�c",0,101,902},
				{"T� Kh�c T� C�m",0,10,902},
			},
		},
		--ؤ��
		[NROUTEID_GB] = {},
		--ؤ�ﾻ��
		[NROUTEID_GBJY] = {
			{
				{"Ch�p B�t c�n",0,103,1101},
				{"Ch�p B�t Th��ng",0,100,1101},
				{"Ch�p B�t ph�c",0,101,1101},
				{"B�t s�",0,0,1101},
			},
			{
				{"Ch�p B�t c�n",0,103,1102},
				{"Ch�p B�t Th��ng",0,100,1102},
				{"Ch�p B�t ph�c",0,101,1102},
				{"B�t s�",0,0,1102},
			},
			{
				{"Ch�p B�t c�n",0,103,1103},
				{"Ch�p B�t Th��ng",0,100,1103},
				{"Ch�p B�t ph�c",0,101,1103},
				{"B�t s�",0,0,1103},
			},
			{
				{"Ch�p B�t c�n",0,103,1104},
				{"Ch�p B�t Th��ng",0,100,1104},
				{"Ch�p B�t ph�c",0,101,1104},
				{"B�t s�",0,0,1104},
			},
		},
		--ؤ������
		[NROUTEID_GBWY] = {
			{
				{"Khi�u Hoa c�n",0,103,1201},
				{"Khi�u Hoa y",0,100,1201},
				{"Khi�u Hoa Kh�",0,101,1201},
				{"Khi�u Hoa B�ng",0,5,1201},
			},
			{
				{"Khi�u Hoa c�n",0,103,1202},
				{"Khi�u Hoa y",0,100,1202},
				{"Khi�u Hoa Kh�",0,101,1202},
				{"Khi�u Hoa B�ng",0,5,1202},
			},
			{
				{"Khi�u Hoa c�n",0,103,1203},
				{"Khi�u Hoa y",0,100,1203},
				{"Khi�u Hoa Kh�",0,101,1203},
				{"Khi�u Hoa B�ng",0,5,1203},
			},
			{
				{"Khi�u Hoa c�n",0,103,1204},
				{"Khi�u Hoa y",0,100,1204},
				{"Khi�u Hoa Kh�",0,101,1204},
				{"Khi�u Hoa B�ng",0,5,1204},
			},
		},
		--�䵱
		[NROUTEID_WD] = {},
		--�䵱����
		[NROUTEID_WDDJ] = {
			{
				{"Thanh Tu c�n",0,103,1401},
				{"Thanh Tu b�o",0,100,1401},
				{"Thanh Tu ph�c",0,101,1401},
				{"Thanh Tu Ki�m",0,2,1401},
			},
			{
				{"Thanh Tu c�n",0,103,1402},
				{"Thanh Tu b�o",0,100,1402},
				{"Thanh Tu ph�c",0,101,1402},
				{"Thanh Tu Ki�m",0,2,1402},
			},
			{
				{"Thanh Tu c�n",0,103,1403},
				{"Thanh Tu b�o",0,100,1403},
				{"Thanh Tu ph�c",0,101,1403},
				{"Thanh Tu Ki�m",0,2,1403},
			},
			{
				{"Thanh Tu c�n",0,103,1404},
				{"Thanh Tu b�o",0,100,1404},
				{"Thanh Tu ph�c",0,101,1404},
				{"Thanh Tu Ki�m",0,2,1404},
			},
		},
		--�䵱�׼�
		[NROUTEID_WDSJ] = {
			{
				{"Thanh Phong c�n",0,103,1501},
				{"Thanh Phong b�o",0,100,1501},
				{"Thanh Phong ph�c",0,101,1501},
				{"Thanh Phong Th�ch",0,9,1501},
			},
			{
				{"Thanh Phong c�n",0,103,1502},
				{"Thanh Phong b�o",0,100,1502},
				{"Thanh Phong ph�c",0,101,1502},
				{"Thanh Phong Th�ch",0,9,1502},
			},
			{
				{"Thanh Phong c�n",0,103,1503},
				{"Thanh Phong b�o",0,100,1503},
				{"Thanh Phong ph�c",0,101,1503},
				{"Thanh Phong Th�ch",0,9,1503},
			},
			{
				{"Thanh Phong c�n",0,103,1504},
				{"Thanh Phong b�o",0,100,1504},
				{"Thanh Phong ph�c",0,101,1504},
				{"Thanh Phong Th�ch",0,9,1504},
			},
		},
		--����
		[NROUTEID_YM] = {},
		--����ǹ��
		[NROUTEID_YMQQ] = {
			{
				{"Khinh K� kh�i",0,103,1701},
				{"Khinh K� gi�p",0,100,1701},
				{"Khinh K� ph�c",0,101,1701},
				{"Khinh K� Th��ng",0,6,1701},
			},
			{
				{"Khinh K� kh�i",0,103,1702},
				{"Khinh K� gi�p",0,100,1702},
				{"Khinh K� ph�c",0,101,1702},
				{"Khinh K� Th��ng",0,6,1702},
			},
			{
				{"Khinh K� kh�i",0,103,1703},
				{"Khinh K� gi�p",0,100,1703},
				{"Khinh K� ph�c",0,101,1703},
				{"Khinh K� Th��ng",0,6,1703},
			},
			{
				{"Khinh K� kh�i",0,103,1704},
				{"Khinh K� gi�p",0,100,1704},
				{"Khinh K� ph�c",0,101,1704},
				{"Khinh K� Th��ng",0,6,1704},
			},
		},
		--���Ź���
		[NROUTEID_YMGQ] = {
			{
				{"N� Th� kh�i",0,103,1801},
				{"N� th� gi�p",0,100,1801},
				{"N� Th� ph�c",0,101,1801},
				{"N� Th� Cung",0,4,1801},
			},
			{
				{"N� Th� kh�i",0,103,1802},
				{"N� th� gi�p",0,100,1802},
				{"N� Th� ph�c",0,101,1802},
				{"N� Th� Cung",0,4,1802},
			},
			{
				{"N� Th� kh�i",0,103,1803},
				{"N� th� gi�p",0,100,1803},
				{"N� Th� ph�c",0,101,1803},
				{"N� Th� Cung",0,4,1803},
			},
			{
				{"N� Th� kh�i",0,103,1804},
				{"N� th� gi�p",0,100,1804},
				{"N� Th� ph�c",0,101,1804},
				{"N� Th� Cung",0,4,1804},
			},
		},
		--�嶾
		[NROUTEID_WDU] = {},
		--�嶾а��
		[NROUTEID_WDUXX] = {
			{
				{"�o�t Ph�ch di�n",0,103,2001},
				{"�o�t Ph�ch y",0,100,2001},
				{"�o�t Ph�ch ph�c",0,101,2001},
				{"�o�t Ph�ch �ao",0,7,2001},
			},
			{
				{"�o�t Ph�ch di�n",0,103,2002},
				{"�o�t Ph�ch y",0,100,2002},
				{"�o�t Ph�ch ph�c",0,101,2002},
				{"�o�t Ph�ch �ao",0,7,2002},
			},
			{
				{"�o�t Ph�ch di�n",0,103,2003},
				{"�o�t Ph�ch y",0,100,2003},
				{"�o�t Ph�ch ph�c",0,101,2003},
				{"�o�t Ph�ch �ao",0,7,2003},
			},
			{
				{"�o�t Ph�ch di�n",0,103,2004},
				{"�o�t Ph�ch y",0,100,2004},
				{"�o�t Ph�ch ph�c",0,101,2004},
				{"�o�t Ph�ch �ao",0,7,2004},
			},
		},
		--�嶾��ʦ
		[NROUTEID_WDUGS] = {
			{
				{"��c T�m di�n",0,103,2101},
				{"��c T�m Y",0,100,2101},
				{"��c T�m ph�c",0,101,2101},
				{"��c T�m Tr�o",0,11,2101},
			},
			{
				{"��c T�m di�n",0,103,2102},
				{"��c T�m Y",0,100,2102},
				{"��c T�m ph�c",0,101,2102},
				{"��c T�m Tr�o",0,11,2102},
			},
			{
				{"��c T�m di�n",0,103,2103},
				{"��c T�m Y",0,100,2103},
				{"��c T�m ph�c",0,101,2103},
				{"��c T�m Tr�o",0,11,2103},
			},
			{
				{"��c T�m di�n",0,103,2104},
				{"��c T�m Y",0,100,2104},
				{"��c T�m ph�c",0,101,2104},
				{"��c T�m Tr�o",0,11,2104},
			},
		},
	},
	--ʦ�ŵڶ�����ʱδ����
	--ʦ�ŵ�������ʱδ����

}
--ʦ��װ������
--��ע��1��player_way�����·��;2��palyer_body���������;3��att_num����װ������������40-45Ϊ40����40Ϊ��ʦ��ȫ�ף�41Ϊͷ��42Ϊ�·���43ΪЬ�ӣ�44Ϊ����
--(60-65Ϊ60��)60Ϊ��ʦ��ȫ�ף�61Ϊͷ��62Ϊ�·���63ΪЬ�ӣ�64Ϊ������65Ϊ����;4��knife_rung�������׼Ҹ������ǹ��ӣ�0Ϊȫ����4Ϊ����5Ϊ����
function Add_Faction_Equipment(player_way,palyer_body,att_num,knife_rung)
	knife_rung = knife_rung or 0
	local att_level = (floor(att_num/10)) * 10
	local att_seq = att_num - att_level
	local add_flag = 0						--���ӱ�־
	if att_seq == 0 then					--��ȫ�׵Ĵ���
		if player_way ~= 2 or (player_way == 2 and knife_rung == 0) then		--�����ٻ����ټ�ȫ��
			for i = 1, getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body]) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 4 then						--�ӵ�
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-1) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 5 then						--�ӹ�
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-2) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
			add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][4],1,1,-1,-1,-1,-1,-1,-1)
		end
	else
		if player_way == 2 and att_seq == 4 then
			att_seq = knife_rung
		end
		add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][4],1,1,-1,-1,-1,-1,-1,-1)
	end
	return add_flag
end
--==========ʦ�ŶԻ����
TFACTION_NPC_STRING = {}
TROUTE_MASTER_STRING = {
	[NROUTEID_SLSJ] = {
		MainDia = "",
	},
}
TROUTE_OTHER_STRING = {
	SkillLearn = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
		[5] = "",
		[6] = "",
	},
	MainDiaSel = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
	},
}
