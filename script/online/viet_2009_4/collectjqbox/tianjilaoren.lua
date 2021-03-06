--=============================================
--create by baiyun 2009.4.12
--describe:越南版4月份金星星银星星活动 天机老人
--=============================================

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\writelog.lua")

--------------------------------------
--main()
--主函数
--------------------------------------
function main()
	----检查活动时间
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Th阨 gian ho箃 ng  h誸.");
		return 0;
	end
	
	Say(
			"Thi猲 C? L穙 Nh﹏: Ta chuy猲 ph? tr竎h c竎 v蕁  n﹏g c蕄 Lam K? th祅h H錸g K?, gh衟 H錸g K? v韎 Ho祅g Kim K? Th筩h",
			4,
			"T筰 h? mu鑞 n﹏g c蕄 Lam K? (C莕 3 Lam K? v? 10 b筩)/JQ_LevelBToRFlag",
			"T筰 h? c莕 gh衟 H錸g K? v韎 Ho祅g Kim Th筩h (nh薾 頲 Ho祅g Kim K? ho芻 B筩h Kim K?)/JQ_GroupRedAndStone",
			"T筰 h? c莕 1 C萴 nang i s? ki謓./JQ_GetJinNang",
			"T筰 h? ch? gh? ngang!/JQ_DoNothing"
		)
end


--------------------------------------
--JQ_LevelBToRFlag()
--把蓝旗升级成红旗
--------------------------------------
function JQ_LevelBToRFlag()
-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(2, 0, "Xin l鏸, ") == 0 then
		return 0
	end
-----钱不够--------	
	if GetCash() < JQ_LEVEL_B_TO_R_FLAG_MONEY then
		Talk(1, "", "Ng﹏ lng c馻 b筺 kh玭g !");
		return 0;
	end

	if DelItem(2, 1, 30081, JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM) ~= 1 then
		Say("Nguy猲 li謚 mang theo kh玭g ", 1, "K誸 th骳 i tho筰/JQ_DoNothing");
		return 0;
	end
	if Pay(JQ_LEVEL_B_TO_R_FLAG_MONEY) ~= 1 then
		WriteLog("[Ho箃 ng thu th藀 hi謚 k? th竛g 4]:" .. GetName() .. "Chi tr?".. JQ_LEVEL_B_TO_R_FLAG_MONEY .. " xu th蕋 b筰");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 75 then --75%的概率得一个红旗
		if AddItem(2, 1, 30080, 1) == 1 then
			Msg2Player("Чi hi謕 nh薾 頲 1 H錸g K?");
			WriteLogEx("Hoat dong thang 4","nh薾 頲",1,"H錸g K?");			
		end
	else
		if AddItem(2, 1, 30081, 2) == 1 then
			Say("Qu? tr譶h n﹏g c蕄 th蕋 b筰, c竎 h? ch? nh薾 l筰 頲 2 Lam K?..", 1, "K誸 th骳 i tho筰/main");
		end
	end
end

--------------------------------------
--JQ_GroupRedAndStone()
--把红旗和黄金石合成白金旗或黄金旗
--------------------------------------
function JQ_GroupRedAndStone()
-----判断背包和负重------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l鏸, ") == 0 then
		return 0;
	end
-----原料不够------------------------------
	if GetItemCount(2, 1, 30080) < 2 or GetItemCount(2, 1, 30082) == 0 then
		Say("Nguy猲 li謚 mang theo kh玭g ", 1, "K誸 th骳 i tho筰/JQ_DoNothing");
		return 0;
	end

	if DelItem(2, 1, 30080, 2) == 1 and DelItem(2, 1, 30082, 1) == 1 then
		local nRand = 0;
		nRand = random(1, 100);
		if nRand == 1 then
			if AddItem(2, 1, 30083, 1) == 1 then
				Msg2Player("B筺 nh薾 頲 " .. "1" .. "c竔" .. "B筩h Kim K?");
				WriteLogEx("Hoat dong thang 4","nh薾 頲",1,"B筩h Kim K?");
			end
		else
			if AddItem(2, 1, 30084, 1) == 1 then
				Msg2Player("B筺 nh薾 頲 " .. "1" .. "c竔" .. "Ho祅g Kim K?");
				WriteLogEx("Hoat dong thang 4","nh薾 頲",1,"Ho祅g Kim K?");
			end
		end	
	end
end

--------------------------------------
--JQ_GetJinNang()
--领取锦囊大事件
--------------------------------------
function JQ_GetJinNang()
	if GetItemCount(2, 1, 30045) ~= 0 then
		Say("C竎 h?  nh薾 C萴 nang i s? ki謓 r錳, kh玭g th? nh薾 th猰 頲 n鱝.", 1, "K誸 th骳 i tho筰!/JQ_DoNothing");
		return 0;	
	else
		-----判断背包和负重------------------------
		if gf_Judge_Room_Weight(1, 1, "Xin l鏸, ") == 0 then
			return 0;
		end
		if AddItem(2, 1, 30045, 1) == 1 then
			Say("Ngi nh﹏ 頲 1 C萴 Nang Чi S? Ki謓.", 1, " t? ti襫 b鑙.!/JQ_DoNothing");
		end
	end
end