--by liubo
--�������ű��ӿ�
--���ڸ��
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\misc\\taskmanager.lua")

ACTIVIY_GOODS_NUM = 68 --��Ʒ����
--externds old taskid
--don't to modify this value by SetTask
VET_201112_GET_TAG_TASKID = 2778
VET_201112_USED_NUM_TASKID = 2779
--server globle value
g_201112_Globle_Value = 2012
-------------------------------------
--Relay �������ݿ��¼�ṹ
Record_Struct = {
	szKey = "spring_festival",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "missionaries1",
}
thisFilePath = "\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua"
-------------------------------------
--������
VET_201112_CHUNJIE_AWARD = {
	{3, 2345, 8880000, 1},
  {1, 6879, "Ngo�i trang t�t xu�n",{
 			{{"Trang ph�c xu�n chu�n",{0,109,113,1}},{"Trang ph�c xu�n kh�i ng�",{0,109,114,1}},{"Trang ph�c xu�n Ki�u n�",{0,109,116,1}},{"Trang ph�c xu�n g�i c�m",{0,109,115,1}},}, --1��
 			}, 30*24*3600, 1},
 	{1, 345, "Ngo�i trang t�t xu�n",{
 			{{"Trang ph�c xu�n chu�n",{0,109,113,1}},{"Trang ph�c xu�n kh�i ng�",{0,109,114,1}},{"Trang ph�c xu�n Ki�u n�",{0,109,116,1}},{"Trang ph�c xu�n g�i c�m",{0,109,115,1}},}, --1��
 			}, 0, 1},
 	{1, 345, "Ni�n th�", {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
  {1, 39, "Thi�n Cang L�nh", {2, 95, 204, 1}, 0},
  {1, 47, "��ng Ph��ng Long Ch�u", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
}

tSTRING_NPC = "<color=green>B�ch ti�n sinh: <color>"
tSTRING_TABLE = {
	[1] = "Trong th�i gian event, ng��i ch�i �� nh�n ph�n th��ng cu�i trong ho�t ��ng m�ng t�t xu�n c� th� nh�n ���c ph�n th��ng N�m M�i C�t T��ng t�i B�ch Ti�n Sinh. Ph�n th��ng N�m M�i C�t T��ng ch� gi�i h�n trong <color=green>%d<color> ph�n.",
	[2] = "Nh�n ph�n th��ng n�m m�i c�t t��ng",
	[3] = "Ki�m tra s� qu� c�n l�i",
	[4] = "L�i ch�c ph�c t� thi�n ch�a!",
	[5] = "Tho�t",
	[6] = "Ph�n th��ng �� ph�t h�t <color=green>%d<color> ph�n, th�t ��ng ti�c, b�n �� ��n tr�.",
	[7] = "Thi�u hi�p v�n ch�a nh�n ph�n th��ng cu�i c�a ho�t ��ng t�t xu�n, s� l��ng hi�n t�i �� s� d�ng ���c <color=green>%d<color>/<color=green>%d<color>",
	[8] = "S� li�u ghi nh�n ch�a ��n, h�y quay l�i sau.",
	[9] = "S� l��ng ph�n th��ng c�n l�i <color=green>%d<color> ph�n.",
	[10] = "Xin ch�c m�ng <%s> �� nh�n ���c ph�n qu� ��c bi�t m�a t�t xu�n, s� qu� c�n l�i <%d> ph�n.",
	[11] = "Thi�u hi�p �� nh�n qu� t�t xu�n c�t t��ng n�y r�i.",
}

VET_201112_CHUNJIE_TASK = TaskManager:Create(10,1)
VET_201112_CHUNJIE_TASK.FLAG = 1

---------------------------------
--interface table
--use "tinsert"
CHUNJIE_GETFINALAWARD = tSTRING_TABLE[2].."/get_201112_final_award";
CHUNJIE_GETUSENUM = tSTRING_TABLE[3].."/get_201112_usable_num";
CHUNJIE_EXIT = tSTRING_TABLE[5].."/do_nothing";
--for example :
--Include("this File")
function get_final_top()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "Ph�c nh� ��ng H�i - Th� T� Nam S�n"
--	-----interface---------
--	local nStart = MkTime(2012,1,13,0,0,0);
--	local nEnd = MkTime(2012,1,16,0,0,0);
--	local nNowTime = GetTime();
--	if nNowTime >= nStart and nNowTime <= nEnd then
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120113 and nDate <= 20120115 then
		tinsert(tbSay,CHUNJIE_GETFINALAWARD);
		tinsert(tbSay,CHUNJIE_GETUSENUM);
		tinsert(tbSay,CHUNJIE_EXIT);
	else
		tinsert(tbSay,tSTRING_TABLE[4]);
	end

	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------
function get_201112_final_award()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event �� h�t h�n!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event �� h�t h�n!")
		return 0;
	end	
	--���ʹ������ݿ�
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	--�Ƿ񳬳��˽�������
	if nPoint >= ACTIVIY_GOODS_NUM + 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[6],ACTIVIY_GOODS_NUM))
		return 0
	end
	--�Ƿ�����ȡ�ռ�����
	if GetTask(VET_201112_GET_TAG_TASKID) ~= 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[7],GetTask(VET_201112_USED_NUM_TASKID),CLASS_ACTIVITY.tbPrizeItemInfo[1].nItemUseTimesMax))
		return 0
	end
	--�Ƿ��Ѿ���ȡ��
	if VET_201112_CHUNJIE_TASK:GetTask(VET_201112_CHUNJIE_TASK.FLAG) == 1 then
		Talk(1,"",tSTRING_NPC..tSTRING_TABLE[11])
		return 0
	end
	--�����ռ�
	if gf_Judge_Room_Weight(1,30," ") ~= 1 then
        Talk(1,"",tSTRING_NPC.."Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	--������
	gf_EventGiveRandAward(VET_201112_CHUNJIE_AWARD,10000,1,"Hoat dong thang 1 nam 2012","�ua ph�n th��ng T�t")
	SetGlbValue(g_201112_Globle_Value,nPoint+1)
	AddRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath,"do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",nPoint+1)
	Msg2Global(format(tSTRING_TABLE[10],GetName(),ACTIVIY_GOODS_NUM-nPoint))
	VET_201112_CHUNJIE_TASK:SetTask(VET_201112_CHUNJIE_TASK.FLAG,1)
end

function get_201112_usable_num()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event �� h�t h�n!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event �� h�t h�n!")
		return 0;
	end
	--���ʹ������ݿ�
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[9],ACTIVIY_GOODS_NUM-nPoint+1))
end

function callback_modifydata(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end	
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, thisFilePath, "do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",1)
	end	
	local nPoint, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Record_Struct.itemkey)
	SetGlbValue(g_201112_Globle_Value,nPoint)
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
end

function do_nothing()
end