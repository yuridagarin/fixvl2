--08奥运活动猜数字npc
--创建日期：08-07-16
--创建人：陈墨仙^_^
Include("\\script\\online\\qixi08\\guess\\function.lua");

guess_tb_num = {}

function aoyun_guess_main()
	local szTemp,nTemp;
	szTemp = "0";
	nTemp = -1;
	szTemp,nTemp = QX08_GetTodayGame();
	if nTemp ~= GAME_ID_GUESS then
			Talk(1,"",g_szInfoHead.."H玬 nay <color=yellow>"..szTemp.."<color>ho箃 ng b総 u, th藅 th? v?.");
			return
	end;
	
	if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
		SetTask(TSK_AOYUN_GUESS_TURN,0);
		SetTask(TSK_AOYUN_GUESS_BEST,0);
		SetTask(TSK_AOYUN_GUESS_TIMES,0);
		SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
		SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
		SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
	elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--……这里不用写，也不清空，防止服务器时间不同引起的问题。
	end
	local selTab = {
		"Ta mu鑞 b総 y tr薾 u/guess_start",
		"quy t綾 Thi猲 C? Th莕 To竛/guess_rule",
		"Ta n nh薾 ph莕 thng H? R閚 R祅g - Vui Ng藀 Tr祅/guess_prize",
		"S? quay l筰 sau/nothing"
	}
	Say(g_szInfoHead.."Hoan ngh猲h tham gia ho箃 ng Thi猲 C? Th莕 To竛!",getn(selTab),selTab)
end

--结束对话
function nothing()
end

--确认猜数字游戏是否开始
function guess_start()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"",g_szInfoHead.."Th阨 gian ho箃 ng l? <color=yellow>9h s竛g n 11h m<color>, ngi nh? k? nh?.");
		return 0;
	end;
	if GetLevel() <= 30 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l鏸, ng c蕄 c馻 ngi qu? th蕄, r蘮 luy謓 th猰 r錳 h絥 n.");
	
	else
--		--门票
--		if GetItemCount(2,0,1069) > 0 then
--			if DelItem(2,0,1069,1) ~= 1 then
--				WriteLog("奥运活动："..GetName().."删除天下第一比武大会邀请函失败！");
--				Talk(1,"aoyun_guess_main",g_szInfoHead.."请确认你身上带有足够的天下第一比武大会邀请函！");
--				return
--			end;
--		else
--			Talk(1,"aoyun_guess_main",g_szInfoHead.."请确认你身上带有足够的天下第一比武大会邀请函！");
--			return
--		end;
		--如果隔了一天，清零
		if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
			SetTask(TSK_AOYUN_GUESS_TURN,0);
			SetTask(TSK_AOYUN_GUESS_BEST,0);
			SetTask(TSK_AOYUN_GUESS_TIMES,0);
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
			SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
			SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
		elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--……
		end
		--初始化任务变量
		SetTask(TSK_AOYUN_GUESS_TURN,1)
		--设置随机数
		guess_tb_num[GetName()] = random(0,100);
		local selTab = {
			"B総 u 畂竛/guess_comfirm",
			--"取消/main"
		}

		Say(g_szInfoHead.."Л頲 r錳, m鋓 th?  chu萵 b? s絥 s祅g, b総 u m th玦.",getn(selTab),selTab);
	end
end

--确认玩家猜的数字
function guess_comfirm()
	AskClientForNumber("guess_num_confirm",0,100,"H穣 nh藀 s? v祇");
end

