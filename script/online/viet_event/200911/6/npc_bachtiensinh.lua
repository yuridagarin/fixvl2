-- Event B�ch Ti�n Sinh VNG
-- Created by TuanNA5
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\online_activites\\2010_01\\activites_02\\head.lua");
Include("\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");
Include("\\script\\online_activites\\2011_11\\activity_01\\yuandan_interface.lua");
Include("\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua");
Include("\\script\\online_activites\\2011_12\\lilishishi\\send_gift.lua");
Include("\\script\\function\\correct_player_greate_skill.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2.lua")

function main()
	local tSay = {	}	
	local nDate = tonumber(date("%y%m%d"));		
	if gf_CheckEventDateEx(VET_201001_02_EVENT_NUMBER) == 1 then
		tinsert(tSay,"Ho�t ��ng t�ng B�nh Ch�ng/give_zongzi_talk" )
	end
	if nDate >= 100423 and nDate <= 100523 then
		tinsert(tSay,"Ho�t ��ng t�ng H�p qu� chi�n th�ng/donate_vicbox" )
	end
	if nDate >= 100820 and nDate <= 100916 then
		tinsert(tSay,"T�ng 10 b�nh kem Socola cho B�ch Ti�n Sinh/give_cake_201008")		
	end
	-- Ho�t ��ng nh�n qu� T�t d��ng l�ch n�m 2012
	if nDate >= 111230 and nDate <= 120108 then
		tinsert(tSay,"Ta mu�n nh�n ph�n qu� n�m m�i 2012/get_new_years_award")	
	end
	-- Ho�t ��ng nh�n �ua TOP event
	if nDate >= 120113 and nDate <= 120115 then
		tinsert(tSay,"Nh�n ph�n qu� Ph�c nh� ��ng H�i - Th� T� Nam S�n/get_final_top")		
	end
	-- Ho�t ��ng nh�n L� x� ��u n�m
	if nDate >= 120123 and nDate <= 120201 then
		tinsert(tSay,"L� x� c�c em nh� ngoan ngo�n/send_gift")		
	end
	-- Fix bug tr�n ph�i
	if nDate >= 130422 and nDate <= 130511 then
		tinsert(tSay,"S�a ch�a k� n�ng tr�n ph�i/OnNpcTalkRepairGreatSkill")		
	end	
	if PhucSinh2_CheckFinishMission() ~= 1 then
	--	tinsert(tSay, "Th� th�ch Ph�c Sinh 2/NhiemVuPhucSinh2_Menu")
	end
	if PhucSinh2_CheckFinishMission() == 1 then
	--	tinsert(tSay,"Ho�n th�nh nhi�m v� Ph�c Sinh l�n 2/PS2_finishTask")
	end
	--tinsert(tSay,"Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/translife_task")
	--tinsert(tSay,"T�m hi�u c�c h��ng tu luy�n/view_info")
	--tinsert(tSay,"Nh�n l�i �n v� ngo�i trang chuy�n sinh/get_translife_item")
	tinsert(tSay,"Nhi�m v� thu th�p Th�t N��ng/accept_task_thonuong")	
	tinsert(tSay,"T�i h� ch� gh� qua!/nothing")
	
	local szSay = szNpcName.."L�o nghe n�i c� m�n <color=yellow>Th�t N��ng<color> r�t ngon. L�o nay �� gi�, kh�ng ti�n ��n nh�ng n�i xa x�i �� t�m th�t n��ng. Ng��i c� th� gi�p ta t�m <color=yellow>20 ph�n Th�t N��ng<color> ���c hay kh�ng?"
	Say(szSay,getn(tSay),tSay)		
end

