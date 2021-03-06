--楚国神兵匣脚本
--by vivi 
--07/12/2007

--临时变量
TT_ATTRI_ONE = 180; --记录第一条属性
TT_ATTRI_TWO = 181; --记录第二条属性
TT_ATTRI_THREE = 182; --记录第三条属性
TT_ATTRI_TYPE = 183; --记录玩家选择的属性类型
TT_SHAOLIN_WEAPON = 184; --记录当玩家路线为少林时，选择的武器类型（刀或者棍）

--任务变量
TASK_PROB_ONE = 2385;  --记录属性一上交天地玄黄石的次数
TASK_PROB_TWO = 2386;  --记录属性二上交天地玄黄石的次数
TASK_PROB_THREE = 2387; --记录属性三上交天地玄黄石的次数

--天地玄黄石每次需要提交的块数
tTiandiNum = {1,6,20};

--这个table主要是对应下面的tAttri里三个属性类别从第几项开始，第4个数也需要。
tAttriNum = {1,13,25,40};

--属性table 修改此表一定要修改give_weapon()下的tInitAttri表，切记
tAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 --属性名 id 基础成功概率 出现最低等级 最低等级数值 每级增量 最高等级数值 百分比标志 依次出现概率(不是从1lv开始的补0) 
					 --百分比标志，0表示这个属性数值是百分比的，1表示这个属性数值不是百分比的。
