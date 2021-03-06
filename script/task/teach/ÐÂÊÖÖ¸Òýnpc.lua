--获取表格支持
Include("\\script\\class\\ktabfile.lua");
--引用字符串处理支持
Include("\\script\\task\\world\\task_head.lua");
--表格初始化
tabTaskInfo 		 =  new(KTabFile,"\\settings\\task\\task_info.txt");
tabNpcPos 			 =  new(KTabFile,"\\settings\\task\\npc_pos_info.txt");
tabLevelTaskInfo =  new(KTabFile,"\\settings\\task\\level_task.txt");
tabZXTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info_zx.txt");

function main()
	Say("V? b籲g h鱱 n祔 t譵 ta c? chuy謓 g??",
		8,
		"T譵 hi觰 nhi謒 v?./Renwuchaxun",
		"T譵 hi觰 vi謈 c莕 l祄./#ShowTaskInfo(1,1)",
		"Hng d蒼 s? d鬾g v? c玭g./wuogongmiji",
		"H筺 ch? 甶襲 ki謓 m? b秐 ./mapkaiqi",				
		"T譵 hi觰 v? tr? ngi ch? nh./Chaxunnpc",
		"T譵 hi觰 th阨 gian hi謓 t筰./Timechaxun",
		"Ta mu鑞 c? 1 quy觧 Giang h? ch? nam./yaoshu",		
		"R阨 kh醝./cancel")
end

function cancel()
end

function Renwuchaxun()
	Say("Ngi mu鑞 h醝 chuy謓 g??",
			3,
		"T譵 hi觰 nhi謒 v? ch? tuy課./#ShowTaskInfo(1,2)",
		"T譵 hi觰 nhi謒 v? ph? tuy課./#ShowTaskInfo(1,3)",
		"Nh﹏ ti謓 gh? qua th玦!/main")	
end

function Chaxunnpc()
	Say("Ngi mu鑞 h醝 ngi n祇?",
			3,
		"T譵 ngi ch? nh./GetNpcName",
		"T譵 hi觰 nh﹏ v藅 trong th祅h./#ShowMapNpcPos(1)",
		"Nh﹏ ti謓 gh? qua th玦!/main")	
end
	
function ShowTaskInfo(nNum,nType)

