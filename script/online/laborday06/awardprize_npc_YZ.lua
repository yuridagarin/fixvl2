--File name:awardprize_npc_XY.lua
--Describe:���ݾ۱�ի�ƹ�ű�
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local selTab = {
				"��i l�y ph�n th��ng./askforaward",
				"thuy�t minh ph�n th��ng./#knowrule(2)",
				"tra xem n�i dung ho�t ��ng./#knowdetail(2)",
				"tra xem v�t li�u �� n�p./#queryinfor(2)",
				"Nh�n s�ch c�ng lao T� B�o Trai./#getbook(2)",
				"K�t th�c ��i tho�i/nothing",
				};
	local nState = Get_Laborday_State();
	if nState == 0 then
		Talk(1,"","Ho�t ��ng ch�a b�t ��u");
	elseif nState == 3 then
		Talk(1,"","Ho�t ��ng �� k�t th�c!");
	elseif nState == 2 or nState == 1 then
		Say("Hi�n gi� b�n ti�m s�u t�m nh�ng v�t qu� gi� l�u truy�n trong giang h�, n�u b�ng h�u thu th�p ���c, s� c� nh�ng ph�n th��ng tr�ng h�u.",getn(selTab),selTab);
	else
		Talk(1,"","<color=red>[h� th�ng]:<color> tr�ng th�i b� sai s�t, h�y li�n h� v�i b� ph�n qu�n l�!");
		Write_Log("Ho�t ��ng t�t lao ��ng c� sai s�t","Ho�t ��ng sai s�t:"..nState);
	end;
end;

function askforaward()	--ѯ��Ҫ��Ҫ�ý�
	local nDate = tonumber(date("%d"));
	if Get_Task_Byte(GET_PRIZE,1) ~= nDate then
		SetTask(GET_PRIZE,0);
		SetTask(GET_PRIZE2,0);
	end;
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1);
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2);
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);
	
	local nPrizeType;
	local nItemNum = GetTask(ITEMNUM);
	if nItemNum < 7 then	
		Talk(1,"","S� l��ng v�n ch�a ��, h�y thu th�p ti�p r�i quay l�i l�nh th��ng.");
		return FALSE;
	elseif nItemNum >= 7 and nItemNum < 17 then
		nPrizeType = 1;
	elseif nItemNum >= 17 and nItemNum < 31 then
		nPrizeType = 2;
	elseif nItemNum >= 31 and nItemNum < 60 then
		nPrizeType = 3;
	elseif nItemNum >= 60 and nItemNum < 90 then
		nPrizeType = 4;
	elseif nItemNum >= 90 and nItemNum < 106 then
		nPrizeType = 5;
	elseif nItemNum >= 106 and nItemNum < 125 then
		nPrizeType = 6;
	elseif nItemNum >= 125 and nItemNum < 144 then
		nPrizeType = 7;
	elseif nItemNum >= 144 and nItemNum < 185 then
		nPrizeType = 8;
	elseif nItemNum >= 185 and nItemNum < 203 then
		nPrizeType = 9;
	elseif nItemNum == 203 then
		nPrizeType = 10;
	else
		Talk(1,"","[h� th�ng]: s� li�u b� sai, xin li�n h� v�i GM.");
		Write_Log("Ho�t ��ng t�t lao ��ng c� sai s�t","s� l��ng thu th�p sai:"..nItemNum);
	end;
	if nPrizeType == 10 and GetOnePrize >= 1 then
		nPrizeType = 9;
	end;
	if nPrizeType == 9 and GetTwoPrize >= 1 then
		nPrizeType = 8;
	end;
	if nPrizeType == 8 and GetThreePrize >= 3 then
		nPrizeType = 7;
	end;
	if nPrizeType <= 7 then
		if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= 3 then
			Talk(1,"","M�i ng�y ng��i ch�i ch� ��i 3 <color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng.");
			return FALSE;
		end;
	end;
	local selTab = {
			"Ta mu�n ��i ph�n th��ng n�y./#getaward("..nPrizeType..")",
			"Ta mu�n tra xem ph�n th��ng./#knowrule(2)",
			"Th�i, �� l�n sau./nothing",
			};
	Say("Hi�n gi� �� thu th�p <color=yellow>"..nItemNum.."<color> lo�i v�t ph�m, b�ng h�u c� th� ��i l�y <color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng: <color=yellow>"..PrizeTab[nPrizeType][1].."<color> sau khi ��i l�y ph�n th��ng, s� l��ng v�t ph�m �� n�p s� m�t h�t. B�ng h�u c� ��ng � ��i l�y ph�n th��ng n�y kh�ng?",getn(selTab),selTab);
end;

function getaward(nPrizeType)	--NPC����
	local nDate = tonumber(date("%d"));	--����п�����ǰһ���ѯ�ʶԻ��򣬵��ڽ�����콱�������������Щ����Ļ������п��ܵ�������ڽ���ֻ��һ�ξͲ�����������
	if Get_Task_Byte(GET_PRIZE,1) ~= nDate then
		SetTask(GET_PRIZE,0);
		SetTask(GET_PRIZE2,0);
	end;
	if nPrizeType <= 7 then
		if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= 3 then
			Talk(1,"","M�i ng�y ng��i ch�i ch� ��i 3 <color=yellow>"..tNumTab[nPrizeType].."<color> ph�n th��ng.");
			return FALSE;
		end;
	end;
	local nItemNum = GetTask(ITEMNUM);
	Write_Log("��i ph�n th��ng t�t lao ��ng","Ta mu�n s� d�ng"..nItemNum.." v�t thu th�p ��i ph�n th��ng");
	local nGetNum = Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]);
	Set_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2],nGetNum+1);	--��¼�����ȡ�����������1�ֽڼ�¼��ȡ���ڣ�2�ֽڼ�¼��ȡ����
	Set_Task_Byte(GET_PRIZE,1,nDate);
	Clear_HandIn_State();
	giveprize(nPrizeType);
end;

