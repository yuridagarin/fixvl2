--11�»ɽ���񻨽ű�
--by liubo

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	else
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng")
	end
end