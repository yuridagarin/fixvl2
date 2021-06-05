-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n
DOUBLE_EXP_TIME = 7200

Include("\\script\\online\\qixi06\\mission_head.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua");

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
--	if BT_GetCurCamp() ~= nCurCamp then
--		Talk(1,"",szNpcName.."Ng��i kh�ng c�ng phe, kh�ng th� tham gia chi�n d�ch!")
--		return 0
--	end

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
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			local nTimeRemain = nDoubeExpTime + DOUBLE_EXP_TIME - GetTime()
			local nHour, nMin, nSec = BT_ShowTime(nTimeRemain)
			szDoubleExp = format("th�i gian nh�n ��i kinh nghi�m c�n %d gi� %d ph�t %d gi�y",nHour,nMin,nSec)			
		end	
	end
	
	local szSay = format("T��ng s� phe ta kh�ng ph�n bi�t tu�i t�c, ch� c�n �o�n k�t ��nh �u�i ngo�i x�m l� ���c! <color=yellow>Ng��i hi�n t�i %s, s� �i�m t�ch l�y thu th�p: %d �i�m, s� l�n ho�n th�nh nhi�m v� trong ng�y h�m nay: %d l�n. Nguy�n So�i k�ch ho�t nh�n ��i: %s.<color>",szState,nPoint,nDoneCount,szDoubleExp)
	
	local tSay = {		
--		"H� tr� t�c �� ��o t�i nguy�n/support_daotainguyen",
--		"N�ng cao t�c �� (x2) thu th�p t�i nguy�n (ti�u hao 29 xu v�t ph�m)/#collect_res(1)",
--		"N�ng cao t�c �� (x3) thu th�p t�i nguy�n (ti�u hao 59 xu v�t ph�m)/#collect_res(2)",
		"Nh�n nhi�m v� Thu Th�p T�i Nguy�n/get_newres_task",
		"Ho�n th�nh nhi�m v� Thu Th�p T�i Nguy�n h�ng ng�y/finish_newres_task",
--		"Ho�n th�nh th�m 1 nhi�m v� Thu Th�p T�i Nguy�n/finish_newres_task_more",
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
	local nPhongHam = abs(GetTask(704))	
	if nPhongHam == 6 then
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP) < 1 then
			Talk(1,"",szNpcName.."Nguy�n So�i ph�i k�ch ho�t x2 �t nh�t 1 l�n trong ng�y th� m�i nh�n nhi�m v� ���c!")
			return
		end	
	end
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
		--SetTask(TSK_NEWRES_POINT,0)
		local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
		SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
		TaskTip("B�n �� nh�n 1 nhi�m v� thu th�p t�i nguy�n. H�y �i thu th�p �� 2500 t�i nguy�n �� l�nh th��ng.")
		Talk(1,"",szNpcName.."Ng��i �� nh�n 1 nhi�m v� thu th�p! H�y c� g�ng ho�n th�nh!")
		WriteLogEx("TL TNChien","Nh�n nhi�m v�")
		gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nh�n nhi�m v�", 1, "Nh�n nhi�m v�")
	end
end

function finish_newres_task()
	CalcBattleRank()
	UpdateBattleMaxRank()
	if gf_Judge_Room_Weight(3, 300, "") ~= 1 then
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau �i thu th�p t�i nguy�n r�i h�y l�nh th��ng!")
		return
	end
	local nQuest = 3
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nPetLevel >= 1 then
		nQuest = 4
	end