function translife_task()
	if GetTaskTrans() == 0 then
		trans_talk_01()
	elseif GetTaskTrans() == 5 then
		trans_talk_06()
	elseif GetTaskTrans() == 6 then
		trans_talk_07()
	elseif GetTaskTrans() == 7 then
		trans_talk_08()
	elseif (GetTaskTrans() >= 8  and GetTaskTrans() <= 13) or (GetTaskTrans() >= 28 and GetTaskTrans() <= 29) or (GetTaskTrans() > 36) then		
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	elseif GetTaskTrans() == 14 then
		trans_talk_14()
	elseif GetTaskTrans() == 25 then
		trans_talk_25()
	elseif GetTaskTrans() == 26 then
		trans_talk_26()
	elseif GetTaskTrans() == 27 then
		trans_talk_27()
	elseif GetTaskTrans() == 30 then
		trans_talk_30()
	elseif GetTaskTrans() == 34 then
		trans_talk_34()
	elseif GetTaskTrans() == 36 then
		trans_talk_36()
	else
		Say(szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?",0)
	end
end

function give_tra()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091213 then
		if GetLevel() < 10 then
			Talk(1, "", szNpcName.."��ng c�p ng��i c�n qu� th�p!")
			return 0;
		end
		if GetPlayerRoute() == 0 then
			Talk(1, "", szNpcName.."Ng��i kh�ng ph�i l� �� t� c�a ph�i n�o, l�m sao l�o chuy�n qu� gi�p ���c?");
			return 0;
		end
		if GetItemCount(2, 1, 30119) < 10 then
			Talk(1, "", szNpcName.."Ng��i �ang ��a l�o ph�i kh�ng? Kh�ng ph�i t�ng tr� hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) ~= nDate then
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);
			SetTask(VIET_0911_TASK_ZHANGMEN_TIME, 0);
			SetTask(VIET_0911_TASK_ZHANGMEN_DATE,nDate)
		end		
		local nCountLimit = 3
		if nDate == 091213 then
			nCountLimit = 6
		end				
		if GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) >= nCountLimit then		
			Talk(1, "", szNpcName.."Ng��i h�m nay nh� l�o t�ng tr� �� r�i, h�y ��i ng�y mai r�i ti�p t�c.");
			return 0;
		end		
		if GetFreeItemRoom() < 3 then	
			Talk(1, "", szNpcName.."H�nh trang ng��i kh�ng �� 3 � tr�ng!")
			return 0;
		end

		if DelItem(2, 1, 30119, 10) == 1 then					
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, GetTask(VIET_0911_TASK_ZHANGMEN_COUNT) + 1);
			ModifyExp(1500000);				
			local nRand = gf_GetRandItemByTable(tbVIET_0911_TANGQUASUPHU, 100000, 1);
			if nRand == 1 then
				Earn(300000)
				Msg2Player("B�n nh�n ���c 30 v�ng.")
				WriteLogEx(VIET_0911_LOG_TITLE,"t�ng qu�",30,"v�ng")
			else
				local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_TANGQUASUPHU[nRand][3], tbVIET_0911_TANGQUASUPHU[nRand][1]);					
				if nRetCode == 1 and tbVIET_0911_TANGQUASUPHU[nRand][4] ~= 0 then
					SetItemExpireTime(nIndex, tbVIET_0911_TANGQUASUPHU[nRand][4]);
				end				
				Msg2Player("B�n nh�n ���c 1 "..tbVIET_0911_TANGQUASUPHU[nRand][1])
				WriteLogEx(VIET_0911_LOG_TITLE,"t�ng qu�",1,tbVIET_0911_TANGQUASUPHU[nRand][1])
			end	
			
			local nRand = random(1,100)
			if nRand <= 5 then
				local nLingShi = 0
				local nRoute = GetPlayerRoute()
				local nRand2 = random(1,100)
				if nRand2 <= 40 then
					nLingShi = random(40,80)
				else
					nLingShi = random(81,100)
				end
				if tbVIET_0911_WEAPON[nRoute] ~= nil then
					AddItem(tbVIET_0911_WEAPON[nRoute][2],tbVIET_0911_WEAPON[nRoute][3],tbVIET_0911_WEAPON[nRoute][4],1,1,0,0,0,0,0,0,0,0,nLingShi)
					Msg2Player("B�n nh�n ���c 1 "..tbVIET_0911_WEAPON[nRoute][1])
					WriteLogEx(VIET_0911_LOG_TITLE,"t�ng qu�",1,tbVIET_0911_WEAPON[nRoute][1])
				end
			end						
		end
	end
end

