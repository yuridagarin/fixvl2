--=============================================
--create by liub 2011.8.2
--describe:Խ�ϰ�8�·ݻ **�ϵ������±��ű��ļ�
--=============================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")

function OnUse(nItem)
	--ʱ���ж�
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,08,26,0,0,0)
	local nOutTime = MkTime(2011,10,03,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng")
		return
	end
	if DelItemByIndex(nItem,1) ~= 0 then
		gf_Modify("Exp",250000)
		gf_Modify("Rep",3)
		SetTask(336,GetTask(336)+3)
		WriteLogEx(VET_201108_CAKE_LOG_TITLE, "nh�n 250 ng�n exp, 3 �i�m danh v�ng, 3 �i�m s� m�n")
		Msg2Player("C�c h� nh�n ���c 3 �i�m S� M�n")
	end
end