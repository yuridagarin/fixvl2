--ÿ�����Ĺ̶���������
--4��ʵս�ĵ�
--20��ʦ�Ź��׶�
--1����ʯ����
--ÿ�����������������
--1������ɢ����10%��ÿ��5�����صã�
--1������赡���10%��ÿ��10�����صã�
--1�����6����ʯ����10%��ÿ��10�����صã�
--1��7����ʯ�䷽����10%��ÿ��10�����صã�
--50��̫�׻�Ԫ��ͼ����2,0,1082������99��ÿ��20�����ص�
--3��ʦ�Ÿ߼��ؼ�����ÿ��40�����ص�
--1���׻����ꡪ��ÿ��100�����ص�
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
TSK_USE_GLORY_BAG_TIME = 593;

function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","Ng��i kh�ng m�n ph�i kh�ng th� d�ng T�i vinh d� ��i h�i t� v�.");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(11,150,"") == 1 then
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
	local nLevel = GetLevel();
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
	if mod(nUseTime,20) == 0 and nLevel == 99 then	--50��̫�׻�Ԫ��ͼ����2,0,1082��
		AddItem(2,0,1082,50);
		Msg2Player("Nh�n ���c 50 Th�i D�ch H�n Nguy�n C�ng ��");
	end;
	--================================================================
	if mod(nUseTime,40) == 0 then	--3��ʦ�Ÿ߼��ؼ�����ÿ��40�����ص�
		give_book(3);
	end;
	--================================================================
	if mod(nUseTime,100) == 0 then	--1���׻����ꡪ��ÿ��100�����ص�
		AddItem(2,1,1146,1);
		Msg2Player("Nh�n ���c 1 Vi�m Ho�ng Thi�t H�n");
	end;
	Msg2Player("��y l� l�n th� "..nUseTime.." l�n d�ng T�i vinh d� ��i h�i t� v�");
	WriteLog("[T�i vinh d� ��i h�i t� v� l�n 2]:"..GetName().."th�"..nUseTime.." l�n d�ng T�i vinh d� ��i h�i t� v�");
end;

g_tbBook = 
{
	[2] = {"Kim Cang B�t Nh� Kinh",0,107,166},	--�����׼�
	[4] = {"Ti�m Long T�ch Di�t Kinh",0,107,167}, --������ɮ
	[3] = {"V� Tr�n B� �� Kinh",0,107,168}, --������ɮ
	[6] = {"Thi�n La Li�n Ch�u L�c",0,107,169}, --����
	[8] = {"Nh� � Kim ��nh M�t T�ch",0,107,170}, --���ҷ��
	[9] = {"B�ch H�i Tuy�t �m Ph� ",0,107,171}, --�����׼�
	[11] = {"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172}, --ؤ�ﾻ��
	[12] = {"Qu� Thi�n Du Long M�t T�ch",0,107,173}, --ؤ������
	[14] = {"Huy�n �nh M� Tung M�t T�ch",0,107,174}, --�䵱����
	[15] = {"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}, --�䵱�׼�
	[17] = {"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176}, --����ǹ��
	[18] = {"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}, --���Ź���
	[20] = {"U Minh Phong Ma L�c",0,107,178}, --�嶾а��
	[21] = {"Linh C� Huy�n T� L�c",0,107,179}, --�嶾��ʦ
	[23] = {"C�u Thi�n Phong L�i Quy�t",0,107,198},	
	[29] = {"H�ng Tr�n T�y M�ng Ph�",0,107,202},
	[30] = {"Phong Hoa Thi�n Di�p Ph�",0,107,203},	
}

function give_book(nNum)
	local nRoute = GetPlayerRoute();
	local tbBook = g_tbBook[nRoute];
	if not tbBook then
		return 0;
	end;
	local nID1,nID2,nID3 = tbBook[2],tbBook[3],tbBook[4];
	local szName = tbBook[1];
	AddItem(nID1,nID2,nID3,nNum,4);
	Msg2Player(format("Nh�n ���c %d quy�n %s",nNum,szName));
end;

function nothing()

end;