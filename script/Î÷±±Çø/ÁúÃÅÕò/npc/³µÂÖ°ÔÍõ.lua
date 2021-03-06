-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 龙门镇NPC车轮霸王Script
-- By StarryNight
-- 2007/06/13 AM 10:38

-- 荒芜的世界，我们还能找到什么？

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北任务05陈仓暗度----------------------------------
	
	--与车轮对话领取05陈仓暗度任务
	if nStep_XBTask == 16 then
		task_005_01_0();
		return
	end
	
	--未与欧阳画对话询问监牢位置(获得一品堂新备称号)
	if nStep_XBTask == 17 then
		task_005_01_1();
		return
	end
	
	--尚未救出娃娃杀手前对话
	if nStep_XBTask >= 18 and nStep_XBTask <= 23 then
		task_005_01_2();
		return
	end
	
	--救出杀手娃娃交任务，完成第一个考验
	if nStep_XBTask == 24 then		
		if is_show_title_level() == 1 then --亮出一品堂新备称号 
			task_005_09_0();
		else
			xb_title_tip(1,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	---------------------------------- 西北任务06不死金丹----------------------------------
	
	--领取第二个考验
	if nStep_XBTask == 25 then
		if is_show_title_level() == 1 then --亮出一品堂新备称号 
			task_006_01_0();
		else
			xb_title_tip(1,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还没完成第二个考验
	if nStep_XBTask >= 26 and nStep_XBTask <= 29 then
		task_006_01_1();
		return
	end
	
	--完成第二个考验
	if nStep_XBTask == 30 then
		if is_show_title_level() == 1 then --亮出一品堂新备称号 
			task_006_06_0();
		else
			xb_title_tip(1,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	---------------------------------- 西北区07男儿铮骨----------------------------------
	
	--领取第三个考验
	if nStep_XBTask == 31 then
		if is_show_title_level() == 1 then --亮出一品堂新备称号 
			task_007_01_0();
		else
			xb_title_tip(1,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--未完成第三个考验
	if nStep_XBTask == 32 then
		task_007_01_1();
		return
	end
	
	--已完成第三个考验(获得一品堂-刺客称号)
	if nStep_XBTask == 33 then
		if is_show_title_level() == 1 then --亮出一品堂新备称号 
			task_007_02_0();
		else
			xb_title_tip(1,"Xa Lu﹏ B? Vng");
		end		
		return
	end
	
	--尚未见到袁飞云
	if nStep_XBTask >= 34 and nStep_XBTask <= 35 then
		task_007_02_1();
		return
	end
	
	---------------------------------- 西北区08棋逢敌手----------------------------------
	
	--领取前往询问拓拔弘的任务
	if nStep_XBTask == 36 then
		if is_show_title_level() == 1 then --亮出一品堂刺客称号 
			task_008_01_0();
		else
			xb_title_tip(2,"Xa Lu﹏ B? Vng");
		end		
		return
	end
	
	--尚未前往与拓拔弘对话
	if nStep_XBTask >= 37 and nStep_XBTask <= 38 then
		task_008_01_1();
		return
	end
	
	---------------------------------- 西北区11分支1_3帝王之墓----------------------------------
	
	--光明顶调查完后与车轮霸王对话（获得一品堂飞护称号）
	if nStep_XBTask_01 == 8 then
		if is_show_title_level() == 1 then --亮出一品堂刺客称号 
			task_011_02_0();
		else
			xb_title_tip(2,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还没与欧阳画对话，没取得金丝面罩之前
	if nStep_XBTask_01 >= 9 and nStep_XBTask_01 <=  11 then
		task_011_02_1();
		return
	end
	
	--------------------------------- 西北区12分支1_4断臂残腿----------------------------------	
	
	--取得或没取得金丝面罩
	if nStep_XBTask_01 == 12 then
		if is_show_title_level() == 1 then --亮出一品堂飞护称号 
			task_012_01_0();
		else
			xb_title_tip(3,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还没杀死断臂残腿
	if nStep_XBTask_01 == 13 then
		task_012_02_1();
		return
	end
	
	--已经杀死断臂残腿
	if nStep_XBTask_01 == 14 then
		if is_show_title_level() == 1 then --亮出一品堂飞护称号 
			task_012_03_0();
		else
			xb_title_tip(3,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还没前往与拓拔弘对话
	if nStep_XBTask_01 == 15 then
		task_012_03_1();
		return
	end
	
	---------------------------------- 西北区16分支1_7药人惊现----------------------------------
	--与车轮汇报关于陵墓的情况
	if nStep_XBTask_01 == 30 then
		if is_show_title_level() == 1 then --亮出一品堂虎翼称号 
			task_016_02_0();
		else
			xb_title_tip(4,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还未与欧阳画汇报药人一事
	if nStep_XBTask_01 == 31 then
		task_016_02_1();
		return
	end
	
	---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
	--将伪造药方交给车轮霸王（获得一品堂羽卫称号）
	if nStep_XBTask_01 == 51 then
		if is_show_title_level() == 1 then --亮出一品堂虎翼称号 
			task_020_02_0();
		else
			xb_title_tip(4,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--还未与捕快对话
	if nStep_XBTask_01 == 52 then
		task_020_02_1();
		return
	end
	
	---------------------------------- 西北区21分支1_12剑拔弩张----------------------------------
	--杀死娃娃杀手后回见车轮霸王
	if nStep_XBTask_01 == 56 then
		if is_show_title_level() == 1 then --亮出一品堂羽卫称号 
			task_021_01_0();
		else
			xb_title_tip(5,"Xa Lu﹏ B? Vng");
		end
		return
	end

	----未与拓拔弘对话
	if nStep_XBTask_01 == 57 then
		task_021_01_1();
		return
	end
	
	---------------------------------- 西北区22分支1_13大漠幻象----------------------------------	
	
	--与车轮霸王战斗
	if nStep_XBTask_01 == 60 then
		if is_show_title_level() == 1 then --亮出一品堂羽卫称号 
			task_022_01_0();
		else
			xb_title_tip(5,"Xa Lu﹏ B? Vng");
		end
		return
	end
	
	--打败车轮霸王后对话
	if nStep_XBTask_01 >= 61 then
		task_022_01_2();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"Ngi c騨g bi誸 Nh蕋 Ph萴 阯g? Xem ra danh ti課g Nh蕋 Ph萴 阯g ? Ph鬾g Tng kh? vang d閕."},
		{"V藋 ngi nghe qua Th藀 Чi Kim Cang c馻 Nh蕋 Ph萴 阯g ch璦? Ta ch輓h l? th? l躰h c馻 Th藀 Чi Kim Cang."},
		{"N誹 ngi c? h鴑g th? v韎 tin c馻 Nh蕋 Ph萴 阯g th? c? th? thng lng."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--车轮霸王死亡脚本
function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {
	"X璦 nay ta u r蕋 c秐h gi竎 kh玭g ng? m閠 ph髏 l? l?  b? t猲 ti觰 b鑙 th鮝 nc c th? c﹗, l祄 h醤g chuy謓 t鑤 c馻 ta v? t鎛 th蕋 th鵦 l鵦 c馻 Nh蕋 Ph萴 阯g. N鉯 th藅 v韎 ngi, ng祔 t祅 c馻 Чi T鑞g s緋 n r錳, s韒 mu閚 th? trung nguy猲 c騨g s? thu閏 v? T﹜ H?. C竎 ngi ch箉 kh玭g tho竧 秓 gi竎 sa m筩 u. Ha ha...",
	"Sao? Th? n祇 l? 秓 gi竎 sa m筩?",
	"Ha ha?",
	"(Kh玭g l? th莕 tr? h緉 kh玭g b譶h thng? E r籲g h緉 bi誸 頲 Nh蕋 Ph萴 阯g s? kh玭g tha cho h緉 n猲 甶猲 lo筺 r錳. Nghe gi鋘g h緉 kh玭g gi鑞g n鉯 kho竎, Th竎 B箃 ti襫 b鑙 t鴑g n鉯 T﹜ H? Ph竝 Vng ti課 v? Sa m筩 nh蕋 nh c? ﹎ m璾. Kh玭g xong r錳 ph秈 b竜 cho  dng ti襫 b鑙.)",
	}

	SetNpcLifeTime(index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Xa Lu﹏ B? Vng","Xa Lu﹏ B? Vng",507,1791,3173);
	SetNpcScript(nNpcIndex,"\\script\\西北区\\龙门镇\\npc\\车轮霸王.lua");
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 60 then
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,61);
			TaskTip("V? b竜 v韎  Dng H鋋 chuy謓 秓 gi竎 sa m筩.");
			Msg2Player("V? b竜 v韎  Dng H鋋 chuy謓 秓 gi竎 sa m筩.");
			--清除之前获得的一品堂称号
			for t=1,5 do
				RemoveTitle(60,t);
			end
			add_xb_title(6);--一品堂奸细称号
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 60 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,61);
				TaskTip("V? b竜 v韎  Dng H鋋 chuy謓 秓 gi竎 sa m筩.");
				Msg2Player("V? b竜 v韎  Dng H鋋 chuy謓 秓 gi竎 sa m筩.");
				--清除之前获得的一品堂称号
				for t=1,5 do
				RemoveTitle(60,t);
				end
				add_xb_title(6);--一品堂奸细称号
				end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