function give_banh()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091213 then
		if GetLevel() < 10 then
			Talk(1, "", szNpcName.."��ng c�p ng��i c�n qu� th�p!")
			return 0;
		end
		if GetPlayerRoute() == 0 then
			Talk(1, "", szNpcName.."Ng��i kh�ng ph�i l� �� t� c�a ph�i n�o, l�m sao l�o chuy�n qu� gi�p ���c?");
			return 0;
		end
		if GetItemCount(2, 1, 30120) < 2 then
			Talk(1, "", szNpcName.."Ng��i �ang ��a l�o ph�i kh�ng? Kh�ng ph�i t�ng b�nh hay sao?")
			return 0;
		end
		if GetTask(VIET_0911_TASK_ZHANGMEN_DATE) ~= nDate then
			SetTask(VIET_0911_TASK_ZHANGMEN_COUNT, 0);		
			SetTask(VIET_0911_TASK_ZHANGMEN_TIME, 0);
			SetTask(VIET_0911_TASK_ZHANGMEN_DATE,nDate)
		end		
		if GetTask(VIET_0911_TASK_ZHANGMEN_TIME) >= 10 then		
			Talk(1, "", szNpcName.."Ng��i h�m nay nh� l�o t�ng b�nh �� r�i, h�y ��i ng�y mai r�i ti�p t�c.");
			return 0;
		end			
		if DelItem(2, 1, 30120, 2) == 1 then
			SetTask(VIET_0911_TASK_ZHANGMEN_TIME, GetTask(VIET_0911_TASK_ZHANGMEN_TIME) + 1)
			local nPoint = GetTask(336)
			for i,t in tbVIET_0911_TANGQUASUPHU_2 do
				if t[1] <= nPoint and nPoint <= t[2] then
					ModifyExp(t[3])
					Msg2Player("B�n nh�n ���c "..t[3].." �i�m kinh nghi�m.")
					break;
				end
			end		
		end
	end
end

function take_tra_award()
	if GetTask(VIET_0911_TASK_JUHUACHA_COUNT) == VIET_0911_JUHUACHA_MAX_COUNT then
		if GetFreeItemRoom() < 2 then	
			Talk(1, "", szNpcName.."H�nh trang ng��i kh�ng �� 3 � tr�ng!")
			return 0;
		end
		SetTask(VIET_0911_TASK_JUHUACHA_COUNT,VIET_0911_JUHUACHA_MAX_COUNT + 1)		
		local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD_FULL, 1000000, 6);
		local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][3], tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][1]);
		WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c full",1,tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][1])
		Say(szNpcName.."Ch�c m�ng c�c h� nh�n ���c 1 "..tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][1],0)
		if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][4] ~= 0 then
			SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD_FULL[nRand][4]);
		end
	else
		Talk(1, "", szNpcName.."Ng��i ch�a s� d�ng �� s� l��ng Tr� Hoa C�c!");
	end
end

function take_pearl()
	local nDate = tonumber(date("%Y%m%d"))
	local nTaskVal = GetTask(TSK_NGOCTRAI)
	local nCount =  GetByte(nTaskVal, BYTE_COUNT)
	local nTakeFlag =  GetByte(nTaskVal, BYTE_FLAG)
	
	if nTakeFlag == 1 then
		if nDate > 20091127 then
			if nTakeFlag ~= 2 then
				nTaskVal = SetByte(nTaskVal, BYTE_COUNT, 0)			
				nTaskVal = SetByte(nTaskVal, BYTE_FLAG, 2)			
				SetTask(TSK_NGOCTRAI, nTaskVal)
			end
		end
	end 
	
	nTaskVal = GetTask(TSK_NGOCTRAI)
	nCount =  GetByte(nTaskVal, BYTE_COUNT)
	nTakeFlag =  GetByte(nTaskVal, BYTE_FLAG)
	
	if nCount >= 40 then
		Talk(1, "", szNpcName.."Ng��i �� ��i Ng�c Trai 40 l�n r�i. Sau ng�y 27/11/2009 s� c� th�m 40 l�n ��i n�a!");
		return
	end
	
	if GetItemCount(2,1,30118) < 8 then
		Talk(1, "", szNpcName.."Ng��i kh�ng �� s� l��ng Hoa C�c!");
		return
	end
	
	if GetItemCount(2,1,1000) < 1 then
		Talk(1, "", szNpcName.."Ng��i kh�ng �� s� l��ng B�n Long B�ch!");
		return
	end
	
	if GetCash() < 350000 then
		Talk(1, "", szNpcName.."Ng��i kh�ng mang �� ng�n l��ng");
		return
	end
	
	if gf_JudgeRoomWeight(1,1,szNpcName) == 0 then
		return
	end
	
	if DelItem(2,1,30118,8) == 1 and DelItem(2,1,1000,1) == 1 and Pay(350000) == 1 then
		nTaskVal = SetByte(nTaskVal, BYTE_COUNT, nCount + 1)			
		if nTakeFlag == 0 then
			nTaskVal = SetByte(nTaskVal, BYTE_FLAG, 1)
		end
		SetTask(TSK_NGOCTRAI, nTaskVal)		
		local nRet, nItemIdx = gf_AddItemEx({2,1,30122,1,4},"Ng�c Trai")
		if nRet >= 1 then
			if nDate <= 20091127 then 
				gf_SetItemExpireTime(nItemIdx, 2009,11,27,23,58);
			else
				gf_SetItemExpireTime(nItemIdx, 2009,12,27,23,58);
			end		
		end	
	end
