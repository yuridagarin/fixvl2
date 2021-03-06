
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 丐帮门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 为节省任务变量而将单个变量拆分为 8 BIT，只用了前五个
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

-- 与龙在天的对话
function task_001()

local strMain = {
		"C竔 Bang ta tuy x璶g l? Thi猲 H? е Nh蕋 Чi Bang, nh璶g u l? ╪ m祔, c? b鱝 nay kh玭g bi誸 ng祔 mai. Ngi b筺 tr?! H穣 lo thi c?, kh玭g n猲 ch玭 v飅 ti襫  t鑤 p c馻 m譶h.",
		"L穙 ti襫 b鑙! C竔 Bang b綾 ch鑞g Li猽, T﹜ ch鑞g T﹜ H?, Nam ch鑞g Th? Ph錸, v? qu鑓 qu猲 th﹏ u l? nh鱪g anh h飊g h祇 hi謙, sao gi鑞g ╪ xin b譶h thng ch??",
		"T筰 h? lu玭 mu鑞 cu閏 s鑞g ti猽 di猽 t? t筰 nh? ngi trong C竔 bang, c骾 mong Bang ch? thu nh薾 t筰 h?.",
		"H穣 ra ngo礽 th祅h nh t猲 L璾 Manh l蕐 <color=yellow>6 b譶h Thi猽 t鰑<color>, r鉻 cho <color=yellow>c竎 huynh  trong bang<color> m鏸 ngi 1 ch衝,  ch鴑g ki課 ngi v祇 bang.",
		"е t? tu﹏ l謓h!"
	}

TaskTip("Long T筰 Thi猲 nh? b筺 t譵 6 b譶h Thi猽 t鰑 ph﹏ ph竧 cho c竎  t? C竔 Bang!");

TE_Talk(getn(strMain), "task_002", strMain);

end

-- 与龙在天对话结束后改变变量：1
function task_002()

	SetTask(1004,1);

end

-- 与洪七的对话
function task_003()
local strMain = {
		"Ta  nh薾 頲 Nh藀 Bang t鰑 c馻 ngi! Xin 產 t?."
	}

TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho H錸g Th蕋!");

TE_Talk(getn(strMain), "task_003_add", strMain);

end

function task_003_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_001, 1));
end


-- 与尤知味的对话
function task_004()
local strMain = {
		"Ta  nh薾 頲 Nh藀 Bang t鰑 c馻 ngi! Gi醝 l緈! Nh藀 bang xong n ch? ta c筺 ch衝!"
	}
	
TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho V璾 Tri V?!");

TE_Talk(getn(strMain), "task_004_add", strMain);

end

function task_004_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_002, 1));
end


-- 与宋元安的对话
function task_005()
local strMain = {
		"Ta  nh薾 頲 Nh藀 Bang t鰑 c馻 ngi! H穣 suy ngh? k? n猲 ch鋘 sau n祔 theo ? Y hay T辬h Y?"
	}

TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho T鑞g Nguy猲 An!");

TE_Talk(getn(strMain), "task_005_add", strMain);

end

function task_005_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_003, 1));
end


-- 与马靖生的对话
function task_006()
local strMain = {
		"Ta  nh薾 頲 Nh藀 Bang t鰑 c馻 ngi! H穣 suy ngh? k? n猲 ch鋘 sau n祔 theo ? Y hay T辬h Y?"
	}

TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho M? T辬h Sinh!");

TE_Talk(getn(strMain), "task_006_add", strMain);

end

function task_006_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_004, 1));
end


-- 与陈钟鹤的对话
function task_007()
local strMain = {
		"Ta  nh薾 頲 Nh藀 Bang t鰑 c馻 ngi! Sau khi nh藀 bang ph秈 tu﹏ th? Bang quy n誹 kh玭g ta s? kh玭g dung t譶h."
	}

TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho Tr莕 Chung H筩!");

TE_Talk(getn(strMain), "task_007_add", strMain);

end

function task_007_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005)

	if (n==0) then
		DelItem(2,1,12,1);
	end

	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_005, 1));
end


-- 返回来与龙在天的对话
function task_008()

local nTalk_001 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001);
local nTalk_002 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002);
local nTalk_003 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003);
local nTalk_004 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004);
local nTalk_005 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005);

local strMain = {
		"Huynh  trong bang u  c? ru?",
		"Х ph﹏ ph竧 xong!",
		"Hay l緈! C? ph骳 c飊g hng c? h鋋 c飊g chia ch輓h l? ti猽 ch? c馻 bang ta.",
		"T蕀 l遪g c馻 ngi qu? hi誱 th蕐! H穣 gia nh藀 C竔 Bang ta!"
	}

if (nTalk_001==1) and (nTalk_002==1) and (nTalk_003==1) and (nTalk_004==1) and (nTalk_005==1) then
	DelItem(2,1,12,1);
	TaskTip("B筺  d﹏g Nh藀 Bang t鰑 cho Bang ch? Long T筰 Thi猲!");
	TE_Talk(getn(strMain), "task_009", strMain);
else
	Say("Ngi h穣 甶 t譵 m閠 輙 Thi猽 t鰑, ph﹏ ph竧 cho huynh  trong bang",0);
end

end

-- 与龙在天对话结束后改变任务变量：2
function task_009()

	SetTask(1004,2);
	
	SetPlayerFaction(4)
	SetPlayerRoute(10)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,75,1)
		AddItem(0,108,75,1)
	elseif i==2 then
		AddItem(0,109,79,1)
		AddItem(0,108,79,1)
	elseif i==3 then
		AddItem(0,109,83,1)
		AddItem(0,108,83,1)
	else
		AddItem(0,109,87,1)
		AddItem(0,108,87,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入丐帮")
	TaskTip("B筺  gia nh藀 C竔 Bang, c? th? b竔 s? h鋍 ngh?!")

	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_gb()
FN_SetTaskState(FN_GB, 0);
Say("C? ch髏 v蕁  x秠 ra nh璶g  頲 gi秈 quy誸! B籲g h鱱 c? th? gia nh藀 m玭 ph竔 l筰.",0);
end;