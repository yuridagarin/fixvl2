--=============================================
--create by xiongyizhi 2010.11.2
--describe:Խ�ϰ�2010��12�»1 ͷ�ļ�
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\2010_12\\activites_01\\strings.lua");--��ַ���
Include("\\script\\lib\\globalfunctions.lua");--���������ļ�
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

VET_201012_01_EVENT_NUMBER = 19;--�ڻ���ϵı����19
MAX_XMAS_BOX_NUM = 3000;--��ʹ�õ����ʥ��������Ŀ
SINGLE_XMAS_EXP = 200000; --���δ�ʥ���еľ��齱��

function VET_201012_01_GivePlayerLoginItem()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][2], 
                    VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][3], 
                    VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][4]) < 1 then
        gf_AddItemEx2({VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][4], 1}, 
                      VET_201012_01_TB_ITEM_LOGINGIVE_LIST[1][1], 
                      VET_201012_01_STR_LOG_TITLE, 
                      VET_201012_01_TB_LOG_ACTION_LIST[0], 
                      0, 
                      1);
    end
end

function VET_201012_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201012_01_TB_STRING_LIST[1];--���Ҵ��¼�say�ı���
    
        tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[2].."/exchange_xmas_box");
 --       tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[3].."/get_final_award");
--        tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[4].."/set_award_mode");
--        tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[5].."/exchange_tongqian");
--        tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[6].."/active_fire_for_warm"); --���ֹ��ܶ����ԣ���ӵ������ļ��У����������г�
--        tinsert(tbSayDialog, VET_201012_01_TB_STRING_LIST[7].."/buy_match");
        --�Ի���
    end
    return tbSayDialog, szSayHead;
end

function exchange_xmas_box()
	AskClientForNumber("confirm_exchange_xmas_box", 1, 999, "S� H�p Qu�?")
end

function confirm_exchange_xmas_box(nCount)
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    if GetItemCount(VET_201012_01_TB_ITEM_LIST[1][2], 
                    VET_201012_01_TB_ITEM_LIST[1][3], 
                    VET_201012_01_TB_ITEM_LIST[1][4]) < (5 * nCount )
        or GetItemCount(VET_201012_01_TB_ITEM_LIST[5][2], 
                        VET_201012_01_TB_ITEM_LIST[5][3], 
                        VET_201012_01_TB_ITEM_LIST[5][4]) < (2 * nCount)
    then
        Talk(1, "", VET_201012_01_TB_STRING_LIST[8]);
        return 0;
        
    elseif DelItem(VET_201012_01_TB_ITEM_LIST[1][2],  
                   VET_201012_01_TB_ITEM_LIST[1][3], 
                   VET_201012_01_TB_ITEM_LIST[1][4], 
                   5 * nCount) 
        and DelItem(VET_201012_01_TB_ITEM_LIST[5][2], 
                    VET_201012_01_TB_ITEM_LIST[5][3], 
                    VET_201012_01_TB_ITEM_LIST[5][4], 
                    2 * nCount) == 1
    then 
        gf_AddItemEx2({VET_201012_01_TB_ITEM_LIST[2][2], VET_201012_01_TB_ITEM_LIST[2][3], VET_201012_01_TB_ITEM_LIST[2][4], nCount},
                        VET_201012_01_TB_ITEM_LIST[2][1],
                        VET_201012_01_STR_LOG_TITLE, 
                        VET_201012_01_TB_LOG_ACTION_LIST[1],
                        0, 
                        1)
    end
    SelectSay()
end

function get_final_award()
    if gf_Judge_Room_Weight(1, 0, "") ~= 1 then
        return 0;
    end
    local nMaxBox = 1500
    if GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) >= 1 then
        nMaxBox = 3000
    end
    if GetTask(VET_201012_01_USE_XMAS_BOX_COUNT) < nMaxBox then 
        Talk(1, "", format(VET_201012_01_TB_STRING_LIST[9], GetTask(VET_201012_01_USE_XMAS_BOX_COUNT), nMaxBox));
        return 0;
    elseif GetTask(VET_201012_01_USE_XMAS_BOX_COUNT) >= nMaxBox then
        local tbDialog = {
                
                VET_201012_01_TB_STRING_LIST[20].."/#final_award_type(1)",    -- nhan 20 trieu exp + vat pham
                VET_201012_01_TB_STRING_LIST[21].."/#final_award_type(2)",    -- nhan 20 diem nang cap ban dong hanh
                VET_201012_01_TB_STRING_LIST[22].."/#final_award_type(3)",    -- nhan 1 diem linh luc ban dong hanh
                
                VET_201012_01_TB_STRING_LIST[14].."/gf_DoNothing",
        };
            Say(VET_201012_01_TB_STRING_LIST[23], getn(tbDialog), tbDialog);

    end
