Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "T�i Kim Th� H� Tu�";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 1149;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				format("Xem b�n trong c� g� ��!/#see_item(%d)",nItemIdx),
				"T�m th�i kh�ng m�/nothing",
				}
	Say("��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. M�i ng��i m�i khi m� 4 t�i ph�i ��a 1 ��i N�i Thanh ��ng , khi m� 10 t�i ph�i ��a 1 Linh th�ch ph�i ph��ng c�p 6 ng�u nhi�n, khi m� 20 t�i ph�i ��a 1 Nguy�t Hoa, khi m� 30 t�i ph�i ��a 1 Linh th�ch ph�i ph��ng c�p 6, khi m� 40 t�i ph�i ��a 1 ch�a kh�a r��ng v�ng (ch� c� 1 c� h�i), khi m� 60 t�i ph�i ��a 1 Linh th�ch c�p 7 ng�u nhi�n, khi m� 100 t�i ph�i ��a 1 K� Kim, khi m� 160 t�i ph�i ��a 1 V� L�m B�o �i�n, khi m� 240 t�i ph�i ��a 1 Thanh ��ng ��nh c�p 2, khi m� 2000 t�i ph�i ��a 1 Vi�m Ho�ng Thi�t H�n. B�n ch�p nh�n m� b�y gi�? <color=red>Ch� �<color>: c�n c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight.." s�c l�c. Linh th�ch v� Linh th�ch ph�i ph��ng cho v�o T� Linh ��nh. ",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = " 1 X�ch Thi�t Tinh, 2 Thi�n Th�ch , 50 danh v�ng, 25 m�c �� ��ng g�p s� m�n (ph�i gia nh�p m�n ph�i), 1 c� c�i ��, 3 Sinh �� Ch�ng Th�, 3 T� T�i Ch�ng Th�, 3 C� Nh�n Ch�ng Th�, 1 ��i N�i Thanh ��ng, 1 Linh th�ch ph�i ph��ng c�p 6 ng�u nhi�n, 1 Nguy�t Hoa, 1 Linh th�ch c�p 6 ng�u nhi�n, ch�a kh�a r��ng ch�a �� (m�i ng��i ch� c� 1 c� h�i), 1 Linh th�ch c�p 7 ng�u nhi�n, K� Kim, 1 V� L�m B�o �i�n, 1 Thanh ��ng ��nh c�p 2, 1 Vi�m Ho�ng Thi�t H�n. ";
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
			AddItem(2,1,2652,1);
			Msg2Player("B�n nh�n ���c 1 X�ch Thi�t Tinh");
			AddItem(2,2,8,2);	--����2��
			Msg2Player("B�n nh�n ���c 2 Thi�n th�ch");
			ModifyReputation(50,0);	--����50��
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
			give_item(2,1,3208,1,"1 ��i N�i Thanh ��ng",10,4);	--������ͭ��1��,10%��ÿ��4�����ظ�1��
			add_peifang(6,1,5,10,0);	--���6����ʯ�䷽1��,5%��ÿ��10�����ظ�1��
			--������Ҫ��ȫ������
			give_item(2,1,2002,1,"1 th�ng ",5,20,1);--�»�1��,5%��ÿ��20�����ظ�1��
			add_lingshi(6,1,5,30,1);	--���6����ʯ1��,5%��ÿ��30�����ظ�1��
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch�a kh�a v�ng",1,40,1) == 1 then	--1�Ѵ������Կ��,1%�ҿ�40�����ظ���ÿ���޵�1�Σ�
					SetTask(1482,1);	--ֻ�ܻ��һ��
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--���7����ʯ1��,0.2%��ÿ��60�����ظ�1��
			give_item(2,1,563,1,"1 K� Kim",0.2,100,1);	--���,0.2%��ÿ��100�����ظ�һ��
			give_item(2,1,3206,1,"1V� L�m b�o �i�n",0.1,160,1);--���ֱ���1��,0.1%��ÿ��160�����ظ�1��
			give_item(2,1,3214,1,"1 Thanh ��ng ��nh c�p 2",0.1,240,1);	--������ͭ��1��,0.1%��ÿ��240�����ظ�1��
			give_item(2,1,1146,1,"1 Vi�m Ho�ng Thi�t h�n",0.01,2000,1)	--�׻�����1��,0.01%��ÿ��2000�����ظ� 1��
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
		Msg2Global(get_name().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
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
			show_msg(szItemName,1)
		else
			szItemName = "1 ��ng V�";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;
		nRetResult = 1;
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
		nRetResult = 1;		
	end;
	return nRetResult;
end;

function get_name()
	local szName = GetName();
	local nLen = strlen(szName);
	if nLen > 4 then
		szName = strsub(szName,1,4);
		for i=1,nLen-4 do
			szName = szName.."*";
		end;
	end;
	return szName;
end;

function nothing()

end;