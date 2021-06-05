--��Ϧ��ű�
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

--�������
TASK_QINGREN_AWARD = 2402; --�������˽��Ƿ���ȡ�����콱��
TASK_SANBA_AWARD = 2403;  --�Ƿ���ȡ���������˸�Ů�ڽ���
TASK_SANBA_MAPID = 2404;  --��ȡ����
TASK_SANBA_TIME = 2405;		--��ȡʱ��
TASK_SANBA_PIG = 2406;    --��ȡ������ͣ����ڶ����콱
TASK_SANBA_PETTIME = 2407; --����ʱ��
TASK_SANBA_TWO = 2408;    --�Ƿ���ȡ�˶��ν���
TASK_SANBA_TONGXIN = 2409; --�Ƿ�ʹ����ͬ����

--ȫ�ֱ���
SANBA_AWARD_TIME = 1800; --���˽ڶ�����ȡ����ʱ�䣬��λ����

--�øж� ����ϵ�� ��ʱע������
tExp = {{500,750000,2},{2000,1500000,5},{10000,3000000,7},{9999999,4500000,10}};

tSanbaAward =--�ȼ� ģ�� ��һ�ξ��飨�У� �ڶ��ξ��飨�У� ģ�� ��һ�ξ��飨Ů�� �ڶ��ξ��飨Ů�� ��Ӧ���id
	{{{"Ti�u H�c tr� (m�)",300000,800000},{"Ti�u H�c tr� (b�)",300000,900000},120,2,0,619},
	 {{"Ti�u B�ch tr� (m�)",300000,1100000},{"Ti�u B�ch tr� (b�)",400000,1200000},180,2,0,621},	
	 {{"Ti�u Kim tr� (m�)",500000,1300000},{"Ti�u Kim tr� (b�)",600000,1500000},999,2,0,625},	
	};

function main()
	local strtab={
		"Ta mu�n nh�n h�t gi�ng hoa h�ng v� H�t Th�n b�/get_seed",
		"Ta �� nu�i l�n H�t Th�n b�, ng��i ��n xem th� �i/check_seed",
		"Ta c� th� l�m g� v�o L� Th�t T�ch n�y, tr�ng hoa th� n�o/know_detail",
		"Ta ch� ��n xem th�/nothing"
		};
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20071110 and nDate <= 20071111 then
		tinsert(strtab,4,"Ch�c M�ng l� Quang C�n, nh�n ph�n th��ng ch�c m�ng/request_singleman_award");
	end;
	if nDate >= 20080213 and nDate <= 20080215 then
		tinsert(strtab,4,"H�m nay l� L� T�nh nh�n, b�n ta ��n ��y �� ���c ch�c ph�c/about_qingren");
	end
	if nDate >= 20080308 and nDate <= 20080309 then
		tinsert(strtab,4,"Ch�c m�ng ng�y qu�c t� ph� n� 8-3/about_sanba")
	end
	if nDate >= 20080614 and nDate <= 20080615 then
		tinsert(strtab,4,"Nh�n ��i kinh nghi�m/about_shuangbei")
	end
	if nDate < 20070816 then
		Talk(1,"","Ho�t ��ng Th�t t�ch v�n ch�a b�t ��u.")
	else
		Say("Ng�y Ng�u Lang Ch�c n� g�p nhau �� ��n r�i.. Ta c� r�t nhi�u h�t gi�ng hoa h�ng, v�o ng�y n�y h�y tr�ng cho ng��i y�u c�a m�nh m�t kh�m hoa h�ng. Ta g�n ��y ph�t hi�n 1 lo�i H�t Th�n b�, nh�ng tr�ng ho�i kh�ng ���c, n�u ng��i gi�p ta tr�ng, ta s� tr� c�ng cho ng��i.",
			getn(strtab),
			strtab);
	end 
end

