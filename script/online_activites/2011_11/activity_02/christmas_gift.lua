--ʥ������ű�

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	--ʱ���ж�
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,12,16,0,0,0)
	local nOutTime = MkTime(2012,01,09,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng")
		return
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end