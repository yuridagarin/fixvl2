--���صĻ��ű�
--by vivi
--07/30/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")

function OnUse()
	local remain_time = 0;
	local nNowDay = floor((GetTime()+28800)/86400); 
	
	if GetTask(TASK_FLOWER_GROW) > 100 then
		SetTask(TASK_FLOWER_GROW,100);
	end	
	
	--�����Ƿ�ɳ������߳ɳ����Ƿ��Ѿ���100
	if nNowDay == GetTask(TASK_IS_GROW) or GetTask(TASK_FLOWER_GROW) >= 100 then
		Talk(1,"","<color=green>Hoa th�n b�<color>: �� tr��ng th�nh ��a hoa n�y l� <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. �� tr��ng th�nh c�a hoa h�m nay �� t�ng th�m <color=red>1<color>, ph�n th��ng tr��ng th�nh gi� c� th� l�nh l� <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nh�n ph�n th��ng tr��ng th�nh l�c n�y. B�y gi� n�p ��a hoa n�y cho B�ch Hoa s� gi� c� th� nh�n ���c ph�n th��ng cu�i c�ng l�"..npc_final_award()..". Ch� �, ch� c�n s� d�ng <color=red>B�ng Lai Ti�n th�y<color> ho�c <color=red>B�ng Lai Ti�n l�<color> ho�c <color=red>B�ng Lai Ti�n ��n<color>, m�i ng�y l�n m�ng 1 gi� tr� l�n m�i c� th� t�ng ���c 1 �i�m �� tr��ng th�nh trong ng�y h�m ��");
	else  				
		remain_time = NEED_TIME - GetTask(TASK_TOTAL_TIME);
		Talk(1,"","<color=green>Hoa th�n b�<color>: �� tr��ng th�nh ��a hoa n�y l� <color=red>"..GetTask(TASK_FLOWER_GROW).."<color>. H�m nay b�n v�n ph�i l�n m�ng <color=red>"..remain_time.."<color> ph�t �� t�ng �� tr��ng th�nh l�n <color=red>1<color>, ph�n th��ng tr��ng th�nh c� th� nh�n b�y gi� l� <color=red>"..npc_grow_award().."<color>, <color=red>"..is_get_award().."<color> nh�n ph�n th��ng tr��ng th�nh l�c n�y. B�y gi� n�p ��a hoa n�y cho B�ch Hoa s� gi� c� th� nh�n ���c ph�n th��ng cu�i c�ng l�"..npc_final_award()..". Ch� �, ch� c�n s� d�ng <color=red>B�ng Lai Ti�n th�y<color> ho�c <color=red>B�ng Lai Ti�n l�<color> ho�c <color=red>B�ng Lai Ti�n ��n<color>, m�i ng�y l�n m�ng 1 gi� tr� l�n m�i c� th� t�ng ���c 1 �i�m �� tr��ng th�nh trong ng�y h�m ��");
	end			
end

--�������ս�����������ʾ�����
function npc_final_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	local aStr = "";			
	if fl_grow == 0 then
		aStr = aStr.."<color=red>"..floor(tFinalAward[1][2]*exp_arg).."<color> kinh nghi�m "
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
			aStr = aStr.."<color=red>"..floor(tFinalAward[2][2]*exp_arg).."<color> kinh nghi�m "
		elseif j > 2 then
			aStr = aStr.."<color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghi�m,"..tBoxAward[j-2]
		end			
	end
	return aStr
end

--�Ƿ��Ѿ���ȡ������
function is_get_award()
	local str = "";
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) == 0 then
		str="ch�a";
	elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),fl_grow) ~= 0 then
		str="�� ";
	elseif fl_grow > 30 then
		for i = 31,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
				str="ch�a";
				break
			elseif fl_grow <=tGrowAward[i][1] and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then 
				str="�� ";
				break
			end
		end
	end
	return str
end		

function npc_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --����ϵ��
	local gStr = "";
	if fl_grow == 0 then
		gStr = "0";
	elseif fl_grow > 0 and fl_grow <= 100 then
		for i=1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] then
				gStr = "t�ng ng�u nhi�n "..floor(tGrowAward[i][2]*10000*exp_arg).."-"..floor(tGrowAward[i][3]*10000*exp_arg).."Kinh nghi�m";
				break
			end
		end
	else
		gStr = "�� tr��ng th�nh kh�c th��ng c�a hoa. Xin li�n h� b� ph�n ph�c v� kh�ch h�ng, c�m �n.";
	end
	return gStr;	
end