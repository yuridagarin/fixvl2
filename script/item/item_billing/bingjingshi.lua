--����ʯ������999�����Խ��ף�����ʹ��1������ʯ���ͼ�ϴ��ʯ����¯���ϳɸ߼�ϴ��ʯ����¯���� IB �ۼ�90Xu
--2��ϴ��ʯ/��¯��=4��1��ϴ��ʯ/��¯��+1����ʯ
--2��ϴ��ʯ/��¯��=4��2��ϴ��ʯ/��¯��+2����ʯ
--�ϳɵĵ��߾�Ϊ�󶨵���
Include("\\script\\lib\\globalfunctions.lua")

--t_compose = {
--	[401] = {
--		award = {"4��ϴ��ʯ", 2, 1, 30524, 1,
--			},
--		need={
--			{{"3��ϴ��ʯ", 2, 1, 30523, 4,},
--			{{"����ʯ", 2, 1, 30554, 3,},
--			},
--		},
--	[402] = {
--		award = {"4����¯��", 2, 1, 30530, 1,
--			},
--		need={
--			{{"3����¯��", 2, 1, 30529, 4,},
--			{{"����ʯ", 2, 1, 30554, 3,},
--			},
--		},
--}

function OnUse(nItem)
	local tSay = {
		"H�p th�nh T�y T�m Th�ch c�p 2 = 4*1 c�p T�y T�m Th�ch + B�ng Tinh Th�ch/compose2x",
		"H�p th�nh Luy�n L� Thi�t c�p 2 = 4*1 c�p Luy�n L� Thi�t + 2 B�ng Tinh Th�ch/compose2l",
		"H�p th�nh T�y T�m Th�ch c�p 3 = 4*2 c�p T�y T�m Th�ch + B�ng Tinh Th�ch/compose3x",
		"H�p th�nh Luy�n L� Thi�t c�p 3 = 4*2 c�p Luy�n L� Thi�t + 2 B�ng Tinh Th�ch/compose3l",
		"H�p th�nh c�p 4 T�y T�m Th�ch = 4*3 c�p T�y T�m Th�ch + 3 B�ng Tinh Th�ch/compose4x",
		"H�p th�nh c�p 4 Luy�n L� Thi�t = 4*3 c�p Luy�n L� Thi�t + 3 B�ng Tinh Th�ch/compose4l",
		"Ra kh�i/do_nothing",
	}
--	for i,v in t_compose do
--		local szNeed = format("%sx%d",v.need[1][1], ,v.need[1][5])
--		for k=2, getn(v.need) do
--			szNeed=format("%s+%sx%d",v.need[k][1], ,v.need[k][5])
--		end
--		local szOp = format("�ϳ�%s=%s/", v.award[1], )
--		tinsert(tSay, "")
--	end
--	tinsert(tSay, "�˳�/do_nothing")
	Say("B�ng Tinh Th�ch: Ng��i mu�n l�m kh�ng?", getn(tSay), tSay);
end

function do_nothing()
	--do nothing()
end

function compose2x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30521) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2x_deal",0,min(nCount, nFrreRoom),"H�y nh�p s� l��ng h�p th�nh v�o","")
end

function compose2x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30521,4*nNum) then
		gf_AddItemEx2({2,1,30522,nNum,4}, "C�p 2 T�y T�m Th�ch", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh T�y T�m Th�ch c�p 2", 0, 1);
		AddRuntimeStat(2,1,0,nNum);
	end
end

function compose2l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30527) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2l_deal",0,min(nCount, nFrreRoom),"H�y nh�p s� l��ng h�p th�nh v�o","")
end

function compose2l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30527,4*nNum) then
		gf_AddItemEx2({2,1,30528,nNum,4}, "C�p 2 Luy�n L� Thi�t", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh Luy�n L� Thi�t c�p 2", 0, 1);
		AddRuntimeStat(2,3,0,nNum);
	end
end

function compose3x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30522) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3x_deal",0,min(nCount, nFrreRoom),"H�y nh�p s� l��ng h�p th�nh v�o","")
end

function compose3x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30522,4*nNum) then
		gf_AddItemEx2({2,1,30523,nNum,4}, "C�p 3 T�y T�m Th�ch", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh T�y T�m Th�ch c�p 3", 0, 1);
		AddRuntimeStat(2,2,0,nNum);
	end
end

function compose3l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30528) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3l_deal",0,min(nCount, nFrreRoom),"H�y nh�p s� l��ng h�p th�nh v�o","")
end

function compose3l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30528,4*nNum) then
		gf_AddItemEx2({2,1,30529,nNum,4}, "C�p 3 Luy�n L� Thi�t", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh Luy�n L� Thi�t c�p 3", 0, 1);
		AddRuntimeStat(2,4,0,nNum);
	end
end

function compose4x()
	local nCount = min(floor(GetItemCount(2,1,30554)/3), floor(GetItemCount(2,1,30523) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4x_deal",0,nRealCount,"H�y nh�p s� l��ng h�p th�nh v�o","")
	end
end

function compose4x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30523,4*nNum) then
		gf_AddItemEx2({2,1,30524,nNum,4}, "T�y T�m Th�ch c�p 4", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh c�p 4 T�y T�m Th�ch", 0, 1);
		AddRuntimeStat(2,5,0,nNum);
	end
end

function compose4l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 3), floor(GetItemCount(2,1,30529) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4l_deal",0, nRealCount,"H�y nh�p s� l��ng h�p th�nh v�o","")
	end
end

function compose4l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30529,4*nNum) then
		gf_AddItemEx2({2,1,30530,nNum,4}, "Luy�n L� Thi�t c�p 4", "H�p th�nh B�ng Tinh Th�ch", "H�p th�nh c�p 4 Luy�n L� Thi�t", 0, 1)
		AddRuntimeStat(2,6,0,nNum)
	end
end
