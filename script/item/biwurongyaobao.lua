--ÿ�����Ĺ̶���������
--4��ʵս�ĵ�
--20��ʦ�Ź��׶�
--1����ʯ����
--ÿ�����������������
--1������ɢ����10%��ÿ��5�����صã�
--1������赡���10%��ÿ��10�����صã�
--1�����6����ʯ����10%��ÿ��10�����صã�
--1��7����ʯ�䷽����10%��ÿ��10�����صã�
--1�����7����ʯ����ÿ��10�����ص�
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
function OnUse(nItemIdx)
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(6,50,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			get_item();
			get_random_item(nUseTime+1);
			SetTask(TSK_USE_GLORY_BAG_TIME,nUseTime+1);
		end;
	end;
end;

function get_item()
	AddItem(2,1,1101,4);--4��ʵս�ĵ�
	Msg2Player("Nh�n ���c 4 quy�n Th�c Chi�n T�m ��c");
	SetTask(336,GetTask(336)+20);--20��ʦ�Ź��׶�
	Msg2Player("Nh�n ���c 20 �i�m c�ng hi�n s� m�n");
	AddItem(2,1,2642,1);--1����ʯ����
	Msg2Player("Nh�n ���c 1 T�i b�o th�ch");
end;

function get_random_item(nUseTime)
	local nRand = random(1,100);
	if nRand <= 10 then	--1������ɢ����10%��ÿ��5�����صã�
		AddItem(2,0,141,1);
		Msg2Player("Nh�n ���c 1 Ti�u Ki�p T�n");
	end;
	if mod(nUseTime,5) == 0 then
		AddItem(2,0,141,1);
		Msg2Player("Nh�n ���c 1 Ti�u Ki�p T�n");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1������赡���10%��ÿ��10�����صã�
		AddItem(2,1,1000,1);
		Msg2Player("B�n nh�n ���c 1 B�n Long B�ch");
	end;
	if mod(nUseTime,10) == 0 then
		AddItem(2,1,1000,1);
		Msg2Player("B�n nh�n ���c 1 B�n Long B�ch");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1�����6����ʯ����10%��ÿ��10�����صã�
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o T� Linh ��nh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o T� Linh ��nh");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1��7����ʯ�䷽����10%��ÿ��10�����صã�
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("Nh�n ���c 1 Linh th�ch ph�i ch� c�p 7, �� b� v�o T� Linh ��nh");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("Nh�n ���c 1 Linh th�ch ph�i ch� c�p 7, �� b� v�o T� Linh ��nh");
	end;
	--================================================================
	if mod(nUseTime,10) == 0 then	--1�����7����ʯ����ÿ��10�����ص�
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Nh�n ���c 1 Linh th�ch c�p 7, �� b� v�o T� Linh ��nh");
	end;
	Msg2Player("��y l� l�n th� "..nUseTime.." l�n d�ng T�i vinh d� ��i h�i t� v�");
	WriteLog("[T�i vinh d� ��i h�i t� v�]:"..GetName().."th�"..nUseTime.." l�n d�ng T�i vinh d� ��i h�i t� v�");
end;

function nothing()

end;