end

function accept_task_thonuong()
	local tSay = {}
	
	tinsert(tSay,"Nh�n nhi�m v� thu th�p Th�t N��ng/confirm_task_thonuong")	
--	if GetTask(TSK_ACTIVE_VIP_THONUONG) == 0 then
--		tinsert(tSay,"K�ch ho�t nhi�m v� thu th�p Th�t N��ng d�ng VIP (ti�u hao 10 Xu v�t ph�m)/active_VIP")	
--	end
	tinsert(tSay,"Ho�n th�nh nhi�m v� thu th�p Th�t N��ng/finish_task_thonuong")	
	tinsert(tSay,"T�i h� ch� gh� qua!/nothing")		
	
	Say(szNpcName.."H�y gi�p l�o thu th�p 20 Th�t N��ng t�i Y�n Ti�c Th�t N��ng. N�u ng��i ho�n th�nh th� l�o s� t�ng ng��i 1 m�n qu�. ��ng � ch�?",getn(tSay),tSay)
end
function active_VIP()
	VietResetDate() -- reset gi� tr� m�i ng�y
	if GetItemCount(2,1,30230) < 10 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� Xu v�t ph�m �� kick ho�t VIP?")
		return
	end
	DelItem(2,1,30230,10)
	SetTask(TSK_ACTIVE_VIP_THONUONG,1)
	gf_WriteLogEx("KICK HOAT VIP", "kick ho�t th�nh c�ng", 1, "VIP th� n��ng")
end
-- Ti�p nh�n nhi�m v� th�t n��ng
function confirm_task_thonuong()
	
	-- �i�m danh v�ng b�ng kh�ng, kh�ng th� ti�p nh�n nhi�m v�
	if ( GetReputation ( ) == 0 ) then
		Talk ( 1 , "", szNpcName.." �i�m danh v�ng c�a ngu�i kh�ng ��" )
		return
	end

	if GetLevel() < 20 then
		Talk(1, "", szNpcName.."��ng c�p 20 m�i c� th� nh�n nhi�m v� c�a l�o.");
		return	
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		Talk(1, "", szNpcName.."Ng��i �� nh�n nhi�m v� r�i. H�y ho�n th�nh nhi�m v� r�i ��n g�p l�o!");
		return
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 2 then
		Talk(1, "", szNpcName.."Ng��i �� ho�n th�nh nhi�m v�, c�n kh�ng mau nh�n th��ng?");
		return
	end
	SetTask(TSK_THONUONG_ACCEPT,1)
	
	set_task_thonuong(BYTE_COUNT_COLLECT,0)  -- s� l�n thu th�p th�t nu�ng trong ng�y
	
	Talk(1, "", szNpcName.."�i s�m v� s�m. M�i ng�y ch� gi�p l�o ���c 4 l�n th�i ��y. N�u c� b�n ��ng h�nh �i c�ng, c�c h� s� c� th� gi�p l�o t�ng c�ng ���c 8 l�n ��y!");
	TaskTip("Nh�t 20 Th�t N��ng v� cho B�ch Ti�n Sinh")		
	WriteLogEx(VIET_0911_LOG_TITLE,"nh�n nhi�m v� Th�t N��ng")
end

