-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII �ر�ͼ����ս�������ű�                  
-- Edited by starry night                                 
-- 2005/10/20 PM 17:29                                    
                                                          
-- ======================================================
--���òر�ͼͷ�ļ�
Include("\\script\\task\\killer\\cangbaotu_head.lua");

function OnDeath(NpcIndex)
local NpcIndex = tonumber(NpcIndex);

	SetNpcLifeTime(NpcIndex,0);--ʹ��ʬ����ʧ
	SetNpcScript(NpcIndex,"");--������Npc���ҽű�

		PayEquip(1);

end;