-- ��Ӣ���ս ���
-- by windle 2009-2-13 14:35

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) > 09113024 then--ʹ������Ҫ�޸�
		return
	end
	if GetTask(TASKID_JYBHZ_USE_HONGBAO) >= 2 then
		Talk(1,"","M�i ng��i ch� c� th� s� dung Bang H�i Tinh Anh H�ng Bao 2 l�n.!");
		return
	end
	if GetLevel() <= 65 then
		Talk(1,"","��i hi�p ph�i c� c�p 65 tr� l�n m�i c� th� s� d�ng.");
		return
	end
	Say("S� d�ng Bang H�i Tinh Anh H�ng Bao thu ���c 2500000 kinh nghi�m, ��i hi�p c� ch�c mu�n s� d�ng??",
		2,
		"���c/#onOpen("..nItemIdx..")",
		"Kh�ng c�n ��u/nothing");
end

function onOpen(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TASKID_JYBHZ_USE_HONGBAO, GetTask(TASKID_JYBHZ_USE_HONGBAO) + 1);		
		gf_Modify("Exp", 2500000);
		WriteLogEx("Bang hoi tinh anh 2","s� d�ng H�ng Bao","","","",GetTongName())		
	end
end
