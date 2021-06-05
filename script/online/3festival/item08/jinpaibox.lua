--��ҫ֮���ƺнű�
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	Say("M� H�p Kim B�i Vinh D� ph�i c� Ch�a Kh�a V�ng Vinh D�. B�n mu�n m� ch�?",
		3,
		"��ng �! Ta mu�n nh�n ���c v� kh� Hi�n Vi�n/#ask_choose_weapon(1)",
		"��ng �! Nh�ng ta kh�ng mu�n nh�n v� kh� Hi�n vi�n (t�ng t� l� nh�n ���c Vi�n Ho�ng Thi�t H�n)/#ask_choose_weapon(2)",
		"Kh�ng c� g�/nothing")
end

function ask_choose_weapon(nType)
	if nType == 1 then
		Say("M� H�p Kim B�i Vinh D� c� th� nh�n ���c v� kh� Hi�n Vi�n, b�n mu�n nh�n <color=yellow>v� kh� Hi�n Vi�n<color>?",
			2,
			"��ng �/choose_weapon",
			"�� ta suy ngh�/nothing")
	elseif nType == 2 then
		Say("M� H�p Kim B�i Vinh D� c� th� nh�n ���c v� kh� Hi�n Vi�n, b�n x�c nh�n <color=yellow>kh�ng mu�n nh�n v� kh� Hi�n Vi�n<color>?",
			2,
			"��ng �/#confirm_open(3)",
			"�� ta suy ngh�/nothing")		
	end
end

function choose_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("M� H�p Kim B�i Vinh D� c� th� nh�n ���c v� kh� Ho�ng ��, n�u m� ra v� kh� Ho�ng ��, b�n h�y ch�n lo�i v� kh� b�n mu�n",
			3,
			"Ta mu�n l�y Hi�n Vi�n To�i V� �ao /#want_weapon(1)",
			"Ta mu�n l�y Hi�n Vi�n To�i V� �ao/#want_weapon(2)",
			"T�m th�i kh�ng m� r��ng /nothing")	
	else
		confirm_open(0);
	end	
end

function want_weapon(nType)
	if nType == 1 then
		Say("N�u m� ra Ho�ng �� v� kh�, b�n ch�n Hi�n Vi�n To�i V� �ao, b�n x�c nh�n kh�ng? ",
			2,
			"��ng �/#confirm_open(1)",
			"Ta ch�n nh�m r�i./choose_weapon");
	elseif nType == 2 then
		Say("N�u m� ra Ho�ng �� v� kh� ,b�n ch�n Hi�n Vi�n To�i V� C�n, b�n x�c nh�n kh�ng? ",
			2,
			"��ng �/#confirm_open(2)",
			"Ta ch�n nh�m r�i./choose_weapon");	
	end	
end

