
-- 剑侠情缘 II 师门任务
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ 女性玩家


-- 开始与佘太君对话

function task_001()

local strMain = {
	"Ngi ?? N琲 y l? qu﹏ doanh, c? nng c? ch辵 頲 kh? c鵦?",
	"Dng M玭 n? tng vang danh thi猲 h?, Xa Th竔 Qu﹏ sao l筰 coi thng t筰 h??",
	"Ha ha! Th玦 頲! Ngi h穣 甶 t譵 M閏 Qu? Anh, m鋓 vi謈 c馻 Dng M玭 u do c? ta qu秐 l?.",
	" t? Xa Th竔 Qu﹏!",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip(" t譵 M閏 Qu? Anh xin gia nh藀 Dng m玭!");

end

-- 对话结束，改变变量：1
function task_002()

	SetTask(1032,1);

end

-- 与穆桂英对话1
function task_003()

local strMain = {
  "M閏 tng qu﹏! Ta mu鑞 gia nh藀 Dng M玭, Xa Th竔 Qu﹏ b秓 ta n t譵 ngi.",
	"Gia nh藀 Dng M玭? Hay l緈! M芻 d? n? t鑤 kh玭g thu閏 Khu M藅 vi謓 cai qu秐 nh璶g ph秈 頲 s? ng ? c馻 tri襲 nh.",
	"H穣 n Bi謓 Kinh t譵 Th鮝 tng <color=yellow>Tri謚 Ph?<color> ghi t猲 v祇 s? r錳 quay l筰 y!",
  " t? M閏 tng qu﹏!",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("M閏 Qu? Anh b秓 b筺 甶 Bi謓 Kinh t譵 Tri謚 Ph?");

end

-- 对话结束，改变变量：2
function task_004()

	SetTask(1032,2);

end


-- 与赵普对话1
function task_005()

local strMain = {
  "Tri謚 i nh﹏! T筰 h? l? t﹏ binh c馻 Dng M玭, M閏 Qu? Anh b秓 t筰 h? n y  ghi danh v祇 s?.",
	"Trc y th? ng l? n ch? ta  ghi t猲 v祇 danh s竎h nh璶g g莕 y vi謈 n祔 頲 chuy觧 cho C蕀 qu﹏ l祄.",
	"H穣 n c鎛g ch輓h Ho祅g cung t譵 <color=yellow>C蕀 qu﹏<color> h醝 t譶h h譶h c? th?.",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("Tri謚 Ph? b秓 b筺 n c鎛g Ho祅g cung t譵 C蕀 qu﹏");

end

-- 对话结束，改变变量：3
function task_006()

	SetTask(1032,3);

end

-- 与礼官对话
function task_007()

local strMain = {
  "Dng M玭 n? binh!?",
	"M芻 d? Dng M玭 n? t鑤 thu閏 qu秐 l? c馻 C蕀 qu﹏ nh璶g ch? l? tr猲 danh ngh躠  ti謓 s鯽 ch鱝 t猲 danh s竎h.",
	"Nh璶g th藅 s? Dng M玭 v蒼 thu閏 Thi猲 Ba ph?, ngi c? b萴 b竜 th? v韎 Tri謚 i nh﹏.",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("C蕀 qu﹏ b秓 b筺 甶 t譵 Tri謚 Ph?");

end;

-- 对话结束，改变变量：4
function task_008()

	SetTask(1032,4);

end;


-- 与赵普对话2
function task_009()

local strMain = {
  "Th? ra l? v藋! Nh璶g mu鑞 C蕀 qu﹏ nh藀 s? ph秈 n Khu M藅 vi謓 t譵 T祇 B﹏ i nh﹏.",
	"Th? n祔 v藋! Ta s? n鉯 v韎 T祇 i nh﹏ vi謈 n祔, ngi h穣 v? b萴 b竜 <color=yellow>M閏 Qu? Anh<color> tng qu﹏ 甶!",
	"Phi襫 Tri謚 i nh﹏ v藋!",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("Tri謚 Ph? b秓 b筺 甶 t譵 M閏 Qu? Anh");

end

-- 对话结束，改变变量：5
function task_010()

	SetTask(1032,5);

end

-- 与穆桂英对话2
function task_011()

local strMain = {
  "Х xong vi謈 r錳 ??",
	"ng v藋! Nh璶g sao l骳 th? do C蕀 qu﹏ qu秐 l? l骳 th? Khu M藅 vi謓 l? th? n祇? Th藅 phi襫 ph鴆!",
	"Vi謈 n祔 ta c騨g kh玭g r? l緈! Ta ch? lo vi謈 qu﹏ t譶h c遪 vi謈 quan trng ta kh玭g mu鑞 ngh? t韎!",
  "Cho n猲 ta lu玭 ? trong ph? hi誱 khi g苝 b鋘 h?.", 
  "T筰 h? c? th? mua ng鵤 c馻 Dng M玭 ? u?",
	"Trong ph? c? xa m? ph遪g, qu﹏ s? trong ph? lo luy謓 chi課 m?, ngi c? th? tr鵦 ti誴 t譵 <color=green>Dng B礽 Phong<color>.",
  "Tr猲 chi課 trng n誹 b? thng c騨g l? chuy謓 thng t譶h cho n猲 nh蕋 nh ph秈 bi誸 c竎h tr? thng c? b秐. Ngi 甧m <color=yellow>5 cu閚 b╪g<color> n y cho ta.", 
  "B╪g? Ta kh玭g bi誸!",
  "R蕋 n gi秐! Зy l? <color=yellow>k? n╪g giang h?<color> ai c騨g ph秈 bi誸. H穣 xem trong giao di謓 <color=yellow>k? n╪g s鑞g<color>.", 
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("M閏 Qu? Anh b秓 b筺 l祄 5 cu閚 b╪g");

end

-- 对话结束，改变变量：6
function task_012()

	SetTask(1032,6);

end

-- 玩家有绷带来交任务时
function task_013()

local strMain = {
		"T筰 h?  l祄 xong 5 cu閚 b╪g.",
		"Tay ch﹏ c騨g nhanh nh裯! Gi? h穣 n g苝 <color=yellow>Xa Th竔 Qu﹏<color>."
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("Nh蕁 <color=yellow>F5<color> ch鋘 <color=yellow>S鑞g<color>  xem <color=yellow>k? n╪g s鑞g<color>.",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除绷带
function task_014()
	TaskTip("B﹜ gi? c? th? g苝 Xa Th竔 Qu﹏");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- 回去与佘太君的对话

function task_015()

local strMain = {
		"T? nay tr? 甶 ngi  tr? th祅h ngi c馻 Dng Gia Tng, sau n祔 h穣 c? g緉g r蘮 luy謓 kh玭g 頲 li bi課g.",
		"Dng Gia Tng ta tinh th玭g cung m?, Dng Gia Thng n鎖 ti課g thi猲 h?. N誹 ngi mu鑞 h鋍 <color=yellow>Thng ph竝<color> n t譵 <color=yellow>Dng T玭 B秓<color>; n誹 mu鑞 h鋍 <color=yellow>Cung thu藅<color> n t譵 <color=yellow>M閏 Qu? Anh<color>."
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("B筺  gia nh藀 Dng M玭. T譵 Gi竜 u h鋍 v? c玭g")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ 男性玩家


-- 开始与佘太君对话


function task_101()

local strMain = {
	"Ngi mu鑞 gia nh藀 Dng M玭? Зy l? qu﹏ doanh k? lu藅 r蕋 nghi猰, kh玭g nh? c竎 m玭 ph竔 tr猲 giang h?. Ngi n猲 suy ngh? k?.",
	"T筰 h?  ngh? k?, qu鑓 gia c? n筺, ta c騨g ph秈 c? ch髏 tr竎h nhi謒",
	"Hay l緈! Dng M玭 nam t鑤 do <color=yellow>Dng T玭 B秓<color> qu秐 l?, h穣 甶 t譵 y.",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip(" t譵 Dng T玭 B秓 xin gia nh藀 Dng m玭!");

end

-- 对话结束，改变变量：1
function task_102()

	SetTask(1031,1);

end

-- 与杨宗保对话1
function task_103()

local strMain = {
  "Dng tng qu﹏! T筰 h? mu鑞 gia nh藀 Dng M玭, Xa Th竔 Qu﹏ b秓 t筰 h? n t譵 ngi",
	"C? ch? kh?! T遪g qu﹏ b竜 qu鑓 l? vi謈 nam nh﹏ i trng phu n猲 l祄!",
  "V藋 xem nh? t筰 h?  gia nh藀 Dng M玭 r錳 ??",
	"Mu鑞 t遪g qu﹏ ph秈 頲 tri襲 nh cho ph衟, h穣 n Bi謓 Kinh t譵 Khu M藅 S? <color=yellow>T祇 B﹏<color>, 玭g ta qu秐 l? danh s竎h qu﹏ s?.",
  "Tu﹏ l謓h tng qu﹏!",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("Dng T玭 B秓 b秓 b筺 甶 Bi謓 Kinh t譵 T祇 B﹏");

end

-- 对话结束，改变变量：2
function task_104()

	SetTask(1031,2);

end


-- 与曹彬对话1
function task_105()

local strMain = {
  "Ng礽 l? T祇 B﹏ i nh﹏? T筰 h? mu鑞 t遪g qu﹏, Dng T玭 B秓 tng qu﹏ b秓 t筰 h? n g苝 ng礽.",
	"N誹 nh? Dng tng qu﹏ ti課 c? th? kh玭g c? v蕁  g?. Nh璶g ti觰 huynh  c? th? gi髉 ta m閠 chuy謓?",
  "Xin T祇 i nh﹏ c? n鉯!",
	"G莕 y tri襲 nh c? mua m閠 n ng鵤 nh璶g n gi? v蒼 ch璦 chuy觧 n. Ngi gi髉 ta h醝 ngi <color=yellow>B竛 ng鵤<color> xem bao l﹗ s? chuy觧 n.",
  "Th玦 頲!",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("T祇 B﹏ b秓 b筺 甶 Bi謓 Kinh t譵 B竛 ng鵤");

end

-- 对话结束，改变变量：3
function task_106()

	SetTask(1031,3);

end

-- 与汴京马贩对话
function task_107()

local strMain = {
  "g ch?! T祇 i nh﹏ nh? t玦 h醝 玭g s? ng鵤 l莕 trc t bao gi? chuy觧 n.",
	"Ng鵤 c馻 T祇 i nh﹏? Ta s? l藀 t鴆 chuy觧 qua.",
  "Xin 產 t?!",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("Quay v? g苝 T祇 B﹏");

end;

-- 对话结束，改变变量：4
function task_108()

	SetTask(1031,4);

end;


-- 与曹彬对话2
function task_109()

local strMain = {
  "Th? n祇?",
	"B竛 ng鵤 n鉯 s? l藀 t鴆 chuy觧 n.",
  "Hay l緈! Чi T鑞g v? Khi誸 n 產ng giao chi課, chi課 m? r蕋 quan tr鋘g i v韎 c竎 k? binh ngo礽 chi課 trng.",
  "Cho n猲 nh蕋 nh mua nhi襲 chi課 m?.",
  "Ngi mu鑞 gia nh藀 Dng M玭, ch輓h l? l蕐 k? binh l祄 ch?, sau n祔 ph秈 c? g緉g r蘮 luy謓.",
	"Ngi trong Dng M玭 c騨g n Bi謓 Kinh mua ng鵤?",
  "C騨g 頲! Nh璶g trong Dng M玭 c? m? ph遪g do m閠 a ho祅 qu秐 l?, Dng Gia qu﹏ c? th? n  l蕐 chi課 m?.",
	"T筰 h? hi觰 r?!",
  "Л頲 r錳! Gi? ngi c? th? v? g苝 <color=yellow>Dng T玭 B秓<color>, ta s? 甶襫 t猲 ngi v祇 danh s竎h.",
	" t? i nh﹏!",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("T祇 B﹏ b秓 b筺 甶 t譵 Dng T玭 B秓");

end

-- 对话结束，改变变量：5
function task_110()

	SetTask(1031,5);

end

-- 与杨宗保对话2
function task_111()

local strMain = {
  "M鋓 vi謈 th? n祇 r錳?",
	"Х 甶襫 t猲 v祇 s?!",
	"T鑤 l緈!",
  "Binh s? nhi襲 n猲 lng th鵦 c騨g l? vi謈 r蕋 c蕄 b竎h. Nhi襲 khi l骳 h祅h qu﹏, binh s? ph秈 t? lo lng th鵦.", 
  "H穣 甶 nh b鋘 <color=yellow> C玭 <color> l蕐 <color=yellow> 2 ph莕 th辴 g? <color> v? y trc !", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("Dng T玭 B秓 b秓 b筺 t譵 2 ph莕 th辴 G?");

end

-- 对话结束，改变变量：6
function task_112()

	SetTask(1031,6);

end

-- 玩家有鸡肉来交任务时
function task_113()

local strMain = {
		"Х l祄 xong r錳!",
	  "Nhanh v藋! Qu? l? c? ti襪 ch蕋  t遪g qu﹏!",
		"B﹜ gi? ngi c? th? n g苝 <color=yellow>Xa Th竔 Qu﹏<color>.",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("Ch璦 l祄 xong ??",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除兔肉
function task_114()
	TaskTip("B﹜ gi? c? th? g苝 Xa Th竔 Qu﹏");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- 回去与佘太君的对话

function task_115()

local strMain = {
		"Dng T玭 B秓  ng ?? Hay l緈! T? gi? ngi  l? m閠 th祅h vi猲 c馻 Dng Gia Tng. B鎛 doanh qu﹏ lu藅 r蕋 nghi猰. Ph秈 lu玭 tu﹏ th? nh?!",
    "Dng Gia Tng ta tinh th玭g cung m?, Dng Gia Thng n鎖 ti課g thi猲 h?. N誹 ngi mu鑞 h鋍 <color=yellow>Thng ph竝<color> n t譵 <color=yellow>Dng T玭 B秓<color>; n誹 mu鑞 h鋍 <color=yellow>Cung thu藅<color> n t譵 <color=yellow>M閏 Qu? Anh<color>.",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("B筺  gia nh藀 Dng M玭. T譵 Gi竜 u h鋍 v? c玭g")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("C? ch髏 v蕁  x秠 ra nh璶g  頲 kh綾 ph鬰, gi? ngi c? th? nh藀 m玭 l筰.",0);
end;


