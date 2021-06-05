Include("\\script\\online\\tong_feast\\tf_define.lua")

function OnUse(nItem)
	local tSay = {
		"H�p th�nh L�nh B�i Bang H�i/ComposeTongToken",
		"T�i h� ch� xem qua th�i/nothing"	
	}
	Say("S� d�ng 100 M�nh L�nh B�i Bang H�i c� th� h�p th�nh m�t L�nh B�i Bang H�i, Ng��i mu�n h�p th�nh L�nh B�i Bang H�i Kh�ng?", getn(tSay), tSay);
end

function ComposeTongToken()
	local nCount = floor(GetItemCount(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3]) / 100);
	AskClientForNumber("ComposeTongToken_CB", 0, nCount,"Nh�p v�o s� l��ng:","")
end

function ComposeTongToken_CB(nNum)
	if nNum <= 0 then
		return 0; 
	end
	if GetFreeItemRoom() * 999 < nNum then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItem(TF_ITEM_TONG_TOKEN_CHIP[1], TF_ITEM_TONG_TOKEN_CHIP[2], TF_ITEM_TONG_TOKEN_CHIP[3], nNum * 100) == 1 then
		AddItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum);
		Msg2Player(format("Ng��i h�p th�nh %d L�nh B�i Bang H�i", nNum));
	end
end

function nothing()
	
end
