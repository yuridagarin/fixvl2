--�Ի�֮ͭ�ƺнű�
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("M� H�p ��ng B�i Huy Ho�ng ph�i c� Huy Ho�ng ��ng Th��c Chu�, b�n mu�n m� ch�?",
		2,
		"��ng �/confirm_open",
		"Kh�ng c� g�/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1073) < 1 then
		Talk(1,"","M� H�p ��ng B�i Huy Ho�ng ph�i c� Ch�a Kh�a ��ng Huy Ho�ng, b�n kh�ng c� n�!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,35) ~= 1 then   --�ռ为�ؼ��
			return
		end	
		if DelItem(2,0,1077,1) == 1 and DelItem(2,0,1073,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],2);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemInfo[19][1].."2 t�m!");
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("B�n nh�n ���c "..nRand.." - (c�p) 1 vi�n Linh th�ch, �� b� v�o T� Linh ��nh.");
		
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_TONG_BOX);
			local nProbOne = tBoxProb[2][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[2][2];
			local nRetCode = 0;		
			if nRandOne <= nProbOne then --��ü�Ʒ��Ʒ
				local nRandTT = random(1,100);
				if nRandTT <= 40 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_TONG_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
					end					
				else
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_TONG_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemInfo[25][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1].." th�t b�i, k� hi�u:"..nRetCode);
					end
				end
			elseif nRandOne <= nProbTwo then --��ó��潱��
				local nRandTwo = random(1,1000);
				for i=1,getn(tBoxChangGui[2]) do
					if nRandTwo <= tBoxChangGui[2][i] then
						for j=1,getn(tBoxTong[i]) do
							nRetCode = AddItem(tBoxTong[i][j][2],tBoxTong[i][j][3],tBoxTong[i][j][4],1);
							if nRetCode == 1 then
								Msg2Player("B�n nh�n ���c 1 "..tBoxTong[i][j][1]);
							else
								WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c "..tBoxTong[i][j][1].." th�t b�i, k� hi�u"..nRetCode);
							end
						end
						break
					end
				end	
				SetTask(TASK_USE_TONG_BOX,GetTask(TASK_USE_TONG_BOX)+1);
				local nProbShow =  format("%.4f",(500/10000)*GetTask(TASK_USE_TONG_BOX)*BOX_PROB_INCREASE);
				Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_TONG_BOX).." l�n m� H�p ��ng B�i Huy Ho�ng, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Vi�m Ho�ng Thi�t H�n) t�ng l�n<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");					
			else
				nRetCode = AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 "..tItemInfo[17][1]);
					SetTask(TASK_USE_TONG_BOX,GetTask(TASK_USE_TONG_BOX)+1);
					local nProbShow =  format("%.4f",(500/10000)*GetTask(TASK_USE_TONG_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_TONG_BOX).." l�n m� H�p ��ng B�i Huy Ho�ng, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Vi�m Ho�ng Thi�t H�n) t�ng l�n<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");					
				else
					WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p ��ng B�i Huy Ho�ng nh�n ���c "..tItemInfo[17][1].." th�t b�i, k� hi�u"..nRetCode);
				end
			end						
		end
	end
end