local i = 0;
local strTalk = "Nhi謒 v? c馻 ngi:";
local nTaskInfoStr = "";
local RowNumTab = SearchTaskInfoRowNum(nType);
local tabTaskFile = GetTaskTabFile(nType);

	if getn(RowNumTab) == 0 then
		TalkEx("",{"Hi謓 ngi kh玭g c? nhi謒 v?."})
		return
	end
	
	if nNum == 1 then
		if getn(RowNumTab) <= nNum then
			TalkEx("",{"Nhi謒 v? c馻 ngi:"..tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
		else
			nNum = nNum + 1;
			TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{"Nhi謒 v? c馻 ngi:"..tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
		end
	elseif nNum >= getn(RowNumTab) then
		TalkEx("",{tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
	else
		nNum = nNum + 1;
		TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
	end
end

--根据角色等级，相关变量值返回能做任务的ID
function SearchTaskInfoRowNum(nType)

local i = 0;
local j = 0;
local nTaskID = 0;
local nTaskVaule = 0;
local nLevel = GetLevel();
local RowNumTab = {};
local tabTaskFile = GetTaskTabFile(nType);
	
	for i=3,tabTaskFile:getRow() do
		if nLevel >= tonumber(tabTaskFile:getCell(i,"Level")) then
			nTaskID = tonumber(tabTaskFile:getCell(i,"TaskID"));
			nTaskVaule = tonumber(tabTaskFile:getCell(i,"TaskValue"));
			if GetTask(nTaskID) == nTaskVaule then
				tinsert(RowNumTab,i);
			end
		end
	end
	
	return RowNumTab

end


function GetNpcName()
	
	Msg2Player("Xin nh藀 t鋋  Npc mu鑞 t譵.");
	AskClientForString("SearchNpcName","",1,14,"Xin nh藀 t猲 Npc");
	
end

function SearchNpcName(nNpcName,nNum)

local i = 0;
local nPosX = 0;
local nPosY = 0;
local nNpcNameS = "";
local nMapName = "";
local nTabName = "";
local strSay = {};
local NameTab = {};
local PosRowNumTab = {};
	
	--含有非法字符
	for i=1,strlen(nNpcName) do
		if strbyte(nNpcName,i) <= 127 then
			TalkEx("GetNpcName",{"Kh玭g th? t譵 ki誱, xin nh藀 l筰!"});
			return
		end
	end
	
	if nNum == 0 then
		nNum = 1;
	end
	
	--查找完全匹配名字
	for i=3,tabNpcPos:getRow() do
		if nNpcName == tabNpcPos:getCell(i,"NpcName") then
			tinsert(PosRowNumTab,i);
		end
	end
	
	if getn(PosRowNumTab) >= 1 then
		tinsert(strSay,"T鋋  Npc \n");
	else
		--查找含有名字关键字人名
		for i=1,strlen(nNpcName) do
			tinsert(NameTab,strsub(nNpcName,i,i+1))
			i = i+1;
		end
		
		for i=1,getn(NameTab) do
			for j=3,tabNpcPos:getRow() do
				nTabName = tabNpcPos:getCell(j,"NpcName");
				for k=1,strlen(nTabName) do	
					if NameTab[i] == strsub(nTabName,k,k+1) then
						tinsert(PosRowNumTab,j);
					else
						k = k + 1;
					end
				end
			end
		end
		
		if getn(PosRowNumTab) >= 1 then
			tinsert(strSay,"Kh玭g t譵 th蕐 t鋋  Npc, nh鱪g t鋋  li猲 quan \n");
		else
			TalkEx("",{"Xin l鏸! Kh玭g t譵 th蕐 t鋋  Npc, th? ki觤 tra l筰 t猲 Npc!"});
			return
		end
	end
		
	if getn(PosRowNumTab) - nNum < 5 then		
		for i=nNum,getn(PosRowNumTab) do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang trc/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		tinsert(strSay,"R阨 kh醝/main");
		SelectSay(strSay)
		return
	else	
		for i=nNum,nNum + 4 do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang trc/#SearchNpcName(\""..nNpcName.."\","..nNum..")");	
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang k?/#SearchNpcName(\""..nNpcName.."\","..nNum..")");	
		tinsert(strSay,"R阨 kh醝/main");
		SelectSay(strSay)
		return
	end
end

function ShowMapNpcPos(nNum)

local i = 0;
local j = 0;
local nPosX = 0;
local nPosY = 0;
local nMapName = "";
local nNpcName = "";
local strSay = {};
local PosRowNumTab = {};
local nMapID = GetWorldPos();

	for i=3,tabNpcPos:getRow() do
		if nMapID == tonumber(tabNpcPos:getCell(i,"MapID")) then
			tinsert(PosRowNumTab,i);
		end
	end
	
	if getn(PosRowNumTab) <= 0 then
		TalkEx("",{"Xin l鏸! Khu v鵦 n祔 kh玭g t譵 th莥 t鋋  Npc."});
	elseif getn(PosRowNumTab) - nNum < 5 then
		tinsert(strSay,"T鋋  Npc ? khu v鵦 n祔 \n \n");
		for i=nNum,getn(PosRowNumTab) do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang trc/#ShowMapNpcPos("..nNum..")");
		end
		tinsert(strSay,"R阨 kh醝/main");
		SelectSay(strSay)
	else
		tinsert(strSay,"T鋋  Npc ? khu v鵦 n祔 \n \n");
		for i=nNum,nNum + 4 do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,20-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName..nMapName.."     "..nPosX.."     "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"Trang trc/#ShowMapNpcPos("..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"Trang k?/#ShowMapNpcPos("..nNum..")");
		tinsert(strSay,"R阨 kh醝/main");
		SelectSay(strSay)
	end
end

--获取对应表格
function GetTaskTabFile(nType)

local tabTaskFile;

	if nType==1 then
		tabTaskFile = tabLevelTaskInfo;
	elseif nType==2 then
		tabTaskFile = tabTaskInfo;
	elseif nType==3 then
		tabTaskFile = tabZXTaskInfo;
	end
	
	return tabTaskFile;
	
end

function Timechaxun()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." gi? "..nMin.." Ph髏 "
	Talk(1,"main","Th阨 gian hi謓 t筰 <color=yellow>"..sTimeLeft.."<color>. C竎 v? i hi謕 nh? n緈 b総 th阨 gian!");
end;

function wuogongmiji()		--武功和秘籍的说明
	Say("Ngi mu鑞 h醝 v莕  g??",
			3,
		"C竎h s? d鬾g v? c玭g./Wugongshuoming",
		"C竎h s? d鬾g m藅 t辌h./Mijishuoming",
		"Kh玭g c莕 u!/main")	
end

function Wugongshuoming()		--武功说明
	Say("Ngi mu鑞 h醝 v莕  g??",
			6,
		"L祄 sao s? d鬾g v? c玭g./shiyongwugong",
		"L祄 sao ch鋘 ng c蕄 v? c玭g./xuanzewugongdengji",
		"V? c玭g chu閠 tr竔 v? chu閠 ph秈 c? ph﹏ bi謙 kh玭g?/zuojianyoujian",
		"L祄 sao   s? d鬾g c竎 s? ph輒 t総 b猲 di?/bianjikuaijie",		
		"Ngo礽 thanh s? ph輒 t総 ra c遪 ph輒 t総 v? c玭g kh玭g?/qitakuaijie",	
		"Kh玭g c莕 u!/main")	
end

function shiyongwugong()
		Say("\n Giao di謓 b猲 di l? 2 ? tr竔 ph秈 ch鴄 k? n╪g v? c玭g, nh蕁 v祇 ch鋘 k? n╪g mu鑞 s? d鬾g l? 頲.\n \n Thao t竎: \n Nh蕁 v祇 thanh v? c玭g b猲 di - b猲 ph秈 ch鋘 v? c玭g - nh蕁 chu閠 tr竔 l猲 v? c玭g", 0);	
end;

function xuanzewugongdengji()
		Say("\n Mu鑞 s? d鬾g v? c玭g kh竎, ph秈 qua thao t竎 sau. \n Trc ti猲 nh蕁 chi猽 th鴆 m玭 ph竔 ho芻 F5. \n Sau  ch鋘 v? c玭g ch? ng (v? c玭g b? ng kh玭g th? ch鋘 ng c蕄) s? hi謓 giao di謓 ch鋘 v? c玭g. \n Cu鑙 c飊g ch鋘 k? n╪g th輈h h頿, nh蕁 ph輒 t総 s? l? 頲.",
		1,
		"Trang k?/xuanzewugongdengji2")
end

function xuanzewugongdengji2()
		Say("\nV? sau nh蕁 ph輒 t総 s? tng 鴑g v? c玭g l? c? th? s? d鬾g cho chu閠 ph秈. \n\nThao t竎: \nNh蕁 F5 - m? giao di謓 v? c玭g - nh蕁 v? c玭g b蕋 k? (tr? v? c玭g b? ng) - m? giao di謓 v? c玭g l鵤 ch鋘 - nh蕁 ph輒 t総 s? tng 鴑g v? c玭g l? c? th? s? d鬾g cho chu閠 ph秈.",0)
end

function zuojianyoujian()
		Say("\n V? c玭g chu閠 tr竔 khi nh蕁 l猲 qu竔 s? nh li猲 t鬰. \n V? c玭g chu閠 ph秈 khi nh蕁 l猲 qu竔 n誹  m筺h ch? nh m閠 l莕.", 0);	
end;

function bianjikuaijie()
		Say("\n Thanh ph輒 t総 s? g錷 4 t? cho ngi ch琲 s? d鬾g \n Nh蕁 m騣 t猲 b猲 ph秈 thanh ph輒 t総 s? s? th蕐 頲 giao di謓 S緋 x誴, b筺 c? th? a v? c玭g, trang b?, m藅 t辌h, o c? v祇 thanh ph輒 t総. \n S緋 x誴 xong thanh ph輒 t総 b猲 ph秈 c? h譶h kh鉧 m芻 nh, kh鉧 l筰 l? kh玭g th? thay i. \nTa c? th? d飊g m騣 t猲 l猲 xu鑞g thay i thanh ph輒 t総, ho芻 d飊g d蕌 ~.",
		1,
		"Trang k?/bianjikuaijie2")
end
		
function bianjikuaijie2()		
		Say("\n M芻 nh thanh ph輒 t総 theo th? t? 1 - 2 - 3 - 4. Sau khi kh鉧 ? ph輒 t総, khi s? d鬾g s? b? qua ? , v? d?: Kh鉧 ? 3. theo th? t? s? l? 1 - 2 - 4 - 1.", 0);	
end;

function qitakuaijie()
		Say("\n Ngo礽 thanh ph輒 t総 s?, trong thanh v? c玭g nh蕁 Q, W, E, A, S, D, Z, X, C  thi誸 l藀 ph輒 t総 nhanh cho v? c玭g . \n", 0);	
end;

function Mijishuoming()		--秘籍说明
	Say("Ngi mu鑞 h醝 v莕  g??",
			7,
		"M藅 t辌h d飊g  l祄 g??/mijizuoyong",
		"в t╪g cng v? c玭g n猲 d飊g m藅 t辌h g??/jinengqianghua",
		"Phng th鴆 tu luy謓./xiuweishuoming",		
		"Ta d飊g bao nhi猽 quy誸 y誹, m藅 t辌h y?/qitashuoming",
		"L祄 c竎h n祇  h鋍 m藅 t辌h?/mijixiulian",		
		"Sao ph﹏ bi謙 m藅 t辌h?/haohuaipanduan",	
		"Kh玭g c莕 u!/main")	
end

function mijizuoyong()
		Say("\n M鏸 m藅 t辌h u mang v? c玭g, sau khi tu luy謓 t n m閠 tr譶h  nh蕋 nh s? s? d鬾g 頲 m藅 t辌h v? c玭g . \nM藅 t辌h g緉 quy誸 y誹 c? th? l祄 m筺h th猰 v? c玭g.", 0);	
end;

function jinengqianghua()
		Say("\n M鏸 m藅 t辌h c? 4 gi? tr? ph﹏ bi謙 Th猰 h? nh ch? ng ngo筰 c玭g; Th猰 h? nh ch? ng n閕 c玭g; Th猰 nh h? tr?; Th猰 ph遪g th?. \n M鏸 quy誸 y誹 tng 鴑g v韎 1 v? c玭g v? mang 1 trong 4 lo筰 tr猲. Khi g緉 quy誸 y誹 v祇 m藅 t辌h s? c╪ c? tr? s? v? lo筰 h譶h t?  c閚g th猰 cho v? c玭g. \n Nh蕁 chu閠 ph秈 l猲 quy誸 y誹  g緉 v祇 m藅 t辌h. ",
		1,
		"Trang k?/xiuweishuoming2")
end

function jinengqianghua2()
		Say("\n V? d?: \n T竎 d鬾g c馻 quy誸 y誹 T輈h Dng ki誱 kh? l? t╪g t鑓  thi tri觧, l韓 nh蕋 25%. Thu閏 k? n╪g ch? ng h? n閕 c玭g. \n Khi 頲 g緉 v祇 m藅 t辌h h? nh ch? ng n閕 c玭g th猰 80% s? ph竧 huy t鑓  thi tri觧 chi猽  (25%*80%) t鴆 20%.", 0);	
end;

function xiuweishuoming()
		Say("\n Tu luy謓 l? ch? t筼 m藅 t辌h, th玭g qua th阨 gian tr猲 m筺g. \n B? quan tu luy謓 gi髉 t╪g t鑓 ng th阨 m閠 s? ch鴆 n╪g v? ho箃 ng nh? Th竔 H? Huy詎 c秐h c騨g tr鵦 ti誴 nh薾 頲 tu luy謓.", 0);	
end;

function qitashuoming()
		Say("\n M藅 t辌h g緉 頲 bao nhi猽 quy誸 y誹 l? do s? lng ph? l鬰. M? th猰 s? tr? m藅 t辌h v? s? lng ph? l鬰 c? th? th玭g qua tu luy謓 m藅 t辌h n﹏g cao ng c蕄 nh薾 頲.", 0);	
end;

function mijixiulian()
		Say("\n Trc ti猲 trang b? m閠 quy觧 m藅 t辌h, nh蕁 n髏 chi猽 th鴆 m玭 ph竔 ho芻 F5 m? giao di詎 v? c玭g, sau  nh蕁 n髏 ph﹏ trang. Nh蕁 ti誴 tu luy謓 nh藀 tr? tu luy襫 c莕 t鑞, x竎 nh  luy謓 m藅 t辌h. \n \n Thao t竎: \n Nh蕁 F5 m? giao di謓 v? c玭g - nh蕁 ph﹏ trang m藅 t辌h - nh蕁 tu luy謓 - nh藀 s? nh蕁 *уng ?* l? 頲.",	
		1,
		"Trang k?/mijixiulian2")
end

function mijixiulian2()
		Say("\n M藅 t辌h c蕄 9 - c蕄 10, c蕄 19 - c蕄 20卌蕄 89 - c蕄 90, c蕄 98 - c蕄 99 u c? t? l? l躰h ng? v? c玭g, v? v藋 tu luy謓 v? sau s? cao h琻 nhi襲. H琻 n鱝 ph秈 tu luy謓  c蕄 m韎 c? th? ti誴 t鬰. M藅 t辌h b総 u tu luy謓 m鏸 l猲 1 c蕄 s? c? t? l? t╪g 甶觤 s? v? s? trang ph? l鬰.", 0);	
end;

function haohuaipanduan()
		Say("\n Nh薾 nh m藅 t辌h b籲g c竎h: \n Th? 1. t莕g s? l躰h ng? k? n╪g. \n Th? 2. s? trang ph? l鬰. \n Th? 3. tr? c閚g th猰 m藅 t辌h. \n V? v藋 m閠 quy觧 m藅 t辌h lo筰 t鑤 ngo礽 c莕 t莕 s? k? n╪g cao ra quan tr鋘g s? trang ph? l鬰 v? c閚g th猰 k? n╪g.", 0);	
end;

function mapkaiqi()		--地图开启查询
	Say("Ngi kh玭g v祇 頲 n琲 n祇?",
			8,
		"Чi th秓 nguy猲 ph輆 b綾 Nh筺 M玭 quan./dacaoyuan",
		"B? l筩 Vng K? ph輆 b綾 Чi th秓 nguy猲./wangqibulu",
		"Giang T﹏ Th玭 ? hng ng nam Th祅h Й ph?./jiangjincun",		
		"Phong Ma ng ? Giang T﹏ Th玭./fengmodong",
		"Phong Й Qu? th祅h ph輆 ng Giang T﹏ Th玭./fengduguicheng",		
		"Йng H秈 H秈 T﹏ g莕 Tuy襫 Ch﹗./donghaihaibin",
		"Trang sau./mapkaiqi2",			
		"Ta kh玭g c? b秐   v祇 trong./main")	
end

function mapkaiqi2()		--地图开启查询
	Say("Ngi kh玭g v祇 頲 n琲 n祇?",
			8,
		"Уo Hoa o ? ngo礽 bi觧./taohuadao",
		"Thanh Kh? ng ? Long Tuy襫 Th玭./qingxidong",
		"Lng Th駓 ng ? V? Di s琻./liangshuidong",		
		"Thi猲 T莔 th竝 ? Чi L?./qianxunta",
		"T﹜ Song B秐 N筽 ? ph輆 nam 觤 Thng s琻./xishuangbanna",		
		"Long Nh穘 ng ? 觤 Thng s琻./longyandong",
		"Trang trc./mapkaiqi",				
		"Ta kh玭g c? b秐   v祇 trong./main")	
end

function dacaoyuan()
		Say("\n Mu鑞 v祇 Чi th秓 nguy猲 ph秈 m? h? th鑞g nhi謒 v? Thi猲 M玭 tr薾, ho祅 th祅h xong t譵 H祅 Tr? Nhng.", 0);	
end;

function wangqibulu()
		Say("\n Mu鑞 v祇 b? l筩 Vng K? ph秈 m? h? th鑞g nhi謒 v? Thi猲 M玭 tr薾, sau khi ho祅 th祅h nhi謒 v? Чi th秓 nguy猲 h鑙 l? cho l輓h canh b? l筩 ho芻 gi髉 Nhi猽 L﹏ chuy觧 h祅g.", 0);	
end;

function jiangjincun()
		Say("\n Mu鑞 v祇 Giang T﹏ Th玭 ph秈 l祄 h? th鑞g nhi謒 v? Phong Й Qu? th祅h, ho祅 th祅h nhi謒 v? n筺 d﹏ Th祅h Й, t譵 Trng ёnh.", 0);	
end;

function fengmodong()
		Say("\n Mu鑞 v祇 Phong Ma ng ph秈 m? h? th鑞g nhi謒 v? Phong Й qu? th祅h, gi髉 Trng ёnh gi秈 c xong b総 u nhi謒 v? gi髉 Dng Nguy謙 s? th竔 thu th藀 U Linh.", 0);	
end;

function fengduguicheng()
		Say("\n Mu鑞 v祇 Phong Й Qu? th祅h ph秈 m? h? th鑞g nhi謒 v? Phong Й qu? th祅h, gi髉 ch? t筼 чn 萵 linh ph?, mang v藅 ph萴 ch? nh.", 0);	
end;

function donghaihaibin()
		Say("\n Mu鑞 v祇 Йng H秈 H秈 T﹏ ng c蕄 ph秈 t? 50 tr? l猲, nh薾 nhi謒 v? ? Vi詎 Tinh [(198.199) B綾 Tuy襫 Ch﹗].", 0);	
end;

function taohuadao()
		Say("\n Mu鑞 v祇 Уo Hoa o ph秈 m? nhi謒 v? Йng H秈 H秈 T﹏, ph輆 ng Йng H秈 H秈 T﹏ 2 t譵 thuy襫 phu ng錳 thuy襫.", 0);	
end;

function qingxidong()
		Say("\n Mu鑞 v祇 Thanh Kh? ng ph秈 m? h? th鑞g nhi謒 v? H? H莡 C莔 ? Dng Ch﹗, nh薾 nhi謒 v? c鴄 L玦 Th緉g trong Thanh Kh? ng.", 0);	
end;

function liangshuidong()
		Say("\n Mu鑞 v祇 Lng Th駓 ng ph秈 m? h? th鑞g nhi謒 v? H? H莡 C莔 Dng Ch﹗, gi髉 L璾 Huy襫 Thanh n Thanh Kh? ng nh Thng th莕.", 0);	
end;

function qianxunta()
		Say("\n Mu鑞 v祇 Thi猲 T莔 th竝 ng c蕄 t? 70 tr? l猲.", 0);	
end;

function xishuangbanna()
		Say("\n Mu鑞 v祇 T﹜ Song B秐 N筽 b綾 ng c蕄 t? 75 tr? l猲.", 0);	
end;

function longyandong()
		Say("\n Mu鑞 v祇 Long Nh穘 ng ph秈 m? h? th鑞g nhi謒 v? ? Tr辬h Qu竛 Chi Чi L?, nh薾 nhi謒 v? t譵 b筺 ng h祅h m蕋 t輈h ? Long Nh穘 ng.", 0);	
end;

function yaoshu()
		Say("Ngi gi? k?, ng  m蕋 n鱝 nh?!", 0);	
		AddItem(2,0,505,1)
end;

function no()

end