-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC司马鸣风Script
-- By StarryNight
-- 2007/06/25 PM 3:13

-- 疲倦就是即使遇到令你开心的事，但是依然兴奋不起来。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

local tbSayDialog = {};
local nSaySize = 0;
local szSayHead = "Ta n緈 gi? b? k輕 ch? t筼 Chuy觧 Sinh Кn do Nguy猲 Th駓 Thi猲 T玭  l筰. N誹 mu鑞 ta ch? t筼 Chuy觧 Sinh Кn, ngi h穣 gi髉 ta ho祅 th祅h c竎 vi謈 sau y: 300 nhi謒 v? s? m玭, 30 l莕 Th竔 H? Huy詎 C秐h, 81 l莕 T礽 Nguy猲 Chi課, 30 l莕 Lng S琻, 33 l莕 Tr? An (B譶h Thi猲 H?), 33 l莕 Th駓 L頸 (B譶h Thi猲 H?), 300 H箃 Gi鑞g, 181 B竧 nh? nh?, 99 B竧 nh? l韓, 99 c﹜ T? Linh"

if GetTask(TSK_CSD) < 1 then
	szSayHead = "Ta c秏 th蕐 vui v? v? may m緉 th? ta m韎 ch? t筼 Chuy觧 Sinh Кn 頲"
--	tinsert(tbSayDialog, "Nh薾 nhi謒 v? Chuy觧 Sinh Кn (ti猽 hao 7 ng玦 sao may m緉)/get_mission_CSD")
elseif GetTask(TSK_CSD) == 1 then
	tinsert(tbSayDialog, "Gi髉 ch? t筼 Chuy觧 Sinh Кn (ti猽 hao 999 Thi猲 th筩h + 333 B竛h b閠 v祅g)/get_CSD")
	tinsert(tbSayDialog, "Ho祅 th祅h nhanh s? lng nhi謒 v? s? m玭 c遪 l筰 (4 xu v藅 ph萴/1 nhi謒 v?)/finish_sumon")	
elseif GetTask(TSK_CSD) == 2 then
	local szSayHead = "Ta 產ng i n猲 kh玭g c? s鴆  ch? t筼 Chuy觧 Sinh Кn, h穣 cho ta 333 B竛h b閠 v祅g  l鉻 d?."
	tinsert(tbSayDialog, "Gi髉 ╪ no  ch? t筼 Chuy觧 Sinh Кn (ti猽 hao 333 B竛h b閠 v祅g)/confirm_get_CSD")	
else
	local szSayHead = "B﹜ gi? ta s? ch? t筼 Chuy觧 Sinh Кn cho i hi謕, nh璶g h穣 cho ta th猰  333 B竛h b閠 v祅g  d? tr? nha !!!."
	tinsert(tbSayDialog, "Ch? t筼 Chuy觧 Sinh Кn (ti猽 hao 333 B竛h b閠 v祅g)/get_confirm_get_CSD")
end
	tinsert(tbSayDialog, "Xem s? lng c竎 nhi謒 v?/get_CSD_infor")
	tinsert(tbSayDialog,"фi Chuy觧 Sinh Кn (c? th? giao d辌h, c? h筺 s? d鬾g 30 ng祔) - ti猽 hao 2 C璾 Thi猲 V? C鵦 Кn/exchange_CSD"	)	
	tinsert(tbSayDialog,"K誸 th骳 i tho筰/nothing"	)	
