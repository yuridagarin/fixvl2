------------------------------------------------------------
-- ���Ʊ����Ľű� xuanhuangbaodan.lua
--
-- comment: ϴ��ȫ����PKֵ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,142
------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse(nIndex)
	local nPK = GetPKValue()
	if nPK == 0 then
		Talk(1, "", "�i�m PK hi�n t�i c�a c�c h� �ang l� 0, kh�ng c�n ph�i t�y PK!")
		return
	end
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)	
	if nExBigBCH < (120 * nPK) then
		Talk(1,"","Kh�ng �� gi� �y th�c B�ch C�u Ti�n ��n!")
		return
	elseif nExBigTTH < (60 * nPK) then
		Talk(1,"","Kh�ng �� gi� �y th�c Tam Thanh Ti�n ��n!")
		return
	elseif nExBigLTH < (60 * nPK) then
		Talk(1,"","Kh�ng �� gi� �y th�c L�c Th�n Ti�n ��n!")
		return
	elseif DelItemByIndex(nIndex, 1) == 1 then
		SetTask(2508,nExBigBCH - (120 * nPK))
		EatLiushen(3,-(60 * nPK))
		EatSanqin(3,-(60 * nPK))
		AddPKValue(nPK * (-1))
		WriteLogEx("Hoat dong thang 5", "t�y "..nPK.." �i�m PK")			
	end
end;



