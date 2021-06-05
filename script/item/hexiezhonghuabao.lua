Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "T�i H�a H�i Trung Hoa";
TSK_COUNTER = 1797;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("���c r�i. B�t ��u m� th�i!/#open(%d)",nItemIdx),
				"Xem b�n trong c� g� ��!/see_item",
				"T�m th�i kh�ng m�/nothing",
				}
	Say("��y l� l�n th� <color=yellow>"..nCurCount.."<color> ng��i m� <color=yellow>"..g_ItemName.."<color>. L�u �: m� 2 t�i s� nh�n ���c 1 Qu�n C�ng Ch��ng, m� 2 t�i s� nh�n ���c 1 R��ng v� kh� B�c, m� 8 t�i s� nh�n ���c 1 t�i Gi�m ��nh ph� c�p 7, m� 10 t�i s� nh�n ���c 1 B�ch Ng�c th�ch, m� 80 t�i s� nh�n ���c 1 Long Huy�t ho�n, m� 150 t�i s� nh�n ���c 1 Chi�n Th�n ho�n, m� 200 t�i s� nh�n ���c 1 B�n Ti�u ho�c 1 ��ng V�. B�n x�c nh�n m� <color=yellow>"..g_ItemName.."<color> ch�? C�n ph�i c� 17 ch� tr�ng v� 300 �i�m s�c l�c.",getn(selTab),selTab);
end;

function see_item()
	Talk(1,"","M�i '"..g_ItemName..". C� th� nh�n ���c nh�ng v�t sau ��y: 1 B�n Long B�ch, Danh V�ng ng�u nhi�n 50-100 �i�m, ng�u nhi�n 20-30 �i�m c�ng hi�n S� M�n (C�n ph�i gia nh�p M�n Ph�i), 1 M�t n� S�t Th� ���ng, 3 Sinh �� ch�ng th�, 3 T� t�i ch�ng th�, 3 C� nh�n ch�ng th�, Qu�n C�ng Ch��ng, 1 R��ng v� kh� B�c, 1 t�i Gi�m ��nh ph� c�p 7, b�ch Ng�c th�ch, Long Huy�t ho�n, Chi�n Th�n ho�n, ng�u nhi�n 1 B�n Ti�u ho�c ��ng V�. Ch�c b�n may m�n!");
end;

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--��ǰ�ǵڼ��ο���
	local szItemName = "";
	if gf_JudgeRoomWeight(17,300) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--�����1��ʱ��7��
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B�n nh�n ���c 1 B�n Long B�ch");
			ModifyReputation(random(50,100),0);	--50��100�������
			if GetPlayerRoute() ~= 0 then
				nRand = random(20,30);
				SetTask(336,GetTask(336)+nRand);	--25��50���ʦ�Ź��׶�
				Msg2Player("B�n nh�n ���c "..nRand.." �i�m c�ng hi�n S� M�n ");
			end;
			nRetCode,nItemIdx = AddItem(2,1,1087,1);	--ɱ�������1��	ʱ��7��
			--SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B�n nh�n ���c 1 M�t n� S�t Th� ���ng ");
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
			if mod(nCurCount,2) == 0 then	--������,����������,ʱ��7��
				nRetCode,nItemIdx = AddItem(2,1,9999,1);
				--SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("B�n nh�n ���c 1 Qu�n C�ng Ch��ng");
				nRetCode,nItemIdx = AddItem(2,1,1147,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("B�n nh�n ���c 1 R��ng v� kh� B�c");
			end;
			nRand = random(1,100);
			szItemName = " 1 t�i Gi�m ��nh ph� c�p 7";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1058,1);	--���7��������	ʱ��7��
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,8) == 0 then	
				nRetCode,nItemIdx = AddItem(2,1,1058,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,100);
			szItemName = "1 B�ch Ng�c th�ch";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--���ð���ʯ ʱ��7��
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,10) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--���ð���ʯ ʱ��7��
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			szItemName = "1 Long Huy�t ho�n";
			if nRand <= 5 then 
				nRetCode,nItemIdx = AddItem(2,1,1002,1);	--��Ѫ�� ʱ��7��
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,80) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1002,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;		
			nRand = random(1,1000);
			szItemName = "1 Chi�n Th�n ho�n";
			if nRand <= 4 then 
				nRetCode,nItemIdx = AddItem(2,1,1005,1);	--ս���� ʱ��7��
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,150) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1005,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			if nRand <= 2 then 		--�������������1ƥ
				if random(1,2) == 1 then
					szItemName = "1 B�n ti�u";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "1 ��ng V�";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "1 B�n ti�u";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "1 ��ng V�";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;			
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."th�"..nCurCount.." m� "..g_ItemName);
		end;
	else
		Talk(1,"","Kho�ng tr�ng ho�cs�c l�cc�a b�n kh�ng ��. Xin ki�m tra l�i h�nh trang tr��c!"..g_ItemName.."!");
	end;
end;

function show_msg(szItemName)
	Msg2Player("B�n nh�n ���c "..szItemName);
	Msg2Global(GetName().."M� '"..g_ItemName.." nh�n ���c "..szItemName);
	WriteLog("["..g_ItemName.."]:"..GetName().."Nh�n ���c"..szItemName);	
end;

function nothing()

end;