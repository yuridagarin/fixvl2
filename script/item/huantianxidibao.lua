Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Hoan Thi�n H� ��a Bao";
g_NeedRoom = 14;
g_NeedWeight = 200;
TSK_COUNTER = 577;

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
			if GetTask(578) == 0 and nCurCount >= 8 and GetTask(666) < 300 then
				SetTask(578,1);
				SetTask(666,GetTask(666)+100);
				if GetTask(666) > 300 then
					SetTask(666,300);
				end
				Msg2Player("Nh�n ���c 100 �i�m ��i h�i t� v�");					
			end	
			if GetTask(579) == 0 and nCurCount >= 24 then
				SetTask(579,1);
				give_item(2,1,3388,1,"1 L�nh th�o g� mi�n ph�",0,24,1);	--1����Ѳ����,0%��ÿ��24�����ظ�1����ֻ��һ����
			end			
			give_item(2,0,554,1,"1 quy�n Tu Ch�n Y�u Quy�t",10,2,0);  --����Ҫ��1����10%��ÿ��2�����ظ�1��	
			give_item(2,0,553,1,"1 ��i Nh�n s�m",5,10,0);  --1�����˲ι���5%��ÿ��10�����ظ�1��	
			add_lingshi(6,1,5,15,0);	--���6����ʯ1��,5%��ÿ��15�����ظ�1��	
			--������Ҫ��ȫ������
			add_lingshi(7,1,0.5,40,1);	--���7����ʯ1��,0.5%��ÿ��40�����ظ�1��
			give_item(2,1,3331,15,"15 Tam Di�u Long Hi",0.2,80,1);	--��ҫ���x,0.2%��ÿ��80�����ظ�15��
			give_item(2,1,563,1,"1 K� Kim c�a th� r�n L�u",0.1,120,1);	--�����������1��,0.1%��ÿ��120�����ظ�1��
			give_item(2,0,1028,1,"1 R��ng v�ng Th�nh Th�",0.2,200,1); --1��ʢ������0.2%��ÿ��200�����ظ�1��
			--������Ҫ��ȫ������͹�������
			add_horse(0.2,300);	--�������������1ƥ��0.2%��ÿ��300�����ظ�1��
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