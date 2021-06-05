Include("\\script\\missions\\tong_mission\\main_function.lua");

g_tbLuckInfo = 
{
	[0] = {0,"V� Tri"}, 
	[1] = {-4,"��i hung"},
	[2] = {-3,"Trung hung"},
	[3] = {-2,"Ti�u hung"},
	[4] = {0,"Trung"},
	[5] = {1,"Ti�u c�t"},
	[6] = {2,"Trung c�t"},
	[7] = {3,"��i c�t"},
}

g_nBaseValue = 8;	--����ֵ

function main()
	local nNpcIdx = GetTargetNpc();
	local nCasketHashCode = GetUnitCurStates(nNpcIdx,4);
	local nStage = GetUnitCurStates(nNpcIdx,3);
	local nPlayerHashCode = GetTask(TSK_CASKET_HASH_CODE);
	local nDay = tonumber(date("%y%m%d"));
	if GetTask(617) < nDay then
		SetTask(617,nDay); 
		SetTask(618,0);	--��СѾ����ֵ
	end;
	local nLuck = GetTask(618);
	if nPlayerHashCode ~= 0 and nPlayerHashCode == nCasketHashCode then
		local selTab = {
					"H�p nh� s� 1/#open_casket(1,"..nStage..")",
					"H�p nh� s� 2/#open_casket(2,"..nStage..")",
					"H�p nh� s� 3/#open_casket(3,"..nStage..")",
					"H�p nh� s� 4/#open_casket(4,"..nStage..")",
					"H�p nh� s� 5/#open_casket(5,"..nStage..")",
					}
		Say("Xin ch�n m� h�p nh�, ch� s� �n trong �� t��ng tr�ng cho s� l��ng Hi�p kh�ch ch��ng nh�n ���c, ch�c may m�n!",getn(selTab),selTab);
	else
		Msg2Player("B�n kh�ng th� m� H�p may m�n n�y");
		return 0;
	end;
end;

function open_casket(nCasketID,nStage)
	if gf_JudgeRoomWeight(2,20,"") ~= 1 then
		return 0;
	end;
	nStage = gf_MinMax(nStage,1,6);	--ȷ��nStage��ֵ��ȷ
	local nLuck = GetTask(618);
	local nLuckAdj = 0;
	if not g_tbLuckInfo[nLuck] then	--���û��������nLuckΪ�Ƿ�ֵ
		nLuckAdj = 0;
	else
		nLuckAdj = g_tbLuckInfo[nLuck][1];
	end;
	local nX = 1;	--˥��ϵ��
	local nOpenTimes = GetTask(TSK_CASKET_STAGE_1+nStage-1)+1;
	if nOpenTimes == 2 then
		nX = 4/5;
	elseif nOpenTimes == 3 then
		nX = 3/5;
	elseif nOpenTimes >= 4 and nOpenTimes <= 7 then
		nX = 1/10;
	elseif nOpenTimes >= 8 then
		nX = 0;
	end;
	--��ֵ=ceil((����ֵ+��������ֵ)*˥��ϵ��)
	local nMidValue = (g_nBaseValue+nLuckAdj)*nX;
	local nLowValue = ceil(nMidValue*0.8);	--��ֵ
	local nHighValue = ceil(nMidValue*1.2);	--��ֵ
	local tbNum = get_num_table(nLowValue,nHighValue,5);	--ȡ5������
	local nGotNum = tbNum[nCasketID];
	local nTotalNum = BigGetItemCount(2,0,1091);
	if nTotalNum + nGotNum > MAX_XIEKEHUIZHANG then
		TaskTip("S� l��ng Hi�p kh�ch ch��ng �� ��t t�i �a "..MAX_XIEKEHUIZHANG.." , h�y mau d�ng Hi�p kh�ch ch��ng ��i ph�n th��ng");
		Msg2Player("S� l��ng Hi�p kh�ch ch��ng �� ��t t�i �a "..MAX_XIEKEHUIZHANG.." , h�y mau d�ng Hi�p kh�ch ch��ng ��i ph�n th��ng");
		nGotNum = MAX_XIEKEHUIZHANG - nTotalNum;
	end;
	Msg2Player("Trong tu�n n�y ��i hi�p ��y l� l�n th� "..nOpenTimes.." m� h�p may m�n � �i  "..nStage.." , ���c "..nGotNum.." Hi�p kh�ch ch��ng");
	SetTask(TSK_CASKET_HASH_CODE,0);
	SetTask(TSK_CASKET_STAGE_1+nStage-1,nOpenTimes);
	if nGotNum > 0 then
		AddItem(2,0,1091,nGotNum);
	end;
	Say("B�n �� ch�n H�p nh� s� <color=yellow>"..nCasketID.."<color>, nh�n ���c <color=yellow>"..nGotNum.."<color> Hi�p kh�ch ch��ng.\nH�p nh� s� 1: "..tbNum[1].." c�i\nH�p nh� s� 2: "..tbNum[2].." c�i\nH�p nh� s� 3: "..tbNum[3].." c�i\nH�p nh� s� 4: "..tbNum[4].." c�i\nH�p nh� s� 5: "..tbNum[5].."c�i",0);
	gf_WriteLog("T� Quang C�c","Tu�n n�y � �i s� "..nOpenTimes.." m� h�p may m�n � �i  "..nStage.." m� H�p may m�n, ���c "..nGotNum.." Hi�p kh�ch ch��ng");
end;

function get_num_table(nLowValue,nHighValue,nNum)
	local tbInit = {};
	local tbRetTable = {};
	for i=nLowValue,nHighValue do
		tinsert(tbInit,i);
	end;
	local nRandIdx = 0;
	for i=1,nNum do
		if getn(tbInit) ~= 0 then
			nRandIdx = random(1,getn(tbInit));
			tinsert(tbRetTable,tbInit[nRandIdx]);
			tremove(tbInit,nRandIdx);
		else
			tinsert(tbRetTable,random(nLowValue,nHighValue));
		end;
	end;
	return tbRetTable;
end;