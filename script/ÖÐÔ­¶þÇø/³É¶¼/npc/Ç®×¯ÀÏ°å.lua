
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 钱庄老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==19) then
	
		Teach_Level07_02()
		
	else
		
		Talk(1,"","M蕐 n╩ nay Th祅h Й bu玭 b竛 � 萴, Ti襫 Trang  ng c鯽, xin h穣 n Bi謓 Kinh  nh薾.");
	
	end
	
	return

end