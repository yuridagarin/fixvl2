
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ͷ�ļ�
-- Edited by peres
-- 2005/08/08 PM 13:45

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

-- �����������ͷ�ļ�
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\item\\item_billing\\shimenqingyuanshu.lua");

function main()

local nMap, nX, nY = GetWorldPos();
local nRandom = 1;

	if GetTime() - GetTask(USE_TIME) < 86400 then
		nRandom = ADD_RATE;
	end
	
	-- ����֮һ�ĸ��ʴ�������¼�
	if random(1,3) >= nRandom then
		return	
	end;

	-- �����û�������ɾͲ�������
	if GetPlayerFaction()==0 then return end;
	
	-- �����ȡս��״̬Ϊ 0 ��Ҳ������
	if GetFightState()==0 then return end;
	
	-- �����ͼID���ڣ������Ͳ����������ڣ������ĵ�ͼΪ�����ͼ��
	if nMap > 700 then
		return
	end
	if CreateTask() == 1 then	--�����ɹ���ŷ�֪ͨ��edited by yanjun 06-11-15
		RandomTaskTip("B�n nh�n ���c nhi�m v� s� ��!");
		Msg2Player("N�u li�n t�c 2 l�n kh�ng th� ho�n th�nh nhi�m v� s� ph� giao s� b� m�t 1 �i�m danh v�ng!");
	end;
end;


function GetRandomTimer()
	return 3600;
end;