-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPCԬ����Script
-- By StarryNight
-- 2007/06/12 AM 11:25

-- ��л�������������ҷ�ƨ

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nNpcIndex = GetTargetNpc();

	--ȡ����Indexֱ�ӷ���
	if nNpcIndex == 0 then
		return
	end

	--�ж��Ƿ�Ϊ��ǰ����ٻ�������Npc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex then
	
		---------------------------------- ������05�²ְ���----------------------------------
		
		--��Ԭ���ƶԻ�ȡ��·��ͼ
		if nStep_XBTask == 19 then
			task_005_04_0();
			return
		end
		
		--��Ԭ���ƶԻ�׼������
		if nStep_XBTask == 23 then
			task_005_08_0(nNpcIndex);
			return
		end
		
		---------------------------------- ������07�ж��----------------------------------
		
		--��Ԭ���ƶԻ�������ҩ
		if nStep_XBTask == 35 then
			task_007_07_0();
			return
		end
	
	else
		strTalk = {
			"D��ng nh� nh�m ng��i."
			}
		TalkEx("",strTalk);
	end

end;

--Ԭ���������ű�
function OnDeath(NpcIndex)

	NpcIndex = tonumber(NpcIndex);
	SetNpcLifeTime(NpcIndex,15);--ʹ��ʬ����ʧ
	SetNpcScript(NpcIndex,"");--������Npc���ҽű�
	
	if GetTask(TASK_XB_ID) == 23 and GetTask(YUANFEIYUN_NPCINDEX) == NpcIndex then
		--ˢ������ɱ��
		KillFollower();
		--���·��ͼ��Ʒ
		DelItem(2,0,693,1);
		DelItem(2,0,694,1);--ɾ������
		task_005_08_3();
	end
		
end