-- ho�n th�nh nhi�m v� th�t nu�ng
function finish_task_thonuong()

	-- �i�m danh v�ng b�ng kh�ng, kh�ng th� ti�p nh�n nhi�m v�
	if ( GetReputation ( ) < 4 ) then
		Talk ( 1 , "", szNpcName.." �i�m danh v�ng c�a ngu�i kh�ng ��" )
		return
	end
	
	if GetLevel() < 20 then
		Talk(1, "", szNpcName.."��ng c�p 20 m�i c� th� nh�n nhi�m v� c�a l�o.");
		return	
	end
	if GetTask(TSK_THONUONG_ACCEPT) == 0 then
		Talk(1, "", szNpcName.."Ng��i ho�n th�nh nhi�m v� g� sao l�o kh�ng nh�?");
		return
	end	
	if GetTask(TSK_THONUONG_ACCEPT) == 1 or get_task_thonuong(BYTE_COUNT_COLLECT)  < 20 then
		Talk(1, "", szNpcName.."Ng��i �� nh�n nhi�m v� r�i. H�y ho�n th�nh nhi�m v� r�i ��n g�p l�o!");
		return
	end
	
	if GetTask(TSK_THONUONG_ACCEPT) == 2 then  -- ho�n th�nh nhi�m v� th�t nu�ng
		local nCurDate = tonumber(tonumber(date("%m"))..tonumber(date("%d")))
		local nLevel = floor(GetLevel()/10)
		local nLastDate = tonumber(get_task_thonuong(BYTE_MONTH)..get_task_thonuong(BYTE_DAY))
		if nCurDate ~= nLastDate then			
			set_task_thonuong(BYTE_COUNT_FINISH,0)
			set_task_thonuong(BYTE_DAY,tonumber(date("%d")))
			set_task_thonuong(BYTE_MONTH,tonumber(date("%m")))
		end
		
		-- Pet: b�n ��ng h�nh c�p 1 tr� l�n th�c hi�n nhi�m v� 8 l�n trong ng�y
		local nTaskTime = 4
		local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)	
		if nPetLevel >= 1 then
			nTaskTime = 8
		end
		
		-- luu so l�n ho�n th�nh nhi�m v� th�t nu�ng v�o BYTE_COUNT_FINISH
		if get_task_thonuong(BYTE_COUNT_FINISH) >= nTaskTime then
			Talk(1, "", szNpcName.."Ng��i �� ho�n th�nh "..nTaskTime.." nhi�m v� r�i. Mai quay l�i nh�!");
			return
		end
		
		set_task_thonuong(BYTE_COUNT_COLLECT,0)
		set_task_thonuong(BYTE_COUNT_FINISH, get_task_thonuong(BYTE_COUNT_FINISH) + 1)
		
		SetTask(TSK_THONUONG_ACCEPT, 0)  -- tr�ng th�i ch�a ti�p nh�n + ho�n th�nh nhi�m v�
		-- Nh�n ph�n th��ng thu�c t�ng l�c 
		local nDate2011 = 	tonumber(date("%y%m%d"))
		if (get_task_thonuong(BYTE_COUNT_FINISH) == 4 or get_task_thonuong(BYTE_COUNT_FINISH) == 8) and GetLevel() >= 90 and nDate2011 >= 110408 then
			local nRand = random(1, 100)
			local nDoneTimes = get_task_thonuong(BYTE_COUNT_FINISH)
			if nRand <= 60 then
				gf_AddItemEx2({1, 1, 19, 5}, "T�y B�c V�ng", "Nhiem vu Tho Nuong Bach Tien Sinh", "nh�n th��ng nhi�m v� l�n th� "..nDoneTimes)
			elseif nRand <= 80 then
				gf_AddItemEx2({1, 1, 17, 5}, "Minh Nguy�t D�", "Nhiem vu Tho Nuong Bach Tien Sinh", "nh�n th��ng nhi�m v� l�n th� "..nDoneTimes)
			else
				gf_AddItemEx2({1, 1, 15, 5}, "B�nh B�t v�ng", "Nhiem vu Tho Nuong Bach Tien Sinh", "nh�n th��ng nhi�m v� l�n th� "..nDoneTimes)
			end
		end
		-----------------------Chu�i nhi�m v� ��ng H�nh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 3 or DongHanh_GetMission() == 4) then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
		---------------------------------------------------
		--ModifyExp(tb_thonuong_award[nLevel])
		--Msg2Player("B�n nh�n ���c "..tb_thonuong_award[nLevel].." �i�m kinh nghi�m")
		
		-- nh�n th��ng th�t nu�ng : tb_20101201_ThitNuong		
		Reward20101201()		
