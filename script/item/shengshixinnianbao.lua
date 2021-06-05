Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "t�i n�m m�i h�ng th�nh";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 1159;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				format("Xem b�n trong c� g� ��!/#see_item(%d)",nItemIdx),
				"T�m th�i kh�ng m�/nothing",
				}
	Say("��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. Xin l�u �: m�i khi m� 4 t�i ph�i cho 1 linh th�ch c�p 5 b�t k�, 10 t�i th� 1 linh th�ch ph�i ph��ng b�t k�, 15 t�i th� 1 nguy�t hoa, 20 t�i th� 1 linh th�ch c�p 6, 40 t�i th� 1 Ng� H�nh M�t T�ch, 80 t�i th� 1 Th�n H�nh B�o �i�n, 120 t�i th� 1 k� kim, 160 t�i: 1 V� L�m B�o �i�n, 300 t�i: 1 quy�n L�ng Ba Vi B�. B�n x�c nh�n m� <color=yellow>"..g_ItemName.."<color> ch�? <color=red>Ch� � <color>: B�n c�n ph�i c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight.." s�c l�c. Linh th�ch v� Linh th�ch ph�i ph��ng cho v�o T� Linh ��nh. ",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = "1 B�n Long B�ch, 1 X�ch Thi�t Tinh, danh v�ng 50, m�c �� ��ng g�p s� m�n 2? (ph�i gia nh�p m�n ph�i), 1 c� c�i ��, 1 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, 1 linh th�ch c�p 5 ng�u nhi�n, 1 ph�i ph��ng linh th�ch c�p 6 ng�u nhi�n, 1 nguy�t hoa, 1 linh th�ch c�p 6 ng�u nhi�n, 1 Ng� H�nh M�t T�ch, 1 Th�n H�nh B�o �i�n, k� kim, 1 V� L�m B�o �i�n, 1 L�ng Ba Vi B�.";
	Talk(1,"#OnUse("..nItemIdx..")","M�i '"..g_ItemName.." c� th� m� ���c c�c v�t ph�m: "..szItems..". Ch�c b�n may m�n!");
end;

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--��ǰ�ǵڼ��ο���
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--�����1��
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B�n nh�n ���c 1 B�n Long B�ch");
			AddItem(2,1,2652,1);
			Msg2Player("B�n nh�n ���c 1 X�ch Thi�t Tinh");
			ModifyReputation(50,0);	--����50
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+25);	--ʦ�Ź��׶�25
				Msg2Player("B�n nh�n ���c 25 �i�m c�ng hi�n s� m�n");
			end;
			AddItem(2,1,1090,1);
			Msg2Player("B�n nh�n ���c 1 C�i ��");
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("B�n ��t ���c 3 Sinh Vi�n Ch�ng Th�");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("B�n ��t ���c 3 T� T�i Ch�ng Th�");			
			else
				AddItem(2,0,599,3);
				Msg2Player("B�n ��t ���c 3 C� Nh�n ch�ng th�");			
			end;
			add_lingshi(5,1,100,4,0);	--���5����ʯ1��,10%��ÿ��4�����ظ�1��
			--������Ҫ��ȫ������
			add_peifang(6,1,50,10,1);	--���6����ʯ�䷽1��,5%��ÿ��10�����ظ�1��
			give_item(2,1,2002,1,"1 th�ng ",50,15,1);	--�»�1��,5%��ÿ��15�����ظ�1��
			add_lingshi(6,1,50,20,1);	--���6����ʯ1��,5%��ÿ��20�����ظ�1��
			give_item(0,107,155,1,"1 quy�n Ng� H�nh M�t T�ch",10,40,1);--�����ؼ�1��,1%��ÿ��40�����ظ�1��
			give_item(0,200,40,1,"1 quy�n Th�n H�nh B�o �i�n",5,80,1);	--���б���1��,0.5%��ÿ��80�����ظ�1��
			give_item(2,1,563,1,"1 K� Kim",2,120,1);	--���,0.2%��ÿ��120�����ظ�һ��
			give_item(2,1,3206,1,"1V� L�m b�o �i�n",1,160,1);--���ֱ���1��,0.1%��ÿ��160�����ظ�1��
			give_item(0,112,78,1,"1 quy�n L�ng Ba Vi B�",1,300,1);--�貨΢��1��,0.1%��ÿ��300�����ظ�1��
			WriteLog("["..g_ItemName.."]:"..GetName().."th�"..nCurCount.." m� "..g_ItemName);
		end;
	else
		Talk(1,"","Kho�ng tr�ng ho�cs�c l�cc�a b�n kh�ng ��. Xin ki�m tra l�i h�nh trang tr��c!"..g_ItemName.."!");
	end;
end;
--ϵͳ��ʾ����־���ڶ���������1��ʾ��ȫ������ϵͳ��Ϣ
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B�n nh�n ���c "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(GetName().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."Nh�n ���c"..szItemName);	
end;
--�����ɲ�ƪ�ĺ���
function give_zpcp(tbZPCP,nCount)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,nCount);		
	show_msg(szName,1);
end;
--����Ʒ����������Ϊ����ƷID1,��ƷID2,��ƷID3,��������Ʒ���֣����ʣ���λǧ��һ�����ظ��Ĵ������Ƿ�ȫ�����棬��������
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;
--����ʯ���������ȼ������������ʣ���λǧ��һ�����ظ��Ĵ������Ƿ�ȫ�����棺0������1��
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ĭ�Ϸ�ȫ������
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c�p) Linh Th�ch",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c�p) Linh Th�ch",bGlobalMsg);
	end;
end;
--����ʯ�䷽���������ȼ������������ʣ���λǧ��һ�����ظ��Ĵ���
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ĭ�Ϸ�ȫ������
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr��ng"..nLevel.." (c�p)-linh th�ch ph�i ph��ng.",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr��ng"..nLevel.." (c�p)-linh th�ch ph�i ph��ng.",bGlobalMsg);
	end;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	if nRand <= nP then
		give_zpcp(tbZPCP,nCount);
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
	end;
end;

function add_horse(nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	if nRand <= nP then 		--�������������1ƥ
		if random(1,2) == 1 then
			szItemName = "1 B�n ti�u";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		else
			szItemName = "1 ��ng V�";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1 B�n ti�u";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		else
			szItemName = "1 ��ng V�";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;			
	end;
end;

function nothing()

end;