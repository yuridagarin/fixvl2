--File name:	ginseng_item.lua
--Describe:		万年人参脚本
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

Include("\\script\\lib\\writelog.lua")

TASK_ID_GINSENG_NUM = 2129
TASK_ID_GINSENG_DATE = 2130
GINSENG_GIVE_EXP = 5000000

g_szLogTitle = "Nh﹏ S﹎ V筺 N╩"

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m"))
	if GetTask(TASK_ID_GINSENG_DATE) < nDate then
		SetTask(TASK_ID_GINSENG_DATE, nDate)
		SetTask(TASK_ID_GINSENG_NUM, 0)
	end

	if GetTask(TASK_ID_GINSENG_NUM) >= 100 then
		Talk(1,"","M鏸 nh﹏ v藅 ch? c? th? s? d鬾g t鑙 產 100 Nh﹏ S﹎ V筺 N╩ trong 1 th竛g")
		return
	end

	if GetLevel() < 60 then
		Talk(1,"","Ъng c蕄 kh玭g .")
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		local szItemName = "Kinh nghi謒"
		local nItemNum = GINSENG_GIVE_EXP
		local szInfoDescribe = format("ModifyExp(%d)", nItemNum)
		ModifyExp(nItemNum)
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." "..szItemName)
		SetTask(TASK_ID_GINSENG_NUM, (GetTask(TASK_ID_GINSENG_NUM) + 1))
		WriteLogEx(g_szLogTitle, "Nh薾 頲", nItemNum, szItemName, szInfoDescribe, GetTongName() )
	end
end
