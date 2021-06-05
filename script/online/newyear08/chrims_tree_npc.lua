--08����Сʥ����npc�ű�
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function main()
	local npcTreeIndex = GetTargetNpc();
	if GetTime()-GetTask(TASK_PLANT_TIME) > PLANT_LIFE_TIME or GetTask(TASK_PLANT_TIME) == 0 or npcTreeIndex ~= GetTask(TASK_CHRIMS_TREE_IDX) then
		Msg2Player("��y kh�ng ph�i c�y th�ng c�a ng��i");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FINAL_AWARD) >= nDate then --��ֹ����������ս�����������
		return
	end
	local strtab = {
		"Trang tr� c�y th�ng/strew_chrims_tree",
		"Nh�n ph�n th��ng trang tr� c�y th�ng./get_chrims_award",
		"Nh�n qu� gi�ng sinh/get_final_award",
		"Nh�n c�y th�ng/take_chrims_tree",
		"Xin ��i gi�y l�t r�i ��n xem th�/nothing"
		};
	Say("C�y th�ng n�y r�t ��p, b�n mu�n?",
		getn(strtab),
		strtab);
end

function strew_chrims_tree()
	if GetTask(TASK_TREE_NUM) >= STREW_TREE_TOTAL then
		Talk(1,"main","C�y th�ng n�y ��p r�i kh�ng c�n trang tr�.");
		return
	end
	local strtab1 = {
		"Nh�n nhi�m v� trang tr� c�y th�ng/get_chrims_task",
		"Quay ��u xem th�/nothing"
		};
	local strtab2 = {
		"Ta mu�n trang tr� c�y th�ng/finish_chrims_task",
		"Ta th� t�m l�i/nothing"
		};	
	local nNum = GetTask(TASK_TREE_NUM); --�ڼ�������
	local nRand = GetTask(TASK_TABLE_IDX);
	if GetTask(TASK_IS_STREW) == 0 then
		if nNum ~= 0 and GetBit(GetTask(TASK_STEP_AWARD),nNum) == 0 then  --��һ��װ������δ��ȡ�����������µ�����
			Talk(1,"","B�n th�y ���c tr�n c�y th�ng c� 1 �ng gi� c��i v�i b�n, ch� v�o h�p qu� tr�n c�y, nh� mu�n b�n sau khi nh�n <color=yellow>ph�n th��ng trang tr� c�y th�ng<color> ��n xem th�");
		else 
			Say("B�n th�y c�y th�ng ch�a ho�n m�, mu�n trang tr� l�i. Mu�n xem l�i? B�n �� trang tr� xong<color=yellow>"..nNum.."<color> l�n c�y th�ng, c� th� trang tr� l�i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l�n.",
				getn(strtab1),
				strtab1);
		end
	else
		Say("B�n mu�n d�ng <color=yellow>"..tStrewTask[nRand][1].."c�i"..tStrewTask[nRand][2].." <color> �� trang tr� c�y th�ng? Lo�i n�y ch� c� � <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B�n �� trang tr� xong <color=yellow>"..nNum.."<color> l�n c�y th�ng, c� th� trang tr� l�i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l�n.",
			getn(strtab2),
			strtab2);	
	end
end

