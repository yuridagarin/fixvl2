-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 76武器配方学习任务head文件
-- By StarryNight
-- 2006/04/27 PM 15:59

-- 缘到来时人难拒，缘要走时人难追……

-- ======================================================

-- 字符串处理功能库
Include("\\script\\lib\\string.lua");

--76级武器配方与材料配方学习任务变量
TASK_76WEAPON 			= 	1600		--76级武器配方任务变量
TASK_76WEAPON_TALK 		= 	1601		--76级武器配方任务对话标记
TASK_76WEAPON_TALK_01 	= 	1 			--少林对话标记
TASK_76WEAPON_TALK_02 	= 	2			--武当对话标记
TASK_76WEAPON_TALK_03 	= 	3 			--峨嵋对话标记
TASK_76WEAPON_TALK_04 	= 	4 			--唐门对话标记
TASK_76WEAPON_TALK_05 	= 	5 			--丐帮对话标记
TASK_MEDICINE_HEIWU 	= 	1602		--制药系黑钨精石配方任务变量
TASK_COOKING_TIESHAN	=   1603		--烹饪系铁线精木配方任务变量
TASK_WEAVE_SHANSHI		=   1604		--织造系山狮精皮配方任务变量
TASK_JUJU_CHIWU		  	=   1605		--制符系赤钨灵符配方任务变量
TASK_JUJU_TALK			= 	1601		--制符系赤钨灵符配方任务对话标记 
TASK_JUJU_TALK_01		=   1			--刘一斧对话标记
TASK_JUJU_TALK_02		=	2			--代矿工对话标记

--玩家称谓
PlayerFactionTitle = {	
	-- 少林
	[1]={"Чi s?",""},	
	-- 武当
	[2]={"Чo trng","Чo trng"},
	-- 峨眉
	[3]={"","C? nng"},
	-- 丐帮
	[4]={"Thi誹 hi謕","C? nng"},	
	-- 唐门
	[5]={"Thi誹 hi謕","C? nng"},	
	-- 杨门
	[6]={"Tng qu﹏","Tng qu﹏"},	
	-- 五毒
	[7]={"Thi誹 hi謕","C? nng"},
	[8]={"Thi誹 hi謕","C? nng"},
	[9]={"Thi誹 hi謕","C? nng"},
	[10]={"C? nng","C? nng"},
}

--所需上交武器
HANDIN_ITEM_DATA = {
	[1] = {},
	[2] = {{},--江湖技艺
				 {{0,5,39,1,"Thanh Long c玭"},{0,8,96,1,"Thi猲 Ph藅 trng"},{0,6,107,1,"Ph? Thi猲 k輈h"}},--长兵器
				 {{0,0,13,1,"N? L? a ng鬰"},{0,2,26,1,"Huy襫 thi誸 Tr鋘g Ki誱"},{0,3,63,1,"B? Vng"},{0,7,11,1,"筺 Trng"}},--短兵器
				 {{0,1,52,1,"Thi猲 ngo筰 phi ti猲"},{0,10,74,1,"Ti猽 V?"},{0,9,85,1,"Thi猲 C?"},{0,4,118,1,"Long Kh萿"},{0,11,11,1,"Ng? T玭"}},--奇门兵器
				 {{0,100,35,1,"Huy誸 H? Qu? Vng gi竝"},{0,100,17,1,"S琻 Qu? huy誸 y"},{0,100,36,1,"Long B? ? kim y"},{0,100,18,1,"Thi猲 Gi竛g b祇"}},--男装衣服
				 {{1,0,6,10,"H綾 Ng鋍 筺 T鬰 Cao"},{1,0,11,10,"V筺 V藅 Quy Nguy猲 Кn"},{1,0,16,10,"Sinh Sinh H鉧 T竛"},{1,0,21,5,"B玭 Tinh Nguy謙 Кn"},{1,0,26,5,"Чi Nh藅 Dng T竛"}},--药品
				 {{1,1,15,5,"B竛h B閠 v祅g"},{1,1,14,5,"C琺 chi猲 tr鴑g"},{1,1,9,5,"C秈 x祇 t醝"},{1,1,13,5,"T髖 M閚g T鰑"}},--烹饪
				 {{0,100,53,1,"Thi猲 y"},{0,100,54,1,"Phi Thi猲 Th竔 Thng"},{0,100,71,1,"V? Song u y"},{0,100,72,1,"Ng? S綾 Ngh? Thng"}},--女装衣服
				}
}

--Npc名字
WEAPON_NPC_DATA = {
	[1] = {"M筩 Чi","Bi謓 Kinh"},
	[2] = {"M筩 Nh?","Th祅h Й"},
	[3] = {"M筩 Tam","Tng Dng"},
	[4] = {"C萴 nng","Th祅h Й"},
	[5] = {"Du Phng i phu","Th祅h Й"},
	[6] = {"Ng? Tr?","Bi謓 Kinh"},
	[7] = {"V﹏ Du Чo Nh﹏","Bi謓 Kinh"},
}

--配方表
RECIPE_DATA = {
	[1]  = 	{800,"Trng","A La H竛 Trng"},
	[2]  = 	{795,"c玭 b鎛g","Li謙 Di謒"},
	[3]  = 	{801,"Thng","Чi H祇 L玦 Thng"},
	[4]  = 	{793,"H? th?","V筺 Nh蒼"},
	[5]  = 	{797,"o","C? лnh"},
	[6]  = 	{794,"Ki誱","H醓 Tinh"},
	[7]  = 	{804,"Song 產o","L╪g Phong"},
	[8]  = 	{796,"竚 kh?","M穘 Thi猲 Hoa V?"},
	[9]  = 	{799,"B髏","Th莕 H祅h"},
	[10] = 	{798,"C莔","Hi Nh﹏ C莔"},
	[11] = 	{803,"Tr秓","M穘h h?"},
	[12] = 	{802,"Cung","Th莕 Cung"},
}

------------------------------------------76级武器配方任务提示---------------------------------------
function weapon_76_recipe_tip(nSkill_ID)

local nNpcName = GetTargetNpcName();
	if nNpcName == nil or nNpcName == "" then
		return
	end
	nSkill_ID = nSkill_ID - 1;
	TalkEx("",{nNpcName..":nghe n鉯{"..WEAPON_NPC_DATA[nSkill_ID][2].."} {"..WEAPON_NPC_DATA[nSkill_ID][1].."g莕 y 產ng t譵 ngi, mau 甶 xem coi c? chuy謓 g?."});

end

----------------------------------------------兵器配方任务-------------------------------------------

--nType 1：长兵器，2：短兵器，3：奇门兵器
function weapon_76_001(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1])
local str = "";
local strTalk = {};
local i = 0;

	for i=1,num do
		
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

	strTalk = {
		WEAPON_NPC_DATA[nType][1]..": Ngi  h鋍 h誸 k? n╪g c馻 ta, ta kh玭g c遪 g?  d箉 ngi n鱝.",
		"е t? c? ng祔 h玬 nay c騨g l? nh? s? ph? h誸 l遪g ch? b秓.",
		WEAPON_NPC_DATA[nType][1]..": B秐 v? ch? t筼 th莕 binh n祔 l? chi b秓 c馻 M筩 gia ta nh璶g n gi? v蒼 ch璦 t譵 ra c竎h ch? t筼 th輈h h頿. B﹜ gi? nh truy襫 l筰 cho ngi, hy v鋘g ngi c? th? th祅h c玭g. Nh璶g trc ti猲 ph秈 ki觤 tra n╪g l鵦 hi謓 t筰 c馻 ngi.",
		"S? ph? c? n鉯!",
		WEAPON_NPC_DATA[nType][1]..": Th? n祔 v藋! Ngi h穣 l祄 1 "..str.." vi s? xem tay ngh? c馻 ngi th? n祇.",
		"Xin S? ph? ch? ch髏.",
		}
		TalkEx("",strTalk);
		SetTask(TASK_76WEAPON,1);
		TaskTip("M鏸 lo筰 l祄 1 "..str.."Giao cho"..WEAPON_NPC_DATA[nType][1]);

end

--上交武器
function weapon_76_002(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1]);
local str = "";
local i = 0;
local strSay = "";

	for i=1,num do
	
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

  strSay = {
		WEAPON_NPC_DATA[nType][1]..": Th? n祔 v藋! Ngi h穣 l祄 1 "..str.." vi s? xem tay ngh? c馻 ngi th? n祇.(Trc khi giao n閜 v? khi xin h穣 c蕋 v? kh? kh玭g mu鑞 n閜 v祇 rng ch鴄 )",
		"Xin s? ph? xem qua!/#weapon_76_003("..nType..")",
		"е t? ch璦 h鋍 qua c竎h l祄/#ReLearnRecipe("..nType..")",--补学之前没有学习的配方
		"Xin s? ph? ch? ch髏!/nothing",
		}
		
	SelectSay(strSay);
end

--上交武器
function weapon_76_003(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Qu? nhi猲 tay ngh? r蕋 kh?! B秐 v? n祔 ta cho ngi mn c th?!",
	"(Sau khi c b秐 v? ch? t筼 binh kh輩)",
	"V? kh? trong b秐 v? n祔 r蕋 tuy謙! V韎 tay ngh? c馻 s? ph? kh玭g c? l? do g? kh玭g l祄 頲.",
	WEAPON_NPC_DATA[nType][1]..": N鉯 th? d? l緈! V? kh? ta l祄 ra c? m閠 kh玭g hai nh璶g nguy猲 li謚 r蕋 kh? t譵. N誹 c? t? tinh trong truy襫 thuy誸 th? c? th? l祄 ra th莕 binh trong b秐 v?.",
	"T? tinh? L? nguy猲 li謚 g? v藋?",
	WEAPON_NPC_DATA[nType][1]..": с l? 4 lo筰 nguy猲 li謚 H綾 ? Tinh Th筩h, Thi誸 Tuy課 Tinh M閏, S琻 S? Tinh B? v? X輈h ? Linh Ph?.",
	"е t? quy誸 r蘮 th祅h th莕 binh c骾 mong s? ph? ch? b秓.",
	WEAPON_NPC_DATA[nType][1]..": Khi x璦 ta t鮪g d鵤 theo b秐 v? c馻 ng? i Thi誹 L﹎ ph竔, V? ng, Nga My, Л阯g M玭 v? C竔 Bang  r蘮 1 thanh binh kh? nh璶g kh玭g ai d飊g 頲, h穣 n h醝 h? c? th? s? c? ch髏 thu ho筩h.",
	}
		--成功上交物品
		if handin_item(1,nType+1) == 1 then
			TalkEx("",strTalk);
			SetTask(TASK_76WEAPON,2)
			TaskTip("дn g苝 Chng m玭 c竎 Thi誹 L﹎ ph竔, V? ng, Nga My, Л阯g M玭 v? C竔 Bang h醝 th╩ t譶h h譶h");
		else
			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": V? kh? c馻 ngi l祄 u? Hay l? b? qu猲 u ?"})
		end
