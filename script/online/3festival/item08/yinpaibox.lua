--��ҫ֮���ƺнű�
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("M� H�p Ng�n B�i Vinh D� ph�i c� Ch�a Kh�a B�c Vinh D�, b�n mu�n m� ch�?",
		2,
		"��ng �/confirm_open",
		"Kh�ng c� g�/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1074) < 1 then
		Talk(1,"","M� H�p Ng�n B�i Vinh D� ph�i c� Ch�a Kh�a B�c Vinh D�, b�n kh�ng c� n�!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,60) ~= 1 then   --�ռ为�ؼ��
			return
		end	
		if DelItem(2,0,1078,1) == 1 and DelItem(2,0,1074,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],50);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemInfo[19][1].."50 t�m!");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_YIN_BOX);
			local nProbOne = tBoxProb[3][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[3][2];
			local nRetCode = 0;				
			
			if nRandOne <= nProbOne then --��ü�Ʒ��Ʒ
				local nRandTT = random(1,100);
				if nRandTT <= 35 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
					end				
				elseif nRandTT <= 60 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing2[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing2[nRoute][nRandRing][2],tbHuangDiRing2[nRoute][nRandRing][3],tbHuangDiRing2[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing2[nRoute][nRandRing][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
					end									
				else
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemInfo[25][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1].." th�t b�i, k� hi�u:"..nRetCode);
					end				
				end
			elseif nRandOne <= nProbTwo then --��ó��潱��
				local nRandTwo = random(1,1000);
				if nRandTwo <= tBoxChangGui[3][1] then
					local nRandStone = random(1,100);
					if nRandStone <= 20 then
						lspf_AddLingShiInBottle(7,1);
						Msg2Player("B�n nh�n ���c 1 Linh th�ch c�p 7, n� � trong T� Linh ��nh.");
					else
						lspf_AddLingShiInBottle(6,1);
						Msg2Player("B�n nh�n ���c 1 vi�n Linh th�ch c�p 6, n� � trong T� Linh ��nh.");
					end
					SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
					local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_YIN_BOX).." l�n m� H�p Ng�n B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, Vi�m Ho�ng Thi�t H�n) t�ng l�n <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");					
				elseif nRandTwo <= tBoxChangGui[3][2] then
					nRetCode = AddItem(tItemInfo[30][2],tItemInfo[30][3],tItemInfo[30][4],1);
					if nRetCode == 1 then
						Msg2Player("B�n nh�n ���c 1 quy�n "..tItemInfo[30][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 quy�n "..tItemInfo[30][1]);
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_YIN_BOX).." l�n m� H�p Ng�n B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, Vi�m Ho�ng Thi�t H�n) t�ng l�n <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");											
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[30][1].." th�t b�i, k� hi�u:"..nRetCode)
					end
				else
					if IB_VERSION == 1 then --�����
						nRetCode = AddItem(tItemInfo[38][2],tItemInfo[38][3],tItemInfo[38][4],1);
						if nRetCode == 1 then
							Msg2Player("B�n nh�n ���c 1 "..tItemInfo[38][1]);
							Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[38][1]);
						end
					else
						nRetCode = AddItem(tItemInfo[39][2],tItemInfo[39][3],tItemInfo[39][4],1);
						if nRetCode == 1 then
							Msg2Player("B�n nh�n ���c 1 "..tItemInfo[39][1]);
							Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n ���c 1 "..tItemInfo[39][1]);
						end
					end
					if nRetCode == 1 then
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_YIN_BOX).." l�n m� H�p Ng�n B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, Vi�m Ho�ng Thi�t H�n) t�ng l�n <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n T�ng ki�m B�o R��ng th�t b�i, v� tr� th�t b�i: "..nRetCode);
					end
				end
			else
				nRetCode = AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 "..tItemInfo[18][1]);
						SetTask(TASK_USE_YIN_BOX,GetTask(TASK_USE_YIN_BOX)+1);
						local nProbShow = format("%.4f",(20000/10000)*GetTask(TASK_USE_YIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_YIN_BOX).." l�n m� H�p Ng�n B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, Vi�m Ho�ng Thi�t H�n) t�ng l�n <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");				
				else
					WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�n B�i Vinh D� nh�n "..tItemInfo[18][1].." th�t b�i, k� hi�u"..nRetCode);
				end				
			end
		end
	end
end