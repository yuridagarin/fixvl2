-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");

Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\西北区\\昆仑\\npc\\陈不为.lua";	--默认值
g_szInforHeader = "<color=green>Tr莕 B蕋 Vi<color>:";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	--backroom_main();
	
	--一般情况下的对话
	strTalk = {
		{"Tr莕 B蕋 Vi: L莕 trc ta du ngo筺 B竎h Vi謙 ng l? vui kh玭g t? n鎖."},
		{"Tr莕 B蕋 Vi: M鏸 l莕 du ngo筺 ta u ti謓 tay thu ph鬰 y猽 ma tr猲 阯g, m鏸 l莕 ta u b? thng nh?. Kh玭g ph秈 v? ta k衜 c醝 m? khu玭 m苩 c馻 Mai s? mu閕 trong l骳 tr? thng l祄 ta kh? qu猲. "},
		{"V﹏ phi猽 t竛 th苙g h? ca dao, ti猽 di猽 t? phng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
end