--������������װ�������ű�
--by vivi
--08/14/2007

--ǰ�ڽ���������غ������������Ϊ�߻��ĵ��ж�Ӧ���
--ñ�ӡ����ӡ��·���give_zb_award(nId)
--���Σ�give_ss_award(nId)
--������give_wp_award(nId)
--���նһ����������ô����������final_award()

--�������
TASK_GET_AWARD = 2037; --��¼��ȡ�����ɹ����ı�־��1��ʾ�ɹ���0��ʾʧ��

--ǰ��װ������table ���� �·� ñ��
tZbAward = {
	[26]={[1]={"Ch� Tr�n Trang",0,101,2600},
				[2]={"Ch� Tr�n Trang",0,101,2601},
				[3]={"Ch� Tr�n Trang",0,101,2602},
				[4]={"Ch� Tr�n Trang",0,101,2603}},
	[34]={[1]={"Th�a �nh Y",0,100,2604},
				[2]={"Th�a �nh Y",0,100,2605},
				[3]={"Th�a �nh Y",0,100,2606},
				[4]={"Th�a �nh Y",0,100,2607}},
	[44]={[1]={"Khinh V�n Th�c",0,103,2608},
				[2]={"Khinh V�n Th�c",0,103,2609},
				[3]={"Khinh V�n Th�c",0,103,2610},
				[4]={"Khinh V�n Th�c",0,103,2611}}  
	}	

--ǰ�����ν���
tSsAward = {
	[59]={"��ng Giao B�ch",0,102,2612},
	[64]={"Kh�i Ph��ng Ng�c",0,102,2613}
}

--װ����ţ���Ӧ����������������Ϊ�������
tZbId = {26,34,44,59,64,11,49}

--ǰ���������� ��Ӧ�������Ϊ11	
tWqAwardOne = {
	[2]={"Ph� Phong �ao",0,3,2510},
	[3]={"Ph�n Phong Tr��ng",0,8,2510},
	[4]={"T�t Phong Th�",0,0,2510},
	[6]={"�n Phong Ch�m",0,1,2510},
	[8]={"H�i Phong Ki�m",0,2,2510},
	[9]={"U�n Phong C�m",0,10,2510},
	[11]={"Li�t Phong Th�",0,0,2511},
	[12]={"Ph�n Phong C�n",0,5,2510},
	[14]={"L�u Phong Ki�m",0,2,2511},
	[15]={"Ti�t Phong B�t",0,9,2510},
	[17]={"�o�n Phong Th��ng",0,6,2510},
	[18]={"T�p Phong Cung",0,4,2510},
	[20]={"Minh Phong Nh�n",0,7,2510},
	[21]={"D�c Phong Tr�o",0,11,2510}
	}

--С��random��	
tRanAwardOne = {
	[1]={"Ph� Phong �ao",0,3,2510},
	[2]={"Ph�n Phong Tr��ng",0,8,2510},
	[3]={"T�t Phong Th�",0,0,2510},
	[4]={"�n Phong Ch�m",0,1,2510},
	[5]={"H�i Phong Ki�m",0,2,2510},
	[6]={"U�n Phong C�m",0,10,2510},
	[7]={"Li�t Phong Th�",0,0,2511},
	[8]={"Ph�n Phong C�n",0,5,2510},
	[9]={"L�u Phong Ki�m",0,2,2511},
	[10]={"Ti�t Phong B�t",0,9,2510},
	[11]={"�o�n Phong Th��ng",0,6,2510},
	[12]={"T�p Phong Cung",0,4,2510},
	[13]={"Minh Phong Nh�n",0,7,2510},
	[14]={"D�c Phong Tr�o",0,11,2510}
	}

