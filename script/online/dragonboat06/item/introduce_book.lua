Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnUse()
	local selTab = {
				"Gi�i thi�u quy t�c �ua thuy�n r�ng./knowrule",
				"Gi�i thi�u c�c lo�i thuy�n r�ng./knowboat",
				"Tra xem b�ng x�p h�ng �ua thuy�n./seeworldrank",
				};
	if checkifinplace() == 1 then
		selTab[getn(selTab)+1] = "Tra xem tin t�c t�t c� ng��i ch�i trong b�n ��./seeplayerinfo";
		selTab[getn(selTab)+1] = "Tra xem x�p h�ng ng��i ch�i hi�n t�i trong b�n ��/seerank";
	end;
	selTab[getn(selTab)+1] = "��ng/nothing";
	Say("<color=green>S�ch ch� d�n �ua thuy�n:<color> T�ng c�ng b�n �� thi ��u <color=yellow>"..GetTask(ATTENDCOUNT).."tr�n<color>, s� �i�m l� <color=yellow>"..GetTask(BONUSPOINT).."<color>.",getn(selTab),selTab);
end;

function checkifinplace()
	local MapID = GetWorldPos();
	for i=1,3 do
		for j=0,7 do
			if MapID == i*1000+70+j then
				return 1;
			end;
		end;
	end;
	return 0;
end;
--=================================================================================
function knowrule()
	local selTab = {
			"Gi�i thi�u �ua thuy�n r�ng./knowmatch1",
			"Gi�i thi�u c�ch ch�i./knowtech",
			"X�p h�ng v� c�ch t�nh �i�m./knowbonus",
			"V� m�c tr��c./OnUse",
			"��ng/nothing",
			};
	Say("<color=green>S�ch ch� d�n �ua thuy�n:<color> B�n c� th� tra xem:",getn(selTab),selTab);
end;

function knowmatch1()
	Talk(1,"knowmatch2","<color=green>S�ch ch� d�n �ua thuy�n:<color> Thu th�p xong v�t li�u ��n g�p Long Chu s� gi� ch�n ch� t�o thuy�n r�ng. Long Chu s� gi� kh�ng l�y c�ng l�m thuy�n r�ng. Trong �� x�c su�t nh�n ���c thuy�n r�ng th��ng l� r�t l�n, n�u g�p may m�n c� th� nh�n ���c thuy�n r�ng k� n�ng. Sau khi c� thuy�n r�ng, v� g�p Long Chu s� gi� tham gia �ua thuy�n r�ng. Tr��c ti�n ch�n tham gia �ua thuy�n sau �� ch�n ti�n v�o b�n �� thi ��u. Sau 4 ph�t 30 gi�y k� t� khi ng��i ��u ti�n v�o b�n �� thi ��u ho�c c� 8 ng��i b�o danh th� �ua thuy�n ch�nh th�c b�t ��u. Khi b�o danh, tr�n ng��i kh�ng ���c mang v� kh�, �m kh�, n�n, �o, qu�n, trang s�c, m�t t�ch nh�ng c� th� mang ngo�i trang, ��ng th�i trong h�nh trang ph�i c� 1 thuy�n r�ng.");
end;
function knowmatch2()
	Talk(1,"knowmatch3","<color=green>S�ch ch� d�n �ua thuy�n:<color> Sau khi ti�n v�o b�n �� thi ��u, ng��i ch�i s� ���c ��a ��n �i�m xu�t ph�t. Th�i gian chu�n b� l� 30 gi�y �� ng��i ch�i trang b�, l�n thuy�n r�ng. Trong qu� tr�nh thi ��u ng��i ch�i kh�ng th� m�c th�m b�t k� trang b� n�o, ��ng th�i kh�ng th� thay ��i thuy�n c�ng nh� xu�ng thuy�n. Sau khi t�i ��ch ��n, ng��i ch�i s� tr� v� tr�ng th�i b�nh th��ng.");
end;
function knowmatch3()
	Talk(1,"knowmatch4","<color=green>S�ch ch� d�n �ua thuy�n:<color> Trong qu� tr�nh thi ��u, ng��i ch�i c� th� s� d�ng k� n�ng c�a thuy�n r�ng. Trong b�n �� thi ��u c� nh�ng c�ng c�. N�u nh� �i qua 2 c�ng c� c� m�u ch� ��nh s� c� hi�u qu� n�o ��. Nh�ng c�ng c� c� m�u h�ng, v�ng, xanh s� c� hi�u qu� c� l�i, c�n m�u cam, m�u t�m s� c� hi�u qu� b�t l�i. Trong b�n �� s� ng�u nhi�n xu�t hi�n b�o r��ng, khi m� s� c� hi�u qu� ng�u nhi�n. �ua thuy�n s� chi�u theo th� t� ��n ��ch �� x�p h�ng.");
end;
function knowmatch4()
	Talk(1,"OnUse","<color=green>S�ch ch� d�n �ua thuy�n:<color> S� ng��i tham d� nhi�u �t, th� h�ng s� �nh h��ng ��n �i�m t�ch l�y.<enter>2 ng��i: 1, 0<enter>3 ng��i: 2, 1, 0<enter>4 ng��i: 2, 1, 1, 0<enter>5 ng��i: 3, 2, 1, 0, 0<enter>6 ng��i: 3, 2, 1, 1, 0, 0<enter>7 ng��i: 4, 3, 2, 1, 1, 0, 0<enter>8 ng��i: 5, 4, 3, 2, 1, 1, 0, 0");
end;


