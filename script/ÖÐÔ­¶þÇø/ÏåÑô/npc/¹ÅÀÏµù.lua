Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>C� L�o Ta<color>:"
function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Th�ng tin chi ti�t ho�t ��ng \"Sinh T� V� Ng�\" , ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	--tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 2/STVN2_NhanNhiemVu")
	tinsert(tbSayDialog,"Ti�n �� ho�n th�nh nhi�m v�/STVN2_TienDoNhiemVu")
	tinsert(tbSayDialog,"Ho�n th�nh nhi�m v� Sinh T� V� Ng� 2/STVN_Active")
	tinsert(tbSayDialog,"�i�m t�ch c�c c�a b�n th�n/menu_point")		
	tinsert(tbSayDialog,"Nh�n th��ng m�i ng�y/Award_Daily_Menu")
	tinsert(tbSayDialog,"Nh�n th��ng Th�ng Ti�n (theo ��ng c�p)/menu_award")
	tinsert(tbSayDialog,"Xem th�i gian c�n l�i �� nh�n th��ng/show_time")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/gf_DoNothing"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end