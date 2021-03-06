--file name:niulang_zhinv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动，牛郎织女脚本
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nDate = tonumber(date("%y%m%d"));
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetTask(TASK_GOTPRESENT_DATE) >= nDate then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H玬 nay b筺  nh薾 ph莕 thng*2 t譶h nh﹏ trong thi猲 h? b猲 nhau m穒 m穒.");
		return 0;
	end;
	if GetTask(TASK_PLANTSTAR_DATE) == nDate then
		local selTab = {
				"Ta mu鑞 nh薾 l? ph萴/get_award_confirm",
				"Ta n  ch骳 m鮪g/nothing",
				}
		Say("<color=green>"..sNpcName.."<color>: Ch骳 c竎 i t譶h nh﹏ trong thi猲 h? m穒 m穒 b猲 nhau. Ch髇g t玦 c? chu萵 b? 1 m鉵 qu? nh?, xin h穣 nh薾 l蕐.",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ch骳 c竎 i t譶h nh﹏ trong thi猲 h? m穒 m穒 b猲 nhau.");
	end;
end;

function get_award_confirm()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	local selTab = {
				"уng ?/give_award",
				"Ta s? quay l筰 sau/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>:"..tSexName[GetSex()].."h穣 x竎 nh薾 ch? tr鑞g trong h祅h trang v? s鴆 l鵦 c遪   tr竛h t鎛 th蕋 nh ti誧, b筺 x竎 nh薾 mu鑞 nh薾 ph莕 thng?",getn(selTab),selTab);
end;

function give_award()
	local nDate = tonumber(date("%y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	local nLevel = 0;
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if Is_Lovers_Team() == 1 then
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TASK_GOTPRESENT_DATE) < nDate and GetTask(TASK_PLANTSTAR_DATE) == nDate then	--如果领取过了的或没点亮过星星的就不给了
				give_expiation_award();
				SetTask(TASK_GOTPRESENT_DATE,nDate);
				ModifyGoldenExp(700000);
				Msg2Player("B筺 nh薾 頲 700000 甶觤 s鴆 kh醗");
				ModifyReputation(15,0);
				nLevel = GetLevel();
				if nLevel < 30 then
					give_random_page(20);
				elseif nLevel < 40 then
					give_random_page(30);				
				elseif nLevel < 50 then
					give_random_page(75);
				else
					give_random_page(100);
				end;
				if GetLevel() < 50 then
					AddItem(2,2,7,8)
					Msg2Player("B筺 nh薾 頲 8 m秐h Thi猲 th筩h");
				else
					AddItem(2,2,8,8)
					Msg2Player("B筺 nh薾 頲 8 Thi猲 th筩h");		
				end;
				WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Х nh薾 ph莕 thng song nh﹏ Ng璾 Lang Ch鴆 N?");
				Talk(1,"","<color=green>"..sNpcName.."<color>: Ch骳 c竎 i t譶h nh﹏ trong thi猲 h? m穒 m穒 b猲 nhau.");
			else
				Msg2Player("H玬 nay b筺  nh薾 qua ph莕 thng ho芻 qu猲 ch璦 th緋 s竛g sao, b筺 kh玭g th? nh薾 ph莕 thng.")
			end;
		end;
		PlayerIndex = nOldPlayerIndex;
	else
		give_expiation_award();
		SetTask(TASK_GOTPRESENT_DATE,nDate);
		ModifyGoldenExp(500000);
		Msg2Player("B筺 nh薾 頲 500000 甶觤 s鴆 kh醗");
		ModifyReputation(10,0);
		if GetLevel() < 50 then
			AddItem(2,2,7,5)
			Msg2Player("B筺 nh薾 頲 5 m秐h Thi猲 th筩h");
		else
			AddItem(2,2,8,5)
			Msg2Player("B筺 nh薾 頲 5 Thi猲 th筩h");		
		end;
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Х nh薾 ph莕 thng c? nh﹏ ho箃 ng Th蕋 T辌h-Ng璾 Lang Ch鴆 N?");
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ch骳 c竎 i t譶h nh﹏ trong thi猲 h? m穒 m穒 b猲 nhau.");
	end;
end;

tSpecialPage = {10,18,29,43,52,70,78,88,99,114,128,137,147,167}	--特殊诀要详细类别
tNormalPage = {1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,31,32,
			   33,34,35,36,37,38,39,40,41,42,44,45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,
			   61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,79,80,81,82,83,84,85,86,87,89,
			   90,91,92,93,94,95,96,97,98,100,101,102,103,104,105,106,107,108,109,110,111,112,
			   113,115,116,117,118,119,120,121,122,123,124,125,126,127,129,130,131,132,133,134,
			   135,136,138,139,140,141,142,143,144,145,146,148,149,150,151,152,153,154,155,156,
			   157,158,159,160,161,162,163,164,165,166,168}
function give_random_page(nProbability)
	local nRandomNum = random(1,100);
	if nRandomNum <= nProbability then
		nRandomNum = random(1,322);
		if nRandomNum <= 14 then
			AddItem(2,6,tSpecialPage[random(1,getn(tSpecialPage))],1);
		else
			AddItem(2,6,tNormalPage[random(1,getn(tNormalPage))],1);
		end;
		Msg2Player("B筺 nh薾 頲 1 quy觧 b? ki誴");
	end;
end;

function give_expiation_award()
	if GetTask(TASK_EXPIATION_AWARD) == 1 then
		return 0;
	end;
	SetTask(TASK_EXPIATION_AWARD,1);
	local nMultiple = 0;
	local nPlantCount = GetTask(TASK_PLANT_STAR_COUNT);
	if nPlantCount == 1 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 1;
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		nMultiple = 1
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 2
	end;
	if nMultiple == 0 then
		return 0;
	end;
	for i=1,nMultiple do
		ModifyGoldenExp(700000);
		Msg2Player("B筺 nh薾 頲 700000 甶觤 s鴆 kh醗");
		ModifyReputation(15,0);
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		if GetLevel() < 50 then
			AddItem(2,2,7,8)
			Msg2Player("B筺 nh薾 頲 8 m秐h Thi猲 th筩h");
		else
			AddItem(2,2,8,8)
			Msg2Player("B筺 nh薾 頲 8 Thi猲 th筩h");		
		end;
	end;
	WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."Х nh薾 ph莕 thng b錳 thng ho箃 ng Th蕋 T辌h, b閕 s?:"..nMultiple);
	local sNpcName = GetTargetNpcName();
	Say("<color=green>"..sNpcName.."<color>: Do 2 ng祔 28 v? 29 c? ch髏 tr鬰 tr芻, ch髇g t玦 quy誸 nh b錳 thng ph莕 thng 2 ng祔 n祔 cho b筺, xin h穣 th玭g c秏.",0);
end;