function get_seed()
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","ng��i v�n ph�i r�n luy�n giang h� nhi�u h�n n�a!");
		return
	end
	if MkTime(2007,08,16)+28800 <= GetCreateTime()+28800 then
		Talk(1,"","R�t ti�c, ch� nh�ng ng��i t�o tr��c ng�y 16 th�ng 8 n�m 2007 m�i nh�n ���c.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if	nDate > 20070830 then
		Talk(1,"","�� h�t th�i gian nh�n. Xin l�n sau h�y ��n s�m!");
		return
	end
	if GetTask(TASK_GET_SEED) == 0 then
		Talk(1,"","H�m nay L� T�nh Nh�n, H� th�ng t�ng b�n h�t 1 h�t gi�ng hoa h�ng v� 1 h�t gi�ng th�n k�. N�u b�n tr�ng h�t gi�ng n�y l�n l�n, h� th�ng s� t�ng b�n ph�n th��ng th�ch h�p.");
		SetTask(TASK_GET_SEED,1);
		if GetSex() == 1 then --�е�
			local add_flog_one = AddItem(2,0,1154,1);  --��������
			local add_flog_two = AddItem(2,0,352,1);  --õ�廨����
			if add_flog_one == 1 and add_flog_two == 1 then
				Msg2Player("B�n nh�n ���c 1 h�t gi�ng hoa h�ng v� h�t gi�ng th�n k�.");
			else
				WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n l�y h�t gi�ng hoa h�ng v� h�t gi�ng th�n k� th�t b�i. V� tr� th�t b�i. V� tr� th�t b�i:"..add_flog_one.." v�"..add_flog_two);
			end
		else --Ů��
			local add_flog_one = AddItem(2,0,1154,1);  --��������
			if add_flog_one == 1 then
				Msg2Player("B�n nh�n ���c 1 h�t gi�ng th�n k�!");
			else
				WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n l�y h�t gi�ng hoa h�ng v� h�t gi�ng th�n k� th�t b�i. V� tr� th�t b�i. V� tr� th�t b�i:"..add_flog_one);
			end
		end	
	else
		Talk(1,"","R�t ti�c! M�i ng��i ch� nh�n ���c 1 ph�n.");
	end
end

function check_seed()
	if GetItemCount(2,0,1154) == 0 and GetItemCount(2,0,1155) == 0 then
		Talk(1,"","Tr�n ng��i b�n kh�ng c� h�t gi�ng th�n k� v� hoa th�n k�!");
		return
	end
	local strtab = {
		"Xem hoa n�y! T�i mu�n nh�n ph�n th��ng tr��ng th�nh/get_grow_award",
		"T�i ��a hoa cho b�n. T�i mu�n nh�n ph�n th��ng cu�i c�ng./get_final_award",
		"T�i c�n ph�i ti�p t�c tr�ng hoa/nothing"
		};
	Say("B�n �� tr�ng ���c hoa th�n k� n�y. H� th�ng �� chu�n b� 2 ph�n th��ng kh�ng li�n ti�p, c�n c� v�o �� l�n c�a hoa ���c: ph�n th��ng tr��ng th�nh, n�u tr�c ti�p ��a hoa cho h� th�ng s� ���c ph�n th��ng cu�i c�ng. <color=yellow>M�i ng��i ch� ���c tr�ng 1 l�n hoa th�n k�<color>.",
		getn(strtab),
		strtab
		);
end

function get_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --����ϵ��
	if fl_grow == 0 then	
		Talk(1,"","Hoa ch�a tr��ng th�nh!");
	else
		for i = 1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and fl_grow <= 100 then  
				if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) ~= 0 then 
					Talk(1,"","Hoa kh�ng c� thay ��i g�. Ti�p t�c tr�ng."); 
				elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) == 0 then
					Talk(1,"","B�n ���c 1 �i�m ch�m ch�. ");
					SetBit(GetTask(TASK_AWARD_ONE),i,1);
					SetTask(TASK_AWARD_ONE,SetBit(GetTask(TASK_AWARD_ONE),i,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --�ڸ�����Χ���������
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(r*10000*exp_arg).." kinh nghi�m.");
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then
					local tGrow = {40,50,60,80,100}
					for i = 1,getn(tGrow)-1 do
						if fl_grow > tGrow[i] and fl_grow < tGrow[i+1] then
							Talk(1,"","Hoa kh�ng c� thay ��i g�, ti�p t�c tr�ng ��n khi <color=red>"..tGrow[i+1].."<color>. ")
							return
						end
					end
					Talk(1,"","Hoa kh�ng c� thay ��i g�. Ti�p t�c tr�ng."); 
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
					Talk(1,"","B�n ���c 1 �i�m ch�m ch�. ");
					SetBit(GetTask(TASK_AWARD_TWO),i-30,1);
					SetTask(TASK_AWARD_TWO,SetBit(GetTask(TASK_AWARD_TWO),i-30,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --�ڸ�����Χ���������
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(r*10000*exp_arg).." kinh nghi�m.");										
				end
				break	   
			elseif fl_grow > 100 then
				WriteLog("Ho�t ��ng Th�t T�ch, hoa th�t ��c bi�t. Tr� s� ��c bi�t l�:"..fl_grow);
				return
			end
		end
	end
end

function get_final_award()
	if GetTask(TASK_GET_FINAL) ~= 0 then
		Talk(1,"main","Ph�n th��ng cu�i c�ng c�a m�i nh�n v�t ch� ���c nh�n 1 l�n. B�n �� nh�n r�i.");
		return
	end	
	local strtab = {
		"Hoa n�y t�ng cho h� th�ng. Ta mu�n ph�n th��ng /confirm_award",
		"T�i mu�n suy ngh� l�i/nothing"
		};
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;			
	if fl_grow == 0 then
		Say("Ng��i kh�ng ch�m ch� tr�ng hoa, ch� c� th� nh�n ph�n th��ng n�y th�i!",
			getn(strtab),
			strtab
			);
	else 
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho�t ��ng Th�t T�ch, hoa th�t ��c bi�t. Tr� s� ��c bi�t l�:"..fl_grow);
				return
			end
		end		
		if j == 2 then
			Say("Ng��i �� ch�m ch� tr�ng hoa, ���c nh�n 1 s� ph�n th��ng b�i th��ng. T�y theo �� l�n c�a hoa, ng��i nh�n ���c <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi�m,",
				getn(strtab),
				strtab
				);
		elseif j > 2 then
			Say("Ng��i �� ch�m ch� tr�ng hoa, ���c nh�n 1 s� ph�n th��ng b�i th��ng. T�y theo �� l�n c�a hoa, ng��i nh�n ���c <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi�m,"..tBoxAward[j-2],
				getn(strtab),
				strtab
				);
		end			
	end
end

function confirm_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	if fl_grow < 60 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
	elseif fl_grow < 80 then
		if Zgc_pub_goods_add_chk(2,2) ~= 1 then
			return
		end
	elseif fl_grow < 100 then
		if Zgc_pub_goods_add_chk(3,3) ~= 1 then
			return
		end		
	elseif fl_grow >= 100 then
		if Zgc_pub_goods_add_chk(5,5) ~= 1 then
			return
		end
	end					
	if fl_grow == 0 then
		if DelItem(2,0,1154,1) == 1 then   --û�����»�
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(tFinalAward[1][2]*exp_arg).." kinh nghi�m.");
		elseif DelItem(2,0,1155,1) == 1 then  --�����˻�
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(tFinalAward[1][2]*exp_arg).." kinh nghi�m.");
		end
	else
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho�t ��ng Th�t T�ch, hoa th�t ��c bi�t. Tr� s� ��c bi�t l�:"..fl_grow);
				return
			end
		end
		local r=random(1,100)
		local p=random(1,100)
		if DelItem(2,0,1155,1) == 1 then
			ModifyExp(floor(tFinalAward[j][2]*exp_arg));
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(tFinalAward[j][2]*exp_arg).." kinh nghi�m.");			
			if r <= tFinalAward[j][3] then 					
				local add_flog = AddItem(2,1,1153,tFinalAward[j][4]);
				if add_flog == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c h�p ��ng T�m"..tFinalAward[j][4].."!");
				else
					WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n h�p ��ng T�m th�t b�i. V� tr�:"..add_flog);
					return				
				end
			end
			if p <= tFinalAward[j][5] then
				local add_flog_two = AddItem(2,1,1152,tFinalAward[j][6]);
				if add_flog_two == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c h�p Th�n Binh S� qu�c"..tFinalAward[j][6].."!");
				else
					WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n h�p Th�n Binh S� qu�c th�t b�i. V� tr�:"..add_flog_two);
					return
				end
			end
			set_task_ling(); --������0
		end
	end
