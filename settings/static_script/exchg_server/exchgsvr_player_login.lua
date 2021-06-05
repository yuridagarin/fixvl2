Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")

_,AT_GGS = GetRealmType();
if 1==AT_GGS then
	Include("\\script\\paycoin_head.lua")
end	

--==========================================================================================
tAllowItemList = {
	{0,103,-1, "Trang b� ��u"},  --ͷ��װ��
	{0,108,-1, "Trang b� ��u"},	 --ͷ��װ��
	{0,100,-1, "Trang b� tr�n"},
	{0,109,-1, "Trang b� tr�n"},
	{0,101,-1, "Trang b� d��i"},
	{0,110,-1, "Trang b� d��i"},
	{0,102,-1, "Gi�i ch�"},
	{0,{0,14},-1, "V� kh�"}, --����????
	{0,105,-1, "M�"},
	{0,107,-1, "M�t t�ch"},
	{0,112,-1, "M�t t�ch"},
	{2,15,10, "T�n"},
	{2,3,7, "X� L�i Kim ��n"}, --������
	{2,3,6}, --����
	{2,3,222, "Tinh Luy�n Huy�n Thi�t"},
	{2,97,6, "Thi�n H��ng Hoa"},
	{2,97,7, "Thanh L��ng Th�o"},
	{2,97,8, "Tri�u Thi�n Ti�u"},
	{2,97,9, "Qu� Hoa Ng�"},
	{2,97,10, "H�ng S�n Qu�"},
	{2,20,-1, "�i�u"},
	{2,0,1063, "Th�n M�c V��ng ��nh"},
	{2,3,4, "Ph� Ma Ch�"},
	{2,3,12, "Thi�n Ph�t Ch�u"},
--	{0,113,-1, "����"},
--	{0,114,-1, "����"},
--	{0,115,-1, "����"},
--	{0,116,-1, "����"},
	{2,11,-1, "�m kh�"},
	{0,118,1},
	{0,118,2},
	{0,118,3},
	{0,117,1},
	{0,117,2},
	{0,117,3},
	{0,119,-1},
	{0,120,-1},
	{0,121,-1},
	{0,122,-1},
	
	{0,152,-1, "�o Cho�ng"},
	{0,153,-1, "Huy Hi�u"},
	{0,154,-1, "Gi�y"},
	{2,97,236, "Thi�n Ki�u L�nh"},
};

--������Ʒ�嵥
--�������ɸ��裬��3��Ϊ���ɣ�0Ϊ��������
tGiveItemList = {
	{{1,0,125,999},"Ti�u Dao B�ch V�n T�n",0},
	{{1,0,126,999},"Ti�u Dao V�n C�m T�c",0},
	{{1,0,127,999},"Ti�u Dao �o�n T�c Cao",0},
	{{1,0,128,999},"Ti�u Dao ��i Ho�n ��n",0},
	{{1,0,129,999},"Ti�u Dao Ph�c Th�y ��n",0},
	{{1,0,130,999},"Ti�u Dao Quy Nguy�n ��n",0},
	{{1,0,131,999},"Ti�u Dao Ng�c Linh T�n",0},
	{{1,0,132,999},"Ti�u Dao Ng�c L� Ho�n",0},
	{{1,0,133,999},"Ti�u Dao T�o H�a T�n",0},
	{{1,0,134,999},"Ti�u Dao C�u Chuy�n ��n",0},
	{{1,7,46,999},"Ti�u Dao Ph� (H�a K� L�n)",20},
	{{1,7,154,999},"Ti�u Dao Ph� (Li�t Nham Li Long)",20},
	{{1,7,148,999},"Ti�u Dao Ph� (Th��ng Th�n Doanh Thi�n)",20},
	{{1,7,147,999},"Ti�u Dao Ph� (B�c L�c L�m Minh Ch�)",20},
	{{1,7,10000,999},"Ti�u Dao Ph� (Ng�u nhi�n)",20},
	{{2,0,1063,1}, "Th�n M�c V��ng ��nh",21},
};

