-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 杀手密函脚本                  
-- Edited by starry night                                 
-- 2005/10/24 PM 17:02                                    
                                                          
-- ======================================================
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse()

local nState = GetTask(TASK_TOPKILLER_STATE)

	if nState == 1 then
		local nSurnameID = GetTask(TASK_TOPKILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_TOPKILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
		local nPosID = GetTask(TASK_TOPKILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getTopPosData(nPosID);
		
		Say("H穣 nhanh ch﹏ n <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>!",0);
		
	else
		
		Say("Trong m藅 h祄 kh玭g c? tin t鴆 n祇 h鱱 輈h!",0);
		
	end;

end