end

function set_task_ling()
	SetTask(TASK_FLOWER_GROW,0);
	SetTask(TASK_AWARD_ONE,0);
	SetTask(TASK_AWARD_TWO,0);
	SetTask(TASK_TOTAL_TIME,0);
	SetTask(TASK_IS_PLANT,0);	
	SetTask(TASK_IS_GROW,0);
	SetTask(TASK_CURRENT_LOGIN,0);
	SetTask(TASK_LAST_LOGIN,0);
	SetTask(TASK_GET_FINAL,1);	
end

function know_detail()
	local strtab = {
		"Ta c� th� tham gia ho�t ��ng n�o/active",
		"Tr�ng hoa nh� th� n�o?/grow_flower",
		"T�i mu�n xem ph�n th��ng v� hoa c� nh�ng m�n n�o/see_award",
		"Sau n�y h�y h�i/nothing"
		};
	Say("Th�t T�ch n�y h� th�ng �� chu�n b� r�t nhi�u qu� t�ng. C�c h� mu�n t�m hi�u g�?",
		getn(strtab),
		strtab
		);
end

function active()
	Talk(1,"know_detail","Th�t T�ch l� ng�y l� l�ng m�n, l� d�p g�p nhau m�i n�m 1 l�n c�a Ng�u lang v� Ch�c N� t�i c�u � Th��c. H� th�ng �� chu�n b� h�t gi�ng hoa h�ng cho nh�ng ng��i y�u nhau, c�c v� thi�u hi�p h�y v� ng��i y�u m� tr�ng 1 ��a hoa h�ng, c�i l�n t�c ng��i y�u. H� th�ng c� 1 h�t gi�ng th�n k� t�ng cho b�n tr�ng, n�u tr�ng hoa l�n l�n s� ���c 1 s� l� v�t. <color=yellow> Ch� nh�n h�t gi�ng trong v�ng 2 tu�n khi ho�t ��ng b�t ��u<color>");
end

function grow_flower()
	Talk(1,"know_detail","Ch� c�n b�n nh�p chu�t ph�i v�o c�c lo�i hoa, th� l� c� th� tr�ng hoa, trong h�nh l� c�a b�n s� xu�t hi�n 1 'Hoa th�n b�', ch� �, ch� khi s� d�ng <color=red>B�ng Lai Ti�n th�y<color> ho�c <color=red>B�ng Lai Ti�n l�<color> ho�c <color=red>B�ng Lai Ti�n ��n<color>, m�i ng�y b�n ch� c�n l�n m�ng 1 ti�ng tr� l�n, c� th� t�ng 1 �i�m �� tr��ng th�nh, nh�ng m�i ng�y ch� c� th� tr��ng th�nh m�t l�n, �� tr��ng th�nh t�i �a l� 100 �i�m.");
end

function see_award()
	Talk(1,"see_award2","Ta chu�n b� hai lo�i ph�n th��ng, t�y theo b�n nu�i hoa l�n t�i ��u, ta s� cho b�n m�t s� kinh nghi�m l�m ph�n th��ng tr��ng th�nh, n�u b�n tr�c ti�p ��a hoa cho ta, ta s� cho b�n ph�n th��ng cu�i c�ng, nh�ng ph�i ch� �, kh�ng th� cho hai ph�n th��ng c�ng l�c, ph�i chia ra nh�n. <color=yellow>H�n n�a m�i ng��i ch� c� th� tr�ng Hoa th�n b� 1 l�n, n�u ��i hoa l�y ph�n th��ng cu�i c�ng, b�n kh�ng ���c ti�p t�c tr�ng hoa n�a<color>.");
