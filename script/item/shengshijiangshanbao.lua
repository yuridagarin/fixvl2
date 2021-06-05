Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Th�nh Th� Giang S�n Bao";
g_NeedRoom = 11;
g_NeedWeight = 200;
TSK_COUNTER = 541;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	Talk(1,"#confirm_open("..nItemIdx..")","��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. Xin ch� �: Nh�n v�t m�i m� 2 bao ���c 1 M�t th�t s� m�n l�nh, m� 8 bao ���c ng�u nhi�n 1 t�m ph�i ph��ng linh th�ch c�p 6, m� 30 bao ���c ng�u nhi�n 1 t�m ph�i ph��ng linh th�ch c�p 7, m� 40 bao ���c 1 ch�a kh�a v�ng (r��ng), (c� h�i 1 l�n), (Nh�n v�t nh�n qua kh�ng ���c nh�n l�i), m�i m� 50 bao ���c ng�u nhi�n 1 linh th�ch c�p 7, m�i m� 80 bao ���c 15 Tam Di�u Long Hi, m� 160 bao ���c 1 V� l�m b�o �i�n, m� 240 bao ���c ng�u nhi�n B�n Ti�u ho�c ��ng V�, m� 2000 bao ���c 1 Vi�m Ho�ng Thi�t H�n.");
end;

function confirm_open(nItemIdx)
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				format("Xem b�n trong c� g� ��!/#see_item(%d)",nItemIdx),
				"T�m th�i kh�ng m�/nothing",
				}
	Say("<color=red> Ch� �<color>: R��ng b�n ph�i c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight..". Linh th�ch v� ph�i ph��ng Linh th�ch s� b� v�o T� Linh ��nh. Xin ch� �, c�p hi�n t�i �i�m danh v�ng v� �i�m c�ng hi�n s� m�n t�i �a, n�u m� l� bao v��t qu� gi�i h�n, c� kh� n�ng h� th�ng s� kh�u tr�. B�n mu�n m� kh�ng?",getn(selTab),selTab);
end

function see_item(nItemIdx)
	local szItems = "1 X�ch Thi�t Tinh, 2 Nh�t Thi�m Y�u Ho�ng, 50 danh v�ng, 25 �i�m c�ng hi�n s� m�n (ph�i gia nh�p m�n ph�i), 1 C� c�i ��, 1 T�i b�o th�ch, 3 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, 1 M�t th�t s� m�n l�nh, ng�u nhi�n 1 ph�i ph��ng linh th�ch c�p 6, ng�u nhi�n 1 Linh th�ch c�p 6, ng�u nhi�n 1 ph�i ph��ng linh th�ch c�p 7, ch�a kh�a v�ng (r��ng) (c� h�i 1 l�n) (Nh�n v�t nh�n qua kh�ng ���c nh�n l�i), ng�u nhi�n 1 Linh th�ch c�p 7, 15 Tam Di�u Long Hi, 1 V� l�m b�o �i�n, ng�u nhi�n 1 B�n Ti�u ho�c ��ng V�, 1 Vi�m Ho�ng Thi�t H�n";
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
			AddItem(2,1,3330,2);	--һ������2��
			Msg2Player("Sau <color=yellow>");
			ModifyReputation(50,0);	--����50��
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+25);	--ʦ�Ź��׶�25
				Msg2Player("B�n nh�n ���c 25 �i�m c�ng hi�n s� m�n");
			end;
			AddItem(2,1,1090,1);
			Msg2Player("B�n nh�n ���c 1 C�i ��");
			AddItem(2,1,2642,1);
			Msg2Player("Nh�n ���c 1 T�i b�o th�ch");			
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
			give_item(2,0,1048,1," 1 M�t th�t s� m�n l�nh",20,2);	--ʦ��������1��,20%��ÿ��2�����ظ�1��
			--������Ҫ��ȫ������
			add_peifang(6,1,5,8,1);	--���6����ʯ�䷽1��,5%��ÿ��10�����ظ�1��
			add_lingshi(6,1,5,15,1);	--���6����ʯ1��,5%��ÿ��15�����ظ�1��
			add_peifang(7,1,2,30,1);	--���7����ʯ�䷽1��,2%��ÿ��30�����ظ�1��
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch�a kh�a v�ng",1,40,1) == 1 then	--1�Ѵ������Կ��,1%�ҿ�40�����ظ���ÿ���޵�1�Σ�
					SetTask(1482,1);	--ֻ�ܻ��һ��
				end;
			end;
			add_lingshi(7,1,0.5,50,1);	--���7����ʯ1��,0.5%��ÿ��50�����ظ�1��
			give_item(2,1,3331,15,"15 Tam Di�u Long Hi",0.2,80,1);	--ũɣ��Ҫ,0.2%��ÿ��80�����ظ�һ��
			give_item(2,1,3206,1,"1V� L�m b�o �i�n",0.1,160,1);--���ֱ���1��,0.1%��ÿ��160�����ظ�1��
			--������Ҫ��ȫ������͹�������
			add_horse(0.2,240);	--�������������1ƥ��0.2%��ÿ��240�����ظ�1��
			give_item(2,1,1146,1,"1 Vi�m Ho�ng Thi�t h�n",0.01,2000,2)	--�׻�����1��,0.01%��ÿ��2000�����ظ� 1��
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