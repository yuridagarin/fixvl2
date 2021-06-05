Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\lib\\talktmp.lua")

SP_NPC_NAME = "<color=green> ��i S� ho�t ��ng: <color>";

SP_TITLE = "N�m M�i Vui V�, Cung Ch�c Ph�t T�i! Ta chu�n b� cho c�c ��i hi�p nh�ng ho�t ��ng vui v�, nhanh ch�n ��n tham gia �� nh�n th��ng nh�!";

SP_NPC_TALK = {
--	"Ho�t ��ng Ch�c T�t/sp_BaiNian",
	"Ho�t ��ng ��nh Ni�n Th�/sp_DaNianShou",
};

function sp_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

function sp_BaiNian()
	local tSay = {
		"Gi�i thi�u ho�t ��ng ch�c t�t/sp_BaiNian_Intro",
		"Gi�i thi�u ph�n th��ng ho�t ��ng ch�c t�t/sp_BaiNian_AwardInfo",
		"Nh�n bao l� x�/sp_BaiNian_GetLiShiBao",
		"tr� l�i/sp_ReturnMain",
		"Ra kh�i/nothing",
	};
	Say(SP_NPC_NAME..SP_TITLE, getn(tSay), tSay);
end

function sp_BaiNian_Intro()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Xu�n ��n r�i, ��i hi�p nhanh ��n ch� c�a ta nh�n bao L� X�, m� bao L� X� ra s� nh�n th�y nhi�m v� ch�c T�t, ch� c�n ng��i ho�n th�nh h�t c�c nhi�m v� ch�c T�t, th� c� th� nh�n ���c ph�n th��ng trong Bao L� X�. N�u nh� c� h�ng th�, m�i ng�y ��u c� th� �i ch�c T�t, ph�n th��ng trong bao L� X� r�t phong ph�, c�c ��i hi�p h�y c� g�ng l�n nh�!";
	tSay.sel = {
		{"\n Ph�n h�i", "sp_BaiNian"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_BaiNian_AwardInfo()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."M� Bao L� X� nh�n ���c kinh nghi�m, ch�n kh�, ph�o. M�i ng�y ��u tham gia ho�t d�ng, ph�n th��ng s� th�ng th�m. Ph�o l� m�t lo�i truy�n th�ng, c� th� d�ng �� �u�i Ni�n Th� �i.";
	tSay.sel = {
		{"\n Ph�n h�i", "sp_BaiNian"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_BaiNian_GetLiShiBao()
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	if BigGetItemCount(2, 1, 30624) > 0 then
		Talk(1,"",SP_NPC_NAME..format("%s h�nh trang kh�ng gian �� c� Bao L� X� r�i", gf_GetPlayerSexName()));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30624, 1}, "Bao L� X� N�m M�i", "Event T�t Kingsoft", "Nh�n bao l� x�", 0, 1);
end

function sp_DaNianShou()
	local tSay = {
		"Gi�i thi�u ho�t d�ng ��nh Ni�n Th�/sp_DaNianShou_Intro",
		"Gi�i thi�u ph�n th��ng ho�t ��ng ��nh Ni�n Th�/sp_DaNianShou_AwardInfo",
		"Mua ph�o/sp_DaNianShou_Buy",
		"tr� l�i/sp_ReturnMain",
		"Ra kh�i/nothing",
	};
	Say(SP_NPC_NAME..SP_TITLE, getn(tSay), tSay);
end

function sp_DaNianShou_Intro()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Ch�c m�ng c�c ��i hi�p n�m m�i vui v�, Ni�n Th� xu�t hi�n, m�i ng��i ��ng t�m hi�p l�c �� ��nh �u�i Ni�n Th� �i, �� ch�ng ta c� c�i T�t tr�n v�n vui t��i! M�i ng�y v�o l�c 12:00 ��n 13:00, bu�i t�i v�o l�c 21:00 ��n 22:00, Ni�n Th� s� ng�u nhi�n xu�t hi�n t�i Bi�n Kinh, D��ng Ch�u, Ph�ng T��ng, T��ng D��ng, Th�nh ��, Tuy�n Ch�u. Sau khi c�c ��i hi�p nh�n th�y Ni�n Th� xu�t hi�n, th� nhanh ch�ng ��t ph�o g�n xung quanh Ni�n Th�, tham gia ho�t ��ng c� c� h�i nh�n ���c ph�o, c�ng c� th� mua t�i ch� c�a ta ��y!";
	tSay.sel = {
		{"\n Ph�n h�i", "sp_DaNianShou"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_DaNianShou_AwardInfo()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."To�n th�n Ni�n Th� ��u l� b�o v�t, khi ��i hi�p ��nh Ni�n Th� c� th� nh�n ���c �i�m kinh nghi�m, ch�n kh�, thi�t tinh, thi�n huy�n kh�c b�n, qu�n c�ng ch��ng, l�ng ba vi b� v� c�c ph�n th��ng phong ph� kh�c. N�u nh� ��i hi�p th�ch Ni�n Th�, li�n t�c 15 ng�y, ng�y ng�y ��nh Ni�n Th�, Ni�n Th� nh�t ��nh s� t�ng cho ��i hi�p 1 cu�n m�t t�ch s� m�n. Nhanh ch�n ��n �� t�m Ni�n Th� nh�!";
	tSay.sel = {
		{"\n Ph�n h�i", "sp_DaNianShou"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_DaNianShou_Buy()
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	local nFreeRoom = GetFreeItemRoom()*1000;
	local nMax = min(floor(GetCash() / 1000), nFreeRoom);
	AskClientForNumber("sp_DaNianShou_Buy_deal", 0, nMax,"H�y nh�p s� l��ng c�n mua","")
end

function sp_DaNianShou_Buy_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if GetCash() < nNum * 1000 then
		Talk(1,"","Ti�n trong h�nh trang kh�ng ��");
		return 0;
	end
	if GetFreeItemRoom()*1000 < nNum then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if Pay(nNum * 1000) == 1 then
		gf_AddItemEx2({2, 1, 30625, nNum}, "Ph�o N�m M�i", "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
	end
end
