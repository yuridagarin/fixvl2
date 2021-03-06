
---------------------------------------------------------
--	金山掌门人
--	帮会的任务接口人 - Jeep tag
---------------------------------------------------------

Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200909\\9\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
--	if (SCCheckCanGetOfflineExp() > 0) then
--		Say("<color=green>金山掌门人<color>：各位侠士成天勤学苦练，本座自是欣赏。不过凡事必有尺度，过犹不及。老夫近日正在研制一例脱离肉体的神游修身之道，可将每日领悟的功力传给各位。这道武学可在休息时日也能增长武学。一次传送的功力仅可持续<color=yellow>8个<color>时辰。除此之外，还研制出一种周期传功的功力，此新功力可在近<color=yellow>7日<color>内获得共<color=yellow>56个<color>时辰的持续功力，众侠士可免去奔波之苦。记住，周期传功期间不可再接收普通传功，众侠士可在每日任何时刻来找我。",
--			3,
--			"接受1日传功，可获得每天离线经验8个时辰(奉上5J供掌门继续研制所需)/iiiiiiwantwant",
--			"接收7日传功，可获得7天离线经验56个时辰(奉上50J供掌门继续研制所需)/i77777777want",
--			"我另找掌门有事/main_1")
--	else

	local tbDialog = {
		"Ta mu鑞 gi秈 quy誸 vi謈 li猲 quan n bang h閕/main_1",
		"R阨 kh醝/noooooo_say"
		};
	if tonumber(date("%Y%m%d")) >= 20090928 and tonumber(date("%Y%m%d")) <= 20091025 then
		tinsert(tbDialog ,1,"Nh﹏ d辮 T誸 Trung Thu, S? ph? ta c?  m閠 ch髏 qu? mu鑞 g鰅 n Minh Ch?, mong Minh Ch? h穣 nh薾 l蕐!/give_letter")
	end	
	
	if GetTaskTrans() >= 8 then
		tinsert(tbDialog ,1,"T譵 hi觰 c竎 hng tu luy謓/view_info")	
		tinsert(tbDialog ,1,"Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/translife_task_2")
	end
	
	Say("<color=green>Minh Ch? Kim S琻<color>: Ngi n t譵 l穙 phu c? vi謈 g??",
		getn(tbDialog),
		tbDialog
		)
--	end
end

function translife_task_2()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(2148) ~= nDate then		
		gf_SetTaskByte(2161,2,0)
		gf_SetTaskByte(2161,3,0)
		SetTask(2148,nDate)
	end	
	if gf_GetTaskByte(2161,2) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)			
		end
	end	
	if GetTaskTrans() == 8 then
		trans_talk_09()	
	elseif GetTaskTrans() == 10 then
		trans_talk_10()
	elseif GetTaskTrans() == 11 then
		trans_talk_11()
	elseif GetTaskTrans() == 12 then	
		trans_talk_12()
	elseif GetTaskTrans() == 13 then	 	
		trans_talk_13()
	else
		Talk(1,"",szNpcName.."H鏽 Nguy猲 C玭g tung ho祅h thi猲 h?, m蕐 ai l躰h h閕 頲?")
		return
	end
end


function i77777777want()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("L莕 trc c玭g l鵦 c馻 l穙 phu truy襫 cho c竎 ngi v蒼 ch璦 s? d鬾g h誸, l莕 n祔 c? mu鑞 i kh玭g?",
			2,
			"ng/yes7777777",
			"в ta suy ngh?!/noooooo_say")
	else
		yes7777777()
	end
end

function yes7777777()
	local nMoney = GetCash()
	if nMoney < 500000 then
		Talk(1, "", "V? b籲g h鱱 y c騨g th祅h k輓h qu? nh?")
	else
		Pay(500000)
		Talk(1, "", "C玭g l鵦 l莕 n祔 duy tr? 頲 <color=yellow>112 gi?<color>")
		SCCheckOfflineExp(1, 1)
		Msg2Player("B筺 nh薾 頲 112 gi? r阨 m筺g t╪g 甶觤 kinh nghi謒.")
	end
