--脚本名称：2008清明节活动任务卷轴盒子
--脚本功能：玩家使用任务卷轴盒子，增加任务卷轴
--策划人：刘天
--代码编写人：墨仙
--代码编写时间：2008-03-23
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\qingming08\\head_qingming.lua")

tomb_sweep_2007_start_goodsID = 675      --任务卷轴一的编号

function OnUse()
	Say("Hoan ngh猲h s? d鬾g h閜 nhi謒 v?! Xin h醝 ngi mu鑞 ti誴 nh薾 m藅  nhi謒 v? n祇?",
	6,
	"M藅  nhi謒 v? 1/#add_reel_task(1)",
	"M藅  nhi謒 v? 2/#add_reel_task(2)",
	"M藅  nhi謒 v? 3/#add_reel_task(3)",
	"M藅  nhi謒 v? 4/#add_reel_task(4)",
	"Trang k?/#next_page(1)",
	"сng h閜, t筸 th阨 ta kh玭g c莕 m藅  nhi謒 v?./nothing"
	);
end;

function next_page(flag)
	if flag == 1 then
		Say("Hoan ngh猲h s? d鬾g h閜 nhi謒 v?! Xin h醝 ngi mu鑞 ti誴 nh薾 m藅  nhi謒 v? n祇?",
		6,
		"M藅  nhi謒 v? 5/#add_reel_task(5)",
		"M藅  nhi謒 v? 6/#add_reel_task(6)",
		"M藅  nhi謒 v? 7/#add_reel_task(7)",
		"M藅  nhi謒 v? 8/#add_reel_task(8)",
		"Trang k?/#next_page(2)",
		"сng h閜, t筸 th阨 ta kh玭g c莕 m藅  nhi謒 v?./nothing"
		);
	else--flag
		Say("Hoan ngh猲h s? d鬾g h閜 nhi謒 v?! Xin h醝 ngi mu鑞 ti誴 nh薾 m藅  nhi謒 v? n祇?",
		3,
		"M藅  nhi謒 v? 9/#add_reel_task(9)",
		"M藅  nhi謒 v? 10/#add_reel_task(10)",
		"сng h閜, t筸 th阨 ta kh玭g c莕 m藅  nhi謒 v?./nothing"
		);
	end;--if
end;

function nothing()
end;

function add_reel_task(flag)
	--时间判断
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		
	else
		Talk(1,"","<color=green>Nh綾 nh?<color>: V藅 ph萴 n祔 ch? s? d鬾g trong ho箃 ng Thanh Minh <color=yellow>3-4-2008 n 12-4<color>.")
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then--负重检测
		return
	end
	if DelItem(2,0,777,1) ~= 1 then
		WriteLog("Ti誸 Thanh Minh 08: H駓 h閜 nhi謒 v? th蕋 b筰!");
		return
	end;--if
	if AddItem(2,0,tomb_sweep_2007_start_goodsID + flag - 1,1) ~= 1 then
		WriteLog("Ti誸 Thanh Minh 08: H閜 nhi謒 v? t╪g m藅  nhi謒 v?"..flag.."Th蕋 b筰!");
		return
	end;
	
end;