end

function see_award2()
	Talk(1,"see_award3","Ph�n th��ng cu�i c�ng nh� sau:: <color=yellow>\n�� tr��ng th�nh t� 5 tr� xu�ng, cho kinh nghi�m\n�� tr��ng th�nh t� 10 tr� xu�ng, cho kinh nghi�m v� 10% x�c su�t nh�n ���c 1 H�p ��ng t�m\n�� tr��ng th�nh t� 20 tr� xu�ng, cho kinh nghi�m v� 20% x�c su�t nh�n ���c 1 H�p ��ng t�m\n�� tr��ng th�nh t� 40 tr� xu�ng, cho kinh nghi�m v� 40% x�c xu�t nh�n ���c 1 H�p ��ng t�m\n�� tr��ng th�nh t� 50 tr� xu�ng, cho kinh nghi�m v� 60% xu�t nh�n ���c 1 H�p ��ng t�m<color>");
end

function see_award3()
	Talk(1,"know_detail","<color=yellow>\n�� tr��ng th�nh t� 60 tr� xu�ng, cho kinh nghi�m v� 80% x�c su�t nh�n ���c 1 H�p ��ng t�m\n�� tr��ng th�nh t� 80 tr� xu�ng, cho kinh nghi�m cho 1 H�p ��ng t�m, 1 H�p Th�n Binh S� qu�c\n�� tr��ng th�nh t� 100 tr� xu�ng, cho kinh nghi�m v� 1 H�p ��ng t�m, 2 H�p Th�n Binh S� qu�c\n�� tr��ng th�nh ��t 100, cho kinh nghi�m v� cho 1 H�p ��ng t�m, 4 H�p Th�n Binh S� qu�c<color>");
end

function request_singleman_award()
	local selTab = {
				"Nh�n l� v�t ch�c m�ng/get_singleman_award",
				"Quay ��u nh�n l� v�t/nothing",
				}
	Say("L� Quang c�n ��n r�i, kh�ng bi�t ph�i ch�ng b�ng h�u? (hi�p n�) v�n c�n m�t m�nh phi�u b�t ch�n giang h�, ��ng �au l�ng, trong d�p l� n�y, 2 ��i l� ki�m v�ng s� ���c g�i ��n, ch�ng ta m�c s�c h��ng th� th� gi�i tr� ch�i! N�u ng��i kh�ng ph�i c� gia qu� ph�, ��ng �au l�ng, ta c�ng c� l� v�t t�ng ng��i. V�o <color=yellow>ng�y 10 v� 11 th�ng 11, m�i t�i t� 18:00##23:00<color> ��n l�nh ��i l� kinh nghi�m!",getn(selTab),selTab);
end;

function get_singleman_award()
	local nDate = tonumber(date("%y%m%d"));
	local nHour = tonumber(date("%H"));
	local nGetDate = GetTask(1850);
	local nLevel = GetLevel();
	if nLevel <= 10 then
		Talk(1,"","Th�t ng�i qu�, ng��i ch�i t� c�p 10 tr� l�n m�i ���c nh�n l� ph�m.");
		return 0;
	end;
	if (nGetDate ~= 0 and nGetDate ~= 071110 and nGetDate ~= 071111) or nGetDate >= nDate then
		Talk(1,"","Th�t ng�i qu�, h�m nay b�n �� nh�n l� ph�m r�i.");
		return 0;	
	end;
	if nHour >= 18 and nHour < 23 then
		SetTask(1850,nDate);
		local nExp = 0;
		if GetMateName() == "" then
			nExp = floor((nLevel^4)/12);
		else
			nExp = floor((nLevel^4)/16);
		end;
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		Talk(1,"","C� ch�t qu� m�n cho b�n, ch�c b�n vui v�!");
	else
		Talk(1,"","V�n ch�a ��n gi�. Xin ��i ��n <color=yellow>18:00##23:00<color>gi� nh�n");
	end;
end;

function nothing()
end

function about_qingren()
	local strtab = {
			"Ta �i c�ng � trung nh�n/get_award_qingren",
			"Thuy�t minh ho�t ��ng l� T�nh nh�n/about_qingren_detail",
			"Ta v�n ch�a c� � trung nh�n/nothing"};
			
	Say("L� t�nh nh�n �� ��n, t� ng�y13 ��n ng�y 15 th�ng 2, n�u c�c h� c� c�m t�nh v�i ai ��, c� th� c�ng t� ��i ��n g�p ta, ta s� c�n c� v�o �� h�o c�m gi�a c�c ng��i, ban t�ng l�i ch�c ph�c. Xin ch� �, m�t ng��i m�t ng�y nh�n ���c 1 l�n ch�c ph�c.",
		getn(strtab),
		strtab);
end

