
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

function main()

	-- ���֮һ�ĸ��ʴ�������¼�
--	if random(1,5)~=1 then
--		return	
--	end;
	
	ShowTaskNpc();   -- ��ʾ������Ϣ
	
end;


-- ɱ�ֽ���ʱ�Ļص�
function finish_kill()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- �õ����� NPC ���ڵ�ͼID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- �õ����� NPC ������
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- �õ����� NPC ���ڵ�ͼ������

local nKillIndex = GetTask(TASKKILL_ID); -- ��ȡɱ�ִ�����������

	Msg2Player("Ng��i �� ho�n th�nh nhi�m v�, mau v�"..strNpcMap.."t�m"..strNpcName.."Nh�n ph�n th��ng!");
	
	RemoveTrigger(GetRunningTrigger()); -- ɾ����ǰ�������еĴ�����
	RemoveTrigger(nKillIndex); -- Ϊ��ֹû���Ƴ��ɹ���ɾһ��
	
	CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- �����´����������ȥ��ԭ���� NPC
		
	Say("Ng��i �� ho�n th�nh nhi�m v�, mau v�"..strNpcMap.."t�m"..strNpcName.."Nh�n ph�n th��ng!",
		2,
		"Mau ��a ta v�!/#AcceptTask("..nNpcMapID..")",
		"�� ta t� �i!/Main_Exit");

end;


-- ���� 15 ���ӵ�ʱ��󴥷������麯��
function timercheck()

local nTimerIndex = GetTask(TASKTIMER_ID);
local nLost = GetTask(TASKCANCEL_ID);

	if GetTask(TASKSTATE_ID)==0 then return end;

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex); -- ɾ����ǰ�������еĴ�����


	-- �������û�����
	if GetTask(TASKSTATE_ID)~=3 then
		nLost = nLost + 1;
		Say("Qu� th�i gian l�m nhi�m v� s� m�n, hi�n ch�a l�m xong",0);
		if nLost>=2 then
			nLost = 0;
			SetTask(TASKCANCEL_ID, nLost); -- ���ۻ�ʧ�ܴ������
			SetTask(TASKSTATE_ID, 0); -- ������״̬��Ϊ��δ��ʼ			
			-- ���񴦷�
			TaskPunish();
			return
		end;
		SetTask(TASKCANCEL_ID, nLost);
		SetTask(TASKSTATE_ID, 0); -- ������״̬��Ϊ��δ��ʼ
	end;

end;