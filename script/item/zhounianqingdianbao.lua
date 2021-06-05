Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "K� ni�m 20 n�m �i�n bao";
g_NeedRoom = 18;
g_NeedWeight = 200;
TSK_COUNTER = 580;

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
			AddItem(2,0,1082,1);
			Msg2Player("B�n nh�n ���c 1 quy�n Th�i D�ch H�n Nguy�n C�ng ��");	
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
			if GetTask(581) == 0 and nCurCount >= 8 then
				SetTask(581,1);
				AddItem(2,0,1087,2);
				Msg2Player("B�n nh�n ���c 2 ch�a kh�a b�c k� ni�m 20 n�m");			
			end			
			give_item(2,0,554,1,"1 quy�n Tu Ch�n Y�u Quy�t",10,2,0);  --����Ҫ��1����10%��ÿ��2�����ظ�1��	
			give_item(2,1,3331,1,"1 Tam Di�u Long Hi",10,4,0);  --1����ҫ���x��10%��ÿ��4�����ظ�1��	
			give_item(2,0,1087,1,"1 ch�a kh�a b�c k� ni�m 20 n�m",5,8,0);  --1�Ѷ�ʮ��������Կ�ף�5%��ÿ��8�����ظ�1��	
			give_item(2,1,3204,1,"1 Ng� Th�i Lung T�y",5,20,0);  --1��������裬5%��ÿ��20�����ظ�1��	
			give_item(2,1,3388,1,"1 L�nh th�o g� mi�n ph�",5,30,1);	--1����Ѳ����,5%��ÿ��30�����ظ�1����
			add_lingshi(6,1,5,12,0);	--���6����ʯ1��,5%��ÿ��12�����ظ�1��	
			--������Ҫ��ȫ������
			add_lingshi(7,1,0.5,40,1);	--���7����ʯ1��,0.5%��ÿ��40�����ظ�1��
			give_item(2,1,3205,1,"1 c�i Th�t Huy�n L�u V�n",0.5,50,1);	--1�����Ŭ���,0.5%��ÿ��50�����ظ�1��
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch�a kh�a v�ng",1,40,1) == 1 then	--1�Ѵ������Կ��,1%�ҿ�40�����ظ���ÿ���޵�1�Σ�
					SetTask(1482,1);	--ֻ�ܻ��һ��
				end;
			end;
			--������Ҫ��ȫ������͹�������
			give_item(2,0,1088,1,"1 ch�a kh�a v�ng k� ni�m 20 n�m",0.1,180,2);	--1�Ѷ�ʮ�������Կ��,0.1%��ÿ��180�����ظ�1��
			give_item(2,0,1084,1,"1 Thi�n Qu�i Th�ch",0.01,500,2);	--1������ʯ,0.01%��ÿ��500�����ظ�1��
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