function confirm_open(nType)
	if GetItemCount(2,0,1075) < 1 then
		Talk(1,"","M� H�p Kim B�i Vinh D� ph�i c� Ch�a Kh�a V�ng Vinh D�, b�n kh�ng c� Ch�a Kh�a V�ng Vinh D� �!");
		return
	else 
		if Zgc_pub_goods_add_chk(5,50) ~= 1 then   --�ռ为�ؼ��
			return
		end	
		if DelItem(2,0,1079,1) == 1 and DelItem(2,0,1075,1) == 1 then
			AddItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],300);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemInfo[19][1].."300 th�!");
			
			local nRandOne = random(1,1000000);
			local nTimes = GetTask(TASK_USE_JIN_BOX);
			local nProbOne = tBoxProb[4][1]*(1+nTimes*BOX_PROB_INCREASE);
			local nProbTwo = tBoxProb[4][2];
			local nRetCode = 0;	
			
			if nRandOne <= nProbOne then --��ü�Ʒ��Ʒ
				local nRandThree = random(1,100);
				if nRandThree <= 20 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing1[nRoute]));
					nRetCode = AddItem(tbHuangDiRing1[nRoute][nRandRing][2],tbHuangDiRing1[nRoute][nRandRing][3],tbHuangDiRing1[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRandRing][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing1[nRoute][nRandRing][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
					end	
				elseif nRandThree <= 40 then
					local nRoute = GetPlayerRoute();
					local nRandRing = random(1,getn(tbHuangDiRing2[nRoute]));
					nRetCode = AddItem(tbHuangDiRing2[nRoute][nRandRing][2],tbHuangDiRing2[nRoute][nRandRing][3],tbHuangDiRing2[nRoute][nRandRing][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing2[nRoute][nRandRing][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1].."!");
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tbHuangDiRing2[nRoute][nRandRing][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
					end							
				elseif nRandThree <= 60 then --�Ƶ�����
					if nType ~= 3 then
						local nRoute = GetPlayerRoute();
						if nRoute == 2 then
							nRetCode = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
							if nRetCode == 1 then
								SetTask(TASK_USE_JIN_BOX,0);
								Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tHuangDiWeapon[nRoute][nType][1]);
								Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nType][1].."!");
								WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nType][1]);
							else
								WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nType][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
							end	
						else
							local nRandwp = random(1,getn(tHuangDiWeapon[nRoute]));
							nRetCode = AddItem(tHuangDiWeapon[nRoute][nRandwp][2],tHuangDiWeapon[nRoute][nRandwp][3],tHuangDiWeapon[nRoute][nRandwp][4],1,1,-1,-1,-1,-1,-1,-1);
							if nRetCode == 1 then
								SetTask(TASK_USE_JIN_BOX,0);
								Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tHuangDiWeapon[nRoute][nRandwp][1]);
								Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nRandwp][1].."!");
								WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nRandwp][1]);
							else
								WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c trang b� Ho�ng ��"..tHuangDiWeapon[nRoute][nRandwp][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
							end					
						end	
					else
						nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
						if nRetCode == 1 then
							SetTask(TASK_USE_JIN_BOX,0);
							Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemInfo[25][1]);
							Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
							WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
						else
							WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1].." th�t b�i, k� hi�u:"..nRetCode);
						end
					end			
				else  --�׻�����
					nRetCode = AddItem(tItemInfo[25][2],tItemInfo[25][3],tItemInfo[25][4],1);
					if nRetCode == 1 then
						SetTask(TASK_USE_JIN_BOX,0);
						Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemInfo[25][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
						WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1]);
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[25][1].." th�t b�i, k� hi�u:"..nRetCode);
					end										
				end						
			else --��ó��潱��
				local nRandTwo = random(1,1000);
				if nRandTwo <= tBoxChangGui[4][1] then
					lspf_AddLingShiInBottle(7,3);
					Msg2Player("B�n nh�n ���c 3 vi�n Linh th�ch c�p 7, n� � trong T� Linh ��nh.");
					SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
					local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
					Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_JIN_BOX).." l�n m� H�p Kim B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, v� kh� Hi�n Vi�n, Vi�m Ho�ng Thi�t H�n) t�ng cao<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");					
				elseif nRandTwo <= tBoxChangGui[4][2] then
					nRetCode = AddItem(tItemInfo[31][2],tItemInfo[31][3],tItemInfo[31][4],1);
					if nRetCode == 1 then
						Msg2Player("B�n nh�n ���c 1 quy�n "..tItemInfo[31][1]);
						Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 quy�n "..tItemInfo[31][1]);
						SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
						local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
						Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_JIN_BOX).." l�n m� H�p Kim B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, v� kh� Hi�n Vi�n, Vi�m Ho�ng Thi�t H�n) t�ng cao<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");											
					else
						WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[31][1].." th�t b�i, k� hi�u:"..nRetCode)
					end		
				else
					if IB_VERSION == 1 then --�����
						nRetCode = AddItem(tItemInfo[38][2],tItemInfo[38][3],tItemInfo[38][4],1);
						if nRetCode == 1 then
							Msg2Player("B�n nh�n ���c 1 "..tItemInfo[38][1]);
							Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[38][1]);
							SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
							local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
							Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_JIN_BOX).." l�n m� H�p Kim B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, v� kh� Hi�n Vi�n, Vi�m Ho�ng Thi�t H�n) t�ng cao<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");								
						else
							WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[38][1].." th�t b�i, k� hi�u:"..nRetCode)
						end
					else  --�շ���
						nRetCode = AddItem(tItemInfo[39][2],tItemInfo[39][3],tItemInfo[39][4],1);
						if nRetCode == 1 then
							Msg2Player("B�n nh�n ���c 1 "..tItemInfo[39][1]);
							Msg2Global("Ng��i ch�i"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[39][1]);
							SetTask(TASK_USE_JIN_BOX,GetTask(TASK_USE_JIN_BOX)+1);
							local nProbShow = format("%.4f",(200000/10000)*GetTask(TASK_USE_JIN_BOX)*BOX_PROB_INCREASE);
							Talk(1,"","��y l� l�n th� "..GetTask(TASK_USE_JIN_BOX).." l�n m� H�p Kim B�i Vinh D�, t� l� nh�n ���c c�c ph�m (Hi�n Vi�n chi�n, Hi�n Vi�n ��u, v� kh� Hi�n Vi�n, Vi�m Ho�ng Thi�t H�n) t�ng cao<color=yellow>"..nProbShow.." %<color>. Khi nh�n ���c c�c ph�m, s� l�n t�nh x�c su�t s� ���c t�nh l�i t� ��u.");								
						else
							WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� H�p Kim B�i Vinh D� nh�n ���c 1 "..tItemInfo[39][1].." th�t b�i, k� hi�u:"..nRetCode)
						end						
					end	
				end					
			end
		end
	end
end