end

function final_award_type(nType)
    local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
    if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
        return 0;
    end
    if (GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) == 1 and GetTask(VET_201012_01_USE_XMAS_BOX_COUNT) < 3000) or GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) == 2 then
        Talk(1, "", VET_201012_01_TB_STRING_LIST[24]);
        return 0;
    end
    
    -- SetTask(VET_201012_01_GET_FINAL_AWARD_FLAG,1);
    
    -- 20 mil exp
    if nType == 1 then
        gf_EventGiveCustomAward(1, 20000000, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6]);
        SetTask(VET_201012_01_GET_FINAL_AWARD_FLAG, GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) + 1)
        gf_EventGiveRandAward(VET_201012_TB_XMAS_BOX_FINAL_AWARD, 1000, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6]);
        
    --  diem nang cap
    elseif nType == 2 then
        if nCurPetLevel < 1 then
			Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh, kh�ng th� nh�n ph�n th��ng n�y!")			
			return
	  end
	  
	  SetTask(VET_201012_01_GET_FINAL_AWARD_FLAG, GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) + 1)
	  SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
	  Msg2Player("B�n nh�n ���c 20 �i�m N�ng C�p B�n ��ng H�nh")
	  gf_EventGiveRandAward(VET_201012_TB_XMAS_BOX_FINAL_AWARD, 1000, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6]);
	  
    -- diem linh luc
    elseif nType == 3 then
        if nCurPetLevel < 2 then
			Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� nh�n ph�n th��ng n�y!")
			return
	  end
	  
	  SetTask(VET_201012_01_GET_FINAL_AWARD_FLAG, GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) + 1)
	  Pet_AddGP(1)
	  Msg2Player("B�n nh�n ���c 1 �i�m Linh L�c B�n ��ng H�nh")
	  gf_EventGiveRandAward(VET_201012_TB_XMAS_BOX_FINAL_AWARD, 1000, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6]);
	  
    end
    gf_WriteLogEx(VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6].." lo�i "..nType)
    
end

--ʹ��ʥ����еĽ���ģʽ��1�ǻ����Ʒ��2�ǲ�Ҫ��Ʒ
function set_award_mode()
    Say(VET_201012_01_TB_STRING_LIST[11], 3, 
        VET_201012_01_TB_STRING_LIST[12].."/set_to_exp_mode",
        VET_201012_01_TB_STRING_LIST[13].."/set_to_item_mode",
        VET_201012_01_TB_STRING_LIST[14].."/gf_DoNothing");
end

function set_to_item_mode()
    SetTask(VET_201012_XMAS_BOX_MODE, 1);
    Talk(1, "", VET_201012_01_TB_STRING_LIST[16]);
    
end

function set_to_exp_mode()
    SetTask(VET_201012_XMAS_BOX_MODE, 2);
    Talk(1, "", VET_201012_01_TB_STRING_LIST[15]);
end

function exchange_tongqian()
    if GetItemCount(VET_201012_01_TB_ITEM_LIST[6][2], 
                    VET_201012_01_TB_ITEM_LIST[6][3], 
                    VET_201012_01_TB_ITEM_LIST[6][4], 
                    1) < 1 
    then
        Talk(1, "", VET_201012_01_TB_STRING_LIST[17]);
        return 0;
    elseif DelItem(VET_201012_01_TB_ITEM_LIST[6][2], 
                   VET_201012_01_TB_ITEM_LIST[6][3], 
                   VET_201012_01_TB_ITEM_LIST[6][4], 
                   1) == 1
    then 
        gf_AddItemEx2({VET_201012_01_TB_ITEM_LIST[5][2], VET_201012_01_TB_ITEM_LIST[5][3], VET_201012_01_TB_ITEM_LIST[5][4], 100},
                        VET_201012_01_TB_ITEM_LIST[5][1],
                        VET_201012_01_STR_LOG_TITLE, 
                        VET_201012_01_TB_LOG_ACTION_LIST[2],
                        0, 
                        1)
    end
end