--ǰ���������� ��Ӧ�������Ϊ49	
tWqAwardTwo = {
	[2]={"��ng Tinh �ao",0,3,2520},
	[3]={"Lam Tinh Tr��ng",0,8,2520},
	[4]={"Ch�n Tinh Th�",0,0,2520},
	[6]={"H�p Tinh Ch�m",0,1,2520},
	[8]={"T� Tinh Ki�m",0,2,2520},
	[9]={"Th�i Tinh C�m",0,10,2520},
	[11]={"Ti�u Tinh Th�",0,0,2521},
	[12]={"Bi�n Tinh C�n",0,5,2520},
	[14]={"Phi Tinh Ki�m",0,2,2521},
	[15]={"Chuy�n Tinh B�t",0,9,2520},
	[17]={"��nh Tinh Th��ng",0,6,2520},
	[18]={"T��ng Tinh Cung",0,4,2520},
	[20]={"Ma Tinh Nh�n",0,7,2520},
	[21]={"H�i Tinh Tr�o",0,11,2520}}

--С��random��
tRanAwardTwo = {
	[1]={"��ng Tinh �ao",0,3,2520},
	[2]={"Lam Tinh Tr��ng",0,8,2520},
	[3]={"Ch�n Tinh Th�",0,0,2520},
	[4]={"H�p Tinh Ch�m",0,1,2520},
	[5]={"T� Tinh Ki�m",0,2,2520},
	[6]={"Th�i Tinh C�m",0,10,2520},
	[7]={"Ti�u Tinh Th�",0,0,2521},
	[8]={"Bi�n Tinh C�n",0,5,2520},
	[9]={"Phi Tinh Ki�m",0,2,2521},
	[10]={"Chuy�n Tinh B�t",0,9,2520},
	[11]={"��nh Tinh Th��ng",0,6,2520},
	[12]={"T��ng Tinh Cung",0,4,2520},
	[13]={"Ma Tinh Nh�n",0,7,2520},
	[14]={"H�i Tinh Tr�o",0,11,2520}}

--����װ��������ñ�ӣ����ӣ��·�
tFinalZb = {
	[2]={[1]={"Tuy�t V�n",0,103,2615},
			 [2]={"Tuy�t V�n",0,103,2616},
			 [3]={"Tuy�t V�n",0,103,2617},
			 [4]={"Tuy�t V�n",0,103,2618}},
	[3]={[1]={"Ph� Dao",0,101,2619},
			 [2]={"Ph� Dao",0,101,2620},
			 [3]={"Ph� Dao",0,101,2621},
			 [4]={"Ph� Dao",0,101,2622}},
	[4]={[1]={"Ng� Phong",0,100,2623},
			 [2]={"Ng� Phong",0,100,2624},
			 [3]={"Ng� Phong",0,100,2625},
			 [4]={"Ng� Phong",0,100,2626}}	
	}
	
--ñ�ӿ�������һ�������� ���Եȼ� ħ��id
tMzAttriOne = {
	[2]={"Ph�t huy t�c �� 15%",2,276},
	[3]={"Sinh m�nh t�i �a 12%",4,253}
	}

--�·�����һ
tYfAttriOne = {
	{"Ngo�i ph�ng gi�m 7%, ngo�i c�ng t�ng 14%",3,294},
	{"N�i ph�ng gi�m 7%, n�i c�ng t�ng 14%",3,442},
	{"S�t th��ng +80",6,331}
	}

--װ�����Զ���ñ�ӿ����·���
tAttriTwo = {
	{"S�c m�nh 25 �i�m",5,246},
	{"Linh ho�t 25 �i�m",5,248},
	{"Th�n ph�p 25 �i�m",5,247},
	{"N�i c�ng 25 �i�m",5,249},
	{"G�n c�t 25 �i�m",5,245}
	}	
	
--�������ν���
tFinalSs = {"Hoan L�ng B�o Ng�c",0,102,2614}

