--�������ϻ�ű�
--by vivi 
--07/12/2007

--��ʱ����
TT_ATTRI_ONE = 180; --��¼��һ������
TT_ATTRI_TWO = 181; --��¼�ڶ�������
TT_ATTRI_THREE = 182; --��¼����������
TT_ATTRI_TYPE = 183; --��¼���ѡ�����������
TT_SHAOLIN_WEAPON = 184; --��¼�����·��Ϊ����ʱ��ѡ����������ͣ������߹���

--�������
TASK_PROB_ONE = 2385;  --��¼����һ�Ͻ��������ʯ�Ĵ���
TASK_PROB_TWO = 2386;  --��¼���Զ��Ͻ��������ʯ�Ĵ���
TASK_PROB_THREE = 2387; --��¼�������Ͻ��������ʯ�Ĵ���

--�������ʯÿ����Ҫ�ύ�Ŀ���
tTiandiNum = {1,6,20};

--���table��Ҫ�Ƕ�Ӧ�����tAttri�������������ӵڼ��ʼ����4����Ҳ��Ҫ��
tAttriNum = {1,13,25,40};

--����table �޸Ĵ˱�һ��Ҫ�޸�give_weapon()�µ�tInitAttri���м�
tAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 --������ id �����ɹ����� ������͵ȼ� ��͵ȼ���ֵ ÿ������ ��ߵȼ���ֵ �ٷֱȱ�־ ���γ��ָ���(���Ǵ�1lv��ʼ�Ĳ�0) 
					 --�ٷֱȱ�־��0��ʾ���������ֵ�ǰٷֱȵģ�1��ʾ���������ֵ���ǰٷֱȵġ�
