--ͬ��ϻ�ű�
--by vivi
--08/02/2007

--��ʱ����
TT_TONGXIN_ATTRI = 185; --��¼��һ������

--����һ�б�
tAttriOne = {
	{"T�ng ngo�i c�ng 6%",368,4},
	{"T�ng N�i c�ng 6%",369,4},
	{"T�ng t�n th��ng 78",372,5},
	{"Ti�p t�c k�o d�i th�i gian c�ng k�ch h� tr� 30%",41,6},
	{"K�o d�i th�i gian h� tr� ph�ng ng� 30%",42,6}
	}

--���Զ����������б�
tAttriTwo = {--������  ����id  lv1-lv7�ĸ���		
	{"Ngo�i k�ch + ",368,0,0,35,70,100,0,0},
	{"N�i k�ch t�ng ",369,0,0,35,70,100,0,0},
	{"S�t th��ng t�ng ",372,0,0,35,70,100,0,0},
	{"T�n c�ng k�m ��c s�t",363,20,40,60,80,100,0,0},
	{"Ph� ph�ng th� ��i ph��ng",362,0,0,0,0,100,0,0},
	{"T�n c�ng t�ng ",77,0,0,35,70,100,0,0},
	{"Ph�t huy c�ng k�ch l�n nh�t",346,0,0,35,70,100,0,0},
	{"T� l� ��nh ph�m vi",335,0,0,35,70,100,0,0},
	{"V� kh� ��nh ngo�i l�n nh�t t�ng ",65,0,0,35,70,100,0,0},
	{"V� kh� ��nh ngo�i th�p nh�t t�ng ",66,0,0,35,70,100,0,0},
	{"V� kh� ��nh n�i l�n nh�t t�ng",67,0,0,35,70,100,0,0},
	{"V� kh� ��nh n�i th�p nh�t t�ng ",68,0,0,35,70,100,0,0},
	{"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",348,0,0,35,70,100,0,0},
	{"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",349,0,0,35,70,100,0,0},
	{"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",350,0,0,35,70,100,0,0},
	{"Khi�n ��i ph��ng gi�m Linh ho�t ",351,0,0,35,70,100,0,0},
	{"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",352,0,0,35,70,100,0,0},
	{"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",353,0,0,35,70,100,0,0},
	{"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",354,0,0,35,70,100,0,0},
	{"T� l� nh�t ��nh l�m ��i ph��ng kh� huy�t hao t�n",53,0,0,0,0,50,100,0},
	{"T� l� nh�t ��nh l�m ��i ph��ng ch�n nguy�n hao t�n",54,0,0,0,0,50,100,0},
	{"C�ng k�ch khi�n ngo�i ph�ng c�a ��i ph��ng gi�m",382,20,40,60,80,100,0,0},
	{"C�ng k�ch khi�n n�i l�c c�a ��i ph��ng gi�m ",383,20,40,60,80,100,0,0},
	{"T�n c�ng l�m ��i ph��ng hao t�n n�i l�c",49,0,0,0,0,100,0,0},
	{"H� g�c ��i ph��ng sinh l�c h�i ph�c ",333,0,0,35,70,100,0,0},
	{"T� l� m�i m�n v� kh� gi�m",9,0,0,35,70,100,0,0},
	{"��nh t�p trung t�ng",342,0,0,35,70,100,0,0},
	{"Ch�nh x�c t�ng",337,0,0,35,70,100,0,0},
	{"G�n c�t t�ng",357,0,0,35,70,100,0,0},
	{"S�c m�ng t�ng",58,0,0,35,70,100,0,0},
	{"Th�n ph�p t�ng",59,0,0,35,70,100,0,0},
	{"Linh ho�t t�ng",60,0,0,35,70,100,0,0},
	{"N�i c�ng t�ng ",61,0,0,35,70,100,0,0},
	{"H� tr� t�n c�ng  duy tr� ",41,20,40,60,80,90,100,0},
	{"H� tr� ph�ng th� duy tr� ",42,20,40,60,80,90,100,0},
	{"T�t c� thu�c t�nh t�ng",367,0,0,50,100,0,0,0}
	}

--76������table����Ŷ�Ӧ���·��
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
		"Thu�c t�nh Th�n Binh 1 /choose_attri",
		"�i cha, th�n binh v� ch�, ch�a th� giao h�p ra./nothing"
		}
	Say("<color=green>H�p ��ng t�m<color>: tr�n vi�t r�ng 'n�u c� t�nh nh�n � h�p t�m ��u, chuy�n g� c�ng c� th� v��t qua', b�n h�y ch�n m�t s� ph��ng h��ng ph�t tri�n trong h�p n�y. Ch� �, thu�c t�nh h�ng th� nh�t c�a ph��ng h��ng ph�t tri�n n�y do "..GetPlayerSex().." ch� ��nh, thu�c t�nh h�ng th� hai v� th� ba tu� � ��a ra.",getn(strtab),strtab);
end

function choose_attri()
	local strtab = {};
	for i=1,getn(tAttriOne) do
		tinsert(strtab,tAttriOne[i][1].."/#confirm_attri("..i..")");
	end
	tinsert(strtab,"�� ta suy ngh� m�t l�t, sau �� s� m� h�p/nothing");
	Say("<color=green>H�p ��ng t�m<color>:"..GetPlayerSex().."Hy v�ng xu�t hi�n thu�c t�nh th�n binh h�ng th� nh�t l�",getn(strtab),strtab);
end