--		if GetTask(TSK_ACTIVE_VIP_THONUONG) == 0 then
--			SetTask(TSK_ACTIVE_VIP_THONUONG, 2)
--		end
		local nExpChanKhi = 10
		AwardGenuineQi(nExpChanKhi)
		--Msg2Player("Nh�n ���c "..nExpChanKhi.." �i�m ch�n kh�")
		gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� th� n��ng")		
						
		if tonumber(date("%y%m%d")) >= 100129 and tonumber(date("%y%m%d")) <= 100228 then		
			gf_AddItemEx2({2,1,30146,80},"T�i Ng� S�c","Hoat dong thang 3 nam 2010","B�ch Ti�n Sinh")
		end		
		WriteLogEx(VIET_0911_LOG_TITLE,"ho�n th�nh nhi�m v� Th�t N��ng")
	end	
end

-- nh�n th��ng th�t nu�ng : tb_20101201_ThitNuong		
function Reward20101201( )
		
		local nExp = 0
		local nReputation = 0
		
		if ( GetLevel() >= 20 and GetLevel() <= 29 ) then
				nExp = tb_20101201_ThitNuong[2][1]
				nReputation = tb_20101201_ThitNuong[2][2]
				
		elseif ( GetLevel() >= 30 and GetLevel() <= 39 ) then
				nExp = tb_20101201_ThitNuong[3][1]
				nReputation = tb_20101201_ThitNuong[3][2]				
				
		elseif ( GetLevel() >= 40 and GetLevel() <= 49 ) then
				nExp = tb_20101201_ThitNuong[4][1]
				nReputation = tb_20101201_ThitNuong[4][2]				
				
		elseif ( GetLevel() >= 50 and GetLevel() <= 59 ) then
				nExp = tb_20101201_ThitNuong[5][1]
				nReputation = tb_20101201_ThitNuong[5][2]				
				
		elseif ( GetLevel() >= 60 and GetLevel() <= 69 ) then
				nExp = tb_20101201_ThitNuong[6][1]
				nReputation = tb_20101201_ThitNuong[6][2]						
		
		elseif ( GetLevel() >= 70 and GetLevel() <= 79 ) then
				nExp = tb_20101201_ThitNuong[7][1]
				nReputation = tb_20101201_ThitNuong[7][2]				
				
		elseif ( GetLevel() >= 80 and GetLevel() <= 89 ) then
				nExp = tb_20101201_ThitNuong[8][1]
				nReputation = tb_20101201_ThitNuong[8][2]				
				
		elseif ( GetLevel() >= 90 and GetLevel() <= 99 ) then
				nExp = tb_20101201_ThitNuong[9][1]
				nReputation = tb_20101201_ThitNuong[9][2]										
				
		end
--		if GetTask(TSK_ACTIVE_VIP_THONUONG) == 1 then -- x2 kinh nghi�m khi kick ho�t VIP
--			nExp = nExp * 2
--		end
		ModifyExp (nExp)
		ModifyReputation (-nReputation,0) 		
		if ( GetReputation() < 0 ) then
			ModifyReputation ( 0 ,0 )
		end
		
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m")
		Msg2Player("�i�m danh v�ng c�a b�n b� tr� "..nReputation.." �i�m")
end

function give_zongzi_talk()
    if gf_CheckEventDateEx(VET_201001_02_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[20]);
        return 0;
    end
    local tbDialog = {
        VET_201001_TB_STRINGS[15].."/give_zongzi",        
        VET_201001_TB_STRINGS[17].."/gf_DoNothing",
    };

    Say(VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[14], 
        getn(tbDialog), tbDialog);
end