nSaySize = getn(tbSayDialog);
Say(szSayHead, nSaySize, tbSayDialog);
	---------------------------------- 西北任务08棋逢敌手----------------------------------
	
	--受拓拔弘所嘱，带伤药给司马鸣风
	if nStep_XBTask == 38 then
		task_008_03_0();
		return
	end
	
	--尚未与欧阳画或拓拔弘对话
	if nStep_XBTask == 39 then
		task_008_03_1();
		return
	end
	
	---------------------------------- 西北区13分支1_5音绝古墓----------------------------------
	--将金丝面罩交给司马鸣风
	if nStep_XBTask_01 == 16 then
		task_013_02_0();
		return
	end
	
	--尚未询问欧阳画入墓情况
	if nStep_XBTask_01 == 17 then
		task_013_02_1();
		return
	end
	
	---------------------------------- 西北区15分支1_6古墓风云----------------------------------
	--将墨斗与玉佩交给司马鸣风
	if nStep_XBTask_01 == 28 then
		task_015_04_0();
		return
	end
	
	--还未与拓拔弘对话
	if nStep_XBTask_01 == 29 then
		task_015_04_1();
		return
	end
	
	--赠送皇陵密室门票
	if GetBit(GetTask(GIVE_TICKET_STATE),3) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"Giang h? r閚g l韓, u l? n琲 c莕 n?"},
		{"V? c玭g thi猲 h?  nh蕋 l? ai?"},
		{"suy th秓 t? dng, c? b竎h thi猲 thng, c萴 t?  lai tam lng h祅h?"},
		{"T﹜ H? qu? nhi猲 l? t ng鋋 h? t祅g long, n誹 kh玭g sao l筰 ﹎ m璾 th玭 t輓h trung nguy猲?"},
		}
	local i = random(1,getn(strTalk));

	--TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"T? M? Minh Phong: Xin ch祇 <sex>, l﹗ r錳 kh玭g g苝. Nghe n鉯 ngi bi誸 m閠 s? tin t鴆 trong Ho祅g l╪g m? ? ch? Li評 ti猲 sinh, c? li猲 quan n T? Qu﹏ v? ta?",
	"Ngi ch琲: ng, T? M? ti襫 b鑙, ta n t譵 玭g c騨g v? chuy謓 n祔, chuy謓 M? Kim ph? c馻 Li評 ti猲 sinh 產ng c蕋 gi蕌, v? c馻 ti襫 b鑙 18 n╩ trc  v祇 T莕 L╪g t譵 b秓 v藅. Ta  n l╪g m?, nh璶g t譵 kh玭g ra manh m鑙 c馻 b? ta.",
	"T? M? Minh Phong:  t? <sex>, v? chuy謓 n祔 m? ngi  n T莕 L╪g. цi v韎 v? ta, khi c莔 M芻 u Ki誱 m? <sex> t譵 gi髉, ta  bi誸 T? Qu﹏ ch誸 trong m?. T? Qu﹏ l? ngi con g竔 ki猲 cng, lu玭 c? ch蕄, n誹 c? ta 甶 t譵 ki誱 th? s? kh玭g b? ki誱 m? 甶. H琻 n鱝 mi課g ng鋍 b閕 Minh Phong n祔 kh玭g th? r琲 l筰, ng鋍 c遪 ngi c遪, ng鋍 ch誸 ngi ch誸.",
	"Ngi ch琲: Nh璶g ti襫 b鑙, trong l╪g m? kh玭g nh譶 th蕐 x竎 c馻 v? ti襫 b鑙, sao c? th? d? d祅g k誸 lu薾 v藋 ch??",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T? M? Minh Phong: T﹎ ? c馻 <sex>, ta kh綾 ghi v祇 l遪g. C? l? i v韎 T? Qu﹏, vi謈 t譵 ki誱 c馻 ta m韎 l? m閠 k誸 c鬰. 18 n╩, hy v鋘g c馻 ta tan bi課 d莕, sau n祔 bi誸 頲 T? Qu﹏ v? M芻 u ki誱  v祇 Ho祅g l╪g, hy v鋘g n祔 c騨g  n l骳. Nh璶g, theo k? v鋘g c馻 T? Qu﹏, ta l筰 kh玭g d竚 qu猲.",
	"Ngi ch琲: Trong th阨 gian 18 n╩ 產u kh? m? ti襫 b鑙 ch辵 ng th藅 s? kh玭g nh?.",
	"T? M? Minh Phong: T蕋 c? m鋓 chuy謓 m? T? Qu﹏  l祄 trong l╪g m?, 輙 ra c騨g cho ta bi誸 r? r祅g, c騨g l? chuy謓 ng an 駃, n鉯 ra c莕 ph秈 產 t? <sex>, ng r錳, kh玭g bi誸 <sex> c? th? cho ta bi誸 c竎h v祇 t莕g 2 l╪g m? kh玭g?",
	"Ngi ch琲: Ti襫 b鑙 mu鑞 v祇 l╪g m? m閠 chuy課 ??",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T? M? Minh Phong: Tuy kh玭g th? g苝 T? Qu﹏, nh璶g 頲 v祇 trong m? c髇g t? linh h錸 c馻 c? 蕐. Nh﹏ ti謓 g苝 Qu? Tng Qu﹏.",
	"Ngi ch琲: N誹 ti襫 b鑙 mu鑞 v祇 l╪g m?, h穣 c萵 th薾, Qu? Tng Qu﹏ kh玭g d? i ph? u. H琻 n鱝 khi жnh ng祅 c﹏ trong m藅 th蕋 Ho祅g l╪g r琲, th? kh玭g th? v祇 l筰 m藅 th蕋 頲.",
	"T? M? Minh Phong: жnh ng祅 c﹏ th鵦 ch蕋 l? m閠 lo筰 c? quan trong l╪g m?, ngi cp m? c? v藅 ph?. {To竔 Th筩h Ch蕁} c馻 h? l? chuy猲 d飊g  ph? lo筰 c? quan n祔, ta v? t譵 v?,  nghi猲 c鴘 c? quan l╪g m? r蕋 nhi襲, y l? To竔 Th筩h Ch蕁, ngi c莔 甶.",
	"Ngi ch琲:  t? ti襫 b鑙, ta c騨g 產ng nh 甶 g苝 Qu? Tng Qu﹏, 甶 th╩ d? l筰 manh m鑙 c馻 v? ti襫 b鑙, n鉯 kh玭g ch鮪g ch髇g ta c遪 c? th? g苝 nhau y.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1033,1,1);--得到碎石震
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),3,1));
	
