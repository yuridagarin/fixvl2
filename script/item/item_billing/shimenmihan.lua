
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ʦ���ܺ��ű�
-- ���ã���ȡһ��ʦ���������
-- Edited by StarryNight
-- 2007/01/17 10:02

-- �ҽ��������������������һ���켣
-- �����㲻Ҫ������Ҫ����

-- ======================================================

Include("\\script\\task\\random\\task_head.lua");

USE_TIME = 559;

function OnUse()
	
	Say("B�n mu�n d�ng s� m�n m�t h�m? N� c� th� gi�p b�n nh�n nhi�m v� s� m�n ng�u nhi�n!",
	2,
	"��ng �/confirm_use",
	"T�m th�i ch�a s� d�ng!/cancel_use"
	)

end

--ȷ��ʹ��ʦ���ܺ�
function confirm_use()

local nCoolDown = GetTime() - GetTask(USE_TIME);
local use_time = GetTime();

	-- �����û�������ɾͲ���ʹ��
	if GetPlayerFaction() == 0 then
		Say("B�n ch�a gia nh�p m�n ph�i, kh�ng th� s� d�ng v�t ph�m n�y",0);
		return
	end
	
	--֮ǰ�Ѿ���ȡʦ���������޷�ʹ��
	if GetTask(551) ~= 0 then
		Say("Ng��i v�n ch�a ho�n th�nh nhi�m v� s� m�n, l� n�o mu�n h�y b� �� nh�n nhi�m v� m�i?",
		2,
		"���c/cancel_task",
		"H�y b�/cancel_use"
		)
		return 0;
	end
	
	if nCoolDown < 7200 then
		Say("Trong 2 gi� kh�ng th� s� d�ng li�n ti�p s� m�n m�t h�m, b�n c�n"..TurnTime(7200-nCoolDown).." m�i c� th� s� d�ng.",0)
		return
	end

	if DelItem(2,1,1020,1) == 1 then	
		if CreateTask() == 1 then	--�����ɹ���ŷ�֪ͨ��edited by yanjun 06-11-15
			RandomTaskTip("B�n nh�n ���c nhi�m v� s� ��!");
			Msg2Player("N�u li�n t�c 2 l�n kh�ng th� ho�n th�nh nhi�m v� s� ph� giao s� b� m�t 1 �i�m danh v�ng!");
			SetTask(USE_TIME,use_time);
		else
			AddItem(2,1,1020,1,1);--��ֹ��ȡ�������������һ��ʦ���ؼ�
		end;
	else
		Say("B�n kh�ng mang s� m�n m�t t�ch, kh�ng th� s� d�ng.",0)
	end
	
end

--ȡ��ʹ��ʦ���ܺ�
function cancel_use()

end

--��һ������ת��Ϊʱ���֣���
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> gi� <color=yellow>"..nMinute.."<color> ph�t <color=yellow>"..nSecond.."<color> gi�y ";
	
	return str

end

--���ԭ������״̬
function cancel_task()

	SetTask(551,0);
	RemoveTrigger(100);

	Say("B�n c� th� s� d�ng M�t H�m S� m�n �� t�y � nh�n nhi�m v� s� m�n",0);
	
end