-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������Ʒ ���ķ����ܺ� Script
-- By StarryNight
-- 2007/08/03 AM 11:11

-- �Ҹ�����ʵ������Щ������䱻������Ƭ�Ρ�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	--�ж�������
	if nStep_XBTask_01 >= 24 and nStep_XBTask_01 <= 28 then
	
	strTalk = {
		"T�y H� ph�p v��ng m�t h�m: K�t c�u t�ng 2 g�n gi�ng v�i t�ng 1, ��ng t�y nam b�c ��u c� b�n Tr�n M� t��ng qu�n, ��nh b�i ch�ng th� ph� ���c phong th�y t�ng 2, r��ng b�u s� xu�t hi�n. R��ng b�u �t s� c� Tr�n M� linh th� tr�n gi�, n�u n� l� Qu� t��ng qu�n th� ph�i h�t s�c c�n th�n, ch� c� Phi Th��ng ��o ph� c�a Phi Th��ng ��o Nh�n m�i �� s�c tri�t h�, b�ng kh�ng r��ng b�u s� bi�n m�t, c�n ph�i ph� h�y Phong Th�y tr�n l�n n�a.",
		}
	
	else
		
		strTalk = {
			"M�t h�m n�y �� kh�ng c�n t�c d�ng n�a.",
			}
			
		DelItem(2,0,716,1);--�ܺ�����ɾ��
	
	end
	
	TalkEx("",strTalk);
	
end