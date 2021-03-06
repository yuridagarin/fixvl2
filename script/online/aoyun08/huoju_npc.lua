--圣火传递活动火炬台NPC
--by vivi
--2008/06/02

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

function main()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then  --活动期间内
		if GetTask(TASK_AOYUN_FINAL_AWARD) ~= 0 then --如果已经获取过最终奖励，不鸟他
			return
		end
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then --他是火炬手
			local sNpcName = GetTargetNpcName();
			local nHisNum = GetTask(TASK_AOYUN_HUOJU_NUM); --火炬手编号
--			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --创建一个时间触发器，在一段时间内给予经验奖励			
--				if CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) == 0 then
--					WriteLog("[圣火传递活动]:玩家"..GetName().."火炬台触发器CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID)失败，TIME_TABLE_ID值:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
--					return 0;	--创建失败
--				end;					
--			end
			--加入服装判断
			local nIndex = GetPlayerEquipIndex(10); --获取外装衣服索引
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --获取外装衣服id
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (44+nBody) then
				Talk(1,"","<color=green>Уi 畊鑓<color>: Tham gia ho箃 ng rc Th竛h H醓 c莕 mang <color=yellow>уng ph鬰 ngi rc 畊鑓<color>, nh薾 t筰 Чi s? rc Th竛h H醓.");
				return			
			end			
			if tHuojuName[nHisNum][1] ~= sNpcName and tHuojuName[nHisNum][2] ~= sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>Уi 畊鑓<color>: Th竛h H醓 產ng chuy觧 t韎 trc, xin v? Уi 畊鑓 ch? nh ch? ph莕 thng sau c飊g.");
					return
				else 				
					Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 ph秈 t? <color=yellow>"..tHuojuName[nHisNum][1].."<color> nh薾 Th竛h H醓, chuy觧 n <color=yellow>"..tHuojuName[nHisNum][2].."<color>, <color=yellow>trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n "..tHuojuName[nHisNum][2]..", n誹 kh玭g n ng gi? s? kh玭g 頲 ph莕 thng.");
					return
				end
			elseif tHuojuName[nHisNum][1] == sNpcName then
				if (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) < nHisNum then
					Talk(1,"","<color=green>Уi 畊鑓<color>: ng v閕, v蒼 ch璦 chuy觧 n y m?.");
					return
				elseif (GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM)) > nHisNum then	
					Talk(1,"","<color=green>Уi 畊鑓<color>: Th竛h H醓 產ng chuy觧 t韎 trc, xin v? Уi 畊鑓 ch? nh ch? ph莕 thng sau c飊g.");
					return
				end 
				if GetTask(TASK_AOYUN_GET_SHENGHUO) ~= 0 then
					Talk(1,"","<color=green>Уi 畊鑓<color>: B筺  nh薾 頲 m錳 l鯽, mau chuy觧 n <color=yellow>"..tHuojuName[nHisNum][2].."<color> 甶! <color=yellow>Trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n "..tHuojuName[nHisNum][2]..", n誹 kh玭g n ng gi? s? kh玭g 頲 ph莕 thng.");
					return
				end
				SetTask(TASK_AOYUN_GET_SHENGHUO,GetTime());
				Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 t? "..tHuojuName[nHisNum][1].." nh薾 m錳 l鯽, "..tHuojuName[nHisNum][1].." v? 畊鑓 trong tay th緋 l猲 Th竛h H醓. Mau chuy觧 n <color=yellow>"..tHuojuName[nHisNum][2].."<color> 甶! <color=yellow>Trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n "..tHuojuName[nHisNum][2]..", n誹 kh玭g n ng gi? s? kh玭g 頲 ph莕 thng.");
			elseif tHuojuName[nHisNum][2] == sNpcName then
				if GetTask(TASK_AOYUN_GET_SHENGHUO) == 0 then
					Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 ph秈 c? Th竛h H醓 trc v? <color=yellow>trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n y.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 and GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) > nHisNum then
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());  --存入npc索引，至少给他经验吧
					Talk(1,"","<color=green>Уi 畊鑓<color>: Th藅 ng ti誧, <color=yellow>trc khi Th竛h H醓 Уi b鑓 ch竬<color> ch璦 chuy觧 Th竛h H醓 n y, xin ? y ch? Уi 畊鑓 th辬h th? th緋 s竛g  nh薾 ph莕 thng cu鑙 c飊g.");
					return
				end
				if GetTask(TASK_AOYUN_DIAN_SHENGHUO) == 0 then  --没有领取过
					SetTask(TASK_AOYUN_DIAN_SHENGHUO,1);
