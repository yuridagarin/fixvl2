-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务物品 破风槌 Script
-- By StarryNight
-- 2007/07/02 AM 11:14

-- 压力好大，要振作啊！

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();
local nMapDataID = GetTask(FENGSHUIXUE_ID);

	--判断任务步骤
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			if nMapDataID ~= 0 then
			
				nXworldpos,nYworldpos = Fengshuixue_MapData[nMapDataID][1],Fengshuixue_MapData[nMapDataID][2];
		
				--在目标位置范围内
				if nxpos >= (nXworldpos - 50) and nxpos <= (nXworldpos + 50) and nypos >= (nYworldpos - 50) and nypos <= (nYworldpos + 50) then
					
					SetTask(FENGSHUIXUE_STATE,GetTask(FENGSHUIXUE_STATE)+1);
					SetTask(FENGSHUIXUE_ID,0);
					
					if GetTask(FENGSHUIXUE_STATE) == 4 then
					
						strTalk = {
							"Li評 ti襫 b鑙 n鉯, 4 Phong Th駓 Huy謙  b? ph?,  n l骳 ti課 t韎 c鯽 v祇 t莕g 1 甶 t譵 ngi Tr蕁 M?, ti猽 di謙 Tr蕁 M? linh th? 頲 v祇 t莕g 2 Ho祅g L╪g m? th蕋."
							}
						DelItem(2,0,715,1);--删掉破风槌
						DelItem(2,0,714,1);--删掉罗庚
						SetTask(FENGSHUIXUE_STATE,0);
						SetTask(FENGSHUIXUE_ID,0);
						SetTask(TASK_XB_ID_01,25);
						TaskTip("дn c鯽 v祇 t莕g 2, t譵 ngi Tr蕁 M? v? ti猽 di謙 Tr蕁 M? th?  v祇 頲 t莕g 2.");
						Msg2Player("Phong th駓 trong m? th蕋  b? ph?, mau n c鯽 v祇 t莕g 1 t譵 ngi Tr蕁 M? v? ti猽 di謙 Tr蕁 M? th?  v祇 t莕g 2.");
						
					else
					
						strTalk = {
							"Х ph? th祅h c玭g 1 Phong Th駓 Huy謙, hi謓 nay  ph? 頲 "..GetTask(FENGSHUIXUE_STATE).." Phong Th駓 Huy謙, c遪 l筰 "..(4-GetTask(FENGSHUIXUE_STATE)).." c竔 ph秈 t譵 ra v? ph? h駓  ph? gi秈 ho祅 to祅 phong th駓 t莕g 1."
							}
						DelItem(2,0,713,1);--删掉一根断水杵
					end
					
				else
					
					strTalk = {
						"N誹 th蕐 ph秐 鴑g g?, dng nh? y kh玭g ph秈 Phong Th駓 Huy謙, t鑤 nh蕋 v蒼 n猲 d飊g La Canh xem x衪 cho k?."
						}
				end
				
			else
				
				strTalk = {
					"N誹 th蕐 ph秐 鴑g g?, dng nh? y kh玭g ph秈 Phong Th駓 Huy謙, t鑤 nh蕋 v蒼 n猲 d飊g La Canh xem x衪 cho k?.",
					}	
			end
		
		else
			
			strTalk = {
				"Li評 T飊g V﹏ ti襫 b鑙 t鮪g n鉯 Ph? phong ch飝 c莕 頲 t ? t莕g 1 Ho祅g L╪g m? th蕋 c? ph竧 huy t竎 d鬾g, s? d鬾g ? y s? kh玭g cho k誸 qu? g? u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"Х ph? h駓 phong th駓 trong m?,  n l骳 ti誴 t鬰 n c鯽 v祇 t莕g 1 t譵 ngi Tr蕁 M? v? ti猽 di謙 Tr蕁 M? linh th?  ti課 v祇 t莕g 2 Ho祅g L╪g m? th蕋.",
			}
		
	else
		strTalk = {
			"V藅 n祔 dng nh?  kh玭g c遪 t竎 d鬾g n鱝.",
			}
		DelItem(2,0,715,1);--删掉破风槌
		
	end
	
	TalkEx("",strTalk);
	
end
