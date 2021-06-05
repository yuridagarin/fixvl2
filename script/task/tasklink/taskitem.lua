--�ճ�����ͷ�ļ�
Include("\\script\\task\\richangrenwu\\head.lua");
tTaskItemName = 
{
	{"B�c L�c L�m l�nh",2,0,399},
	{"Tr�c �nh Th��ng",2,0,400},
	{"Tuy�t T�nh Th�ch",2,0,401},
	{"L�nh b�i t�ng qu�n ngo�i vi�n",2,0,402},
	{"L�nh b�i t�ng qu�n n�i vi�n",2,0,403},
	{"Vi�t N� ki�m",2,0,404},
	{"Trang ch� kim �n",2,0,405},
	{"Tr��ng L�o Ch� Ho�n",2,0,406},
}

function main()
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if npcIndex == 0 then
		return 0;
	end;
     --�Ƿ�����Ŷ��ճ�����
	local nDate = tonumber(date("%y%m%d"));
    	if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        	SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        	SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    	end
     local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
	local nTaskValue = GetTask(345);
--	if nTaskValue == 0 and  nTeamTask == 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 0 then
--		return 0;
--	end;
	if nTaskValue > 0 then		
		if tTaskItemName[nTaskValue][1] ~= npcName  then
			Talk(1,"","V�t ph�m n�y kh�ng ��ng!");
			return 0;
		end;
	elseif nTeamTask > 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) > 0 then
		if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= npcName then
			Talk(1,"","V�t ph�m n�y kh�ng ��ng!");
			return 0;			
		end
		nTaskValue = nTeamTask
--	Nhi�m v� chuy�n sinh theo TaskTrans
	elseif GetTask(1537) == 11 or GetTask(1537) == 17 or GetTask(1537) == 29 then
		if npcName == "B�c L�c L�m l�nh" then
			nTaskValue = 1
		elseif npcName == "Tr�c �nh Th��ng" then
			nTaskValue = 2
		elseif npcName == "Tuy�t T�nh Th�ch" then
			nTaskValue = 3
		else
			return 0;
		end
	else
		return 0;
	end		
		
	local selTab = {
			"L�p t�c nh�t l�n!/#pickup("..npcIndex..","..nTaskValue..")",
			"�� ta suy ngh�!/nothing",
			}
	Say("��y l� th� s� ph� mu�n ta �em v� sao??",getn(selTab),selTab);
end;

function pickup(npcIndex,ItemNum)	
	local npcName = GetNpcName(npcIndex) or ""	
	if npcName == nil or  npcName == "" then
		Talk(1,"","V�t ph�m �� b� ng��i kh�c nh�t m�t r�i!");
		return 0;
	end
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local nRetCode = AddItem(tTaskItemName[ItemNum][2],tTaskItemName[ItemNum][3],tTaskItemName[ItemNum][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c "..tTaskItemName[ItemNum][1])
	end;
	if DAILY_TASK_0912_SWITCH == 1 then
            is_he_finish_the_team_task(npcName);
     end
	WriteLog("[Nhi�m v� l�p l�i s� m�n]:"..GetName().."nh�n ���c"..tTaskItemName[ItemNum][1]..". AddItem tr� quay l�i l�:"..nRetCode);
end;

function nothing()

end;