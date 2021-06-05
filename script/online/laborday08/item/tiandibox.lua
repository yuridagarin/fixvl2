--������Ʊ���
--by vivi
--2008/04/14

tTiandiBox = {{"R��ng Thi�n ��a Huy�n Ho�ng Qu�n",2,0,1055},{"R��ng Thi�n ��a Huy�n Ho�ng Gi�p",2,0,1056},{"R��ng Thi�n ��a Huy�n Ho�ng Trang",2,0,1057},{"R��ng Thi�n ��a Huy�n Ho�ng v� kh�",2,0,1058}}

tTiandi = {
	{{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	{{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	{{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
	{[0]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [1]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [2]={{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [3]={{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [4]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [5]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [6]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [7]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [8]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [9]={{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [10]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [11]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [12]={{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [13]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [14]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [15]={{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [16]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [17]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111}},
	 [18]={{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [19]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [20]={{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [21]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15}}}
	};

function OnUse(nIndex)
	local nId1,nId2,nId3 = GetItemInfoByIndex(nIndex);
	local nTabIdx = 0;
	for i=1,getn(tTiandiBox) do
		if nId1 == tTiandiBox[i][2] and nId2 == tTiandiBox[i][3] and nId3 == tTiandiBox[i][4] then
			nTabIdx = i;
			break
		end
	end
	if nTabIdx == 0 then
		return 0;
	end
	if nTabIdx ~= 4 then
		Say("S� d�ng "..tTiandiBox[nTabIdx][1].."S� nh�n ���c trang b� Thi�n ��a Huy�n Ho�ng t��ng �ng, ��ng � d�ng ch�?",
			2,
			"���c/#choose_tiandi_lingqi("..nTabIdx..",0)",
			"Kh�ng c�n/nothing");
	else
		Say("S� d�ng "..tTiandiBox[nTabIdx][1].."S� nh�n ���c v� kh� Thi�n ��a Huy�n Ho�ng c�a l�u ph�i t��ng �ng, ��ng � d�ng ch�?",
			2,
			"���c/choose_tiandi_weapon",
			"Kh�ng c�n/nothing");
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("B�n mu�n ��i m�n v� kh� n�o?",
			3,
			"Thi�n ��a Huy�n Ho�ng Dao/#choose_tiandi_lingqi(4,1)",
			"Thi�n ��a Huy�n Ho�ng C�n/#choose_tiandi_lingqi(4,2)",
			"T�m th�i kh�ng ��i. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nTabIdx,nType)
	Say("H�y ch�n �i�m linh kh� c�a trang b� n�y.",
		3,
		"119 linh kh� [C�n Kh�m Ch�n C�n]/#confirm_give_tiandi("..nTabIdx..","..nType..",119)",
		"120 linh kh� [Kh�n �o�i Ly T�n]/#confirm_give_tiandi("..nTabIdx..","..nType..",120)",
		"T�m th�i kh�ng ��i. /nothing")
end

function confirm_give_tiandi(nTabIdx,nType,nLingqi)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then	
		return
	end
	if DelItem(tTiandiBox[nTabIdx][2],tTiandiBox[nTabIdx][3],tTiandiBox[nTabIdx][4],1) ==	1 then
		if nTabIdx ~= 4 then
			local nBody = GetBody();
			local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nBody][2],tTiandi[nTabIdx][nBody][3],tTiandi[nTabIdx][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tTiandi[nTabIdx][nBody][1]);
				WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c"..tTiandi[nTabIdx][nBody][1]);
			else
				WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c th�t b�i, v� tr� th�t b�i: "..add_flag);
			end
		else
			local nRoute = GetPlayerRoute();
			if nRoute == 2 then
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nType][2],tTiandi[nTabIdx][nRoute][nType][3],tTiandi[nTabIdx][nRoute][nType][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tTiandi[nTabIdx][nRoute][nType][1]);
					WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c"..tTiandi[nTabIdx][nRoute][nType][1]);
				else
					WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c th�t b�i, v� tr� th�t b�i: "..add_flag);
				end	
			else
				local nRand = random(1,getn(tTiandi[nTabIdx][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nRand][2],tTiandi[nTabIdx][nRoute][nRand][3],tTiandi[nTabIdx][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tTiandi[nTabIdx][nRoute][nRand][1]);
					WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c"..tTiandi[nTabIdx][nRoute][nRand][1]);
				else
					WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."S� d�ng "..tTiandiBox[nTabIdx][1].."Nh�n ���c th�t b�i, v� tr� th�t b�i: "..add_flag);
				end	
			end					
		end
	end
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