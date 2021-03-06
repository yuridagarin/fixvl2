--08新年小圣诞树npc脚本
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function main()
	local npcTreeIndex = GetTargetNpc();
	if GetTime()-GetTask(TASK_PLANT_TIME) > PLANT_LIFE_TIME or GetTask(TASK_PLANT_TIME) == 0 or npcTreeIndex ~= GetTask(TASK_CHRIMS_TREE_IDX) then
		Msg2Player("Зy kh玭g ph秈 c﹜ th玭g c馻 ngi");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FINAL_AWARD) >= nDate then --防止跨服领了最终奖励还能再领
		return
	end
	local strtab = {
		"Trang tr? c﹜ th玭g/strew_chrims_tree",
		"Nh薾 ph莕 thng trang tr? c﹜ th玭g./get_chrims_award",
		"Nh薾 qu? gi竛g sinh/get_final_award",
		"Nh薾 c﹜ th玭g/take_chrims_tree",
		"Xin i gi﹜ l竧 r錳 n xem th?/nothing"
		};
	Say("C﹜ th玭g n祔 r蕋 p, b筺 mu鑞?",
		getn(strtab),
		strtab);
end

function strew_chrims_tree()
	if GetTask(TASK_TREE_NUM) >= STREW_TREE_TOTAL then
		Talk(1,"main","C﹜ th玭g n祔 p r錳 kh玭g c莕 trang tr?.");
		return
	end
	local strtab1 = {
		"Nh薾 nhi謒 v? trang tr? c﹜ th玭g/get_chrims_task",
		"Quay u xem th?/nothing"
		};
	local strtab2 = {
		"Ta mu鑞 trang tr? c﹜ th玭g/finish_chrims_task",
		"Ta th? t譵 l筰/nothing"
		};	
	local nNum = GetTask(TASK_TREE_NUM); --第几次任务
	local nRand = GetTask(TASK_TABLE_IDX);
	if GetTask(TASK_IS_STREW) == 0 then
		if nNum ~= 0 and GetBit(GetTask(TASK_STEP_AWARD),nNum) == 0 then  --上一次装饰任务未领取奖励不给接新的任务
			Talk(1,"","B筺 th蕐 頲 tr猲 c﹜ th玭g c? 1 玭g gi? ci v韎 b筺, ch? v祇 h閜 qu? tr猲 c﹜, nh? mu鑞 b筺 sau khi nh薾 <color=yellow>ph莕 thng trang tr? c﹜ th玭g<color> n xem th?");
		else 
			Say("B筺 th蕐 c﹜ th玭g ch璦 ho祅 m?, mu鑞 trang tr? l筰. Mu鑞 xem l筰? B筺  trang tr? xong<color=yellow>"..nNum.."<color> l莕 c﹜ th玭g, c? th? trang tr? l筰 <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l莕.",
				getn(strtab1),
				strtab1);
		end
	else
		Say("B筺 mu鑞 d飊g <color=yellow>"..tStrewTask[nRand][1].."c竔"..tStrewTask[nRand][2].." <color>  trang tr? c﹜ th玭g? Lo筰 n祔 ch? c? ? <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B筺  trang tr? xong <color=yellow>"..nNum.."<color> l莕 c﹜ th玭g, c? th? trang tr? l筰 <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l莕.",
			getn(strtab2),
			strtab2);	
	end
end