--�������� ����һ�� �ȼ� id ���Զ��� �ȼ� id
tSsAttri = {
	{"S�c m�nh 30 �i�m",6,246,"T�t c� thu�c t�nh t�ng 15 �i�m",3,329},
	{"Linh ho�t 30 �i�m",6,248,"T�t c� thu�c t�nh t�ng 15 �i�m",3,329},
	{"Th�n ph�p 30 �i�m",6,247,"T�t c� thu�c t�nh t�ng 15 �i�m",3,329},
	{"N�i c�ng 30 �i�m",6,249,"T�t c� thu�c t�nh t�ng 15 �i�m",3,329},
	{"G�n c�t 30 �i�m",6,245,"T�t c� thu�c t�nh t�ng 15 �i�m",3,329}
	}
	
--������������
tFinalWp = {
	[2]={"Ho�n �nh �ao",0,3,2530},
	[3]={"Lu�n �nh Tr��ng",0,8,2530},
	[4]={"Huy�n �nh Th�",0,0,2530},
	[6]={"Du �nh Ch�m",0,1,2530},
	[8]={"Linh �nh Ki�m",0,2,2530},
	[9]={"B�ch �nh C�m",0,10,2530},
	[11]={"B�n �nh Th�",0,0,2531},
	[12]={"Ph� �nh C�n",0,5,2530},
	[14]={"D�t �nh Ki�m",0,2,2531},
	[15]={"Phong �nh B�t",0,9,2530},
	[17]={"Ng� �nh Th��ng",0,6,2530},
	[18]={"H�ng �nh Cung",0,4,2530},
	[20]={"U �nh Nh�n",0,7,2530},
	[21]={"Th�c �nh Tr�o",0,11,2530}
	}


--��������random
tFinalRand = {
	[1]={"Ho�n �nh �ao",0,3,2530},
	[2]={"Lu�n �nh Tr��ng",0,8,2530},
	[3]={"Huy�n �nh Th�",0,0,2530},
	[4]={"Du �nh Ch�m",0,1,2530},
	[5]={"Linh �nh Ki�m",0,2,2530},
	[6]={"B�ch �nh C�m",0,10,2530},
	[7]={"B�n �nh Th�",0,0,2531},
	[8]={"Ph� �nh C�n",0,5,2530},
	[9]={"D�t �nh Ki�m",0,2,2531},
	[10]={"Phong �nh B�t",0,9,2530},
	[11]={"Ng� �nh Th��ng",0,6,2530},
	[12]={"H�ng �nh Cung",0,4,2530},
	[13]={"U �nh Nh�n",0,7,2530},
	[14]={"Th�c �nh Tr�o",0,11,2530}
	}

--��������һ
tWpAttriOne = {
	{"Ngo�i c�ng 8%",4,85},
	{"N�i c�ng 8%",4,86},
	{"S�t th��ng+100",2,268}
	}

--�������Զ�
tWpAttriTwo = {
	{"S�c m�nh 25 �i�m",5,246},
	{"Linh ho�t 25 �i�m",5,248},
	{"Th�n ph�p 25 �i�m",5,247},
	{"N�i c�ng 25 �i�m",5,249},
	{"G�n c�t 25 �i�m",5,245}
	}
	
--����������
tWpAttriThree = {"T�t c� thu�c t�nh t�ng 5 �i�m",1,329}	
	
