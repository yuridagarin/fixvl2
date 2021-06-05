-- ��Ӣ���ս ������
-- by windle 2009-2-13 14:48

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse()
	local nDate = tonumber(date("%y%m%d%H"));
--	if nDate >= 12112900 then
--		return 0;
--	end
	local tSel = {
--		"T�m hi�u c�ch s� d�ng V� L�m Th�p Nh� L�nh/#about(1)",
		"Ta mu�n nh�n v�ng s�ng danh hi�u/getSfxEffect",
--		"Ta mu�n nh�n hi�u �ng v� kh�/getWeaponSfxEffect",
--		"Ta mu�n nh�n ph�n th��ng cho b�ng h�u/getAward_hongbao",
		"K�t th�c ��i tho�i/nothing",
	}
	
	Say("V� L�m Th�p Nh� L�nh l� n�i ph�t th��ng cho c�c gi�i ��u, qu� ��ng ��o c� th� xem th�m th�ng tin chi ti�t b�n d��i.", getn(tSel), tSel);
end

function about(page)
	local info = {
		{
		"H��ng d�n c�ch s� d�ng V� L�m Th�p Nh� L�nh: \n",
		"1. Ch� th�ch �v�ng danh hi�u�: C� V� L�m Th�p Nh� L�nh trong tay, qu� ��ng ��o c� th� nh�n v�ng danh hi�u v� hi�u �ng v� kh� b�ng c�ch nh�p v�o d�ng ch�n �ta mu�n nh�n v�ng danh hi�u�.\n",
		"L�u �: V�ng danh hi�u s� b� m�t khi ��ng ��o chuy�n b�n ��, ho�c ng�t k�t n�i v�i m�y ch�. �� k�ch ho�t l�i v�ng danh hi�u, ��ng ��o h�y nh�p l�i v�o d�ng ch�n tr�n V� L�m Th�p Nh� L�nh.\n",
		},
		{
		"2. Ch� th�ch �nh�n ph�n th��ng cho b�ng h�u�: C�ng v�i �v�ng danh hi�u� nh�n ���c, ��ng ��o c�n c� th� nh�n th�m c�c ph�n qu� kh�c �� t�ng cho b�ng h�u c�a m�nh theo quy t�c nh� sau:\n",
		" _ M�i nh�n v�t tham gia gi�i ��u Bang H�i Tinh Anh c� th� nh�n t�i �a 5 Thanh Phong Bao.\n",
		" _ Ch� c� nh�n v�t c�p �� 73 tr� l�n �� gia nh�p h� ph�i m�i c� th� s� d�ng Thanh Phong Bao.\n",
		" _ M�i nh�n v�t ch� s� d�ng ���c 1 Thanh Phong Bao trong su�t th�i gian ho�t ��ng gi�i ��u Bang H�i Tinh Anh.\n",
		},
		{
		"3. Ch� th�ch �nh�n ph�n th��ng trong gi�i ��u Bang H�i Tinh Anh�, C� 2 h�nh th�c nh�n th��ng nh� sau:\n",
		" - Nh�n ph�n th��ng t� c�c tr�n ��u di�n ra trong v�ng lo�i tr�c ti�p.\n",
		" - Nh�n ph�n th��ng t� c�c tr�n ��u di�n ra trong v�ng Chung K�t.\n",
		" - Nh�n ph�n th��ng top 10 anh h�ng (sau m�i tr�n ��u).",
		}
	}
	local tCallback = {"#about(2)", "#about(3)", "OnUse"};
	local msg = "";
	for k,v in info[page] do
		msg = msg..v;
	end
	Talk(1, tCallback[page], msg);
end

function getSfxEffect()
	SetCurrentNpcSFX(PIdx2NpcIdx(),921,1,1);
end

function getWeaponSfxEffect()
	BindWeaponEffect("L�c H�",1)	
end

function getAward_hongbao()
	if GetTask(TASKID_JYBHZ_GET_HONGBAO) > 1 then
		Talk(1,"","M�i nh�n v�t ch� c� th� nh�n 5 Thanh Phong Bao, ��i hi�p �� nh�n r�i m�.");
		return
	end
	if gf_CheckInv(5,50,"") ~= 1 then
		return
	end	
	SetTask(TASKID_JYBHZ_GET_HONGBAO, 5);
	for i=1,5 do
		local nRet, nItemIdx = gf_AddItemEx({2,1,370,1,1},"Thanh Phong Bao");
		if nRet ==1 then
			SetItemExpireTime(nItemIdx,45*24*3600)
		end
	end
	WriteLogEx("Bang hoi tinh anh 8","nh�n 5 Thanh Phong Bao","","","",GetTongName())
end