function get_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = random(1,getn(tStrewTask));
	SetTask(TASK_IS_STREW,1);
	SetTask(TASK_TABLE_IDX,nRand);
	Talk(1,"","B筺 ch蕄 nh薾 nhi謒 v? trang tr? c﹜ th玭g, c莕 d飊g <color=yellow>"..tStrewTask[nRand][1].."c竔"..tStrewTask[nRand][2].." <color>  trang tr?, lo筰 n祔 ch? c? ? ch? c? ? <color=yellow> "..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B筺  trang tr? xong <color=yellow>"..nNum.."<color> l莕 c﹜ th玭g, c? th? trang tr? l筰 <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l莕.");
end

function finish_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = GetTask(TASK_TABLE_IDX);
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local MapID,MapX,MapY = GetWorldPos();
	if GetItemCount(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5]) < tStrewTask[nRand][1] then
		Talk(1,"","B筺 kh玭g c? <color=yellow>"..tStrewTask[nRand][1].."c竔"..tStrewTask[nRand][2].."<color>, lo筰 n祔 ch? c? ? <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>, nhanh ch鉵g 甶 t譵 th?. B筺  trang tr? xong <color=yellow>"..nNum.."<color> l莕 c﹜ th玭g, c? th? trang tr? l筰 <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l莕.");
	else
		if DelItem(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5],tStrewTask[nRand][1]) == 1 then
			SetTask(TASK_TREE_NUM,GetTask(TASK_TREE_NUM)+1);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TABLE_IDX,0);
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			local nSharpIdx = random(1,4);
			SetTask(TASK_SHARP_IDX,nSharpIdx)
			local npcTreeIndex = CreateNpc(tTreeNpc[nNum+1][nSharpIdx][1],GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2],MapID,MapX,MapY);
			if npcTreeIndex == 0 then
				WriteLog("[C﹜ th玭g n╩ m韎 08 b? l鏸]:"..GetName().."Khi t c﹜ th玭g v祇, CreateNpc tr? h祄 s? quay l筰 l? 0, trong h祄 s? CreateNpc tham s? nh藀 v祇 l?:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
			end;
			SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
			SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
			SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");			
			Talk(1,"","Sau khi <color=yellow>"..tStrewTask[nRand][2].."<color> trang tr? xong, qu? l? tuy謙 p. B筺  trang tr? xong <color=yellow>"..(nNum+1).."<color> l莕 c﹜ th玭g, c? th? trang tr? l筰 <color=yellow>"..(STREW_TREE_TOTAL-nNum-1).."<color> l莕.");
		end
	end
end

function get_chrims_award()
	local nLv = GetLevel();
	local nNum = GetTask(TASK_TREE_NUM);
	if nNum == 0 then
		Talk(1,"","B筺 v蒼 ch璦 trang tr? c﹜ th玭g?");
		return
	end
	local nExp = floor((tChrimsExp[nNum]*nLv^3)/(80^3));	
	if GetBit(GetTask(TASK_STEP_AWARD),nNum) ~= 0 then
		Talk(1,"","B筺  nh薾 qu? trang tr? l莕 n祔. 1");
	else
		--99级改为一样给予经验
		if nLv ~= 999 then
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.."Kinh nghi謒");
		else
			if Zgc_pub_goods_add_chk(tChrimsLingshi[nNum][3],tChrimsLingshi[nNum][3]) ~= 1 then
				return
			end
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));			
			for i = 1,tChrimsLingshi[nNum][3] do
				local nRand = random(tChrimsLingshi[nNum][1],tChrimsLingshi[nNum][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T? Linh жnh.");
			end
		end
	end
end

function take_chrims_tree()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	SetTask(TASK_IS_PLANT,0);
	SetTask(TASK_PLANT_TIME,0);
	SetNpcLifeTime(nIdx,0);
	SetNpcScript(nIdx,"");
	Talk(1,"","B筺  nh薾 c﹜ th玭g, c? th? trang tr? ho芻 nh薾 qu? b蕋 c? l骳 n祇.");
end

function get_final_award()
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	if nNum == 0 then
		if nLv >= 70 then
			Say("B筺 ch璦 trang tr? c﹜ th玭g, qu? ng蓇 nhi猲 nh薾 頲 l?"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (c蕄) Linh Th筩h"..tChrimsLingshi[11][3].." , c﹜ th玭g s? bi課 m蕋. B筺 ch蕄 nh薾?",
				2,
				"уng ?/confirm_get_award",
				"Ta ch鋘 sai r錳!/main");
		else
			Talk(1,"","B筺 ch璦 trang tr? c﹜ th玭g, ng c蕄 kh玭g  c蕄 70, kh玭g c? qu? qu? gi竛g sinh.");
			return
		end			
	elseif nNum < STREW_TREE_TOTAL then
		if nLv ~= 999 then
			Say("B筺 v蒼 ch璦 trang tr? xong c﹜ th玭g, qu? gi竛g sinh nh薾 頲 l? <color=yellow>"..floor(nExp*nNum/STREW_TREE_TOTAL).." <color> kinh nghi謒, c﹜ th玭g s? bi課 m蕋. B筺 ch蕄 nh薾 qu? cu鑙 c飊g?",
				2,
				"уng ?/get_middle_award",
				"Ta ch鋘 sai r錳!/main");
		else
			Say("B筺 v蒼 ch璦 trang tr? xong c﹜ th玭g, qu? ng蓇 nhi猲 nh薾 頲 l?"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (c蕄) Linh Th筩h"..tChrimsLingshi[11][3].." , c﹜ th玭g s? bi課 m蕋. B筺 ch蕄 nh薾?",
				2,
				"уng ?/confirm_get_award",
				"Ta ch鋘 sai r錳!/main");
		end			
	elseif nNum >= STREW_TREE_TOTAL then
		if nLv == 999 then
			Say("C﹜ th玭g n祔 r蕋 ho祅 m?, qu? gi竛g sinh ng蓇 nhi猲 nh薾 頲 l?"..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (c蕄) Linh Th筩h"..tChrimsLingshi[13][3].." , 1 tu莕 l閏 gi竛g sinh, 1 ngo筰 trang v? V? L﹎ B秓 觧, nh薾 xong c﹜ th玭g s? bi課 m蕋. Sao h??",
				2,
				"уng ?/get_last_award",
				"Ta ch鋘 sai r錳!/main");
		else  --免费区为经验
			Say("C﹜ th玭g n祔  ho祅 m?, qu? gi竛g sinh nh薾 頲 <color=yellow>"..nExp.." <color>kinh nghi謒, "..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (c蕄) Linh Th筩h"..tChrimsLingshi[13][3].." ng蓇 nhi猲, 1 tu莕 l閏 gi竛g sinh, 1 ngo筰 trang V? L﹎ B秓 觧, sau khi nh薾 c﹜ th玭g s? bi課 m蕋. B筺 ch蕄 nh薾 m鉵 qu? cu鑙 c飊g n祔?",
				2,
				"уng ?/get_last_award",
				"Ta ch鋘 sai r錳!/main");
		end			
	end		
end

function confirm_get_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --防止跨服领了最终奖励还能再领
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --初始化TASK_PLANT_NUM变量格式
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --今天种第2棵
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --获取今天种了第几棵树
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		if nLv ~= 999 then	
			for i = 1,tChrimsLingshi[11][3] do
				local nRand = random(tChrimsLingshi[11][1],tChrimsLingshi[11][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T? Linh жnh.");
			end
		else
			for i = 1,tChrimsLingshi[12][3] do
				local nRand = random(tChrimsLingshi[12][1],tChrimsLingshi[12][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T? Linh жnh.");
			end
		end			
	else
		Talk(1,"","B筺 kh玭g c? c﹜ th玭g.");
	end
end	

function get_last_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nBody = GetBody();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --防止跨服领了最终奖励还能再领
		return
	end	
	if Zgc_pub_goods_add_chk(4,4) ~= 1 then
		return
	end	
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nLsNum = tChrimsLingshi[13][3];
	local nRandom = random(1,100);
	if nRandom <= 5 then
		nExp = nExp*2;
		nLsNum = nLsNum*2;
	end
	if nLv ~= 999 then
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --初始化TASK_PLANT_NUM变量格式
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --今天种第2棵
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --获取今天种了第几棵树
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			ModifyExp(nExp);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒!");
			for i = 1,nLsNum do
				local nRand = random(1,1000);
				local nLsLv = 0;
				if nRand <= 895 then
					nLsLv = 5;
				elseif nRand <= 995 then
					nLsLv = 6;
				else
					nLsLv = 7;
				end
				lspf_AddLingShiInBottle(nLsLv,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nLsLv.." (c蕄) Linh th筩h,  頲 cho v祇 T? Linh жnh.");
			end				
			if nRandom <= 5 then
				Msg2Global("Ngi ch琲"..GetName().."Ch骳 m鮪g b筺  nh薾 頲 X璶g hi謚 ng玦 sao gi竛g sinh"..nExp.." 甶觤 kinh nghi謒 v? 4 Linh th筩h c蕄 1-7!");
			end
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --圣诞鹿
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --设置物品存在时间，单位：s
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1tu莕 l閏 gi竛g sinh ");
			else
				WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."Nh薾 tu莕 l閏 gi竛g sinh th蕋 b筰, v? tr? th蕋 b筰:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 V? L﹎ B秓 觧");
					Msg2Global("Ngi ch琲"..GetName().."Trong ho箃 ng gi竛g sinh, trang tr? c﹜ th玭g tuy謙 p. Nh薾 頲 1 V? L﹎ B秓 觧. Xin ch骳 m鮪g!");
				else		
					WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."Nh薾 V? L﹎ B秓 觧 th蕋 b筰, v? tr? th蕋 b筰:"..add_flag2);
				end
			end				
		else
			Talk(1,"","B筺 kh玭g c? c﹜ th玭g.");
		end
	else
		if Zgc_pub_goods_add_chk(4,4) ~= 1 then
			return
		end		
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --初始化TASK_PLANT_NUM变量格式
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --今天种第2棵
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --获取今天种了第几棵树
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			for i = 1,nLsNum do
				local nRand = random(tChrimsLingshi[13][1],tChrimsLingshi[13][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nRand.." (c蕄) Linh th筩h,  頲 cho v祇 T? Linh жnh.");
			end					
			if nRandom <= 5 then
				Msg2Global("Ngi ch琲"..GetName().."Trang s鴆 c﹜ gi竛g sinh p qu?, ch骳 m鮪g anh ta nh薾 頲 danh hi謚 Ng玦 sao gi竛g sinh v? 4 vi猲 Linh th筩h c蕄 5-7!");
			end	
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --圣诞鹿
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --设置物品存在时间，单位：s
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1tu莕 l閏 gi竛g sinh ");
			else
				WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."Nh薾 tu莕 l閏 gi竛g sinh th蕋 b筰, v? tr? th蕋 b筰:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 V? L﹎ B秓 觧");
					Msg2Global("Ngi ch琲"..GetName().."Trong ho箃 ng gi竛g sinh, trang tr? c﹜ th玭g tuy謙 p. Nh薾 頲 1 V? L﹎ B秓 觧. Xin ch骳 m鮪g!");
				else		
					WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."Nh薾 V? L﹎ B秓 觧 th蕋 b筰, v? tr? th蕋 b筰:"..add_flag2);
				end
			end	
		else
			Talk(1,"","B筺 kh玭g c? c﹜ th玭g.");
		end
	end	
end
function get_middle_award()
  local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nGiveExp = floor(nExp*nNum/STREW_TREE_TOTAL);
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --防止跨服领了最终奖励还能再领
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --初始化TASK_PLANT_NUM变量格式
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --今天种第2棵
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --获取今天种了第几棵树
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		ModifyExp(nGiveExp);
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nGiveExp.."Kinh nghi謒");	
	else
		Talk(1,"","B筺 kh玭g c? c﹜ th玭g.");
	end					
end
