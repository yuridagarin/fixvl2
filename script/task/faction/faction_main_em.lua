
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 与难民对话的变量储存

-- 与难民甲的对话
EM_MANTALK_01 = 1006;
-- 与难民乙的对话
EM_MANTALK_02 = 1007;
-- 与难民丙的对话
EM_MANTALK_03 = 1008;
-- 与难民丁的对话
EM_MANTALK_04 = 1011;

-- 与真如师太的对话
function task_001()

local strMain = {
		"G莕 Th祅h Й x秠 ra n筺 i ch璦 t鮪g th蕐 trong 100 n╩ qua. е t? Nga My ta  甶 c鴘 t?, th藅 s? kh玭g th? ki觤 tra n╪g l鵦 ngi l骳 n祔. N誹 ngi c? l遪g c? th? h? s琻 甶 c鴘 t? d﹏ ch髇g?",
		"Ta n猲 l祄 th? n祇?",
		"<color=yellow>Chu Thi謓 Nh﹏<color> ? Th祅h Й ph? l? ngi c? l遪g h秓 t﹎, y 產ng c鴘 t? d﹏ ch髇g ? <color=yellow>T輓 Tng T?<color>, ngi h穣 gi髉 y m閠 tay."
	}
	
TE_Talk(getn(strMain), "task_002", strMain);

end

-- 与真如师太的对话结束后改变变量：1
function task_002()

	SetTask(1003,1);
	
	TaskTip("Mau 甶 Th祅h Й gi髉 Chu Thi謓 Nh﹏!");
	
end

-- 与周善人的对话
function task_003()

local strMain = {
		"Ta mu鑞 ph竧 ti襫  c鴘 t? nh璶g b鋘 gia nh﹏ th? b薾 gi髉 n蕌 ch竜. Phi襫 c? nng n th玭g b竜 cho <color=yellow>N筺 d﹏ Gi竝, 蕋, B輓h, nh<color> ? c鎛g th祅h, b秓 h? n nh薾 c鴘 t?.",
		"Х th?  ta 甶 thay 玭g."
	}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- 与周善人的对话结束后改变变量：2
function task_004()

	SetTask(1003,2);
	
	TaskTip("H穣 th玭g b竜 cho N筺 d﹏ Gi竝, 蕋, B輓h, nh ? c鎛g th祅h n nh薾 c鴘 t?!");

end

-- 与难民甲的对话
function task_005()

local strMain = {
		"Chu Thi謓 Nh﹏ m? kho ph竧 lng th鵦, sai ta n th玭g b竜 cho ngi bi誸.",
		" t? c? nng  n b竜 tin!  ngh躠 n祔 c? i ta s? kh玭g qu猲!",
		"ng kh竎h s竜! Ngi mau 甶 甶!"
	}

TE_Talk(getn(strMain), "task_005_add", strMain);

TaskTip("B筺  b竜 tin cho N筺 d﹏ Gi竝!");

end

function task_005_add()

	SetTask(EM_MANTALK_01,1);

end

-- 与难民乙的对话
function task_006()

local strMain = {
		"Chu Thi謓 Nh﹏ m? kho ph竧 lng th鵦, sai ta n th玭g b竜 cho ngi bi誸.",
		" t? c? nng  n b竜 tin!  ngh躠 n祔 c? i ta s? kh玭g qu猲!",
		"ng kh竎h s竜! Ngi mau 甶 甶!"
	}

TE_Talk(getn(strMain), "task_006_add", strMain);

TaskTip("B筺  b竜 tin cho N筺 d﹏ 蕋!");

end

function task_006_add()

	SetTask(EM_MANTALK_02,1);

end

-- 与难民丙的对话
function task_007()

local strMain = {
		"Chu Thi謓 Nh﹏ m? kho ph竧 lng th鵦, sai ta n th玭g b竜 cho ngi bi誸.",
		" t? c? nng  n b竜 tin!  ngh躠 n祔 c? i ta s? kh玭g qu猲!",
		"ng kh竎h s竜! Ngi mau 甶 甶!"
	}

TE_Talk(getn(strMain), "task_007_add", strMain);

TaskTip("B筺  b竜 tin cho N筺 d﹏ B輓h!");

end

function task_007_add()

	SetTask(EM_MANTALK_03,1);

end


-- 与难民丁的对话
function task_007_01()

