--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9�»1 ֱ�Ӻϳɵ��±��ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_09\\activites_01\\head.lua");--�ͷ�ļ�
Include("\\script\\online\\viet_event\\vng_task_control.lua");

g_szItemSayHead = gf_FixColor(VET_201009_01_TB_ITEM_LIST[4][1], 2, 1);

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[1])
        return
    end
    if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM) == 0 then
    	   Talk(1,"", "��i hi�p ch�a x�c nh�n h�nh th�c nh�n th��ng n�n kh�ng th� s� d�ng b�nh Trung Thu, thay ��i h�nh th�c nh�n th��ng t�i trang 2 c�a C�m Nang ��i S� Ki�n!")
        return
    end
    if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        return
    end
    --local nHaveAddedExp = GetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE)
    if GetTask(VET_201009_01_TASK_NUM_MOONCAKES) >= 3450 then
        Talk(1,"","�� s� d�ng ��n gi�i h�n, kh�ng th� d�ng th�m b�nh Trung Thu!")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nMoonCakeNum = GetTask(VET_201009_01_TASK_NUM_MOONCAKES)
        nMoonCakeNum = nMoonCakeNum + 1
        SetTask(VET_201009_01_TASK_NUM_MOONCAKES, nMoonCakeNum)
       -- SetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE, GetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE) + 1)
        if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD) == 0 then
	        ModifyExp(200000)
	        gf_EventGiveRandAward(VET_201009_01_TB_MOONCAKE_AWARD,1000,1,VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[2])
	        if mod(nMoonCakeNum,20) == 0 then
	            gf_EventGiveRandAward(VET_201009_01_TB_MOONCAKE_AWARD_SP,10000,1,VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[3])
	        end
	    elseif gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD) == 1 then
	    	   ModifyExp(250000)
	    	   gf_WriteLogEx("Hoat dong thang 9 nam 2010", "nh�n th��ng 250000 �i�m kinh nghi�m")
	    end
    end
end