--ǰ�ڽ���װ�� ñ�ӡ����ӡ��·�
function give_zb_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	local sBody = GetBody();
	local add_flog = AddItem(tZbAward[nId][sBody][2],tZbAward[nId][sBody][3],tZbAward[nId][sBody][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Ch�c m�ng b�n �� nh�n ���c 1 "..tZbAward[nId][sBody][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("Nhi�m v� T�y B�c: Ng��i ch�i"..GetName().."Thu trang b� th�t b�i, k� hi�u th�t b�i:"..add_flog);
	end	
end	

--ǰ�ڽ���װ�� ����
function give_ss_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --�ռ为�ؼ��
		return
	end
	local add_flog = AddItem(tSsAward[nId][2],tSsAward[nId][3],tSsAward[nId][4],1,1,-1,-1,-1,-1,-1,-1);
	if add_flog == 1 then
		Msg2Player("Ch�c m�ng b�n �� nh�n ���c 1 "..tSsAward[nId][1]);
		SetTask(TASK_GET_AWARD,1);
	else
		WriteLog("Nhi�m v� T�y B�c: Ng��i ch�i"..GetName().."Thu trang s�c th�t b�i, k� hi�u th�t b�i:"..add_flog);
	end
end

--ǰ�ڽ���װ�� ����
function give_wp_award(nId)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Say("<color=green>Kh�u Chu�n<color>: Do b�n ch�a ch�n ���ng tu luy�n v� c�ng, n�n t�ng b�n m�t m�n v� kh� ng�u nhi�n, ��ng � ch�?",
			2,
			"��ng �/#confirm_wp_award("..nId..")",
			"Sau khi ta b�i s� s� ��n l�nh th��ng/nothing")
	else
		confirm_wp_award(nId);
	end
end

function confirm_wp_award(nId)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	local nRoute = GetPlayerRoute()
	local tAward = {};
	local tRand = {};
	if nId == tZbId[6] then
		tAward = tWqAwardOne;
		tRand = tRanAwardOne;
	elseif nId == tZbId[7] then
		tAward = tWqAwardTwo;
		tRand = tRanAwardTwo;
	end
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		local n = random(1,getn(tRand));
		local add_flog = AddItem(tRand[n][2],tRand[n][3],tRand[n][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
		 Msg2Player("Ch�c m�ng b�n �� nh�n ���c 1 "..tRand[n][1]);
		 SetTask(TASK_GET_AWARD,1);
		else
		 WriteLog("Nhi�m v� T�y B�c: Ng��i ch�i"..GetName().."Thu v� kh� th�t b�i, k� hi�u th�t b�i: "..add_flog);
		end
	else
		local add_flog = AddItem(tAward[nRoute][2],tAward[nRoute][3],tAward[nRoute][4],1,1,-1,-1,-1,-1,-1,-1);
		if add_flog == 1 then
			Msg2Player("Ch�c m�ng b�n �� nh�n ���c 1 "..tAward[nRoute][1]);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("Nhi�m v� T�y B�c: Ng��i ch�i"..GetName().."Thu v� kh� th�t b�i, k� hi�u th�t b�i: "..add_flog);
		end
	end 
end

--���ս����һ�����
function final_award()
	local strtab = {
		"Trang s�c/#confirm_choose(1)",
		"M�o/#confirm_choose(2)",
		"Qu�n /#confirm_choose(3)",
		"Y ph�c/#confirm_choose(4)",
		"V� kh�/#confirm_choose(5)",
		"Sau n�y ��i l�i/nothing"
		}
	Say("<color=green>Kh�u Chu�n<color>: H�y ch�n lo�i h�nh trang b� b�n mu�n ��i?",
		getn(strtab),
		strtab)	
end

function confirm_choose(nId)
	local tZb = {"Trang s�c","M�o","Qu�n ","Y ph�c","V� kh�"};
	local nRoute = GetPlayerRoute();
	if nId == 5 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			Say("<color=green>Kh�u Chu�n<color>: Do b�n ch�a ch�n ���ng tu luy�n v� c�ng, n�n t�ng b�n m�t m�n v� kh� ng�u nhi�n, ��ng � ch�?",
				2,
				"��ng �/#give_final_award("..nId..")",
				"Ta ch�n nh�m r�i, ch�n l�i/final_award");
		end
	end		
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n trang b� mu�n ��i l� "..tZb[nId]..". ��i ch�?",
		2,
		"��ng �/#give_final_award("..nId..")",
		"Ta ch�n nh�m r�i, ch�n l�i/final_award");
end

function give_final_award(nId)
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--��ȡ���ڽ���������id����ʼΪ��·�߽���������id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	local nPosOne = 0; --��¼����i��λ��
	local nPosTwo = 0; --��¼����j��λ��
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--���û��·�ߣ�������ȡ�������������
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				nPosOne = i;
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				nPosTwo = j;
				break
			end
		end
	end
	local sDia = "";			
	--�������϶�����������̯�����ϣ�����ʾ
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then 
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then 
			sDia = sDia..tRanAwardOne[nPosOne][1].."\n";
		else
			sDia = sDia..tWqAwardOne[nRoute][1].."\n";
		end
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
			sDia = sDia..tRanAwardTwo[nPosTwo][1].."\n";
		else
			sDia = sDia..tWqAwardTwo[nRoute][1].."\n";
		end
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[1]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1	then
		sDia = sDia..tZbAward[tZbId[2]][sBody][1].."\n";
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		sDia = sDia..tZbAward[tZbId[3]][sBody][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[4]][1].."\n";
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1 then
		sDia = sDia..tSsAward[tZbId[5]][1];
	end
	
	if (GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 0 and BigGetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1) or (GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 0 and BigGetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1) or
	(GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1) or (GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1) or
	(GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 0 and BigGetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1) or (GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4])	== 1) or
	(GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 0 and BigGetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4])	== 1) then
		Talk(1,"","<color=green>Kh�u Chu�n<color>: B�n c�n c�c trang b� sau ��t trong r��ng ch�a �� ho�c giao di�n b�y b�n, h�y �� n� v�o trong h�nh trang.<color=yellow>"..sDia.."<color>");
	else
		if nId == 1 then --����
			local strtab = {};
			for i=1,getn(tSsAttri) do
				tinsert(strtab,tSsAttri[i][1].."/#confirm_shoushi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
			Say("<color=green>Kh�u Chu�n<color>: H�y ch�n thu�c t�nh d�ng 1 c�a trang s�c hi�n t�i",
					getn(strtab),
					strtab);
		elseif nId == 2 then --ñ��
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_maozi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
			Say("<color=green>Kh�u Chu�n<color>: Thu�c t�nh d�ng 1 xu�t hi�n tr�n n�n<color=yellow>: "..tMzAttriOne[2][1].."<color>. Xin ch�n thu�c t�nh th� hai c�a n�n",
				getn(strtab),
				strtab);
		elseif nId == 3 then --����
			local strtab = {};
			for i=1,getn(tAttriTwo) do
				tinsert(strtab,tAttriTwo[i][1].."/#confirm_kuzi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
			Say("<color=green>Kh�u Chu�n<color>: Thu�c t�nh d�ng 1 xu�t hi�n tr�n qu�n<color=yellow>: "..tMzAttriOne[3][1].."<color>. Xin ch�n thu�c t�nh th� hai c�a h� y",
				getn(strtab),
				strtab);		
		elseif nId == 4 then --�·�
			local strtab = {};
			for i=1,getn(tYfAttriOne) do
				tinsert(strtab,tYfAttriOne[i][1].."/#confirm_yifu("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
			Say("<color=green>Kh�u Chu�n<color>: H�y ch�n thu�c t�nh d�ng 1 xu�t hi�n tr�n �o",
				getn(strtab),
				strtab);
		elseif nId == 5 then --����
			local strtab = {};
			for i=1,getn(tWpAttriOne) do
				tinsert(strtab,tWpAttriOne[i][1].."/#confirm_wuqi("..nId..","..i..")");
			end
				tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
			Say("<color=green>Kh�u Chu�n<color>: H�y ch�n thu�c t�nh d�ng 1 xu�t hi�n tr�n �o",
				getn(strtab),
				strtab);			
		end	
	end	
end

function confirm_shoushi(nId,nOne)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 1 xu�t hi�n tr�n trang s�c<color=yellow>: "..tSsAttri[nOne][1].."<color>, thu�c t�nh c� ��nh th� hai l�: <color=yellow>"..tSsAttri[nOne][4].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#confirm_final("..nId..","..nOne..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/give_final_award("..nId..")"
		)	
end

function confirm_maozi(nId,nOne)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n n�n<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#confirm_final("..nId..","..nOne..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/give_final_award("..nId..")"
		)
end

function confirm_kuzi(nId,nOne)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n qu�n<color=yellow>: "..tAttriTwo[nOne][1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#confirm_final("..nId..","..nOne..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/give_final_award("..nId..")"
		)
