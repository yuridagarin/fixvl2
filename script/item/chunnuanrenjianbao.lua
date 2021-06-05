Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "T�i Xu�n No�n Nh�n Gian ";
g_NeedRoom = 11;
g_NeedWeight = 200;
TSK_COUNTER = 503;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	Talk(1,"#confirm_open("..nItemIdx..")","��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. Xin ch� �: M�i nh�n v�t khi m�i l�n m� 8 t�i s� nh�n ���c 1 Th� Th�n ph�, m�i l�n m� 10 t�i s� ng�u nhi�n nh�n ���c Ph�i Ph��ng c�p 6, khi m� 20 t�i s� ng�u nhi�n nh�n ���c 1 Linh Th�ch c�p 6, khi m� 30 t�i s� ng�u nhi�n nh�n ���c 1 Linh Th�ch c�p 7, m� 40 t�i s� nh�n ���c ch�a kh�a v�ng? (ch� c� 1 c� h�i duy nh�t)? (tr��c khi tho�t kh�i tr� ch�i, nh�n v�t �� s� kh�ng c� c� h�i n�y l�n n�a), khi m� 60 t�i s� ng�u nhi�n nh�n ���c 1 Linh Th�ch c�p 7, khi m� 80 t�i s� nh�n ���c 1 N�ng Tang ph�, m� 160 t�i s� nh�n ���c 1 V� L�m B�o �i�n, m� 240 t�i s� nh�n ���c 1 B�n Ti�u ho�c 1 ��ng V�, m� 2000 t�i s� nh�n ���c 1 Vi�m Ho�ng Thi�t H�n.");
end;

function confirm_open(nItemIdx)
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				format("Xem b�n trong c� g� ��!/#see_item(%d)",nItemIdx),
				"T�m th�i kh�ng m�/nothing",
				}
	Say("<color=red> Ch� �<color>: R��ng b�n ph�i c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight.." s�c l�c. Linh Th�ch v� Linh Th�ch Ph�i Ph��ng s� t� h�p t�i T� Linh ��nh. Xin h�y ch� � Danh V�ng hi�n t�i c�a b�n, �i�m c�ng hi�n S� M�n ph�i ��t t�i �a, n�u nh� s� l��ng t�i m� ���c v��t qu� gi�i h�n, h� th�ng s� t� ��ng kh�u tr�. Quy�t ��nh m� ngay b�y gi� ch�?",getn(selTab),selTab);
end

function see_item(nItemIdx)
	local szItems = "1 X�ch Thi�t Tinh, 2 Thi�n th�ch, 50 �i�m Danh V�ng, �� c�ng hi�n S� M�n 25? (c�n ph�i gia nh�p M�n Ph�i), 1 C� C�i ��, 3 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, 1 Th� Th�n ph�, ng�u nhi�n 1 Linh Th�ch Ph�i Ph��ng c�p 6, ng�u nhi�n 1 Linh Th�ch c�p 6, 1 Linh Th�ch Ph�i Ph��ng c�p 7 ng�u nhi�n, Ch�a kh�a v�ng? (M�i ng��i ch� c� duy nh�t 1 c� h�i)? (nh�n v�t tr��c �� �� c� v�t ph�m n�y s� kh�gn th� mua n�a), 1 Linh Th�ch c�p 7 ng�u nhi�n, 1 N�ng Tang Ph�, 1 V� L�m B�o �i�n, 1 B�n Ti�u ho�c ��ng V� ng�u nhi�n , 1 Vi�m Ho�ng Thi�t H�n.";
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
			give_item(2,0,556,1,"1 Th� Th�n ph�",5,8);	--�����1��,5%��ÿ��8�����ظ�1��
			--������Ҫ��ȫ������
			add_peifang(6,1,5,10,1);	--���6����ʯ�䷽1��,5%��ÿ��10�����ظ�1��
			add_lingshi(6,1,5,20,1);	--���6����ʯ1��,5%��ÿ��20�����ظ�1��
			add_peifang(7,1,2,30,1);	--���7����ʯ�䷽1��,2%��ÿ��30�����ظ�1��
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch�a kh�a v�ng",1,40,1) == 1 then	--1�Ѵ������Կ��,1%�ҿ�40�����ظ���ÿ���޵�1�Σ�
					SetTask(1482,1);	--ֻ�ܻ��һ��
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--���7����ʯ1��,0.2%��ÿ��60�����ظ�1��
			give_item(2,1,1056,1,"1 N�ng Tang ph�",0.5,80,1);	--ũɣ��Ҫ,0.5%��ÿ��80�����ظ�һ��
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