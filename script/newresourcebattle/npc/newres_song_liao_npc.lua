-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

Include("\\script\\online\\qixi06\\mission_head.lua");

function newres_general()
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Gia nh�p m�n ph�i m�i c� th� tham gia chi�n d�ch!")
		return 0
	end	
	if GetLevel() < 77 then
		Talk(1,"",szNpcName.."��ng c�p 77 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return 0
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"",szNpcName.."�i�m c�ng tr�ng ph�i ��t 15000 tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return 0
	end
	if abs(GetTask(704)) < 2 then
		Talk(1,"",szNpcName.."Qu�n h�m Hi�u �y tr� l�n m�i c� th� tham gia chi�n d�ch!")
		return 0
	end
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"",szNpcName.."D�ng th�c luy�n c�ng kh�ng th� tham gia chi�n d�ch!")
		return 0
	end
	if BT_GetCurCamp() ~= nCurCamp then
		Talk(1,"",szNpcName.."Ng��i kh�ng c�ng phe, kh�ng th� tham gia chi�n d�ch!")
		return 0
	end

	BT_ResetTask()
	local nState =gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) 
	local nDoneCount = gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE)
	local nPoint = GetTask(TSK_NEWRES_POINT)
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)
	local szState = "ch�a nh�n nhi�m v�"
	local szDoubleExp = "ch�a k�ch ho�t nh�n ��i kinh nghi�m"
	
	if nState == 1 then
		szState = "�ang nh�n nhi�m v�"
	elseif nState == 2 then
		szState = "�� ho�n th�nh nhi�m v�"
	end
	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end
	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
			local nTimeRemain = nDoubeExpTime + 3600 - GetTime()
			local nHour, nMin, nSec = BT_ShowTime(nTimeRemain)
			szDoubleExp = format("th�i gian nh�n ��i kinh nghi�m c�n %d ph�t %d gi�y",nMin,nSec)			
		end	
	end
	
	local szSay = format("T��ng s� phe ta kh�ng ph�n bi�t tu�i t�c, ch� c�n �o�n k�t ��nh �u�i ngo�i x�m l� ���c! <color=yellow>Ng��i hi�n t�i %s, s� �i�m t�ch l�y thu th�p: %d �i�m, s� l�n ho�n th�nh nhi�m v� trong ng�y h�m nay: %d l�n. Nguy�n So�i k�ch ho�t nh�n ��i: %s.<color>",szState,nPoint,nDoneCount,szDoubleExp)
	
	local tSay = {		
		"Nh�n nhi�m v� Thu Th�p T�i Nguy�n/get_newres_task",
		"Ho�n th�nh nhi�m v� Thu Th�p T�i Nguy�n/finish_newres_task",
		"Nh�n d��c ph�m chi�n tr��ng/get_medicine",
		"B�n So�i mu�n k�ch ho�t nh�n ��i kinh nghi�m/double_exp_kick_off",
		"Ta mu�n quay v� T��ng D��ng (t�n 10 b�c)/ask_reason",
		"Ta mu�n ti�n v�o khu v�c thu th�p (t�n 5 b�c)/go_gather",
		"Kh�ng c� g�/gf_DoNothing",	
	}
	Say(szNpcName..szSay,getn(tSay),tSay);
end

function get_info()
end

function get_newres_task()	
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
		Talk(1,"",szNpcName.."Ng��i �� nh�n 1 nhi�m v� r�i. H�y ho�n th�nh �i r�i nh�n nhi�m v� k� ti�p!")
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 2 then
		Talk(1,"",szNpcName.."Ng��i ch�a nh�n th��ng nhi�m v� l�n tr��c!")
		return
	end
	if  gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE)  == 0 then
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,1)	
		SetTask(TSK_NEWRES_POINT,0)
		TaskTip("B�n �� nh�n 1 nhi�m v� thu th�p t�i nguy�n. H�y �i thu th�p �� 2000 t�i nguy�n �� l�nh th��ng.")
		Talk(1,"",szNpcName.."Ng��i �� nh�n 1 nhi�m v� thu th�p! H�y c� g�ng ho�n th�nh!")
		WriteLogEx("TL TNChien","Nh�n nhi�m v�")
	end
end