--	if nIsPS >= 1 then
--		nQuest = 5
--	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= nQuest then
		Talk(1,"",szNpcName.."M�i ng�y ch� c� th� l�nh th��ng "..nQuest.." l�n!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"S� d�ng Qu�n C�ng Ch��ng/#use_jungong(1)",
		"S� d�ng Qu�n C�ng ��i/#use_jungong(2)",
		"S� d�ng Qu�n C�ng Huy Ho�ng/#use_jungong(3)",
		"S� d�ng Qu�n C�ng Vinh D�/use_VIP_tainguyenchien",
		"Kh�ng mu�n s� d�ng qu�n c�ng/#confirm_use_jungong(4)",
		"Ch�a mu�n nh�n th��ng/gd_DoNothing",	
	}
	--local szSay = szNpcName.."Ph�n th��ng kinh nghi�m b�n nh�n ���c l� <color=yellow>"..nExpAward.." �i�m<color>, ph�n th��ng t�ch l�y l� <color=yellow>"..nJunGongAward.." �i�m<color> t�ch l�y. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng v� ph�n th��ng kinh nghi�m<color>.";
	local szSay = szNpcName.."Tham gia T�i Nguy�n Chi�n c� th� nh�n ���c r�t nhi�u �i�m kinh nghi�m v� �i�m qu�n c�ng"
	Say(szSay,getn(tSay),tSay)
end
function finish_newres_task_more()
	CalcBattleRank()
	UpdateBattleMaxRank()
	if gf_Judge_Room_Weight(3, 300, "") ~= 1 then
		return
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) ~= 2 then
		Talk(1,"",szNpcName.."Mau �i thu th�p t�i nguy�n r�i h�y l�nh th��ng!")
		return
	end
	if GetCash() < 2030000 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng mang theo �� v�ng �� l�nh th��ng!")
		return
	end
	local nQuest = 4
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	
	if nPetLevel >= 1 then
		nQuest = 5
	end
--	if nIsPS >= 1 then
--		nQuest = 6
--	end
	if nPetLevel < 1 then
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 3 then
			Talk(1,"",szNpcName.."��i hi�p ch�a nh�n th��ng h�t 3 l�n h�ng ng�y !!!!")
			return
		end
	else	
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 4 then
			Talk(1,"",szNpcName.."��i hi�p ch�a nh�n th��ng h�t 4 l�n h�ng ng�y !!!!")
			return
		end
--		if nIsPS >= 1 then
--			if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) < 5 then
--				Talk(1,"",szNpcName.."��i hi�p ch�a nh�n th��ng h�t 4 l�n h�ng ng�y !!!!")
--				return
--			end
--		end
	end
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= nQuest then
		Talk(1,"",szNpcName.."M�i ng�y ch� c� th� l�nh th��ng "..nQuest.." l�n!")
		return
	end
	local nExpAward,nJunGongAward = 0,0
	local nCurRank = abs(GetTask(704))	
	nExpAward,nJunGongAward  = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	local tSay = {
		"S� d�ng Qu�n C�ng Ch��ng/#use_jungong(1)",
		"S� d�ng Qu�n C�ng ��i/#use_jungong(2)",
		"S� d�ng Qu�n C�ng Huy Ho�ng/#use_jungong(3)",
		"S� d�ng Qu�n C�ng Vinh D�/use_VIP_tainguyenchien",
		"Kh�ng mu�n s� d�ng qu�n c�ng/#confirm_use_jungong(4)",
		"Ch�a mu�n nh�n th��ng/gd_DoNothing",	
	}
	--local szSay = szNpcName.."Ph�n th��ng kinh nghi�m b�n nh�n ���c l� <color=yellow>"..nExpAward.." �i�m<color>, ph�n th��ng t�ch l�y l� <color=yellow>"..nJunGongAward.." �i�m<color> t�ch l�y. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng v� ph�n th��ng kinh nghi�m<color>.";
	local szSay = szNpcName.."Tham gia T�i Nguy�n Chi�n c� th� nh�n ���c r�t nhi�u �i�m kinh nghi�m v� �i�m qu�n c�ng"
	Say(szSay,getn(tSay),tSay)
