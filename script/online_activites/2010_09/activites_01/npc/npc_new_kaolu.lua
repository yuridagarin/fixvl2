--=============================================
--create by zhangming 2010.8.20
--describe:越南版2010年9月中秋活动 烤炉脚本文件
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

function main()
    local nNpcIndex = GetTargetNpc()
    local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    end
    
    local nLastTime = GetTask(VET_201009_01_TASK_KAOLU_TIME) 
    local nTimeNow = GetTime()
    if nTimeNow - nLastTime < 30 then
    		local nDiff = 30 - (nTimeNow - nLastTime)
    		Talk(1,"","C遪 "..nDiff.." gi﹜ n鱝 m韎 c? th? l蕐 b竛h ra kh醝 l?!")
    		return
    end
    Say("B竛h  ch輓 v鮝 , mau l蕐 ra k蝟 kh衪 b竛h!",2,format("Mau l蕐 b竛h/#get_cake(%d)",nNpcIndex),"T筸 th阨 ch璦 l蕐/gf_DoNothing")
end


function get_cake(nNpcIndex)
	SetNpcScript(nNpcIndex,"")
	SetNpcLifeTime(nNpcIndex, 0)
	local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    	if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    	end	
    	AddUnitStates(nNpcIndex, 6, 1)
    	SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,0)
	gf_AddItemEx2({2, 1,30237, 20},VET_201009_01_TB_ITEM_LIST[1][1],VET_201009_01_STR_LOG_TITLE, "nh薾 b竛h Th? con nng b竛h",0,1)
end