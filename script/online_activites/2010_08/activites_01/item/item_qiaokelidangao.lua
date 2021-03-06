--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 巧克力蛋糕脚本文件
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[2][1], 2, 1);

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(2, 200) ~= 1 then
		Talk(1,"","Kh玭g  ch? tr鑞g ho芻  n苙g, xin ki觤 tra l筰 h祅h trang!")
        	return
	end
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) ~= 1 then
        Talk(1,"",VET_201008_01_TB_STRING_LIST[7])
        return
    end
    if GetLevel() < 10 then 
        Talk(1,"",VET_201008_01_TB_STRING_LIST[9])
        return
    end
    local nEatCakeNum = GetTask(VET_201008_01_TASK_EAT_QIAOKELIDANGAO)
    if nEatCakeNum >= 2250 then
        Talk(1,"",VET_201008_01_TB_STRING_LIST[8])
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if nEatCakeNum == nil then
            nEatCakeNum = 0
        end
        nEatCakeNum = nEatCakeNum + 1
        SetTask(VET_201008_01_TASK_EAT_QIAOKELIDANGAO,nEatCakeNum)
        getEatCakeAward(nEatCakeNum)
    end
end

function getEatCakeAward(nEatCakeNum)
    if mod(nEatCakeNum, 40) == 0 then
        VET_201008_01_get_exp(200000)
        gf_EventGiveRandAward(VET_201008_01_QIAOKELIDANGAO_SPECIAL_AWARD,1000,1,VET_201008_01_STR_LOG_TITLE,VET_201008_01_TB_LOG_ACTION_LIST[3])
    else
        VET_201008_01_get_exp(200000)
        gf_EventGiveRandAward(VET_201008_01_QIAOKELIDANGAO_AWARD,1000,1,VET_201008_01_STR_LOG_TITLE,VET_201008_01_TB_LOG_ACTION_LIST[2])
    end
end