function confirm_attri(nAttri)
	local strtab = {
		"Ta ch�n xong r�i, ��a H�p th�n binh ra ��y/give_weapon",		
		"Ta mu�n ki�m tra xem thu�c t�nh th�n binh h�ng th� 2 v� th� 3 l� g�/#attri_list(0)",
		"Tr�i, th�n binh v� ch�, hay l� �� sau n�y h�ng m�!/cancel"
		}
	SetTaskTemp(TT_TONGXIN_ATTRI,nAttri);
	Say("<color=green>H�p ��ng t�m<color>:"..GetPlayerSex().."Ch�n thu�c t�nh th� nh�t l� <color=yellow>"..tAttriOne[nAttri][1].."<color>. B�n mu�n th�n binh ra kh�i h�p kh�ng?",getn(strtab),strtab);
end

function attri_list(nPage)
	local page_num = 7;   --ÿҳ�Ի���ʾ�������� 
	local dia_attri = {};  --��ʾ�Ի���
	local attri_remain_num = getn(tAttriTwo) - (nPage*page_num);	--��һҳ��ʣ�¶�����������
	local num_this_dia = 7;
	if attri_remain_num <= 7 then
		num_this_dia = attri_remain_num;
	end	
	for i=1,num_this_dia do
		tinsert(dia_attri,tAttriTwo[(nPage*page_num)+i][1].."/#confirm_attri("..GetTaskTemp(TT_TONGXIN_ATTRI)..")");
	end
	if nPage ~= 0 then
		tinsert(dia_attri,"Trang tr��c/#attri_list("..(nPage-1)..")");
	end
	if attri_remain_num > page_num then
		tinsert(dia_attri,"Trang k�/#attri_list("..(nPage+1)..")");
	end
		tinsert(dia_attri,"tr� l�i/#confirm_attri("..GetTaskTemp(TT_TONGXIN_ATTRI)..")");
		
	Say("<color=green>H�p ��ng t�m<color>: thu�c t�nh th�n binh h�ng th� 2 v� th� 3 c� th� xu�t hi�n l�",
		getn(dia_attri),
		dia_attri);
end

function give_weapon()
	if Zgc_pub_goods_add_chk(1,220) ~= 1 then   --�ռ为�ؼ�� ȡ��������
		return
	end	
	local attri_one = GetTaskTemp(TT_TONGXIN_ATTRI);
	local two_ran = random(1,getn(tAttriTwo)); --�������
	local three_ran = random(1,getn(tAttriTwo));	
	if DelItem(2,1,1153,1) == 1 then			
		if tAttriTwo[two_ran][2] == tAttriOne[attri_one][2] then --��2�������Ƿ����һ�����
			local x = random(1,100);
			if x > 50 then															--50%���ʳɹ�	
				two_ran = randomx(1,getn(tAttriTwo),two_ran);  --ûrandom�ɹ���ͬ����������randomһ�Σ���Ȼ��ȥ��ǰ����
			end
		end                                         
		--3���Զ���ͬ
		if tAttriTwo[three_ran][2] == tAttriOne[attri_one][2] and tAttriTwo[two_ran][2] == tAttriOne[attri_one][2] then --��3������Ҳ���
			local y = random(1,100);
			if y > 20 then															--20%���ʳɹ�
				three_ran = randomx(1,getn(tAttriTwo),three_ran);  
			end
		end
		--��3�������2������ͬ�������1������ͬ��ǰ���ǵ�2���Ժ͵�1���Զ���ͬ
		if tAttriTwo[two_ran][2] ~= tAttriOne[attri_one][2] then
			if tAttriTwo[three_ran][2] == tAttriOne[attri_one][2] or tAttriTwo[three_ran][2] == tAttriTwo[two_ran][2] then			
				local m = random(1,100);
				if m > 50 then
					three_ran = randomx(1,getn(tAttriTwo),three_ran);
				end
			end
		end		
			get_weapon(two_ran,three_ran); --��������
	end
end

function get_weapon(aTwo,aThree)
	local aOne = GetTaskTemp(TT_TONGXIN_ATTRI);	
	local nroute = 0; --��¼��ҵ�·��
	local nlv = random(1,100);									--���ħ���ȼ�		                  
	local mlv = random(1,100);				          		
	local ilv = 3;															--��¼ħ���ȼ�����ʼΪ��ĵ�����λ��
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
		local p = random(1,14); --���������
		local add_flog = AddItem(tRandomW[p][2],tRandomW[p][3],tRandomW[p][4],1,1,tAttriOne[aOne][3],tAttriOne[aOne][2],ilv-2,tAttriTwo[aTwo][2],jlv-2,tAttriTwo[aThree][2]);
		if add_flog == 1 then
			Msg2Player("B�n m� H�p ��ng t�m, nh�n ���c 1 th�n binh");
			SetTaskTemp(TT_TONGXIN_ATTRI,0);
		else
			WriteLog("H�p ��ng t�m: ng��i ch�i"..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
		end
	else
		nroute = GetPlayerRoute();
		local add_flog = AddItem(tWeapon[nroute][2],tWeapon[nroute][3],tWeapon[nroute][4],1,1,tAttriOne[aOne][3],tAttriOne[aOne][2],ilv-2,tAttriTwo[aTwo][2],jlv-2,tAttriTwo[aThree][2]);
		if add_flog == 1 then
			Msg2Player("B�n m� H�p ��ng t�m, nh�n ���c 1 th�n binh");
			SetTaskTemp(TT_TONGXIN_ATTRI,0);
		else
			WriteLog("H�p ��ng t�m: ng��i ch�i"..GetName().."Nh�n Th�n binh th�t b�i, v� tr� th�t b�i: "..add_flog);
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