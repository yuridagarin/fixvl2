--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 头文件
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_08\\activites_01\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件
Include("\\script\\online\\viet_event\\vng_task_control.lua")

VET_201008_01_EVENT_NUMBER = 11;--在活动表上的编号是11
VET_201008_01_CONST_DANGAOYUANLIAO = 10;

function VET_20100801_GivePlayerLoginItem()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][4]) < 1 then
        gf_AddItemEx2({VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][4], 1}, VET_201008_01_TB_ITEM_LOGINGIVE_LIST[1][1], VET_201008_01_STR_LOG_TITLE, VET_201008_01_TB_LOG_ACTION_LIST[1], 0, 1);
    end
end

function VET_201008_01_Give_Faction_Award()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 0 then

        return 0;
    end
    local tbAwardList = {
            [1] = 15, 
            [2] = 15, 
            [3] = 15, 
            [4] = 15, 
            [5] = 15, 
            [6] = 15, 
            [7] = 15, 
            [8] = 15, 
            [9] = 15, 
        };
    gf_EventFactionAward(
        {VET_201008_01_TB_ITEM_LIST[1][2], VET_201008_01_TB_ITEM_LIST[1][3], VET_201008_01_TB_ITEM_LIST[1][4]},
        VET_201008_01_TB_ITEM_LIST[1][1],
        tbAwardList,
        VET_201008_01_CONST_DANGAOYUANLIAO,
        GLB_TASK_FACTION_GET_DATE,
        GLB_TASK_FACTION_GET_COUNT,
        VET_201008_01_STR_LOG_TITLE
    );
end

function VET_201008_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201008_01_TB_ITEM_LIST[1][2], VET_201008_01_TB_ITEM_LIST[1][3], VET_201008_01_TB_ITEM_LIST[1][4], 60},
                VET_201008_01_TB_ITEM_LIST[1][1], VET_201008_01_STR_LOG_TITLE);
    end
end

function VET_201008_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201008_01_TB_ITEM_LIST[1][2], VET_201008_01_TB_ITEM_LIST[1][3], VET_201008_01_TB_ITEM_LIST[1][4], 60},
                VET_201008_01_TB_ITEM_LIST[1][1], VET_201008_01_STR_LOG_TITLE);
    end
end

function VET_201008_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201008_01_TB_ITEM_LIST[1][2], VET_201008_01_TB_ITEM_LIST[1][3], VET_201008_01_TB_ITEM_LIST[1][4], 60},
                VET_201008_01_TB_ITEM_LIST[1][1], VET_201008_01_STR_LOG_TITLE);
    end
end

function VET_201008_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201008_01_TB_ITEM_LIST[1][2], VET_201008_01_TB_ITEM_LIST[1][3], VET_201008_01_TB_ITEM_LIST[1][4], 60},
                VET_201008_01_TB_ITEM_LIST[1][1], VET_201008_01_STR_LOG_TITLE);
    end
end

function VET_201008_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201008_01_TB_STRING_LIST[1];                            --锦囊大事件say的标题
        tinsert(tbSayDialog, VET_201008_01_TB_STRING_LIST[2].."/vet_201008_01_make_qiaokelidangao");
        --tinsert(tbSayDialog, VET_201008_01_TB_STRING_LIST[3].."/vet_201008_01_get_limitaward");
    end
    return tbSayDialog, szSayHead;
end

