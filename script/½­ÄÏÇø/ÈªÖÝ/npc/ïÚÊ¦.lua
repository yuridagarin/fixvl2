
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		Say("M�i ng��i h�y mau ��n <color=yellow>Th�nh ��<color> ��t mua Sinh Th�n Cang!",
			1,	
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	end
	
end
