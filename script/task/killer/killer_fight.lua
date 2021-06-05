-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ɱ��Npcս�������ű�                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function OnDeath(NpcIndex)

local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
local nKillerName = "S�t th� "..getKillerName(nSurnameID,nFirstnameID);
local nKillerParName = nKillerName.." ��ng h�nh ";
local nNum = random(3,5);--������ָ���ͬ��������3��5����
local nKillerParModeID = getKillerParModeID();
local nKillerParMode = getKillerParMode(nKillerParModeID);
local nMapID,nWx,nWy = GetWorldPos();
local i = 0;
local argKillerParIndex = {};
local nKillerIndex = GetTask(TASK_KILLER_NPCINDEX_ID);
local NpcIndex = tonumber(NpcIndex)
local nState = GetTask(TASK_KILLER_STATE_ID);

	SetNpcLifeTime(NpcIndex,0);--ʹ��ʬ����ʧ
	SetNpcScript(NpcIndex,"");--������Npc���ҽű�
	
	if nState == 1 and nKillerIndex == NpcIndex then--�ж�ɱ����ɱ�ֵ�����Ƿ�Ϊ�����������	 
	
		SetTask(TASK_KILLER_STATE_ID,2);--����������ñ���ֵΪ2
		
		local nExp = GetLevel()*GetLevel()*12;
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		
		TaskTip("Nhi�m v� ho�n th�nh! Xin ��n g�p B� ��u l�nh th��ng!");
		
		--�Ƴ�ʱ�䴥����
		RemoveTrigger(GetTrigger(500));
	
		--30%���������¼�
		if random(1,100) <= 30 then
		
			--80%���ָ���ͬ��then
			if random(1,100) <= 80 then
				
				Talk(1,"","<color=green>"..nKillerName.."<color>: ��ng h�nh c�a ta s� kh�ng tha cho ng��i��");
				
				nNum,argKillerParIndex = CreateNpc(nKillerParMode,nKillerParName,nMapID,nWx,nWy,-1,nNum,1,200);
				
				nNum = nNum-1;
				
				--����ɱ��ͬ��ű�
				for i=0,nNum do
				
					SetNpcScript(argKillerParIndex[i], "\\script\\task\\killer\\killer_par_fight.lua");
					SetNpcLifeTime(argKillerParIndex[i],600);

				end;
				
			else
				Talk(2,"","<color=green>"..nKillerName.."<color>: Ta c� l�m ma c�ng s� kh�ng tha cho ng��i��","B�n ��nh b�i <color=yellow>"..nKillerName.."<color> l�y ���c 1 <color=yellow>l�nh b�i S�t th�<color>.");
				--����ɱ����
				AddItem(2,1,195,1,1);
			end;
			
		else
		
			Talk(1,"","<color=green>"..nKillerName.."<color>: Ta c� l�m ma c�ng s� kh�ng tha cho ng��i��");
		
		end;
		local nLevel = GetLevel();
		if random(1,100) <= 10 then
			local nLSLevel = 0;
			if nLevel <= 30 then
				nLSLevel = 1;		
			elseif nLevel <= 40 then
				nLSLevel = random(1,2);
			elseif nLevel <= 50 then
				nLSLevel = random(1,3);
			elseif nLevel <= 60 then
				nLSLevel = random(1,4);
			elseif nLevel <= 80 then
				nLSLevel = random(1,5);
			elseif nLevel <= 100 then
				nLSLevel = random(2,5);
			end;
			lspf_AddLingShiInBottle(nLSLevel,1);
			if nLSLevel ~= 0 then
				Msg2Player("B�n nh�n ���c 1 "..nLSLevel.." (c�p) Linh th�ch, �� nh�p v�o T� Linh ��nh");		
			end;
		end;
	end;
end;
