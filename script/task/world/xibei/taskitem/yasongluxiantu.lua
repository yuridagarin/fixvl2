-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务物品押送路线图Script
-- By StarryNight
-- 2007/06/12 PM 3:15

-- 没有原则，和做一条狗有咩分别？

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nMapName = "";
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = 0,0,0,0,0;
local mapID,xPos,yPos = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {};
local nStep_XBTask = GetTask(TASK_XB_ID);

	--判断任务步骤
	if nStep_XBTask >= 20 and nStep_XBTask <= 23 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--尚未取得烟幕弹
		if nStep_XBTask <= 22 or GetItemCount(2,0,694) <= 0 then
			strTalk = {
				"Theo b秐  阯g 甶 c馻 Vi猲 b? u, 畂祅 竝 t秈 S竧 th? Oa Oa ch綾 ch緉 s? 甶 ngang "..nMapName.."("..nXpos..", "..nYpos..") n祔. N誹 v蒼 ch璦 t譵 頲 n kh鉯 d飊g khi cp t? nh﹏, h穣 mau t韎 Ph鬾g Tng t譵 Di謕 l穙.",
				}
			TalkEx("",strTalk);
		else
			strTalk = {
				"Theo b秐  阯g 甶 c馻 Vi猲 b? u, 畂祅 竝 t秈 S竧 th? Oa Oa ch綾 ch緉 s? 甶 ngang "..nMapName.."("..nXpos..", "..nYpos..") n祔. Nay  c? 頲 n kh鉯 n猲 mau ch鉵g 甶 c鴘 S竧 th? Oa Oa. ",
				}
			TalkEx("",strTalk);
		end
	else
		strTalk = {
			"S竧 th? Oa Oa  頲 c鴘, b秐  n祔 c騨g ch糿g c遪 t竎 d鬾g n鱝, n猲 v鴗 甶  tr鑞g ch?.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,693,1);
	end		

end
