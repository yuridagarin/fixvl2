
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���ɽ����˽ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- Modify by yanjun
--2008/06/02 AM 11:43

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\faction\\faction_head.lua");

--=============================================================================
function main()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th�ch xu�t hi�n tr�n giang h�, kh�p n�i bang ph�i tranh h�ng, kh�ng bi�t ��y l� ph�c hay l� h�a cho gi�i v� l�m!");
	end;
	list_content(1);
end;