function get_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = random(1,getn(tStrewTask));
	SetTask(TASK_IS_STREW,1);
	SetTask(TASK_TABLE_IDX,nRand);
	Talk(1,"","B�n ch�p nh�n nhi�m v� trang tr� c�y th�ng, c�n d�ng <color=yellow>"..tStrewTask[nRand][1].."c�i"..tStrewTask[nRand][2].." <color> �� trang tr�, lo�i n�y ch� c� � ch� c� � <color=yellow> "..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B�n �� trang tr� xong <color=yellow>"..nNum.."<color> l�n c�y th�ng, c� th� trang tr� l�i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l�n.");
end

function finish_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = GetTask(TASK_TABLE_IDX);
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local MapID,MapX,MapY = GetWorldPos();
	if GetItemCount(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5]) < tStrewTask[nRand][1] then
		Talk(1,"","B�n kh�ng c� <color=yellow>"..tStrewTask[nRand][1].."c�i"..tStrewTask[nRand][2].."<color>, lo�i n�y ch� c� � <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>, nhanh ch�ng �i t�m th�. B�n �� trang tr� xong <color=yellow>"..nNum.."<color> l�n c�y th�ng, c� th� trang tr� l�i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> l�n.");
	else
		if DelItem(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5],tStrewTask[nRand][1]) == 1 then
			SetTask(TASK_TREE_NUM,GetTask(TASK_TREE_NUM)+1);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TABLE_IDX,0);
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			local nSharpIdx = random(1,4);
			SetTask(TASK_SHARP_IDX,nSharpIdx)
			local npcTreeIndex = CreateNpc(tTreeNpc[nNum+1][nSharpIdx][1],GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2],MapID,MapX,MapY);
			if npcTreeIndex == 0 then
				WriteLog("[C�y th�ng n�m m�i 08 b� l�i]:"..GetName().."Khi ��t c�y th�ng v�o, CreateNpc tr� h�m s� quay l�i l� 0, trong h�m s� CreateNpc tham s� nh�p v�o l�:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
			end;
			SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
			SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
			SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");			
			Talk(1,"","Sau khi <color=yellow>"..tStrewTask[nRand][2].."<color> trang tr� xong, qu� l� tuy�t ��p. B�n �� trang tr� xong <color=yellow>"..(nNum+1).."<color> l�n c�y th�ng, c� th� trang tr� l�i <color=yellow>"..(STREW_TREE_TOTAL-nNum-1).."<color> l�n.");
		end
	end
end

function get_chrims_award()
	local nLv = GetLevel();
	local nNum = GetTask(TASK_TREE_NUM);
	if nNum == 0 then
		Talk(1,"","B�n v�n ch�a trang tr� c�y th�ng?");
		return
	end
	local nExp = floor((tChrimsExp[nNum]*nLv^3)/(80^3));	
	if GetBit(GetTask(TASK_STEP_AWARD),nNum) ~= 0 then
		Talk(1,"","B�n �� nh�n qu� trang tr� l�n n�y. 1");
	else
		--99����Ϊһ�����辭��
		if nLv ~= 999 then
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.."Kinh nghi�m");
		else
			if Zgc_pub_goods_add_chk(tChrimsLingshi[nNum][3],tChrimsLingshi[nNum][3]) ~= 1 then
				return
			end
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));			
			for i = 1,tChrimsLingshi[nNum][3] do
				local nRand = random(tChrimsLingshi[nNum][1],tChrimsLingshi[nNum][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end
		end
	end
end

function take_chrims_tree()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	SetTask(TASK_IS_PLANT,0);
	SetTask(TASK_PLANT_TIME,0);
	SetNpcLifeTime(nIdx,0);
	SetNpcScript(nIdx,"");
	Talk(1,"","B�n �� nh�n c�y th�ng, c� th� trang tr� ho�c nh�n qu� b�t c� l�c n�o.");
end

function get_final_award()
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	if nNum == 0 then
		if nLv >= 70 then
			Say("B�n ch�a trang tr� c�y th�ng, qu� ng�u nhi�n nh�n ���c l�"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (c�p) Linh Th�ch"..tChrimsLingshi[11][3].." , c�y th�ng s� bi�n m�t. B�n ch�p nh�n?",
				2,
				"��ng �/confirm_get_award",
				"Ta ch�n sai r�i!/main");
		else
			Talk(1,"","B�n ch�a trang tr� c�y th�ng, ��ng c�p kh�ng �� c�p 70, kh�ng c� qu� qu� gi�ng sinh.");
			return
		end			
	elseif nNum < STREW_TREE_TOTAL then
		if nLv ~= 999 then
			Say("B�n v�n ch�a trang tr� xong c�y th�ng, qu� gi�ng sinh nh�n ���c l� <color=yellow>"..floor(nExp*nNum/STREW_TREE_TOTAL).." <color> kinh nghi�m, c�y th�ng s� bi�n m�t. B�n ch�p nh�n qu� cu�i c�ng?",
				2,
				"��ng �/get_middle_award",
				"Ta ch�n sai r�i!/main");
		else
			Say("B�n v�n ch�a trang tr� xong c�y th�ng, qu� ng�u nhi�n nh�n ���c l�"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (c�p) Linh Th�ch"..tChrimsLingshi[11][3].." , c�y th�ng s� bi�n m�t. B�n ch�p nh�n?",
				2,
				"��ng �/confirm_get_award",
				"Ta ch�n sai r�i!/main");
		end			
	elseif nNum >= STREW_TREE_TOTAL then
		if nLv == 999 then
			Say("C�y th�ng n�y r�t ho�n m�, qu� gi�ng sinh ng�u nhi�n nh�n ���c l�"..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (c�p) Linh Th�ch"..tChrimsLingshi[13][3].." , 1 tu�n l�c gi�ng sinh, 1 ngo�i trang v� V� L�m B�o �i�n, nh�n xong c�y th�ng s� bi�n m�t. Sao h�?",
				2,
				"��ng �/get_last_award",
				"Ta ch�n sai r�i!/main");
		else  --�����Ϊ����
			Say("C�y th�ng n�y �� ho�n m�, qu� gi�ng sinh nh�n ���c <color=yellow>"..nExp.." <color>kinh nghi�m, "..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (c�p) Linh Th�ch"..tChrimsLingshi[13][3].." ng�u nhi�n, 1 tu�n l�c gi�ng sinh, 1 ngo�i trang V� L�m B�o �i�n, sau khi nh�n c�y th�ng s� bi�n m�t. B�n ch�p nh�n m�n qu� cu�i c�ng n�y?",
				2,
				"��ng �/get_last_award",
				"Ta ch�n sai r�i!/main");
		end			
	end		
end

function confirm_get_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --��ֹ����������ս�����������
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --��ʼ��TASK_PLANT_NUM������ʽ
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --�����ֵ�2��
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --��ȡ�������˵ڼ�����
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		if nLv ~= 999 then	
			for i = 1,tChrimsLingshi[11][3] do
				local nRand = random(tChrimsLingshi[11][1],tChrimsLingshi[11][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end
		else
			for i = 1,tChrimsLingshi[12][3] do
				local nRand = random(tChrimsLingshi[12][1],tChrimsLingshi[12][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end
		end			
	else
		Talk(1,"","B�n kh�ng c� c�y th�ng.");
	end
end	

function get_last_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nBody = GetBody();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --��ֹ����������ս�����������
		return
	end	
	if Zgc_pub_goods_add_chk(4,4) ~= 1 then
		return
	end	
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nLsNum = tChrimsLingshi[13][3];
	local nRandom = random(1,100);
	if nRandom <= 5 then
		nExp = nExp*2;
		nLsNum = nLsNum*2;
	end
	if nLv ~= 999 then
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --��ʼ��TASK_PLANT_NUM������ʽ
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --�����ֵ�2��
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --��ȡ�������˵ڼ�����
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			ModifyExp(nExp);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.." �i�m kinh nghi�m!");
			for i = 1,nLsNum do
				local nRand = random(1,1000);
				local nLsLv = 0;
				if nRand <= 895 then
					nLsLv = 5;
				elseif nRand <= 995 then
					nLsLv = 6;
				else
					nLsLv = 7;
				end
				lspf_AddLingShiInBottle(nLsLv,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nLsLv.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end				
			if nRandom <= 5 then
				Msg2Global("Ng��i ch�i"..GetName().."Ch�c m�ng b�n �� nh�n ���c X�ng hi�u ng�i sao gi�ng sinh"..nExp.." �i�m kinh nghi�m v� 4 Linh th�ch c�p 1-7!");
			end
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --ʥ��¹
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --������Ʒ����ʱ�䣬��λ��s
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1tu�n l�c gi�ng sinh ");
			else
				WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."Nh�n tu�n l�c gi�ng sinh th�t b�i, v� tr� th�t b�i:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c 1 V� L�m B�o �i�n");
					Msg2Global("Ng��i ch�i"..GetName().."Trong ho�t ��ng gi�ng sinh, trang tr� c�y th�ng tuy�t ��p. Nh�n ���c 1 V� L�m B�o �i�n. Xin ch�c m�ng!");
				else		
					WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."Nh�n V� L�m B�o �i�n th�t b�i, v� tr� th�t b�i:"..add_flag2);
				end
			end				
		else
			Talk(1,"","B�n kh�ng c� c�y th�ng.");
		end
	else
		if Zgc_pub_goods_add_chk(4,4) ~= 1 then
			return
		end		
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --��ʼ��TASK_PLANT_NUM������ʽ
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --�����ֵ�2��
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --��ȡ�������˵ڼ�����
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			for i = 1,nLsNum do
				local nRand = random(tChrimsLingshi[13][1],tChrimsLingshi[13][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			end					
			if nRandom <= 5 then
				Msg2Global("Ng��i ch�i"..GetName().."Trang s�c c�y gi�ng sinh ��p qu�, ch�c m�ng anh ta nh�n ���c danh hi�u Ng�i sao gi�ng sinh v� 4 vi�n Linh th�ch c�p 5-7!");
			end	
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --ʥ��¹
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --������Ʒ����ʱ�䣬��λ��s
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1tu�n l�c gi�ng sinh ");
			else
				WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."Nh�n tu�n l�c gi�ng sinh th�t b�i, v� tr� th�t b�i:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c 1 V� L�m B�o �i�n");
					Msg2Global("Ng��i ch�i"..GetName().."Trong ho�t ��ng gi�ng sinh, trang tr� c�y th�ng tuy�t ��p. Nh�n ���c 1 V� L�m B�o �i�n. Xin ch�c m�ng!");
				else		
					WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."Nh�n V� L�m B�o �i�n th�t b�i, v� tr� th�t b�i:"..add_flag2);
				end
			end	
		else
			Talk(1,"","B�n kh�ng c� c�y th�ng.");
		end
	end	
end
function get_middle_award()
  local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nGiveExp = floor(nExp*nNum/STREW_TREE_TOTAL);
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --��ֹ����������ս�����������
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --��ʼ��TASK_PLANT_NUM������ʽ
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --�����ֵ�2��
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --��ȡ�������˵ڼ�����
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		ModifyExp(nGiveExp);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..nGiveExp.."Kinh nghi�m");	
	else
		Talk(1,"","B�n kh�ng c� c�y th�ng.");
	end					
end