end
function get_mission_CSD()
	
--	if (GetTask(1537) > 0 and GetTask(1537) < 7) or (GetTask(1537) > 7 and GetTask(1537) < 12) or (GetTask(1537) >12 and GetTask(1537) < 22) or (GetTask(1537) >22 and GetTask(1537) < 30) or (GetTask(1537) >30 and GetTask(1537) < 36) then
--		Talk(1, "", "Чi hi謕 產ng nh薾 nhi謒 v? Chuy觧 Sinh n猲 kh玭g th? nh薾 ti誴 nhi謒 v? n祔. H穣 ho祅 th祅h nhi謒 v? Chuy觧 Sinh xong r錳 quay l筰.")
--		return
--	end
	if GetItemCount(2,1,30191) < 7 then
		Talk(1, "", "Чi hi謕 ch璦 mang theo  Ng玦 sao may m緉?")
		return
	end	
	if DelItem(2,1,30191, 7) == 1 then
		SetTask(TSK_CSD,1)
		Talk(1, "", "Чi hi謕 h穣 gi髉 ta l祄 c竎 nhi謒 v?, ta s? ch? t筼 Chuy觧 Sinh Кn cho i hi謕")
		Msg2Player("Чi hi謕 h穣 gi髉 ta l祄 c竎 nhi謒 v?, ta s? ch? t筼 Chuy觧 Sinh Кn cho i hi謕")
		gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho箃 th祅h c玭g", 1, " chuy觧 sinh n 1")
	end	