function finish_newres_task()
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau �i thu th�p t�i nguy�n r�i h�y l�nh th��ng!")
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 3 then
		Talk(1,"",szNpcName.."M�i ng�y ch� c� th� l�nh th��ng 3 l�n!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"S� d�ng Qu�n C�ng Ch��ng (kinh nghi�m g�p 1,5 l�n, �i�m qu�n c�ng g�p 2 l�n)/#use_jungong(1)",
		"S� d�ng Qu�n C�ng ��i (kinh nghi�m g�p 2 l�n, �i�m qu�n c�ng g�p 5 l�n)/#use_jungong(2)",
		"S� d�ng Qu�n C�ng Huy Ho�ng (kinh nghi�m g�p 2,5 l�n, �i�m qu�n c�ng g�p 10 l�n)/#use_jungong(3)",
		"Kh�ng mu�n s� d�ng qu�n c�ng/no_jungong",
		"Ch�a mu�n nh�n th��ng/gd_DoNothing",	
	}
	local szSay = szNpcName.."Ph�n th��ng kinh nghi�m b�n nh�n ���c l� <color=yellow>"..nExpAward.." �i�m<color>, ph�n th��ng t�ch l�y l� <color=yellow>"..nJunGongAward.." �i�m<color> t�ch l�y. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng v� ph�n th��ng kinh nghi�m<color>.";
	Say(szSay,getn(tSay),tSay)
end

function use_jungong(nType)
	local szType = "Qu�n C�ng Ch��ng"
	if nType == 2 then 
		szType = "Qu�n C�ng ��i"
	elseif nType == 3 then
		szType = "Qu�n C�ng Huy Ho�ng"
	end
	Say(szNpcName.."Ng��i mu�n s� d�ng <color=yellow>"..szType.." nh�n ph�n th��ng. N�u ho�n th�nh nhi�m v� trong th�i gian Nguy�n So�i k�ch ho�t thu th�p t�i nguy�n s� ���c nh�n ��i kinh nghi�m.",2,format("��ng �/#confirm_use_jungong(%d)",nType),"Ta ch�a mu�n nh�n th��ng/gf_DoNothing")
end

function no_jungong()
	Say(szNpcName.."X�c nh�n kh�ng s� d�ng qu�n c�ng?",2,"S� d�ng qu�n c�ng/finish_newres_task","Ta kh�ng s� d�ng qu�n c�ng/#confirm_use_jungong(4)")
end

function confirm_use_jungong(nType)
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	local nCurRank = abs(GetTask(704))
	local nExpAward,nJunGongAward = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
			nDoubleExpFlag = 2
		end	
	end	
	if nType == 1 or nType == 2 or nType == 3 then
		if GetItemCount(tJungongItem[nType][2][1],tJungongItem[nType][2][2],tJungongItem[nType][2][3]) <= 0 then
			Talk(1,"",szNpcName.."Ng��i kh�ng mang theo huy hi�u chi�n c�ng tr�n ng��i!")
			return
		end
		DelItem(tJungongItem[nType][2][1],tJungongItem[nType][2][2],tJungongItem[nType][2][3],1)
	end
	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,0)	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) + 1)
	SetTask(TSK_NEWRES_POINT,0)
	
	nExpAward = floor(nExpAward * tJungongItem[nType][3]) * nDoubleExpFlag
	nJunGongAward = floor(nJunGongAward * tJungongItem[nType][4])
	
	local tb_jun_gong_num =
	{
		[1] = 2,
		[2] = 3,
		[3] = 24,
		[4] = 1,
	}
	
	if tonumber(date("%y%m%d")) >= 100709 and tonumber(date("%y%m%d")) <= 100808 then
		gf_AddItemEx2({2,1,30205,80}, "T�i kho�ng th�ch", "Hoat dong thang 7 nam 2010", "T�i Nguy�n Chi�n")
	elseif tonumber(date("%y%m%d")) >= 100813 and tonumber(date("%y%m%d")) <= 100912 then
		gf_AddItemEx2({ 2, 1, 30225, 80}, "Nguy�n Li�u L�m B�nh", "Hoat dong thang 8 nam 2010", "T�i Nguy�n Chi�n")
	elseif tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, tb_jun_gong_num[nType] * 50}, "nguy�n li�u event 201011", "Hoat dong thang 11 nam 2010", "T�i Nguy�n Chi�n")
	end
	
	local tRoseQuantity = 
	{
		[1] = 15,
		[2] = 60,
		[3] = 300,
	}
	if nType == 1 or nType == 2 or nType == 3 then
		if tonumber(date("%Y%m%d")) >= 20101001 and tonumber(date("%Y%m%d")) <= 20101025 then
           	gf_AddItemEx2({2, 0, 1162, tRoseQuantity[nType]}, "Hoa H�ng ��", "Bang Hoi Tinh Anh 4", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
           end
	end
	
	local nMaterial1009 = 0
	if nType == 1 then
		nMaterial1009 = 100
	elseif nType == 2 then
		nMaterial1009 = 150
	elseif nType == 3 then
		nMaterial1009 = 1200
	else
		nMaterial1009 = 50
	end
	if tonumber(date("%y%m%d")) >= 100929 and tonumber(date("%y%m%d")) <= 101024 then
		gf_AddItemEx2({ 2, 1, 30233, nMaterial1009}, "B�t M�", "Hoat dong thang 9 nam 2010", "T�i Nguy�n Chi�n")
	end
	
	ModifyExp(nExpAward)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nJunGongAward)
	else
		SetTask(701,GetTask(701) - nJunGongAward)
	end
	Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m")
	Msg2Player("B�n nh�n ���c "..nJunGongAward.." �i�m c�ng tr�ng")
	WriteLogEx("TL TNChien","Nh�n th��ng "..tJungongItem[nType][1])
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)
			TaskTip("B�n �� ho�n th�nh nhi�m v� 2 l�n. Mau tr� v� b�m b�o v�i Minh Ch� Kim S�n.")		
		end
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
		WriteLogEx("TL TNChien","Ho�n th�nh nhi�m v� 3 l�n")
	end	