function vet_201008_01_make_qiaokelidangao()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        if GetLevel() < 10 then
            Talk(1,"",VET_201008_01_TB_STRING_LIST[13])
            return
        end
        if gf_Judge_Room_Weight(1,0,"") ~= 1 then
            return
        end
        if GetItemCount(VET_201008_01_TB_ITEM_LIST[1][2],VET_201008_01_TB_ITEM_LIST[1][3],VET_201008_01_TB_ITEM_LIST[1][4]) < 5 or GetItemCount(VET_201008_01_TB_ITEM_LIST[3][2],VET_201008_01_TB_ITEM_LIST[3][3],VET_201008_01_TB_ITEM_LIST[3][4]) < 1 then
            Talk(1,"",VET_201008_01_TB_STRING_LIST[4])
            return
        end
        if DelItem(VET_201008_01_TB_ITEM_LIST[1][2],VET_201008_01_TB_ITEM_LIST[1][3],VET_201008_01_TB_ITEM_LIST[1][4],5) == 1 and DelItem(VET_201008_01_TB_ITEM_LIST[3][2],VET_201008_01_TB_ITEM_LIST[3][3],VET_201008_01_TB_ITEM_LIST[3][4],1) == 1 then
            local tbItemIds = {VET_201008_01_TB_ITEM_LIST[2][2],VET_201008_01_TB_ITEM_LIST[2][3],VET_201008_01_TB_ITEM_LIST[2][4],1}
            gf_AddItemEx2(tbItemIds,VET_201008_01_TB_ITEM_LIST[2][1],VET_201008_01_STR_LOG_TITLE,VET_201008_01_TB_LOG_ACTION_LIST[4],0,1)
        end
    else
        Talk(1,"",VET_201008_01_TB_STRING_LIST[10])
    end
    SelectSay()
end

function vet_201008_01_get_limitaward()
    if gf_CheckEventDateEx(VET_201008_01_EVENT_NUMBER) == 1 then
        local nNumEatCake = GetTask(VET_201008_01_TASK_EAT_QIAOKELIDANGAO)
        if nNumEatCake == nil then
            nNumEatCake = 0
        end
        if nNumEatCake < 2250 then
            Talk(1,"",format(VET_201008_01_TB_STRING_LIST[5],nNumEatCake))
            return
        end
        if GetTask(VET_201008_01_TASK_FLAG_LIMITED_AWARD) == 1 then
            Talk(1,"",VET_201008_01_TB_STRING_LIST[11])
            return
        end
        SetTask(VET_201008_01_TASK_FLAG_LIMITED_AWARD,1)
        gf_EventGiveRandAward(VET_201008_01_QIAOKELIDANGAO_LIMITED_AWARD,10000,1,VET_201008_01_STR_LOG_TITLE,VET_201008_01_TB_LOG_ACTION_LIST[4])
    else
        Talk(1,"",VET_201008_01_TB_STRING_LIST[10])
    end
end

function VET_201008_01_get_exp(nExp)
    local nHaveExp = GetExp()
    if 2000000000 - nHaveExp < nExp then
        nExp = 2000000000 - nHaveExp
    end
    ModifyExp(nExp)
end

--VET_201008_01_TASK_FLAG_LIMITED_AWARD

function give_cake_201008()
	if GetItemCount(2, 1, 30226) < 10 then
		Talk(1,"","Hi謓 kh玭g c?  10 b竛h kem Socola  t苙g!")
		return
	end
	
	local nGiveDate = floor(GetTask(EVENT201008_GIVE_CAKE) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nGiveDate ~= nDate then
		SetTask(EVENT201008_GIVE_CAKE, nDate * 100)
	end
	local nGiveCount = mod(GetTask(EVENT201008_GIVE_CAKE), 100)
	local nCountMax = 3
	if nDate >= 100829 and nDate <= 100905 then
		nCountMax = 10
	end
	if nGiveCount >= nCountMax then
		Talk(1,"","H玬 nay  t苙g b竛h  "..nCountMax.." l莕 r錳, kh玭g th? t苙g th猰 n鱝, ng祔 mai h穣 quay l筰!")
		return
	end
	
	if DelItem(2, 1, 30226, 10) == 1 then
		VET_201008_01_get_exp(2000000)
		Msg2Player("Nh薾 頲 2000000 甶觤 kinh nghi謒!")
		SetTask(EVENT201008_GIVE_CAKE, GetTask(EVENT201008_GIVE_CAKE) + 1)
		gf_WriteLogEx("VET_201008_01_STR_LOG_TITLE", "t苙g b竛h Socola")
	end
end