end
function use_VIP_tainguyenchien()
	if gf_Judge_Room_Weight(4,50," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng �� �� nh�n th�m nguy�n li�u event, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30642) < 1 then
		Talk(1,"","C�c h� ch�n nh�n th��ng d�ng VIP m� kh�ng c� qu�n c�ng ch��ng Vinh D�");
		return 0;
	end
	if DelItem(2,1,30642,1) ~= 1 then
		return 0
	end
------------- Tr� v�ng cho l�n nh�n th��ng th�m
--	local nQuest = 4
--	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nPetLevel >= 2 then
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 4 then
--			Pay(2030000)
--		end
--	else
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
--			Pay(2030000)
--		end
--	end
-------------	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
			nDoubleExpFlag = 2
		end	
	end	
	local nPhongHam = abs(GetTask(704))	
	local tAward_VIP = {
		[2] = {18000000,5600},
		[3] = {30000000,5600},
		[4] = {36000000,5600},
		[5] = {45000000,5600},
		[6] = {60000000,5600},
	}	
	local nExpVIPTNC = tAward_VIP[nPhongHam][1]* nDoubleExpFlag
	ModifyExp(nExpVIPTNC)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + tAward_VIP[nPhongHam][2])
	else
		SetTask(701,GetTask(701) - tAward_VIP[nPhongHam][2])
	end
	Msg2Player("B�n nh�n ���c "..tAward_VIP[nPhongHam][1]*nDoubleExpFlag.." �i�m kinh nghi�m")
	Msg2Player("B�n nh�n ���c "..tAward_VIP[nPhongHam][2].." �i�m c�ng tr�ng")
	gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng lo�i VIP")
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013 then	
		gf_AddItemEx2({2,1,30567 ,500}, "Nguy�n li�u Event VIP TNC", "Hoat dong thang 08 nam 2013", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n VIP")
		Msg2Player("B�n nh�n ���c 500 Nguy�n Li�u Event")
	end
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,0)	
	gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) + 1)
	--SetTask(TSK_NEWRES_POINT,0)	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
	TaiNguyenChien_NhanThuong(5)
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
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);	
	if nNpcName == "Tri�u T� Quy�n" then
		if GetTask(704) < 0 then
			Talk(1, "", "Ng��i kh�ng ph�i phe T�ng n�n kh�ng th� tr� nhi�m v� ���c")
			return 0
		end
	end
	if nNpcName == "Ti�u Vi�n Tu�n" then
		if GetTask(704) > 0 then
			Talk(1, "", "Ng��i kh�ng ph�i phe Li�u n�n kh�ng th� tr� nhi�m v� ���c")
			return 0
		end
	end
	
	local nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_SONG)		
	local nDoubleExpFlag = 1	
	local nCurRank = abs(GetTask(704))
	local nExpAward,nJunGongAward = tAwardRank[nCurRank][1], tAwardRank[nCurRank][2]
	----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u s� th� 6 v� 7 ��u b�n ph�i
	local nCSD_TNC = floor(GetTask(TSK_CSD_COUNT_A) / 100000)
	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),100000)
	if mod(nCSD_TNC, 100) < 81 and GetTask(TSK_CSD) == 1 then
		nCSD_TNC = (nCSD_TNC + 1) * 100000 + nNumBK
		SetTask(TSK_CSD_COUNT_A, nCSD_TNC)
	end
	---------------------------------
	if nCurCamp == 2 then
		nDoubeExpTime = GetGlbValue(GLB_TASK_NEWRES_LIAO)
	end		
	if nDoubeExpTime > 0 then
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
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
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	SetTask(TSK_NEWRES_POINT,nTypeDouble * 10000)
	------------- Tr� v�ng cho l�n nh�n th��ng th�m
