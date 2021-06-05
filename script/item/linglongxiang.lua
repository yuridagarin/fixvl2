--õ�����
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

function OnUse(nItemIdx)
	local nRose = 0;
	local tRose = { "Hoa H�ng T�m", "Hoa H�ng Lam" }
	local tChenghao = { 2, 1 }
	local flag,nTime = GetAntiEnthrallmentInfo()
	if flag == 1 and nTime >= 10800 then
		Talk(1,"","<color=green>r��ng hoa h�ng<color>: Xin m� r��ng ra trong tr�ng th�i kh�e m�nh!")
		return
	end
	if GetItemParam(nItemIdx,0) == 1 then  --�������õ��
		nRose = 1;
	elseif GetItemParam(nItemIdx,0) == 2 then  --�������õ��
		nRose = 2;
	end
	if nRose == 0 then
		Say("R��ng hoa h�ng c� v�n ��. Xin li�n h� �� kh�c ph�c.",0)
		return
	end
	Say("<color=green>"..tRose[nRose].."r��ng<color>: trang ph�c trong r��ng n�y l� <color=yellow>"..tRose[nRose].."<color>Tr�ng lo�i hoa n�y r�t kh�, �� ch�ng minh t�nh y�u c�a 2 ng��i, ng��i c� ch�p nh�n 1 l�n th� th�ch kh�ng? �i�m t�ch l�y c�a ng��i s� b� gi�m <color=yellow>"..tChenghao[nRose].."<color> c�p.",
		2,
		"\n ���c, ta ch�p nh�n/#rose_open("..nRose..")",
		"\n �� ta suy ngh�/end_say"
	)
end

function rose_open(nType)
	if GetFreeItemRoom() < 2 then
		Talk (1,"main","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < 10 then			--�ж���Ҹ��غͿռ�
		Talk (1,"main","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	end
	local tRose = {
		{204,206},
		{203,205}
	}
	local tJifen = { 5000,3000,1500,1000,500,200,100,0,-10,-100 }
	local nOldJifen = GetTask(ABLUEMOON_JIFEN);
	local nTojifen = nOldJifen;
	for i = 1,8 do
		if nOldJifen >= tJifen[i] then
			nTojifen = tJifen[i+3-nType]
			break
		end
	end
	local nDetail = tRose[nType][GetBody()-2]
	if DelItem(2,0,1161,1) == 1 then
		if AddItem(0,108,nDetail,1) == 1 then
			if nOldJifen > nTojifen then
				jifen_reduce(nOldJifen - nTojifen)
				--SetTask(ABLUEMOON_JIFEN, nTojifen)			
			else
				jifen_reduce((3-nType)*200)
				--SetTask(ABLUEMOON_JIFEN, GetTask(ABLUEMOON_JIFEN)-(3-nType)*200)
			end
			abluemoon_jifen()
			WriteLog("[R��ng Hoa H�ng]: Ng��i ch�i  "..GetName().." m� h�p ra nh�n ���c 1 hoa h�ng s� hi�u l� "..nDetail..", �i�m t�ch l�y tr��c l� :"..nOldJifen)		
		else
			WriteLog("[R��ng Hoa H�ng]: Ng��i ch�i  "..GetName().." m� h�p ra nh�n ���c 1 hoa h�ng s� hi�u l� "..nDetail.." (hoa h�ng) th�t b�i!!! �i�m t�ch l�y tr��c l�:"..nOldJifen)
		end
	end
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	for i = 1,getn(tTitle) do --ɾ��ԭ�еĳƺ�
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("B�n nh�n ���c danh hi�u"..tTitle[nTitleLevel][3].."{X�ng hi�u}");
	end;
end

function end_say()
end