end

function iiiiiiwantwant()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("L莕 trc c玭g l鵦 c馻 l穙 phu truy襫 cho c竎 ngi v蒼 ch璦 s? d鬾g h誸, l莕 n祔 c? mu鑞 i kh玭g?",
			2,
			"ng/yes1111111",
			"в ta suy ngh?!/noooooo_say")
	else
		yes1111111()
	end
end

function yes1111111()
	local nMoney = GetCash()
	if (nMoney < 50000) then
		Talk(1, "", "V? b籲g h鱱 y c騨g th祅h k輓h qu? nh?")
	else
		Pay(50000)
		Talk(1, "", "C玭g l鵦 l莕 n祔 duy tr? 頲 <color=yellow>16 gi?<color>")
		SCCheckOfflineExp(1, 0)
		Msg2Player("B筺 nh薾 頲 16 gi? r阨 m筺g t╪g 甶觤 kinh nghi謒")
	end
end

function main_1()
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)

	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantDestoryTong == 1) then		-- 想要解散帮会
		Say("Ta  nghe thu閏 h? b竜 l筰, ngi mu鑞 gi秈 t竛 bang h閕 v? 萵 s琻 l﹎, ng kh玭g?",
		    2,
		    "V穘 b鑙  quy誸, xin chng m玭 ng ?!/first_apply_destroy_tong",
		    "V穘 b鑙  ngh? l筰, kh玭g mu鑞 gi秈 t竛 n鱝./cancel_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 2) then		-- 已经申请了，想要正式解散帮会或者是取消解散帮会
		Say("L筰 n n鱝 ?, ph秈 ch╪g ngi mu鑞 gi秈 t竛 bang h閕?",
		    2,
		    "V穘 b鑙  ngh? k? l筰 kh玭g mu鑞 r阨 xa c竎 huynh  trong bang n猲 kh玭g mu鑞 gi秈 t竛 n鱝./cancel_destroy_tong",
		    "ng v藋, v穘 b鑙  thu x誴 鎛 th醓 v韎 c竎 huynh  trong bang, ? ch?  quy誸 mong chng m玭 ch蕄 nh薾 cho./second_apply_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 已经被答应了
		Say("Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ u c? S? gi? bang h閕, ngi n  xin 頲 gi秈 t竛 bang h閕, nh? thu x誴 v韎 c竎 huynh  trong bang nh?!", 0)
		return
	end
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if (bWantCreateTong == 1) then		-- 帮会介绍人介绍来的，给他检查情况！
		Say("Ta  nghe thu閏 h? b竜 l筰, ngi mu鑞 s竛g l藀 bang ph竔, tri謚 t藀 anh h飊g thi猲 h? ng kh玭g?",
		    1,
		    "ng v藋, v穘 b鑙 mu鑞 t藀 h頿 anh h飊g trong thi猲 h?, xin chng m玭 ng ?/check_apply_create_tong_cond")
		return
	end
	
	if (bWantCreateTong == 2) then
		Talk(1,"","Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ u c? S? gi? bang h閕, ngi c? th? n  xin 頲 gi秈 t竛 bang h閕, ta  ph竔 ngi th玭g b竜 cho h? r錳. Ngi c莔 <color=yellow>Minh H閕 l謓h b礽<color> v? 甶!")
		return
	end
-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------
	
-- 领取仙草露的功能对话 -- 开始 ------------------------------------------------------------------------------
	local bIsTongMember = IsTongMember()		-- 判断这个玩家是不是帮会成员
	local bChangedPopulation = 0			-- 判断帮会人气是否有改变过
	local bTongLadder = 0				-- 这个玩家的帮会当前人气排名
	local nLastTongPopulation = GetTask(298)	-- 这个玩家上次的人气数值，和当前相同的话就是不用再领取了
	local nLastGetPrizeDate = GetTask(299)		-- 这个玩家上次领取仙草的日期（每天只能领一次）
	local nCurTongPopulation = nLastTongPopulation	-- 这个玩家当前的人气数值
	
	local nCurPrizeDate = {date("%y"), date("%m"), date("%d")}
	local nCurPrizeDateNum = tonumber(nCurPrizeDate[1]..nCurPrizeDate[2]..nCurPrizeDate[3])	-- 当前时间(年月日)
	local nExpireDataNum = tonumber("5".."11".."11")	-- 过期的时间
	
	-- 如果是帮会成员的话，就改变nCurTongPopulation和bTongLadder两个数值
	-- 而且是在2005年11月11日以前
	if ((bIsTongMember == 1) and (nCurPrizeDateNum < nExpireDataNum)) then
		bTongLadder = GetTongPopuLadder()
		nCurTongPopulation = GetTongPopulation()
	end
	
	-- 如果人气数值不相等，就是有更新过了
	if ((nCurTongPopulation ~= nLastTongPopulation) and (nCurPrizeDateNum ~= nLastGetPrizeDate)) then
		bChangedPopulation = 1
	end
	
	if ((bTongLadder == 1) and (bChangedPopulation == 1)) then	-- 如果是第一名，而且今天没有领，领3个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,3)
		Talk(1,"","Nh﹏ kh? bang h閕 c馻 ngi hi謓 nay  nh蕋 giang h?, nh薾 頲 ph莕 thng <color=yellow>3 Ti猲 Th秓 L?<color>.")
		return
	end
	
	if ((bTongLadder == 2) and (bChangedPopulation == 1)) then	-- 如果是第二名，而且今天没有领，领2个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,2)
		Talk(1,"","Nh﹏ kh? bang h閕 c馻 ngi hi謓 nay x誴 th? 2, nh薾 頲 ph莕 thng <color=yellow>2 Ti猲 Th秓 L?<color>.")
		return
	end
	
	if ((bTongLadder == 3) and (bChangedPopulation == 1)) then	-- 如果是第三名，而且今天没有领，领1个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,1)
		Talk(1,"","Nh﹏ kh? bang h閕 c馻 ngi hi謓 nay x誴 th? 3, nh薾 頲 ph莕 thng <color=yellow>1 Ti猲 Th秓 L?<color>.")
		return
	end

