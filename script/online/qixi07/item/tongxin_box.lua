--同心匣脚本
--by vivi
--08/02/2007

--临时变量
TT_TONGXIN_ATTRI = 185; --记录第一条属性

--属性一列表
tAttriOne = {
	{"T╪g ngo筰 c玭g 6%",368,4},
	{"T╪g N閕 c玭g 6%",369,4},
	{"T╪g t鎛 thng 78",372,5},
	{"Ti誴 t鬰 k衞 d礽 th阨 gian c玭g k輈h h? tr? 30%",41,6},
	{"K衞 d礽 th阨 gian h? tr? ph遪g ng? 30%",42,6}
	}

--属性二和属性三列表
tAttriTwo = {--属性名  属性id  lv1-lv7的概率		
	{"Ngo筰 k輈h + ",368,0,0,35,70,100,0,0},
	{"N閕 k輈h t╪g ",369,0,0,35,70,100,0,0},
	{"S竧 thng t╪g ",372,0,0,35,70,100,0,0},
	{"T蕁 c玭g k蘭 c s竧",363,20,40,60,80,100,0,0},
	{"Ph? ph遪g th? i phng",362,0,0,0,0,100,0,0},
	{"T蕁 c玭g t╪g ",77,0,0,35,70,100,0,0},
	{"Ph竧 huy c玭g k輈h l韓 nh蕋",346,0,0,35,70,100,0,0},
	{"T? l? nh ph筸 vi",335,0,0,35,70,100,0,0},
	{"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",65,0,0,35,70,100,0,0},
	{"V? kh? nh ngo筰 th蕄 nh蕋 t╪g ",66,0,0,35,70,100,0,0},
	{"V? kh? nh n閕 l韓 nh蕋 t╪g",67,0,0,35,70,100,0,0},
	{"V? kh? nh n閕 th蕄 nh蕋 t╪g ",68,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",348,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",349,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",350,0,0,35,70,100,0,0},
	{"Khi課 i phng gi秏 Linh ho箃 ",351,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",352,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",353,0,0,35,70,100,0,0},
	{"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",354,0,0,35,70,100,0,0},
	{"T? l? nh蕋 nh l祄 i phng kh? huy誸 hao t鎛",53,0,0,0,0,50,100,0},
	{"T? l? nh蕋 nh l祄 i phng ch﹏ nguy猲 hao t鎛",54,0,0,0,0,50,100,0},
	{"C玭g k輈h khi課 ngo筰 ph遪g c馻 i phng gi秏",382,20,40,60,80,100,0,0},
	{"C玭g k輈h khi課 n閕 l鵦 c馻 i phng gi秏 ",383,20,40,60,80,100,0,0},
	{"T蕁 c玭g l祄 i phng hao t鎛 n閕 l鵦",49,0,0,0,0,100,0,0},
	{"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",333,0,0,35,70,100,0,0},
	{"T? l? m礽 m遪 v? kh? gi秏",9,0,0,35,70,100,0,0},
	{"Цnh t藀 trung t╪g",342,0,0,35,70,100,0,0},
	{"Ch輓h x竎 t╪g",337,0,0,35,70,100,0,0},
	{"G﹏ c鑤 t╪g",357,0,0,35,70,100,0,0},
	{"S鴆 m筺g t╪g",58,0,0,35,70,100,0,0},
	{"Th﹏ ph竝 t╪g",59,0,0,35,70,100,0,0},
	{"Linh ho箃 t╪g",60,0,0,35,70,100,0,0},
	{"N閕 c玭g t╪g ",61,0,0,35,70,100,0,0},
	{"H? tr? t蕁 c玭g  duy tr? ",41,20,40,60,80,90,100,0},
	{"H? tr? ph遪g th? duy tr? ",42,20,40,60,80,90,100,0},
	{"T蕋 c? thu閏 t輓h t╪g",367,0,0,50,100,0,0,0}
	}

--76级武器table，序号对应玩家路线
tWeapon = {
	[2]= {"C? лnh",0,3,64,200},
	[3]= {"A La H竛 Trng",0,8,97,100},
	[4]= {"V筺 Nh蒼",0,0,14,220},
	[6]= {"M穘 Thi猲 Hoa V?",0,1,53,130},	
	[8]= {"H醓 Tinh",0,2,36,90},	
	[9]= {"Hi Nh﹏ C莔",0,10,75,140},
	[11]= {"V筺 Nh蒼",0,0,14,220},
	[12]= {"Li謙 Di謒",0,5,40,200},
	[14]= {"H醓 Tinh",0,2,36,90},	
	[15]= {"Th莕 H祅h",0,9,86,130},	
	[17]= {"Чi H祇 L玦 Thng",0,6,108,130},	
	[18]= {"Th莕 Cung",0,4,119,130},
	[20]= {"L╪g Phong",0,7,12,200},
	[21]= {"M穘h h?",0,11,12,200},
	};

--给随机76级武器table
tRandomW = {
	[1]= {"C? лnh",0,3,64,200},
	[2]= {"A La H竛 Trng",0,8,97,100},
	[3]= {"V筺 Nh蒼",0,0,14,220},
	[4]= {"M穘 Thi猲 Hoa V?",0,1,53,130},	
	[5]= {"H醓 Tinh",0,2,36,90},	
	[6]= {"Hi Nh﹏ C莔",0,10,75,140},
	[7]= {"V筺 Nh蒼",0,0,14,220},
	[8]= {"Li謙 Di謒",0,5,40,200},
	[9]= {"H醓 Tinh",0,2,36,90},	
	[10]= {"Th莕 H祅h",0,9,86,130},	
	[11]= {"Чi H祇 L玦 Thng",0,6,108,130},	
	[12]= {"Th莕 Cung",0,4,119,130},
	[13]= {"L╪g Phong",0,7,12,200},
	[14]= {"M穘h h?",0,11,12,200},
	};

function GetPlayerSex()	
	local mySex -- 用以显示人物性别的字符
	if (GetSex() == 1) then
		mySex = "Thi誹 hi謕";
	elseif (GetSex() == 2) then
		mySex = "C? nng";
	end;
	return mySex;
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"cancel","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"cancel","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end	

function OnUse()
	local strtab = {
		"Thu閏 t輓h Th莕 Binh 1 /choose_attri",
		"竔 cha, th莕 binh v? ch?, ch璦 th? giao h閜 ra./nothing"
		}
	Say("<color=green>H閜 уng t﹎<color>: tr猲 vi誸 r籲g 'n誹 c? t譶h nh﹏ ? h頿 t﹎ u, chuy謓 g? c騨g c? th? vt qua', b筺 h穣 ch鋘 m閠 s? phng hng ph竧 tri觧 trong h閜 n祔. Ch? ?, thu閏 t輓h h祅g th? nh蕋 c馻 phng hng ph竧 tri觧 n祔 do "..GetPlayerSex().." ch? nh, thu閏 t輓h h祅g th? hai v? th? ba tu? ? a ra.",getn(strtab),strtab);
end

function choose_attri()
	local strtab = {};
	for i=1,getn(tAttriOne) do
		tinsert(strtab,tAttriOne[i][1].."/#confirm_attri("..i..")");
	end
	tinsert(strtab,"в ta suy ngh? m閠 l竧, sau  s? m? h閜/nothing");
	Say("<color=green>H閜 уng t﹎<color>:"..GetPlayerSex().."Hy v鋘g xu蕋 hi謓 thu閏 t輓h th莕 binh h祅g th? nh蕋 l?",getn(strtab),strtab);
end

function confirm_attri(nAttri)
	local strtab = {
		"Ta ch鋘 xong r錳, a H閜 th莕 binh ra y/give_weapon",		
		"Ta mu鑞 ki觤 tra xem thu閏 t輓h th莕 binh h祅g th? 2 v? th? 3 l? g?/#attri_list(0)",
		"Tr阨, th莕 binh v? ch?, hay l?  sau n祔 h絥g m?!/cancel"
		}
	SetTaskTemp(TT_TONGXIN_ATTRI,nAttri);
	Say("<color=green>H閜 уng t﹎<color>:"..GetPlayerSex().."Ch鋘 thu鑓 t輓h th? nh蕋 l? <color=yellow>"..tAttriOne[nAttri][1].."<color>. B筺 mu鑞 th莕 binh ra kh醝 h閜 kh玭g?",getn(strtab),strtab);
end

function attri_list(nPage)
	local page_num = 7;   --每页对话显示的属性数 
	local dia_attri = {};  --显示对话表
	local attri_remain_num = getn(tAttriTwo) - (nPage*page_num);	--这一页后还剩下多少条属性数
	local num_this_dia = 7;
	if attri_remain_num <= 7 then
		num_this_dia = attri_remain_num;
	end	
	for i=1,num_this_dia do
		tinsert(dia_attri,tAttriTwo[(nPage*page_num)+i][1].."/#confirm_attri("..GetTaskTemp(TT_TONGXIN_ATTRI)..")");
	end
	if nPage ~= 0 then
		tinsert(dia_attri,"Trang trc/#attri_list("..(nPage-1)..")");
	end
	if attri_remain_num > page_num then
		tinsert(dia_attri,"Trang k?/#attri_list("..(nPage+1)..")");
	end
		tinsert(dia_attri,"tr? l筰/#confirm_attri("..GetTaskTemp(TT_TONGXIN_ATTRI)..")");
		
	Say("<color=green>H閜 уng t﹎<color>: thu閏 t輓h th莕 binh h祅g th? 2 v? th? 3 c? th? xu蕋 hi謓 l?",
		getn(dia_attri),
		dia_attri);
end

function give_weapon()
	if Zgc_pub_goods_add_chk(1,220) ~= 1 then   --空间负重检测 取最重武器
		return
	end	
	local attri_one = GetTaskTemp(TT_TONGXIN_ATTRI);
	local two_ran = random(1,getn(tAttriTwo)); --随机属性
	local three_ran = random(1,getn(tAttriTwo));	
	if DelItem(2,1,1153,1) == 1 then			
		if tAttriTwo[two_ran][2] == tAttriOne[attri_one][2] then --第2项属性是否跟第一项相等
			local x = random(1,100);
			if x > 50 then															--50%概率成功	
				two_ran = randomx(1,getn(tAttriTwo),two_ran);  --没random成功相同属性则重新random一次，当然除去当前属性
			end
		end                                         
		--3属性都相同
		if tAttriTwo[three_ran][2] == tAttriOne[attri_one][2] and tAttriTwo[two_ran][2] == tAttriOne[attri_one][2] then --第3项属性也相等
			local y = random(1,100);
			if y > 20 then															--20%概率成功
				three_ran = randomx(1,getn(tAttriTwo),three_ran);  
			end
		end
		--第3属性与第2属性相同或者与第1属性相同，前提是第2属性和第1属性都不同
		if tAttriTwo[two_ran][2] ~= tAttriOne[attri_one][2] then
			if tAttriTwo[three_ran][2] == tAttriOne[attri_one][2] or tAttriTwo[three_ran][2] == tAttriTwo[two_ran][2] then			
				local m = random(1,100);
				if m > 50 then
					three_ran = randomx(1,getn(tAttriTwo),three_ran);
				end
			end
		end		
			get_weapon(two_ran,three_ran); --给予武器
	end
end

function get_weapon(aTwo,aThree)
	local aOne = GetTaskTemp(TT_TONGXIN_ATTRI);	
	local nroute = 0; --记录玩家的路线
	local nlv = random(1,100);									--随机魔法等级		                  
	local mlv = random(1,100);				          		
	local ilv = 3;															--记录魔法等级，初始为表的第三个位置
	local jlv = 3;
	for i=3,9	do
		if nlv <= tAttriTwo[aTwo][i] then
			ilv=i;
			break;
		end
	end
	for j=3,9 do
		if jlv <= tAttriTwo[aThree][j] then
			jlv=j;
			break;
		end
	end			

	if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
		local p = random(1,14); --给随机武器
		local add_flog = AddItem(tRandomW[p][2],tRandomW[p][3],tRandomW[p][4],1,1,tAttriOne[aOne][3],tAttriOne[aOne][2],ilv-2,tAttriTwo[aTwo][2],jlv-2,tAttriTwo[aThree][2]);
		if add_flog == 1 then
			Msg2Player("B筺 m? H閜 уng t﹎, nh薾 頲 1 th莕 binh");
			SetTaskTemp(TT_TONGXIN_ATTRI,0);
		else
			WriteLog("H閜 уng t﹎: ngi ch琲"..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
		end
	else
		nroute = GetPlayerRoute();
		local add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,tAttriOne[aOne][3],tAttriOne[aOne][2],ilv-2,tAttriTwo[aTwo][2],jlv-2,tAttriTwo[aThree][2]);
		if add_flog == 1 then
			Msg2Player("B筺 m? H閜 уng t﹎, nh薾 頲 1 th莕 binh");
			SetTaskTemp(TT_TONGXIN_ATTRI,0);
		else
			WriteLog("H閜 уng t﹎: ngi ch琲"..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
		end
	end
end

function randomx(a,b,c)
	local r = random(a,b-1);
	if r < c then
		return r;
	else
		return r+1;
	end
end

function cancel()
	SetTaskTemp(TT_TONGXIN_ATTRI,0);
end

function nothing()
end