end

--判断上交物品是否符合要求
function handin_item(nGenre,nDetail)

	nGenre = nGenre + 1;
	local i = 0;
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			if GetItemCount(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3]) < HANDIN_ITEM_DATA[nGenre][nDetail][i][4] then	
				return 0
			end
		end
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			DelItem(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3],HANDIN_ITEM_DATA[nGenre][nDetail][i][4])
		end
	return 1
end

--与五大掌门对话
function weapon_76_talk(nFaction,nType)

local strTalk = {
	[1] = {
		"B竔 ki課 Phng trng! N╩ x璦 M筩 s? ph?  l祄 cho phng trng m閠 m鉵 th莕 kh?, t筰 sau sau  kh玭g th蕐 ngi s? d鬾g?",
		"?! Th? ra th? ch? l? truy襫 nh﹏ c馻 M筩 s? ph?! M鉵 v? kh? 頲 l祄 n╩ x璦 qu? m襪 d蝟 kh玭g th輈h h頿 v韎 Thi誹 L﹎ ta.",
		"Th? ra l? v藋! T筰 h?  hi觰 r錳.",
		},
	[2] = {                                                                                        	
		"B竔 ki課 Ch﹏ nh﹏! N╩ x璦 M筩 s? ph?  l祄 cho ch﹏ nh﹏ m閠 m鉵 th莕 kh?, t筰 sau sau  kh玭g th蕐 ngi s? d鬾g?",              
		"V? kh? n╩ x璦 tuy b衝 nh鋘 nh璶g kh玭g m襪 d蝟. V? ng ta l蕐 nhu ch? cng, lo筰 v? kh? n祔 kh玭g th輈h h頿 l緈.",
		"Th? ra l? v藋! T筰 h?  hi觰 r錳.",                                                      
    },
  [3] = {
		"B竔 ki課 S? th竔! N╩ x璦 M筩 s? ph?  l祄 cho o trng m閠 m鉵 th莕 kh?, t筰 sau sau  kh玭g th蕐 ngi s? d鬾g?",
		"V? kh? n╩ x璦 M筩 s? ph? l祄 qu? nhi猲 b蕋 ph祄. Nh璶g Nga My ta l?  t? Ph藅 m玭 sao c? th? s? d鬾g v? kh? nhi襲 s竧 kh? nh? th??",
		"Th? ra l? v藋! T筰 h?  hi觰 r錳.",
		},
	[4] = {
		"B竔 ki課 L穙 l穙! N╩ x璦 M筩 s? ph?  l祄 cho ngi m閠 m鉵 th莕 kh?, t筰 sau sau  kh玭g th蕐 ngi s? d鬾g?",
		"Ph鉵g 竚 kh? y猽 c莡 ngo筰 l鵦 v? ch輓h x竎. Kh玭g th? thi誹 1 trong 2. 竚 kh? n╩ x璦 M筩 s? ph? l祄 k誸 c蕌 r蕋 t鑤 nh璶g kh玭g   ch輓h x竎.",
		"Th? ra l? v藋! T筰 h?  hi觰 r錳.",
		},
	[5] = {
		"B竔 ki課 Long bang ch?! N╩ x璦 M筩 s? ph?  l祄 cho Bang ch? ngi m閠 m鉵 th莕 kh?, t筰 sau sau  kh玭g th蕐 ngi s? d鬾g?",
		"Binh kh? M筩 s? ph? l祄 tuy oai l鵦 r蕋 m筺h nh璶g ta d飊g c秏 th蕐 kh玭g tho秈 m竔.",
		"Th? ra l? v藋! T筰 h?  hi觰 r錳.",
		}
	}
	TalkEx("",strTalk[nFaction]);
	SetTask(TASK_76WEAPON_TALK, SetBit(GetTask(TASK_76WEAPON_TALK), nFaction, 1));
	for	i=1,5 do
		if GetBit(GetTask(TASK_76WEAPON_TALK),i) ~= 1 then
			return
		end
	end
	SetTask(TASK_76WEAPON,3);
	TaskTip("Nghe xong l阨 k? c馻 5 v? Chng m玭, b筺 c秏 th蕐 nhi襲 kh骳 m綾. Quay v? g苝"..WEAPON_NPC_DATA[nType-1][1].."!");	                                                                                        
end

--未与五位掌门对话
function weapon_76_004(nType)

local strTalk = {WEAPON_NPC_DATA[nType][1]..": Khi x璦 ta t鮪g d鵤 theo b秐 v? c馻 ng? i Thi誹 L﹎ ph竔, V? ng, Nga My, Л阯g M玭 v? C竔 Bang  r蘮 1 thanh binh kh? nh璶g kh玭g ai d飊g 頲, h穣 n h醝 h? c? th? s? c? ch髏 thu ho筩h."}

	TalkEx("",strTalk)

end

--已经与五位掌门对话后与师傅对话
function weapon_76_005(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Nghe xong l阨 k? c馻 5 v? Chng m玭,  hi觰 頲 ch髏 輙?",
	"Ng? i chng m玭 kh玭g d飊g binh kh? nh? trong b秐 v? b雐 v? ch髇g kh玭g h頿 v韎 v? c玭g c馻 h?, v? kh? t鑤 kh玭g nh蕋 thi誸 ph秈 b衝 nh鋘 ch? c莕 ch髇g c? th? gi髉 ngi s? d鬾g ph竧 huy h誸 v? c玭g th? m韎 l? v? kh? t鑤.",
	WEAPON_NPC_DATA[nType][1]..": Hay l緈! Qu? nhi猲 kh玭g l祄 ta th蕋 v鋘g! Ta c? 輙 T? Tinh, ngi v? ngh? xem n猲 ch鋘 ch? t筼 lo筰 th莕 binh n祇, ch? c? th? ch鋘 ch? t筼 m閠 trong c竎 lo筰 th莕 b譶h n猲 ngi suy ngh? k? r錳 h穣 n t譵 ta.",
	}
	TalkEx("",strTalk);

	TaskTip("Ngh? k? mu鑞 h鋍 ch? t筼 m鉵 v? kh? n祇 r錳 h穣 quay l筰 y"..WEAPON_NPC_DATA[nType][1])
	if GetTask(TASK_76WEAPON) ~= 4 then
		SetTask(TASK_76WEAPON,4);
		AddItem(2,2,66,5,1);--黑钨精石      
		AddItem(2,2,67,5,1);--铁线精木
		AddItem(2,2,68,5,1);--山狮精皮
		AddItem(2,2,69,5,1);--赤钨灵符
	end
end

--选择学习何种武器制作
function weapon_76_choice(nType)

local strSay = {
	[1] = {     
		WEAPON_NPC_DATA[nType][1]..": H穣 ch鋘 lo筰 v? kh? b筺 mu鑞 h鋍 c竎h ch? t筼 (ch鋘 xong kh玭g th? thay i l鵤 ch鋘)",
		"Trng/#learn_weapon_76("..nType..",1)",   
		"c玭 b鎛g/#learn_weapon_76("..nType..",2)",  
		"Thng/#learn_weapon_76("..nType..",3)",    
		"Ta suy ngh? l筰/nothing",     
		},
	[2] = {     
		WEAPON_NPC_DATA[nType][1]..": H穣 ch鋘 lo筰 v? kh? b筺 mu鑞 h鋍 c竎h ch? t筼 (ch鋘 xong kh玭g th? thay i l鵤 ch鋘)",
		"H? th?/#learn_weapon_76("..nType..",4)",   
		"o/#learn_weapon_76("..nType..",5)",  
		"Ki誱/#learn_weapon_76("..nType..",6)",    
		"Song 產o/#learn_weapon_76("..nType..",7)",
		"Ta suy ngh? l筰/nothing",     
		},
	[3] = {     
		WEAPON_NPC_DATA[nType][1]..": H穣 ch鋘 lo筰 v? kh? b筺 mu鑞 h鋍 c竎h ch? t筼 (ch鋘 xong kh玭g th? thay i l鵤 ch鋘)",
		"竚 kh?/#learn_weapon_76("..nType..",8)",
		"B髏/#learn_weapon_76("..nType..",9)",
		"C莔/#learn_weapon_76("..nType..",10)",
		"Tr秓/#learn_weapon_76("..nType..",11)",
		"Cung/#learn_weapon_76("..nType..",12)",
		"Ta suy ngh? l筰/nothing",
		}
	}	
	SelectSay(strSay[nType]);

end

--获得相关武器的学习配方
function learn_weapon_76(nType,recipe_id)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": B筺  ch鋘 "..RECIPE_DATA[recipe_id][2].." phng hng ch? t筼 v? kh? cao c蕄, sau n祔 ph秈 c? g緉g th猰",
	"у nhi bi誸 r錳!",
	};

	AddRecipe(RECIPE_DATA[recipe_id][1])
	Msg2Player("B筺 h鋍 頲 ph鑙 ch?:"..RECIPE_DATA[recipe_id][3])

	SetTask(TASK_76WEAPON,5);--76级武器配方任务完成
	TalkEx("",strTalk);
	
end

------------------------------------------制药系钨精石配方任务-------------------------------------------
function medicine_heiwu_001()

