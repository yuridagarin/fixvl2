
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武当门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 与紫鹤真人的对话
function task_001()

local strMain = {
		"Ph祄 l?  t? V? ng ph秈 h鋍 thu閏 Чo c Kinh, hi觰 頲 ng? ?, sau  b竔 t? l辌h i T? s? m韎 c? th? nh藀 m玭. Ngi c? th? n V? ng h藆 vi謓 t譵 <color=yellow>Trng Ng? Dng<color> h醝 r?."
	}

TaskTip("T? H筩 Ch﹏ Nh﹏ b秓 b筺 甶 g苝 Trng Ng? Dng xin nh藀 m玭!");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- 对话结束后改变变量：1
function task_002()

	SetTask(1002,1);

end


-- 与张午阳的对话
function task_003()

local strMain = {
		"Чo c Kinh do L穙 T? vi誸, chia l祄 quy觧 thng v? quy觧 h?. Quy觧 thng c? 37 chng, quy觧 h? c? 44 chng. Mang n閕 dung tinh th﹎ v? l? chi b秓 c馻 Чo gia. Ph祄 l?  t? V? ng, trc khi nh藀 m玭 ph秈 <color=yellow>h鋍 thu閏 Чo c Kinh<color> v? hi觰 頲 ? ngh躠. Ngi c? mu鑞 th? kh玭g?",
		"в ta h鋍 thu閏 Чo c kinh trc/task_003_read",
		"в ta c thu閏 Чo c kinh/task_003_next",
		"Ta c遪 vi謈 ph秈 l祄/task_exit"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- 熟读道德经
function task_003_read()

local strMain = {
		"Чo Kh? Чo, Phi Thng Чo. Danh Kh? Danh, Phi Thng Danh. V? Danh Thi猲 мa Chi Kh雐. H鱱 Danh V筺 V藅 Chi M蓇. C? Thng V? D鬰 D? Quan K? Di謚.",
		"Thng H鱱 D鬰 D? Quan K? Di謚. Th? Lng Gi? уng Xu蕋 Nhi D? Danh. уng V? Chi Huy襫. Huy襫 Chi H鵸 Huy襫, Ch髇g Di謚 Chi M玭.",
		"C鑓 Th莕 B蕋 T? Th? V? Huy襫 T絥. Huy襫 T絥 Chi M玭 Th? V? Thi猲 мa C╪. Mi猲 Mi猲 Nhc T錸, D鬾g Chi B蕋 C莕.",
		"Thng Thi謓 Nhc Th駓. Th駓 Thi謓 L頸 V筺 V藅 Nhi B蕋 Tranh, X? Ch髇g Nh﹏ Chi S? 竎, C? C? ? Чo. C? Thi謓 мa, T﹎ Thi謓 Uy猲 D? Thi謓 Nh﹏, Ng玭 Thi謓 T輓, Ch輓h Thi謓 Tr?, S? Thi謓 N╪g, чng Thi謓 Th阨. Phu Duy B蕋 Tranh, C? V? V璾.",
		"Чi Th祅h Nhc Khuy誸, K? D鬾g B蕋 T?. Чi Doanh Nhc Xung, K? D鬾g B蕋 C飊g. Чi Tr鵦 Nhc Khu蕋. Чi X秓 Nhc Chuy誸. Чi Bi謓 Nhc N閠. T辬h Th緉g T竜. Thanh T辬h Vi Thi猲 H? Ch竛h.",
		"H鱱 V藅 H鏽 Th祅h ti猲 thi猲 a sanh. T辌h H? Li猽 H? чc L藀 B蕋 C秈, Chu H祅h Nhi B蕋 Хi, Kh? D? Vi Thi猲 H? M蓇. Ng? B蕋 Tri K? Danh, Cng T? Chi Vi誸 Чo. Cng Vi Chi Danh Vi誸 Чi. Чi Vi誸 Th?, Th? Vi誸 Vi詎, Vi詎 Vi誸 Ph秐.",
		"C? Чo Чi, Thi猲 Чi, мa Чi, Nh﹏ Di謈 Чi. V鵦 Trung H鱱 Чi, Nhi Nh﹏ C? K? Nh蕋 Y猲. Nh﹏ Ph竝 мa, мa Ph竝 Thi猲, Thi猲 Ph竝 Чo, Чo Ph竝 T? Nhi猲."
	}
	
TE_Talk(getn(strMain), "task_003", strMain);

end





-- 背诵道德经
function task_003_next()

local strMain = {
		"C﹗ u ti猲 c馻 Чo c Kinh l? g??",
		"Чo Sinh Nh蕋, Nh蕋 Sinh Nh?, Nh? Sinh Tam, Tam Sinh V筺 V藅/task_error",
		"Nh﹏ Ph竝 мa, мa Ph竝 Thi猲, Thi猲 Ph竝 Чo, Чo Ph竝 T? Nhi猲/task_error",
		"Чo Kh? Чo, Phi Thng Чo, Danh Kh? Danh, Phi Thng Danh/task_004_next"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
		"C鑓 th莕 b蕋 t? x璶g l?:",
		"Huy襫 V?/task_error",
		"Huy襫 T絥/task_005_next",
		"H鵸 Huy襫/task_error"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
		"Thng Thi謓 Nhc?",
		" Kim /task_error",
		"M閏/task_error",
		"Th駓/task_006_next",
		"H醓/task_error",
		"Th?/task_error"
	}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
		"C竔 g? l? vi thi猲 h? ch輓h?",
		"V? vi/task_error",
		"Sung Doanh/task_error",
		"Khu蕋 Chuy誸/task_error",
		"Thanh T辬h/task_007_next"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
		"Nh﹏ Ph竝 мa, мa Ph竝 Thi猲, Thi猲 Ph竝 Чo, Чo Ph竝?",
		"T? nhi猲/task_008",
		" dng/task_error",
		"V? vi/task_error",
		"H? th鵦/task_error"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- 全部回答正确了之后改变任务变量：2
function task_008()

	SetTask(1002,2);
	
	Say("Trong th阨 gian ng緉  h鋍 thu閏 Чo c kinh, xem ra t? ch蕋 ngi c騨g kh?. H穣 t譵 <color=yellow>1 thanh Hi謕 Thi誹 Ki誱<color> v? <color=yellow>1 b譶h Thi猽 t鰑<color> v?  ta b竔 t? T? s?. Hi謕 Thi誹 Ki誱 c? th? mua ? Thng 甶誱, Thi猽 t鰑 th? nh L璾 Manh ngo礽 r鮪g  l蕐, ngi c莕 g? c? th? t譵 <color=green>Minh Nguy謙 Чo уng (218, 208)<color>.",0);
	
	TaskTip("H穣 甶 t譵 1 thanh Hi謕 Thi誹 Ki誱 v? 1 b譶h Thi猽 t鰑  b竔 s?!");
	
end


function task_009()

local strMain = {
		"Kh萿 n筽 thu莕 dng kh?, th﹏ luy謓 t? kim n!",
		"Х b竔 T? s?! C? th? quay v? g苝 <color=yellow>Chng m玭<color>."
	}

	if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then
	
		TE_Talk(getn(strMain), "task_010", strMain);
		
		TaskTip("B筺  b竔 s?, c? th? quay v? t譵 Chng m玭!");
		
	else
	
		Say("Hi謕 Thi誹 Ki誱 c? th? mua ? Thng 甶誱, Thi猽 t鰑 th? nh L璾 Manh ngo礽 r鮪g  l蕐.",0);
	
	end
	
return

end

-- 删除剑和酒，并改变任务变量：3
function task_010()

	DelItem(0,2,14,1);
	DelItem(2,1,12,1);
	SetTask(1002,3);

end


-- 回见掌门的对话
function task_011()

local strMain = {
		"B莕 o s? nh薾 ngi l祄  t? i th? 4 c馻 V? ng. Sau n祔 ph秈 tu﹏ th? m玭 quy, c? g緉g luy謓 v?, ng ph? s? k? v鋘g c馻 ta."
	}
	
TE_Talk(getn(strMain), "task_012", strMain);

end


-- 与掌门对话结束，改变任务变量：4
function task_012()

	SetTask(1002,4);
	
	SetPlayerFaction(2)
	SetPlayerRoute(13)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,74,1)
		AddItem(0,108,74,1)
	elseif i==2 then
		AddItem(0,109,78,1)
		AddItem(0,108,78,1)
	elseif i==3 then
		AddItem(0,109,82,1)
		AddItem(0,108,82,1)
	else
		AddItem(0,109,86,1)
		AddItem(0,108,86,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入武当！")
	TaskTip("B筺  gia nh藀 V? ng, c? th? b竔 s? h鋍 ngh?!")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function task_exit()

end;


function task_error()

	Say("B籲g h鱱 ch璦 thu閏 Чo c Kinh, h鋍 thu閏 r錳 h穣 quay l筰!",0);

end


function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("C? ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! Ngi c? th? gia nh藀 m玭 ph竔 l筰.",0);
end;