function give_zongzi()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VET_201001_TASK_GIVE_ZONGZI_DATE) < nDate then
        SetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT, 0);
    end
    if GetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT) >= 3 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[18]);
        return 0;
    end
    if GetItemCount(VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4]) < 10 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[19]);
        return 0;
    end
    if gf_JudgeRoomWeight(2, 50, VET_201001_TB_STRINGS[13]) == 0 then
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4], 10) == 1 then
        --������
        gf_EventGiveCustomAward(1, 1500000, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[16]);
        gf_EventGiveRandAward(VET_201001_TB_AWARD_ZENGSONG, 1000, 8, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[16]);
        
        SetTask(VET_201001_TASK_GIVE_ZONGZI_DATE, nDate);
        SetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT, GetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT) + 1);
    end
end

function nothing()
end

function PS2_finishTask()
	if PhucSinh2_CheckFinishMission() ~= 1 then
		Talk(1,"","Ng��i ch�a �em b�n l�nh ho�n th�nh c�c th� th�ch, ta kh�ng th� li�u m�ng gi�p ng��i Ph�c Sinh.")
		return 0
	end
	if PhucSinh2_Award_GetStatus() == 1 then
		Talk(1,"","Ng��i �� tu luy�n th�nh c�ng m� m�n b� k�p Ph�c Sinh 2, ta kh�ng th� gi�p g� h�n n�a.")
		return 0
	end
	local nCheck_KM = MeridianGetLevel()
	if nCheck_KM < 3 then
		Talk(1, "", "B�n ch�a k�ch ho�t kinh m�ch ��n c�nh gi�i V� V��ng, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t v� <color=yellow>Ph�c Sinh l�n 2<color> ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	
	tinsert(tbSayDialog,"Ta ��t c�p 99 v� d� 60 t� �i�m kinh nghi�m/#confirm_finish_quest(1)")
	tinsert(tbSayDialog,"Ta ��t c�p 99 v� d� 40 t� �i�m kinh nghi�m/#confirm_finish_quest(2)")
	tinsert(tbSayDialog,"Ta ��t c�p 99 v� d� 20 t� �i�m kinh nghi�m/#confirm_finish_quest(3)")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/nothing"	)
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);	
end
function confirm_finish_quest(nType)
	local nCheck = check_material(nType)
	if nCheck == 0 then
		return
	end
	local szNpcName = "<color=green>B�ch Ti�n Sinh<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p qu� l� m�t k� nh�n trong V� L�m, b�t ��u l�nh ng� b� k�p <color=yellow>T� Linh Ph�c Sinh<color> �� ��t ph� b�nh c�nh. L�nh ng� th�nh c�ng c� th� kich th�ch ti�m l�c c�a b�n th�n ��t c�nh gi�i m�i trong �� Th�ng Kinh M�ch. !!!"
	
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#cs7_finish_confrim(1,"..nType..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#cs7_finish_confrim(2,"..nType..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#cs7_finish_confrim(4,"..nType..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#cs7_finish_confrim(3,"..nType..")")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function cs7_finish_confrim(nType, nCheck)
		local tb_translife_seal_cs7 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
					}
		local tb_translife_cloth_PS = {
										[1] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	local nType_cs6 = GetPlayerRebornParam(1)
	if nType_cs6 < 0 or nType_cs6 > 4 then
		Msg2Player("�� x�y ra l�i")
		gf_WriteLogEx("LOI API", "ghi nh�n th�nh c�ng", 1, "L�i API chuy�n sinh 7")	
		return
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	--------------------
	local nDelItem = del_material(nCheck)
	if nDelItem ~= 1 then
		Talk(1, "", "�� x�y ra l�i tr� v�t ph�m")
		return
	end
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	

--	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
			P = P + GetBody() - 1
--			lvatt3 = lvatt3 or 0
--			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end

--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs7[nType][2], tb_translife_seal_cs7[nType][1])
	gf_AddItemEx2({0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1},"Th�t tinh ki�m", "That tinh kiem","mien phi 7 ngay",7*24*3600)
	PlayerReborn(2,nType) -- Chuy�n Sinh 7 th�nh c�ng (Ph�c Sinh 2)
	RemoveTitle(61,05)
	AddTitle(61,06)
	PhucSinh2_Award_SetStatus()
 	gf_WriteLogEx("CHUYEN SINH 7", "chuy�n sinh th�nh c�ng", 1, "Finish nv chuy�n Sinh 6 npc 2")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Sinh l�n 2 !!!!! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")