local strTalk = {
	"G莕 y ngi kh玭g ch? t﹎ luy謓 thu鑓? N猲 bi誸 linh n di謚 dc kh玭g ph秈 m閠 s韒 m玹 chi襲 m? luy謓 th祅h.",
	"G莕 y е t? ph竧 hi謓 n dc luy謓 ra kh玭g c? c玭g hi謚 l緈. Tuy luy謓 ng phng ph竝 nh璶g hi謚 qu? kh玭g t鑤 n猲 c秏 th蕐 h琲 bu錸.",
	"Th? n祔 v藋! Ngi h穣 luy謓 H綾 Ng鋍 筺 T鬰 Cao, V筺 V藅 Quy Nguy猲 Кn, Sinh Sinh H鉧 T竛 (m鏸 lo筰 10 vi猲), B玭 Tinh Nguy謙 Кn, Чi Nh藅 Dng T竛 (m鏸 lo筰 5 vi猲) a cho ta xem.",
	"Xin S? ph? ch? ch髏.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,1);
	TaskTip("Ch? dc ph萴 theo y猽 c莡 c馻 s? ph? v? giao cho s? ph?");
	
end

function medicine_heiwu_002()

local strSay = {
	"10 H綾 Ng鋍 筺 T鬰 Cao, V筺 V藅 Quy Nguy猲 Кn, Sinh Sinh H鉧 T竛, 5 B玭 Tinh Nguy謙 Кn, Чi Nh藅 Dng T竛  l祄 xong ch璦?",
	"Х l祄 xong r錳!/medicine_heiwu_003",
	"е t? ch璦 h鋍 qua c竎h l祄/#ReLearnRecipe(5)",--补学之前没有学习的配方
	"Xin S? ph? ch? ch髏!/nothing",
	}
	
	SelectSay(strSay);

end

function medicine_heiwu_003()

local strTalk = {
	"S? ph?! Зy l? thu鑓  t?  luy謓. Xin s? ph? xem qua!",
	"Kh? l緈!",
	"Ph蕁 m祏 甧n ? b? m苩 kh玭g ph秈 l祬",
	"Vi謈 n祔... t? c騨g kh玭g r?! G莕 y trong l骳 luy謓 dc ph竧 hi謓 th? n祔,  t? kh玭g bi誸 n猲 m韎 h醝 s? ph?.",
	"е t? h穣 甧m b閠 ph蕁 甧n n祔 n th祅h B綾 t譵 {Чi kho竛g c玭g} h醝 th?, v韎 kinh nghi謒 o kho竛g nhi襲 n╩ kh玭g ch鮪g 玭g ta bi誸 th? b閠 甧n n祔 l? g?.",
	"е t? tu﹏ l謓h!",
	}
	
	if handin_item(1,6) == 1 then
		AddItem(2,0,393,1);--得到黑色粉末
		TalkEx("",strTalk);
		SetTask(TASK_MEDICINE_HEIWU,2);
		TaskTip("дn Th祅h Й t譵 Чi kho竛g c玭g h醝 ngu錸 g鑓 c馻 b閠 ph蕁 m祏 甧n");
	else
		TalkEx("",{"Кn dc  t? luy謓 u? C? ph秈   qu猲 u ?"});
	end
	
end

function medicine_heiwu_004()

local strTalk = {
	"е t? h穣 甧m b閠 ph蕁 甧n n祔 n th祅h B綾 t譵 {Чi kho竛g c玭g} h醝 th?, v韎 kinh nghi謒 o kho竛g nhi襲 n╩ kh玭g ch鮪g 玭g ta bi誸 th? b閠 甧n n祔 l? g?.",
	"е t? tu﹏ l謓h!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_005()

local strTalk = {
	"C竎 h? l?  t? c馻 Du Phng i phu? H玬 nay t譵 ta c? vi謈 g??",
	"T筰 h? trong l骳 ch? dc v? t譶h ph竧 hi謓 s? b閠 ph蕁 m祏 甧n n祔, s? ph? b秓 t筰 h? n h醝 玭g b閠 n祔 l? g??",
	"Лa ta xem th? n祇?",
	"B閠 ph蕁 n祔 to祅 th﹏ m祏 甧n v? s竛g, g莕 gi鑞g ? kim th筩h nh璶g ph萴 ch蕋 thu莕 khi誸 h琻, ta ch璦 th蕐 qua th? n祔, t? u ngi c??",
	"T筰 h? v? t譶h ph竧 hi謓 trong l? luy謓 n.",
	"Зy kh玭g ch鮪g l? nguy猲 li謚  ch? t筼 th莕 binh thng ng. Ngi 甧m n? n Bi謓 Kinh t譵 M筩 Чi s? ph? h醝 th? xem!",
	" t? Чi s? ph? ch? 甶觤!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,3);
	TaskTip("дn Bi謓 Kinh t譵 M筩 s? ph? h醝 t竎 d鬾g c馻 b閠 ph蕁 m祏 甧n");
	
end

function medicine_heiwu_006()

local strTalk = {
	"Ngi 甧m s? b閠 n祔 n Bi謓 Kinh t譵 M筩 Чi s? ph? h醝 th?, kh玭g ch鮪g s? c? p 竛.",
	" t? Чi s? ph? ch? 甶觤!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_007()

local strTalk = {
	"M筩 Чi: Ha ha! Cu鑙 c飊g ngi c騨g  luy謓 th祅h Li謙 Di謒 Th莕 C玭!",
	"B竔 ki課 M筩 s? ph?!",
	"M筩 Чi: Ngi l?  t? c馻 Du Lang Trung? T譵 ta c? vi謈 g?? H玬 nay l穙 phu r蕋 vui,  luy謓 th祅h Li謙 Di謒 Th莕 C玭. Ngi n y xem th? 甶!",
	"V穘 b鑙 t礽 th? h鋍 thi觧, nh蕋 th阨 kh玭g th蕐 頲 s? c bi謙 c馻 binh kh? n祔.",
	"M筩 Чi: Kh玭g ph秈 ngi n xem th莕 binh ta luy謓 ?? V藋 t譵 ta c? chuy謓 g??",
	"V穘 b鑙 trong l骳 luy謓 n ph竧 hi謓 s? {b閠 m祏 甧n} n祔, Du Phng s? ph? b秓 t筰 h? n h醝 Чi kho竛g c玭g, 玭g ta n鉯 y c? th? l? nguy猲 li謚  ch? t筼 binh kh? thng ng v? b秓 t筰 h? n h醝 M筩 s? ph? ngi.",
	"M筩 Чi: в ta xem n祇厖",
	"M筩 Чi: Зy ch糿g l? l? b閠 c馻 H綾 ? Tinh Th筩h? Ta t鑞 nhi襲 t﹎ huy誸 m韎 luy謓 th祅h Li謙 Di謒 Th莕 C玭, m鏸 l莕 luy謓 nguy猲 li謚 d飊g c騨g kh竎 nhau nh璶g khi l祄 ngu閕 u  l筰 m閠 輙 b閠 c馻 H綾 ? Tinh Th筩h. Th? n祔 v藋! Ta c? m閠 輙 Huy襫 Th筩h d飊g  luy謓, ngi v? t譵 s? ph? nghi猲 c鴘 xem c? l? s? c? thu ho筩h.",
	"е t? tu﹏ l謓h!",
	}
	--收回黑色粉末
	if GetItemCount(2,0,393,1) >= 1 then
		DelItem(2,0,393,1);
	end
	
	TalkEx("",strTalk);
	if GetTask(TASK_MEDICINE_HEIWU) ~= 4 then
		AddItem(2,8,7,5,1);--得到5颗玄石
		SetTask(TASK_MEDICINE_HEIWU,4);
	end
	TaskTip("Лa 5 vi猲 Huy襫 Th筩h c馻 M筩 Чi cho Du Phng i phu");
	
end

function medicine_heiwu_008()

local strTalk = {
	"M筩 Чi: H穣 甧m Huy襫 Th筩h n祔 v? c飊g s? ph? nghi猲 c鴘 xem, kh玭g ch鮪g s? c? thu ho筩h.",
	"е t? tu﹏ l謓h!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_009()

local strTalk = {
	"Х v? r錳 ?? C? h醝 頲 g? kh玭g?",
	"Чi s? ph? cho r籲g y kh玭g ph秈 tinh th筩h thng ng o kho竛g c? 頲, b秓  t? 甶 h醝 M筩 Чi s? ph?. M筩 Чi s? ph? n鉯 y c? th? l? nguy猲 li謚  ch? t筼 th莕 binh thng ng, b雐 v? m鏸 khi 玭g ta luy謓 binh kh? c騨g ph竧 hi謓 trong l? luy謓 c? th? b閠 m祏 甧n n祔, 玭g ta c遪 a  t? m閠 輙 Huy襫 Th筩h, b秓  t? 甧m v? cho S? ph?.",
	"Лa ta xem th?!",
	"Ta hi觰 r錳! Trong l骳 ngi luy謓 dc kh玭g  ? n猲 n? s秐 sinh s秐 ph萴 ph?. Зy l? phng ph竝 ch? H綾 ? Tinh Th筩h, ngi h穣 nghi猲 c鴘 k?.",
	"V藋 l祄 sao  n╪g l鵦 luy謓 n c馻  t? t╪g th猰 m閠 b薱?",
	"ng h蕄 t蕄! B﹜ gi? ngi 產ng ? giai 畂筺 b穙 h遖 m? ta thng n鉯. Nh鱪g l骳 th? n祔 th? kh? m? c? ti課 tri觧 m韎.",
	"Giai 畂筺 b穙 h遖? V藋  t? ph秈 l祄 sao? Xin S? ph? ch? gi竜!",
	"D鬰 t鑓 b蕋 t! Ngi h穣 nghi猲 c鴘 phng ph竝 ch? H綾 ? Tinh Th筩h, ta c遪 m閠 輙 Huy襫 Th筩h, h穣 c莔 l蕐!",
	"е t? hi觰 r?!",
	}

	--扣除5颗玄石
	if DelItem(2,8,7,5) == 1 then
		TalkEx("",strTalk);
		AddRecipe(805)
		AddItem(2,8,7,100,1);
		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H綾 ? Tinh Th筩h")
		SetTask(TASK_MEDICINE_HEIWU,5);
	else
		TalkEx("",{"{5 vi猲 Huy襫 Th筩h} M筩 Чi s? ph? nh? t筰 h? a cho s? ph? c? ph秈  l祄 m蕋 tr猲 阯g?"});
	end
end

------------------------------------------烹饪系铁线精木配方任务-------------------------------------------
function cooking_tieshan_001()

local strTalk = {
	"L莕 trc Ho祅g Thng u鑞g canh Л琻g Quy h莔 r緉 xong t蕀 t綾 khen ngon, nh璶g kh萿 v? c馻 Ho祅g Thng lu玭 thay i. N誹 l莕 sau ngi l筰 mu鑞 ╪ m鉵 l? th? ta c? 10 c竔 u c騨g kh玭g .",
	"S? ph? l筰 hao t﹎ v? b鱝 ╪ c馻 Ho祅g Thng?",
	"Chao 玦! ng nh綾 n鱝! Ngi n ng l骳 l緈! Hai s?  ta l﹗ r錳 kh玭g g苝 nhau, mau l祄 v礽 m鉵  nh﹎ nhi 甶!",
	"V藋厖",
	"Ngi th藅 l?! дn m鉵 {b竛h B閠 v祅g}, {C琺 chi猲 tr鴑g }, {C秈 x祇 t醝}, {T髖 M閚g T鰑} s? ph? th輈h ╪ c騨g qu猲, th鴆 ╪ ngon kh玭g th? thi誹 ru! Ngi mau l祄 {5 ph莕} 甶!",
	"Xin s? ph? ch? ch髏! (Kh玭g ng? s鴆 ╪ c馻 s? ph? c騨g kh? qu?)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,1);
	TaskTip("L祄 5 ph莕 b竛h B閠 v祅g, C琺 chi猲 tr鴑g, C秈 x祇 t醝 v? T髖 M閚g T鰑 cho Ng? Tr?");
	
end

function cooking_tieshan_002()

local strSay = {
	"Ngi th藅 l?! дn m鉵 {b竛h B閠 v祅g}, {C琺 chi猲 tr鴑g }, {C秈 x祇 t醝}, {T髖 M閚g T鰑} s? ph? th輈h ╪ c騨g qu猲, th鴆 ╪ ngon kh玭g th? thi誹 ru! Ngi mau l祄 {5 ph莕} 甶!",
	"Ru th辴 t韎 y!/cooking_tieshan_003",
	"е t? ch璦 h鋍 qua c竎h l祄/#ReLearnRecipe(6)",--补学之前没有学习的配方
	"Xin S? ph? ch? ch髏!/nothing",
	}
	
	SelectSay(strSay);

end

function cooking_tieshan_003()

local strTalk = {
	"S? ph?! Ru th辴 c? y!",
	"Hay l緈! в ta n誱 th? xem!",
	"?!!",
	"Ch糿g l? kh玭g h頿 kh萿 v??",
	"Л琻g nhi猲 r錳! Ngi d飊g nguy猲 li謚 g? v藋?",
	"е t? l祄 theo l阨 c馻 s? ph?, d飊g Di猲 Tinh M筩h, H? Ti猽, Dung tr筩h c鑓. M飅 v? th? n祇 v藋 s? ph??",
	"Th藅 k? l?! Ta ch璦 t鮪g ╪ qua {C琺 chi猲 tr鴑g} ngon nh? v莥!",
	"厖",
	}
	
	if handin_item(1,7) == 1 then
		TalkEx("cooking_tieshan_003_01",strTalk);
	else
		TalkEx("",{"Ru th辴 u? Mau 甧m t韎 甶! S? ph? i l緈 r錳!"});
	end	
end


function cooking_tieshan_003_01()

local strTalk = {	
	"V蕁  kh玭g ph秈 l? nguy猲 li謚,  ta xem b誴 v?  n錳.",
	"Зy l祬?",
	"Зy ch? l? lo筰 c駃 thng, kh玭g th蕐 c? g? c bi謙.",
	"Ngi  ? xem, lo筰 {c駃} n祔 sau khi cho v祇 l? l鯽 l韓 v蒼 c? t輓h n h錳 nh蕋 nh kh玭g nh? c竎 lo筰 c駃 kh竎. Xem ra y kh玭g ph秈 l? lo筰 g? thng. Th? n祔 v藋! Ngi 甧m ch髇g n {th祅h Nam} t譵 {L璾 Nh蕋 Ph駗 h醝 th? xem. V韎 kinh nghi謒 l﹗ n╩ c馻 y kh玭g ch鮪g s? bi誸 頲 nhi襲 甶襲 v? lo筰 c駃 n祔. цi v韎 vi謈 n蕌 nng sau n祔 s? c? l頸 輈h nh蕋 nh.",
	"{L璾 s? ph魙 ? {th祅h Nam} ?! е t? xin 甶 ngay!",
	"Nh璶g L璾 Nh蕋 Ph? r蕋 th輈h u鑞g {ru}, ngi nh? 甧m theo 1 b譶h N? Nhi H錸g thng h筺g.",
	}

	AddItem(2,0,394,1);--得到不寻常的木柴
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,2);
	TaskTip("дn Bi謓 Kinh t譵 L璾 Nh蕋 Ph? h醝 ngu錸 g鑓 c馻 lo筰 c駃 n祔");

end

function cooking_tieshan_004()

local strTalk = {
	"Ngi mau 甧m s? {c駃} n祔 n {th祅h Nam} t譵 {L璾 Nh蕋 Ph駗. V韎 kinh nghi謒 l﹗ n╩ c馻 y kh玭g ch鮪g s? bi誸 huy襫 c? c馻 c﹜ c駃 n祔, kh玭g ch鮪g s? c? 輈h cho k? n╪g n蕌 nng sau n祔.",
	"е t? tu﹏ l謓h!",
	}
	TalkEx("",strTalk);
end

function cooking_tieshan_005()

local strTalk = {
	"L璾 s? ph?!",
	"Tr阨 n鉵g b鴆 th? n祔 m? c? 頲 v礽 h? T髖 M閚g T鰑 th? c遪 g? b籲g.",
	"L璾 s? ph?! T筰 h? c? m閠 chuy謓 mu鑞 th豱h gi竜 ngi!",
	"Tr阨 n鉵g b鴆 th? n祔 m? c? 頲 v礽 h? T髖 M閚g T鰑 th? kh玭g c遪 g? b籲g.",
	"(Hay l? 甶 t譵 {5 h騷 {T髖 M閚g T鰑} v覅?)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,3);
	TaskTip(" t譵 5 h? T髖 M閚g T鰑 cho L璾 Nh蕋 Ph?.");
end

function cooking_tieshan_006()

local strTalk = {
	"L璾 s? ph?! Nh譶 ngi m? h玦 nh? nh筰, n c﹜ ch綾 r蕋 v蕋 v?. T筰 h? c? 甧m m閠 h? T髖 M閚g T鰑 n, s? ph? h穣 l祄 v礽 ch衝 l蕐 l筰 tinh th莕.",
	"Hay l緈! Thanh ni猲 nh? ngi b﹜ gi? hi誱 th蕐 l緈!",
	"S? ph? t筰 h? n鉯 L璾 s? ph? r蕋 th輈h u鑞g ru, l莕 n祔 n y t筰 h?  ch th﹏ ? m閠 b譶h T髖 M閚g T鰑, m阨 S? ph? n誱 th?.",
	"Nh? tu鎖 v藋 m?  ? 頲 T髖 M閚g T鰑! Kh? l緈!",
	}
	--上交5瓶醉生梦死
	if GetItemCount(1,1,13) >= 5 then
		DelItem(1,1,13,5);
		if GetItemCount(2,0,394) >= 1 then
			DelItem(2,0,394,1);--收回不寻常的木柴
		end 
		TalkEx("cooking_tieshan_006_01",strTalk);
	else
		TalkEx("",{"Mau 甶 t譵 {5 b譶h T髖 M閚g T鰑} v?."});
	end
end

function cooking_tieshan_006_01()

local strTalk = {	
	"V穘 b鑙 trong l骳 n蕌 ╪ ph竧 hi謓 s? c駃 n祔, s? ph? n鉯 s? c駃 n祔 kh玭g nh? lo筰 c駃 b譶h thng. Kh玭g bi誸 n? c? g? c bi謙 n猲 sai t筰 h? n th豱h gi竜 L璾 s? ph?.",
	"в ta xem th?.",
	"Lo筰 c駃 n祔 g莕 gi鑞g Thi誸 Tuy課 m閏 nh璶g d蝟 h琻. Nh譶 b? m苩 xem ra  t鮪g nung trong l鯽 nh璶g v蒼 gi? 頲 nguy猲 tr筺g, n誹 d飊g ch髇g  luy謓 binh kh? kh玭g ch鮪g s? luy謓 頲 th莕 binh. Th? n祔 v藋! Ta t苙g ngi m閠 輙 Su蕋 Nhi猲 Nguy猲 B? v? Thi誸 Tuy課 m閏 xem nh? c秏 琻 b譶h ru ngon ngi mang n.",
	" t? L璾 s? ph? ch? 甶觤!",
	}
	
	TalkEx("",strTalk);
	if GetTask(TASK_COOKING_TIESHAN) ~= 4 then
		SetTask(TASK_COOKING_TIESHAN,4);
		AddItem(2,2,11,5,1);--得到5铁线木
		AddItem(2,10,2,5,1);--得到5率然原皮
	end
	TaskTip("Quay v? g苝 Ng? Tr? b竜 c竜 t譶h h譶h");

end

function cooking_tieshan_007()

local strTalk = {
	"Hay l? a {Su蕋 Nhi猲 Nguy猲 B讅 v? {Thi誸 Tuy課 M閏} c馻 L璾 s? ph? cho S? ph? r錳 t輓h ti誴!",
	}
	
	TalkEx("",strTalk);

end

function cooking_tieshan_008()

local strTalk = {
	"V? r錳 ?? C? h醝 頲 g? kh玭g?",
	"L璾 s? ph? n鉯 Thi誸 Tuy課 Tinh M閏 n祔 l? thng ph萴 ch? t筼 binh kh?, 玭g ta c遪 a  t? Su蕋 Nhi猲 Nguy猲 B? v? Thi誸 Tuy誸  c秏 琻  mang ru n.",
	"Su蕋 Nhi猲 Nguy猲 B?? Da r緉 n祔 r蕋 hi誱 th蕐, 10 n╩ n? m韎 l閠 da m閠 l莕, l? m閠 trong nh鱪g m鉵 ╪ ngon. Ngi ch? ch髏! ьi vi s? l祄 m閠 ch衝 ch竜 r緉 h秓 h筺g! Фm b秓 ngi ╪ xong s? th輈h ngay.",
	" 1 gi? sau厖",
	"S? ph?! Canh r緉  n蕌 xong?",
	" ch衝 canh l祄 t? Su蕋 Nhi猲 B? ta th藅 kh玭g nh l遪g! Vi s?  ki觤 tra c駃 trong l? l筰 c? lo筰 c駃  kh玭g nh鱪g kh玭g th? c秈 thi謓 ch蕋 lng n蕌 ╪ m? l鯽 ch竬 c騨g c? v蕁 , xem ra ph秈 ti誴 t鬰 lo ngh? chuy謓 ╪ u鑞g c馻 Ho祅g thng.",
	"Su蕋 Nhi猲 Nguy猲 B? n祔 ngi h穣 l蕐 甶!"
	}
	
	--扣除率然原皮和铁线木各5份
	if GetItemCount(2,2,11) >= 5 and GetItemCount(2,10,2) >= 5 then
		DelItem(2,2,11,5);
		DelItem(2,10,2,5);
		TalkEx("",strTalk);
		SetTask(TASK_COOKING_TIESHAN,5);
		AddRecipe(806)
		AddItem(2,10,2,100,1);
		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Phi課 Tinh M閏")
	else
		TalkEx("",{"{5} ph莕 {Su蕋 Nhi猲 Nguy猲 B讅 v? {Thi誸 Tuy課 m閏} L璾 s? ph? nh? ta a cho S? ph? ch糿g l? l祄 m蕋 tr猲 阯g?"});
	end
end

-------------------------------------织造系山狮精皮配方学习任务-----------------------------
function weave_shanshi_001()

local strTalk = {
	"Ngi n ng l骳 l緈! L莕 trc l竔 bu玭 ? Чi L? c? 甧m n cho ta 輙 trang ph鬰 c馻 d﹏ t閏 thi觰 s? ? khu T﹜ Nam r蕋 p. Ta 產ng nh l祄 v礽 b? trang ph鬰 m韎, kh? n鏸 qu? 輙 trang ph鬰  tham kh秓.Th? n祔 v藋! Ngi n Чi L? t譵 Ch? ti謒 N? ph鬰 l蕐 v礽 b? trang ph鬰 v?  ta tham kh秓.",
	"у nhi l藀 t鴆 甶 ngay!",
	"Ch? ti謒 N? ph鬰 l? ngi l祄 ╪, kh? tr竛h t輓h to竛 chi li. Ngi h穣 a b? ta v礽 b? y ph鬰 n誹 kh玭g b? ta s? kh玭g ch辵 a  cho ngi.",
	}
  
  TalkEx("",strTalk);
	SetTask(TASK_WEAVE_SHANSHI,1);
	TaskTip("дn Чi L? t譵 ch? ti謒 N? ph鬰 mua v礽 b? y ph鬰 c馻 khu v鵦 T﹜ Nam cho C萴 Nng");
  	
end

function weave_shanshi_002()
				 
local strSay = {
	"Ch? ti謒 N? ph鬰 l? ngi l祄 ╪, kh? tr竛h t輓h to竛 chi li. Ngi h穣 a b? ta v礽 b? y ph鬰 n誹 kh玭g b? ta s? kh玭g ch辵 a  cho ngi.",
	"е t? ch璦 h鋍 qua c竎h l祄/#ReLearnRecipe(4)",--补学之前没有学习的配方
	"Bi誸 r錳!/nothing"
	}
  
  SelectSay(strSay);
  
end

function weave_shanshi_003()

local strTalk_1 = {
	"Ch祇 ngi! S? ph? sai t筰 h? n l蕐 v礽 b? y ph鬰 c馻 d﹏ t閏 thi觰 s? ? khu T﹜ Nam v? tham kh秓  may v礽 b? trang ph鬰 m韎.",
	"Trang ph鬰 ? y c竔 n祇 c騨g ph秈 t鑞 nhi襲 ti襫 m韎 mua 頲, ngi n鉯 a C萴 Nng l? a sao? 輙 nh蕋 c騨g ph秈 l蕐 l筰 ti襫 v鑞. N鉯 n chuy觧 ti襫 b筩 d? m蕋 l遪g. Ngi n鉯 xem厖",
	"(Qu? ng nh? l阨 c馻 C萴 nng, hay l? a b? ta {Huy誸 H? Qu? Vng Kh秈}, {S琻 Qu? Huy誸 Y}, {Long B? ? kim Y} v? {Thi猲 Gi竛g B祇}, n誹 kh玭g b? ta s? kh玭g ch辵 a y ph鬰 cho ta)",
	}	
local strTalk_2 = {
	"Ch祇 ngi! S? ph? sai t筰 h? n l蕐 v礽 b? y ph鬰 c馻 d﹏ t閏 thi觰 s? ? khu T﹜ Nam v? tham kh秓  may v礽 b? trang ph鬰 m韎.",
	"Trang ph鬰 ? y c竔 n祇 c騨g ph秈 t鑞 nhi襲 ti襫 m韎 mua 頲, ngi n鉯 a C萴 Nng l? a sao? 輙 nh蕋 c騨g ph秈 l蕐 l筰 ti襫 v鑞. N鉯 n chuy觧 ti襫 b筩 d? m蕋 l遪g. Ngi n鉯 xem厖",
	"(Qu? ng nh? l阨 c馻 C萴 nng, hay l? a b? ta {Thi猲 Y}, {Phi Thi猲 Th竔 Thng}, {V? Song u Y}, {Ng? Th竔 Ngh? Thng}, n誹 kh玭g b? ta s? kh玭g ch辵 a y ph鬰 cho ta)",
	}
  
  --判断衣服织造性别路线
  if GetTask(1935) == 1 then
  	TalkEx("",strTalk_1);
  	TaskTip("Лa Huy誸 H? Qu? Vng Kh秈, S琻 Qu? Huy誸 Y, Long B? ? kim Y v? Thi猲 Gi竛g B祇 cho Ch? ti謒 N? ph鬰");
  else
		TalkEx("",strTalk_2);
		TaskTip("Лa Thi猲 Y, Phi Thi猲 Th竔 Thng, V? Song u Y, Ng? Th竔 Ngh? Thng cho Ch? ti謒 N? ph鬰");
	end
	SetTask(TASK_WEAVE_SHANSHI,2);
end

function weave_shanshi_004()

local strSay_1 = {
	"Th? n祇 m韎 t鑤 y?厖(Trc khi nh薾 Huy誸 H? Qu? Vng Kh秈, S琻 Qu? Huy誸 Y, Long B? ? kim Y v? Thi猲 Gi竛g B祇 xin t筸 th阨 b? nh鱪g v藅 ph萴 kh玭g c莕 thi誸 v祇 rng ch鴄   tr竛h th蕋 tho竧)",
	"? y c? v礽 b? trang ph鬰 xem nh? l? v藅 t筰 h? m筼 mu閕 n nh? ngi gi髉./weave_shanshi_005",
	"Sau n祔 h穣 a./nothing"
	}
	
local strSay_2 = {
	"Th? n祇 m韎 t鑤 y?厖((Trc khi nh薾 Thi猲 Y, Phi Thi猲 Th竔 Thng, V? Song u Y v? Ng? Th竔 Ngh? Thng xin t筸 th阨 b? nh鱪g v藅 ph萴 kh玭g c莕 thi誸 v祇 rng ch鴄   tr竛h th蕋 tho竧)",
	"? y c? v礽 b? trang ph鬰 xem nh? l? v藅 t筰 h? m筼 mu閕 n nh? ngi gi髉./weave_shanshi_005",
	"Sau n祔 h穣 a./nothing"
	}
	
  --判断衣服织造性别路线
  if GetTask(1935) == 1 then
  	SelectSay(strSay_1);
  else
  	SelectSay(strSay_2);
  end

end

function weave_shanshi_005()

local strTalk_1 = {
	"Зy l? trang ph鬰 s? ph? nh? t筰 h? 甧m n!",
	"?! C萴 Nng l骳 n祇 c騨g v藋, m鋓 ngi c遪 l? g? nhau m? c遪 kh竎h kh? th?! Th? n祔 v藋! в ta nh? l竔 bu玭 chuy觧 h祅g n Чi T鑞g ti謓 阯g s? gh? a cho S? ph? ngi v礽 b? trang ph鬰 c馻 Чi L?, ngi v? ch? tin 甶!",
	"(Qu? nhi猲 l? ngi l祄 ╪! Х th? c騨g kh玭g c遪 c竎h n祇 kh竎, hay l? quay v? ph鬰 m謓h C萴 Nng).",
	"V藋 xin l祄 phi襫 ngi!",
	"ng kh竎h s竜!",
	}
	
local strTalk_2 = {
	"Kh玭g ph秈 ngi n鉯 C萴 Nng a trang ph鬰 cho ta sao? Sao kh玭g th蕐 g? h誸 v藋?",
	"(Qu? ng nh? l阨 c馻 C萴 nng, hay l? a b? ta {Huy誸 H? Qu? Vng Kh秈}, {S琻 Qu? Huy誸 Y}, {Long B? ? kim Y} v? {Thi猲 Gi竛g B祇}, n誹 kh玭g b? ta s? kh玭g ch辵 a y ph鬰 cho ta)",
	}
	
local strTalk_3 = {
	"Kh玭g ph秈 ngi n鉯 C萴 Nng a trang ph鬰 cho ta sao? Sao kh玭g th蕐 g? h誸 v藋?",
	"(Qu? ng nh? l阨 c馻 C萴 nng, hay l? a b? ta {Thi猲 Y}, {Phi Thi猲 Th竔 Thng}, {V? Song u Y}, {Ng? Th竔 Ngh? Thng}, n誹 kh玭g b? ta s? kh玭g ch辵 a y ph鬰 cho ta)",
	}

  --上交衣服
  if GetTask(1935) == 1 then
  	if handin_item(1,5) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("V? Th祅h Й ph鬰 m謓h C萴 Nng");
  	else
  		TalkEx("",strTalk_2);
  	end
  else
  	if handin_item(1,8) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("V? Th祅h Й ph鬰 m謓h C萴 Nng");
		else
  		TalkEx("",strTalk_3);
  	end
  end
end

function weave_shanshi_006()

local strTalk = {
	"Y猲 t﹎ 甶! в ta nh? l竔 bu玭 chuy觧 h祅g n Чi T鑞g ti謓 阯g s? gh? a cho s? ph? ngi v礽 b? trang ph鬰 c馻 Чi L?, ngi v? ch? tin 甶!",
	"(Qu? nhi猲 l? ngi l祄 ╪! Х th? c騨g kh玭g c遪 c竎h n祇 kh竎, hay l? quay v? ph鬰 m謓h C萴 Nng).",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_007()

local strTalk = {
	"е t? v? r錳! Ch? ti謒 n鉯 s? nh? l竔 bu玭 c馻 Чi L? chuy觧 h祅g n, c騨g kh玭g bi誸厖",
	"Y猲 t﹎ r錳! Trang ph鬰 s? 頲 chuy觧 n nhanh th玦! B鋘 h? l? d﹏ l祄 ╪ lu玭 l蕐 ch? t輓 l祄 u m?.",
	"V藋 th? hay l緈! Kh玭g bi誸 hi謓 gi? s? ph?  ngh? ra trang ph鬰 n祇 m韎 ch璦?",
	"? tng  c?, nh璶g c遪 thi誹 nguy猲 li謚! S琻 S? B? l莕 trc Th? s╪ Trng a cho ta v鮝 c鴑g v鮝 d蝟 nh璶g 輙 qu?, trong l骳 ta d謙  th? th猰 L穘h tr飊g t? v祇  t╪g  d蝟 nh璶g l筰 r蕋 kh? nhu閙. Ngi gi髉 ta h醝 th╩ Ho祅g Чi Th萴 l祄 sao  nhu閙 v? t╪g t輓h d蝟 dai c馻 S琻 S? B?.",
	"е t? 甶 ngay!",
	}

	TalkEx("",strTalk);
	if GetTask(TASK_WEAVE_SHANSHI) ~= 4 then
		AddItem(2,2,47,1,1);--得到山狮之皮
		SetTask(TASK_WEAVE_SHANSHI,4);
	end
	TaskTip("m S琻 S? B? n Th祅h Й t譵 Ho祅g Чi Th萴 h醝 c竎h nhu閙 m祏");

end

function weave_shanshi_008()

local strTalk = {
	"Ngi gi髉 ta h醝 th╩ Ho祅g Чi Th萴 l祄 sao  nhu閙 v? t╪g t輓h G﹏ c鑤 c馻 S琻 S? B?.",
	"е t? 甶 ngay!",
	}

	TalkEx("",strTalk);
	
end

function weave_shanshi_009()

local strTalk = {
	"Xin ch祇 i th萴 !",
	"Ngi l?  t? c馻 C萴 Nng? B? ta thng khen mi trc m苩 ta! H玬 nay t譵 ta c? vi謈 g??",
	"S? ph? t筰 h? trong l骳 may 竜 m韎 g苝 ch髏 kh? kh╪. S? ph? mu鑞 c秈 thi謓  d蝟 c馻 S琻 S? B?. Ngi  th? th猰 L穘h tr飊g t?,  d蝟 th? 頲 c秈 thi謓 nh璶g m祏 s綾 l筰 r蕋 kh? nhu閙. Kh玭g bi誸 Ho祅g Чi Th萴 c? th? gi髉 S? ph? gi秈 quy誸 v蕁 ?",
	"M祏 Tr緉g l? 璾 甶觤 c馻 ? T祄 Ti nh璶g v? n? qu? tr緉g n猲 kh玭g th? tr閚 l蒼 v韎 m祏 kh竎. Th? n祔 v藋! Ta c? ? T祄 Ti do m閠 ngi b筺 t苙g. ? T祄 n祔 s鑞g trong b╪g tuy誸 l﹗ n╩ n猲 t? n? nh? ra kh玭g nh鱪g ch綾 m? c遪 p. H穣 nh薾 l蕐 kh玭g ch鮪g s? gi髉 頲 ngi.",
	" t? Ho祅g Чi Th萴!",
	"ng kh竎h s竜! C萴 Nng c騨g thng t苙g ta trang ph鬰, s? T? t籱 n祔 th? c? ng l? bao. H穣 mau 甧m v? cho C萴 Nng!",
	}

	--扣掉山狮之皮
	if DelItem(2,2,47,1) == 1 then
		TalkEx("",strTalk);
		if GetTask(TASK_WEAVE_SHANSHI) ~= 5 then
			AddItem(2,9,7,5,1);--得到乌蚕丝
			SetTask(TASK_WEAVE_SHANSHI,5);
		end
		TaskTip("m 5 ? T籱 Ti c馻 Ho祅g Чi Th萴 v? cho C萴 Nng");
	else
		TalkEx("",{"{1} t蕀 {S琻 S? B讅 C萴 Nng nh? ta a cho s? ph? ch糿g l?  l祄 m蕋 tr猲 阯g?"});
	end

end

function weave_shanshi_010()

local strTalk = {
	"ng kh竎h s竜! C萴 Nng c騨g thng t苙g ta trang ph鬰, s? T? t籱 n祔 th? c? ng l? bao. H穣 mau 甧m v? cho C萴 Nng!",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_011()

local strTalk = {
	"Зy l? ? T祄 Ti c馻 Ho祅g Чi Th萴, xin s? ph? xem qua!",
	"?! в ta th? xem厖",
	" (1 gi? sau?)",
	"T? t籱 n祔 qu? nhi猲 l? lo筰 thng ng. ? y c? 輙 ? T祄 Ti v? c竎h ch? t筼 S琻 S? Tinh B?, ngi h穣 t? t? nghi猲 c鴘.",
	" t? s? ph?!",
	}

	--扣5份乌蚕丝
	if GetItemCount(2,9,7) >= 5 then
		DelItem(2,9,7,5);
		TalkEx("",strTalk);
		SetTask(TASK_WEAVE_SHANSHI,6);
		AddRecipe(807);
		AddItem(2,9,7,100,1);
		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: S琻 S? Tinh B?")
	else
		TalkEx("",{"{5} ph莕 {? T祄 Ti} Ho祅g Чi Th萴 nh? ta a cho s? ph? ch糿g l?  l祄 m蕋 d鋍 阯g?"});
	end
end

-------------------------------------------制符系赤钨灵符配方学习任务-----------------------------
function juju_chiwu_001()

local strTalk = {
	"Ngi n ng l骳 l緈! G莕 y s鴆 m筺h c馻 O竛 H錸 ? Phong Й c祅g ng祔 c祅g m筺h, g莕 y ch髇g  t蕁 c玭g Giang T﹏ th玭, vi s? 產ng ngh? c竎h ch? t筼 lo筰 ph? m韎. L莕 trc {L璾 Nh蕋 Ph駗 ? {Bi謓 Kinh} v? {Th? m? Чi} ? {Th祅h Й} c? xin ta {Khu Ma linh ph飣 nh璶g v蒼 ch璦 a cho h?, ngi h穣 thay ta 甶 m閠 chuy課!",
	"е t? 甶 ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,1);
	AddItem(2,0,395,2,1);--得两道驱魔灵符
	TaskTip("m 2 t蕀 Khu Ma linh ph? n cho L璾 Nh蕋 Ph? ? Bi謓 Kinh v? Чi kho竛g c玭g ? Th祅h Й.");
end

function juju_chiwu_002()

local strTalk = {
	"L莕 trc {L璾 Nh蕋 Ph駗 ? {Bi謓 Kinh} v? {Чi kho竛g c玭g} ? {Th祅h Й} c? xin ta {Khu Ma linh ph飣 nh璶g v蒼 ch璦 a cho h?, ngi h穣 thay ta 甶 m閠 chuy課!",
	"е t? 甶 ngay!",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_003()

local strTalk = {
	"L璾 s? ph?! S? ph? t筰 h? g莕 y b薾 ch? t筼 m閠 lo筰 ph? m韎, kh玭g th? 甧m Khu Ma linh ph? n cho ngi.",
	"G莕 y O竛 H錸 thng xu蕋 hi謓 ? Giang T﹏ th玭, c? linh ph? n祔 sau n祔 c? th? y猲 t﹎ o kho竛g.",
	"S鴆 m筺h c馻 Khu Ma ph? n祔 c? h筺, s? ph? ng祔 m suy ngh?  ch? t筼 lo筰 ph? m韎 nh璶g kh玭g c? k誸 qu?.",
	"Ta c? B? б m閏, nghe n鉯 c? th莕 l鵦 ph? h?, kh玭g bi誸 c? th? gi髉 輈h g? cho s? ph? ngi.",
	"V藋 t筰 h? thay m苩 s? ph? 產 t? L璾 s? ph?!",
	"ng kh竎h s竜!",
	}

	TalkEx("",strTalk);
	--删去驱魔灵符
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1) then
		AddItem(2,2,14,10,1);--得到10个菩提木
		SetTask(TASK_JUJU_TALK,SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("m B? б m閏 v? H綾 ? th筩h c馻 L璾 Nh蕋 Ph? v? Чi kho竛g c玭g v? cho V﹏ Du o nh﹏");
	else
		TaskTip("Лa 1 t蕀 Khu Ma Linh Ph? cho Чi kho竛g c玭g ? Th祅h Й");
	end
	
end

function juju_chiwu_004()

local strTalk = {
	"G莕 y O竛 H錸 thng xu蕋 hi謓 ? Giang T﹏ th玭, c? linh ph? n祔 sau n祔 c? th? y猲 t﹎ o kho竛g.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_005()

local strTalk = {
	"Чi s? ph?! S? ph? t筰 h? g莕 y b薾 ch? t筼 m閠 lo筰 ph? m韎, kh玭g th? 甧m Khu Ma linh ph? n cho ngi.",
	"G莕 y O竛 H錸 thng xu蕋 hi謓 ? Giang T﹏ th玭, c? t蕀 ph? n祔 sau n祔 ta y猲 t﹎ o kho竛g h琻.",
	"S鴆 m筺h c馻 Khu Ma ph? n祔 c? h筺, s? ph? ng祔 m suy ngh?  ch? t筼 lo筰 ph? m韎 nh璶g kh玭g c? k誸 qu?.",
	"Ta c? ch髏 H綾 ? th筩h. L莕 trc s? ph? ngi c? nh? ta t譵 Thi猲 thanh th筩h  luy謓 b颽, ch蕋 lng c馻 H綾 ? th筩h n祔 t鑤 h琻 Thi猲 thanh th筩h, kh玭g bi誸 cho gi髉 輈h g? cho S? ph? ngi, h穣 甧m n? v? cho s? ph?!",
	"V藋 t筰 h? thay m苩 s? ph? 產 t? L璾 s? ph?!",
	"ng kh竎h s竜!",
	}

	TalkEx("",strTalk);	
	--删去驱魔灵符
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end	
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),2,1) then
		AddItem(2,2,37,10,1);--得到10个黑钨石
		SetTask(TASK_JUJU_TALK,(SetBit(GetTask(TASK_JUJU_TALK),2,1)));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("m B? б m閏 v? H綾 ? th筩h c馻 L璾 Nh蕋 Ph? v? Чi kho竛g c玭g v? cho V﹏ Du o nh﹏");
	else
		TaskTip("Лa 1 t蕀 Khu Ma Linh Ph? cho L璾 Nh蕋 Ph? ? Bi謓 Kinh");
	end
	
end

function juju_chiwu_006()

local strTalk = {
	"G莕 y O竛 H錸 thng xu蕋 hi謓 ? Giang T﹏ th玭, c? linh ph? n祔 sau n祔 c? th? y猲 t﹎ o kho竛g.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_007()

local strTalk = {
	"Х a linh ph? cho L璾 s? ph? v? Чi s? ph?? B鋘 h? thng n c﹜ o kho竛g trong n骾 s﹗, n琲  ﹎ kh? t? t?, tuy kh? n╪g c馻 Khu Ma Linh Ph? c? h筺 nh璶g gi髉 tho竧 th﹏ th? kh玭g v蕁  g?.",
	"H? c? g鰅 cho s? ph? {H綾 ? th筩h} v? {B? б m閏}, hy v鋘g h鱱 輈h v? c騨g  p t? l? b颽 c馻 ngi.",
	"в ta xem th?!",
	"H綾 ? th筩h n祔 c? t? t輓h th莕 k?, B? б m閏 n祔 c騨g 萵 ch鴄 th莕 l鵦 ph? h?. Ngi c莔 th? xem.",
	" (1 gi? sau?)",
	}

	--扣10份黑钨石和菩提木
	if DelItem(2,2,37,10) == 1 and DelItem(2,2,14,10) == 1 then
		TalkEx("juju_chiwu_007_01",strTalk);
	else
		TalkEx("",{"{10} {B? б m閏} v? {H綾 ? th筩h} L璾 s? ph? v? Чi s? ph? nh? ta a cho s? ph? ch糿g l? d鋍 阯g  l祄 m蕋?"});
	end
end

function juju_chiwu_007_01()

local strTalk = {
	"S? ph?! Th? n祇?",
	"2 m鉵 L璾 s? ph? v? Чi s? ph? a ta u l? b秓 b鑙 kh玭g nh鱪g t╪g uy l鵦 c馻 b颽 ch? m? c遪 c? s鴆 m筺h th莕 k?.",
	"Vi s? s? truy襫 th? cho ngi phng ph竝, ngi h穣 c? g緉g nghi猲 c鴘 kh玭g ch鮪g s? ph竧 hi謓 t竎 d鬾g kh竎 c馻 n?.",
	" t? s? ph? ch? 甶觤!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,3);
	AddRecipe(808);
	AddItem(2,2,14,100,1);
	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h ? Linh Ph?");

end

--补学配方
--nType为 1:长兵器、2短兵器、3奇门兵器 4:护甲织造　5：制药　6：烹饪
function ReLearnRecipe(nType)
	if (nType == 1) then
		local nLevel = GetLifeSkillLevel(1, 2);
		if (GetLifeSkillLevel(1, 2) > 1) then
      		if (GetTask(1926) == 10 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
       		elseif (GetTask(1926) == 20 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
       		elseif (GetTask(1926) == 30 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
       		elseif (GetTask(1926) == 40 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        		AddRecipe(756)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
       		elseif (GetTask(1926) == 50 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        		AddRecipe(756)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        		AddRecipe(757)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
       		elseif (GetTask(1926) == 60 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        		AddRecipe(756)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        		AddRecipe(757)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        		AddRecipe(758)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
       		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        		AddRecipe(750)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        		AddRecipe(756)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        		AddRecipe(757)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        		AddRecipe(758)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
        		AddRecipe(759)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
      		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 1 and HaveLearnRecipe(759) == 0) then
        		AddRecipe(759)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
        	elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(86)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th駓 H醓 C玭")
    			AddRecipe(87)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? B譶h C玭")
    			AddRecipe(97)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T輈h Trng")
    			AddRecipe(98)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ho籲g Ph竝 Trng")
        		AddRecipe(749)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
    			AddRecipe(750)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
    			SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(88)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? ч C玭")
        		AddRecipe(89)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H筩 V? C玭")
        		AddRecipe(99)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tam B秓 Trng")
        		AddRecipe(100)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph鬰 Ma Trng")
        		AddRecipe(751)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        		AddRecipe(752)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(90)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph﹏ Th駓 C玭")
        		AddRecipe(101)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? ч Trng")
        		AddRecipe(753)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(91)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ti襪 Long C玭")
        		AddRecipe(92)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim Lng")
        		AddRecipe(102)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nguy謙 Lu﹏ Trng")
        		AddRecipe(103)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh玭g Minh Trng")
        		AddRecipe(754)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        		AddRecipe(755)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(93)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ф C萿 B鎛g")
        		AddRecipe(94)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh萵 Na La B鎛g")
        		AddRecipe(104)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B秓 Quang Trng")
        		AddRecipe(105)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi T? T筰 Trng")
        		AddRecipe(756)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(95)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 X? C玭")
        		AddRecipe(106)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi B竧 Nh? Trng")
        		AddRecipe(757)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        		SetTask(1926, 60)
    		elseif (nLevel >= 60 and GetTask(1926) == 60) then
        		AddRecipe(96)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Long C玭")
        		AddRecipe(107)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Ph藅 Trng")
        		AddRecipe(758)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
        		SetTask(1926, 70)
       		elseif (nLevel >= 70 and GetTask(1926) == 70) then
        		AddRecipe(759)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
        		SetTask(1926, 80)
       		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B筺 tr?! ng n鉵g v閕! B秐 l躰h giang h? c馻 ngi c遪 k衜, ch? ngi luy謓 th猰 m閠 th阨 gian n鱝 h穣 n t譵 ta."})
			end
		end
	end
	
	if (nType == 2) then
		local nLevel = GetLifeSkillLevel(1, 3)
		if (GetLifeSkillLevel(1, 3) > 1) then
			if (nLevel >= 1 and GetTask(1926) == 0) then
				AddRecipe(49)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Phi Ng? Th?")
	   			AddRecipe(50)
	   			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H錸g Ma Th?")
    			AddRecipe(62)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Linh X? Ki誱")
				AddRecipe(63)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Sa Ki誱")
    			AddRecipe(73)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi韎 o")
    			AddRecipe(74)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi誸 Thi誸 o")
    			AddRecipe(782)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Li評 Di謕 Song o")
    			AddRecipe(783)
    			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nguy謙 Nha Th輈h")
        		SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(51)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 V﹏ Th?")
        		AddRecipe(52)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tam Dng Th?")
        		AddRecipe(64)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Minh Ki誱")
        		AddRecipe(65)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy誸 S竧 Ki誱")
        		AddRecipe(75)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Li謙 Di謒 o")
        		AddRecipe(76)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? H? 筺 M玭 o")
        		AddRecipe(784)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: цi Phi Th輈h")
        		AddRecipe(785)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H錸g 蕁 o")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(53)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Ng璾 Th?")
        		AddRecipe(66)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H祄 Quang Ki誱")
        		AddRecipe(77)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C鰑  o")
        		AddRecipe(786)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Bi猲 B鴆 o")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(54)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B輈h X? Th?")
        		AddRecipe(55)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh竛g Long Th?")
        		AddRecipe(67)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Dng")
        		AddRecipe(68)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy襫 謓")
        		AddRecipe(78)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? S琻 o")
        		AddRecipe(79)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nh﹏ у o")
        		AddRecipe(787)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? H錸g")
        		AddRecipe(788)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B竜 Hoa")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(56)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tng Ph鬾g")
        		AddRecipe(57)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? Long")
        		AddRecipe(69)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Sng")
        		AddRecipe(70)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Dao Quang")
        		AddRecipe(80)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Long L﹏")
        		AddRecipe(81)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B竎h B輈h")
        		AddRecipe(789)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Uy猲 Μng Li猲 Ho祅")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(58)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? Phng Qu? Ch髇g")
        		AddRecipe(71)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B輈h Huy誸")
        		AddRecipe(82)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 S竧")
        		AddRecipe(790)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy誸 Li猲 Ho祅")
        		SetTask(1926, 60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(59)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? L? мa Ng鬰")
        		AddRecipe(72)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy襫 thi誸 Tr鋘g Ki誱")
        		AddRecipe(83)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Vng")
        		AddRecipe(791)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T玦 Nguy謙")
        		SetTask(1926, 70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
        		AddRecipe(792)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 筺 Trng")
        		SetTask(1926, 80)
      		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B筺 tr?! ng n鉵g v閕! B秐 l躰h giang h? c馻 ngi c遪 k衜, ch? ngi luy謓 th猰 m閠 th阨 gian n鱝 h穣 n t譵 ta."})
      		end
    	end 
	end
	
	if (nType == 3) then
			local nLevel = GetLifeSkillLevel(1, 4)
			if (GetLifeSkillLevel(1, 4) > 1) then
				if (GetTask(1926) == 10 and HaveLearnRecipe(760) == 0) then
			  		AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
				elseif GetTask(1926)==20 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
      			elseif GetTask(1926)==30 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
      			elseif GetTask(1926)==40 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
        			AddRecipe(765)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 Cung")
        			AddRecipe(766)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Di謙 Di謒 Cung")
      			elseif GetTask(1926)==50 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
        			AddRecipe(765)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 Cung")
        			AddRecipe(766)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Di謙 Di謒 Cung")
        			AddRecipe(767)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim")
      			elseif GetTask(1926)==60 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
        			AddRecipe(765)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 Cung")
        			AddRecipe(766)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Di謙 Di謒 Cung")
        			AddRecipe(767)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim")
        			AddRecipe(768)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 L鵦")
      			elseif GetTask(1926)==70 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
			  		AddRecipe(761)
			  		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
        			AddRecipe(765)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 Cung")
        			AddRecipe(766)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Di謙 Di謒 Cung")
        			AddRecipe(767)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim")
        			AddRecipe(768)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 L鵦")
        			AddRecipe(769)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xi Nha")     			
        		elseif (nLevel >= 1 and GetTask(1926) == 0) then
        			AddRecipe(110)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Li評 Di謕 產o")
		    		AddRecipe(111)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 筺 Trng ti猽")
		    		AddRecipe(121)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng鋍 V薾 c莔")
		    		AddRecipe(122)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kinh Уo c莔")
		    		AddRecipe(132)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph竛 Quan b髏")
		    		AddRecipe(133)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi誸 Xung b髏")
		    		AddRecipe(760)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tr骳 M閏 Cung")
		    		AddRecipe(761)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Щng Cung")
		    		AddRecipe(771)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H綾 Thi誸 tr秓")
		    		AddRecipe(772)
		    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Cang tr秓")
		    		SetTask(1926, 10)
    			elseif (nLevel >= 10 and GetTask(1926) == 10) then
        			AddRecipe(112)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Di謙 th莕 ch﹎")
        			AddRecipe(113)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? M蓇 Ly H錸 ti詎")
        			AddRecipe(123)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B玭 L玦 c莔")
        			AddRecipe(124)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Phi B閏 Li猲 ch﹗")
        			AddRecipe(134)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xu﹏ Phong b髏")
        			AddRecipe(135)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kinh L玦 b髏")
        			AddRecipe(762)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Thi誸 Cung")
        			AddRecipe(763)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L筩 Nh筺 Cung")
        			AddRecipe(773)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C? Quan tr秓")
        			AddRecipe(774)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Phi Ho祅g tr秓")
        			SetTask(1926, 20)
    			elseif nLevel>=20 and GetTask(1926)==20 then
        			AddRecipe(114)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H綾 Huy誸 th莕 ch﹎")
        			AddRecipe(125)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L玦 чng v筺 v藅")
        			AddRecipe(136)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: V? H錳 b髏")
        			AddRecipe(764)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xuy猲 T﹎ Cung")
        			AddRecipe(775)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 竚 Th輈h")
        			SetTask(1926, 30)
    			elseif nLevel>=30 and GetTask(1926)==30 then
        			AddRecipe(115)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng鋍 Phong ch﹎")
        			AddRecipe(116)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? L? c祅 kh玭")
        			AddRecipe(126)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy襫 Nhai phi b閏")
        			AddRecipe(127)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H秈 Nguy謙 thanh huy")
        			AddRecipe(137)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 b髏")
        			AddRecipe(138)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th? H錸 b髏")
        			AddRecipe(765)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy Nguy謙 Cung")
        			AddRecipe(766)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Di謙 Di謒 Cung")
        			AddRecipe(776)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: R╪g s鉯")
        			AddRecipe(777)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? Di謒")
        			SetTask(1926, 40)
    			elseif nLevel>=40 and GetTask(1926)==40 then
        			AddRecipe(117)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H祄 Sa X? 秐h")
        			AddRecipe(118)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th蕋 Tinh Th蕌 C鑤 ch﹎")
        			AddRecipe(128)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C鰑 Ti猽 Ho祅 b閕")
        			AddRecipe(129)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Hi謚 Chung")
        			AddRecipe(139)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Long Thi謙")
        			AddRecipe(140)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: R╪g s鉯")
        			AddRecipe(767)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim")
        			AddRecipe(778)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: V筺 Ki誴")
        			SetTask(1926, 50)
    			elseif nLevel>=50 and GetTask(1926)==50 then
        			AddRecipe(119)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th蕋 S竧 Thi猲 La")
        			AddRecipe(130)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 Kh雐")
        			AddRecipe(141)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Qu﹏")
        			AddRecipe(768)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 L鵦")
        			AddRecipe(779)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Dng Qu﹏")
        			SetTask(1926, 60)
    			elseif nLevel>=60 and GetTask(1926)==60 then
        			AddRecipe(120)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Ngo筰 Phi Ti猲")
        			AddRecipe(131)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ti猽 V?")
        			AddRecipe(142)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 C?")
        			AddRecipe(769)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Xi Nha")
        			AddRecipe(780)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng璶g Sng")
        			SetTask(1926, 70)
    			elseif nLevel>=70 and GetTask(1926)==70 then
    	  			AddRecipe(770)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Long Kh萿")
        			AddRecipe(781)
        			Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? T玭")
        			SetTask(1926, 80)
      			else
       				TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B筺 tr?! ng n鉵g v閕! B秐 l躰h giang h? c馻 ngi c遪 k衜, ch? ngi luy謓 th猰 m閠 th阨 gian n鱝 h穣 n t譵 ta."})
				end
    		end
	end
	
	if (nType == 4) then
		local nLevel = GetLifeSkillLevel(1, 5)
		if (1 == GetTask(1935)) then
			if (nLevel >= 10 and GetTask(1926) == 10) then
				AddRecipe(167)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L﹎ trang")
				AddRecipe(168)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ho祅g H? b? y")
				AddRecipe(149)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 H祅h ph鬰")
				AddRecipe(150)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Sng b祇")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(169)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 Ng璾 h? gi竝")
				AddRecipe(170)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Thanh Sng Hoa sam")
				AddRecipe(151)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tham Lam y")
				AddRecipe(152)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h уng tr?")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(171)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C? Nhi猰 kh竎h y")
				AddRecipe(172)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Nh蒼 b? trang")
				AddRecipe(153)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nhuy詎 Kim y")
				AddRecipe(154)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thng Lan y")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(173)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th莕 S竎h kim gi竝")
				AddRecipe(174)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L玦 Ng﹏ Gi竝")
				AddRecipe(155)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Lam K譶h b? gi竝")
				AddRecipe(156)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Long b祇")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(175)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tinh Cang Huy襫 kim gi竝")
				AddRecipe(176)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Th? Th竛h sam")
				AddRecipe(158)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B╪g T祄 Tr? sam")
				AddRecipe(157)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Lang y")
				SetTask(1926, 60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(177)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Huy誸 H? Qu? Vng kh秈")
				AddRecipe(159)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: S琻 Qu? Huy誸 y")
				AddRecipe(178)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Long B? ? kim y")
				AddRecipe(160)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Gi竛g b祇")
				SetTask(1926, 70)
			else
				Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!",0)
			end
		else
			if nLevel>=10 and GetTask(1926)==10 then
				AddRecipe(185)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Luy謓 Gi竝 thng")
				AddRecipe(186)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C竛 Hoa thng")
				AddRecipe(203)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: M藅 V﹏ sam")
				AddRecipe(204)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: V? u thng")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(187)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C萴 Anh thng")
				AddRecipe(188)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? Ki謙 thng")
				AddRecipe(205)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 T祄 gi竝 y")
				AddRecipe(206)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh雐 La thng")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(189)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Linh thng")
				AddRecipe(190)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H錸g Ngh? thng")
				AddRecipe(207)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 C玭g u y")
				AddRecipe(208)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Linh Lung thng")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(191)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L﹏ Quang gi竝 y")
				AddRecipe(192)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H? C? v? y")
				AddRecipe(209)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th? Vng u y")
				AddRecipe(210)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th竔 Hoa thng")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(193)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Minh Quang gi竝 y")
				AddRecipe(194)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ngh? Thng v? y")
				AddRecipe(211)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ngh辌h V﹏ u y")
				AddRecipe(212)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C萴 V﹏ thng")
				SetTask(1926,60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(195)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Y")
				AddRecipe(196)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Phi Thi猲 th竔 thng")
				AddRecipe(213)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: V? Song u y")
				AddRecipe(214)
				Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? Th竔 ngh? thng")
				SetTask(1926,70)
			else
				Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!",0)
			end
		end
	end
		
	if nType == 5 then
		local nLevel = GetLifeSkillLevel(1, 6);
		if (nLevel >= 1) then
			if GetTask(1926)>=20 and HaveLearnRecipe(234)==0 then
		    	AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
         	elseif GetTask(1926)==30 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
          	elseif GetTask(1926)==40 and HaveLearnRecipe(234)==0 then
          		AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
            	AddRecipe(240)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
            	AddRecipe(246)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
          	elseif GetTask(1926)==50 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
            	AddRecipe(240)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
            	AddRecipe(246)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
            	AddRecipe(236)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi猽 H錸 n")
            	AddRecipe(241)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Thi猲 t竛")
          	elseif GetTask(1926)==60 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
            	AddRecipe(240)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
            	AddRecipe(246)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
            	AddRecipe(236)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi猽 H錸 n")
            	AddRecipe(241)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Thi猲 t竛")
            	AddRecipe(237)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? D辌h n")
            	AddRecipe(247)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C祅 Nguy猲 Ch輓h Kh? n")
         	elseif GetTask(1926)==70 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
            	AddRecipe(240)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
            	AddRecipe(246)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
            	AddRecipe(236)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi猽 H錸 n")
            	AddRecipe(241)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Thi猲 t竛")
            	AddRecipe(237)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? D辌h n")
            	AddRecipe(247)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C祅 Nguy猲 Ch輓h Kh? n")
            	AddRecipe(242)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th蕋 Tr飊g Th蕋 Hoa t竛")
         	elseif GetTask(1926)==80 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
    	        Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
            	AddRecipe(239)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
            	AddRecipe(244)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
            	AddRecipe(235)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
            	AddRecipe(245)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
            	AddRecipe(240)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
            	AddRecipe(246)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
            	AddRecipe(236)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi猽 H錸 n")
            	AddRecipe(241)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Thi猲 t竛")
            	AddRecipe(237)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? D辌h n")
            	AddRecipe(247)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C祅 Nguy猲 Ch輓h Kh? n")
            	AddRecipe(242)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th蕋 Tr飊g Th蕋 Hoa t竛")
            	AddRecipe(238)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B玭 Tinh Nguy謙 Кn")
            	AddRecipe(243)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi Nh藅 Dng T竛")
            	AddRecipe(248)
            	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Vng B? T﹎ n")
            elseif (nLevel >= 1 and GetTask(1926) == 0) then
       			AddRecipe(3)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kim S竛g t竛")
        		AddRecipe(8)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ti觰 Ho祅 n")
    	    	SetTask(1926, 10)  
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(4)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Huy誸 t竛")
        		AddRecipe(13)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh T﹎ t竛")
        		AddRecipe(234)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h Nh藅 n")
        		AddRecipe(239)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Dng t竛")
		        AddRecipe(244)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Gi秈 чc n")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(9)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ho祅 Dng n")
        		AddRecipe(14)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 輈h Kh? t竛")
        		AddRecipe(235)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: To祅 Sinh n")
        		AddRecipe(245)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ch? Th駓 n")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(5)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B筩h V﹏ t竛")
        		AddRecipe(240)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Kim t竛")
        		AddRecipe(246)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B礽 V﹏ n")
        		SetTask(1926,40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(10)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi Ho祅 n")
        		AddRecipe(15)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng鋍 Linh t竛")
        		AddRecipe(236)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Chi猽 H錸 n")
        		AddRecipe(241)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B? Thi猲 t竛")
        		SetTask(1926,50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(6)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Hng C萴 T鬰")
        		AddRecipe(11)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nh蕋 Nguy猲 Ph鬰 Th駓 n")
        		AddRecipe(237)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? D辌h n")
        		AddRecipe(247)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C祅 Nguy猲 Ch輓h Kh? n")
        		SetTask(1926,60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(16)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng? Hoa Ng鋍 L? Ho祅")
        		AddRecipe(7)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H綾 Ng鋍 筺 T鬰 cao")
        		AddRecipe(12)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: V筺 V藅 Quy Nguy猲 n")
        		AddRecipe(242)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th蕋 Tr飊g Th蕋 Hoa t竛")
        		SetTask(1926,70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
	      		AddRecipe(17)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Sinh Sinh H鉧 T竛")
        		AddRecipe(238)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B玭 Tinh Nguy謙 Кn")
        		AddRecipe(243)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi Nh藅 Dng T竛")
        		AddRecipe(248)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Vng B? T﹎ n")
        		SetTask(1926,80)
       		elseif GetTask(1926)==80 and HaveLearnRecipe(238)==0 then
         		AddRecipe(238)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B玭 Tinh Nguy謙 Кn")
        		AddRecipe(243)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi Nh藅 Dng T竛")
        		AddRecipe(248)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Vng B? T﹎ n")
    		else
        		Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!",0)
      		end
    	end	
	end
	
	if (nType == 6) then 
		local nLevel = GetLifeSkillLevel(1, 7);
		if (nLevel >= 1) then 
			if GetTask(1926)>=20 and HaveLearnRecipe(215)==0 then
				AddRecipe(215)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: M╪g x祇")
			elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(18)
	    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C琺 n緈")
	    		AddRecipe(25)
	    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猽 o t?")
	    		SetTask(1926, 10)
    		elseif nLevel>=10 and GetTask(1926)==10 then
        		AddRecipe(19)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: M祅 th莡")
        		AddRecipe(26)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: N? Nhi h錸g")
        		AddRecipe(215)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: M╪g x祇")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(22)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Qu? u")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(20)
        		Msg2Player("B筺 h鋍 頲 phng ph竝 l祄 B竛h x誴")
        		AddRecipe(27)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чo Hoa hng")
        		SetTask(1926, 40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(23)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: u x祇")
        		SetTask(1926, 50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(21)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B竛h bao th辴")
        		AddRecipe(28)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T髖 M閚g t鰑")
        		SetTask(1926, 60)
        	elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(24)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C秈 x祇 t醝")
        		SetTask(1926, 70)
        	elseif nLevel>=70 and GetTask(1926)==70 then
    	  		AddRecipe(218)
        		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C琺 chi猲 tr鴑g")
        		SetTask(1926, 80)
        	else 
        		Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!", 0)
    		end
    	end
	end
end;
	
--空函数
function nothing()

end

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- 处理人物名称颜色
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- 处理重点标识颜色
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- 处理性别标识
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- 子函数，用于扩展对话 TALK 函数的功能
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end	


-- 子函数，用以获取玩家的称谓，直接返回字符串
function GetPlayerSex()

local myTitel -- 用以显示人物称谓
local nFactionID = GetPlayerFaction();

	if (GetSex() == 1) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][1];
		else
			myTitel = "Thi誹 hi謕";
		end;
	end;
	
	if (GetSex() == 2) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][2];
		else
			myTitel = "C? nng"
		end;
	end;
	
	return myTitel
	
end
