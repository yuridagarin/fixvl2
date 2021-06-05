--file name:trigger.lua
--author:yanjun(yim)
--create date:2006-7-7
--describe:ʱ�䴥�����ű�
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnTimer()
	RemoveTrigger(GetTrigger(TRIGGER_ID));
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex ~= 0 then
		ask_question(1);
	end;
end;

function ask_question(nPageNum)
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex == 0 then
		Say("��i ph��ng �� x�a b� t� ��i, kh�ng th� nh�n ���c card!",0);
		return 0;
	end;
	local selTab = {};
	local nTeamIndexBase = (nPageNum-1)*4;
	selTab[1] = tTeamName[nTeamIndexBase+1].."/#select("..(nTeamIndexBase+1)..")";
	selTab[2] = tTeamName[nTeamIndexBase+2].."/#select("..(nTeamIndexBase+2)..")";
	selTab[3] = tTeamName[nTeamIndexBase+3].."/#select("..(nTeamIndexBase+3)..")";
	selTab[4] = tTeamName[nTeamIndexBase+4].."/#select("..(nTeamIndexBase+4)..")";
	selTab[5] = "Trang tr��c/#ask_question("..(nPageNum-1)..")";
	selTab[6] = "Trang sau/#ask_question("..(nPageNum+1)..")";
	if nPageNum == 1 then
		tremove(selTab,5);
	end;
	if nPageNum == 8 then
		tremove(selTab,6);
	end
	Say("��i b�ng b�n th�ch nh�t l�:",getn(selTab),selTab);
end;

function select(nTeamIndex)
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex == 0 then
		Say("��i ph��ng �� x�a b� t� ��i, kh�ng th� nh�n ���c card!",0);
		return 0;
	end;
	local selTab = {
				"��ng �/#confirm("..nTeamIndex..")",
				"Ch�n l�i/#ask_question(1)",
				}
	Say("B�n ch�n <color=yellow>"..tTeamName[nTeamIndex].."<color>. X�c ��nh ch�?",getn(selTab),selTab);
end;

function confirm(nTeamIndex)
	local nFellowIndex = GetInteractivePlayerIndex();
	local nOldPlayerIndex = PlayerIndex;
	local nLevel1,nLevel2 = 0,0;
	local nErrStr = "";
	local sName = "";
	local nDate = tonumber(date("%y%m%d"));
	if nFellowIndex == 0 then
		Say("��i ph��ng �� x�a b� t� ��i, kh�ng th� nh�n ���c card!",0);
		return 0;
	end;
	local nProbability = 0;
	SetTask(TASK_TEAMINDEX,nTeamIndex);
	nLevel1 = GetLevel();
	PlayerIndex = nFellowIndex;
	nLevel2 = GetLevel();
	if GetTask(TASK_TEAMINDEX) ~= 0 then
		if GetTask(TASK_TEAMINDEX) == nTeamIndex then	--����ѡ�������ͬ�Ķ���
			if nTeamIndex == 1 then
				nProbability = tItemCard[nTeamIndex][5]+1000;
			else
				nProbability = (tItemCard[nTeamIndex][5]-tItemCard[nTeamIndex-1][5])+1000;
			end;
		else
			if nTeamIndex == 1 then
				nProbability = tItemCard[nTeamIndex][5]+500;
			else
				nProbability = (tItemCard[nTeamIndex][5]-tItemCard[nTeamIndex-1][5])+500;
			end;
		end;
		if random(1,100) <= nLevel1 + nLevel2 then
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			give_random_card(nProbability,GetTask(TASK_TEAMINDEX));	--�����һ�ſ�\
			PlayerIndex = nOldPlayerIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			give_random_card(nProbability,GetTask(TASK_TEAMINDEX));
		else
			PlayerIndex = nOldPlayerIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			Say("Xin l�i! Do ��ng c�p c�a 2 ng��i c�ng l�i v�n ch�a ��t c�p 100 cho n�n kh�ng th� nh�n ���c th� 100%. Nh�n th� th�t b�i.",0);
			PlayerIndex = nFellowIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			Say("Xin l�i! Do ��ng c�p c�a 2 ng��i c�ng l�i v�n ch�a ��t c�p 100 cho n�n kh�ng th� nh�n ���c th� 100%. Nh�n th� th�t b�i.",0);
		end;
		PlayerIndex = nOldPlayerIndex;
	end;
end;

function give_random_card(nProbability,nTeamIndex)
	RemoveTrigger(GetTrigger(TRIGGER_ID));	--�����ˣ�ɾ�����
	local nRandomNum = random(1,10000);
	local nDate = tonumber(date("%y%m%d"));
	SetTask(TASK_TEAMINDEX,0);
	SetTask(TASK_GOTCARD_TIME,GetTime());
	SetTask(TASK_GOTCARD_DATE,nDate);
	if nRandomNum <= nProbability then
		AddItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
		Say("B�n nh�n ���c 1 t�m <color=yellow>"..tItemCard[nTeamIndex][1].."<color>. H�m nay b�n �� tham gia <color=yellow>"..GetTask(TASK_GOTCARD_COUNT).."<color> l�n ho�t ��ng c�p th� gi�i, b�n c� th� tham gia th�m <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> l�n.",0);
		WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."Nh�n ���c"..tItemCard[nTeamIndex][1]);
	else
		nRandomNum = random(1,10000);
		for i=1,getn(tItemCard) do
			if nRandomNum <= tItemCard[i][5] then
				if i == 34 and GetTask(TASK_GOTCHINA_CARD) ~= 0 then	--����ù��й���֮��
					nTeamIndex = random(1,33);
				else
					nTeamIndex = i;
				end;
				AddItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
				Say("B�n nh�n ���c 1 t�m <color=yellow>"..tItemCard[nTeamIndex][1].."<color>. H�m nay b�n �� tham gia <color=yellow>"..GetTask(TASK_GOTCARD_COUNT).."<color> l�n ho�t ��ng c�p th� gi�i, b�n c� th� tham gia th�m <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> l�n.",0);
				if nTeamIndex == 34 then	--������й���֮��
					SetTask(TASK_GOTCHINA_CARD,1);
				end;
				WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."Nh�n ���c"..tItemCard[nTeamIndex][1]);
				break;
			end;
		end;
	end;
end;