function guess_num_confirm(nCount)
	--增加轮次
	local nTempTurn = 0;
	SetTask(TSK_AOYUN_GUESS_TURN,GetTask(TSK_AOYUN_GUESS_TURN) + 1);
	nTempTurn = GetTask(TSK_AOYUN_GUESS_TURN);
	if nTempTurn > 6 or (nTempTurn == 6 and nCount ~= guess_tb_num[GetName()]) then
		--超过5次了
		SetTask(TSK_AOYUN_GUESS_TIMES,0);--连续猜中数清零
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l鏸, b筺  畂竛 sai 5 l莕. Цp 竛 ch輓h x竎 l? "..guess_tb_num[GetName()]);
		return
	end
	if nCount == guess_tb_num[GetName()] and nTempTurn <= 6 then
		--猜对了
		if GetTask(TSK_AOYUN_GUESS_BEST) > nTempTurn - 1 or GetTask(TSK_AOYUN_GUESS_BEST) == 0 then
			--刷新最好成绩
			SetTask(TSK_AOYUN_GUESS_BEST,nTempTurn - 1);
		end
		SetTask(TSK_AOYUN_GUESS_TIMES,GetTask(TSK_AOYUN_GUESS_TIMES) + 1)
		if GetTask(TSK_AOYUN_GUESS_TIMES) >= 10 and GetTask(TSK_AOYUN_GUESS_TIMES) > GetTask(TSK_AOYUN_GUESS_BCOMPLETED) then
			--连续猜中10次以上
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,GetTask(TSK_AOYUN_GUESS_TIMES));--记录曾经连续猜中十次以上
		end
		local szTemp;
		szTemp = "ng r錳!";
		if nTempTurn <= 3 then
			szTemp = "C竎 h? thi猲 t? b蕋 ph祄, sau n祔 総 s? n猲 nghi謕 l韓!";
		elseif nTempTurn <= 4 then
			szTemp = "Kh? khen kh? khen, i hi謕 qu? l? v╪ v? song to祅!";
		else
			szTemp = "Ch骳 m鮪g b筺,  畂竛 ng!";
		end
		Say(g_szInfoHead..szTemp.."Цp 竛 ch輓h x竎 l? "..guess_tb_num[GetName()].."!",1,"tr? l筰/aoyun_guess_main");
		
	else
	--玩家猜的数字比系统指定数字大50以上	大太多了，继续努力！	
	--玩家猜的数字比系统指定数字大30－50	有点太大了哦，加油！	
	--玩家猜的数字比系统指定数字大10－30	有点接近了，不过还是大了点。	
	--玩家猜的数字比系统指定数字大10以下	好紧张啊，大了一点点，快要中了！	
	--玩家猜的数字比系统指定数字小50以上	小太多了，怎么可能就那么小？	
	--玩家猜的数字比系统指定数字小30－50	有点太小了哦，加油！	
	--玩家猜的数字比系统指定数字小10－30	有点接近了，不过还是小了点。	
	--玩家猜的数字比系统指定数字小10以下	好紧张啊,小了一点点，快要中了！
		local szTemp2;
		szTemp2 = "Sai";
		if nCount - guess_tb_num[GetName()] > 50 then
			szTemp2 = "Ch璦 ch輓h x竎, c? g緉g l猲!";
		elseif nCount - guess_tb_num[GetName()] > 30 then
			szTemp2 = "Ch璦 ch輓h x竎, c? g緉g l猲!";
		elseif nCount - guess_tb_num[GetName()] > 10 then
			szTemp2 = "竛 s緋 ng r錳, l韓 m閠 ch髏 n鱝.";
		elseif nCount - guess_tb_num[GetName()] > 0 then
			szTemp2 = "C╪g th糿g qu?, l韓 m閠 ch髏, s緋 tr髇g r錳!";
		elseif nCount - guess_tb_num[GetName()] < -50 then
			szTemp2 = "Nh? qu?, sao l筰 nh? nh? th? 頲?";
		elseif nCount - guess_tb_num[GetName()] < -30 then
			szTemp2 = "Qu? nh? r錳, c? l猲!"
		elseif nCount - guess_tb_num[GetName()] < -10 then
			szTemp2 = "竛 s緋 ng r錳, nh? m閠 ch髏 n鱝.";
		elseif nCount - guess_tb_num[GetName()] < 0 then
			szTemp2 = "C╪g th糿g qu?, nh? 1 ch髏, s緋 tr髇g r錳!";
		end
		Talk(1,"guess_comfirm",g_szInfoHead..szTemp2.."B﹜ gi? b総 u 畂竛 l莕 th? "..nTempTurn.." l莕.");
	end
end