--function active_fire_for_warm()
--    if GetTeamSize() < 2 then
--        Talk(1, "", VET_201012_01_TB_STRING_LIST[18]);
--        return 0;
--    else 
--
--    end
--end


function VET_201012_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GivePlantBigTreeAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 40},
                              VET_201012_01_TB_ITEM_LIST[1][1],
                              VET_201012_01_STR_LOG_TITLE);
end

function VET_201012_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GivePlantSmallTreeAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 30},
                                VET_201012_01_TB_ITEM_LIST[1][1],
                                VET_201012_01_STR_LOG_TITLE);
end

function VET_201012_01_Give_SeedbagAward()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GiveSeedBagAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 150},
                          VET_201012_01_TB_ITEM_LIST[1][1],
                          VET_201012_01_STR_LOG_TITLE);
end

function VET_201012_01_Give_Tuoguan_award()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GivesTuoGuanAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 30},
                          VET_201012_01_TB_ITEM_LIST[1][1],
                          VET_201012_01_STR_LOG_TITLE);
end

function VET_201012_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GiveDailyTaskPersonalAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 60},
                                   VET_201012_01_TB_ITEM_LIST[1][1],
                                   VET_201012_01_STR_LOG_TITLE);
end

function VET_201012_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    gf_GiveDailyTaskTeamAward({VET_201012_01_TB_ITEM_LIST[1][2], VET_201012_01_TB_ITEM_LIST[1][3], VET_201012_01_TB_ITEM_LIST[1][4], 60},
                               VET_201012_01_TB_ITEM_LIST[1][1],
                               VET_201012_01_STR_LOG_TITLE);
end

function get_bpy_weapon_201012()
	local nRand = random(1, 10000)
	local nTotal = 0
	for i = 1, getn(VET_201012_01_BFY_WEAPON) do
		if nRand <= nTotal + VET_201012_01_BFY_WEAPON[i][1] then
			gf_AddItemEx2(VET_201012_01_BFY_WEAPON[i][3], VET_201012_01_BFY_WEAPON[i][2], VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6])
			break
		end
		nTotal = nTotal + VET_201012_01_BFY_WEAPON[i][1]
	end
end

function get_faction_armor_201012()
	local nRand = random(1, getn(VET_201012_08_EQUIP))
	gf_AddItemEx2(VET_201012_08_EQUIP[nRand][3], VET_201012_08_EQUIP[nRand][1], VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[6])
end

function makeup_xmas_tree()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 110113 then
		Talk(1,"","�� h�t th�i h�n trang tr�!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)	
	if nCount >= 4 then
		Talk(1,"","M�i ng�y ch� c� th� trang tr� c�y th�ng t�i �a 4 l�n m� th�i!")
		return
	end
	if GetItemCount(2, 1, 30266) < 10 then
		Talk(1,"","��i hi�p kh�ng mang �� 10 H�p Qu� Gi�ng Sinh r�i!")
		return
	end
	if DelItem(2, 1, 30266, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("Nh�n ���c 2500000 �i�m kinh nghi�m")
		gf_WriteLogEx("Hoat dong thang 12 nam 2010", "trang tr� c�y gi�ng sinh nh�n 2500000 exp")
		gf_AddItemEx2({2, 1, 30264, 1}, "C�i", "Hoat dong thang 12 nam 2010", "trang tr� c�y gi�ng sinh nh�n 1 C�i")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end

function give_wood_201012()
	local nUsedDate = floor(GetTask(TSK_GIVE_WOOD) / 100)
	local nDate = tonumber(date("%y%m%d"))
--	
--	if nDate > 110113 then
--		Talk(1,"","�� h�t th�i h�n n�p c�i!")
--		return
--	end
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_WOOD, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_WOOD), 100)	
	if nCount >= 4 then
		Talk(1,"","M�i ng�y ch� c� th� n�p C�i Kh� t�i �a 4 l�n m� th�i!")
		return
	end
	if GetItemCount(2, 1, 30264) < 1 then
		Talk(1,"","��i hi�p kh�ng mang theo C�i Kh� sao ��i ���c!")
		return
	end
	if DelItem(2, 1, 30264, 1) == 1 then
		ModifyExp(200000)
		Msg2Player("Nh�n ���c 200000 �i�m kinh nghi�m")
		gf_WriteLogEx("Hoat dong thang 12 nam 2010", "N�p C�i Kh� nh�n 200000 exp")
		SetTask(TSK_GIVE_WOOD, GetTask(TSK_GIVE_WOOD) + 1)
	end
end