function knowtech()
	Talk(1,"knowrule","<color=green>S�ch ch� d�n �ua thuy�n:<color> Trong qu� tr�nh thi ��u b�n c� th� s� d�ng k� n�ng c�a thuy�n r�ng �� c�ng k�ch ng��i ch�i kh�c, ��ng th�i c� th� v��t qua 2 c�ng c� �� c� 1 hi�u qu� ��c bi�t, v� d�: m�i l�n v��t qua c�ng c� m�u �� v� m�u xanh s� l�m cho�ng ng��i ��ng ��u trong 2 gi�y. ��ng th�i tr�n m�t s�ng s� xu�t hi�n ng�u nhi�n 1 s� b�o r��ng khi m� s� c� hi�u qu� b�t ng�. Ng��i ch�i l�i d�ng nh�ng k� n�ng n�y �� ��nh b�i c�c ��i th� kh�c tranh gi�nh v� tr� th� nh�t.");
end;

function knowbonus()
	Talk(1,"knowrule","<color=green>S�ch ch� d�n �ua thuy�n:<color> Ch� c� ng��i ch�i nh�n ���c b�ng th�nh t�ch m�i xem nh� ho�n th�nh 1 tr�n ��u. Th� h�ng ���c t�nh nh� sau: d�a v�o th� t� v� ��ch �� x�p h�ng, ng��i ch�i n�o v�n ch�a ho�n th�nh s� chi�u theo ng��i ch�i v� ��ch sau c�ng khi k�t th�c cu�c �ua thuy�n �� x�p h�ng, n�u c�ng v� ��ch ng��i ch�i n�o c� �i�m �t h�n s� x�p tr�n, n�u b�ng �i�m th� ng��i ch�i n�o v�o b�n �� thi ��u tr��c s� x�p tr�n. Sau khi tr�n ��u k�t th�c s� �i�m nh�n ���c v� s� tuy�n th� ho�n th�nh ���ng �ua c� li�n quan, s� ng��i c�ng nhi�u th� �i�m s� c�ng cao.");
end;
--==================================================================================
function seeplayerinfo()
	if checkifinplace() == 0 then
		return 0;
	end;
	local MSIDTab = {};
	local PIDTab = {};
	local playerTab = {};
	local OldPlayerIndex = PlayerIndex;
	local tabIndex = 0;
	local msidx = 0;
	local sidx = 0;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_PLAYER);
		if sidx > 0 then
			MSIDTab[i] = msidx;
			PIDTab[i] = sidx;
		end
	end
	for i=1,getn(PIDTab) do
		PlayerIndex = PIDTab[i];
		if PlayerIndex > 0 then
			if GetTask(STATUS) == CAMP_PLAYER then
				playerTab[tabIndex+1] = GetName().."/#moreinfo("..MSIDTab[i]..")";
				tabIndex = tabIndex +1;
			end;
		else
			Write_Log("PlayerIndex Error","introduce_book.lua,seeplayerinfo()");
		end;
	end;
	playerTab[getn(playerTab)+1] = "V� m�c l�c tr��c./OnUse";
	playerTab[getn(playerTab)+1] = "��ng/nothing";
	PlayerIndex = OldPlayerIndex;
	Say("<color=green>S�ch ch� d�n �ua thuy�n:<color> N�u mu�n tra xem tin t�c ng��i ch�i n�o �� h�y ch�n t�n ng��i ��.",getn(playerTab),playerTab);
end;

function moreinfo(msid)
	if checkifinplace() == 0 then
		return 0;
	end;
	local OldPlayerIndex = PlayerIndex;
	local sContent = "";
	local sTime = "";
	local nMin,nSec = 0,0;
	PlayerIndex = MSDIdx2PIdx(MISSION_ID,msid);
	if PlayerIndex >0 then
		local nBestTime = GetTask(BEST_TIME);
		if nBestTime == 0 then
			sResult = "Kh�ng c� th�nh t�ch.";
		else
			nBestTime = nBestTime/18;
			nMin = floor(nBestTime/60);
			nSec = format("%.2f",nBestTime - nMin*60);	--С�������λ�͹���
			sTime = "<color=red>"..nMin.." Ph�t "..nSec.." gi�y<color>"
		end;
		sContent = "                                  <color=green>Tin t�c ng��i ch�i<color><enter> T�n:<color=yellow>"..GetName().."<color><enter>S� l�n �ua:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>Hi�n t�i �i�m:<color=yellow>"..GetTask(BONUSPOINT).."<color><enter>Th�i gian nhanh nh�t:"..sTime;
	else
		Write_Log("PlayerIndex Error","introduce_book.lua,moreinfo()");
	end;
	PlayerIndex = OldPlayerIndex;
	Talk(1,"seeplayerinfo",sContent);
end;
--==================================================================================
function seerank()
	if checkifinplace() == 0 then
		return 0;
	end;
	local sContent = "";
	local OldPlayerIndex = PlayerIndex;
	local RankTab = Get_Rank();
	local nPlayerCount = getn(RankTab);
	for i=1,nPlayerCount do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			sContent = sContent.."th�"..NumTab[i].." h�ng:<color=yellow>"..GetName().."<color><enter>";
		else
			Write_Log("PlayerIndex Error","introduce_book.lua,seerank()");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	Talk(1,"OnUse",sContent);
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "Quay l�i m�c l�c tr��c./OnUse";
	selTab[getn(selTab)+1] = "��ng/nothing";
	Say("<color=green>S�ch ch� d�n �ua thuy�n:<color> B�n mu�n t�m hi�u thuy�n r�ng n�o?",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Lo�i thuy�n r�ng sai! T�n nh�n v�t:"..GetName())
		return 0;
	end;
	sConten = "<color=green>S�ch ch� d�n �ua thuy�n:<color><color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function seeworldrank()
	OpenRankWindow(100);
end;