function get_award_qingren()
	local nDate = tonumber(date("%Y%m%d"));
	local nOldIndex = PlayerIndex;
	local nSex1,nSex2 = 0,0;
	local nFriend = 0; --�øж�
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","Ph�i d�n � trung nh�n c�a ng��i m�t m�nh ��n g�p ta.");
	else
		PlayerIndex = GetTeamMember(1);
		nSex1 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th�t ��ng ti�c, ta �� ch�c ph�c cho ng��i trong ��i c�a ng��i r�i.");
			return
		end
		PlayerIndex = GetTeamMember(2);
		nSex2 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th�t ��ng ti�c, ta �� ch�c ph�c cho ng��i trong ��i c�a ng��i r�i.");
			return
		end		
		PlayerIndex = nOldIndex;
		if nSex1 == nSex2 then
			Talk(1,"","Ph�i d�n � trung nh�n c�a ng��i ��n, kh�ng ph�i b�ng h�u.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			nFriend = GetMemberFriendliness(2);
		elseif PlayerIndex == GetTeamMember(2) then
			nFriend = GetMemberFriendliness(1);
		end
		for i = 1,getn(tExp) do
			if nFriend <= tExp[i][1] then 
				PlayerIndex = GetTeamMember(1);
				local nLv = GetLevel();
				if nLv == 99 then  --�ȶ������˽��и��ؼ��
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","H�nh trang ho�c s�c l�c c�a b�n ho�c ��ng ��i kh�ng ��, h�y ch�nh l� l�i �i.");
						return
					end
				elseif nLv <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ng��i ph�i ��t c�p 30 tr� l�n m�i �i ���c.");
					return						
				end
				PlayerIndex = GetTeamMember(2);
				local nLv2 = GetLevel();
				if nLv2 == 99 then
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","H�nh trang ho�c s�c l�c c�a b�n ho�c ��ng ��i kh�ng ��, h�y ch�nh l� l�i �i.");
						return
					end
				elseif nLv2 <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ng��i ph�i ��t c�p 30 tr� l�n m�i �i ���c.");
					return						
				end
				
				PlayerIndex = GetTeamMember(1);								
				local nExp = floor(tExp[i][2]*nLv^2/80^2);				
				if nLv ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.." �i�m kinh nghi�m.");
					Talk(1,"","Ta ch�c hai ng��i h�nh ph�c, c� ch�t qu� t�ng c�c ng��i, "..nExp.." �i�m kinh nghi�m, gi�p c�c ng��i h�nh t�u giang h�.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tExp[i][3].."quy�n Thi�n Th�i Ch� Gi�i");
					Talk(1,"","Ta ch�c hai ng��i h�nh ph�c, c� ch�t qu� t�ng c�c ng��i, "..tExp[i][3].."quy�n Thi�n Th�i Ch� Gi�i, gi�p c�c ng��i phi�u b�t giang h�");
				end
				PlayerIndex = GetTeamMember(2);
				local nExp2 = floor(tExp[i][2]*nLv2^2/80^2);				
				if nLv2 ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp2);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp2.." �i�m kinh nghi�m.");
					Talk(1,"","Ta ch�c hai ng��i h�nh ph�c, c� ch�t qu� t�ng c�c ng��i, "..nExp2.." �i�m kinh nghi�m, gi�p c�c ng��i h�nh t�u giang h�.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tExp[i][3].."quy�n Thi�n Th�i Ch� Gi�i");
					Talk(1,"","Ta ch�c hai ng��i h�nh ph�c, c� ch�t qu� t�ng c�c ng��i, "..tExp[i][3].."quy�n Thi�n Th�i Ch� Gi�i, gi�p c�c ng��i phi�u b�t giang h�");
				end
				PlayerIndex = nOldIndex;
				break
			end
		end
	end								
end

function about_qingren_detail()
	Talk(1,"","Ta s� c�n c� v�o �� h�o c�m gi�a ng��i v� ��i h�u �� t�ng ph�n th��ng.\n0-500 �� h�o c�m, n�u b�n � c�p 80 s� ���c 75 v�n kinh nghi�m\n501-2000 �� h�o c�m, n�u b�n � c�p 80 s� ���c 150 v�n kinh nghi�m\n2001-10000 �� h�o c�m, n�u b�n � c�p 80 s� ���c 300 v�n kinh nghi�m\n10001 �� h�o c�m tr� l�n, n�u b�n � c�p 80 s� ���c 450 v�n kinh nghi�m\n��ng c�p kh�c s� ���c gi�m ho�c t�ng nh�t ��nh, n�u trong ��i c� ng��i ��t c�p 99 s� nh�n ���c'thi�n th�i ch� gi�i' l�m ph�n th��ng. Ch�c L� t�nh nh�n vui v�!");
end

function about_sanba()
	local strtab={
		"Ch�c m�ng Qu�c t� ph� n�, m�i nh�n qu�/get_sanba_one",
		"Nh�n l� v�t ch�c m�ng l�n th� 2/get_sanba_two",
		"Thuy�t minh ph�n th��ng/sanba_deteil",
		"Ta ch� ��n xem th�/nothing"
		};
	Say("Xu�n v� kh�p n�i, v�n v�t h�i sinh. Ch�ng ta l�i ch�o ��n ng�y l� 'Qu�c t� ph� n� 8-3', �� c�m �n c�c ch� em ph� n� �� �ng h� tr� ch�i, v�o l�c 08:00�22:30 ng�y 8 v� ng�y 9 th�ng 3 ch�ng ta s� c� nh�ng ph�n qu� ��c bi�t d�nh cho ch� em. Hai ng��i m�t t�, ��ng c�p hai ng��i c�ng cao c�ng c� c� h�i nh�n qu� t�t. M�i ng��i m�t ng�y ch� nh�n m�t ph�n qu�. H�y s�p x�p l�i h�nh trang. M�ch nh�: ��a cho ta 1 vi�n ��ng T�m Ho�n, ta s� cho c�c ng��i s� ng�c nhi�n g�p 3 l�n.",
			getn(strtab),
			strtab);	
end

function get_sanba_one()
	local strtab = {
			"Ch�ng ta ph�i l�y l� v�t/#ask_use_tongxin(1)",
			"Ta mu�n l�y l� v�t/give_him_award",
			"Ta �i t�m m�t b�ng h�u ��!/nothing"
			};
	Say("Ng��i m�t m�nh ��n l�y hay d�n theo b�n kh�c gi�i ��n l�y?",
		getn(strtab),
		strtab)
end

function ask_use_tongxin(nNum)
	if nNum == 1 then
		Say("S� d�ng ��ng T�m Ho�n nh�n �u�c ph�n th��ng kinh nghi�m g�p 3 l�n, hai ng��i c�n 2 vi�n ��ng T�m Ho�n, ��a ��ng T�m Ho�n cho ��i tr��ng. Mu�n s� d�ng kh�ng?",
			3,
			"���c, ta ch�p nh�n./#give_them_award(1)",
			"Kh�ng c�n, tr�c ti�p nh�n l� ph�m/#give_them_award(2)",
			"��i ��, ta v�n ch�a chu�n b�/nothing")
	elseif nNum == 2 then
		Say("S� d�ng ��ng T�m Ho�n nh�n �u�c ph�n th��ng kinh nghi�m g�p 3 l�n, mu�n s� d�ng kh�ng?",
			3,
			"���c, ta ��ng �./#confirm_sanba_award(1)",
			"Kh�ng c�n, tr�c ti�p nh�n l� ph�m/#confirm_sanba_award(2)",
			"��i ��, ta v�n ch�a chu�n b�/nothing")
	end
end

function give_them_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nOldIndex = PlayerIndex;
	local nSexOne,nSexTwo = 0,0;
	local nLvOne,nLvTwo,nLvTotal = 0,0,0;
	local sNameOne,sNameTwo = "","";
	local nTempType = 0; 
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","D�n theo b�n kh�c gi�i ��n s� c�ng c� nhi�u ph�n th��ng, c� hai ng��i nh�t ��nh ph�i ��n g�p ta.");
	else 
		if PlayerIndex ~= GetTeamMember(0) then
			Talk(1,"","M�i ��i tr��ng ��n l�y.");
			return
		end
		if nType == 1 then
			if GetItemCount(2,1,573) < 2 then
				Talk(1,"","C�n 2 vi�n ��ng T�m Ho�n, ng��i kh�ng c� ��.");
				return
			end
		end
		
		nSexOne = GetSex();
		nLvOne = GetLevel();
		sNameOne = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th�t ��ng ti�c, ta �� t�ng qu� cho ng��i trong ��i c�a ng��i r�i, m�i ng��i m�t ng�y ch� �u�c l�nh m�t l�n.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end
		nSexTwo = GetSex();
		nLvTwo = GetLevel();
		sNameTwo = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","Th�t ��ng ti�c, ta �� t�ng qu� cho ng��i trong ��i c�a ng��i r�i, m�i ng��i m�t ng�y ch� �u�c l�nh m�t l�n.");
			return
		end		
		PlayerIndex = nOldIndex;
		
		if nSexOne == nSexTwo then
			Talk(1,"","Ph�i mang theo b�n kh�c gi�i c�a ng��i ��n m�i ���c.");
			return
		end
		if nLvOne < 11 or nLvTwo < 11 then
			Talk(1,"","Ng��i trong ��i ng��i c�n r�n luy�n th�m tr�n giang h�.");
			return
		end			
		nLvTotal = nLvOne+nLvTwo; --�ȼ�֮��
		for i=1,getn(tSanbaAward) do
			if nLvTotal < tSanbaAward[i][3] then
				nTempType = i;
				break
			end
		end
							
		local nExpOne = floor(tSanbaAward[nTempType][nSexOne][2]*nLvOne^3/80^3);
		local nExpTwo = floor(tSanbaAward[nTempType][nSexTwo][2]*nLvTwo^3/80^3);
		local nNumOne,nNumTwo = 1,1;
		if nType == 1 then
			if DelItem(2,1,573,2) == 1 then
				nExpOne = nExpOne*3;
				nExpTwo = nExpTwo*3;
				nNumOne = nNumOne*3;
				nNumTwo = nNumTwo*3;
			end
		end
		local nRandExp = random(1,100);
		if nRandExp >= 99 then
			nExpOne = nExpOne*3;
			nExpTwo = nExpTwo*3;
			nNumOne = nNumOne*3;
			nNumTwo = nNumTwo*3;
			Msg2Global("Ch�c m�ng "..sNameOne.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 3 l�n");
			Msg2Global("Ch�c m�ng "..sNameTwo.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 3 l�n");
		elseif nRandExp >= 96 then
			nExpOne = nExpOne*2;
			nExpTwo = nExpTwo*2;
			nNumOne = nNumOne*2;
			nNumTwo = nNumTwo*2;
			Msg2Global("Ch�c m�ng "..sNameOne.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 2 l�n!");
			Msg2Global("Ch�c m�ng "..sNameTwo.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 2 l�n!");			
		end		
		if nLvOne ~= 99 then		
			ModifyExp(nExpOne);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExpOne.."Kinh nghi�m");
		else
			for i=1,nNumOne do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch 1 vi�n");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);
		Talk(1,"","T�ng cho c�c ng��i kinh nghi�m phong ph� v� l�n con d� th��ng@^_^@Sau n�a ti�ng n�a ��n ch� ta! ( c� th� ��n tr��c m�t m�nh) c�n r�t nhi�u ph�n th��ng. Nh� r�ng ta l� B�ch Hoa s� gi� c�a th�nh n�y, �i sai th�nh s� kh�ng nh�n ���c qu�.");
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end		
		if nLvTwo ~= 99 then
			ModifyExp(nExpTwo);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExpTwo.."Kinh nghi�m");
		else
			for i=1,nNumTwo do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch 1 vi�n");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end		
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);	
		Talk(1,"","T�ng cho c�c ng��i kinh nghi�m phong ph� v� l�n con d� th��ng@^_^@Sau n�a ti�ng n�a ��n ch� ta! ( c� th� ��n tr��c m�t m�nh) c�n r�t nhi�u ph�n th��ng. Nh� r�ng ta l� B�ch Hoa s� gi� c�a th�nh n�y, �i sai th�nh s� kh�ng nh�n ���c qu�.");
		PlayerIndex = nOldIndex;
	end		
end

function give_him_award()
	Say("Mu�n l�y qu� m�t m�nh sao? D�n b�n kh�c gi�i ��n s� c� nhi�u c� h�i h�n.",
		2,
		"Ta mu�n nh�n /#ask_use_tongxin(2)",
		"Ta �i t�m m�t b�ng h�u ��!/nothing")
end

function confirm_sanba_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	local nPos = GetWorldPos();
	local nSex = GetSex();
	local sName = GetName();
	
	if nLv < 11 then
		Talk(1,"","Ng��i c�n ph�i r�n luy�n giang h� l�i m�t phen.");
		return
	end		
	if GetTask(TASK_SANBA_AWARD) >= nDate then
		Talk(1,"","Th�t ti�c, ta �� t�ng qu� cho ng��i r�i, m�i ng�y ch� �u�c nh�n 1 l�n th�i.");
		return
	end		
	
	--һ������Ĭ��Ϊ����Ϊ��һ�֣���120������
	local nExp = floor(tSanbaAward[1][nSex][2]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nType == 1 then
		if GetItemCount(2,1,573) < 1 then
			Talk(1,"","Ng��i qu�n mang theo ��ng T�m Ho�n r�i ch� g�?");
			return
		end
		if DelItem(2,1,573,1) == 1 then
			nExp = nExp*3;
			nLingshiNum = nLingshiNum*3;
			SetTask(TASK_SANBA_TONGXIN,1);
		end
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Ch�c m�ng "..sName.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 3 l�n");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Ch�c m�ng "..sName.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 2 l�n!");	
	end	
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch 1 vi�n");
		end
	end
	SetTask(TASK_SANBA_AWARD,nDate);
	SetTask(TASK_SANBA_MAPID,nPos);
	SetTask(TASK_SANBA_TIME,GetTime());
	SetTask(TASK_SANBA_PIG,1);
	SetTask(TASK_SANBA_PETTIME,GetTime());
	AddItem(tSanbaAward[1][4],tSanbaAward[1][5],tSanbaAward[1][6],1);
	Talk(1,"","T�ng cho c�c ng��i kinh nghi�m phong ph� v� l�n con d� th��ng@^_^@Sau n�a ti�ng n�a ��n ch� ta! ( c� th� ��n tr��c m�t m�nh) c�n r�t nhi�u ph�n th��ng. Nh� r�ng ta l� B�ch Hoa s� gi� c�a th�nh n�y, �i sai th�nh s� kh�ng nh�n ���c qu�.");	
end

function get_sanba_two()
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nSex = GetSex();
	local sName = GetName();
	local nType = GetTask(TASK_SANBA_PIG);
	local nTongxin = GetTask(TASK_SANBA_TONGXIN);
	
	if GetTask(TASK_SANBA_AWARD) >= nDate and GetTask(TASK_SANBA_TWO) >= nDate then
		Talk(1,"","Ng��i �� nh�n t�t c� ph�n th��ng c�a ng�y h�m nay r�i.");
		return
	end
	if GetTask(TASK_SANBA_AWARD) < nDate then
		Talk(1,"get_sanba_one","L�y qu� tr��c r�i h�y t�i ��y.");
		return
	end
	if nPos ~= GetTask(TASK_SANBA_MAPID) then
		Talk(1,"","Ch�ng ph�i ng��i �� l�y qu� t�i b�n th�nh r�i sao?");
		return
	end
	if GetTime() - GetTask(TASK_SANBA_TIME) < SANBA_AWARD_TIME then
		Talk(1,"","��ng g�p g�p, d�n ti�u tr� �i ch�i �i!");
		return
	end  
	local nExp = floor(tSanbaAward[nType][nSex][3]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nTongxin == 1 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Ch�c m�ng "..sName.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 3 l�n");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Ch�c m�ng "..sName.."Trong ho�t ��ng m�ng 8-3 nh�n ���c ph�n th��ng kinh nghi�m g�p 2 l�n!");	
	end		
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
		Talk(1,"","Ch�c m�ng nh�n ���c "..nExp.." �i�m kinh nghi�m!");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch 1 vi�n");
		end
	end
	SetTask(TASK_SANBA_TWO,nDate);
	SetTask(TASK_SANBA_TONGXIN,0);		
end

function sanba_deteil()
	Talk(1,"sanba_deteil2","�� ch�c m�ng l� 8-3, ta c� ch�t qu� m�n cho to�n b� nam n� gi� tr� trong th�nh, v�o l�c 08:00�22:30 gi� ng�y 8 v� ng�y 9 th�ng 3, c� th� ��n ch� ta l�y kinh nghi�m v� ti�u tr� th� nu�i. T� ��i kh�c gi�i c� c�p b�c cao c� th� nh�n ���c ph�n th��ng c�ng cao. N�a ti�ng sau ��n ch� B�ch Hoa s� gi� l�y ph�n th��ng l�n th� 1, ph�n th��ng nh�n ���c c�ng phong ph�. Ph�n th��ng trong ng�y c�n ho�n t�t l�nh trong ng�y. N�u t�ng cho B�ch Hoa s� gi� 1 vi�n ��ng T�m Ho�n, s� c� s� ng�c nhi�n g�p 3 l�n. ��ng th�i c�n c� c� h�i nh�n ���c kinh nghi�m g�p 2 ho�c g�p 3 l�n. ")
end

function sanba_deteil2()
	Talk(1,"","��ng c�p nam + n� < c�p 120, hai ng��i nh�n ���c 1 th� nu�i ti�u h�c tr�.\n120<= ��ng c�p nam + n� < c�p 180, hai ng��i nh�n ���c 1 th� nu�i ti�u b�ch tr�.\n��ng c�p nam + n�>= c�p 180, hai ng��i nh�n ���c 1 ti�u kim tr� th� nu�i.\n1 ng��i ch� nh�n ���c ti�u h�c tr�, ng��i ch�i c�p 99 nh�n ���c Linh th�ch c�p 1-6 ng�u nhi�n.")
end

function about_shuangbei()
------------------��ʼ��¶ˮЧ��------------------------
	local tItemInfo =
	{
		{2, 1, 1012, 7200, 150, "B�ng Lai Ti�n Th�y",1},
		{2, 0, 109, 7200, 200, "B�ng Lai Ti�n L�",1.5},
		{2, 1, 1013, 7200, 300, "B�ng Lai Ti�n ��n",2},
		{2, 1, 1052, 7200, 120, "B�ng Lai L� Th�y",0},
	}
	for index, value in tItemInfo do
		InitXclSpeed(index, value[5])
	end
----------------------------------------------------------	
	local nTime = tonumber(date("%H"));
	if nTime < 12 or nTime >= 23 then
		Talk(1,"","<color=green>B�ch Hoa s� gi�<color>: V�o l�c 12:00 tr�a-23:00 t�i ��n nh�n.");
		return
	end
	local strtab = {
		"Ta mu�n nh�n /get_shuangbei",
		"T�m th�i kh�ng nh�n/nothing"
		}
	Say("<color=green>B�ch Hoa s� gi�<color>:<color=yellow>14/6-15/6<color> m�i ng��i m�i ng�y c� th� ��n ch� ta nh�n <color=yellow>4h nh�n ��i kinh nghi�m v� nh�n ��i �� c�ng hi�n s� m�n nguy�n ng�y<color>,<color=red> ch� �, c� th� s� chuy�n hi�u qu� th�i gian nh�n ��i c�p cao hi�n t�i c�a ng��i.<color>",
		getn(strtab),
		strtab)
end

function get_shuangbei()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(542) >= nDate then
		Talk(1,"","<color=green>B�ch Hoa s� gi�<color>: Ng��i �� nh�n ph�n th��ng nh�n ��i c�a ng�y h�m nay, m�i ng��i m�i ng�y ch� c� th� nh�n 1 l�n.");
		return
	end
	local nType, nTime, nSpeed = GetExistXclInfo();
	if nTime > 0 then
		if nSpeed > 200 then
			Talk(1,"","<color=green>B�ch Hoa s� gi�<color>: Hi�n nay ng��i c� hi�u qu� kinh nghi�m m�nh, kh�ng th� nh�n ���c.");
			return
		end
	end
	if GetTask(85) == nDate and GetTask(86) == 3 then
		Talk(1,"","<color=green>B�ch Hoa s� gi�<color>: Hi�n nay ng��i c� hi�u qu� �� c�ng hi�n s� m�n m�nh, kh�ng th� nh�n ���c. ");
		return
	end
	SetTask(542,nDate);
	local nRet = EatXcl(2,14400)
	if nRet == 1 then
		Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i kinh nghi�m");
	end	
	SetTask(85,nDate);
	SetTask(86,2);
	Msg2Player("Trong h�m nay �� c�ng hi�n s� m�n b�n nh�n ���c t�ng 2 l�n");
end