end
function get_CSD()
	--TSK_CSD_COUNT_A = 2748		--300 nv s? m玭 (x) - 30 l莕 th竔 h? (y) - 81 t礽 nguy猲 chi課 (z) - 30 l莕 Lng S琻 (w)		- wwzzyyxxx
	--TSK_CSD_COUNT_B = 2749		--300 h箃 gi鑞g (x) - 33 l莕 Tr? An (y) - 33 l莕 Th駓 l琲 (z)			- zzyyxxx
	--TSK_CSD_COUNT_C = 2750		--181 B竧 nh? nh? (x) - 99 b竧 nh? to (y) - 99 c﹜ t? linh (z)		- zzyyxxx
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "Чi hi謕 ch璦 mang theo  333 B竛h b閠 v祅g.")
		return
	end
	if GetItemCount(2,2,8) < 999 then
		Talk(1, "", "Чi hi謕 ch璦 mang theo  Thi猲 Th筩h?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng tr錸g c﹜?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng nhi謒 v?: S? m玭, Th竔 H?, T礽 nguy猲 chi課, Lng S琻?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng nhi謒 v?: Tr? An, Th駓 L琲?")
		return	
	end	
	if DelItem(1,1,15, 333) == 1 and DelItem(2,2,8, 999) == 1 then
		SetTask(TSK_CSD,2)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho箃 th祅h c玭g", 1, " chuy觧 sinh n 2")
	end

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "C? 'Th鵦 m韎 V鵦 頲 Чo', kh玭g cho ta ╪ no th? ta kh玭g c? s鵦  ch? t筼 Chuy觧 Sinh Кn, h穣 cho ta 333 B竛h b閠 v祅g  l鉻 d?."
	
	tinsert(tbSayDialog, "Gi髉 ╪ no  ch? t筼 Chuy觧 Sinh Кn (ti猽 hao 333 B竛h b閠 v祅g)/confirm_get_CSD")
	tinsert(tbSayDialog,"K誸 th骳 i tho筰/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function confirm_get_CSD()
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "Чi hi謕 ch璦 mang theo  333 B竛h b閠 v祅g..")
		return
	end
	if GetTask(TSK_CSD) < 2 then
		Talk(1, "", "Чi hi謕 kh玭g th醓 甶襲 ki謓?")
		return
	end
	if DelItem(1,1,15, 333) == 1 then
		SetTask(TSK_CSD,3)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho箃 th祅h c玭g", 1, " chuy觧 sinh n 3")
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "B﹜ gi? ta s? ch? t筼 Chuy觧 Sinh Кn cho i hi謕, nh璶g h穣 cho ta th猰  333 B竛h b閠 v祅g  d? tr? nha !!!."
	
	tinsert(tbSayDialog, "Ch? t筼 Chuy觧 Sinh Кn (ti猽 hao 333 B竛h b閠 v祅g)/get_confirm_get_CSD")
	tinsert(tbSayDialog,"K誸 th骳 i tho筰/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function get_confirm_get_CSD()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	if GetTask(TSK_CSD) >= 4 then
		Talk(1, "", "Чi hi謕  nh薾 Chuy觧 Sinh Кn r錳?")
		return
	end
	if GetTask(TSK_CSD) < 3 then
		Talk(1, "", "Чi hi謕 ch璦 cho ta ╪ no?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng tr錸g c﹜?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng nhi謒 v?: S? m玭, Th竔 H?, T礽 nguy猲 chi課, Lng S琻?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "Чi hi謕 ch璦 ho祅 th祅h  s? lng nhi謒 v?: Tr? An, Th駓 L琲?")
		return	
	end	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "Чi hi謕 ch璦 mang theo  333 B竛h b閠 v祅g?")
		return
	end
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
	if DelItem(1,1,15, 333) == 1 and GetTask(TSK_CSD) == 3 then
		SetTask(TSK_CSD,4)
		gf_AddItemEx2({2,1,30345, 1,4}, "Chuy觧 Sinh Кn", "CHUOI NHIEM VU CSD", "NHAN THANH CONG CSD")
	end
end
function exchange_CSD()
	if GetItemCount(2,1,30345) < 1 then
		Talk(1, "", "Чi hi謕 kh玭g mang theo Chuy觧 Sinh Кn ?")
		return
	end
	if GetItemCount(2,1,1006) < 2 then
		Talk(1, "", "Чi hi謕 kh玭g mang theo C鰑 Thi猲 V? C鵦 Кn ?")
		return
	end
	if DelItem(2,1,30345,1) == 1	and DelItem(2,1,1006,2) == 1 then
		gf_AddItemEx2({2,1,30345, 1,1}, "Chuy觧 Sinh Кn", "DOI CSD", "CSD THANH CONG", 30*24*60*60)		
	end
end
function get_CSD_infor()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	Talk(1, "", "Nhi謒 v? S? m玭: "..nCSD_SuMon.."/300\nNhi謒 v? Th竔 H? Huy詎 C秐h: "..nCSD_TH.."/30\nNhi謒 v? T礽 Nguy猲 Chi課: "..nCSD_TNC.."/81\nNhi謒 v? Lng S琻: "..nCSD_LS.."/30\nNhi謒 v? Tr? An: "..nCSD_TA.."/33\nNhi謒 v? Th駓 L琲: "..nCSD_TL.."/33\nTr錸g H箃 Gi鑞g: "..nCSD_HG.."/300\nTr錸g B竧 nh? nh?: "..nCSD_BNN.."/181\nTr錸g B竧 nh? to: "..nCSD_BNL.."/99\nTr錸g c﹜ T? Linh: "..nCSD_TLinh.."/99")
end
function finish_sumon()
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
	local nRemain = 300 - nCSD_SuMon
	local nCost = nRemain * 4
	if nCSD_SuMon >= 300 then
		Talk(1, "", "B筺  ho祅 th祅h  s? lng nhi謒 v? y猽 c莡 n猲 kh玭g c莕 ta gi髉  !!!")
		return
	end
	if GetItemCount(2,1,30230) < nRemain * 4 then
		Talk(1, "", "M鏸 nhi謒 v? t鑞 4 xu v藅 ph萴. B筺 kh玭g  "..nCost.."  xu v藅 ph萴  ho祅 th祅h "..nRemain.." nhi謒 v? c遪 l筰 !!!")
		return	
	end
	if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
		if DelItem(2,1,30230,nCost) == 1 then
			gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho箃 th祅h c玭g", 1, "Ho祅 th祅h nhanh nv S? M玭")
			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + nRemain)
		end
	end
end
function nothing()

end