
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��װ���ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
--*****************************************���峣����Ԥ����*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=518					--��������ȹ
TASK_GATHER_FLAG=1931 --������Ʒ�ɼ���ʾ

strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()
		strName = GetTargetNpcName();
		if random(1,15) == 1 then
			NpcChat(GetTargetNpc(),"Kh�m n�m linh th�ch d�ng �� l�m trang b� B�t Qu�i �� xu�t hi�n tr�n giang h�, ta s�p c� m�i l�m �n r�i ��y!");
		end;	
		if strName=="" or strName==nil then return end;
		strTitle = "<color=green>"..strName.."<color>: ";
		
		local nState = TE_GetTeachState()
		local nLevel = GetLevel()

	----------------------------------------------���Ի�-----------------------------------------------
		if (nState==2) and (GetSex()== 2) then	
			task_002_00_female();
			return
		else
			i=random(1,3)
			if (i == 1) then
				Sale(34)
			elseif (i == 2) then
				Sale(34)
			else
				Sale(34)
			end
		end
		return
end;

