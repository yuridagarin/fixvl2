Include("\\script\\online\\qianhe_tower\\qht_head.lua")

HFSP_DIALOG = {
	--"3������Ƭ+3��=ͭ�ƻ���/exchange_1",
	--"9������Ƭ+9��=���ƻ���/exchange_2",
	"3 m�nh H� ph� + 1 B� Kim Th�ch = Kim H� ph�/exchange_3",
	"Kh�ng c�n ��u/nothing"
}

function OnUse(nItem)
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	Say("C�c h� mu�n gh�p lo�i H� ph� n�o?",getn(HFSP_DIALOG),HFSP_DIALOG);
end

function exchange_1()
	local nNum1 = floor(GetItemCount(2,1,30435) / 3);
	local nNum2 = floor(GetCash() / 30000);
	AskClientForNumber("exchange_tw",1,min(nNum1,nNum2),"Nh�p s� l��ng v�o","");
end	

function exchange_2()
	local nNum1 = floor(GetItemCount(2,1,30435) / 9);
	local nNum2 = floor(GetCash() / 90000);
	AskClientForNumber("exchange_yw",1,min(nNum1,nNum2),"Nh�p s� l��ng v�o","");
end

function exchange_3()
	local nNum1 = floor(GetItemCount(2,1,30435) / 3);
	local nNum2 = GetItemCount(2,1,30439);
	AskClientForNumber("exchange_jw",1,min(nNum1,nNum2),"Nh�p s� l��ng v�o","");
end

function exchange_tw(nNum)
	if GetItemCount(2,1,30435) < 3 * nNum then
		Msg2Player(format("M�nh H� ph� kh�ng �� %d c�i",3 * nNum));
		return 0;
	end
	if GetCash() < nNum * 30000 then
		Msg2Player("Ti�n trong h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,3 * nNum) == 1 and Pay(nNum * 30000) == 1 then
		gf_AddItemEx2({2,1,30436,nNum}, "��ng H� ph�", "C�ng chi�n Thi�n T�m Th�p", "��i m�nh H� ph�", 0, 1);
	end
end

function exchange_yw(nNum)
	if GetItemCount(2,1,30435) < 9 * nNum then
		Msg2Player(format("M�nh H� ph� kh�ng �� %d c�i",9 * nNum));
		return 0;
	end
	if GetCash() < nNum * 90000 then
		Msg2Player("Ti�n trong h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,9 * nNum) == 1 and Pay(nNum * 90000) == 1 then
		gf_AddItemEx2({2,1,30437,nNum}, "Ng�n H� ph�", "C�ng chi�n Thi�n T�m Th�p", "��i m�nh H� ph�", 0, 1);
	end
end

function exchange_jw(nNum)
	if GetItemCount(2,1,30435) < 3 * nNum then
		Msg2Player(format("M�nh H� ph� kh�ng �� %d c�i",3 * nNum));
		return 0;
	end
	if GetItemCount(2,1,30439) < nNum then
		Msg2Player("B� Kim Th�ch trong h�nh trang kh�ng ��");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,3 * nNum) == 1 and DelItem(2,1,30439,nNum) == 1 then
		gf_AddItemEx2({2,1,30438,nNum}, "Kim H� ph�", "C�ng chi�n Thi�n T�m Th�p", "��i m�nh H� ph�", 0, 1);
	end
end