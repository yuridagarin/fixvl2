--��Ϧ��ű�
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")

function main()
	local strtab={
		"Ta mu�n nh�n h�t gi�ng hoa h�ng v� H�t Th�n b�/get_seed",
		"Ta �� nu�i l�n H�t Th�n b�, ng��i ��n xem th� �i/check_seed",
		"Ta c� th� l�m g� v�o L� Th�t T�ch n�y, tr�ng hoa th� n�o/know_detail",
		"Ta ch� ��n xem th�/nothing"
		};
	local nDate = tonumber(date("%Y%m%d"));
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
		local add_flog_one = AddItem(2,1,1154,1);  --��������
		local add_flog_two = AddItem(2,0,352,1);  --õ�廨����
		if add_flog_one == 1 and add_flog_two == 1 then
			Msg2Player("B�n nh�n ���c 1 h�t gi�ng hoa h�ng v� h�t gi�ng th�n k�.");
		else
			WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n l�y h�t gi�ng hoa h�ng v� h�t gi�ng th�n k� th�t b�i. V� tr� th�t b�i. V� tr� th�t b�i:"..add_flog_one.." v�"..add_flog_two);
		end
	else
		Talk(1,"","R�t ti�c! M�i ng��i ch� nh�n ���c 1 ph�n.");
	end
end

function check_seed()
	if GetItemCount(2,1,1154) == 0 and GetItemCount(2,1,1155) == 0 then
		Talk(1,"","Tr�n ng��i b�n kh�ng c� h�t gi�ng th�n k� v� hoa th�n k�!");
		return
	end
	local strtab = {
		"Xem hoa n�y! T�i mu�n nh�n ph�n th��ng tr��ng th�nh/get_grow_award",
		"T�i ��a hoa cho b�n. T�i mu�n nh�n ph�n th��ng cu�i c�ng./get_final_award",
		"T�i c�n ph�i ti�p t�c tr�ng hoa/nothing"
		};
	Say("Kh�ng ng� ng��i �� tr�ng Hoa th�n b� l�n th� n�y. T�t l�m! C�n c� v�o �� l�n c�a hoa, ta s� cho ng��i 1 ph�n th��ng tr��ng th�nh, n�u ng��i tr�c ti�p ��a hoa cho ta, ta s� t�ng ng��i ph�n th��ng cu�i c�ng, nh�ng ph�i ch� �, kh�ng th� nh�n hai ph�n th��ng c�ng l�c.",
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
	if fl_grow < 80 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
	elseif fl_grow < 100 then
		if Zgc_pub_goods_add_chk(2,2) ~= 1 then
			return
		end
	elseif fl_grow >= 100 then
		if Zgc_pub_goods_add_chk(3,3) ~= 1 then
			return
		end
	end					
	if fl_grow == 0 then
		if DelItem(2,1,1154,1) == 1 then   --û�����»�
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(tFinalAward[1][2]*exp_arg).." kinh nghi�m.");
		elseif DelItem(2,1,1155,1) == 1 then  --�����˻�
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
		if DelItem(2,1,1155,1) == 1 then
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
	SetTask(TASK_PLANT_TIME,0);
	SetTask(TASK_IS_PLANT,0);	
	SetTask(TASK_IS_GROW,0);
	SetTask(TASK_CURRENT_LOGIN,0);
	SetTask(TASK_LAST_LOGIN,0);	
end

function know_detail()
	local strtab = {
		"Ta c� th� tham gia ho�t ��ng n�o/active",
		"Tr�ng hoa nh� th� n�o?/grow_flower",
		"Sau n�y h�y h�i/nothing"
		};
	Say("Th�t T�ch n�y h� th�ng �� chu�n b� r�t nhi�u qu� t�ng. C�c h� mu�n t�m hi�u g�?",
		getn(strtab),
		strtab
		);
end

function active()
	Talk(1,"","Th�t T�ch l� ng�y l� l�ng m�n, l� d�p g�p nhau m�i n�m 1 l�n c�a Ng�u lang v� Ch�c N� t�i c�u � Th��c. H� th�ng �� chu�n b� h�t gi�ng hoa h�ng cho nh�ng ng��i y�u nhau, c�c v� thi�u hi�p h�y v� ng��i y�u m� tr�ng 1 ��a hoa h�ng, c�i l�n t�c ng��i y�u. H� th�ng c� 1 h�t gi�ng th�n k� t�ng cho b�n tr�ng, n�u tr�ng hoa l�n l�n s� ���c 1 s� l� v�t. <color=yellow> Ch� nh�n h�t gi�ng trong v�ng 2 tu�n khi ho�t ��ng b�t ��u<color>");
end

function grow_flower()
	Talk(1,"","Ch� c�n nh�p chu�t ph�i v�o t�n lo�i hoa l� c� th� tr�ng, trong h�nh trang c�a b�n s� xu�t hi�n 1 'Hoa th�n b�', ch� �, ch� khi �ang s� d�ng <color=red>B�ng Lai Ti�n th�y<color> ho�c <color=red>B�ng Lai Ti�n l�<color> ho�c <color=red>B�ng Lai Ti�n ��n<color>, m�i ng�y b�n ch� c�n l�n m�ng 1 ti�ng tr� l�n, s� t�ng �� tr��ng th�nh l�n 1 �i�m, nh�ng m�i ng�y ch� tr��ng th�nh 1 l�n, �� tr��ng th�nh cao nh�t l� 100.");
end

function nothing()
end