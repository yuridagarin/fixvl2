
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武当门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

function task_001()

local strMain = {
	"Л阯g M玭 ta l? danh m玭 T? Xuy猲. Ai ai c騨g mu鑞 nh藀 m玭. Ngi c? g? h琻 ngi h穣 n鉯 cho l穙 l穙 y bi誸?",
	"T筰 h? trung th祅h v韎 Л阯g M玭, t? x璦 n nay ch糿g ai b? 頲.",
	"Ti觰 t? ngi c騨g bi誸 khua m玦 m骯 m衟. Ngi h穣 甶 t譵 <color=yellow>Л阯g Thi猲 Ti誹<color>  h緉 s緋 x誴 cho ngi c騨g nh?  l穙 l穙 xem ngi trung th祅h th? n祇."
}

TE_Talk(getn(strMain), "task_002", strMain);

end

-- 对话结束后修改任务变量：1
function task_002()
	TaskTip(" t譵 Л阯g Thi猲 Ti誹 nh薾 th? th竎h!");
	SetTask(1005,1);
end


-- 与唐天啸的对话
function task_003()

local strMain = {
	"M鋓 vi謈 c? theo ? l穙 l穙 v藋.",
	"Л頲 r錳! Ta s? s緋 x誴 m鋓 vi謈 cho ngi. T鎛g qu秐 ph遪g thu鑓 <color=yellow>Л阯g Xu﹏<color> 產ng ch? 1 lo筰 thu鑓 m韎, c? th? s? c莕 ngi. H穣 n  th? xem!"
}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- 对话结束后修改任务变量：2
function task_004()
	TaskTip(" t譵 T鎛g qu秐 Dc ph遪g Л阯g Xu﹏!");
	SetTask(1005,2);
end


-- 与唐春的对话
function task_005()