--	local nQuest = 4
--	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nPetLevel >= 2 then
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 5 then
--			Pay(2030000)
--		end
--	else
--		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 4 then
--			Pay(2030000)
--		end
--	end
	-------------		
	nExpAward = floor(nExpAward * tJungongItem[nType][3]) * nDoubleExpFlag
	nJunGongAward = floor(nJunGongAward * tJungongItem[nType][4])
	
	AddMonthlyEventResourceAward(nType)
	
	local tRoseQuantity = 
	{
		[1] = 15,
		[2] = 60,
		[3] = 300,
	}
	-- Bang H�i Tinh Anh 6 Cu�c Chi�n Hoa H�ng
	if nType == 1 or nType == 2 or nType == 3 then
		if tonumber(date("%Y%m%d")) >= 20110930 and tonumber(date("%Y%m%d")) <= 20111023 then
           	gf_AddItemEx2({2, 0, 1164, tRoseQuantity[nType]}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n")
           end
	end
	VietSongLiao(nType)
	AwardZhenQi_ResourceProtect(1)
	--get_award_woodenbox()
	--gf_AddItemEx2({2,1,30340,tJungongItem[nType][5]},"M�c R��ng lo�i "..tJungongItem[nType][1],"Th�n T�i B�o R��ng","T�i nguy�n chi�n",0,1)
	--Msg2Player("B�n nh�n ���c "..tJungongItem[nType][5].." M�c R��ng")
	ModifyExp(nExpAward)	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nJunGongAward)
	else
		SetTask(701,GetTask(701) - nJunGongAward)
	end
	Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m")
	Msg2Player("B�n nh�n ���c "..nJunGongAward.." �i�m c�ng tr�ng")
	--- �i�m V�n May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExpAward
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--	else
--		Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--	end
	---------	
	gf_WriteLogEx("TAI NGUYEN CHIEN NEW LOG", "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng lo�i "..tJungongItem[nType][1])
	WriteLogEx("TL TNChien","Nh�n th��ng "..tJungongItem[nType][1])
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)
			TaskTip("B�n �� ho�n th�nh nhi�m v� 2 l�n. Mau tr� v� b�m b�o v�i Minh Ch� Kim S�n.")		
		end
	end
	
	-- Nhi�m v� Chuy�n Sinh 3
	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) < 48 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) == 48 then
			TaskTip("Ho�n th�nh y�u c�u c�a ��o Ch� ��o Hoa ��o 48 l�n thu th�p th�nh c�ng T�i Nguy�n Chi�n")
		end
	end
	
	-- Nhi�m v� Chuy�n Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) < 8 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK1, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) == 8 then
			TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh 80 l�n thu th�p th�nh c�ng T�i Nguy�n Chi�n")
		end
	end
	-----------------------Chu�i nhi�m v� Chuy�n Sinh 6
		local nCS6_TNN =  GetTask(TSK_CS6_COUNTC)
		--local nCS6_BNN_Num = mod(GetTask(TSK_CS6_COUNTC),10000)
		if mod(nCS6_TNN,100) < 20 and GetTask(TSK_CS6_TULINH) == 3 then
			nCS6_TNN = nCS6_TNN + 1
			SetTask(TSK_CS6_COUNTC, nCS6_TNN)
		end
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 1 or DongHanh_GetMission() == 2) then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	-----------------------------------	
	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE) == 3 then
		WriteLogEx("TL TNChien","Ho�n th�nh nhi�m v� 3 l�n")
	end
	TaiNguyenChien_NhanThuong(nType)
end

function get_medicine()
	local nCount = 6;
	local nCurMapID = GetWorldPos();
	if GetTask(TSK_GET_THUOC_TIME) ~= zgc_pub_day_turn() then
		SetTask(TSK_GET_THUOC_TIME,zgc_pub_day_turn())
		SetTask(TSK_GET_THUOC,0)
	end
	if mod(GetTask(TSK_GET_THUOC),10) >= 1 then
		Talk(1,"","��i hi�p �� nh�n thu�c cho l�n tham gia T�i Nguy�n Chi�n n�y r�i.")
		return
	end
	
	if nCurMapID == MAP_ID then
		if gf_Judge_Room_Weight(3,300) == 1 then			
			AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[9][1]);	
			AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[10][1]);	
			AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[11][1]);	
			SetTask(TSK_GET_THUOC,GetTask(TSK_GET_THUOC)+1)			
		else
			Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		end
	end
end