end


function confirm_yifu(nId,nOne)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 1 xu�t hi�n tr�n �o<color=yellow>: "..tYfAttriOne[nOne][1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#choose_yifu_two("..nId..","..nOne..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/give_final_award("..nId..")"
		);
end

function choose_yifu_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tAttriTwo) do
		tinsert(strtab,tAttriTwo[i][1].."/#confirm_yifu_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
	Say("<color=green>Kh�u Chu�n<color>: H�y ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n �o",
		getn(strtab),
		strtab);	
end

function confirm_yifu_two(nId,nOne,nTwo)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n �o<color=yellow>: "..tAttriTwo[nTwo][1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/choose_yifu_two("..nId..","..nOne..")"
		);	
end

function confirm_wuqi(nId,nOne)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 1 xu�t hi�n tr�n v� kh�<color=yellow>: "..tWpAttriOne[nOne][1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#choose_wuqi_two("..nId..","..nOne..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/give_final_award("..nId..")"
		);	
end

function choose_wuqi_two(nId,nOne)
	local strtab = {};
	for i=1,getn(tWpAttriTwo) do
		tinsert(strtab,tWpAttriTwo[i][1].."/#confirm_wuqi_two("..nId..","..nOne..","..i..")");
	end
		tinsert(strtab,"Hay l� th�i, t�m th�i kh�ng ��i/nothing");
	Say("<color=green>Kh�u Chu�n<color>: H�y ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n v� kh�",
		getn(strtab),
		strtab);	
