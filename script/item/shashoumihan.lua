-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ɱ���ܺ��ű�                  
-- Edited by starry night                                 
-- 2005/10/24 PM 17:02                                    
                                                          
-- ======================================================
--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse()

local nState = GetTask(TASK_TOPKILLER_STATE)

	if nState == 1 then
		local nSurnameID = GetTask(TASK_TOPKILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_TOPKILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
		local nPosID = GetTask(TASK_TOPKILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getTopPosData(nPosID);
		
		Say("H�y nhanh ch�n ��n <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>!",0);
		
	else
		
		Say("Trong m�t h�m kh�ng c� tin t�c n�o h�u �ch!",0);
		
	end;

end