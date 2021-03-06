
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask_head.lua")
Include("\\script\\task\\world\\task_award.lua")

-- 教育任务必存在的七个选项
strTeachSelect = {

		"Thao t竎 c? b秐/Teach_Basic",
		"T╪g c蕄 nh﹏ v藅/Teach_Level",
		"Ph﹏ ph鑙 甶觤 ti襪 n╪g/Teach_Point",
		"Ki誱 ti襫/Teach_Earn",
		"Gia nh藀 m玭 ph竔/Teach_Faction",
		"Hi謓 c? th? l祄 /Teach_Something",
		"Ta  hi觰 r錳/Teach_002"
		

}

-- 第一次进入游戏世界时的对话
function Teach_001()
	if GetAntiEnthrallmentStatus() == 2 then
		return
	end
	local strMain = {
	
		"Hoan ngh猲h n v韎 th? gi韎 <color=yellow>V? L﹎ 2<color>! Ta chuy猲 hng d蒼 t﹏ th?! Tr玭g b筺 tr? th藅 l? ng y猽!",
		"g th藅 l? t鑤 qu?!/Teach_001_Okay",
		"C竔 g? ta c騨g hi觰 h誸 r錳!/Teach_003"
		
	}
	Say(strMain[1],2,strMain[2],strMain[3]);
	return

end