function exchgsvr_on_player_login()
	local nVersion,nCurGs = GetRealmType();
	--print("exchgsvr_on_player_login:",nVersion,nCurGs)
	_exchgsvr_reset_player_state(nCurGs)
	_exchgsvr_item_filter(nCurGs)
	exgsvr_func_on_player_login()--ͬ���������
	_exchgsvr_do_things()  --��ͬʱ�������֮����һЩ��������
end

function Del_Item_By_List()
	local tAllItem = GetAllItem(); --�������������Ʒ�������ֿ⣩����
	local nID1,nID2,nID3 = 0,0,0;
	local nCount = 0;
	for i,v in tAllItem do
		nID1,nID2,nID3 = GetItemInfoByIndex(v);
		nCount = BigGetItemCount(nID1,nID2,nID3);
		if nCount ~= 0 then
			local nCheckItem = Check_Item_By_List(nID1,nID2,nID3);
			if nCheckItem == 0 then
				BigDelItem(nID1,nID2,nID3,nCount);
			end
		end
		Check_SuohunEquip(v); --�����������
	end
	for i = 0,16 do --���ŵ�����
		local nEquipIdx = GetPlayerEquipIndex(i);
		Check_SuohunEquip(nEquipIdx);
	end
end

function Check_Item_By_List(nID1,nID2,nID3)
	local tID = {nID1,nID2,nID3};
	for i = 1,getn(tAllowItemList) do
		local nCheck = 0;
		for j = 1,3 do
			if tAllowItemList[i][j] ~= -1 then
				if type(tAllowItemList[i][j]) == "table" then
					if tAllowItemList[i][j][1] > tID[j] or tAllowItemList[i][j][2] < tID[j] then
						nCheck = 1;
						break;
					end
				elseif tAllowItemList[i][j] ~= tID[j] then
					nCheck = 1;
					break;
				end
			end
		end
		if nCheck == 0 then --ƥ��
			return 1;
		end
	end
	return 0;
end

function Add_Item_By_List()
	local nRoute = GetPlayerRoute();
	for i = 1,getn(tGiveItemList) do
		if gf_Judge_Room_Weight(1,100) == 1 and GetItemCount(tGiveItemList[i][1][1], tGiveItemList[i][1][2], tGiveItemList[i][1][3]) == 0 then
			if tGiveItemList[i][3] == 0 then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			elseif nRoute == tGiveItemList[i][3] then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			end
		end
	end
end

function _exchgsvr_reset_player_state(bAtExchgServer)
	if 1 == bAtExchgServer then
		SetFightState(0);
		--ForbidChangePK(1);
		ForbitTrade(1);	--��ֹ����
		StallEnable(0);	--��ֹ��̯
	else
		
	end
end

function _exchgsvr_item_filter(bAtExchgServer)
	if 1 == bAtExchgServer then
		Del_Item_By_List()
		Add_Item_By_List()
	else
		
	end
end

function Check_SuohunEquip(nEquipIdx)
	local nCheck = 0;
	local nOwnName = GetItemOwner(nEquipIdx);
	local nPlayerName = GetName();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local strGbGroup,strName = _kf_GetRealmName(GetName());
		nPlayerName = strName;
	end
	if nOwnName ~= "" and nOwnName ~= nPlayerName then
		DelItemByIndex(nEquipIdx,-1);
		nCheck = nCheck+1;
	end
	if nCheck ~= 0 then
		Talk(1,"","Kh�ng ph�i trang b� T�a H�n kh�ng th� mang v�o ��u tr��ng! Trang b� T�a H�n c�a ng��i �� b� h�y b� (quay v� server c� s� t� kh�i ph�c).");
	end
end

function _exchgsvr_do_things()
	local nVersion,nCurGs = GetRealmType();
	--print("exchgsvr_on_player_login:",nVersion,nCurGs)
	if nCurGs == 0 and GetTask(TASKID_EXCHG_SVR_TAG) ~= 0 then
		SetTask(TASKID_EXCHG_SVR_TAG, 0, TASK_ACCESS_CODE_EXGSVR);
		SetTask(TASKID_EXCHG_SVR_TIME, GetTime(), TASK_ACCESS_CODE_EXGSVR);
	end
	if nCurGs == 1 and GetTask(TASKID_EXCHG_SVR_TAG) ~= 0 then
		pc_pay_addtask(1000);
	end
end