function double_exp_kick_off()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation == 66 and nDate <= 110709 then
		Talk(1,"",szNpcName.."Hi�n t�i ch�c n�ng n�y �ang ��ng, kh�ng th� k�ch ho�t!")
		return 0
	end
	if nCurCamp == 1 and GetTask(704) == -6 then
		Talk(1,"",szNpcName.."Nguy�n So�i kh�c phe kh�ng th� k�ch ho�t ���c!")	
		return
	end
	if nCurCamp == 2 and GetTask(704) == 6 then
		Talk(1,"",szNpcName.."Nguy�n So�i kh�c phe kh�ng th� k�ch ho�t ���c!")	
		return
	end
	
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
		if GetTime() - nDoubeExpTime < DOUBLE_EXP_TIME then
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
		"Khu v�c B�c Thi�n M�n/#go_to_pos(1)",
		--"��ng l� Thi�n M�n/#go_to_pos(2)",
		--"Nam l� Thi�n M�n/#go_to_pos(3)",
		--"T�y l� Thi�n M�n/#go_to_pos(3)",
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

function AddMonthlyEventResourceAward(nType)
	local nDate = tonumber(date("%y%m%d"))
	local tb_jun_gong_num =
	{
		[1] = 3,
		[2] = 5,
		[3] = 7,
		[4] = 2,
	}
	
	if nDate >= 110225 and nDate <= 110327 then
		gf_AddItemEx2({2, 1, 30287, tb_jun_gong_num[nType] * 10}, "Nguy�n li�u ", "Hoat dong thang 3 nam 2011", "T�i Nguy�n Chi�n")
	end
end

function support_daotainguyen()
	local tbSayDialog = {};
	local szSayHead = "Th�c hi�n h� tr� ��o t�i nguy�n s� nhanh ch�ng ho�n th�nh nhi�m v�"
	
	tinsert(tbSayDialog,"Xem th�i gian h� tr� c�n l�i/showTimeRemain")
	tinsert(tbSayDialog,"N�ng cao t�c �� (x2) thu th�p t�i nguy�n (ti�u hao 29 xu v�t ph�m)/#collect_res(1)")
	tinsert(tbSayDialog,"N�ng cao t�c �� (x3) thu th�p t�i nguy�n (ti�u hao 59 xu v�t ph�m)/#collect_res(2)")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/gf_DoNothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);		
end
function showTimeRemain()
	local nTypeCheck = floor(GetTask(TSK_NEWRES_POINT)/10000)
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC)
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain <= 0 then
		Talk(1,"","B�n ch�a th�c hi�n k�ch ho�t h� tr� ��o t�i nguy�n")
	else
		Talk(1,"","Th�i gian h� tr� c�n l�i l�: "..nRemain.." ph�t")
	end
	
end
function collect_res(nType)
	local tbCheck = {
			[1] = {29, 2},
			[2] = {59, 3},
		}
--	local nTypeCheck = floor(GetTask(TSK_NEWRES_POINT)/10000)
	local tbSayDialog = {};
	local szSayHead = "B�n ch�n h�nh th�c k�ch ho�t h� tr� x"..tbCheck[nType][2].." t�c �� ��o t�i nguy�n ti�u hao: "..tbCheck[nType][1].." Xu v�t ph�m"
--	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT)
--	local nRemain = GetTime - nTimeBegin

	tinsert(tbSayDialog,"��ng � k�ch ho�t/#confirm_collect_res("..nType..")"	)
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/gf_DoNothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_collect_res(nType)
	local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)
	local tbCheck = {
			[1] = {29, 2},
			[2] = {59, 3},
		}
	if GetItemCount(2,1,30230) < tbCheck[nType][1] then
		Talk(1,"","B�n kh�ng mang �� Xu v�t ph�m. Vui l�ng ki�m tra l�i.")
		return
	end
	if DelItem(2,1,30230,tbCheck[nType][1]) == 1 then
		Talk(1,"","B�n �� k�ch ho�t th�nh c�ng h� tr� x"..tbCheck[nType][2].." t�c �� ��o nhanh t�i nguy�n")
		SetTask(2285, GetTime())	
		SetTask(TSK_NEWRES_POINT, tbCheck[nType][2]*10000 + nPoint)
		WriteLogEx("LOG XU VAT PHAM","H� tr� ��o t�i nguy�n lo�i "..tbCheck[nType][1].." xu")
	end
end