
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ʦ����Ը��ű�
-- ���ã�����24Сʱ����ȡʦ���������
-- Edited by StarryNight
-- 2007/01/16 16:50

-- �ҵ�ҹ������İ���
-- ������ʱ���������
-- ֻΪ�˺����ټ�һ��
-- �һ᲻����ҹ������

-- ======================================================

USE_TIME = 558;
ADD_RATE = 2;--������ȡ������ʣ���λ��������

function OnUse()
	
	Say("B�n mu�n d�ng s� m�n th�nh nguy�n th�? N� c� th� gi�p b�n t�ng t� l� nh�n nhi�m v� s� m�n ng�u nhi�n g�p 4 l�n trong 24 gi�.",
	2,
	"��ng �/confirm_use",
	"T�m th�i ch�a s� d�ng!/cancel_use"
	)

end

--ȷ��ʹ��ʦ����Ը��
function confirm_use()

local use_time = GetTime();

	-- �����û�������ɾͲ���ʹ��
	if GetPlayerFaction() == 0 then
		Say("B�n ch�a gia nh�p m�n ph�i, kh�ng th� s� d�ng v�t ph�m n�y",0);
		return
	end

	if GetTime() - GetTask(USE_TIME) < 86400 then
		Say("B�n �� d�ng s� m�n th�nh nguy�n th�, trong 24h kh�ng th� s� d�ng ti�p",0)
		return
	end

	if DelItem(2,1,1019,1) == 1 then	
		SetTask(USE_TIME,use_time);
		Say("B�n �� d�ng s� m�n th�nh nguy�n th�, trong 24h t� l� nh�n nhi�m v� s� m�n ng�u nhi�n g�p ��i",0)
	else
		Say("B�n kh�ng mang s� m�n th�nh nguy�n th�, kh�ng th� s� d�ng.",0)
	end
	
end

--ȡ��ʹ��ʦ����Ը��
function cancel_use()

end