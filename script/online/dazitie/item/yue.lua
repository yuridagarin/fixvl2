function OnUse(nItem)
	Say("[Nguy�t]:".."C�c h� ch�n h�nh th�c n�o �� vi�t l�i?",3,"Vi�t l�i t�n 40 v�ng/cost_coin","D�ng b�t l�ng vi�t l�i/cost_item","Tho�t/do_nothing");
end

function cost_coin()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30449);
	nNum = min(nNum, GetCash() / (40 * 10000));
	nNum = min(nNum, 1000);
	AskClientForNumber("cost_coin_deal", 0, nNum, "H�y nh�p s� l��ng v�o", "");
end

function cost_coin_deal(nNum)
	if DelItem(2, 1, 30449, nNum) ~= 1 then
		return 0;
	end
	if Pay(nNum * 40 * 10000) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 30446, nNum);
end

function cost_item()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30449);
	nNum = min(nNum, GetItemCount(2, 1, 30451));
	nNum = min(nNum, 1000);
	AskClientForNumber("cost_item_deal", 0, nNum, "H�y nh�p s� l��ng v�o", "");
end

function cost_item_deal(nNum)
	if DelItem(2, 1, 30449, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30451, nNum) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 30446, nNum);
end

function do_nothing()
end