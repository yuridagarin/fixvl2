-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ�����񶥼�ɱ�ֶԻ��ű�                  
-- Edited by starry night                                 
-- 2005/11/28 PM 18:26                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S�t th� "; end;	

	Say("<color=green>"..npcName.."<color>:��",
		2,
		"Cu�i c�ng c�ng �� ta b�t ���c ng��i!/Killer_Fight",
		"Kh�ng c� g�/Killer_Exit");
	
end;

function Killer_Fight()

	local npcName = GetTargetNpcName();
	local npcID = GetTargetNpc();
	
		if npcID == nil or npcID == 0 or npcName == nil then
			return
		end

		Say("<color=green>"..npcName.."<color>: Kh�ng ng� ng��i c� th� ��nh b�i s�t th� c�a Nh�t Ph�m ���ng ta, th�t kh�ng ��n gi�n ch�t n�o!",0);
		
		SetNpcScript(npcID, "\\script\\task\\killer\\killer_top_fight.lua");
		ChangeNpcToFight(npcID, 5);
		
end;


function Killer_Exit()
end;	