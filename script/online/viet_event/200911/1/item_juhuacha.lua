--=============================================
--create by baiyun 2009.10.14
--describe:越南版11月份活动 菊花茶脚本文件
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091213 then
		Talk(1, "", "V藅 ph萴  h誸 h筺 s? d鬾g.");
		return 0;
	end

	if GetTask(VIET_0911_TASK_JUHUACHA_COUNT) >= VIET_0911_JUHUACHA_MAX_COUNT then
		Talk(1, "", "Чi hi謕  s? d鬾g tr? hoa c骳 t n kinh nghi謒 cao nh蕋, kh玭g th? ti誴 t鬰 s? d鬾g tr? hoa c骳 n鱝.");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(125000);
		WriteLogEx(VIET_0911_LOG_TITLE,"Tr? Hoa C骳",125000,"甶觤 kinh nghi謒")
		SetTask(VIET_0911_TASK_JUHUACHA_COUNT, GetTask(VIET_0911_TASK_JUHUACHA_COUNT) + 1);
		--给物品奖励		
		if mod(GetTask(VIET_0911_TASK_JUHUACHA_COUNT),50) == 0 then
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD_2, 1000000, 1);
			local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD_2[nRand][3], tbVIET_0911_JUHUACHA_AWARD_2[nRand][1]);
			WriteLogEx(VIET_0911_LOG_TITLE,"Tr? Hoa C骳",1,tbVIET_0911_JUHUACHA_AWARD_2[nRand][1])
			if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD_2[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD_2[nRand][4]);
			end
		else			
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD, 1000000, 19);
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			if nRand == 18 then
				ModifyReputation(2, 0);
				Msg2Player("B筺 nh薾 頲 2 甶觤 Danh v鋘g.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr? Hoa C骳",2,"甶觤 danh v鋘g")
			elseif nRand == 19 then
				SetTask(336, GetTask(336) + 2);
				Msg2Player("B筺 nh薾 頲 2 甶觤 S? m玭.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr? Hoa C骳",2,"甶觤 s? m玭")
			else
				local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD[nRand][3], tbVIET_0911_JUHUACHA_AWARD[nRand][1]);
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr? Hoa C骳",1,tbVIET_0911_JUHUACHA_AWARD[nRand][1])
				if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD[nRand][4] ~= 0 then
					SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD[nRand][4]);
				end
				gf_SetLogCaption("");
			end
		end
	end
end