--攻击增加类属性 12条
	{"Ngo筰 k輈h + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"N閕 k輈h t╪g ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"T? l? xu蕋 chi猽 t╪g",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S竧 thng t╪g ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph? ph遪g th? i phng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"T蕁 c玭g t╪g ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph竧 huy c玭g k輈h l韓 nh蕋",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"T? l? nh ph筸 vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh ngo筰 th蕄 nh蕋 t╪g ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh n閕 l韓 nh蕋 t╪g",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh n閕 th蕄 nh蕋 t╪g ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--削弱敌人类属性 12条 
	{"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"Khi課 i phng gi秏 Linh ho箃 ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T? l? nh蕋 nh l祄 i phng kh? huy誸 hao t鎛",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"T? l? nh蕋 nh l祄 i phng ch﹏ nguy猲 hao t鎛",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C玭g k輈h khi課 ngo筰 ph遪g c馻 i phng gi秏",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C玭g k輈h khi課 n閕 l鵦 c馻 i phng gi秏 ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T蕁 c玭g l祄 i phng hao t鎛 n閕 l鵦",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--增强自身类属性 15条
	{"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"T? l? m礽 m遪 v? kh? gi秏",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"S鴆 l鵦 t╪g",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"Цnh t藀 trung t╪g",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Ch輓h x竎 t╪g",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G﹏ c鑤 t╪g",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"S鴆 m筺g t╪g",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th﹏ ph竝 t╪g",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho箃 t╪g",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"N閕 c玭g t╪g ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh l鵦 t鑙 產 t╪g",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"N閕 l鵦 + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T蕋 c? thu閏 t輓h t╪g",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"H? tr? t蕁 c玭g  duy tr? ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"H? tr? ph遪g th? duy tr? ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};
	
--属性等级概率权值表1-7
tLvProb = {
	[1] = {0,0,400000,300000,200000,10000,5000},
	[2] = {0,0,350000,350000,200000,20000,10000},
	[3] = {0,0,0,470000,470000,30000,15000},
	[4] = {0,0,0,430000,500000,40000,20000},
	[5] = {0,0,0,400000,515000,50000,25000},	
	[6] = {0,0,0,380000,540000,40000,30000},
	[7] = {0,0,0,350000,555000,50000,35000},
	[8] = {0,0,0,340000,550000,60000,40000},
	[9] = {0,0,0,150000,300000,50000,30000},
	[10] = {0,0,0,0,1500000,300000,200000},
	[11] = {0,0,0,0,3800000,700000,500000},
	[12] = {0,0,0,0,1800000,400000,300000},
	[13] = {0,0,0,0,1300000,400000,300000},
	[14] = {0,0,0,0,2200000,1000000,800000}
	}
	
	
--76级武器table
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
	"R鑤 cu閏 l? lo筰 th莕 binh g? y?.../choose_attribute",
	"竔 cha, th莕 binh v? ch?, ch璦 th? giao h閜 ra./nothing"
	}
  Say("Th莕 Binh xu蕋 h筽 総 ph秈 c? c竎 thu閏 t輓h"..GetPlayerSex().."H穣 ch鋘 c s綾 Th莕 binh mong mu鑞.",getn(strtab),strtab);
end

function choose_attribute()	
	local strtab = {
	"Thu閏 t輓h Th莕 Binh 1 /#attri_type()",
	"竔 cha, t筸 th阨 ch璦 ngh? ra./nothing",
	}
	
	Say("?"..GetPlayerSex().."T藀 trung tinh th莕, h穣 t t蕋 c? t﹎ ni謒 c馻 m譶h v祇 th莕 binh.",getn(strtab),strtab);
end

function attri_type()
	local strtab = {
	"Lo筰 t╪g c玭g k輈h/#choose_attri(1)",
	"Lo筰 l祄 gi秏 s鴆 chi課 u i phng/#choose_attri(2)",
	"Lo筰 t╪g n╪g l鵦 b秐 th﹏/#choose_attri(3)",
	"Ta ph秈 suy ngh? k? ./cancel"
	}
	Say("?"..GetPlayerSex().."Hy v鋘g thu閏 t輓h Th莕 binh 1 xu蕋 hi謓 ",getn(strtab),strtab);
end

function choose_attri(tNum)
	SetTaskTemp(TT_ATTRI_TYPE,tNum); --存储tNum，后面会用到这个变量
	dia_page(0);
end	

function dia_page(nPage)
	local page_num = 7;   --每页对话显示的属性数 
	local dia_attri = {};  --显示对话表
	local attri_start = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]-1;	
	local total_num = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)+1]-tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]; --这类属性总的数目
	local attri_remain_num = total_num - (nPage*page_num);	--这一页后还剩下多少条属性数
	local num_this_dia = 7;
	if attri_remain_num <= 7 then
		num_this_dia = attri_remain_num;
	end
	for i=1,num_this_dia do                                                                                                                                   
		if tAttri[attri_start+(page_num*nPage)+i][8] == 0 then                                                                                                     
			tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi? tr? thu閏 t輓h: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."%-"..tAttri[attri_start+(page_num*nPage)+i][7].."%/#get_attri("..(attri_start+(page_num*nPage)+i)..")");        
		else                                                                                                                                                                         	
	 		tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi? tr? thu閏 t輓h: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."-"..tAttri[attri_start+(page_num*nPage)+i][7].."/#get_attri("..(attri_start+(page_num*nPage)+i)..")");                                                         
		end                                                                                                                                                                       	
	end
	if nPage ~= 0 then
		tinsert(dia_attri,"Trang trc/#dia_page("..(nPage-1)..")");
	end
	if attri_remain_num > page_num then
		tinsert(dia_attri,"Trang k?/#dia_page("..(nPage+1)..")");
	end
	if GetTaskTemp(TT_ATTRI_ONE) == 0 then
		tinsert(dia_attri,"Tr? v? trang ch鋘 lo筰 thu閏 t輓h./attri_type");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then
		tinsert(dia_attri,"Tr? v? trang ch鋘 lo筰 thu閏 t輓h./#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then
		tinsert(dia_attri,"Tr? v? trang ch鋘 lo筰 thu閏 t輓h./#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))");
	end	
	Say("Xin h穣 ch鋘 m閠 thu閏 t輓h 甶.",
		getn(dia_attri),
		dia_attri
		)                                                                                                                                                                             
end 
	
function get_attri(aType)
	if aType ~= 0 then                                                                                                                   
		if GetTaskTemp(TT_ATTRI_ONE) == aType or GetTaskTemp(TT_ATTRI_TWO) == aType or GetTaskTemp(TT_ATTRI_THREE) == aType then 
			if GetTaskTemp(TT_ATTRI_TWO) == 0 then
				Talk(1,"#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))","Huynh  ch鋘 qua thu閏 t輓h n祔 r錳, h穣 ch鋘 thu閏 t輓h kh竎.");                                        
			else
				Talk(1,"#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))","Huynh  ch鋘 qua thu閏 t輓h n祔 r錳, h穣 ch鋘 thu閏 t輓h kh竎.");
			end
		else                                                                                                                                    
			if GetTaskTemp(TT_ATTRI_ONE) == 0 then                                                                                                 
				Say("C竎 h? ch鋘 thu閏 t輓h l? <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"уng ?/#make_attri(1,"..aType..")",
					"Ch鋘 sai r錳. Xin ch鋘 l筰 /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then                                                                                                 
				Say("C竎 h? ch鋘 thu閏 t輓h l? <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"уng ?/#make_attri(2,"..aType..")",
					"Ch鋘 sai r錳. Xin ch鋘 l筰 /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then                                                                                                                 
				Say("C竎 h? ch鋘 thu閏 t輓h l? <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"уng ?/#make_attri(3,"..aType..")",
					"Ch鋘 sai r錳. Xin ch鋘 l筰 /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                              
			end                                                                                                                                   
		end                                                                                                                                     
	end	                                          
end

function make_attri(att_num,nType)
	local strtab = {
	"Lo筰 t╪g c玭g k輈h/#choose_attri(1)",
	"Lo筰 l祄 gi秏 s鴆 chi課 u i phng/#choose_attri(2)",
	"Lo筰 t╪g n╪g l鵦 b秐 th﹏/#choose_attri(3)",
	"Ta ph秈 suy ngh? k? ./cancel"
	}
	if att_num == 1 then
		SetTaskTemp(TT_ATTRI_ONE,nType);
		Say("?"..GetPlayerSex().."Hy v鋘g xu蕋 hi謓 thu閏 t輓h Th莕 binh 2",getn(strtab),strtab);
	elseif att_num == 2 then
		SetTaskTemp(TT_ATTRI_TWO,nType);
		Say("?"..GetPlayerSex().."Hy v鋘g xu蕋 hi謓 thu閏 t輓h Th莕 binh 3",getn(strtab),strtab);
	elseif att_num == 3 then
		SetTaskTemp(TT_ATTRI_THREE,nType);
		confirm_attri();
	end
end

		
function cancel()
	SetTaskTemp(TT_ATTRI_ONE,0);
	SetTaskTemp(TT_ATTRI_TWO,0);
	SetTaskTemp(TT_ATTRI_THREE,0);
	SetTaskTemp(TT_ATTRI_TYPE,0);
	SetTaskTemp(TT_SHAOLIN_WEAPON,0);
end
	
function confirm_attri()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);
	local nstr = "";
	
	if tAttri[attrione][8] == 0 then   --判断是否要加百分号（%）
		nstr=nstr.."B筺 ch鋘 thu閏 t輓h 1: <color=yellow>"..tAttri[attrione][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";
	else	
		nstr=nstr.."B筺 ch鋘 thu閏 t輓h 1: <color=yellow>"..tAttri[attrione][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";
	end
	if tAttri[attritwo][8] == 0 then
		nstr=nstr.."thu閏 t輓h 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";
	else
		nstr=nstr.."thu閏 t輓h 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";
	end
	if tAttri[attrithree][8] == 0 then
		nstr=nstr.."thu閏 t輓h 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.";
	else
		nstr=nstr.."thu閏 t輓h 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu閏 t輓h c? gi? tr?: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.";
	end
		
	Say("?"..nstr,
		2,
		"Ta mu鑞 v? trang ch? Th莕 binh /main",
		"Ta ch璦 ch鋘 xong, c遪 ph秈 suy ngh軈/cancel"
		);
end

function main()
	local strtab = {
		"Ta  ngh? ra th莕 binh nh? th? n祇 r錳, giao ra th玦!/confirm_weapon",
		"X竎 su蕋 th祅h c玭g ch? t筼 Th莕 binh/weapon_probability",
		"Ta mu鑞 d飊g Thi猲 мa Huy襫 Ho祅g Th筩h n╪g cao linh kh? c馻 Th莕 binh./use_stone",
		"竔 cha, th莕 binh v? ch?, ch璦 th? giao h閜 ra./cancel"
		}
	Say("Th莕 Binh xu蕋 h筽 総 ph秈 c? c竎 thu閏 t輓h"..GetPlayerSex().."B筺 mu鑞 giao ra h閜 Th莕 Binh kh玭g? ",getn(strtab),strtab);
end

function confirm_weapon()
	if GetPlayerRoute() == 2 then
		Say("C竎 h? mu鑞 d飊g lo筰 h閜 Th莕 binh n祇?",
			3,
			"o/#shaolin_weapon(1)",
			"C玭/#shaolin_weapon(2)",
			"Sau n祔 h穣 t輓h!/cancel"
			);
	else			
		Say("C竎 h? mu鑞 giao ra h閜 Th莕 binh ch??",
			2,
			"Л頲/give_weapon",
			"Sau n祔 h穣 t輓h!/cancel"
			);
	end
end

function shaolin_weapon(nWeaponType)
	if nWeaponType == 1 then
		SetTaskTemp(TT_SHAOLIN_WEAPON,1);
	elseif nWeaponType == 2 then
		SetTaskTemp(TT_SHAOLIN_WEAPON,2);
	end
	give_weapon();		
end

function weapon_probability()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);                                                                                        
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);                                                                                       
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);                                                                                                                                                                                                            
	local nstr = "";                                                                                                                                                                                                                                                                 
	                                                                                                                                      
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10;  --获取第一项属性概率
	if probone >= 100 then
		probone = 100;
	end
	if tAttri[attrione][8] == 0 then   --判断是否要加百分号（%）                                                                                                        
		nstr=nstr.."thu閏 t輓h Th莕 binh l?: <color=yellow>"..tAttri[attrione][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probone.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";     
	else	                                                                                                                                     
		nstr=nstr.."thu閏 t輓h Th莕 binh l?: <color=yellow>"..tAttri[attrione][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probone.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";       
	end
		
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10;  --获取第二项属性概率
	if probtwo >= 50 then
		probtwo = 50;
	end
	if tAttri[attritwo][8] == 0 then           --判断是否要加百分号（%）                                                                                                
		nstr=nstr.."thu閏 t輓h 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probtwo.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";             
	else                                                                                                                                       
		nstr=nstr.."thu閏 t輓h 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probtwo.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";               
	end                                                                                                                                        
	
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --获取第三项属性概率
	if probthree >= 20 then
		probthree = 20;
	end
	if tAttri[attrithree][8] == 0 then                                                                                                       
		nstr=nstr.."thu閏 t輓h 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probthree.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.\n"; 
	else                                                                                                                                       
		nstr=nstr.."thu閏 t輓h 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu閏 t輓h x竎 su蕋 th祅h c玭g: <color=yellow>"..probthree.."%<color>, thu閏 t輓h t╪g: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.\n";   
	end
	
	Talk(1,"main","?"..nstr.."<color=yellow> Xin ch? ?, ch? khi thu閏 t輓h 1 th祅h c玭g th? m韎 ng蓇 nhi猲 c? thu閏 t輓h 2.<color>" );     

end                                                                                                                                 

function use_stone()
	Say("N誹 l蕐 Thi猲 мa Huy襫 Ho祅g Th筩h t h閜 Th莕 binh s? l祄 t╪g thu閏 t輓h x竎 su蕋 th莕 c玭g hi謓 t筰 c馻 Th莕 Binh. <color=yellow> M鏸 l莕 <color>t Thi猲 мa Huy襫 Ho祅g Th筩h t╪g <color=yellow>10%<color> x竎 su蕋 th祅h c玭g, sao h??",
		4,
		"M閠 l莕 t 1Thi猲 мa Huy襫 Ho祅g Th筩h, l祄 t╪g thu閏 t輓h x竎 su蕋 th祅h c玭g, c? th? t輈h l騳  t╪g 100## x竎 su蕋 th祅h c玭g./#is_probability(1)",
		"M閠 l莕 t 6 Thi猲 мa Huy襫 Ho祅g Th筩h, l祄 t╪g thu閏 t輓h x竎 su蕋 th祅h c玭g th? 2, c? th? t輈h l騳  t╪g 50%./#is_probability(2)",
		"M閠 l莕 t 20 Thi猲 мa Huy襫 Ho祅g Th筩h, l祄 t╪g thu閏 t輓h x竎 su蕋 th祅h c玭g th? 3, c? th? t輈h l騳  t╪g 20##/#is_probability(3)",
		"Ta kh玭g c? d? nh t╪g linh kh? Th莕 binh./main"
		)
end   

function is_probability(aType)
  local attrione = GetTaskTemp(TT_ATTRI_ONE);
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --获取第一项属性概率
	if probone >= 100 then
		probone = 100;
	end
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --获取第二项属性概率
	if probtwo >= 50 then
		probtwo = 50;
	end
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --获取大三项属性概率
	if probthree >= 20 then
		probthree = 20;
	end
	local nProbability = 0;
	if aType == 1 then
		nProbability = probone;
	elseif aType == 2 then
		nProbability = probtwo;
	elseif aType == 3 then
		nProbability = probthree;
	end				
	if (aType == 1 and probone >= 100) or (aType == 2 and probtwo >= 50) or (aType == 3 and probthree >= 20) then
		Talk(1,"use_stone","Trc ti猲 ph秈 t╪g thu閏 t輓h x竎 su蕋 n m鴆 cao nh蕋: <color=yellow>"..nProbability.."%<color>, n誹 t th猰 c騨g kh玭g c? t竎 d鬾g.");
	else
		Say("Trc ti猲 ph秈 t╪g thu閏 t輓h x竎 su蕋 n m鴆 cao nh蕋: <color=yellow>"..nProbability.."%<color>. b筺 t輓h m閠 l莕 t <color=yellow>"..tTiandiNum[aType].."<color> Thi猲 мa Huy襫 Ho祅g Th筩h l祄 t╪g thu閏 t輓h x竎 su蕋 Th莕 binh, x竎 nh薾 t kh玭g? ",
			2,
			"уng ?/#add_probability("..aType..")",
			"Kh玭g, t筰 h? kh玭g nh l祄 t╪g linh kh? cho Th莕 binh/main"
			);
	end
end

--天地玄换石
function add_probability(pType)
	local strtab = {
		"Ta mu鑞 v? trang trc  l祄 t╪g linh kh? cho Th莕 binh/use_stone",
		"Ta mu鑞 v? trang ch? Th莕 binh /main"
		};
		
	if pType == 1 then
		if DelItem(2,1,1151,1) == 1 then
			SetTask(TASK_PROB_ONE,GetTask(TASK_PROB_ONE)+1);
			local attrione = GetTaskTemp(TT_ATTRI_ONE);
  		local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --获取第一项属性概率
			if probone >= 100 then
				probone = 100;
			end			
			Say("C竎 h? 1 l莕 t 1 Thi猲 мa Huy襫 Ho祅g Th筩h, thu閏 t輓h x竎 su蕋 th祅h c玭g t╪g: <color=yellow>"..probone.."%<color>",
				getn(strtab),
				strtab
				);
		else
			Talk(1,"main","C竎 h? kh玭g c? Thi猲 мa Huy襫 Ho祅g Th筩h . ");
		end
	elseif pType == 2 then
		if DelItem(2,1,1151,6) == 1 then
			SetTask(TASK_PROB_TWO,GetTask(TASK_PROB_TWO)+1);
			local attritwo = GetTaskTemp(TT_ATTRI_TWO);
			local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --获取第二项属性概率
			if probtwo >= 50 then
				probtwo = 50;
			end
			Say("C竎 h? 1 l莕 t 6 Thi猲 мa Huy襫 Ho祅g Th筩h, thu閏 t輓h x竎 su蕋 th祅h c玭g lo筰 2 t╪g: <color=yellow>"..probtwo.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh玭g  6 Thi猲 мa Huy襫 Ho祅g Th筩h.");
	  end
	elseif pType == 3 then
		if DelItem(2,1,1151,20) == 1 then
			SetTask(TASK_PROB_THREE,GetTask(TASK_PROB_THREE)+1);
			local attrithree = GetTaskTemp(TT_ATTRI_THREE);
			local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --获取大三项属性概率
			if probthree >= 20 then
				probthree = 20;
			end			
			Say("C竎 h? 1 l莕 t 20 Thi猲 мa Huy襫 Ho祅g Th筩h, x竎 su蕋 th祅h c玭g loai 3 t╪g: <color=yellow>"..probthree.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh玭g  20 Thi猲 мa Huy襫 Ho祅g Th筩h.");
	  end			
	end	
end

function give_weapon()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);                                                                                        
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);                                                                                       
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);	
	local nroute=0;   --记录玩家的流派
	local nStone = GetTask(TASK_PROB_ONE)+GetTask(TASK_PROB_TWO)+GetTask(TASK_PROB_THREE); --一共投入天地玄黄石的次数 最大为14
		
	--初始没有用玄黄石的表 跟tAttri表一样
	local tInitAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 						--属性名 id 基础成功概率 出现最低等级 最低等级数值 每级增量 最高等级数值 百分比标志 依次出现概率(不是从1lv开始的补0) 
					 						--百分比标志，0表示这个属性数值是百分比的，1表示这个属性数值不是百分比的。
	--攻击增加类属性 12条
	{"Ngo筰 k輈h + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"N閕 k輈h t╪g ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"T? l? xu蕋 chi猽 t╪g",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S竧 thng t╪g ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph? ph遪g th? i phng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"T蕁 c玭g t╪g ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph竧 huy c玭g k輈h l韓 nh蕋",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"T? l? nh ph筸 vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh ngo筰 th蕄 nh蕋 t╪g ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh n閕 l韓 nh蕋 t╪g",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"V? kh? nh n閕 th蕄 nh蕋 t╪g ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--削弱敌人类属性 12条 
	{"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"Khi課 i phng gi秏 Linh ho箃 ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T? l? nh蕋 nh l祄 i phng kh? huy誸 hao t鎛",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"T? l? nh蕋 nh l祄 i phng ch﹏ nguy猲 hao t鎛",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C玭g k輈h khi課 ngo筰 ph遪g c馻 i phng gi秏",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C玭g k輈h khi課 n閕 l鵦 c馻 i phng gi秏 ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T蕁 c玭g l祄 i phng hao t鎛 n閕 l鵦",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--增强自身类属性 15条
	{"H? g鬰 i phng sinh l鵦 h錳 ph鬰 ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"T? l? m礽 m遪 v? kh? gi秏",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"S鴆 l鵦 t╪g",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"Цnh t藀 trung t╪g",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Ch輓h x竎 t╪g",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G﹏ c鑤 t╪g",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"S鴆 m筺g t╪g",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th﹏ ph竝 t╪g",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho箃 t╪g",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"N閕 c玭g t╪g ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh l鵦 t鑙 產 t╪g",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"N閕 l鵦 + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T蕋 c? thu閏 t輓h t╪g",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"H? tr? t蕁 c玭g  duy tr? ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"H? tr? ph遪g th? duy tr? ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};	
	
	if Zgc_pub_goods_add_chk(1,220) ~= 1 then   --空间负重检测 取最重武器
		return
	end
	
	--根据投入的玄黄石次数加上不同的lv概率权值
	if nStone == 1 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 2 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end		
	elseif nStone == 3 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 4 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 5 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 6 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 7 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 8 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 9 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 10 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 11 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 12 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 13 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone >= 14 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --如果该lv==0 则不加上权值
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[14][j];
				end
			end
		end
	end
		
		
	local n = random(1,100);
	local nProbone = tInitAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10;
	if nProbone >= 100 then
		nProbone = 100;
	end
	if n<=nProbone	then
		local m = random(1,100);
		local nProbtwo = tInitAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10;
		if nProbtwo >= 50 then
			nProtwo = 50;
		end
		if m <= nProbtwo then
			local x = random(1,100);
			local nProbthree = tInitAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10;
			if nProbthree >= 20 then
				nProbthree = 20;
			end
			if x<=nProbthree then 
				local nTotalOne = 0;  --各lv的总和，用于随机。计算方式为原始表(tAttri)加上相应的权值表
				local nTotalTwo = 0;
				local nTotalThree = 0;
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i]+tLvProb[nStone][i-8];
						nTotalThree = nTotalThree+tAttri[attrithree][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i];
						nTotalThree = nTotalThree+tAttri[attrithree][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local mlv = random(1,nTotalTwo);
				local xlv = random(1,nTotalThree);
				local ilv = 9; --记录概率随机到的位置,初始为9对应于tInitAttri表中的第9位置即lv1
				local jlv = 9;
				local klv = 9;
				local nLvOne = 0; --累加值，判断随机数落在哪一个等级区间
				local nLvTwo = 0;
				local nLvThree = 0;
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
				for j=9,15 do
					nLvTwo = nLvTwo+tInitAttri[attritwo][j];
					if mlv <= nLvTwo then
						jlv = j;
						break;
					end
				end
				for k=9,15 do
					nLvThree = nLvThree+tInitAttri[attrithree][k];
					if xlv <= nLvThree then
						klv = k;
						break;
					end
				end
							
				if DelItem(2,1,1152,1)==1 then --楚国神兵匣
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local p=random(1,14);
					 	local add_flog = AddItem(tRandomW[p][2],tRandomW[p][3],tRandomW[p][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					 	end					 							
					else
						nroute = GetPlayerRoute();
					  local add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]); 
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					 	end	
					end 	
				end				
			else			--第三项属性随机失败	
				local nTotalOne = 0;  --各lv的总和，用于随机
				local nTotalTwo = 0;
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
						nTotalTwo = nTotalTwo+tAttri[attritwo][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local mlv = random(1,nTotalTwo);
				local ilv = 9; --记录概率随机到的位置,初始为9对应于tInitAttri表中的第9位置即lv1
				local jlv = 9;
				local nLvOne = 0; --累加值，判断随机数落在哪一个等级区间
				local nLvTwo = 0;
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
				for j=9,15 do
					nLvTwo = nLvTwo+tInitAttri[attritwo][j];
					if mlv <= nLvTwo then
						jlv = j;
						break;
					end
				end
										
				if DelItem(2,1,1152,1)==1 then --楚国神兵匣
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local q=random(1,14);
					 	local add_flog = AddItem(tRandomW[q][2],tRandomW[q][3],tRandomW[q][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					 	end							
					else
						nroute = GetPlayerRoute();
					  local add_flog = 0;
					  if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --棍少
					  	add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					  else	
					  	add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					 	end
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					 	end					  
					end 					
				end						
			end				--第三项属性概率
					
		else        --第二项属性随机失败
				local nTotalOne = 0;  --各lv的总和，用于随机
				if nStone > 0 and nStone <15 then 
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i]+tLvProb[nStone][i-8];
					end
				elseif nStone == 0 then
					for i=9,15 do
						nTotalOne = nTotalOne+tAttri[attrione][i];
					end					
				end
				local nlv = random(1,nTotalOne);
				local ilv = 9; --记录概率随机到的位置,初始为9对应于tInitAttri表中的第9位置即lv1
				local nLvOne = 0; --累加值，判断随机数落在哪一个等级区间
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
												
			if DelItem(2,1,1152,1)==1 then --楚国神兵匣
				if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					local s=random(1,14);
					local add_flog = AddItem(tRandomW[s][2],tRandomW[s][3],tRandomW[s][4],1,1,ilv-8,tInitAttri[attrione][2]);
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					end													
				else
					nroute = GetPlayerRoute();
					local add_flog = 0;
					if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --棍少
					  add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2]);
					else	
					  add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2]);
					end					
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
					end						
				end 				
			end				
		end         --第二项属性概率	
	
	else          --第一项属性随机失败
		if DelItem(2,1,1152,1)==1 then --楚国神兵匣
			if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
				local r=random(1,14);
				local add_flog = AddItem(tRandomW[r][2],tRandomW[r][3],tRandomW[r][4],1);
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
				end					
			else
				nroute = GetPlayerRoute();
				local add_flog = 0;
				if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --棍少
					add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1);
				else	
					add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1);
				end					
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("H閜 Th莕 Binh S? qu鑓: "..GetName().."Nh薾 Th莕 binh th蕋 b筰, v? tr? th蕋 b筰: "..add_flog);
				end			
			end 						
		end				
	end	          --第一项属性概率
end        

function weapon_finish()
	Msg2Player("Huynh m? Th莕 binh H筽, nh薾 頲 1 Th莕 binh");
	SetTask(TASK_PROB_ONE,0);
	SetTask(TASK_PROB_TWO,0);
	SetTask(TASK_PROB_THREE,0);
	SetTaskTemp(TT_ATTRI_ONE,0);
	SetTaskTemp(TT_ATTRI_TWO,0);
	SetTaskTemp(TT_ATTRI_THREE,0);
end

function nothing()

end                                                                                         