--游戏规则
function guess_rule()
	if IB_VERSION == 0 then--收费区
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi tr薾 u b総 u, h? th鑞g s? ch鋘 m閠 s? nguy猲 ng蓇 nhi猲 t? 0-100, b筺 h穣 nh藀 s? t? 0-100  畂竛, khi s? 畂竛 qu? l韓 ho芻 qu? nh? th? h? th鑞g s? th玭g b竜. M鏸 ngi c? th? 畂竛 nhi襲 nh蕋 l? 5 l莕. (M鏸 ng祔 m鏸 ngi ch? c? 1 l莕 nh薾 thng, gi秈 thng s? c╪ c? v祇 th祅h t輈h t鑤 nh蕋 c馻 b筺 h玬 nay)\n ",g_szInfoHead.."Khi nh薾 ph莕 thng s? c╪ c? v祇 th祅h t輈h t鑤 nh蕋 c馻 b筺.\n ");
	else--免费区
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi tr薾 u b総 u, h? th鑞g s? ch鋘 m閠 s? nguy猲 ng蓇 nhi猲 t? 0-100, b筺 h穣 nh藀 s? t? 0-100  畂竛, khi s? 畂竛 qu? l韓 ho芻 qu? nh? th? h? th鑞g s? th玭g b竜. M鏸 ngi c? th? 畂竛 nhi襲 nh蕋 l? 5 l莕. (M鏸 ng祔 m鏸 ngi ch? c? 1 l莕 nh薾 thng, gi秈 thng s? c╪ c? v祇 th祅h t輈h t鑤 nh蕋 c馻 b筺 h玬 nay)\n ",g_szInfoHead.."Khi nh薾 ph莕 thng s? c╪ c? v祇 th祅h t輈h t鑤 nh蕋 c馻 b筺.\n  N誹 ch鋘 ng trong m閠 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*500 v筺 kinh nghi謒.  Ngi c蕄 99 t苙g 6 T骾 b秓 th筩h. Л頲 5 甶觤 t輈h l騳.\n  N誹 畂竛 ng trong hai l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*420 v筺 kinh nghi謒. Ngi ch琲 c蕄 99 t苙g 5 T骾 b秓 th筩h. Л頲 4 甶觤 t輈h l騳.\n N誹 畂竛 ng trong 3 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*380 v筺 kinh nghi謒. Ngi ch琲 c蕄 99 t苙g 4 T骾 b秓 th筩h. Л頲 3 甶觤 t輈h l騳.");
	end;
end

function guess_rule_2()
	if IB_VERSION == 0 then--收费区
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	N誹 畂竛 ng trong 4 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*100 v筺 kinh nghi謒, c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*300 v筺 s鴆 kh醗. C蕄 99 t苙g 3 T骾 b秓 th筩h. Л頲 2 甶觤 t輈h l騳.\n N誹 畂竛 ng trong 5 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*100 v筺 kinh nghi謒, c? th? chuy觧 b譶h phng ng c蕄/b譶h phng 80*250 v筺 s鴆 kh醗. Ngi ch琲 c蕄 99 t苙g 2 T骾 b秓 th筩h. Л頲 1 甶觤 t輈h l騳.\n ");
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	N誹 畂竛 ng trong 4 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*350 v筺 kinh nghi謒. Ngi ch琲 c蕄 99 t苙g 3 T骾 b秓 th筩h. Л頲 2 甶觤 t輈h l騳\n N誹 畂竛 ng trong 5 l莕, s? nh薾 頲 b譶h phng ng c蕄/b譶h phng 80*300 v筺 kinh nghi謒. Ngi ch琲 c蕄 99 t苙g 2 T骾 b秓 th筩h. Л頲 1 甶觤 t輈h l騳.\n ");
	end;
end;

--游戏奖励
function guess_prize()
	if GetTask(TSK_AOYUN_GUESS_BPRIZED) == 1 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l鏸, h玬 nay ngi  nh薾 ph莕 thng r錳!");
		return
	end;
	guess_prize_real();
end;

function guess_prize_real()
	if GetTask(TSK_AOYUN_GUESS_BCOMPLETED) >= 10 or (GetTask(TSK_AOYUN_GUESS_BEST) > 0 and GetTask(TSK_AOYUN_GUESS_BEST) <= 5) then
		QX08_GetAward(1,GetTask(TSK_AOYUN_GUESS_BEST),TSK_AOYUN_GUESS_BPRIZED);--调用头文件的函数
		return
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Ngi kh玭g 畂竛 ng 頲 l莕 n祇, c遪 mu鑞 nh薾 ph莕 thng g? ch?? Th? l筰 l莕 n鱝 甶!");
		return
	end;
end;