-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ɱ�ֶԻ��ű�                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S�t th� "; end;	

	Say("<color=green>"..npcName.."<color>: Ng��i l�m g� v�y? C� �i qua �i l�i tr��c m�t ta, l� kinh ��ng ��n Mao ��i gia ng��i c� g�nh n�i kh�ng!",
		2,
		"Ta tr� h�i cho d�n/Killer_Fight",
		"Xin l�i! Nh�n l�m ng��i./Killer_Exit");
	
end;


function Killer_Fight()

local npcName = GetTargetNpcName();
local npcID = GetTargetNpc();
local nKillerID = GetTask(TASK_KILLER_NPCINDEX_ID);
local nTask_State = GetTask(TASK_KILLER_STATE_ID);
local nPlayerName = GetPlayerSex();
		
	if npcID == nKillerID and nTask_State == 1 then
		
		--10%���ʲ�ս��ʤ
		if random(1,100)>90 then
			Say("<color=green>"..npcName.."<color>:"..nPlayerName.."Xin tha m�ng! Ti�u nh�n xin theo ng��i v� quy �n.",0);
			
			SetTask(TASK_KILLER_STATE_ID,2);--����������ñ���ֵΪ2
			TaskTip("Nhi�m v� ho�n th�nh! Xin ��n g�p B� ��u l�nh th��ng!");
			--�Ƴ�ʱ�䴥����
			RemoveTrigger(GetTrigger(500));
			SetNpcScript(npcID,"");--������Npc���ҽű�
			SetNpcLifeTime(npcID,0);
				if random(1,100) > 94 then
					AddItem(2,1,195,1,1);
				end;
		else
			Say("<color=green>"..npcName.."<color>: Hay l�m!",0);
		
			SetNpcScript(npcID, "\\script\\task\\killer\\killer_fight.lua");
			ChangeNpcToFight(npcID);
		end;
		
	else
		Say("<color=green>"..npcName.."<color>: T�n ti�u t� n�y tr�nh sang m�t b�n! ��ng l�m phi�n b�n ��i gia!",0);
	end;
	
end;


function Killer_Exit()

end;
	