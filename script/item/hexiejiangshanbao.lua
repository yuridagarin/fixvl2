Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = " t�i H�a H�i Giang S�n";
g_NeedRoom = 15;
g_NeedWeight = 200;
TSK_COUNTER = 1158;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				format("Xem b�n trong c� g� ��!/#see_item(%d)",nItemIdx),
				"T�m th�i kh�ng m�/nothing",
				}
	Say("��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. Xin l�u �: M� 2 t�i s� nh�n ���c 1 Th�n N�ng ��n, 4 t�i s� nh�n ���c ng�u nhi�n Linh Th�ch c�p 5, m� 4 t�i s� nh�n ���c ng�u nhi�n 1 ��o c� Ho�ng Kim, m� 10 t�i s� nh�n ���c ng�u nhi�n 1 Linh Th�ch c�p 6, m� 30 t�i s� nh�n ���c t��ng �ng L�u Ph�i Tr�n Ph�i quy�n - h�, m� 40 t�i s� nh�n ���c 1 N�ng Tang ph�, m� 60 t�i s� nh�n ���c 1 Linh Th�ch c�p 7 ng�u nhi�n, m� 120 t�i s� nh�n ���c t��ng �ng L�u Ph�i Tr�n Ph�i quy�n T�n c�a L�u Ph�i - h�, m� 200 t�i s� nh�n ���c ng�u nhi�n 1 B�n Ti�u ho�c ��ng V�. B�n x�c nh�n m� <color=yellow>"..g_ItemName.."<color> ch�? <color=red>Ch� � <color>: B�n c�n ph�i c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight.." S�c l�c. Ng��i ch�a gia nh�p L�u Ph�i s� nh�n ���c ng�u nhi�n L�u Ph�i 1 Tr�n Ph�i quy�n",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = " 1 B�n Long B�ch, 1 X�ch Thi�t Tinh, Danh V�ng ng�u nhi�n 50-100 �i�m, c�ng hi�n S� M�n 50 �i�m (C�n ph�i gia nh�p M�n Ph�i), ng�u nhi�n 1 Linh Th�ch c�p 1 - 4, 3 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, 1 Th�n N�ng ��n, ng�u nhi�n 1 Linh Th�ch c�p 5, ng�u nhi�n 1 ��o c� Ho�ng Kim, ng�u nhi�n 1 Linh Th�ch c�p 6, t��ng �ng L�u Ph�i Tr�n Ph�i quy�n - h�, N�ng Tang ph�, 1 Linh Th�ch c�p 7 ng�u nhi�n, t��ng �ng L�u Ph�i Tr�n Ph�i quy�n - h�, ng�u nhi�n 1 B�n Ti�u ho�c ��ng V�";
	Talk(1,"#OnUse("..nItemIdx..")","M�i '"..g_ItemName.." c� th� m� ���c c�c v�t ph�m: "..szItems..". Ch�c b�n may m�n!");
end;

tZJCP = 
{
	[0]  = {{"D�ch C�n Kinh-trung",2,1,917},{"T�y T�y Kinh-trung",2,1,923},{"Nh� Lai Th�n Ch��ng-trung",2,1,920},{"H�p Tinh Tr�n-trung",2,1,926},{"V�n T��ng Th�n C�ng-trung",2,1,929},{"Thi�n �m Tr�n H�n Kh�c-trung",2,1,932},{"Gi�ng Long Th�p B�t Ch��ng-trung",2,1,935},{"�� C�u C�n Tr�n-trung",2,1,938},{"V� Th��ng Th�i C�c Ki�m-trung",2,1,941},{"Th�i C�c Th�n C�ng-trung",2,1,944},{"Li�n Ho�n To�n Long Th��ng-trung",2,1,947},{"B� V��ng T��ng Ph�ng Ti�n-trung",2,1,950},{"V� �nh Ma C�-trung",2,1,953},{"V� Thi�n Ma C�ng-trung",2,1,956}},
	[1]  = {{"D�ch C�n Kinh-trung",2,1,917},{"T�y T�y Kinh-trung",2,1,923},{"Nh� Lai Th�n Ch��ng-trung",2,1,920}},
	[2]  = {{"D�ch C�n Kinh-trung",2,1,917}},
	[3]  = {{"T�y T�y Kinh-trung",2,1,923}},
	[4]  = {{"Nh� Lai Th�n Ch��ng-trung",2,1,920}},
	[5]  = {{"H�p Tinh Tr�n-trung",2,1,926}},
	[6]  = {{"H�p Tinh Tr�n-trung",2,1,926}},
	[7]  = {{"V�n T��ng Th�n C�ng-trung",2,1,929},{"Thi�n �m Tr�n H�n Kh�c-trung",2,1,932}},
	[8]  = {{"V�n T��ng Th�n C�ng-trung",2,1,929}},
	[9]  = {{"Thi�n �m Tr�n H�n Kh�c-trung",2,1,932}},
	[10] = {{"Gi�ng Long Th�p B�t Ch��ng-trung",2,1,935},{"�� C�u C�n Tr�n-trung",2,1,938}},
	[11] = {{"Gi�ng Long Th�p B�t Ch��ng-trung",2,1,935}},
	[12] = {{"�� C�u C�n Tr�n-trung",2,1,938}},
	[13] = {{"V� Th��ng Th�i C�c Ki�m-trung",2,1,941},{"Th�i C�c Th�n C�ng-trung",2,1,944}},
	[14] = {{"V� Th��ng Th�i C�c Ki�m-trung",2,1,941}},
	[15] = {{"Th�i C�c Th�n C�ng-trung",2,1,944}},
	[16] = {{"Li�n Ho�n To�n Long Th��ng-trung",2,1,947},{"B� V��ng T��ng Ph�ng Ti�n-trung",2,1,950}},
	[17] = {{"Li�n Ho�n To�n Long Th��ng-trung",2,1,947}},
	[18] = {{"B� V��ng T��ng Ph�ng Ti�n-trung",2,1,950}},
	[19] = {{"V� �nh Ma C�-trung",2,1,956},{"V� Thi�n Ma C�ng-trung",2,1,953}},
	[20] = {{"V� Thi�n Ma C�ng-trung",2,1,956}},
	[21] = {{"V� �nh Ma C�-trung",2,1,953}},
}

tXJCP = 
{
	[0]  = {{"D�ch C�n Kinh-h� ",2,1,918},{"T�y T�y Kinh-h� ",2,1,924},{"Nh� Lai Th�n Ch��ng-h� ",2,1,921},{"H�p Tinh Tr�n-h� ",2,1,927},{"V�n T��ng Th�n C�ng-h� ",2,1,930},{"Thi�n �m Tr�n H�n Kh�c-h� ",2,1,933},{"Gi�ng Long Th�p B�t Ch��ng-h� ",2,1,936},{"�� C�u C�n Tr�n-h� ",2,1,939},{"V� Th��ng Th�i C�c Ki�m-h� ",2,1,942},{"Th�i C�c Th�n C�ng-h� ",2,1,945},{"Li�n Ho�n To�n Long Th��ng-h� ",2,1,948},{"B� V��ng T��ng Ph�ng Ti�n-h� ",2,1,951},{"V� �nh Ma C�-h� ",2,1,954},{"V� Thi�n Ma C�ng-h� ",2,1,957}},
	[1]  = {{"D�ch C�n Kinh-h� ",2,1,918},{"T�y T�y Kinh-h� ",2,1,924},{"Nh� Lai Th�n Ch��ng-h� ",2,1,921}},
	[2]  = {{"D�ch C�n Kinh-h� ",2,1,918}},
	[3]  = {{"T�y T�y Kinh-h� ",2,1,924}},
	[4]  = {{"Nh� Lai Th�n Ch��ng-h� ",2,1,921}},
	[5]  = {{"H�p Tinh Tr�n-h� ",2,1,927}},
	[6]  = {{"H�p Tinh Tr�n-h� ",2,1,927}},
	[7]  = {{"V�n T��ng Th�n C�ng-h� ",2,1,930},{"Thi�n �m Tr�n H�n Kh�c-h� ",2,1,933}},
	[8]  = {{"V�n T��ng Th�n C�ng-h� ",2,1,930}},
	[9]  = {{"Thi�n �m Tr�n H�n Kh�c-h� ",2,1,933}},
	[10] = {{"Gi�ng Long Th�p B�t Ch��ng-h� ",2,1,936},{"�� C�u C�n Tr�n-h� ",2,1,939}},
	[11] = {{"Gi�ng Long Th�p B�t Ch��ng-h� ",2,1,936}},
	[12] = {{"�� C�u C�n Tr�n-h� ",2,1,939}},
	[13] = {{"V� Th��ng Th�i C�c Ki�m-h� ",2,1,942},{"Th�i C�c Th�n C�ng-h� ",2,1,945}},
	[14] = {{"V� Th��ng Th�i C�c Ki�m-h� ",2,1,942}},
	[15] = {{"Th�i C�c Th�n C�ng-h� ",2,1,945}},
	[16] = {{"Li�n Ho�n To�n Long Th��ng-h� ",2,1,948},{"B� V��ng T��ng Ph�ng Ti�n-h� ",2,1,951}},
	[17] = {{"Li�n Ho�n To�n Long Th��ng-h� ",2,1,948}},
	[18] = {{"B� V��ng T��ng Ph�ng Ti�n-h� ",2,1,951}},
	[19] = {{"V� �nh Ma C�-h� ",2,1,954},{"V� Thi�n Ma C�ng-h� ",2,1,957}},
	[20] = {{"V� Thi�n Ma C�ng-h� ",2,1,957}},
	[21] = {{"V� �nh Ma C�-h� ",2,1,954}},
}

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
			ModifyReputation(random(50,100),0);	--����50-100���
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+50);	--ʦ�Ź��׶�50
				Msg2Player("B�n nh�n ���c 50 �i�m c�ng hi�n S� M�n");
			end;
			nRand = random(1,4);
			lspf_AddLingShiInBottle(nRand,1);	--���1-4�������ʯ1��
			Msg2Player("B�n nh�n ���c 1 "..nRand.." (c�p) Linh Th�ch");
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
			give_item(2,1,343,1,"Th�n N�ng ��n",200,2,0)	--��ũ��1��,20%��ÿ��2�����ظ�1��
			add_lingshi(5,1,100,4,0);	--���5����ʯ1��,10%��ÿ��4�����ظ�1��
			add_golden_tool(1,100,4);	--����ƽ𹤾�1��,10%��ÿ��4�����ظ�1��
			--������Ҫ��ȫ������
			add_lingshi(6,1,50,10);	--���6����ʯ1��,5%��ÿ��10�����ظ�1��
			add_zpcp(tZJCP,1,10,30);	--��Ӧ�������ɲо��о�,1%��ÿ��30�����ظ�1��
			give_item(2,1,1056,1,"N�ng Tang ph�",5,40,1);	--ũɣ��Ҫ,0.5%��ÿ��40�����ظ�1��
			add_lingshi(7,1,2,60);	--���7����ʯ1��,0.2%��ÿ��60�����ظ�1��
			add_zpcp(tXJCP,1,2,120);	--��Ӧ�������ɲо��²�,0.2%��ÿ��120�����ظ�1��
			add_horse(2,200);	--�������������1ƥ��0.2%��ÿ��200�����ظ�1��
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

function add_golden_tool(nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local nRandomItem = random(23,28);
	if nRand <= nP then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("B�n nh�n ���c 1 c�ng c� K� n�ng s�ng");
	end;
	if mod(nCurCount,nModCount) == 0 then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("B�n nh�n ���c 1 c�ng c� K� n�ng s�ng");	
	end;
end;

function nothing()

end;