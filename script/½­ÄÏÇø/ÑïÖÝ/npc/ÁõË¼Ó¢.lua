Include("\\script\\item\\item_yunling_box.lua")
function main()
	local tDialog = 
	{
		"\nT� Thi�n Bi�n Ti�u Y/NpcTalkMain",
		"\n Ngu�n g�c U�n Linh /cixiu_laiyuan",
		"\n ph��ng ph�p th�u/cixiu_fangfa",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh:<color>th�u l� tuy�t ngh� c�a t�i h�, U�n Linh ���c t�i h� th�u kh�ng nh�ng ��p m� c�n b�n n�a. ",getn(tDialog),tDialog);
end

function cixiu_laiyuan()
	local tDialog = 
	{
		"\n Ph�n h�i/main",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh:<color>tham gia �i V�n Ki�m Tr�ng v� Th�ng Thi�n Huy�n C�nh s� ng�u nhi�n nh�n ���c U�n Linh; c� th� ��i C� Linh Th�ch ho�c C� Linh Ng�c th�nh U�n Linh ch� Nh�t Nguy�t Th�n Gi�o H�c T�ng Qu�n � Ph��ng T��ng Ph� v� Th�nh N� Nh�m Doanh Doanh � D��ng Ch�u.",getn(tDialog),tDialog);
end

function cixiu_fangfa()
	local tDialog = 
	{
		"\n Ph�n h�i/main",
		"\n r�t lui/nothing",
	};
	Say("<color=green>L�u T� Anh: <color>nh�p chu�t ph�i v�o U�n Linh trong h�nh trang �� m� giao di�n th�u, cho ngo�i trang v� U�n Linh t��ng �ng v�o �� th�u.",getn(tDialog),tDialog);
end

function nothing()
end