-- 领取仙草露的功能对话 -- 结束 ------------------------------------------------------------------------------
	-- 没有想要建立帮会，闲聊
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0) then
		Talk(1,"","L穙 phu tung ho祅h giang h?  nhi襲 n╩ nh薾 頲 s鵦 tin y猽 c馻 ng o, nay m nh薾 ch鴆 minh ch? c馻 V? L﹎, kh玭g bi誸 trong giang h? c遪 ai c? th? x鴑g 頲 v韎 danh hi謚 <color=yellow>Чi hi謕<color> n祔 kh玭g?")
	else
		Talk(1,"","Ngi  l? ch? c馻 m閠 bang h閕, c? th? k猽 g鋓 c竎 huynh  trong bang, h穣 c? l猲 nh?!")
	end
end;





-- 第一次向掌门人申请，要解散帮会
function first_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","Ngi kh玭g ph秈 l? ch? c馻 m閠 bang, sao l筰 n y i gi秈 t竛 bang h閕?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	
	SetTask(295, 2)			-- 设置成已经接收了玩家在金山掌门人处的申请
	SetTask(296, nCurDateNum)	-- 设置申请的时间
	
	-- 将玩家打发走
	Say("Ngi v蕋 v? l緈 m韎 l藀 頲 n猲 m閠 bang h閕 v藋 m? ch? v? xung t nh?  mu鑞 gi秈 t竛, nh? v藋 c? ng kh玭g? V莥 nh?, ta cho ngi 3 ng祔  suy ngh? sau  quay l筰 g苝 ta, th? n祇?",
	    1,
	    "C騨g Л頲! в v穘 b鑙 suy ngh? l筰./delay_for_three_days")
end;