--�������������� 12��
	{"Ngo�i k�ch + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"N�i k�ch t�ng ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"T� l� xu�t chi�u t�ng",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S�t th��ng t�ng ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph� ph�ng th� ��i ph��ng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"T�n c�ng t�ng ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph�t huy c�ng k�ch l�n nh�t",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"T� l� ��nh ph�m vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh ngo�i l�n nh�t t�ng ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh ngo�i th�p nh�t t�ng ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh n�i l�n nh�t t�ng",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh n�i th�p nh�t t�ng ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--�������������� 12�� 
	{"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"Khi�n ��i ph��ng gi�m Linh ho�t ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T� l� nh�t ��nh l�m ��i ph��ng kh� huy�t hao t�n",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"T� l� nh�t ��nh l�m ��i ph��ng ch�n nguy�n hao t�n",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C�ng k�ch khi�n ngo�i ph�ng c�a ��i ph��ng gi�m",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C�ng k�ch khi�n n�i l�c c�a ��i ph��ng gi�m ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T�n c�ng l�m ��i ph��ng hao t�n n�i l�c",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--��ǿ���������� 15��
	{"H� g�c ��i ph��ng sinh l�c h�i ph�c ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"T� l� m�i m�n v� kh� gi�m",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"S�c l�c t�ng",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"��nh t�p trung t�ng",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Ch�nh x�c t�ng",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G�n c�t t�ng",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"S�c m�ng t�ng",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th�n ph�p t�ng",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho�t t�ng",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"N�i c�ng t�ng ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh l�c t�i �a t�ng",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"N�i l�c + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T�t c� thu�c t�nh t�ng",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"H� tr� t�n c�ng  duy tr� ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"H� tr� ph�ng th� duy tr� ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};
	
--���Եȼ�����Ȩֵ��1-7
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
	
	
--76������table
tWeapon = {
	[2]= {"C� ��nh",0,3,64,200},
	[3]= {"A La H�n Tr��ng",0,8,97,100},
	[4]= {"V�n Nh�n",0,0,14,220},
	[6]= {"M�n Thi�n Hoa V�",0,1,53,130},	
	[8]= {"H�a Tinh",0,2,36,90},	
	[9]= {"Hi Nh�n C�m",0,10,75,140},
	[11]= {"V�n Nh�n",0,0,14,220},
	[12]= {"Li�t Di�m",0,5,40,200},
	[14]= {"H�a Tinh",0,2,36,90},	
	[15]= {"Th�n H�nh",0,9,86,130},	
	[17]= {"��i H�o L�i Th��ng",0,6,108,130},	
	[18]= {"Th�n Cung",0,4,119,130},
	[20]= {"L�ng Phong",0,7,12,200},
	[21]= {"M�nh h�",0,11,12,200},
	};

--�����76������table
tRandomW = {
	[1]= {"C� ��nh",0,3,64,200},
	[2]= {"A La H�n Tr��ng",0,8,97,100},
	[3]= {"V�n Nh�n",0,0,14,220},
	[4]= {"M�n Thi�n Hoa V�",0,1,53,130},	
	[5]= {"H�a Tinh",0,2,36,90},	
	[6]= {"Hi Nh�n C�m",0,10,75,140},
	[7]= {"V�n Nh�n",0,0,14,220},
	[8]= {"Li�t Di�m",0,5,40,200},
	[9]= {"H�a Tinh",0,2,36,90},	
	[10]= {"Th�n H�nh",0,9,86,130},	
	[11]= {"��i H�o L�i Th��ng",0,6,108,130},	
	[12]= {"Th�n Cung",0,4,119,130},
	[13]= {"L�ng Phong",0,7,12,200},
	[14]= {"M�nh h�",0,11,12,200},
	};
		
function GetPlayerSex()	
	local mySex -- ������ʾ�����Ա���ַ�
	if (GetSex() == 1) then
		mySex = "Thi�u hi�p";
	elseif (GetSex() == 2) then
		mySex = "C� n��ng";
	end;
	return mySex;
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"cancel","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"cancel","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end

function OnUse()
	local strtab = {
	"R�t cu�c l� lo�i th�n binh g� ��y?.../choose_attribute",
	"�i cha, th�n binh v� ch�, ch�a th� giao h�p ra./nothing"
	}
  Say("Th�n Binh xu�t h�p �t ph�i c� c�c thu�c t�nh"..GetPlayerSex().."H�y ch�n ��c s�c Th�n binh mong mu�n.",getn(strtab),strtab);
end

function choose_attribute()	
	local strtab = {
	"Thu�c t�nh Th�n Binh 1 /#attri_type()",
	"�i cha, t�m th�i ch�a ngh� ra./nothing",
	}
	
	Say("�"..GetPlayerSex().."T�p trung tinh th�n, h�y ��t t�t c� t�m ni�m c�a m�nh v�o th�n binh.",getn(strtab),strtab);
end

function attri_type()
	local strtab = {
	"Lo�i t�ng c�ng k�ch/#choose_attri(1)",
	"Lo�i l�m gi�m s�c chi�n ��u ��i ph��ng/#choose_attri(2)",
	"Lo�i t�ng n�ng l�c b�n th�n/#choose_attri(3)",
	"Ta ph�i suy ngh� k� ��./cancel"
	}
	Say("�"..GetPlayerSex().."Hy v�ng thu�c t�nh Th�n binh 1 xu�t hi�n ",getn(strtab),strtab);
end

function choose_attri(tNum)
	SetTaskTemp(TT_ATTRI_TYPE,tNum); --�洢tNum��������õ��������
	dia_page(0);
end	

function dia_page(nPage)
	local page_num = 7;   --ÿҳ�Ի���ʾ�������� 
	local dia_attri = {};  --��ʾ�Ի���
	local attri_start = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]-1;	
	local total_num = tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)+1]-tAttriNum[GetTaskTemp(TT_ATTRI_TYPE)]; --���������ܵ���Ŀ
	local attri_remain_num = total_num - (nPage*page_num);	--��һҳ��ʣ�¶�����������
	local num_this_dia = 7;
	if attri_remain_num <= 7 then
		num_this_dia = attri_remain_num;
	end
	for i=1,num_this_dia do                                                                                                                                   
		if tAttri[attri_start+(page_num*nPage)+i][8] == 0 then                                                                                                     
			tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi� tr� thu�c t�nh: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."%-"..tAttri[attri_start+(page_num*nPage)+i][7].."%/#get_attri("..(attri_start+(page_num*nPage)+i)..")");        
		else                                                                                                                                                                         	
	 		tinsert(dia_attri,tAttri[attri_start+(page_num*nPage)+i][1].." gi� tr� thu�c t�nh: "..floor(tAttri[attri_start+(page_num*nPage)+i][5]/2).."-"..tAttri[attri_start+(page_num*nPage)+i][7].."/#get_attri("..(attri_start+(page_num*nPage)+i)..")");                                                         
		end                                                                                                                                                                       	
	end
	if nPage ~= 0 then
		tinsert(dia_attri,"Trang tr��c/#dia_page("..(nPage-1)..")");
	end
	if attri_remain_num > page_num then
		tinsert(dia_attri,"Trang k�/#dia_page("..(nPage+1)..")");
	end
	if GetTaskTemp(TT_ATTRI_ONE) == 0 then
		tinsert(dia_attri,"Tr� v� trang ch�n lo�i thu�c t�nh./attri_type");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then
		tinsert(dia_attri,"Tr� v� trang ch�n lo�i thu�c t�nh./#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))");
	elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then
		tinsert(dia_attri,"Tr� v� trang ch�n lo�i thu�c t�nh./#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))");
	end	
	Say("Xin h�y ch�n m�t thu�c t�nh �i.",
		getn(dia_attri),
		dia_attri
		)                                                                                                                                                                             