function Teach_001_Okay()

	local strMain = {
	
		"T鑤 qu?! T﹏ th? nh? ta c遪 nhi襲 th? ph秈 h鋍 h醝.",
	
	}
	Say(strMain[1],7,strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- 玩家选了完全听明白和选择希望“学有所成”之后
function Teach_002()
	
	if (TE_GetTeachState()==1) then -- 如果玩家是第一次进入游戏来听讲解
		Teach_003()
	else -- 如果是以后回来再听讲解
		Say("Xem ngi t? ch蕋 c騨g kh玭g t?, sau n祔 c? g? kh玭g r? c? n t譵 ta. Ta c? th? gi髉 ngi  th玭g kinh m筩h <color=red>T葃 甶觤 ti襪 n╪g<color>.", 0);
	end
	 
	return
	
end


-- 玩家选择了没空听你啰唆之后
function Teach_003()
	Say("Sau n祔 m鏸 khi t╪g  c蕄 nh? quay l筰 g苝 ta nh薾 <color=yellow>Nhi謒 v?<color>, h鋍 m閠 v礽 kinh nghi謒 giang h?, cho n l骳 t c蕄 10 gia nh藀 m玭 ph竔. Th? n祇 h??",2,"T鑤 qu?!  t? ti襫 b鑙!/Teach_005","Ta kh玭g h鴑g th?!/Teach_004");
end


-- 让玩家觉得后悔的时候，可以重新选择
function Teach_004()

--	LearnSkill("轻功")
--	LearnSkill("打坐")
--	TE_SetTeachState(25) -- 设置任务变量为 25，直接完成教育任务
--	SetTask(805,1);
--	Msg2Player("你学会了轻功！");
--	Msg2Player("你学会了打坐！");
--	Msg2Player("你得到了一个储物箱！");
	Say("Trc khi gia nh藀 m玭 ph竔 甶襲 g? kh玭g hi觰 c? n t譵 ta, c閚g sai <color=red>甶觤 ti襪 n╪g<color> c? th? t葃 l筰, l穙 lu玭 s絥 s祅g h? tr?.",0);
	TE_SetTeachState(25) -- 设置任务变量为 25，直接完成教育任务
	SetTask(807,0);	--关闭新手任务
end

function acc_task()
	i=GetTask(807)
	if i==1 then
		Say("Kh玭g ph秈 ngi 產ng l祄 nhi謒 v? sao?",0);
	else
		TE_SetTeachState(1)  --新手任务变量
		SetTask(807,1);		--开放新手任务	
		TE_SetTeachPro(2)	--对话完成
		Talk(1,"TE_SetTeachAdd","Kh? 秈 v? bi猲, quay u l? b?, cu鑙 c飊g ngi  hi觰 ra ? t鑤 c馻 ta. Ch? c莕 h琻 c蕄 2 c? th? n t譵 ta nh薾 8 nhi謒 v?, nhanh ch﹏ l猲!");
                if GetAntiEnthrallmentStatus() == 1 then
                    ModifyExp(5)
                elseif GetAntiEnthrallmentStatus() == 2 then

                else
                    ModifyExp(10)
                end
	end
end;


function Teach_005()
 	-- TEACH_SEASONNPC_ID 应为 2
 	
	Talk(3,"TE_SetTeachAdd","Ngi b秐 l躰h h琻 ngi! Di c蕄 10 m鏸 khi <color=yellow>t╪g c蕄<color> nh? n t譵 ta nh薾 nhi謒 v?.","Ngo礽 ra, ta c遪 gi髉 ngi <color=red>T葃 甶觤 ti襪 n╪g<color>, gi? ngi c? th? an t﹎ c閚g 甶觤.","Nh蕁 <color=yellow><F3><color> m? trang b? nh﹏ v藅, d飊g <color=yellow>觤 kinh nghi謒<color>  t╪g c蕄.");
	if GetAntiEnthrallmentStatus() == 1 then
            Earn(10)
	    ModifyExp(5)
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
            Earn(20)
            GivePlayerExp(SKeyXinShou,"yeshou1")
        end

	SetTask(807,1);	--开放新手任务
	Msg2Player("T﹏ th? th玭 m鏸 khi t╪g c蕄 nh? t譵 D? T萿 nh薾 nhi謒 v? T﹏ th?!");
	TE_SetTeachPro(2)
end


-- 玩家等级到了第二级的时候前来对话
function Teach_Level02()
local strMain =  "Ngi l莕 lt i tho筰 v韎 <color=yellow>Ch? ti謒 v? kh?<color>, <color=yellow>Ch? ti謒 ph鬰 trang<color>, <color=yellow>Ch? ti謒 t筽 h鉧<color> v? <color=yellow>Ch? dc 甶誱<color> trong th祅h. N誹 g苝 v蕁  g? c? th? nh蕁 <color=yellow><F11><color> t譵 hi觰 th猰 nhi謒 v?."
	Say(strMain,1,"Bi誸 r錳!/TE_SetTeachAdd"); -- TEACH_SEASONNPC_ID 应为 3
	Msg2Player("Nh薾 nhi謒 v? 甶 t譵 ch? ti謒 v? kh?!");
	TE_SetTeachPro(1)

end


-- 玩家在等级二时与武器店老板的对话
function Teach_Level02_01()

	local strMain = {
	
		"Ngi ch輓h l? ngi m? D? T萿 nh綾 n ?? L莕 sau 甶 阯g nh? nh蕁 <color=yellow><R><color>  甶 cho nhanh. ? y c? m閠 s? binh kh? kh玭g bi誸 ngi c? th輈h kh玭g?",
		"Thanh ki誱 n祔 tuy謙 qu?!",
		"Nh蕁 <color=yellow><F4><color> m? t骾 h祅h trang, <color=yellow><F3><color> m? trang b? nh﹏ v藅, d飊g chu閠 tr竔 t v藅 ph萴 v祇 ? tng 鴑g  s? d鬾g.",
	}
	
	TE_Talk(getn(strMain),"Teach_Level02_01_01",strMain);
end


function Teach_Level02_01_01()
	Say("C? mu鑞 ta gi韎 thi謚 n c竎 ti謒 kh竎 trong th玭 n祔 kh玭g?",2,"C秏 phi襫 ti襫 b鑙!/acc_wuqi","Kh玭g c莕 u!/rej_wuqi");
end

function acc_wuqi()
local strMain = {
	"N琲 y c? <color=yellow>Ti謒 v? kh?<color>, <color=yellow>Ti謒 trang ph鬰<color>, <color=yellow>T筽 h鉧<color>, <color=yellow>Dc 甶誱<color>, T鰑 l莡, Kim ho祅, ti襫 trang. <color=yellow>Ti謒 v? kh?<color>, <color=yellow>ti謒 trang ph鬰<color> b竛 trang b? c? b秐 di c蕄 4. <color=yellow>Dc 甶誱<color> b竛 dc li謚 di c蕄 2. <color=yellow>T筽 h鉧<color> b竛 c竎 lo筰 b颽 ch?, v藅 d鬾g, ngo礽 ra c遪 tu s鯽 v? gi竚 nh v藅 ph萴. <color=yellow>Ti襫 trang<color> c? th? i ng﹏ phi誹. Xem tr猲 b秐  nh? s? th蕐 d? d祅g.",
	"C騨g gi鑞g nh? ti襫 b鑙 y ??",
	"Trong tr? ch琲 c遪 m閠 s? nh﹏ v藅 cung c蕄 c竎 ch鴆 n╪g c bi謙 nh?: D? T萿, Gi竚 мnh s?, S? gi? m玭 ph竔, S? gi? Bang ph竔, ngi u gi?, ngi v蕁 p?",
	}
	TE_Talk(getn(strMain),"acc_wuqi_01",strMain);
end;


function acc_wuqi_01()
local strMain = {
	"Nh鱪g ngi n祔 l祄 g??",
	"<color=yellow>D? T萿<color> hng d蒼 cho T﹏ th?, <color=yellow>S? gi? m玭 ph竔<color> gi髉 ngi ch琲 d? d祅g gia nh藀 m玭 c竎 m玭 ph竔, <color=yellow>S? gi? Bang ph竔<color> gi髉 ngi ch琲 ki課 l藀, gia nh藀, r阨 kh醝 bang ph竔, <color=yellow>Ngi u gi?<color> thu m閠 s? ph? nh蕋 nh gi髉 ngi ch琲 b竛 v藅 ph萴, <color=yellow>ngi v蕁 p<color> thu th藀 tin t鴆 ngi ch琲 tr猲 m筺g, gi髉 gi秈 p m鋓 th綾 m綾.",
	"Ta hi觰 r錳!"
	}
	TE_Talk(getn(strMain),"rej_wuqi",strMain);
end;





function rej_wuqi()
	local strMain = {
		"Ta kh玭g c遪 g?  n鉯, ngi mau t譵 ch? ti謒 trang ph鬰 甶!",
	}
	TE_Talk(getn(strMain),"Teach_Level02_02",strMain);
end

-- 玩家与武器店老板对话结束后改变任务变量并且得到武器
function Teach_Level02_02()
        if GetAntiEnthrallmentStatus() == 1 then
            AddItem(0,2,14,1)
	    Msg2Player("B筺 nh薾 頲 1 c﹜ Hi謕 Thi誹 ki誱!");
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
	    
        end

        Msg2Player("дn g苝 ch? ti謒 trang ph鬰!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 4
end


-- 玩家与武器店老板对话结束后与服装店老板的对话
function Teach_Level02_03()
	local strMain = {
		"Ti謒 ta b竛 trang ph鬰 t鑤 nh蕋 v飊g n祔 c? th? gi髉 ngi t╪g ph遪g th? n閕 ngo筰 l蒼 s竧 thng. L鵤 ch鋘 v礽 m鉵 cho m譶h 甶!",
		"T鑤 qu?, t苙g cho ta ??",
		"D筼 n祔 l祄 ╪ kh蕀 kh?, ngi c? th? ch鋘 m閠 trong ba c竔, c遪 l筰  ta b竛 cho ngi kh竎.",
		"Nh鱪g th? n祔 c? g? kh竎 bi謙 kh玭g?"		
	}
	
	TE_Talk(getn(strMain), "Teach_Level02_04", strMain);

end


-- 玩家与武器店老板对话结束后与服装店老板的对话
function Teach_Level02_04()

	Say("S鴆 ph遪g th? c馻 n鉵 v? gi祔 th蕄 h琻 trang ph鬰. Ngi mu鑞 ch鋘 lo筰 n祇?",3,"Ta c莕 n鉵/Teach_Level02_04_Hat","Ta c莕 trang ph鬰/Teach_Level02_04_Clothing","Ta c莕 gi祔/Teach_Level02_04_Shoes")

end

-- 玩家选择了帽子
function Teach_Level02_04_Hat()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,103,1,1)
	elseif i==2 then
		AddItem(0,103,19,1)
	elseif i==3 then
		AddItem(0,103,37,1)
	else
		AddItem(0,103,55,1)
	end
    end
		TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
		Teach_Level02_05()
end

-- 玩家选择了衣服
function Teach_Level02_04_Clothing()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,100,1,1)
	elseif i==2 then
		AddItem(0,100,19,1)
	elseif i==3 then
		AddItem(0,100,37,1)
	else
		AddItem(0,100,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
	Teach_Level02_05()
end

-- 玩家选择了鞋子
function Teach_Level02_04_Shoes()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,101,1,1)
	elseif i==2 then
		AddItem(0,101,19,1)
	elseif i==3 then
		AddItem(0,101,37,1)
	else
		AddItem(0,101,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
	Teach_Level02_05()
end


-- 玩家领了东西之后继续与服装店老板对话
function Teach_Level02_05()
	
	local strMain = {
		"Nh蕁 <color=yellow><F4><color> m? giao di謓 h祅h trang, <color=yellow><F3><color> m? trang b? nh﹏ v藅, d飊g chu閠 tr竔 a trang ph鬰 (n鉵, gi祔) v祇 thanh trang b?  ti謓 s? d鬾g.",

	}
	TE_Talk(getn(strMain), "Teach_Level02_05_01", strMain);
end

function Teach_Level02_05_01()
	Say("V藅 ph萴 trong game phong ph?, ngi mu鑞 t譵 hi觰 ch髇g kh玭g?",2,"C秏 phi襫 ti襫 b鑙!/acc_fuzhuang","Gh? ch琲 th玦!/rej_fuzhuang");
end

function acc_fuzhuang()
local strMain = {
		"V藅 ph萴 chia l祄 4 lo筰 g錷: <color=yellow>trang b?<color>, <color=yellow>v藅 ph萴 ti猽 hao<color>, <color=yellow>v藅 ph萴 thu th藀<color> v? <color=yellow>v藅 ph萴 nhi謒 v?<color>.",
		"<color=yellow>Trang b?<color> g錷 v? kh?, n鉵, trang ph鬰, gi祔, trang s鴆, trong  v? kh?, n鉵, trang ph鬰, gi祔 ch? y誹 t╪g s鴆 nh, trang s鴆 ch? y誹 t╪g m閠 s? thu閏 t輓h c bi謙. Trang b? s? c蕄 c? th? mua t筰 ti謒, c遪 trang b? cao c蕄 ph秈 th玭g qua thu藅 c luy謓 trong k? n╪g s鑞g m韎 c?. Ph莕 l韓 trang b? u ph﹏ bi謙 gi韎 t輓h, ng c蕄, th? h譶h v? v? c玭g l璾 ph竔, ngo礽 ra th? ci v? m藅 t辌h c騨g c? th? trang b?.",
		"<color=yellow>v藅 ph萴 ti猽 hao<color> ch? y誹 g錷 dc li謚, th鵦 ph萴, v? m閠 s? nguy猲 li謚 cho k? n╪g s鑞g, ch髇g c? th? x誴 ch錸g trong thanh v藅 ph萴. Dc li謚 c蕄 th蕄 c? th? mua t筰 ti謒; nguy猲 li謚 cho k? n╪g s鑞g th玭g qua nh qu竔 c? 頲 ho芻 l祄 nhi謒 v?; th鵦 ph萴 v? dc li謚 cao c蕄 ph秈 th玭g qua b祇 ch?. M閠 nguy猲 li謚 c? th? n﹏g cao ng c蕄 nh璶g c莕 ph秈 ch鋘 l鵤 k?.",
		}		
	TE_Talk(getn(strMain), "acc_fuzhuang_01", strMain);		
end;


function acc_fuzhuang_01()
local strMain = {
		"<color=yellow>v藅 ph萴 thu th藀<color> ch? nh鱪g v藅 ph萴 c bi謙 nh qu竔 r琲 ra. Ngi ch琲 cho c竎 ti謒, Thng Nh﹏ th莕 b? ho芻 d飊g l祄 nhi謒 v?.",
		"<color=yellow>v藅 ph萴 nhi謒 v?<color> ch? y誹 ch? nh鱪g v藅 ph萴 gi髉 ngi ch琲 l祄 nhi謒 v?, b猲 c筺h  c騨g c? m閠 s? v藅 ph萴 c bi謙, kh玭g th? v鴗 b? ho芻 giao d辌h.",
		"V藅 ph萴 sau khi v鴗 ra b猲 ngo礽, ngi ch琲 xung quanh c? th? nh苩 l蕐. Ngo礽 ra khi r韙 ch髇g t錸 t筰 trong th阨 gian nh蕋 nh, qu? th阨 gian t? ng bi課 m蕋.",
		"Ch? ? v藅 ph萴 c? tr鋘g lng nh蕋 nh, n誹 vt qu? 50% s? 秐h hng n t鑓  h錳 ph鬰 m竨, qu? 95% kh玭g th? chi課 u.",
		}		
	TE_Talk(getn(strMain), "rej_fuzhuang", strMain);		
end;


function rej_fuzhuang()
	local strMain = {
		"Ta  hng d蒼 xong, ngi c? th? qua ch? ti謒 t筽 h鉧 th豱h gi竜.",
	}
	TE_Talk(getn(strMain),"",strMain);
	Msg2Player("дn g苝 Ch? T筽 h鉧!");
end;



-- 玩家与杂货店老板的对话
function Teach_Level02_06()
	local strMain = {
		"Kh竎h quan c莕 g?? Ch? ta c? y  c竎 m苩 h祅g, g錷 <color=yellow>v藅 ph萴 h? tr?<color>, <color=yellow>b颽 ch?<color> v? <color=yellow>v藅 d鬾g h籲g ng祔<color>.",
		"<color=yellow>v藅 ph萴 h? tr?<color> ch? nh鱪g v藅 ph萴 d飊g cho c竎 chi猽 th鴆 v? c玭g c bi謙 nh? M芻 T? ki誱 ph竝, Th竔 Huy襫 th莕 c玭g; <color=yellow>b颽 ch?<color> c? gi竚 nh ph? v? h錳 th祅h ph?; <color=yellow>v藅 d鬾g h籲g ng祔<color> ch? v藅 ph萴 nh? l? luy謓 n, k衞...",
		"Ngo礽 nh鱪g v藅 ph萴 tr猲 c遪 g? n鱝 kh玭g?",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_01", strMain);
end


function Teach_Level02_06_01()
	Say("Ngi  h醝 nh? v藋 th? ta c騨g gi韎 thi謚 lu玭 v? {Trang b? b竧 qu竔}.",2,"Ta th輈h quan t﹎ chuy謓 n祔!/acc_zahuo","C竔 g? ta c騨g bi誸 h誸 r錳!/rej_zahuo");
end;

function acc_zahuo()
	local strMain = {
		"Sau n祔 s? b総 th蕐 <color=yellow>trang b? c? 3 thu閏 t輓h 萵<color> v? <color=yellow>H祇 th筩h<color> t輈h t? linh kh? tr阨 t. Trang b? thu閏 t輓h 萵 g錷 v? kh?, n鉵, trang ph鬰 v? gi祔. H祇 th筩h c? ﹎ dng 2 lo筰. m 3 vi猲 h祇 th筩h theo th? t? ﹎ dng t譵 th? r蘮 <color=red>kh秏 n筸<color> l猲 trang b? 萵 l? c? th? h頿 th祅h m閠 m閠 m鉵 trang b? mang <color=yellow>thu閏 t輓h B竧 qu竔<color>. M閠 s? H祇 th筩h mang thu閏 t輓h ph? gi髉 t╪g cng th猰 cho trang b? sau khi 頲 kh秏 n筸.",	
		"Khi ngi ch琲 c? t? 2 trang b? b竧 qu竔 tr? l猲 ch髇g s? t? k輈h ho箃 l蒼 nhau t?  s秐 sinh ra thu閏 t輓h ph?. V? d? Can ki誱 v? Kh玭 m穙 k輈h ho箃 xong s? hi謓 ra m閠 thu閏 t輓h m韎 tr猲 m鏸 trang b?. N誹 4 trang b? u l? trang b? b竧 qu竔 th? c? th? k輈h ho箃 12 thu閏 t輓h ph?.",
		"Hay qu?! Ngo礽 nh qu竔 ra c遪 c竎h n祇 nh薾 頲 trang b? b竧 qu竔 n鱝 kh玭g?",
		"Ngi c騨g c? th? h鋍 c竎h c luy謓 trang b? qua <color=yellow>k? n╪g s鑞g<color>, thu th藀 nguy猲 li謚 trong l骳 ch? t筼 trang b? th猰 h祇 th筩h ﹎ dng v祇 n誹 th祅h c玭g s? nh薾 頲 trang b? b竧 qu竔. уng th阨 ch髇g c遪 s秐 sinh <color=yellow>thu閏 t輓h ng? h祅h<color>. Nh璶g t? l? th祅h c玭g r蕋 th蕄, 輙 ngi l祄 頲 trang b? n祔.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_02", strMain);
end;


function Teach_Level02_06_02()
	local strMain = {
		"Thu閏 t輓h ng? h祅h c? t竎 d鬾g g??",
		"<color=yellow>Thu閏 t輓h ng? h祅h<color> ch? v? kh? v? trang ph鬰: V? kh? ch? l鵦 nh c馻 ngi ch琲, trang ph鬰 ch? ph遪g th? c馻 ngi ch琲, v? kh? kh玭g mang thu閏 t輓h ng? h祅h, trang ph鬰 頲 xem kh玭g thu閏 t輓h. Thu閏 t輓h ng? h祅h h琻 kh玭g thu閏 t輓h l? 25% cho s鴆 c玭g th?; Ng? h祅h d鵤 theo Kim kh綾 M閏, M閏 kh綾 Th?, Th? kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim th? t? t輓h th猰 50% cho c玭g th?; ngo礽 ra c玭g th? n誹 ng thu閏 t輓h th? s鴆 nh gi秏 25%.",
		"Hay qu?, ta nh蕋 nh h鋍 k? n╪g ch? t筼 trang b?.",
	}
	TE_Talk(getn(strMain), "rej_zahuo", strMain);
end;


function rej_zahuo()
	local strMain = {
		"Ch? ta ch? c? 2 t蕀 <color=yellow>Gi竚 nh ph?<color> th玦. V藅 ph萴 nh qu竔 r琲 ra u ch璦 qua gi竚 nh. Nh蕁 <color=yellow><F4><color> m? t骾 h祅h trang, d飊g chu閠 ph秈 nh蕁 v祇 gi竚 nh ph? sau  a v祇 trang b? l? c? th? bi誸 頲 thu閏 t輓h c馻 ch髇g.",
		"Th莕 k? v藋 sao?  t?  ch? gi竜!"
	}
	TE_Talk(getn(strMain), "Teach_Level02_07", strMain);
end;




-- 玩家与杂货店老板对话结束后得到物品并改变任务变量
function Teach_Level02_07()
    if GetAntiEnthrallmentStatus() == 0 then
	AddItem(2,5,1,2)
	Msg2Player("B筺 nh薾 頲 2 t蕀 Gi竚 nh ph?!")
    elseif GetAntiEnthrallmentStatus() == 1 then

    else
	AddItem(2,5,1,1)
	Msg2Player("B筺 nh薾 頲 1 t蕀 Gi竚 nh ph?!")
    end
    Msg2Player("дn g苝 Ch? Dc 甶誱 !");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 6
end


-- 玩家与药店老板的对话
function Teach_Level02_08()
	Say("Ngi m韎 bc ch﹏ ra giang h? c騨g n猲 h鋍 h醝 m閠 ch髏 ki課 th鴆 v? y dc.",2,"C秏 phi襫 ti襫 b鑙!/acc_yaodian","Gh? ch琲 th玦!/rej_yaodian");
end


function acc_yaodian()
local strMain = {
	"Dc li謚 g錷 <color=yellow>ph鬰 h錳 sinh l鵦<color>, <color=yellow>ph鬰 h錳 n閕 l鵦<color>, <color=yellow>tr? li謚 ngo筰 thng<color>, <color=yellow>tr? li謚 n閕 thng<color> v? <color=yellow>tr? li謚 b╪g, c<color>; dc li謚 h錳 ph鬰 sinh l鵦 c? th? mua t筰 dc 甶誱, dc li謚 h錳 ph鬰 n閕 l鵦 r蕋 輙 gi? l筰 cao, c遪 m閠 s? dc li謚 tr? c竎 tri謚 ch鴑g b╪g, c...th? c祅g kh? t譵.",
	"Dc li謚 c? b秐 c? th? mua t筰 l穙 phu, nh鱪g dc li謚 cao c蕄 ph秈 th玭g qua b祇 ch? c馻 th莕 y. N誹 ngi c? h鴑g th?, t c蕄 10 c? th? t譵 <color=yellow>Du Phng i phu<color> h鋍 thu藅 b祇 ch? thu鑓.",
			}
	TE_Talk(getn(strMain), "rej_yaodian", strMain);
end;


function rej_yaodian()
	local strMain = {
		" l筰 trong giang h? nh? c萵 th薾, n誹 c? b? thng l藀 t鴆 quay l筰 t譵 ta. Ta c? 2 b譶h <color=yellow>Kim S竛g t竛<color>, h穣 mang theo c? l骳 h鱱 d鬾g.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_09", strMain);
end;


-- 玩家与药店老板对话结束后得到物品并改变任务变量
function Teach_Level02_09()
    if GetAntiEnthrallmentStatus() == 0 then
        Earn(100)
	ModifyExp(30)
	AddItem(1,0,2,2)
	Msg2Player("B筺 nh薾 頲 2 b譶h dc li謚!");
    elseif GetAntiEnthrallmentStatus() == 1 then
        Earn(50)
	ModifyExp(15)
	AddItem(1,0,2,1)
	Msg2Player("B筺 nh薾 頲 1 b譶h dc li謚!");
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

    	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 7
    	Msg2Player("Ho祅 th祅h nhi謒 v? th╩ h醝, n c蕄 3 甶 t譵 D? T萿!");
	TE_SetTeachPro(2)
end


-- 玩家等级升到第三级的时候来与野叟对话
function Teach_Level03()
	Say("Tr玭g ngi v蕋 v?! Nh蕁 ph輒 <color=yellow><R><color>  甶 cho nhanh. C? b? l筩 阯g kh玭g?",2,"Ta l筩 阯g r錳!/acc_milu","Kh玭g sao!/rej_milu")
end


function acc_milu()
	local strMain = {
		"<color=yellow>B秐  nh?<color> ? g鉩 ph秈 tr猲 m祅 h譶h. <color=yellow>D蕌 ch蕀 v祅g<color> x竎 nh v? tr? ngi 產ng ng. Nh藀 v? tr? v祇 2 <color=yellow>T鋋 <color> X, Y  x竎 nh n琲 c莕 n.",
		"C? th? nh蕁 ph輒 <+> tr猲 b祅 ph輒 ho芻 d飊g chu閠  ph鉵g to, thu nh? b秐 <color>",
	}
	TE_Talk(getn(strMain), "rej_milu", strMain);
end;


function rej_milu()
	local strMain = {
		"Sau n祔 c? g? kh玭g r? c? th? n g苝 ta ho芻 nh蕁 <color=yellow><F11><color>  xem hng d蒼.",
		"Hi觰 r錳, 產 t?  ch? gi竜!",
		"V韎 c玭g l鵦 c馻 ngi hi謓 gi? ra ngo礽 r蕋 nguy hi觤! N猲 n <color=yellow>V? s?<color> h鋍 v礽 chi猽 ph遪g th﹏. Trc khi n  nh? t譵 m閠 mi課g <color=yellow>Th辴 th?<color> cho 玭g ta.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain);  -- TEACH_SEASONNPC_ID 应为 8
	Msg2Player("Nh薾 nhi謒 v? 甶 t譵 m閠 mi課g th辴 th? cho v? s?.");
	TE_SetTeachPro(1)
end;




-- 玩家与武师的对话
function Teach_Level03_01()
	local strMain = {
		"D? t萿 b秓 ta n t譵 玭g h鋍 m閠 v礽 m鉵 v?.",
		"Л頲 th玦, trc ti猲 ta s? d箉 ngi <color=yellow>ng錳 thi襫<color=>.",
		"Ng錳 thi襫厖 l祄 g?? Ta ch? mu鑞 h鋍 v?.",
		"Ngi ng xem thng ng錳 thi襫, n? c? th? gi髉 ngi h錳 ph鬰 sinh l鵦 v? n閕 l鵦.",
		"Ng錳 b籲g c竎h n祇 v藋?",
		"Nh蕁 ph輒 <color=yellow><V><color> ng錳 xu鑞g kh? huy誸 s? t? t? h錳 ph鬰.",
		"Hi觰 r錳!",		
		}
	TE_Talk(getn(strMain), "Teach_Level03_01_01", strMain);
end


function Teach_Level03_01_01()

	Say("в ta ch? ngi m閠 v礽 c竎h  chi課 u.",2,"T鑤 qu?, phi襫 玭g ch? gi竜./acc_killnpc","Th玦  ta t? t譵 hi觰/rej_killnpc")
end

function acc_killnpc()
	local strMain = {
		"Chi課 u v韎 qu竔 gi髉 ngi ch琲 l祄 nhi謒 v魌╪g <color=yellow>甶觤 kinh nghi謒<color>. C? hai c竎h <color=yellow>chi課 u thng<color> v? <color=yellow>PK<color>!",
		"PK l? g??",
		"Chi課 u PK ta s? n鉯 sau, gi? ta mu鑞 nh綾 n chi課 u thng gi鱝 ngi ch琲 v韎 NPC (qu竔), ngi c? th? ra ngo礽 th祅h nh蕄 chu閠 v祇 qu竔 m? ngi mu鑞 nh. N誹 gia nh藀 m玭 ph竔 h鋍 頲 c竎 chi猽 th鴆 th? uy l鵦 nh qu竔 s? t╪g g蕄 b閕.",
	}
	TE_Talk(getn(strMain), "acc_killnpc_01", strMain);
end;


function acc_killnpc_01()
	local strMain = {
		"N誹 h? 頲 qu竔 ngi s? nh薾 頲 甶觤 kinh nghi謒 ho芻 v藅 ph萴; c遪 n誹 b? qu竔 h? s? b? t鎛 th蕋 1% kinh nghi謒 hi謓 t筰, 5% ng﹏ lng v? m閠 s? 甶觤 danh v鋘g.",
		"N誹 nh qu竔 c莕 ch? ? n 甶襲 g??",
		"Khi nh qu竔 c莕  ? n thanh m竨 m祏 xanh tr猲 u, nh蕁 <color=yellow><F8><color>  t総 m?, khi thanh m祏 xanh chuy觧 qua m祏 v祅g cho th蕐 t輓h m謓h ngi g苝 nguy hi觤. Ngo礽 ra ta c莕  ph遪g c竎 qu竔 ? xa ngo礽 th祅h hay trong c竎 m? cung.",
		"g c? th? k? cho ta nghe c竎 NPC (qu竔) m筺h kh玭g?"
	}
	TE_Talk(getn(strMain), "rej_killnpc", strMain);
end;




function rej_killnpc()
	local strMain = {
		"NPC ch? y誹 c竎 ng v藅, m閠 s? cao th? m玭 ph竔...Phng th鴆 chi課 u c馻 ch髇g ph﹏ bi謙 <color=yellow>t蕁 c玭g b? ng<color>, <color=yellow>t蕁 c玭g ch? ng<color>, <color=yellow>t蕁 c玭g nh譶 r?<color>, <color=yellow>bao v﹜<color>, <color=yellow>nh l衝<color>, trong  t蕁 c玭g ch? ng l? l頸 h筰 nh蕋.",
		"T蕁 c玭g b? ng l? ta nh ch髇g m韎 nh tr?, bao v﹜ v? nh l衝 c騨g d? hi觰, v藋 c遪 t蕁 c玭g nh譶 r? l? sao?",
		"M閠 s? cao th? n閕 c玭g trc khi xu蕋 chi猽 u ph秈 qua qu? tr譶h v薾 kh?, b猲 c筺h  c竎 NPC nhanh nh裯 quan s竧 nh tr? i phng trc.",
		"T蕋 c? NPC u c? <color=yellow>thu閏 t輓h ng? h祅h<color>, hi觰 頲 t輓h tng sinh tng kh綾 m? ch鋘 v? kh? th輈h h頿 s? gi髉 ta d? d祅g nh ch髇g.",
	}
	TE_Talk(getn(strMain), "rej_killnpc_01", strMain);
end;


function rej_killnpc_01()
	local strMain = {
		"Trang b? v? v? kh? thu閏 t輓h ng? h祅h quan tr鋘g n v藋 sao!",
		"C騨g kh玭g h糿 l? v藋 nh璶g ph秈  ph遪g NPC <color=yellow>thu閏 t輓h ﹎<color>, ch髇g kh玭g s? v? kh? thng, v? kh? ng? h祅h, v? c玭g th玭g thng r蕋 kh? h? g鬰 ch髇g.",
		"Sao nhi襲 v藋? Ta n猲 tr竛h NPC n祇 y?",
		}
	TE_Talk(getn(strMain), "rej_killnpc_02", strMain);
end;

function rej_killnpc_02()
	local strMain = {

		"Ch? ? t猲 c馻 NPC, n誹 <color=red>m祏 <color> l? nguy hi觤. Ngo礽 ra m閠 s? qu竔 Boss c? <color=blue>m祏 xanh<color> ho芻 <color=yellow>m祏 v祅g<color>.",
		"Xin cho h醝 th猰, ngo礽 nh鱪g t鎛 th蕋 khi b? qu竔 h? g鬰 c? 秐h hng n t輓h m筺g kh玭g?",
		"S? kh玭g c? t? vong, ch? c? b? 秐h hng n <color=yellow>ngo筰 thng<color> ho芻 <color=yellow>n閕 thng<color>, N誹 b? h? g鬰 ngi c? th? ch鋘 v? th祅h ho芻 i Nga My ph藅 gia n c鴘. N誹 c鴘 s鑞g ch? m蕋 ti襫 v? 甶觤 danh v鋘g.",
		"Ch? dc 甶誱 c? n鉯 n誹 b? thng c? th? mua m閠 s? dc li謚 qu? tr?, v藋 ph秈 mua ch髇g ? u?",
		"Ngi n t譵 ng i  h鋍 qua <color=yellow>k? n╪g luy謓 n<color> l蕐 <color=yellow>th竛h dc<color>, n誹 kh玭g ph秈 qua m閠 th阨 gian d礽 m韎 h錳 ph鬰.",
		"Xin 產 t?  ch? gi竜!",
		}
	TE_Talk(getn(strMain), "Teach_Level03_02", strMain);
end;


-- 玩家与武师对话结束后学到技能并改变任务变量
function Teach_Level03_02()

	if (GetItemCount(1,3,1) >= 1) then
		DelItem(1,3,1,1)
	else
		Say("N誹 c? 1 mi課g <color=yellow>Th辴 th?<color> u鑞g v韎 ru y th? tuy謙 qu?!",0);
	end
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(100)
	ModifyExp(50)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(50)
	ModifyExp(25)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

	Msg2Player("Nhi謒 v? ho祅 th祅h t c蕄 4 甶 t譵 D? T萿!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 9
	TE_SetTeachPro(2)
end


-- 玩家到了等级 4 之后来与野叟的对话
function Teach_Level04()

	local strMain = {
		"M蕐 ng祔 qua c? g? vui kh玭g?",
		"Ch? c? g? th? v?! Ngo礽 i tho筰 v? nh qu竔 ra, n誹 c? ai  <color=yellow>t竛 g蓇<color> th? vui bi誸 m蕐!",
		}
	TE_Talk(getn(strMain), "teach_chat", strMain); 
end		
		
function teach_chat()
	Say("Л頲! Ta s? ch? cho ngi c竎h t竛 g蓇.",2,"Hay qu?, xin ngi ch? gi竜!/acc_chat","Gh? ch琲 th玦!/rej_chat")	
end;		
		
function acc_chat()
local strMain = {
		"Nh蕁 ph輒 <color=yellow>Enter<Enter><color> ho芻 ch鋘 c竎 n髏 <color=yellow>t莕 s?<color> g鉩 tr竔 b猲 di m祅 h譶h, trong khung t竛 g蓇 nh藀 tin t鴆 nh蕁 Enter<Enter>  g鰅 甶.",
		"C? nhi襲 t莕 s? t竛 g蓇. <color=yellow>Ph? c薾<color> ngi ch琲 xung quanh nh譶 th蕐; <color=yellow>C玭g c閚g<color> ngi ch琲 to祅 m竬 ch? nh譶 th蕐; <color=yellow>H? th鑞g<color> hi觧 th? tin t鴆; <color=yellow>чi ng?<color> ch? trong i m韎 th蕐; <color=yellow>M玭 ph竔<color> ch? thu閏 c飊g m玭 ph竔 m韎 th蕐; <color=yellow>Bang ph竔<color> ch? ngi trong bang m韎 th蕐.",
		"Sao c? l骳 ch鋘 t莕 s? r錳 v蒼 kh玭g t竛 g蓇 頲?",
		"в m b秓 ch蕋 lng t竛 g蓇, m鏸 t莕 s? u c? h筺 ch?. T莕 s? m玭 ph竔 c莕 ngi ch琲 ph秈 gia nh藀 m玭 ph竔, gi穘 c竎h 1 ph髏. T莕 s? c玭g c閚g i h醝 ngi ch琲 tr猲 c蕄 30, gi穘 c竎h 3 ph髏. T莕 s? b? h筺 ch? s? hi謓 <color=red>m祏 <color>.",
		"Th? ra l? nh? v藋!",
		}
	TE_Talk(getn(strMain), "rej_chat", strMain); 		
end;

function rej_chat()
	Say("Ngo礽 t竛 g萿, ta c遪 gi髉 ngi c竎h <color=yellow>Giao h秓 b筺 b?<color>, c? mu鑞 nghe kh玭g?",2,"Xin ngi ch? gi竜!/acc_friend","C竔 g? ta c騨g hi觰 h誸 r錳!/rej_friend")
end;


function acc_friend()
local strMain = {
		"N誹 mu鑞 h秓 h鱱 v韎 ai ch? c莕 nh蕁 ph輒<color=yellow><Ctrl><color> + chu閠 ph秈 ch? l猲 i phng, ch鋘 <color=yellow>H秓 h鱱<color>, l骳 n祔 h? th鑞g s? c? th玭g b竜 cho i phng. N誹 ng ? t猲 ngi  s? hi謓 trong b秐g H秓 h鱱 c馻 m譶h. Nh蕁 <color=yellow><F6><color> ki觤 tra l筰!",
		"C遪 mu鑞 tr? th祅h tri k? ho芻 phu th? th? ph秈 l祄 sao?",
		"Sau khi tr? th祅h h秓 h鱱 s? c? th猰 <color=yellow>觤 th﹏ thi謓<color>. Ngi ch琲 b譶h thng t? i nh qu竔, t竛 g蓇 c騨g 頲 t輓h 甶觤 th﹏ thi謓. M閠 s? v藅 ph萴 c bi謙 nh? <color=yellow>Hoa h錸g<color> c騨g gi髉 t╪g th﹏ thi謓. N誹 tr猲 1000 甶觤 th﹏ thi謓 c? th? <color=yellow>K誸 Ngh躠 Kim Lan<color>. Tr猲 1500 甶觤, hai ngi kh竎 gi韎 c? th? n C? o t譵 Nguy謙 L穙 k誸 th祅h <color=yellow>Phu th?<color>.",
		"H秓 h鱱, kim lan ho芻 phu th? b譶h thng c飊g t? i luy謓 c玭g s? 頲 t輓h th猰 kinh nghi謒.",
		"Th秓 n祇 g莕 y c? nhi襲 ngi xin 頲 t? i.",
	}
	TE_Talk(getn(strMain), "rej_friend", strMain); 
end;

function rej_friend()
	local strMain = {
		" l筰 trong giang h? ngi c莕 c? th猰 nhi襲 h秓 h鱱. L莕 sau nh? c飊g ng i n y ta s? c? qu? t苙g c竎 ngi.",
		"Nh蕋 nh ta s? quay l筰.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 10
	Msg2Player("Nh薾 nhi謒 v? a ng i n g苝 D? T萿.");
	TE_SetTeachPro(1)
end;



-- 玩家再次带朋友来与野叟对话
-- 传入参数：1 为已经组队  2 为还没有组队  3 为选不知道怎么组对  4 为选还没有组队
function Teach_Level04_01(nState)
	local strMain = {
		"C? m鉵 qu? nh? t苙g c竎 ngi, hy v鋘g hai ngi s? l? h秓 h鱱 t鑤 c馻 nhau.",
		"Mu鑞 g箃 ta ?? <color=yellow>h秓 h鱱<color> c馻 ngi u?",
		"Nh蕁 <color=yellow>t? i<color>, m阨 ngi kh竎 gia nh藀 t? i sau  n t譵 ta.",
		"Nhi襲 ngi n t譵 ta r錳, ngi c遪 kh玭g nhanh ch﹏!"
	}
	
	if (nState==1) then
		Talk(1,"Teach_Level04_02",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	end
	
	return
	
end


-- 当玩家已经带着朋友组队来与野叟对话时，发予奖励并改变任务变量
function Teach_Level04_02()

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nBooks = {30,31,32,33,34,35,36} -- 要发给玩家的书的随机数结合

	if (nMemCount == 0) then -- 如果玩家到这一步未组队，则返回
		return
	else
	    if GetAntiEnthrallmentStatus() == 0 then
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i)
			AddItem(0,15,nBooks[random(getn(nBooks))],1)
			Msg2Player("B筺 nh薾 頲 m閠 quy觧 m藅 t辌h!")
		end
		
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
		Earn(100)
		ModifyExp(80)
            elseif GetAntiEnthrallmentStatus() == 1 then
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
		Earn(50)
		ModifyExp(40)
            elseif GetAntiEnthrallmentStatus() == 2 then
            end


		Msg2Player("Ho祅 th祅h nhi謒 v? h秓 h鱱 n c蕄 5 quay l筰 t譵 D? T萿.");
	end
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 11
	TE_SetTeachPro(2)
	return

end


-- 玩家到了等级 5 时前来与野叟对话
function Teach_Level05()

	local strMain = {	
		"Xem ngi m謙 m醝 nh? v藋 ch綾 l? ch璦 h鋍 qua <color=yellow>khinh c玭g<color>, l莕 trc v? s? ch璦 d箉 ngi ??",
		"Ch? h鋍 t鋋 thi襫, ch璦 h鋍 khinh c玭g.",
		"Ra ngo礽 th祅h nh b筰 m蕐 t猲 <color=yellow>L璾 manh<color> l蕐 <color=yellow>5 b譶h Thi猽 t鰑<color> a cho V? s?, nh蕋 nh s? h鋍 頲 Khinh c玭g."	
	}
	
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 12
	Msg2Player("Nh薾 nhi謒 v? ra ngo礽 th祅h t譵 5 b譶h Thi猽 t鰑 cho v? s?!");
	TE_SetTeachPro(1)
	
end


-- 玩家带了烧酒去找武师时的对话
function Teach_Level05_01()
	if (GetItemCount(2,1,12) >= 5) then
		DelItem(2,1,12,5)
		Say("Ch? c? D? T萿 m韎 hi觰 l穙 phu ta! Xem ra ta ph秈 d箉 ngi m玭 v? h鋍 n祔 r錳! Ti誴 theo ta s? n鉯 ngi nghe v? PK.",2,"Phi襫 玭g ch? gi竜!/acc_fight","Kh玭g c莕 u!/rej_fight");
	else
		Say("M謙 qu?! Ph秈 u鑞g ru th玦! C? 5 b譶h <color=yellow>Thi猽 t鰑<color> m? ngi mang c騨g kh玭g  ??.",0);
		return -- 如果在这里没有烧酒的话仍然返回
	end
end

function acc_fight()
	local strMain = {		
		"<color=red>PK<color> ch? chi課 u gi鱝 ngi ch琲 v韎 nhau, ch輓h l? c鮱 s竧 tr猲 giang h?. Ngi ch琲 b藅 PK trong chi課 u khi ch誸 s? m蕋 nhi襲 kinh nghi謒 v? ng﹏ lng, 甶觤 PK cao khi ch誸 c? th? r琲 trang b? tr猲 ngi; tranh ch蕄 v韎 nhau ngi ch琲 thng d飊g PK  quy誸 nh th緉g thua.",
		"V藋 ngi ch琲 c蕄 th蕄 trong game d? g苝 nguy hi觤 l緈 ??",
		"Ngi c? th? an t﹎, h? th鑞g  h筺 ch? c竎 ki觰 PK, b秓 m an to祅 cho ngi ch琲 kh竎.",
		"Xin n鉯 r? th猰.",
		"Trc ti猲, l? b秓 v? T﹏ th?, ngi ch琲 ch璦 gia nh藀 m玭 ph竔 mang ch? m祏 tr緉g kh玭g th? tham gia PK c騨g kh玭g b? ngi kh竎 PK. Ch? khi gia nh藀 m玭 ph竔 m韎 c? th? ng m? 頲 PK.",
		"N誹 ngi ch琲 kh玭g b藅 PK m? b? ngi kh竎 PK th? sao?"	,	
	}
	TE_Talk(getn(strMain), "acc_fight1", strMain);
end;


function acc_fight1()
	local strMain = {
		"Gia nh藀 giang h? chuy謓  s竧 nhau l? kh玭g th? tr竛h kh醝. Nh鱪g ngi c? t譶h PK s? b? tr鮪g ph箃.",
		"Tr鮪g ph箃 PK nh? th? n祇?",
		"Trong chi課 u ch? ng gi誸 m閠 ngi 甶觤 PK s? t╪g 1;甶觤 PK c祅g cao ngi ch琲 c? kh? n╪g r韙 , m蕋 甶觤 kinh nghi謒, ng﹏ lng c祅g nhi襲.",
		"V藋 PK c? m蕐 lo筰?",		
		"C? 4 lo筰 PK: Luy謓 c玭g, bang ph竔 chi課 u, c鮱 s竧 v? gi誸 th?.",
		"PK luy謓 c玭g kh玭g g﹜ s竧 h筰 n ngi ch琲 kh竎; PK chi課 u bang ph竔 kh玭g 秐h hng nh鱪g ngi trong bang k? c? li猲 minh;  s竧 ngo礽 h秓 h鱱 ra c? th? t蕁 c玭g b蕋 k? ai; gi誸 th? d飊g mu鑞 gi誸 m閠 ai .",
	}
	TE_Talk(getn(strMain), "acc_fight2", strMain);
end;

function acc_fight2()
	local strMain = {
		"Ngi ch琲 b藅 ch鴆 n╪g gi誸 th? c? th? gi誸 b蕋 k? ai ngo礽 ngi ch琲 ch? tr緉g.",
		"Do gi誸 th? mang t輓h ch蕋 c? nh﹏ 秐h hng r蕋 nhi襲 n猲 m鴆 tr鮪g ph箃 n苙g h琻 PK: Gi誸 1 ngi, PK t╪g 2 甶觤.",
		"N誹 th蕐 nh kh玭g th緉g i phng n猲 nhanh ch鉵g chuy觧 sang tr筺g th竔 chi課 u b譶h thng, tho竧 kh醝 b? tr鮪g ph箃.",
		"Khi ch鋘 m閠 trong 3 h譶h th鴆 PK, 3 ph髏 sau m韎 c? th? chuy觧 sang tr筺g th竔 kh竎.",
		"Ngi ch琲 nh l玦 i, v薾 ti猽, cp ti猽 t輓h PK hay gi誸 th??",			
	}
	TE_Talk(getn(strMain), "acc_fight3", strMain);
end;




function acc_fight3()
	local strMain = {
		"L玦 i, cp ti猽 l? h譶h th鴆 chi課 u kh竎 gi鱝 ngi ch琲. C? th? g鋓 l? nhi謒 v? chi課.",
		"Nhi謒 v? chi課, PK v? gi誸 th? kh玭g gi鑞g nhau. H譶h th鴆 nhi謒 v? kh竎 nhau th? quy nh PK c騨g kh竎 nhau.",
		"Ngi b? 甶觤 PK t鑙 產, khi b? i phng h? g鬰 ngo礽 r韙  tr猲 ngi ra c遪 c? h譶h ph箃 n祇 kh竎 n鱝 kh玭g? B籲g c竎h n祇  gi秏 甶觤 PK?",
	}
	TE_Talk(getn(strMain), "acc_fight4", strMain);
end;


function acc_fight4()
	local strMain = {
		"Ngi ch琲 khi 甶觤 PK= 3 t猲 s? i m祏 , kh玭g th? v祇 th祅h; i v韎 nh鱪g ngi PK qu? cao i l骳 quan ph? c騨g ph竔 cao th? 甶 t莔 n?. N誹 t? vong trong giai 畂筺 n祔 b筺 s? b? nh鑤 v祇 i lao.",
		"Ngi ch琲 trong i lao ho芻 ? b猲 ngo礽 u gi秏 頲 PK. Trong lao m鏸 gi? gi秏 頲 1 甶觤 PK, ngo礽 lao 2 gi? online gi秏 頲 1 甶觤 PK. V? h譶h ph箃 c? th? h醝 b? u ? nha m玭.",
	}
	TE_Talk(getn(strMain), "rej_fight", strMain);
end;


function rej_fight()
	local strMain = {
		"B﹜ gi? ta d箉 ngi Khinh c玭g, xem k? nh?!",
	}
	TE_Talk(getn(strMain), "Teach_Level05_02", strMain);
end;



-- 玩家与武师对话结束以后学会了轻功并改变任务变量
function Teach_Level05_02()
	LearnSkill(20);
	Msg2Player("B筺 h鋍 頲 khinh c玭g!");
	Say("Ta  d箉 h誸 cho ngi r錳, c? g緉g r蘮 luy謓 th猰!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(120)
        elseif GetAntiEnthrallmentStatus() == 1 then
	    Earn(50)
	    ModifyExp(60)
        elseif GetAntiEnthrallmentStatus() == 2 then
        end

	Msg2Player("Ho祅 th祅h nhi謒 v? t c蕄 6 t譵 D? T萿!");
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 13
	TE_SetTeachPro(2)
end


-- 玩家等级到了 6 级之后来与野叟对话
function Teach_Level06()
	local strMain = {
		"Nghe n鉯 10 v筺 Li猽 Binh 產ng ti課 v? Nh筺 M玭 Quan! H穣 mau gi髉 t譵 <color=yellow>Ch? thng h閕<color>, ngi ch辵 tr竎h nhi謒 cung c蕄 v藅 t? cho qu﹏ i."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 14
	Msg2Player("Nh薾 nhi謒 v? 甶 t譵 ch? thng h閕!");
	TE_SetTeachPro(1)
	return
end


-- 玩家去和商会老板对话
function Teach_Level06_01()
	local strMain = {
		"R蕋 vui khi c? ngi gi髉 s鴆, qu﹏ i hi謓 thi誹 dc li謚, h穣 甶 t譵 <color=yellow>3 c竧 c竛h<color> v? <color=yellow>3 X? hng<color> v? y!",
		"C竧 c竛h c? th? nh th? x竚 ngo礽 r鮪g, X? hng nh l璾 manh r琲 ra ho芻 mua ? ch? dc 甶誱."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 15
	Msg2Player("Thu th藀 3 c竧 c竛h v? 3 X? hng!");
end


-- 玩家找齐了桔梗和麝香之后再来找商会老板
function Teach_Level06_02()
	if (GetItemCount(1,2,2) >= 3) and (GetItemCount(1,2,4) >= 3) then
			DelItem(1,2,2,3)
			DelItem(1,2,4,3)
		Say("V蕋 v? cho ngi qu?! C? nh qu竔 luy謓 c玭g th? c騨g bu錸, c? mu鑞 nghe nhi謒 v? trong tr? ch琲 kh玭g?",2,"Phi襫 ti襫 b鑙 gi韎 thi謚 m閠 ch髏/acc_shanghui","C竔 g? ta c騨g hi觰 h誸 r錳!/rej_shanghui");	
	else
		Say("V蒼 ch璦 t譵  v藅 li謚 ??",0);
	end
end

function acc_shanghui()
	local strMain = {
		"Hi謓 ngi 產ng l祄 nhi謒 v? t﹏ th?, n誹 ho祅 th祅h c? th? nh薾 頲 ph莕 thng ng th阨 hi觰 頲 m閠 ph莕 h? th鑞g nhi謒 v? trong tr? ch琲.",
		"B蕋 c? l骳 n祇 c騨g c? th? n t譵 ta nh薾 nhi謒 v?, t飝 theo ng c蕄 m? nh薾 nhi謒 v? thu th藀 tng 鴑g, li猲 ti誴 ho祅 th祅h 10 nhi謒 v? s? nh薾 頲 ph莕 thng c bi謙 c馻 thng h閕.",
		"Th? v? nh? v藋 sao?",
		"ng v藋! K? th鵦 tr猲 giang h? c遪 nhi襲 nh﹏ v藅 giang h? v韎 nh鱪g c﹗ chuy謓 truy襫 k? m? ta ch璦 頲 bi誸, ngi th? i tho筰 v韎 h? xem!",
		"Xin h穣 n鉯 nh鱪g nhi謒 v? sau n祔 ta ph秈 l祄.",
		"ьi ngi t c蕄 10, gia nh藀 m玭 ph竔, n l骳  s? nh薾 頲 nhi謒 v? s? m玭, nhi謒 v? bang h閕, nhi謒 v? ho祅g kim, nhi謒 v? chung?",
	}
	TE_Talk(getn(strMain), "rej_shanghui", strMain);
end;

function rej_shanghui()
	local strMain = {
		"T鑤 qu?! Nh璶g khi l祄 nhi謒 v? thng h閕 qu? s鴆 s鴆 l鵦 th? sao?",
		"B玭 ba giang h? kh玭g th? thi誹 rng c蕋 gi? v藅 ph萴, <color=yellow>th? m閏<color> trong th祅h chuy猲 gi髉 l祄 rng, ta  gi髉 ngi a <color=yellow>3 m秐h Tinh thi誸<color>, ch? c莕 t鑞 th猰 m閠 輙 ng﹏ lng l? c? th? s? d鬾g.",
	}
	TE_Talk(getn(strMain), "Teach_Level06_03", strMain);

end;


-- 在这里删除商会老板需要的物品，发予奖励并改变任务变量
function Teach_Level06_03()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(300)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(150)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 16
	Msg2Player("T譵 th? m閏 l祄 rng ch鴄 !");
	return
end


-- 与木匠的对话
function Teach_Level06_04()

	Say("Ngi c莕 ta gi髉 g??",2,"Phi襫 ti襫 b鑙 l祄 gi髉 ta m閠 c竔 rng!/Teach_Level06_05","Nh﹏ ti謓 gh? qua th玦./Teach_Exit");

end


-- 是否已经做过储物箱的检测
function Teach_Level06_05()

	local nHaveBox = GetTask(805)
	
	if (nHaveBox==1) then -- 如果已经有了储物箱
		Say("Ta  gi髉 ngi l祄 rng, qu猲 r錳 sao?",0);
	elseif (GetCash(500)>=1) and  (TE_GetTeachState()==17) then  --做新手任务的人找齐材料
		
			Teach_Level06_06() -- 给玩家一个储物箱
	elseif (GetCash(500)>=1) and (GetItemCount(2,2,1)>=3) and (GetTask(807)==0) then   --不做新手任务的人找齐材料
			open_box()  --给玩家一个储物箱
	elseif  (TE_GetTeachState() < 15) then
		if GetTask(807)==0 then  
			Say("Ngi ch璦 l祄 nhi謒 v? T﹏ th?, th藅 s? mu鑞 l祄 rng ch璦  kh玭g?",2,"Ta 產ng c莕 m閠 c竔 rng/acc_box","в ta suy ngh? l筰/no");
		else
			Say("Ngi hi謓 產ng l祄 nhi謒 v? T﹏ th?, rng ch璦   sau h穣 t輓h!",0);			end
		
	elseif (TE_GetTeachState()==16) then -- 如果刚从商会老板那里过来
		
			-- 说完话后 TEACH_SEASONNPC_ID 应为 17
			Talk(1,"TE_SetTeachAdd","Ch? thng h閕  a ta 3 mi課g s総 nh璶g l祄 rng c莕 ph? 5 lng, i ngi t譵  r錳 quay l筰!");
			Msg2Player("Chu萵 b? 5 lng l祄 rng ch鴄 ");
	elseif  (TE_GetTeachState() == 25 and  GetTask(807)==0  )then
			Say("Ngi ch璦 l祄 nhi謒 v? T﹏ th?, th藅 s? mu鑞 l祄 rng kh玭g?",2,"Ta 產ng c莕 m閠 c竔 rng/acc_box","в ta suy ngh? l筰/no");

	else
		
			Say("N誹 kh玭g c? 3 mi課g s総 v? 5 lng, ta kh玭g th? l祄 rng ch鴄 .",0);
		
	end

end

--没做新手任务强制要求储物箱
function acc_box()
	Talk(1,"","Ngi ra ngo礽 th祅h nh s鉯, t譵  nguy猲 li謚 v? y ta s? gi髉 ngi l祄 m閠 c竔 rng.");
end;

--没做新手任务的人放弃储物箱
function no()
end;

--给不做新手任务的玩家一个储物箱
function open_box()
	SetTask(805,1) -- 这是一个临时变量，存储玩家是否已经有储物箱
	DelItem(2,2,1,3) -- 在这里删了精铁
	Pay(500)
	Say("Rng ch鴄   l祄 xong, ta  ? c? <color=yellow>d辌h tr筸<color>, ngi c? th? n  c蕋 gi? v藅 ph萴.",0);
end;


-- 在这里给做新手任务的玩家一个储物箱
function Teach_Level06_06()
	SetTask(805,1) -- 这是一个临时变量，存储玩家是否已经有储物箱
	Pay(500)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 18
	Say("Rng ch鴄   l祄 xong, ta  ? <color=yellow>d辌h tr筸<color>, ngi c? th? n  c蕋 gi? v藅 ph萴. B﹜ gi? ta mu鑞 gi韎 thi謚 cho ngi v? k? n╪g s鑞g, c? mu鑞 nghe kh玭g?",2,"C秏 phi襫 ti襫 b鑙!/acc_liveskill","Kh玭g c莕 u!/rej_liveskill");
end

function acc_liveskill()
	local strMain = {
		"K? n╪g s鑞g ph﹏ bi謙 c? k? n╪g gia truy襫, c binh kh? d礽, c binh kh? ng緉, c k? m玭 binh kh?, ch? t筼 竜 gi竝, luy謓 n, n蕌 nng v? luy謓 b颽.",
		"K? n╪g gia truy襫 l? b秐 l躰h c馻 ngi ch琲, c? th? kh玭g d飊g nguy猲 li謚 tr鵦 ti誴 m? d飊g th? l鵦 l祄 ra {b竛h ng珆 v? {B╪g}.",
		"K? n╪g c luy謓 binh kh? d礽, c luy謓 binh kh? ng緉, c luy謓 k? m玭 binh kh? c? th? h鋍 t筰 th? r蘮 Th祅h Й.",
		"K? n╪g ch? t筼 H? gi竝 c? th? h鋍 t筰 C萴 Nng Th祅h Й. Sau n祔 c? th? s? d鬾g c竎 lo筰 Ch鴆 c萴 v? da th?  may c竎 lo筰 trang v? b秓 h? gi? tr?!",
	}
	TE_Talk(getn(strMain), "acc_liveskill_01", strMain);
end;

function acc_liveskill_01()
	local strMain = {
		"K? n╪g luy謓 n h鋍 t筰 Du Phng i phu Th祅h Й. Sau khi h鋍 xong c? th? d飊g c竎 lo筰 th秓 dc ch? t筼 ra {Linh n}",			"K? n╪g n蕌 nng h鋍 t筰 ng? tr? Bi謓 Kinh.",
		"K? n╪g luy謓 b颽 h鋍 t筰 Du Phng o s? Bi謓 Kinh. H鋍 xong ta c? th? ch? t筼 H錳 ph?, gi竚 nh ph?.",				
		"S? d鬾g k? n╪g s鑞g t鑞 th? l鵦 nh蕋 nh. Ngo礽 k? n╪g gia truy襫 ra nh鱪g k? n╪g kh竎 mu鑞 t╪g c蕄 ph秈 qua luy謓 t藀, m鏸 ngi ch? c? th? h鋍 3 k? n╪g s鑞g. Mu鑞 x鉧 b? k? n╪g  h鋍 ph秈 th玭g qua phng ph竝 c bi謙.",
		"L璾 ? nh鱪g k? n╪g u c? ng c蕄 h筺 ch?, mu鑞 h鋍 k? n╪g s鑞g cao c蕄 ta ph秈 gia nh藀 bang ph竔 ho芻 ra ngo礽 th祅h t譵 cao nh﹏ ch? gi竜."
	}
	TE_Talk(getn(strMain), "rej_liveskill", strMain);
end;



function rej_liveskill()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(150)
	ModifyExp(150)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(75)
	ModifyExp(75)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	Msg2Player("Nhi謒 v? ho祅 th祅h t c蕄 7 t譵 D? T萿!");
	TE_SetTeachPro(2)
	return
end;


-- 玩家到了第 7 级的时候来与野叟对话
function Teach_Level07()
	Say("Ngi mu鑞 h鋍 c竎h ki誱 ti襫 kh玭g?",2,"Nh? ti襫 b鑙 ch? gi竜!/acc_getmoney","Kh玭g c莕 u!/rej_getmoney");
end



function acc_getmoney()
	local strMain = {
		"C? nhi襲 c竎h  ki誱 ng﹏ lng, nh璶g n gi秐 nh蕋 l? ra ngo礽 th祅h nh qu竔 mang v藅 ph萴 v? b竛 ho芻 l祄 nhi謒 v?.",
		"m v藅 ph萴 nh qu竔 nh苩 頲 v? th祅h, nh蕁 <F4>, m? giao di謓 b祔 b竛, t v藅 ph萴 v祇 shop, ni猰 y誸 gi? c秙au  nh蕁 *уng ?* l? c? th? b祔 b竛.",
	}
	TE_Talk(getn(strMain), "acc_getmoney1", strMain);
end;


function acc_getmoney1()
	local strMain = {
		"B祔 b竛 l? c竎h  ki誱 ti襫 nhanh nh蕋 nh璶g b蕋 ti謓 l? kh玭g l祄 頲 nhi謒 v? kh竎.",
		"Ngi ch琲 c? th? 甧m v藅 ph萴 n cho <color=yellow>Ngi u gi?<color> trong c竎 th祅h  b竛 u gi?. L骳 n祔 v藅 ph萴 c馻 ngi ch琲 s? do ngi u gi? a ra. N誹 nh? giao d辌h th祅h c玭g th? ti襫 t? ng s? chuy觧 v祇 rng ngi ch琲, c遪 n誹 th蕋 b筰 th? h? th鑞g s? tr? l筰 v藅 ph萴. T飝 theo gi? tr? v藅 ph萴 b竛 ra m? t輓h thu?. C竎h b竛 n祔 ch? n猲 竝 d鬾g cho nh鱪g v藅 ph萴 qu?, v藅 ph萴 thng n猲 b祔 b竛.",
		"V藅 ph萴 th玭g thng 甧m <color=yellow>b祔 b竛<color> , v藅 ph萴 qu? th? <color=yellow>u gi?<color> ng kh玭g?",
	}
	TE_Talk(getn(strMain), "rej_getmoney", strMain);
end

function rej_getmoney()
	local strMain = {
		"M蕐 h玬 trc ta c? tr髇g m閠 t蕀 <color=yellow>ng﹏ phi誹<color> nh璶g ch璦 c? th阨 gian 甶 l穘h, ngi gi髉 ta 頲 kh玭g?",
	}
	TE_Talk(getn(strMain), "Teach_Level07_01", strMain);
	Msg2Player("Nh薾 nhi謒 v? t譵 ch? ti襫 trang l穘h ng﹏ phi誹!");
end;

-- 与野叟对话结束后改变任务变量
function Teach_Level07_01()

	TE_SetTeachPro(1)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 19

end


-- 与钱庄老板的对话
function Teach_Level07_02()

	local strMain = {
		"Зy l? <color=yellow>Ng﹏ phi誹<color> c馻 D? T萿, xin nh薾 l蕐!",
		"Sao gi鑞g t蕀 gi蕐 v? b颽 c馻 m蕐 o s? v藋!",
		"Haha! Ngi l莔 to r錳! Зy ch輓h l? <color=red>T蕀 th? gi? ch琲<color>, do <color=yellow>ti襫 trang Bi謓 Kinh<color> ph竧 h祅h. Sau khi n筽 th? ngi ch琲 c? th? ch鋘 i th祅h gi? ch琲 ho芻 ng﹏ phi誹, c莕 thi誸 n ti襫 trang Bi謓 Kinh i th祅h gi? ch琲.",
		" t?  ch? gi竜!",
		"Cho ta g鰅 l阨 th╩ h醝 n D? T萿."
	
	}
	if (TE_GetTeachState()==19) then
		TE_Talk(getn(strMain), "Teach_Level07_03", strMain);
		Msg2Player("Mang ng﹏ phi誹 v? cho D? T萿!");		
	elseif (TE_GetTeachState()==20) and (GetItemCount(2,0,1)==0) then  -- 如果玩家丢失了任务道具后的补偿
                AddItem(2,0,1,1)
		Say("Sao g蕄 v藋? Ng﹏ phi誹 ch璦 l蕐  v閕 甶 r錳?",0);
		Msg2Player("Mang ng﹏ phi誹 v? cho D? T萿!");
		return
	end

end


-- 与钱庄老板对话后得到银票并改变任务变量
function Teach_Level07_03()
    if GetAntiEnthrallmentStatus()~= 2 then
	AddItem(2,0,1,1)
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 20
	
end


-- 回来与野叟对话
function Teach_Level07_04()
	
	-- TEACH_SEASONNPC_ID 应为 21
	TE_SetTeachPro(2)
	Talk(1,"TE_SetTeachAdd","дn c蕄 ti誴 theo nh? quay l筰 t譵 ta!");
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(170)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(85)
        else
        end
	Msg2Player("Nhi謒 v? ho祅 th祅h t c蕄 8 quay l筰 t譵 D? T萿!");

end


-- 玩家到了 8 级后与野叟的对话
function Teach_Level08()
	local strMain = {
		"Ta c? th? gi髉 g? cho ngi?",
		"G莕 y bu玭 b竛 c騨g kh蕀 kh?, nh璶g ti襫 mang theo tr猲 ngi kh玭g ti謓. Ti襫 b鑙 bi誸 ch? n祇 c蕋 gi? ng﹏ lng kh玭g?",
		"M? rng ch鋘 <color=yellow>G鰅 ti襫<color> sau  nh藀 s? ti襫 c莕 g鰅, nh蕁 *уng ?*. Tng t? cho <color=yellow>R髏 ti襫<color>.",
		"Ta  th? nh璶g ph秈 nh藀 n 3 ch? s?, v藋 l? sao?",
		"H譶h th鴆 giao d辌h g錷 <color=yellow>v祅g<color>, <color=yellow>b筩<color> v? <color=yellow>ti襫 ng<color>, 1 lng v祅g = 100 lng b筩, 1 lng b筩 = 100 ti襫 ng. H? th鑞g s? t? ng i s? ti襫 b筺 c? v? s? n gi秐 nh蕋."
	
	}
	TE_Talk(getn(strMain),"Teach_Level08_01",strMain);

end


-- 野叟对话的选择
function Teach_Level08_01()

	Say("C遪 g? ch璦 r? kh玭g?",2,"Hi觰 r錳!/Teach_Level08_02","Ch璦 hi觰!/Teach_Money");

end


-- 听明白了野叟的话后改变任务变量
function Teach_Level08_02()

	local strMain = {	
		"Ch璦 hi觰  ta n鉯 l筰.",
		"C? khi n祇 ti襫 b鑙 g苝 v蕁  nan gi秈 kh玭g?",
		"Nh綾 t韎 m韎 nh?, l莕 trc c? ngi h醝 6 v蕁  li猲 quan n th藀 i <color=yellow>m玭 ph竔<color>, ta 蕄 髇g tr? l阨 kh玭g 頲. Chuy謓 n祔 m? truy襫 ra ngo礽 th? m蕋 m苩 qu?!",
		"Ti襫 b鑙 c莕 ta n th藀 i m玭 ph秈 h醝 th╩ kh玭g?",
		"Ngi 甶 m閠 chuy課 gi髉 ta h醝 r? c竎 th藀 i m玭 ph竔. M鏸 m玭 ph竔 u c? <color=yellow>S? gi? m玭 ph竔<color> ng gi鱝 qu穘g trng, n n鉯 chuy謓 v韎 l? 頲."
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID 应为 22
	Msg2Player("Nh薾 nhi謒 v? 甶 t譵 hi觰 c竎 m玭 ph竔!");
	TE_SetTeachPro(1)
	

end


-- 玩家回来回答野叟的问题
function Teach_Level08_03()

	Say("Ngi hi觰 r? c s綾 c馻 th藀 i m玭 ph竔 ch璦?",2,"Hi觰 r錳!/Teach_Qustion_001","Ch璦 hi觰 l緈!/Teach_Exit");
	return

end


-- 如果玩家全部回答正确了问题则发予奖励并且改变任务变量
function Teach_Level08_04()
	Say("Ngi bi誸 g? v? S?, Hi謕, 萵 tam i l璾 ph竔?",2,"Phi襫 ti襫 b鑙 gi秈 th輈h/acc_route","Ta bi誸 r錳!/rej_route");
end


function acc_route()
	local strMain = {
	
		"S?, Hi謕, 萵 th鵦 t? ch? hng tu luy謓 c馻 nh﹏ v藅. Theo <color=yellow>S?<color> c? th﹏ th? cng tr竛g v? s鴆 m筺h h琻 ngi. Theo <color=yellow>Hi謕<color> s鴆 m筺h v? nhanh nh裯 c﹏ b籲g. Theo <color=yellow>萵<color> kh玭g quan tr鋘g b猲 ngo礽, ch? y誹 r蘮 luy謓 tinh th莕.",
		"Ta n猲 tu luy謓 hng n祇?",
		"Ngi ch璦 gia nh藀 m玭 ph竔, sao ch鋘 頲 hng 甶, n猲 th﹏ tr鋘g khi a ra quy誸 nh.",
		"Ti襫 b鑙 c? th? cho ta bi誸 r? h琻 kh玭g?",
	}
	TE_Talk(getn(strMain),"acc_route1",strMain);

end;


function acc_route1()
	local strMain = {
	        "Th藅 ra theo hng n祇 c騨g c? 璾 甶觤 ri猲g c馻 n?, c莕 ph秈 ch鋘 l鵤 s? ph? sau khi gia nh藀 m玭 ph竔.",	        
		"Nhi襲 m玭 ph竔 v? nhi襲 hng tu luy謓, ta ph秈 l祄 sao?",
	        "Tu h祅h t飝 m鏸 ngi th玦!",
	        " t?  ch? gi竜!",	
	}
	TE_Talk(getn(strMain),"rej_route",strMain);

end;



function rej_route()
	Say("Ngi h穣 t譵 hi觰 k? c竎 m玭 ph竔 v? hng 甶 cho ri猲g m譶h. Ta kh玭g c遪 g? d箉 ngi, t c蕄 9 h穣 quay l筰 y!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(200)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(100)
        else
        end
	TE_SetTeachAdd(); -- TEACH_SEASONNPC_ID 应为 23
	Msg2Player("Nhi謒 v? ho祅 th祅h t c蕄 9 n t譵 D? T萿!");
	TE_SetTeachPro(2)
end


-- 如果玩家到了 9 级的时候再来找野叟
function Teach_Level09()

	local strMain = {
	
		"Ngi c? bi誸 v? sao ta l筰 hng d蒼 t薾 t譶h nh? v藋 kh玭g?",
		"Kh玭g bi誸!",
		"Chuy謓 d礽 d遪g l緈, i ngi luy謓 n <color=yellow>c蕄 10<color> h穣 t輓h",
		"厖Л頲! Ta s? c? g緉g!"
	
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID 应为 24
	Msg2Player("Nh薾 nhi謒 v? t c蕄 10 ch鴑g minh t? ch蕋 c馻 m譶h!");
	
end


-- 如果玩家到了 10 级的时候再来找野叟
function Teach_Level10()

	local strMain = {
	
		"Qu? nhi猲 ta nh譶 kh玭g l莔 ngi.",
		"30 n╩ trc th竔 t? Tri謚 Khu玭g D蒼 畂箃 頲 <color=yellow>b秐  S琻 H? X? T綾<color> t? tay S礽 Vinh, b? m藅 li猲 l筩 c竎 m玭 ph竔 c飊g t譵 b秐  kho b竨 b猲 trong ng th阨 ph竧 ng binh bi課 Tr蕁 ki襲, m璾  so竔 v?. Kh玭g ai bi誸  ch輓h l? t蕀 b秐  c馻 Thi猲, мa, Nh﹏ <color=yellow>Tam Gi韎 ch蕁 ph?<color>, long m筩h c馻 Trung Nguy猲, b竨 v藅 m? S礽 Vinh 甧m t輓h m筺g ra gi祅h l蕐. Vi謈 l祄 c馻 th竔 t? d蒼 n tr阨 t c╩ ph蒼, trong ng祔 i l? t? tr阨, S琻 H? X? T綾 t nhi猲 h鉧 th祅h tro b鬷, bay 甶 kh緋 n琲.",
		"Th竔 t? bi誸 m譶h  l祄 ngh辌h ? tr阨, o l閚 c祅 kh玭 tam gi韎, y猽 ma hi謓 th?, Trung Nguy猲 s緋 l﹎ v祇 i ki誴. в s鯽 sai l莔, m閠 m苩 ch蕁 ch豱h l筰 c竎 c鬰 di謓, m苩 kh竎 b? c竜 thi猲 h?, hy v鋘g t譵 頲 ngi ki誱 l筰 nh鱪g m秐h b秐  S琻 H? X? T綾.",
	}
	TE_Talk(getn(strMain),"Teach_Level10_01",strMain);

end


-- 玩家听野叟说完故事后领到奖励并改变任务变量
function Teach_Level10_01()
	local strMain = {
		"C﹗ chuy謓 tng ch鮪g ch譵 v祇 qu猲 l穘g. чt nhi猲 c? tin Th竔 t? b筼 b謓h qua i, ngi k? v? kh玭g ph秈 th竔 t? Tri謚 c Phng m? l? Ho祅g  Tri謚 Quang Ngh躠. Tin n lan truy襫 ra ngo礽, 10 v筺 Li猽 qu﹏ l藀 t鴆 ti課 s竧 <color=yellow>Nh筺 M玭 Quan<color>. M閠 s? h祇 ki謙 lai l辌h kh玭g r?  chi誱 c? <color=yellow>Lng S琻 B筩<color>. Xung quanh <color=yellow>Th祅h Й ph?<color> xu蕋 hi謓 qu? qu竔匩hi襲 s? vi謈 cho th蕐 c? li猲 quan n t蕀 b秐  S琻 H? X? T綾.",
		"Tng lai kh玭g xa, Trung Nguy猲 s? ph秈 i m苩 v韎 m閠 c鬰 di謓 tranh gi祅h, t祅 s竧 l蒼 nhau  c? 頲 t蕀 b秐  qu? gi? 蕐.",
		"Ta kh玭g th? khoanh tay ng nh譶, ph秈 t譵 c竎h c鴘 Trung Nguy猲 th玦!",
		"S? ph薾 do tr阨, ngi ng qu? lo l緉g! Gi? n c竎 i ph竔 chuy猲 t﹎ tu luy謓, ta s? lu玭 ch? d箉 th猰 cho ngi.",
		"Nh? m閠 甶襲 ng ng筰 gian nan ph輆 trc m? b? gi鱝 ch鮪g, ta tin m閠 ng祔 n祇  Trung Nguy猲 s? 頲 gi秈 nguy b雐 ch輓h ngi v? t猲 tu鎖 ngi s? 頲 l璾 danh mu玭 thu?!"
	}
	TE_Talk(getn(strMain),"",strMain);
        if GetAntiEnthrallmentStatus() ~= 2 then
	    AddItem(2,4,1,1)
	    AddItem(2,4,8,1)
        end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 25
	TE_SetTeachState(26)  --故意多设一阶，以区别故意不做任务和已经做完任务的人
	Msg2Player("Nhi謒 v? ho祅 th祅h nh薾 頲 2 trang b?!");
	Msg2Player("Ch骳 m鮪g b筺 ho祅 th祅h nhi謒 v? hng d蒼 T﹏ th?! Gi? c? th? gia nh藀 th藀 i m玭 ph竔, m? ra hng 甶 cho ri猲g m譶h.");
end










-- 六个问答题的内容
function Teach_Qustion_001()
	Say("Gi? ta s? h醝 ngi m閠 v礽 v蕁 , c﹗ h醝 1: Hi謓 c? m蕐 i ph竔 thu nh薾  t??",4,"Th藀 i m玭 ph竔/Teach_Qustion_Error","B竧 i m玭 ph竔/Teach_Qustion_Error","Ng? i m玭 ph竔/Teach_Qustion_002","Tam i m玭 ph竔/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr? l阨 t鑤 l緈! C﹗ h醝 ti誴 theo: Ki誱 ph竝 V? ng xu蕋 th莕 nh藀 qu? do  t? o gia hay  t? t鬰 gia luy謓?",3,"Чo gia  t?/Teach_Qustion_003","T鬰 gia  t?/Teach_Qustion_Error","C? hai u ng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh? l緈! C﹗ h醝 3: Л阯g M玭 頲 xem l? gia t閏 m玭 ph竔, v藋 ngi ph? tr竎h m玭 ph竔 l? ai?",4,"M玭 ch?/Teach_Qustion_Error","L穙 l穙/Teach_Qustion_004","Chng m玭/Teach_Qustion_Error","T鎛g qu秐/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C﹗ h醝 ti誴 theo: е t? t鬰 gia Nga My s? d鬾g binh kh? n祇?",4,"Th輈h/Teach_Qustion_Error","Ki誱/Teach_Qustion_Error","C莔/Teach_Qustion_005","B髏/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("ng r錳! C﹗ h醝 5: V? c玭g Thi誹 L﹎ tinh th﹎ kh? 畂竛, 72 tuy謙 k? danh ch蕁 thi猲 h?. V藋 Thi誹 L﹎ c? m蕐 hng tu luy謓?",4,"M閠/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","B鑞/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C﹗ h醝 cu鑙 c飊g: Nghe n鉯  t? C竔 Bang c? ? Y, T辬h Y, v藋  t? T辬h Y tu luy謓 v? c玭g n祇?",4,"C玭 ph竝/Teach_Qustion_Error","Chng ph竝/Teach_Level08_04","Thu莕 dng/Teach_Qustion_Error","B蓎/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh璶g ta nghe ngi ta n鉯 kh玭g ph秈 nh? v藋, ngi th? v? xem l筰!",1,"Л頲! в ta xem l筰!/Teach_Level08_03");
end






-- 返回到帮助目录
function Teach_Main()

	Say("Ngi mu鑞 t譵 hi觰 th猰 g? kh玭g?",getn(strTeachSelect),strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- 解释游戏基本操作
function Teach_Basic()

	local strMain = {
	
		"D飊g chu閠 ch? v祇 b蕋 k? n琲 n祇 trong b秐   di chuy觧 nh﹏ v藅. N誹 kh玭g x竎 nh 頲 v? tr?, m? <color=yellow>B秐  nh?<color>, d蕌 ch蕀 <color=yellow>v祅g<color> b猲 trong ch? cho v? tr? c馻 ngi ch琲.",
		"Ra ngo礽 th祅h n誹 kh玭g may ch? chu閠 l猲 qu竔, nh﹏ v藅 s? t? ng nh qu竔 li猲 t鬰, c莕 ch? ?!"
	}
	
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
	
end

-- 解释人物等级提升
function Teach_Level()

	local strMain = {
	
		"Nh﹏ v藅 d飊g <color=yellow>觤 kinh nghi謒<color>  t╪g c蕄. Nh蕁 <color=yellow><F3><color> m? Giao di謓 trang b? nh﹏ v藅 s? th蕐 <color=yellow>n髏 t╪g c蕄<color>. Khi 甶觤 kinh nghi謒 l韓 h琻 kinh nghi謒  t╪g c蕄, c? th? <color=yellow>t╪g c蕄 nh﹏ v藅<color>. Sau khi t╪g c蕄 nh﹏ v藅 s? c? <color=yellow>觤 ti襪 n╪g<color>. Ъng c蕄 c祅g cao 甶觤 ti襪 n╪g c祅g nhi襲.",
		"C? nhi襲 c竎h nh薾 <color=yellow>甶觤 kinh nghi謒<color>, nh? nh qu竔, l祄 nhi謒 v?, b? quan tu luy謓 th薽 ch? truy襫 c玭g...C莕 ch? ? kinh nghi謒 hi謓 t筰 秐h hng ng c蕄 v? k? n╪g nh﹏ v藅, kh玭g t? ng t╪g c蕄, nh蕁 <color=yellow><F3><color> m? giao di謓 trang b? nh﹏ v藅 v? t? <color=yellow>t╪g c蕄<color>. цi tho筰 v韎 ta xong s? 頲 輙 <color=yellow>kinh nghi謒<color> ngi c? th? d飊g ch髇g th? t╪g c蕄."
	
	}
	TE_Talk(getn(strMain),"Teach_Main",strMain);
	return

end

-- 解释潜能点分配
function Teach_Point()

	local strMain = {
	
		"Nh﹏ v藅 c? 5 ti襪 n╪g: <color=yellow>S鴆 m筺h<color>, <color=yellow>N閕 c玭g<color>, <color=yellow>G﹏ c鑤<color>, <color=yellow>Th﹏ ph竝<color>, <color=yellow>Linh ho箃<color>.",
		"<color=yellow>S鴆 m筺h<color> quy誸 nh nh ngo筰 c玭g v? s鴆 l鵦; <color=yellow>N閕 c玭g<color> quy誸 nh n閕 l鵦, nh n閕 c玭g v? ph遪g th? n閕.",
		"<color=yellow>G﹏ c鑤<color> quy誸 nh sinh l鵦 v? ph遪g th? ngo筰; <color=yellow>Th﹏ ph竝<color> quy誸 nh n? tr竛h, ch輓h x竎 v? t鑓  nh; <color=yellow>nh譶 r?<color> quy誸 nh t蕁 c玭g ch? m筺g v? t? ng n? tr竛h, 秐h hng ch輓h x竎 v? t鑓  nh.",
		" LiT﹏ th? n猲 t╪g nhi襲 v祇 <color=yellow>S鴆 m筺h<color> v? <color=yellow>G﹏ c鑤<color>."
	
	}
	Talk(4,"Teach_Main",strMain[1],strMain[2],strMain[3],strMain[4]);
	return
end


-- 解释赚钱
function Teach_Earn()

	local strMain = {
	
		"C? th? ra ngo礽 th祅h nh qu竔 mang v藅 ph萴 v? b竛 cho c竎 ch? ti謒 ho芻 l祄 m閠 v礽 nhi謒 v? n gi秐. Tri襲 nh c騨g c? ph竔 Kh﹎ Sai i th莕 ti誴 t? cho T﹏ th?, c莕 n緈 b総 c? h閕 hi誱 c? n祔!",
		"дn <color=yellow>c蕄 10<color> c? th? mua b竛, v薾 ti猽, t譵 ki誱 kho b竨, nh l玦 i..."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
end


-- 解释加入门派
function Teach_Faction()

	local strMain = {
	
		"Hi謓 c竎 m玭 ph竔 產ng thu nh薾  t?, ta th蕐 ngi t? ch蕋 c騨g kh玭g t?, ch? c莕 c? g緉g luy謓 n c蕄 10 i tho筰 v韎 <color=yellow>S? gi? m玭 ph竔<color> l? c? th? gia nh藀.",
		"M鏸 m玭 ph竔 c? hng tu luy謓 kh竎 nhau, c莕 t譵 hi觰 k? c s綾 c馻 n?."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return	
	
end

-- 解释当前能做的事情
function Teach_Something()

	local strMain = {
	
		"Ngi m韎 ra giang h? c莕 <color=yellow>Giao l璾<color> nhi襲 v韎 ngi trong th祅h!",
		"Ngi c? th? ra ngo礽 nh qu竔, nh璶g kh玭g n猲 甶 qu? xa v? n琲  qu竔 r蕋 m筺h, n誹 l? b? thng v? t譵 <color=yellow>Ch? dc 甶誱<color> trong th祅h tr? li謚.",
		"N誹  ch鋘 nhi謒 v? T﹏ th?, t? c蕄 1 n c蕄 10 c? n t譵 ta nh薾 nhi謒 v? hay nh蕁 <color=yellow><F11><color>  xem hng d蒼."
	
	}
	Talk(3,"Teach_Main",strMain[1],strMain[2],strMain[3]);
	return
	
end

-- 解释金币的兑换方法
function Teach_Money()

	local strMain = {
	
		"Ba lo筰 ti襫 t? g錷 <color=yellow>V祅g<color>, <color=yellow>B筩<color> v? <color=yellow>уng<color>, 1 lng v祅g = 100 lng b筩, 1 lng b筩 = 100 уng.",
		"H? th鑞g s? t? ng i ti襫. Khi ngi c? 11111 ti襫 ng  tng 鴑g 1 lng v祅g 11 lng b筩 11 ti襫 ng.",
		"Ti襫 g鰅 theo th? t? v祅g, b筩, ti襫 ng."
	
	}
	TE_Talk(getn(strMain),"",strMain);

end


function Teach_Exit()

end