--					SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nHisNum); --用玩家编号标记，表示对应的该号火炬台已经点燃
--					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					local nNpcNum = GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM); --第几号台点燃
					local nNpcIdx = GetGlbValue(GLB_AOYUN_NPC_YI+nNpcNum);
					local nNpcName = GetNpcName(nNpcIdx);	
					if tHuojuName[nHisNum][2] == nNpcName then
						if nNpcNum == 0 then
							SetCurrentNpcSFX(nNpcIdx,910,2,1);--点燃	
						elseif nNpcNum == 30 then
							SetCurrentNpcSFX(nNpcIdx,913,2,1);--点燃
						elseif nNpcNum < 30 then
							SetCurrentNpcSFX(nNpcIdx,909,2,1);--点燃
						end
					end			
					--给予奖励
					local nLv = GetLevel();
					local nExp = floor((nLv^3)*15);
					if nLv ~= 99 then
						ModifyExp(nExp);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
					else
						lspf_AddLingShiInBottle(7,1);
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 7,  b? v祇 trong T? Linh nh.");
					end
					if nHisNum ~= 30 then
						Talk(1,"","<color=green>Уi 畊鑓<color>: B筺  chuy觧 th祅h c玭g Th竛h H醓, xin ? y c? v? v? ch? i  nh薾 ph莕 thng c馻 m譶h.");
					else
						Talk(1,"","<color=green>Уi 畊鑓 th辬h th?<color>: B筺 th緋 th祅h c玭g Уi 畊鑓 th辬h th?! Th竛h H醓 ch竬 b鮪g l猲 r錳!");
					end
				else	
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --通过relay设置服务器变量为31
						Talk(1,"","<color=green>Уi 畊鑓<color>: B筺  th緋 Th竛h H醓, xin ? t筰 ch? ch? i Уi Th竛h H醓 Th辬h Th? 頲 th蕄 s竛g  nh薾 thng.");
					else
						--领取最终奖励
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							--删除服装
							if DelItemByIndex(nIndex,-1) == 1 then	
								SetTask(TASK_AOYUN_FINAL_AWARD,1);
								local nLv = GetLevel();
								local nExp = floor((nLv^3)*10);
								if nLv ~= 99 then
									ModifyExp(nExp);
									Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
								else
									local nRand = random(1,100);
									if nRand <= 80 then
										lspf_AddLingShiInBottle(6,1);
										Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 6,  b? v祇 trong T? Linh nh.");
									else
										lspf_AddLingShiInBottle(7,1);
										Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 7,  b? v祇 trong T? Linh nh.");									
									end
								end
							else
								Talk(1,"","<color=green>Уi 畊鑓<color>: B筺g ch璦 trang b? уng ph鬰 ngi rc 畊鑓.");
							end							
						end
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --他是助威者
			local sNpcName = GetTargetNpcName();
			local nZwNum = GetTask(TASK_AOYUN_ZHUWEI_NUM); --助威者编号		
			if GetTrigger(TRIGER_AOYUN_TIME_ID) == 0 then   --创建一个时间触发器，在一段时间内给予经验奖励
				local nTriIdx = CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID);
				if nTriIdx == 0 then
					WriteLog("[Ho箃 ng rc Th竛h H醓]: Ngi ch琲 "..GetName().."Trigger Уi 畊鑓 CreateTrigger(1,TIME_TABLE_ID,TRIGER_AOYUN_TIME_ID) th蕋 b筰, tr? TIME_TABLE_ID:"..TIME_TABLE_ID.."TRIGER_AOYUN_TIME_ID:"..TRIGER_AOYUN_TIME_ID);
					return 0;	--创建失败
				else
					ContinueTimer(nTriIdx);
				end;					
			end				
			if tHuojuName[nZwNum][1] ~= sNpcName then
				Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 kh玭g ph秈 c? v? ? Уi 畊鑓 n祔, h穣 n "..tHuojuName[nZwNum][1]);
			else
				if GetTask(TASK_AOYUN_ZHUWEI_LABA) == 0 then	
					if Zgc_pub_goods_add_chk(1,1) ~= 1 then
						return
					end
					SetTask(TASK_AOYUN_ZHUWEI_LABA,1);
					SetTask(TASK_AOYUN_HUOJU_IDX,GetTargetNpc());
					AddItem(2,1,3378,1); --助威喇叭
				else
					if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) < 31 then   --通过relay设置服务器变量为31
						Talk(1,"","<color=green>Уi 畊鑓<color>: H穣 ? t筰 ch? reo h? c? v?.");
					else
						--领取最终奖励
						if GetTask(TASK_AOYUN_FINAL_AWARD) == 0 then
							SetTask(TASK_AOYUN_FINAL_AWARD,1);
							local nLv = GetLevel();
							local nExp = floor((nLv^3)*5);
							if nLv ~= 99 then
								ModifyExp(nExp);
								Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
							else
								lspf_AddLingShiInBottle(6,1);
								Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 6,  b? v祇 trong T? Linh nh.");
							end							
						end
					end
				end					
			end
		end
	else  --日常活动
		if get_aoyun_state() == 0 then
			Talk(1,"","<color=green>Уi 畊鑓<color>: Ho箃 ng v蒼 ch璦 b総 u.");
		elseif get_aoyun_state() == 2 then
			Talk(1,"","<color=green>Уi 畊鑓<color>: Ho箃 ng  k誸 th骳.");
		else
			--服装检测
			local nIndex = GetPlayerEquipIndex(10); --获取外装衣服索引
			local nId1,nId2,nId3 = GetPlayerEquipInfo(10); --获取外装衣服id
			local nDate = tonumber(date("%Y%m%d"));
			local nBody = GetBody();
			if nId1 ~= 0 or nId2 ~= 105 or nId3 ~= (40+nBody) then
				Talk(1,"","<color=green>Уi 畊鑓<color>: Tham gia ho箃 ng i h閕 t? v? m鮪g Th竛h H醓 c莕 mang <color=yellow>уng ph鬰 rc 畊鑓<color>, c? th? mua t筰 t筽 h鉧.");
				return
			else
				if GetTask(TASK_AOYUN_HUOJU_DATE) >= nDate then
					Talk(1,"","<color=green>Уi 畊鑓<color>: H玬 nay b筺  ch箉 n ho箃 ng i h閕 t? v? m鮪g Th竛h H醓, m鏸 ng祔 ch? c? th? ch箉 1 l莕.");
					return
				else
					if GetTask(TASK_AOYUN_TEMP_NUM) >= 32 or GetTask(TASK_AOYUN_TEMP_NUM) == 0 then
						SetTask(TASK_AOYUN_TEMP_NUM,1);
					end
					local sNpcName = GetTargetNpcName();
					local nHisNum = GetTask(TASK_AOYUN_TEMP_NUM);	
					if tHuojuName[nHisNum][1] ~= sNpcName then
						Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 產ng th緋 kh玭g ng Уi 畊鑓, c莕 th緋 l? "..tHuojuName[nHisNum][1]);
						return
					else
						if nHisNum < 32 then
							SetTask(TASK_AOYUN_TEMP_NUM,nHisNum+1);
							if GetTask(TASK_AOYUN_TEMP_NUM) ~= 32 then	
								Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 th緋 Уi 畊鑓 th祅h c玭g, n "..tHuojuName[nHisNum+1][1].."!");
							else
								if DelItemByIndex(nIndex,-1) == 1 then
									SetTask(TASK_AOYUN_HUOJU_DATE,nDate);
									local nLv = GetLevel();
									local nExp = floor((nLv^3)*5);
									if nLv ~= 99 then
										ModifyExp(nExp);
										Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nExp.."Kinh nghi謒");
									else
										local nRand = random(1,100);
										if nRand <= 85 then
											lspf_AddLingShiInBottle(5,1);
											Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 5,  b? v祇 trong T? Linh жnh.");
										elseif nRand <= 95 then
											lspf_AddLingShiInBottle(6,1);
											Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 6,  b? v祇 trong T? Linh nh.");
										else
											lspf_AddLingShiInBottle(7,1);
											Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Linh th筩h c蕄 7,  b? v祇 trong T? Linh nh.");									
										end
									end
								else
									Talk(1,"","<color=green>Уi 畊鑓<color>: B筺 ch璦 trang b? <color=yellow>уng ph鬰 rc 畊鑓<color>.");
								end
							end
						end
					end 	 
				end
			end
		end
	end	
end

function OnTimer()
	if GetGlbValue(GLB_AOYUN_TIME_STATE) ~= 0 then
		local nLv = GetLevel();
		if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then  --火炬手奖励
			--加入距离判断
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*10);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end
			end
		elseif GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then  --助威者奖励
			local nNpcIdx = GetTask(TASK_AOYUN_HUOJU_IDX);
			local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
			local nMapId,nPlayerX,nPlayerY = GetWorldPos();	
			local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
			if nDistance < 40 then			
				if nLv ~= 99 then
					local nExp = floor((nLv^2)*6);
					ModifyExp(nExp);
				else
					local nRand = random(1,100);
					if nRand <= 20 then
						aoyun_baoshi_prob();
					end
				end	
			end		
		end
	else
		if GetTask(547) ~= 0 and GetTrigger(TRIGER_AOYUN_TIME_ID) ~= 0 then
			RemoveTrigger(GetTrigger(TRIGER_AOYUN_TIME_ID));  --删除触发器
		end
	end 
end