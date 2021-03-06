--=============================================
--create by zhangming 2010.8.20
--describe:越南版2010年9月活动1 直接合成的月饼脚本文件
--=============================================

Include("\\script\\online_activites\\2010_09\\activites_01\\head.lua");--活动头文件
Include("\\script\\online\\viet_event\\vng_task_control.lua");

g_szItemSayHead = gf_FixColor(VET_201009_01_TB_ITEM_LIST[4][1], 2, 1);

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[1])
        return
    end
    if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM) == 0 then
    	   Talk(1,"", "Чi hi謕 ch璦 x竎 nh薾 h譶h th鴆 nh薾 thng n猲 kh玭g th? s? d鬾g b竛h Trung Thu, thay i h譶h th鴆 nh薾 thng t筰 trang 2 c馻 C萴 Nang Чi S? Ki謓!")
        return
    end
    if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        return
    end
    --local nHaveAddedExp = GetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE)
    if GetTask(VET_201009_01_TASK_NUM_MOONCAKES) >= 3450 then
        Talk(1,"","Х s? d鬾g n gi韎 h筺, kh玭g th? d飊g th猰 b竛h Trung Thu!")
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
	    	   gf_WriteLogEx("Hoat dong thang 9 nam 2010", "nh薾 thng 250000 甶觤 kinh nghi謒")
	    end
    end
end

