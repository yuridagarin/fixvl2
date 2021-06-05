Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "B�ch Ni�n Vi�n M�ng Bao";
g_NeedRoom = 18;
g_NeedWeight = 200;
TSK_COUNTER = 572;

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

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--��ǰ�ǵڼ��ο���
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("Nh�n ���c 2 B�n Long B�ch");
			AddItem(2,1,2642,1);
			Msg2Player("Nh�n ���c 1 T�i b�o th�ch");	
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--ʦ�Ź��׶�25
				Msg2Player("B�n nh�n ���c 25 �i�m c�ng hi�n s� m�n");
			end
			ModifyReputation(50,0);	--����50					
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
			if GetTask(573) == 0 and nCurCount >= 8 then
				if GetPlayerRoute() ~= 0 then
					SetTask(573,1);
					SetTask(336,GetTask(336)+3000);	--ʦ�Ź��׶�3000
					Msg2Player("Nh�n ���c 3000 �i�m c�ng hi�n s� m�n");
				end;					
			end				
			give_item(2,0,554,1,"1 quy�n Tu Ch�n Y�u Quy�t",10,2,0);  --1������Ҫ����10%��ÿ��2�����ظ�1��	
			give_item(2,1,2002,1,"1 th�ng ",5,8,0);  --1���»���5%��ÿ��8�����ظ�1��
			add_lingshi(6,1,5,15,0);	--���6����ʯ1��,5%��ÿ��15�����ظ�1��	
			give_item(2,1,1042,1,"1 C�i Th� Anh H�ng",1,25,1);--�����챨����Ӣ��1��,1%��ÿ��25�����ظ�1��
			--������Ҫ��ȫ������
			add_lingshi(7,1,0.5,45,1);	--���7����ʯ1��,0.5%��ÿ��45�����ظ�1��
			give_item(2,1,3331,15,"15 Tam Di�u Long Hi",0.2,80,1);	--��ҫ���x,0.2%��ÿ��80�����ظ�15��
			give_item(2,1,3206,1,"1V� L�m b�o �i�n",0.1,160,1);--���ֱ���1��,0.1%��ÿ��160�����ظ�1��
			give_item(2,0,1028,1,"1 R��ng v�ng Th�nh Th�",0.2,200,1); --1��ʢ������0.2%��ÿ��200�����ظ�1��
			--������Ҫ��ȫ������͹�������
			add_zpcp(tXJCP,1,0.2,300);	--��Ӧ�������ɲо��²�,0.2%��ÿ��300�����ظ�1��
			give_item(2,1,1146,1,"1 Vi�m Ho�ng Thi�t h�n",0.01,1600,2);	--�׻�����1��,0.01%��ÿ��1600�����ظ� 1��
			Msg2Player("��y l� l�n th� "..nCurCount.." m� "..g_ItemName);
			WriteLog("["..g_ItemName.."]:"..GetName().."th�"..nCurCount.." m� "..g_ItemName);
		end;
	else
		Talk(1,"","Kho�ng tr�ng ho�cs�c l�cc�a b�n kh�ng ��. Xin ki�m tra l�i h�nh trang tr��c!"..g_ItemName.."!");
	end;
end;
--ϵͳ��ʾ����־���ڶ���������1��ʾ��ȫ������ϵͳ��Ϣ����2��ʾ��ȫ������ϵͳ��Ϣ��ȫ������������Ϣ��
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B�n nh�n ���c "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
		AddGlobalNews(get_name().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
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
	show_msg(szName,2);
end;
--����Ʒ����������Ϊ����ƷID1,��ƷID2,��ƷID3,��������Ʒ���֣����ʣ��ظ��Ĵ������Ƿ�ȫ�����棬��������
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		nRetResult = 1;
	end;
	return nRetResult;
end;

function give_chest_key(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		return 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		return 1;
	end;
	return 0;
end;
--����ʯ���������ȼ������������ʣ��ظ��Ĵ������Ƿ�ȫ�����棺0������1��
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ĭ�Ϸ�ȫ������
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c�p) Linh Th�ch",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (c�p) Linh Th�ch",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;
--����ʯ�䷽���������ȼ������������ʣ��ظ��Ĵ���
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ĭ�Ϸ�ȫ������
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr��ng"..nLevel.." (c�p)-linh th�ch ph�i ph��ng.",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr��ng"..nLevel.." (c�p)-linh th�ch ph�i ph��ng.",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_horse(nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 		--�������������1ƥ
		if random(1,2) == 1 then
			szItemName = "1 B�n ti�u";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1 ��ng V�";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1 B�n ti�u";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1 ��ng V�";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;	
		nRetResult = 1;		
	end;
	return nRetResult;
end;

function get_name()
	local szName = "��i hi�p";
	return szName;
end;

function nothing()

end;