-- 跟掌门人再见，三天以后再来找
function delay_for_three_days()
	Talk(1,"","V藋 nh?, 3 ng祔 sau quay l筰 t譵 ta. Nh璶g h穣 nh? h祅h t萿 giang h? ph秈 bi誸 coi tr鋘g ch? ngh躠, ng  c竎 huynh  trong bang th蕋 v鋘g.")
end;

-- 第二次向掌门人正式申请，要解散帮会
function second_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","Ngi kh玭g ph秈 l? ch? c馻 m閠 bang, sao l筰 n y i gi秈 t竛 bang h閕?")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	local nApplyDateNum = GetTask(296)					-- 申请解散的时间
	local nExpiredDate = nCurDateNum - nApplyDateNum			-- 已经经过了的时间
	
	if (nExpiredDate < 3) then		-- 不够三日的期限
		Talk(1,"","Ngi n鉵g n穣 qu?, ch糿g ph秈 l? h裯 v韎 ngi 3 ng祔 sau m韎 quay l筰  sao!")
	else
		SetTask(295, 3)			-- 已经答应了解散帮会的申请
		Say("N誹 l遪g ngi  quy誸 th? ta c騨g kh玭g c秐. Ta s? th玭g b竜 cho thu閏 h? x鉧 b? bang h閕 c馻 ngi. T筰 Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ u c? S? gi? bang h閕, ngi n   xin l祄 th? t鬰 gi秈 t竛.", 0)
	end
end;

-- 翻悔了不想解散帮会了
function cancel_destroy_tong()
	SetTask(295, 0)
	SetTask(296, 0)
	Talk(1,"","T鑤 qu?, ngi  k辮 th阨 ngh? l筰. H穣 ti誴 t鬰 th鑞g l躰h bang h閕 ki課 c玭g l藀 nghi謕 nh?!")
end;

-- 对一个想要建立帮会的人进行条件检查
function check_apply_create_tong_cond()
	Say("Xem ngi c遪 tr? m? t? ch蕋 kh玭g t?. Anh h飊g n? hi謕 h穣 v? <color=yellow>b? t竛h<color> c骳 cung t薾 t魕 nh? v藋 m韎 x鴑g danh <color=yello>Чi hi謕<color>!", 
	    1,
	    " t? ti襫 b鑙 gi竜 hu蕁, t筰 h? c? th? v? l藀 bang h閕 cho m譶h ch璦??/get_tong_card")
end;

function get_tong_card()
	local nCurReputation = GetReputation()		-- 当前声望
	local bHaveTongCard = GetItemCount(2,0,125)	-- 是否有会盟令牌
	
	if ((nCurReputation >= 1000) and (bHaveTongCard >= 1) and (GetItemCount(2,0,555) >=1)) then
		SetTask(297, 2)				-- 记录任务变量
		Talk(1,"","Xem ngi c遪 tr? nh璶g t? ch蕋 kh玭g t?, v? ngh? cao cng x鴑g danh Чi hi謕. Ngi h穣 c莔 <color=yellow>Minh H閕 l謓h b礽 v? C祅 Kh玭 Ph?<color> v? ki課 l藀 bang h閕, k猽 g鋓 anh h飊g n? hi謕 t筼 ph骳 cho b? t竛h.")
	else
		Talk(1,"","Ngi v? c玭g tuy xu蕋 ch髇g nh璶g v蒼 ch璦  甶襲 ki謓 ki課 l藀 bang ph竔. Trc ti猲 h穣 t輈h l騳 <color=yellow>1000 甶觤 danh v鋘g<color> v? <color=yellow>Minh H閕 l謓h b礽 v? C祅 Kh玭 Ph?<color>.<color=yellow>Minh H閕 l謓h b礽 <color> c? th? d飊g 甶觤 chi課 c玭g n Nh筺 M玭 quan g苝 Qu﹏ Nhu Quan  i. <color=yellow>C祅 Kh玭 Ph?<color> c? th? mua t筰 Ng? C竎.")
	end
end;

function noooooo_say()

end
