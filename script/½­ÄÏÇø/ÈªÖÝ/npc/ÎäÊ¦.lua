
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, kh�ng th� h�c v� c�ng n�a, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==9) then
		task_009_00();
		return
		
	elseif (nState>9) then
	
		if GetSkillLevel(20) ==0 then
		
			Say("Ta ��y l� t�ng gi�o ��u c�a 80 v�n c�m qu�n, giang h� ��nh ��nh ��i danh l� t�n th� v� s�. Ch� c�n c� 5 l��ng b�c, ta s� d�y ng��i thu�t khinh c�ng. Ch�ng hay ng��i c� h�ng th� kh�ng?",
				2,
				"Ta mu�n h�c khinh c�ng./yes_skill",
				"Ta kh�ng c� h�ng th�!/no_skill");
				return
				
		
		else
		
			Talk(1,"","K� ��n b�i s� h�c ngh� kh� nhi�u, giang h� ng�y sau s� r�t n�o nhi�t!");
			return
			
		end;
	
	elseif (nState<9) then
	
		Talk(1,"","K� ��n b�i s� h�c ngh� kh� nhi�u, giang h� ng�y sau s� r�t n�o nhi�t!");
		return		
		
	end;

end


function yes_skill()

	if GetCash()<500 then 
		Talk(1,"","Mang ti�n �� m�i c� th� h�c v� c�ng!");
		return
	else
		Pay(500);
		Talk(1,"","Th�y ch�a? C� ti�n th� chuy�n g� c�ng l�m ���c!");
		LearnSkill(20);
		TaskTip("B�n h�c ���c k� n�ng Khinh c�ng!");
		return
	end;
	
end;

function no_skill()

end;