local strMain = {
	"Ngi n l祄 t筽 d辌h hay l祄 thu鑓?",
	"L祄 T筽 d辌h/task_005_01",
	"Ngi ph鑙 dc/task_005_02",
	"Kh玭g l祄/task_005_03"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

-- 选择做杂役
function task_005_01()

local strMain = {
	"Ngi h穣 xu鑞g n骾 t譵 <color=yellow>5 R╪g s鉯<color> v?. Ch? t筼  l﹗ gi?  xem H鉧 C鑤 Ph蕁 c? th祅h c玭g kh玭g!"
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- 选择做药人
function task_005_02()

local strMain = {
	"B筺 tr?! T? nguy謓 n l祄 thu鑓 ?, ng l? c? ch髏 l遪g th祅h!",
	"Ch? v? H鉧 C鑤 Ph蕁 c馻 ta r蕋 l頸 h筰, v韎 c玭g l鵦 c馻 ngi hi謓 gi? n誹 th? s? r蕋 nguy hi觤, h穣 xu鑞g n骾 t譵 <color=yellow>5 R╪g s鉯 x竚<color> v?."
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- 选择什么都不做
function task_005_03()

	Say("Th? th竎h c馻 ta ngi kh玭g qua 頲 c遪 mu鑞 gia nh藀 Л阯g M玭, kh玭g l? ngi l? gian t??",0);

end


-- 与唐春对话结束后改变任务变量：3
function task_005_add()
	TaskTip("Л阯g Xu﹏ b秓 b筺 t譵 R╪g s鉯 x竚!");
	SetTask(1005,3);
end


-- 找来土狼牙后与唐春的对话
function task_006()

local strMain = {
	"Hay l緈! H鉧 C鑤 Ph蕁 qu? nhi猲  c? c玭g hi謚, t? nay Л阯g M玭 ta l筰 c? m閠 v? kh?  tung ho祅h giang h?.",
	"Ngi n ph遪g c? quan t譵 <color=yellow>Л阯g V﹏<color>, h醝 玭g ta c竎h s? d鬾g H鉧 C鑤 Ph蕁."
}

	if (GetItemCount(2,1,3)>=5) then
	
		TE_Talk(getn(strMain), "task_007", strMain);
	
	else
	
		Say("Sai ngi 甶 t譵 <color=yellow>R╪g s鉯 x竚<color>, sao l筰 quay v? y?",0);
		return
	
	end

end

-- 删了土狼牙，并改变任务变量：4
function task_007()
	DelItem(2,1,3,5);
	TaskTip(" t譵 Л阯g V﹏ h醝 c竎h d飊g H鉧 C鑤 Ph蕁!");
	SetTask(1005,4);
end

-- 与唐云的对话
function task_008()

local strMain = {
	"D飊g th? n祇 ?? Л琻g nhi猲 l? r綾 v祇 b蓎 r錳. N誹 nh? l? b筺 th? ch髇g ta ch鱝 tr? cho h?, ngc l筰 th? m芻 k? ch髇g.",
	"G莕 y nhi襲 ngi ra v祇 Л阯g M玭, kh玭g th? kh玭g  ph遪g. ? y c? 1 c竔 x蝞g s総, ngi h穣 <color=yellow>o 1 c竔 b蓎<color> di ch﹏ n骾.",
	"Уo  l祄 g??",
	"H醝 nhi襲 l祄 chi? Sai ngi o b蓎 th? c? o 甶, nh? l? ch﹏ n骾 c? 2 c竔 c﹜ t鋋  l? <color=yellow>(196.187)<color>, ng n猲 nh莔 ch?!"
}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- 与唐云对话结束，给一把铁锹并改变变量：5
function task_009()
	AddItem(2,0,6,1);
	TaskTip("дn ch﹏ n骾 (196.187) o 1 c竔 b蓎! ");
	SetTask(1005,5);
end


-- 检测是否在正确的地点使用了铁锹，并改变变量：6
function task_CheckPos()

local mapID, mapX, mapY = GetWorldPos();

	if (mapX>1562) and (mapX<2993) and (mapY>1579) and (mapY<3019) and (FN_GetTaskState(FN_TM)==5) then
		Say("B筺  o m閠 c竔 b蓎! Quay v? ph鬰 m謓h Л阯g V﹏.",0);
		TaskTip("B筺  o m閠 c竔 b蓎! Quay v? ph鬰 m謓h Л阯g V﹏.");
		SetTask(1005,6);
	else
		return
	end

end


-- 如果玩家已经挖了陷阱回来向唐云复命
function task_010()

local strMain = {
	"T鑤! Kh玭g ng? ngi l祄 vi謈 c騨g nhanh nh裯. Chuy謓 h玬 nay kh玭g 頲 n鉯 cho ngi kh竎 bi誸, ngi h穣 甶 t譵 <color=yellow>Л阯g M玭 L穙 L穙<color> 甶."
}

TE_Talk(getn(strMain), "task_011", strMain);

end


-- 与唐云对话后改变任务变量：7
function task_011()
	DelItem(2,0,6,1);
	TaskTip(" t譵 Л阯g M玭 L穙 L穙!");
	SetTask(1005,7);
end



-- 与唐门姥姥的对话
function task_012()

local strMain = {
	"Tr? tu鎖 m? c? th? l祄 nh鱪g vi謈 nh? th? th藅 ng kh﹎ ph鬰! Ta s? nh薾 ngi l祄  t? Л阯g M玭.",
	"H穣 nh? m閠 khi gia nh藀 Л阯g M玭, s鑞g l祄 ngi c馻 Л阯g M玭, ch誸 l祄 ma c馻 Л阯g M玭. Lu玭 lu玭 trung th祅h n誹 kh玭g s? b? tr鮪g tr? nghi猰 kh綾",
	" t? l穙 l穙,  t? nh蕋 nh ghi nh? trong l遪g."
}

TE_Talk(getn(strMain), "task_013", strMain);

end

-- 与唐门姥姥的对话结束后改变任务变量：8
function task_013()
	SetPlayerFaction(5)
	SetPlayerRoute(5)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,76,1)
		AddItem(0,108,76,1)
	elseif i==2 then
		AddItem(0,109,80,1)
		AddItem(0,108,80,1)
	elseif i==3 then
		AddItem(0,109,84,1)
		AddItem(0,108,84,1)
	else
		AddItem(0,109,88,1)
		AddItem(0,108,88,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入唐门")
	TaskTip("B筺  gia nh藀 Л阯g M玭, c? th? b竔 s? h鋍 ngh?!")
	SetTask(1005,8);
	Say("Ta nh譶 s?  bi誸 ngi l? ngi th玭g minh, gia nh藀 Л阯g M玭 ph秈 h誸 l遪g v? b鎛 m玭!",0);
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_WD, 0);
	
end


function fix_tm()
FN_SetTaskState(FN_TM, 0);
Say("C? ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! B籲g h鱱 c? th? gia nh藀 m玭 ph竔 l筰.",0);
end;