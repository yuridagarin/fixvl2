--�Ի�֮���ƺнű�
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("M� H�p Ng�c B�i Huy Ho�ng ph�i c� Ch�a Kh�a Ng�c Huy Ho�ng, b�n mu�n m� ch�?",
		2,
		"��ng �/confirm_open",
		"Kh�ng c� g�/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1072) < 1 then
		Talk(1,"","M� H�p Ng�c B�i Huy Ho�ng c�n Ch�a Kh�a Ng�c Huy Ho�ng, ng��i kh�ng c� Ch�a Kh�a Ng�c Huy Ho�ng �!");
		return
	else 
		if Zgc_pub_goods_add_chk(6,35) ~= 1 then   --�ռ为�ؼ��
			return
		end	
		if DelItem(2,0,1076,1) == 1 and DelItem(2,0,1072,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemInfo[19][1].."1 t�m!");
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("B�n nh�n ���c "..nRand.." - (c�p) 1 vi�n Linh th�ch, �� b� v�o T� Linh ��nh.");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_TIE_BOX);
			local nProbOne = tBoxProb[1][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[1][2];
			local nRetCode = 0;
			if nRandOne <= nProbOne then --��ü�Ʒ��Ʒ
				nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
				if nRetCode == 1 then
					SetTask(TASK_USE_TIE_BOX,0);
					Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemInfo[25][1]);
					Msg2Global("Ng��i ch�i"..GetName().."M� H�p Ng�c B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1]);
					WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�c B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1]);
				else
					WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�c B�i Huy Ho�ng nh�n ���c 1 "..tItemInfo[25][1].." th�t b�i, k� hi�u:"..nRetCode);
				end
			elseif nRandOne <= nProbTwo then --��ó��潱��
				local nRandTwo = random(1,1000);
				for i=1,getn(tBoxChangGui[1]) do
					if nRandTwo <= tBoxChangGui[1][i] then
						for j=1,getn(tBoxTie[i]) do
							nRetCode = AddItem(tBoxTie[i][j][2],tBoxTie[i][j][3],tBoxTie[i][j][4],1);
							if nRetCode == 1 then
								Msg2Player("B�n nh�n ���c 1 "..tBoxTie[i][j][1]);
							else
								WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�c B�i Huy Ho�ng nh�n ���c "..tBoxTie[i][j][1].." th�t b�i, k� hi�u"..nRetCode);
							end
						end
						break
					end
				end
				SetTask(TASK_USE_TIE_BOX,GetTask(TASK_USE_TIE_BOX)+1);
				local nProbShow = format("%.4f",(100/10000)*GetTask(TASK_USE_TIE_BOX)*BOX_PROB_INCREASE);
				Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_TIE_BOX).." m� H�p Ng�c B�i Huy Ho�ng, t� l� nh�n ���c c�c ph�m (Vi�m Ho�ng Thi�t H�n) t�ng <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");						
			else
				nRetCode = AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 "..tItemInfo[16][1]);
					SetTask(TASK_USE_TIE_BOX,GetTask(TASK_USE_TIE_BOX)+1);
					local nProbShow = format("%.4f",(100/10000)*GetTask(TASK_USE_TIE_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_TIE_BOX).." m� H�p Ng�c B�i Huy Ho�ng, t� l� nh�n ���c c�c ph�m (Vi�m Ho�ng Thi�t H�n) t�ng <color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");					
				else
					WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Ng�c B�i Huy Ho�ng nh�n ���c "..tItemInfo[16][1].." th�t b�i, k� hi�u"..nRetCode);
				end
			end	
		end
	end
end
