-- ��Ӣ���ս ���
-- by windle 2009-2-13 14:35

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	if GetTask(TASKID_JYBHZ_USE_HONGBAO) >= 1 then
		Talk(1,"","M�i ng��i ch� c� th� s� dung Thanh Phong Bao 1 l�n.!");
		return
	end
	if GetLevel() < 73 then
		Talk(1,"","��i hi�p ph�i c�p 73 tr� l�n m�i c� th� s� d�ng.");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","��i hi�p ph�i gia nh�p h� ph�i m�i c� th� s� d�ng.");
		return
	end
	Say("S� d�ngThanh Phong Bao thu ���c 48000000 kinh nghi�m, ��i hi�p c� ch�c mu�n s� d�ng??",
		2,
		"���c/#onOpen("..nItemIdx..")",
		"Kh�ng c�n ��u/nothing");
end

function onOpen(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TASKID_JYBHZ_USE_HONGBAO, GetTask(TASKID_JYBHZ_USE_HONGBAO) + 1);		
		gf_Modify("Exp", 48000000);
		WriteLogEx("Bang hoi tinh anh 5","s� d�ng Thanh Phong Bao","","","",GetTongName())		
	end
end
