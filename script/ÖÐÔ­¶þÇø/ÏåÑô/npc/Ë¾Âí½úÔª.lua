-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

Include("\\script\\online\\qixi06\\mission_head.lua");

szNpcName = "<color=green>T� M� T�n Nguy�n<color> :"

function main()
	--local nDate = tonumber(date("%y%m%d"))
	--local nCurDate = GetTask(TSK_NEWRES_CALC_DAILY)
	--if nCurDate ~= nDate then

	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ph��ng �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ng�c �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
	end

	local nSongCount, nLiaoCount = 0,0	
	nSongCount = BT_GetPlayerCount(SONG_ID)
	nLiaoCount = BT_GetPlayerCount(LIAO_ID)
	local tSay = {
--		"Kh�i ��ng chi�n tr��ng/open_newres",
--		format("Ta mu�n tham gia Thi�n M�n Tr�n-T�i Nguy�n Chi�n (S� ng��i hi�n t�i T�ng: [%d] Li�u: [%d])/newres_sign_up",nSongCount, nLiaoCount),		
		"Ta �ang b�n vi�c/gf_DoNothing",	
	}		
	Say(szNpcName.."T� M� gia kh�ng c� ti�ng t�m tr�n giang h� l� v� b�o th�, kh�ng bi�t n�m b�t th�i c� ch� ��ng xu�t k�ch. T� nay ta s� l�m thay ��i t�nh h�nh n�y. Nghe n�i hai n��c T�ng Li�u �ang giao tranh c�n r�t nhi�u t�i nguy�n. T� M� ta m� chi�n d�ch khai th�c t�i nguy�n chi�n cho c� hai phe. Ng��i mu�n tham gia kh�ng?",getn(tSay),tSay)
end