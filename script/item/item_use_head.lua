--�ű����ܣ�����2Խ�ϰ���Ʒʹ�ò��ֹ���ͳһ����
--������ƣ��峤
--���ܿ������峤
--����ʱ�䣺2011-4-19
--�޸ļ�¼��
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\ktabfile.lua")
--���ݶ�ȡ
SZ_INI_FILE_WAY="\\settings\\item\\item_use_add.ini"
g_objItemUseRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objItemUseRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
SkeyMain ="MainInfo"
SkeyItemInfo ="tItemInfo"
tPrizeName = g_objItemUseRule:GetTable(SkeyMain,"tPrizeName")
--��ʱ�����������
nTaskTempId_UseItem1 = 247
nTaskTempId_UseItem2 = 248
--������������
sClew = "<color=green>Nh�c nh�<color>: s� d�ng 1 <color=green>%s<color> c� th� nh�n ���c"
sUseDtmAsk = "X�c ��nh s� d�ng %s?"
sUseDtmSel = "S� d�ng %s/use_dtm"
sOutDiaSel = "�� ta ngh� l�i/no"
sUseNumInput = "S� d�ng bao nhi�u %s?"
--===�����߼�
function OnUse(nItemIndex)
	local nItemSeq,tItemInfo = 0,{}
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for j = 1,1000 do
		tItemInfo = g_objItemUseRule:GetMixTable(SkeyMain,SkeyItemInfo..tostring(j))
		if tItemInfo == nil then
			break
		elseif tItemInfo[1][1] == nGenre and tItemInfo[1][2] == nDetail and tItemInfo[1][3] == nParticular then
			nItemSeq = j
			break
		end
	end
	if nItemSeq == 0 then
		return
	end
	SetTaskTemp(nTaskTempId_UseItem1,nItemSeq)
	SetTaskTemp(nTaskTempId_UseItem2,nItemIndex)
	local sSayMain = ""
	if tItemInfo[3] == nil then
		sSayMain = "<color=green>"..tItemInfo[2][2]..tPrizeName[tItemInfo[2][1]][1]..tPrizeName[tItemInfo[2][1]][2].."<color>."
	else
		dostring("return "..tItemInfo[3][1].."()")
	end
	local tUseItemSay = {
		format(sClew..sSayMain,tItemInfo[1][4]),
		format(sUseDtmAsk,tItemInfo[1][4]),
		format(sUseDtmSel,tItemInfo[1][4]),
		sOutDiaSel
	}
	Say(tUseItemSay[1]..tUseItemSay[2],2,tUseItemSay[3],tUseItemSay[4])
end
--��������
function use_dtm()
	local tItemInfo = get_item_info()
	local nItemCount = GetItemCount(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3])
	if nItemCount <= 0 then
		return
	elseif nItemCount == 1 then
		use_deal(1)
	else
		AskClientForNumber("use_deal", 1,nItemCount, format("S� d�ng bao nhi�u %s?",tItemInfo[1][4]))
	end
end
--ʹ�ô���
function use_deal(nItemNum)
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	local tItemInfo = get_item_info()
	if nItemNum == 1 then
		local nItemIndex = GetTaskTemp(nTaskTempId_UseItem2)
		if DelItemByIndex(nItemIndex,1) == 1 then
			gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"S� d�ng v�t ph�m",tItemInfo[1][4].."x"..nItemNum)
		end
	elseif DelItem(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3],nItemNum) == 1 then
		gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"S� d�ng v�t ph�m",tItemInfo[1][4].."x"..nItemNum)
	end
end
--��ȡ��Ʒ��Ӧ��Ϣ
function get_item_info()
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	return g_objItemUseRule:GetMixTable(SkeyMain,SkeyItemInfo..tostring(nItemSeq))
end
function no()
end
