--=============================================
--create by xiongyizhi 2010.11.5
--describe:Խ�ϰ�2010��12��������� ��������ű�
--=============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua");--��ַ���
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function OnUse(nItemIdx)
    if gf_CheckEventDateEx2(VET_4_SOUL_TREE_BEGIN_TIME, VET_4_SOUL_TREE_END_TIME) ~= 1 then
        return 0;
    end
    if base_check() == 0 then
        return 0;
    end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end    
    local nMax4SouldTree = VET_4_SOUL_MAX_PLANT_TIMES
    local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--    if nPetLevel == 2 then
--    		nMax4SouldTree = 5
--    elseif nPetLevel >= 3 then
--    		nMax4SouldTree = 6
--    end
    local nDate = tonumber(date("%y%m%d"))
    local nUsedDay = floor(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT) / 100)
    if nDate ~= nUsedDay then
    		SetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT, nDate * 100)
    end
    local nUsed = mod(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT), 100)
    if nUsed >= nMax4SouldTree then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[19]);
        return 0;
    end

    local nTreeLife = 0
    for i = 1, getn(VET_201012_04_TB_TREE_GROW) do
        nTreeLife = nTreeLife + VET_201012_04_TB_TREE_GROW[i][4];
    end
    local ntime = nTreeLife - (GetTime() - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
    if ntime >= 0 then
        Talk(1, "", format(VET_201012_04_NPC_TALK_STRINGS[16], ntime))
        return 0;
    end

    local bInMap = 0
    for i = 1, getn(VET_4_TB_PLANT_MAP) do
        if GetWorldPos() == VET_4_TB_PLANT_MAP[i] then
            bInMap = 1;
            break;
        end
    end
    if bInMap == 0 then
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[14]);
        return 0;
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
    	----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u s� th� 6 v� 7 ��u b�n ph�i
		local nCSD_TL = floor(GetTask(TSK_CSD_COUNT_C) / 100000)
		local nNumBK = mod(GetTask(TSK_CSD_COUNT_C),100000)
		if mod(nCSD_TL, 100) < 99 and GetTask(TSK_CSD) == 1 then
			nCSD_TL = (nCSD_TL + 1) * 100000 + nNumBK
			SetTask(TSK_CSD_COUNT_C, nCSD_TL)
		end
		----------------------Chu�i nhi�m v� Chuy�n Sinh 6
		local nCS6_TL =  floor(GetTask(TSK_CS6_COUNTB)/10000)
		local nCS6_TL_Num = mod(GetTask(TSK_CS6_COUNTB),10000)
		if mod(nCS6_TL,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_TL = (nCS6_TL + 1) * 10000 + nCS6_TL_Num
			SetTask(TSK_CS6_COUNTB, nCS6_TL)
		end
    	----------------------
    	 	KichHoatCayTuLinh()-- ph�n thu�ng khi k�ch ho�t
    	
	--- �i�m V�n May
--	    	local nBonusExp = 3600000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nBonusExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--		else
--			Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--		end
			----------		
        local nNpcIndex = CreateNpc(VET_201012_04_TB_TREE_GROW[1][2], 
                                    GetName()..VET_201012_04_NPC_TALK_STRINGS[17]..VET_201012_04_NPC_TB[2][2], 
                                    GetWorldPos());
        SetNpcScript(nNpcIndex, VET_201012_04_TREE_SCRIPT);
        AddUnitStates(nNpcIndex, 5, 1);--Ĭ��һ�׶β����Ķ���������Ҫ�޸ĸ��к�����һ��
        local nLifeTime = VET_201012_04_TB_TREE_GROW[1][4] + VET_201012_04_TB_TREE_GROW[2][4] 
        SetNpcLifeTime(nNpcIndex, nLifeTime);
        gf_WriteLogEx(VET_201012_04_STR_LOG_TITLE,VET_201012_04_TB_LOG_ACTION_LIST[2]);
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, GetTime());
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT, GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT) + 1);
	--Say("H�m nay, ��y l� l�n th� <color=yellow>"..GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT).."<color> b�n tr�ng c�y T� Linh,  h�m nay b�n v�n c� th� tr�ng <color=yellow>"..(VET_4_SOUL_MAX_PLANT_TIMES-GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT)).."<color> c�y T� Linh.",0);		        
    		--------------   
    	--	if mod(GetTask(VET_201012_04_PLANT_4_SOUL_TREE_COUNT), 100) == 16 and nDate <= 130120 then   			
    	if nDate >= 130214 and nDate <= 130228 then	
		gf_AddItemEx2({2,1,30357, 200}, "H�t Ca Cao", "VALENTINE 2013", "H�t ca cao")
		--gf_AddItemEx2({2,1,30030, 60}, "Ti�u Nh� Y1", "NIEN THU NHU Y", "ho�n th�nh 16 c�y T� Linh")
	end	
        vaf_award_api("tPlant4LingTree") --2XU�
    end
end