end 
	
function get_attri(aType)
	if aType ~= 0 then                                                                                                                   
		if GetTaskTemp(TT_ATTRI_ONE) == aType or GetTaskTemp(TT_ATTRI_TWO) == aType or GetTaskTemp(TT_ATTRI_THREE) == aType then 
			if GetTaskTemp(TT_ATTRI_TWO) == 0 then
				Talk(1,"#make_attri(1,GetTaskTemp(TT_ATTRI_ONE))","Huynh �� ch�n qua thu�c t�nh n�y r�i, h�y ch�n thu�c t�nh kh�c.");                                        
			else
				Talk(1,"#make_attri(2,GetTaskTemp(TT_ATTRI_TWO))","Huynh �� ch�n qua thu�c t�nh n�y r�i, h�y ch�n thu�c t�nh kh�c.");
			end
		else                                                                                                                                    
			if GetTaskTemp(TT_ATTRI_ONE) == 0 then                                                                                                 
				Say("C�c h� ch�n thu�c t�nh l� <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"��ng �/#make_attri(1,"..aType..")",
					"Ch�n sai r�i. Xin ch�n l�i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) == 0 then                                                                                                 
				Say("C�c h� ch�n thu�c t�nh l� <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"��ng �/#make_attri(2,"..aType..")",
					"Ch�n sai r�i. Xin ch�n l�i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                           
			elseif GetTaskTemp(TT_ATTRI_ONE) ~= 0 and GetTaskTemp(TT_ATTRI_TWO) ~= 0 and GetTaskTemp(TT_ATTRI_THREE) == 0 then                                                                                                                 
				Say("C�c h� ch�n thu�c t�nh l� <color=yellow>"..tAttri[aType][1].."<color>",
					2,
					"��ng �/#make_attri(3,"..aType..")",
					"Ch�n sai r�i. Xin ch�n l�i /#choose_attri("..GetTaskTemp(TT_ATTRI_TYPE)..")"
					);                              
			end                                                                                                                                   
		end                                                                                                                                     
	end	                                          
end

function make_attri(att_num,nType)
	local strtab = {
	"Lo�i t�ng c�ng k�ch/#choose_attri(1)",
	"Lo�i l�m gi�m s�c chi�n ��u ��i ph��ng/#choose_attri(2)",
	"Lo�i t�ng n�ng l�c b�n th�n/#choose_attri(3)",
	"Ta ph�i suy ngh� k� ��./cancel"
	}
	if att_num == 1 then
		SetTaskTemp(TT_ATTRI_ONE,nType);
		Say("�"..GetPlayerSex().."Hy v�ng xu�t hi�n thu�c t�nh Th�n binh 2",getn(strtab),strtab);
	elseif att_num == 2 then
		SetTaskTemp(TT_ATTRI_TWO,nType);
		Say("�"..GetPlayerSex().."Hy v�ng xu�t hi�n thu�c t�nh Th�n binh 3",getn(strtab),strtab);
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
	
	if tAttri[attrione][8] == 0 then   --�ж��Ƿ�Ҫ�Ӱٷֺţ�%��
		nstr=nstr.."B�n ch�n thu�c t�nh 1: <color=yellow>"..tAttri[attrione][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";
	else	
		nstr=nstr.."B�n ch�n thu�c t�nh 1: <color=yellow>"..tAttri[attrione][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";
	end
	if tAttri[attritwo][8] == 0 then
		nstr=nstr.."thu�c t�nh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";
	else
		nstr=nstr.."thu�c t�nh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";
	end
	if tAttri[attrithree][8] == 0 then
		nstr=nstr.."thu�c t�nh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.";
	else
		nstr=nstr.."thu�c t�nh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu�c t�nh c� gi� tr�: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.";
	end
		
	Say("�"..nstr,
		2,
		"Ta mu�n v� trang ch� Th�n binh /main",
		"Ta ch�a ch�n xong, c�n ph�i suy ngh܅/cancel"
		);
end

function main()
	local strtab = {
		"Ta �� ngh� ra th�n binh nh� th� n�o r�i, giao ra th�i!/confirm_weapon",
		"X�c su�t th�nh c�ng ch� t�o Th�n binh/weapon_probability",
		"Ta mu�n d�ng Thi�n ��a Huy�n Ho�ng Th�ch n�ng cao linh kh� c�a Th�n binh./use_stone",
		"�i cha, th�n binh v� ch�, ch�a th� giao h�p ra./cancel"
		}
	Say("Th�n Binh xu�t h�p �t ph�i c� c�c thu�c t�nh"..GetPlayerSex().."B�n mu�n giao ra h�p Th�n Binh kh�ng? ",getn(strtab),strtab);
end

function confirm_weapon()
	if GetPlayerRoute() == 2 then
		Say("C�c h� mu�n d�ng lo�i h�p Th�n binh n�o?",
			3,
			"�ao/#shaolin_weapon(1)",
			"C�n/#shaolin_weapon(2)",
			"Sau n�y h�y t�nh!/cancel"
			);
	else			
		Say("C�c h� mu�n giao ra h�p Th�n binh ch�?",
			2,
			"���c/give_weapon",
			"Sau n�y h�y t�nh!/cancel"
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
	                                                                                                                                      
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10;  --��ȡ��һ�����Ը���
	if probone >= 100 then
		probone = 100;
	end
	if tAttri[attrione][8] == 0 then   --�ж��Ƿ�Ҫ�Ӱٷֺţ�%��                                                                                                        
		nstr=nstr.."thu�c t�nh Th�n binh l�: <color=yellow>"..tAttri[attrione][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probone.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attrione][5]/2).."%-"..tAttri[attrione][7].."%<color>.\n";     
	else	                                                                                                                                     
		nstr=nstr.."thu�c t�nh Th�n binh l�: <color=yellow>"..tAttri[attrione][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probone.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attrione][5]/2).."-"..tAttri[attrione][7].."<color>.\n";       
	end
		
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10;  --��ȡ�ڶ������Ը���
	if probtwo >= 50 then
		probtwo = 50;
	end
	if tAttri[attritwo][8] == 0 then           --�ж��Ƿ�Ҫ�Ӱٷֺţ�%��                                                                                                
		nstr=nstr.."thu�c t�nh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probtwo.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attritwo][5]/2).."%-"..tAttri[attritwo][7].."%<color>.\n";             
	else                                                                                                                                       
		nstr=nstr.."thu�c t�nh 2: <color=yellow>"..tAttri[attritwo][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probtwo.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attritwo][5]/2).."-"..tAttri[attritwo][7].."<color>.\n";               
	end                                                                                                                                        
	
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --��ȡ���������Ը���
	if probthree >= 20 then
		probthree = 20;
	end
	if tAttri[attrithree][8] == 0 then                                                                                                       
		nstr=nstr.."thu�c t�nh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probthree.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attrithree][5]/2).."%-"..tAttri[attrithree][7].."%<color>.\n"; 
	else                                                                                                                                       
		nstr=nstr.."thu�c t�nh 3: <color=yellow>"..tAttri[attrithree][1].."<color>, thu�c t�nh x�c su�t th�nh c�ng: <color=yellow>"..probthree.."%<color>, thu�c t�nh t�ng: <color=yellow>"..floor(tAttri[attrithree][5]/2).."-"..tAttri[attrithree][7].."<color>.\n";   
	end
	
	Talk(1,"main","�"..nstr.."<color=yellow> Xin ch� �, ch� khi thu�c t�nh 1 th�nh c�ng th� m�i ng�u nhi�n c� thu�c t�nh 2.<color>" );     

end                                                                                                                                 

function use_stone()
	Say("N�u l�y Thi�n ��a Huy�n Ho�ng Th�ch ��t h�p Th�n binh s� l�m t�ng thu�c t�nh x�c su�t th�n c�ng hi�n t�i c�a Th�n Binh. <color=yellow> M�i l�n <color>��t Thi�n ��a Huy�n Ho�ng Th�ch t�ng <color=yellow>10%<color> x�c su�t th�nh c�ng, sao h�?",
		4,
		"M�t l�n ��t 1Thi�n ��a Huy�n Ho�ng Th�ch, l�m t�ng thu�c t�nh x�c su�t th�nh c�ng, c� th� t�ch l�y �� t�ng 100## x�c su�t th�nh c�ng./#is_probability(1)",
		"M�t l�n ��t 6 Thi�n ��a Huy�n Ho�ng Th�ch, l�m t�ng thu�c t�nh x�c su�t th�nh c�ng th� 2, c� th� t�ch l�y �� t�ng 50%./#is_probability(2)",
		"M�t l�n ��t 20 Thi�n ��a Huy�n Ho�ng Th�ch, l�m t�ng thu�c t�nh x�c su�t th�nh c�ng th� 3, c� th� t�ch l�y �� t�ng 20##/#is_probability(3)",
		"Ta kh�ng c� d� ��nh t�ng linh kh� Th�n binh./main"
		)
end   

function is_probability(aType)
  local attrione = GetTaskTemp(TT_ATTRI_ONE);
  local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --��ȡ��һ�����Ը���
	if probone >= 100 then
		probone = 100;
	end
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);
	local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --��ȡ�ڶ������Ը���
	if probtwo >= 50 then
		probtwo = 50;
	end
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);
	local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --��ȡ���������Ը���
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
		Talk(1,"use_stone","Tr��c ti�n ph�i t�ng thu�c t�nh x�c su�t ��n m�c cao nh�t: <color=yellow>"..nProbability.."%<color>, n�u ��t th�m c�ng kh�ng c� t�c d�ng.");
	else
		Say("Tr��c ti�n ph�i t�ng thu�c t�nh x�c su�t ��n m�c cao nh�t: <color=yellow>"..nProbability.."%<color>. b�n t�nh m�t l�n ��t <color=yellow>"..tTiandiNum[aType].."<color> Thi�n ��a Huy�n Ho�ng Th�ch l�m t�ng thu�c t�nh x�c su�t Th�n binh, x�c nh�n ��t kh�ng? ",
			2,
			"��ng �/#add_probability("..aType..")",
			"Kh�ng, t�i h� kh�ng ��nh l�m t�ng linh kh� cho Th�n binh/main"
			);
	end