end

function confirm_wuqi_two(nId,nOne,nTwo)
	Say("<color=green>Kh�u Chu�n<color>: B�n ch�n thu�c t�nh d�ng 2 xu�t hi�n tr�n v� kh�<color=yellow>: "..tWpAttriTwo[nTwo][1].."<color>, thu�c t�nh c� ��nh th� ba l�: <color=yellow>"..tWpAttriThree[1].."<color>, x�c ��nh ch�a?",
		2,
		"��ng �/#confirm_final("..nId..","..nOne..","..nTwo..")",
		"Ch�n sai r�i, ta mu�n ch�n l�i/choose_wuqi_two("..nId..","..nOne..")"
		);	
end

function confirm_final(nId,nOne,nTwo)
	if Zgc_pub_goods_add_chk(1,60) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	local sBody = GetBody();
	local nRoute = GetPlayerRoute();
	--��ȡ���ڽ���������id����ʼΪ��·�߽���������id
	local nWpOneGenre = 0;
	local nWpOneDetail = 0;
	local nWpOneParticular = 0;
	local nWpTwoGenre = 0;
	local nWpTwoDetail = 0;
	local nWpTwoParticular = 0;
	if nRoute ~= 0 and nRoute ~= 1 and nRoute ~= 5 and nRoute ~= 7 and nRoute ~= 10 and nRoute ~= 13 and nRoute ~= 16 and nRoute ~= 19 then
		nWpOneGenre = tWqAwardOne[nRoute][2];
		nWpOneDetail = tWqAwardOne[nRoute][3];
		nWpOneParticular = tWqAwardOne[nRoute][4];
		nWpTwoGenre = tWqAwardTwo[nRoute][2];
		nWpTwoDetail = tWqAwardTwo[nRoute][3];
		nWpTwoParticular = tWqAwardTwo[nRoute][4];	
	end
	--���û��·�ߣ�������ȡ�������������
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		for i=1,14 do
			if GetItemCount(tRanAwardOne[i][2],tRanAwardOne[i][3],tRanAwardOne[i][4]) == 1 then
				nWpOneGenre = tRanAwardOne[i][2];
				nWpOneDetail = tRanAwardOne[i][3];
				nWpOneParticular = tRanAwardOne[i][4];
				break
			end
		end
		for j=1,14 do
			if GetItemCount(tRanAwardTwo[j][2],tRanAwardTwo[j][3],tRanAwardTwo[j][4]) == 1 then
				nWpTwoGenre = tRanAwardTwo[j][2];
				nWpTwoDetail = tRanAwardTwo[j][3];
				nWpTwoParticular = tRanAwardTwo[j][4];
				break
			end
		end
	end	
	if GetItemCount(nWpOneGenre,nWpOneDetail,nWpOneParticular) == 1 then
		DelItem(nWpOneGenre,nWpOneDetail,nWpOneParticular,1);
	end
	if GetItemCount(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular) == 1 then
		DelItem(nWpTwoGenre,nWpTwoDetail,nWpTwoParticular,1);
	end
	if GetItemCount(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[1]][sBody][2],tZbAward[tZbId[1]][sBody][3],tZbAward[tZbId[1]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[2]][sBody][2],tZbAward[tZbId[2]][sBody][3],tZbAward[tZbId[2]][sBody][4],1);
	end
	if GetItemCount(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4]) == 1 then
		DelItem(tZbAward[tZbId[3]][sBody][2],tZbAward[tZbId[3]][sBody][3],tZbAward[tZbId[3]][sBody][4],1);
	end
	if GetItemCount(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4]) == 1 then
		DelItem(tSsAward[tZbId[4]][2],tSsAward[tZbId[4]][3],tSsAward[tZbId[4]][4],1);
	end
	if GetItemCount(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4]) == 1 then
		DelItem(tSsAward[tZbId[5]][2],tSsAward[tZbId[5]][3],tSsAward[tZbId[5]][4],1);
	end			
		local add_flog = 0;
		local sName = "";
		if nId == 1 then --����
			add_flog = AddItem(tFinalSs[2],tFinalSs[3],tFinalSs[4],1,1,tSsAttri[nOne][2],tSsAttri[nOne][3],tSsAttri[nOne][5],tSsAttri[nOne][6]);
			sName = tFinalSs[1];
		elseif nId == 2 then --ñ��
			add_flog = AddItem(tFinalZb[2][sBody][2],tFinalZb[2][sBody][3],tFinalZb[2][sBody][4],1,1,tMzAttriOne[2][2],tMzAttriOne[2][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[2][sBody][1];
		elseif nId == 3 then --����
			add_flog = AddItem(tFinalZb[3][sBody][2],tFinalZb[3][sBody][3],tFinalZb[3][sBody][4],1,1,tMzAttriOne[3][2],tMzAttriOne[3][3],tAttriTwo[nOne][2],tAttriTwo[nOne][3]);
			sName = tFinalZb[3][sBody][1];
		elseif nId == 4 then --�·�
			add_flog = AddItem(tFinalZb[4][sBody][2],tFinalZb[4][sBody][3],tFinalZb[4][sBody][4],1,1,tYfAttriOne[nOne][2],tYfAttriOne[nOne][3],tAttriTwo[nTwo][2],tAttriTwo[nTwo][3]);
			sName = tFinalZb[4][sBody][1];
		elseif nId == 5 then --����
			if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
				local n = random(1,getn(tFinalRand));
				add_flog = AddItem(tFinalRand[n][2],tFinalRand[n][3],tFinalRand[n][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalRand[n][1];
			else
				add_flog = AddItem(tFinalWp[nRoute][2],tFinalWp[nRoute][3],tFinalWp[nRoute][4],1,1,tWpAttriOne[nOne][2],tWpAttriOne[nOne][3],tWpAttriTwo[nTwo][2],tWpAttriTwo[nTwo][3],tWpAttriThree[2],tWpAttriThree[3]);
				sName = tFinalWp[nRoute][1];
			end 
		end
		if add_flog == 1 then
			Msg2Player("Ch�c m�ng b�n, �� ��i th�nh c�ng"..sName);
			SetTask(TASK_GET_AWARD,1);
		else
			WriteLog("Nhi�m v� T�y B�c: Ng��i ch�i"..GetName().."Thu trang b� sau c�ng th�t b�i, log: "..add_flog);
		end 
end

function nothing()

end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end