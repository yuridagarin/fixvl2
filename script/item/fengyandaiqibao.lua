Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "T�i Phong Y�n ��i Kh�i ";
g_NeedRoom = 16;
g_NeedWeight = 300;
TSK_COUNTER = 1798;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				"Xem b�n trong c� g� ��!/see_item",
				"T�m th�i kh�ng m�/nothing",
				}
	Say("��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. Xin b�n l�u �: m� 2 t�i nh�n ��oc 1 Qu�n C�ng, m� 10 t�i nh�n ���c 1 B�ch Ng�c Th�ch, m� 20 t�i nh�n ���c 1 Tr�n Ph�i quy�n - trung, m� 80 t�i nh�n ���c 1 Long Huy�t ho�n, m� 150 t�i nh�n ���c 1 Chi�n Th�n ho�n, m� 200 t�i nh�n ���c 1 B�n Ti�u ho�c 1 ��ng V�, m� 240 t�i nh�n ���c 1 Tr�n Ph�i quy�n - h�. B�n x�c nh�n m� <color=yellow>"..g_ItemName.."<color> ch�? <color=red>Ch� � <color>: B�n c�n ph�i c� "..g_NeedRoom.." ch� tr�ng v� "..g_NeedWeight.."S�c l�c; ng��i ch�a gia nh�p L�u Ph�i s� ng�u nhi�n nh�n ���c Tr�n Ph�i quy�n c�a L�u Ph�i.",getn(selTab),selTab);
end;

function see_item()
	local szItems = " 1 B�n Long B�ch 1, Danh V�ng ng�u nhi�n 50-100 �i�m, 1 m�t n� S�t Th� ���ng, 1 R��ng v� kh� B�c, 3 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, Qu�n C�ng Ch��ng, b�ch Ng�c th�ch, ��i chi�u L�u Ph�i Th�n ph�i quy�n- trung, Long Huy�t ho�n, Chi�n Th�n ho�n, 1 B�n Ti�u ho�c ��ng V� ng�u nhi�n, v�i L�u Ph�i Tr�n Ph�i quy�n -h� t��ng �ng l�u ph�i";
	Talk(1,"","M�i '"..g_ItemName.." c� th� m� ���c c�c v�t ph�m: "..szItems..". Ch�c b�n may m�n!");
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
	[19] = {{"V� Thi�n Ma C�ng-trung",2,1,956},{"V� �nh Ma C�-trung",2,1,953}},
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
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--�����1��ʱ��7��
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B�n nh�n ���c 1 B�n Long B�ch");
			ModifyReputation(random(50,100),0);
			nRetCode,nItemIdx = AddItem(2,1,1087,1);	--ɱ�������1��	
			Msg2Player("B�n nh�n ���c 1 M�t n� S�t Th� ���ng ");
			nRetCode,nItemIdx = AddItem(2,1,1147,1);
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B�n nh�n ���c 1 R��ng v� kh� B�c");
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
			if mod(nCurCount,2) == 0 then	--������
				nRetCode,nItemIdx = AddItem(2,1,9999,1);
				Msg2Player("B�n nh�n ���c 1 Qu�n C�ng Ch��ng");
			end;
			give_item(2,1,1024,1,"1 B�ch Ng�c th�ch",50,10);
			nRand = random(1,100);
			if nRand <= 3 then
				give_zpcp(tZJCP);
			end;
			if mod(nCurCount,20) == 0 then
				give_zpcp(tZJCP);
			end;
			nRand = random(1,1000);
			give_item(2,1,1002,1,"1 Long Huy�t ho�n",5,80,7);
			give_item(2,1,1005,1,"1 Chi�n Th�n ho�n",4,150,7);
			nRand = random(1,1000);
			if nRand <= 2 then 		--�������������1ƥ
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
			if mod(nCurCount,200) == 0 then
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
			nRand = random(1,1000);
			if nRand <= 2 then
				give_zpcp(tXJCP);
			end;
			if mod(nCurCount,240) == 0 then
				give_zpcp(tXJCP);
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."th�"..nCurCount.." m� "..g_ItemName);
		end;
	else
		Talk(1,"","Kho�ng tr�ng ho�cs�c l�cc�a b�n kh�ng ��. Xin ki�m tra l�i h�nh trang tr��c!"..g_ItemName.."!");
	end;
end;

function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B�n nh�n ���c "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(GetName().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."Nh�n ���c"..szItemName);	
end;

function give_zpcp(tbZPCP)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,1);		
	show_msg(szName,1);
end;

function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,1);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;

function nothing()

end;