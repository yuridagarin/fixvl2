-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理80任务过程处理文件
-- By StarryNight
-- 2006/01/13 PM 20:39

--大伙去看《金刚》去了，独自一人加班ing…… 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--打败段承恩后与二皇子对话
function task_000_00()
	
local strTalk = {
	"祅 Th鮝   b? nh b筰 r錳, l? n祇 ngi l筰 n鑙 gi竜 cho gi芻?",
	"{Nh? Ho祅g T鰙 cp ng玦, l筰 c蕌 k誸 v韎 {Xi H醓 gi竜} ph秐 lo筺, y 頲 xem l? vi謈 ch輓h ngh躠 sao?",
	"C竔 g? l? c蕌 k誸 v韎 Xi H醓 gi竜? C竔 g? l? ph秐 lo筺? Ngi ch? hi觰 g? ch? n鉯 b鮝 th玦.",
	"Ch? ph秈 ngi  tranh ng玦 c馻 {Tam Ho祅g T鰙 sao? {Tam Ho祅g T鰙 l猲 ng玦 l? do ? c馻 {Ti猲 }, ngi n猲 t? b? ? nh n祔 甶.",
	"C竔 g? l? th竛h ? c馻 ti猲 ? Ph? ho祅g ch? mu鑞 ta l? ngi k? v?, ng ti誧 l? L穙 tam  l祄 gi? th竛h ch?, y ta n Чi L? c遪 vu kh鑞g ta c蕌 k誸 v韎 Xi H醓 gi竜  t竎 lo筺. Ngi k? v? ch輓h l? ta!",
	"H鮩, {Tam Ho祅g T鰙 d竚 gi? th竛h ch? ??",
	"Chi誹 th? th藅 c馻 Ti猲 Ho祅g 產ng ? trong tay ta, nh璶g ng ti誧 l? kh玭g c? c? h閕  ch鴑g minh m? th玦.",
	"V藋 t筰 h? c? th? gi髉 甶謓 h? 甧m {chi誹 th瓆 n祔 n {фng Qu鑓 S瓆, 玭g 蕐 c? th? ch鴑g minh th藅 gi?.",
	"фng Qu鑓 S? tuy  ph竔 binh n chi猽 m? ta, nh璶g c騨g c莕 ch鴑g minh y ch th藅 l? b髏 t輈h c馻 Ho祅g thng, ngi 甧m n  gi髉 ta.",
	"T筰 h? s? 甧m th? n祔 n cho {фng Qu鑓 S瓆 x竎 minh, c? g? s? th玭g b竜 ngay cho 謓 h?.",
	"Ngi 甶 mau 甶, nh? b秓 tr鋘g!",
	}
	TalkEx("",strTalk);
	AddItem(2,0,381,1);--得到二皇子的信物
	TaskTip("m chi誹 th? n cho фng Qu鑓 S?.");
	Msg2Player("m chi誹 th? n cho фng Qu鑓 S?.");
	SetTask(TASK_DL_LV80_ID,3);
	GivePlayerAward("Level_76","xn_step_1");
	GivePlayerExp(SkeyDali,"duanchengen")
	return

end;