local strMain = {
		"Chu Thi謓 Nh﹏ m? kho ph竧 lng th鵦, sai ta n th玭g b竜 cho ngi bi誸.",
		" t? c? nng  n b竜 tin!  ngh躠 n祔 c? i ta s? kh玭g qu猲!",
		"ng kh竎h s竜! Ngi mau 甶 甶!"
	}

TE_Talk(getn(strMain), "task_007_01_add", strMain);

TaskTip("B筺  b竜 tin cho N筺 d﹏ nh!");

end


function task_007_01_add()

	SetTask(EM_MANTALK_04,1);

end


-- 回去与周善人的对话
function task_008()

local strMain = {
		"Ta  b竜 tin cho t蕋 c? c竎 n筺 d﹏.",
		" t? c? nng!",
		"? ng礽 l??",
		"Ta v鮝 nh薾 頲 tin: ng祔 mai trong th祅h v藅 gi? c馻 c竎 c鯽 hi謚 l韓 s? t╪g 3 l莕, th? th? n筺 d﹏ l祄 sao s鑞g?",
		"Ch糿g l? c竎 ch? ti謒 trong th祅h kh玭g c? ch髏 lng t﹎ sao?",
		"Chuy謓 n祔 c騨g kh玭g th? tr竎h h?, ch? y誹 l? trong th祅h c? 1 t猲 L璾 Manh chuy猲 h? hi誴 b? t竛h lng thi謓.",
		"B鋘 ch髇g d竚 l閚g h祅h th? ?? Nh蕋 nh ph秈 cho ch髇g b礽 h鋍.",
		"L璾 Manh ? ph輆 <color=yellow>T﹜ Th祅h Й<color>, c? nng qu? c? l遪g, h穣 tr鮪g tr? ch髇g v? l蕐 <color=yellow>2 b譶h Thi猽 t鰑<color> v?!"
	}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- 与周善人对话后改变任务变量：4
function task_009()

	SetTask(1003,4); -- 直接变到 4
	TaskTip("B筺 h穣 gi竜 hu蕁 L璾 Manh ? T﹜ Th祅h Й, l蕐 2 b譶h Thi猽 t鰑!");
end

-- 击败无赖后改变任务变量：4
--function task_010()
--	FN_SetTaskAdd(FN_EM);
--end

-- 回去见周善人
function task_011()

local strMain = {
		"C? nng kh玭g h? danh l?  t? Nga My.",
		"Ta kh玭g ph秈  t? Nga My, Ch﹏ Nh? S? Th竔 n鉯 kh玭g c? th阨 gian th? th竎h ta.",
		"V韎 b秐 l躰h c馻 c? nng th? c莕 g? th? th竎h. Ta s? cho b? c﹗ chuy觧 th? n S? Th竔. C? nng h穣 quay v? Nga My.",
		"Xin 產 t?!"
	}

if (GetItemCount(2,1,12)>=2) then
	DelItem(2,1,12,2);
	TE_Talk(getn(strMain), "task_012", strMain);
else
	Say("Цm L璾 Manh ? T﹜ Th祅h Й r蕋 l閚g h祅h, l莕 n祔 c? nng 甶 ph秈 c萵 th薾!",0);
	return
end;

end

-- 与周善人对话后改变变量：5
function task_012()
	SetTask(1003,5);
	TaskTip("Chu Thi謓 Nh﹏ b秓 b筺 n g苝 Ch﹏ Nh? S? Th竔!");
end


-- 回去与真如师太的对话
function task_013()

local strMain = {
		"Ngi ch璦 nh藀 m玭 n誹 c? th? l祄 xong vi謈 n祔 ta s? thu nh薾 ngi l祄  t? Nga My.",
		" t? s? ph?! е t? nh蕋 nh xin ghi nh? l阨 c馻 s? ph? su鑤 i."
	}

TE_Talk(getn(strMain), "task_014", strMain);

end

-- 与真如师太对话后改变任务变量：6
function task_014()

	SetTask(1003,6);
	
	SetPlayerFaction(3);
	SetPlayerRoute(7);
	i=GetBody()
	if i==3 then 
		AddItem(0,109,81,1)
		AddItem(0,108,81,1)
	else 
		AddItem(0,109,85,1)
		AddItem(0,108,85,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入峨嵋派");
	TaskTip("B筺  gia nh藀 Nga My, c? th? b竔 s? h鋍 ngh?!");
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_em()
FN_SetTaskState(FN_EM, 0);
Say("C? ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! Ngi c? th? gia nh藀 m玭 ph竔 l筰.",0);
end;