end

--�������ʯ
function add_probability(pType)
	local strtab = {
		"Ta mu�n v� trang tr��c �� l�m t�ng linh kh� cho Th�n binh/use_stone",
		"Ta mu�n v� trang ch� Th�n binh /main"
		};
		
	if pType == 1 then
		if DelItem(2,1,1151,1) == 1 then
			SetTask(TASK_PROB_ONE,GetTask(TASK_PROB_ONE)+1);
			local attrione = GetTaskTemp(TT_ATTRI_ONE);
  		local probone	= tAttri[attrione][3]+GetTask(TASK_PROB_ONE)*10; --��ȡ��һ�����Ը���
			if probone >= 100 then
				probone = 100;
			end			
			Say("C�c h� 1 l�n ��t 1 Thi�n ��a Huy�n Ho�ng Th�ch, thu�c t�nh x�c su�t th�nh c�ng t�ng: <color=yellow>"..probone.."%<color>",
				getn(strtab),
				strtab
				);
		else
			Talk(1,"main","C�c h� kh�ng c� Thi�n ��a Huy�n Ho�ng Th�ch . ");
		end
	elseif pType == 2 then
		if DelItem(2,1,1151,6) == 1 then
			SetTask(TASK_PROB_TWO,GetTask(TASK_PROB_TWO)+1);
			local attritwo = GetTaskTemp(TT_ATTRI_TWO);
			local probtwo = tAttri[attritwo][3]*0.50+GetTask(TASK_PROB_TWO)*10; --��ȡ�ڶ������Ը���
			if probtwo >= 50 then
				probtwo = 50;
			end
			Say("C�c h� 1 l�n ��t 6 Thi�n ��a Huy�n Ho�ng Th�ch, thu�c t�nh x�c su�t th�nh c�ng lo�i 2 t�ng: <color=yellow>"..probtwo.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh�ng �� 6 Thi�n ��a Huy�n Ho�ng Th�ch.");
	  end
	elseif pType == 3 then
		if DelItem(2,1,1151,20) == 1 then
			SetTask(TASK_PROB_THREE,GetTask(TASK_PROB_THREE)+1);
			local attrithree = GetTaskTemp(TT_ATTRI_THREE);
			local probthree = tAttri[attrithree][3]*0.25+GetTask(TASK_PROB_THREE)*10; --��ȡ���������Ը���
			if probthree >= 20 then
				probthree = 20;
			end			
			Say("C�c h� 1 l�n ��t 20 Thi�n ��a Huy�n Ho�ng Th�ch, x�c su�t th�nh c�ng loai 3 t�ng: <color=yellow>"..probthree.."%<color>",
				getn(strtab),
				strtab
				);				
	  else
	  	Talk(1,"main","Huynh kh�ng �� 20 Thi�n ��a Huy�n Ho�ng Th�ch.");
	  end			
	end	
end

function give_weapon()
	local attrione = GetTaskTemp(TT_ATTRI_ONE);                                                                                        
	local attritwo = GetTaskTemp(TT_ATTRI_TWO);                                                                                       
	local attrithree = GetTaskTemp(TT_ATTRI_THREE);	
	local nroute=0;   --��¼��ҵ�����
	local nStone = GetTask(TASK_PROB_ONE)+GetTask(TASK_PROB_TWO)+GetTask(TASK_PROB_THREE); --һ��Ͷ���������ʯ�Ĵ��� ���Ϊ14
		
	--��ʼû��������ʯ�ı� ��tAttri��һ��
	local tInitAttri = {--   1		 2     3             4            5          6          7            8         9-15 
					 						--������ id �����ɹ����� ������͵ȼ� ��͵ȼ���ֵ ÿ������ ��ߵȼ���ֵ �ٷֱȱ�־ ���γ��ָ���(���Ǵ�1lv��ʼ�Ĳ�0) 
					 						--�ٷֱȱ�־��0��ʾ���������ֵ�ǰٷֱȵģ�1��ʾ���������ֵ���ǰٷֱȵġ�
	--�������������� 12��
	{"Ngo�i k�ch + ",368,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"N�i k�ch t�ng ",369,25,3,3,3,15,0,0,0,9489,400,100,10,1},
	{"T� l� xu�t chi�u t�ng",370,25,4,2,1,5,0,0,0,0,9789,200,10,1},
	{"S�t th��ng t�ng ",372,25,4,30,30,150,1,0,0,0,9789,200,10,1},      
	{"Ph� ph�ng th� ��i ph��ng",362,40,5,4,3,10,0,0,0,0,0,9895,100,5},
	{"T�n c�ng t�ng ",77,60,1,10,5,40,0,2250,2250,2250,2250,600,300,100},
	{"Ph�t huy c�ng k�ch l�n nh�t",346,60,2,5,3,20,0,0,3500,3500,2000,600,300,100},
	{"T� l� ��nh ph�m vi",335,80,1,6,4,30,0,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh ngo�i l�n nh�t t�ng ",65,80,1,8,7,50,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh ngo�i th�p nh�t t�ng ",66,80,1,6,4,30,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh n�i l�n nh�t t�ng",67,80,1,10,5,40,1,2000,1500,1500,1500,1500,1000,1000},
	{"V� kh� ��nh n�i th�p nh�t t�ng ",68,80,1,7,3,25,1,2000,1500,1500,1500,1500,1000,1000},
--�������������� 12�� 
	{"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",348,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",349,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",350,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"Khi�n ��i ph��ng gi�m Linh ho�t ",351,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",352,60,2,10,5,35,1,0,3500,3500,2000,600,300,100},
	{"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",353,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",354,60,1,10,15,100,1,2250,2250,2250,2250,600,300,100},
	{"T� l� nh�t ��nh l�m ��i ph��ng kh� huy�t hao t�n",53,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"T� l� nh�t ��nh l�m ��i ph��ng ch�n nguy�n hao t�n",54,60,4,5,5,20,0,0,0,0,8000,1700,200,100},
	{"C�ng k�ch khi�n ngo�i ph�ng c�a ��i ph��ng gi�m",382,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"C�ng k�ch khi�n n�i l�c c�a ��i ph��ng gi�m ",383,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T�n c�ng l�m ��i ph��ng hao t�n n�i l�c",49,40,5,2,2,6,0,0,0,0,0,9895,100,5},
--��ǿ���������� 15��
	{"H� g�c ��i ph��ng sinh l�c h�i ph�c ",333,80,1,30,25,180,1,2000,1500,1500,1500,1500,1000,1000},
	{"T� l� m�i m�n v� kh� gi�m",9,80,1,10,5,40,0,2000,1500,1500,1500,1500,1000,1000},
	{"S�c l�c t�ng",110,80,1,40,30,220,1,2000,1500,1500,1500,1500,1000,1000},
	{"��nh t�p trung t�ng",342,60,1,3,2,15,0,2250,2250,2250,2250,600,300,100},
	{"Ch�nh x�c t�ng",337,60,1,30,20,150,1,2250,2250,2250,2250,600,300,100},
	{"G�n c�t t�ng",357,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"S�c m�ng t�ng",358,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Th�n ph�p t�ng",359,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Linh ho�t t�ng",360,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"N�i c�ng t�ng ",361,60,1,6,4,30,1,2250,2250,2250,2250,600,300,100},
	{"Sinh l�c t�i �a t�ng",79,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"N�i l�c + ",80,40,1,3,2,15,0,2645,2250,2250,2250,500,100,5},
	{"T�t c� thu�c t�nh t�ng",367,25,3,4,4,20,1,0,0,9489,400,100,10,1},
	{"H� tr� t�n c�ng  duy tr� ",41,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},
	{"H� tr� ph�ng th� duy tr� ",42,40,1,5,5,35,0,2645,2250,2250,2250,500,100,5},	
	};	
	
	if Zgc_pub_goods_add_chk(1,220) ~= 1 then   --�ռ为�ؼ�� ȡ��������
		return
	end
	
	--����Ͷ�������ʯ�������ϲ�ͬ��lv����Ȩֵ
	if nStone == 1 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 2 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end		
	elseif nStone == 3 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 4 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 5 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 6 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 7 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 8 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 9 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 10 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 11 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 12 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone == 13 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
					tInitAttri[i][j+8] = tInitAttri[i][j+8]+tLvProb[nStone][j];
				end
			end
		end
	elseif nStone >= 14 then
		for i=1,getn(tInitAttri) do
			for j=1,7 do
				if tInitAttri[i][j+8] ~= 0 then  --�����lv==0 �򲻼���Ȩֵ
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
				local nTotalOne = 0;  --��lv���ܺͣ�������������㷽ʽΪԭʼ��(tAttri)������Ӧ��Ȩֵ��
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
				local ilv = 9; --��¼�����������λ��,��ʼΪ9��Ӧ��tInitAttri���еĵ�9λ�ü�lv1
				local jlv = 9;
				local klv = 9;
				local nLvOne = 0; --�ۼ�ֵ���ж������������һ���ȼ�����
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
							
				if DelItem(2,1,1152,1)==1 then --�������ϻ
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local p=random(1,14);
					 	local add_flog = AddItem(tRandomW[p][2],tRandomW[p][3],tRandomW[p][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					 	end					 							
					else
						nroute = GetPlayerRoute();
					  local add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2],klv-8,tInitAttri[attrithree][2]); 
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					 	end	
					end 	
				end				
			else			--�������������ʧ��	
				local nTotalOne = 0;  --��lv���ܺͣ��������
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
				local ilv = 9; --��¼�����������λ��,��ʼΪ9��Ӧ��tInitAttri���еĵ�9λ�ü�lv1
				local jlv = 9;
				local nLvOne = 0; --�ۼ�ֵ���ж������������һ���ȼ�����
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
										
				if DelItem(2,1,1152,1)==1 then --�������ϻ
					if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					 	local q=random(1,14);
					 	local add_flog = AddItem(tRandomW[q][2],tRandomW[q][3],tRandomW[q][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]);
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					 	end							
					else
						nroute = GetPlayerRoute();
					  local add_flog = 0;
					  if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --����
					  	add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					  else	
					  	add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2],jlv-8,tInitAttri[attritwo][2]); 
					 	end
					 	if add_flog == 1 then
					 		weapon_finish();
					 	else
					 		WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					 	end					  
					end 					
				end						
			end				--���������Ը���
					
		else        --�ڶ����������ʧ��
				local nTotalOne = 0;  --��lv���ܺͣ��������
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
				local ilv = 9; --��¼�����������λ��,��ʼΪ9��Ӧ��tInitAttri���еĵ�9λ�ü�lv1
				local nLvOne = 0; --�ۼ�ֵ���ж������������һ���ȼ�����
				for i=9,15 do
					nLvOne = nLvOne+tInitAttri[attrione][i];
					if nlv <= nLvOne then
						ilv = i;
						break;
					end
				end
												
			if DelItem(2,1,1152,1)==1 then --�������ϻ
				if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
					local s=random(1,14);
					local add_flog = AddItem(tRandomW[s][2],tRandomW[s][3],tRandomW[s][4],1,1,ilv-8,tInitAttri[attrione][2]);
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					end													
				else
					nroute = GetPlayerRoute();
					local add_flog = 0;
					if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --����
					  add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1,1,ilv-8,tInitAttri[attrione][2]);
					else	
					  add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,ilv-8,tInitAttri[attrione][2]);
					end					
					if add_flog == 1 then
						weapon_finish();
					else
					 	WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
					end						
				end 				
			end				
		end         --�ڶ������Ը���	
	
	else          --��һ���������ʧ��
		if DelItem(2,1,1152,1)==1 then --�������ϻ
			if GetPlayerRoute() == 0 or GetPlayerRoute() == 1 or GetPlayerRoute() == 5 or GetPlayerRoute() == 7 or GetPlayerRoute() == 10 or GetPlayerRoute() == 13 or GetPlayerRoute() == 16 or GetPlayerRoute() == 19 then 
				local r=random(1,14);
				local add_flog = AddItem(tRandomW[r][2],tRandomW[r][3],tRandomW[r][4],1);
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
				end					
			else
				nroute = GetPlayerRoute();
				local add_flog = 0;
				if nroute == 2 and GetTaskTemp(TT_SHAOLIN_WEAPON) == 2 then --����
					add_flog = AddItem(tWeapon[12][2],tWeapon[12][3],tWeapon[12][4],1);
				else	
					add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1);
				end					
				if add_flog == 1 then
					weapon_finish();
				else
					WriteLog("H�p Th�n Binh S� qu�c: "..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
				end			
			end 						
		end				
	end	          --��һ�����Ը���
end        

function weapon_finish()
	Msg2Player("Huynh m� Th�n binh H�p, nh�n ���c 1 Th�n binh");
	SetTask(TASK_PROB_ONE,0);
	SetTask(TASK_PROB_TWO,0);
	SetTask(TASK_PROB_THREE,0);
	SetTaskTemp(TT_ATTRI_ONE,0);
	SetTaskTemp(TT_ATTRI_TWO,0);
	SetTaskTemp(TT_ATTRI_THREE,0);
end

function nothing()

end                                                                                         