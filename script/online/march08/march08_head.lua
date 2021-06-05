--Խ�ϰ����»ͷ�ļ�
--by vivi
--2008/03/05

--�������
TASK_MARCH_FENHONG = 2412; --��¼���ʹ�÷ۺ�õ��Ĵ���
TASK_MARCH_HONG = 2413;    --��¼���ʹ�ú�õ��Ĵ���
TASK_MARCH_AWARD_TIME = 2414; --��¼��Ҷһ�õ�������
TASK_MARCH_AWARD_NUM = 2415; --��¼��Ҷһ�õ��Ĵ���

MARCH_TRIGGER_ID = 111;        --������id
KILL_MARCH_ID = 704;         --�Զ���ID

FENHONG_EXP = 5000;            --�ۺ�õ�徭��
HONG_EXP = 15000;							 --��õ�徭��
TOTAL_EXP = 10000000;          --ÿ����һ�õ���߾��飨õ�壩

--õ�����Ͷһ�����
function get_march_state()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20080325 then
		return 1;
	else
		return 0;
	end
end

function check_rose_date()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080318 and nDate <= 20080331 then
		return 1;
	else
		return 0;
	end	
end

--��ٶԻ����
function talk_march()
	Say("<color=green>L� Quan<color>: Thu th�p hoa h�ng n�p cho L� Quan nh�n ph�n th��ng. D�ng 7 hoa h�ng ph�n + 3 hoa h�ng �� + 1 l� th�y nh�n ���c 100.000 �i�m kinh nghi�m, m�i ng�y m�i nh�n v�t ch� c� th� ��i 1 l�n. L�n th� t�, l�n th� t�m ng��i ch�i s� nh�n th�m 1 b�nh B�ng Lai Ti�n Th�y. Ch� �,  nh�n v�t c�p 40 tr� l�n m�i c� th� tham gia ho�t ��ng n�y, B�n ��ng � ��i kh�ng?",
		2,
		"�, ta mu�n ��i./confirm_march_change",
		"T�m th�i, kh�ng mu�n ��i./nothing")
end

function confirm_march_change()
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d"));
	
	if nLv <= 40 then
		Talk(1,"","<color=green>L� Quan<color>: Xin l�i, ng��i ch�i c�p 40 tr� l�n m�i c� th� tham gia ho�t ��ng n�y.");
		return
	end
	if GetTask(TASK_MARCH_AWARD_TIME) >= nDate then
		Talk(1,"","<color=green>L� Quan<color>: M�i ng�y m�i nh�n v�t ch� c� th� ��i 1 l�n.");
		return
	end
	if GetItemCount(2,0,1164) < 7 or GetItemCount(2,0,1162) < 3 or GetItemCount(2,0,351) < 1 then
		Talk(1,"","<color=green>L� Quan<color>: Mu�n ��i c�n 7 hoa h�ng ph�n + 3 hoa h�ng �� + 1 l� th�y, d��ng nh� v�n ch�a ��?");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,0,1164,7) == 1 and DelItem(2,0,1162,3) == 1 and DelItem(2,0,351,1) == 1 then
		SetTask(TASK_MARCH_AWARD_TIME,nDate);
		SetTask(TASK_MARCH_AWARD_NUM,GetTask(TASK_MARCH_AWARD_NUM)+1);
		ModifyExp(100000);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 100.000 �i�m kinh nghi�m.");
		if GetTask(TASK_MARCH_AWARD_NUM) == 4 or GetTask(TASK_MARCH_AWARD_NUM) == 8 then
			AddItem(2,1,1012,1);
		end
	end
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end