--=============================================
--create by baiyun 2010.2.24
--describe:Խ�ϰ�2010��3�»1 Ů洱��нű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--�ͷ�ļ�
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")


function OnUse(nItemIdx)
--    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
--        return 0;
--    end
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 151231 then
		Talk(1,"","N� Oa b�o h�p �� h�t h�n s� d�ng!")
		do	return	end
	end
	
    if GetLevel() < 73 then
       Talk(1,"", "��ng c�p 73 tr� l�n m�i s� d�ng ���c v�t ph�m n�y." )
    	  return
    end
    if GetPlayerRoute() == 0 then
       Talk(1,"", "Gia nh�p m�n ph�i m�i s� d�ng ���c v�t ph�m n�y." )
    	  return
    end
   	if gf_Judge_Room_Weight(9, 100) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end 
 --   if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
--    if nDate > 100704 then
--		return
--    end    
    if nLastGetDate ~= nDate then
    	   SetTask(VET_201003_01_TASK_GET_BAOHE_DATE,nDate)
        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end
    
    local nUse = 100
    -- VBonus ver 2
	if CheckVbonus() == 1 then
		nUse = 200
	end
--     if nDate >= 120210 and nDate <= 120229 then
--    		nUse = 400
--    end
    
    --local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
    
--    local nWeek = tonumber(date("%w"))
--	if nWeek == 2 or nWeek == 3 then
--		nUse = 64
--	elseif nWeek == 4 or nWeek == 5 then
--		nUse = 88
--	end
--    if nDate <= 100905 then
--    		nUse = 64
--    end
--    if nDate >= 100909 and nDate <= 100912 then
--    		nUse = 128
--    end
    if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nUse then
    	  Talk(1,"", "B�n �� s� d�ng t�i �a s� N� Oa B�o H�p trong ng�y, kh�ng th� s� d�ng th�m!")
    	  return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
   	   SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT,GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) + 1)
--    	  if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and mod(GetTask(TASK_VNG_PET), 100) >= 2 then
--    	  	Pet_AddGP(1)
--    	  end

    	  -- Nhi�m v� chuy�n sinh 5
    	  if GetTask(TRANSLIFE_MISSION_ID) == 34 and GetTask(TRANSLIFE_TASK_5_2) < 2000 then
    	  	SetTask(TRANSLIFE_TASK_5_2, GetTask(TRANSLIFE_TASK_5_2) + 1)
    	  	if GetTask(TRANSLIFE_TASK_5_2) == 2000 then
    	  		TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh s� d�ng 2000 N� Oa B�o H�p")
    	  	end 
    	  end
    	 
--	  gf_EventGiveCustomAward(1, nExp, 0, "Nu Oa Bao Hap")
--   	  gf_EventGiveRandAward(VET_201003_01_NVWABAOHE_AWARD_LIST, 100, 3, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[9][1]);
 	 --- �i�m V�n May
 --	  	local nExp = 1000000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--		else
--			Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--		end   	
	-----------	  
--        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 400 then
--    	  		gf_AddItemEx2({2,1,30130,1}, "Phi Y�n Th�ch", VET_201003_01_STR_LOG_TITLE, "nh�n Phi Y�n Th�ch" )
--    	  		Msg2Player("B�n nh�n ���c 1 Phi Y�n Th�ch")
--    	  end
		gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� N� Oa")		
		VietWaBaoHe(); --th�m nguy�n li�u event h�ng th�ng
        	Use_Award_NuOa() --ph�n th��ng khi s� d�ng N� Oa
    		if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == nUse then        
    			Use_Award_NuOa_100()
    		end
        ----------- Chu�i nhi�m v� Chuy�n Sinh 6
       	local nCS6_BH =  floor(GetTask(TSK_CS6_GET1TIME)/1000)
		local nCS6_BH_Num = mod(GetTask(TSK_CS6_GET1TIME),1000)
		if mod(nCS6_BH,10000) < 1000 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_BH = (nCS6_BH + 1) * 1000 + nCS6_BH_Num
			SetTask(TSK_CS6_GET1TIME, nCS6_BH)
		end
    --nhi�m v� l�m gi�u
     if CFG_NhiemVuLamGiau == 1 then
	     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= 5 and gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 1) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 1, 1, 0)
	     		TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: S� d�ng 05 n� oa b�o h�p.")
	     end
	end

     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and nDate <= 130120 then
  		gf_AddItemEx2({2,1,30030, 50}, "Ti�u Nh� Y1", "NIEN THU NHU Y", "ho�n th�nh 100 N� oa ")
     end 		
        --cdkey
        SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemNvWa()");
    end
end