end

function get_medicine()
	local nCount = 10;
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAP_ID then
		if gf_Judge_Room_Weight(3,300) == 1 then			
			AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[9][1]);	
			AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[10][1]);	
			AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[11][1]);	
		else
			Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		end
	end
end

function double_exp_kick_off()
	local nTime = tonumber(date("%H%M"))	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)	
	local nCamp = BT_GetCurCamp()
	local nCurRank = abs(GetTask(704))
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end
	if nCurRank ~= 6 then
		Talk(1,"",szNpcName.."Ti�u t�t nh� ng��i m� c�ng ��i ban l�nh cho ta �? Ng��i ��u! B�t h�n!")
		return 0
	end
	if (nTime < 830 or nTime > 1200) and (nTime < 1530 or nTime > 1830) and (nTime < 2030 or nTime > 2130) then
		Talk(1,"",szNpcName.."Th�i gian n�y kh�ng th� k�ch ho�t. Ch� c� th� k�ch ho�t nh�n ��i trong kho�ng 8:30 - 12:00, 15:30 - 18:30, 20:30 - 21:30.")
		return 0
	end
	if IsTitleExist(30, 6) <= 0 and IsTitleExist(30, 12) <= 0 then
		Talk(1,"",szNpcName.."Ph�i c� danh hi�u Nguy�n So�i m�i c� th� ph�t l�nh t�n c�ng! M�i Nguy�n So�i ki�m tra l�i.")
		return 0
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) >= 3 then
		Talk(1,"",szNpcName.."M�i ng�y ch� ���c k�ch ho�t nh�n ��i kinh nghi�m 3 l�n. M�i Nguy�n So�i quay l�i sau!")
		return
	end	
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < 3600 then
			Talk(1,"",szNpcName.."Hi�n t�i �� k�ch ho�t nh�n ��i kinh nghi�m. M�i Nguy�n So�i quay l�i sau!")
			return
		end
	end
	if nCurCamp == 1 then
		SetGlbValue(GLB_TASK_NEWRES_SONG,GetTime())
	else
		SetGlbValue(GLB_TASK_NEWRES_LIAO,GetTime())
	end	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) + 1)
	AddGlobalNews(format("<color=yellow>%s Nguy�n So�i<color><color=green> %s<color> ban l�nh t�ng t�n c�ng <color=red>%s<color>. T��ng s� tham gia chi�n tr��ng c�ng phe s� ���c nh�n ��i kinh nghi�m!",tCamp[nCamp],GetName(),"Thi�n M�n Tr�n-T�i nguy�n chi�n"))
	Msg2Global(format("%s Nguy�n So�i %s ban l�nh t�ng t�n c�ng %s. T��ng s� tham gia chi�n tr��ng c�ng phe s� ���c nh�n ��i kinh nghi�m!",tCamp[nCamp],GetName(),"Thi�n M�n Tr�n-T�i nguy�n chi�n"))
end

function ask_reason()	
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;	

function leave(sLeaveMsg)
	if GetCash() < 1000 then
		Talk(1,"",szNpcName.."C�n 10 b�c �� v� T��ng D��ng.")
		return
	end
	if Pay(1000) == 1 then
		DelMSPlayer(MISSION_ID,0);
		Msg2MSAll(MISSION_ID,GetName().." R�i kh�i �� l�i tin nh�n:"..sLeaveMsg);
	end
end;

function go_gather()
	if GetCash() < 500 then
		Talk(1,"",szNpcName.."Ti�n v�o khu v�c thu th�p c�n 5 b�c.")
		return
	end
	local tSay ={
		"B�c l� Thi�n M�n/#go_to_pos(1)",
		"��ng l� Thi�n M�n/#go_to_pos(2)",
		"Nam l� Thi�n M�n/#go_to_pos(3)",
		"T�y l� Thi�n M�n/#go_to_pos(3)",
		"Khu v�c Nam Thi�n M�n/#go_to_pos(5)",
		"Tr� l�i trang ��u/newres_general",
		"Ta ch� gh� qua/gf_DoNothing",	
	}
	Say(szNpcName.."Ng��i mu�n �i ��u?",getn(tSay),tSay)
end

function go_to_pos(nPos)
	if Pay(500) == 1 then		
		SetPos(RES_POINT[nPos][1],RES_POINT[nPos][2])
		CastState("state_dispear",0,5*18);	
	end
end