end
	tCheck_PS2 = {	--Level, kinh nghi�m, Th�i d�ch H�n Nguy�n, Chuy�n Sinh ��n, B�ch Kim H�ng Bao, Thi�n Th�ch Tinh Th�ch, Th�n T�i b�o r��ng, Chi�n th�n ho�n, Huy ch��ng anh h�ng
					[1] = {99, 60, 4, 2, 2 , 0, 0, 0, 0},
					[2] = {99, 40, 4, 2, 4, 0, 3, 1, 50},
					[3] = {99, 20, 4, 2, 4, 0, 5, 3, 100},
				}
function del_material(nType)
	local nTime = floor(GetExp()/2000000000)
	for i =1, nTime do
		ModifyExp(-GetExp())	--c�t 2
	end
	ModifyExp(-GetExp())
	if DelItem(2,0,1083, tCheck_PS2[nType][3]) ~= 1 then --c�t 3
		return 0
	end
	if DelItem(2,1,30345, tCheck_PS2[nType][4]) ~= 1 then	--c�t 4
		return 0
	end
	if DelItem(2,1,30229, tCheck_PS2[nType][5]) ~= 1 then	--c�t 5
		return 0
	end	
	if DelItem(2,1,1009, tCheck_PS2[nType][6]) ~= 1 then	--c�t 6
		return 0
	end
	if DelItem(2,1,30344, tCheck_PS2[nType][7]) ~= 1 then	--c�t 7
		return 0
	end	
	if DelItem(2,1,1005, tCheck_PS2[nType][8]) ~= 1 then	--c�t 8
		return 0
	end	
	if DelItem(2,1,30499, tCheck_PS2[nType][9]) ~= 1 then	--c�t 9
		return 0
	end					
	return 1
end
function check_material(nType)
	
	local nCount_PS = GetPlayerRebornParam(0)
	local nCheck_KM = MeridianGetLevel()
	if nCount_PS < 1 then
		Talk(1, "", "B�n ch�a Ph�c Sinh l�n 1, n�n kh�ng th� th�c hi�n Ph�c Sinh l�n 2 ���c.")
		return 0
	end
	if nCheck_KM < 3 then
		Talk(1, "", "B�n ch�a k�ch ho�t kinh m�ch ��n c�nh gi�i V� V��ng, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetLevel() < tCheck_PS2[nType][1] then --Level - c�t 1
		Talk(1, "", "B�n ch�a ��t c�p 99, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetExp() < tCheck_PS2[nType][2] * 1000000000 then	--kinh nghi�m -c�t 2
		Talk(1, "", "B�n ch�a t�ch l�y �� "..tCheck_PS2[nType][2].." t� �i�m kinh nghi�m, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end	
	if GetItemCount(2,0,1083) < tCheck_PS2[nType][3] then	--Th�i d�ch h�n nguy�n - c�t 3
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Th�i D�ch H�n Nguy�n C�ng Ph�, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetItemCount(2,1,30345) < tCheck_PS2[nType][4] then	--Chuy�n Sinh ��n - c�t 4
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Chuy�n Sinh ��n, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetItemCount(2,1,30229) < tCheck_PS2[nType][5] then	--B�ch Kim H�ng Bao - c�t 5
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng B�ch Kim H�ng Bao, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end	
	if GetItemCount(2,1,1009) < tCheck_PS2[nType][6] then	--Thi�n Th�ch Tinh Th�ch - c�t 6
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Thi�n Th�ch Tinh Th�ch, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end		
	if GetItemCount(2,1,30344) < tCheck_PS2[nType][7] then	--Th�n t�i b�o r��ng - c�t 7
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Th�n T�i B�o R��ng, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetItemCount(2,1,1005) < tCheck_PS2[nType][8] then	--Chi�n th�n ho�n - c�t 8
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Chi�n th�n ho�n, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end
	if GetItemCount(2,1,30499) < tCheck_PS2[nType][9] then	--Hu�n Ch��ng Anh H�ng - c�t 9
		Talk(1, "", "B�n kh�ng mang theo �� s� l��ng Hu�n Ch��ng Anh H�ng, n�n kh�ng th� th�c hi�n Ph�c Sinh ���c.")
		return 0
	end		
	return 1
end