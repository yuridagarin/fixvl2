--File name:	muchai.lua
--Describe:		ľ����߽ű�
--Item ID:		2,1,30022
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."L� n��ng b�nh Trung Thu"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���

g_VietMoonCake08End = 2008100600				--ľ���ʹ�ý�ֹ����

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_VietMoonCake08End then
		return
	end
	
	if GetTime() - GetTask(FIRE_TIME_08_MOONCAKE_VIET) < g_nTime_MoonCakeViet then
		return
	end

	local selTab = {
				"N��ng 8 c�i B�nh trung thu lo�i th��ng/#make_mooncake(1)",
				"N��ng 8 c�i B�nh trung thu lo�i ��c bi�t/#make_mooncake(2)",
				"K�t th�c ��i tho�i/no",
				}
	Say("C�c h� mu�n n��ng lo�i B�nh trung thu n�o??",getn(selTab),selTab);
end

function make_mooncake(nType)
	if nType == 1 then
		if GetItemCount(2,1,30023) < 8 then
			Say("S� l��ng b�nh trung thu c�a ��i hi�p v�n ch�a ��, kh�ng th� ti�n h�nh n��ng b�nh.",0);
			return
		end
		if del_item_ex("B�nh ch�a n��ng lo�i th��ng",2,1,30023,8) == 1 and del_item_ex("C�i",2,1,30022,1) == 1 then
			SetTask(CAKE_TYPE_08_MOONCAKE_VIET, 1)
			create_burner()
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30024) < 8 then
			Say("S� l��ng b�nh trung thu c�a ��i hi�p v�n ch�a ��, kh�ng th� ti�n h�nh n��ng b�nh.",0);
			return
		end
		if del_item_ex("B�nh ch�a n��ng lo�i ��c bi�t",2,1,30024,8) == 1 and del_item_ex("C�i",2,1,30022,1) == 1 then
			SetTask(CAKE_TYPE_08_MOONCAKE_VIET, 2)
			create_burner()
		end
	end
end

function create_burner()
	local nNpcIdx = CreateNpc("L� n��ng b�nh", "L� n��ng b�nh Trung Thu", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\mooncake_08\\npc\\burner.lua")
	SetNpcLifeTime(nNpcIdx, g_nTime_MoonCakeViet)
	SetTask(FIRE_TIME_08_MOONCAKE_VIET, GetTime())
	SetTask(BURNER_IDX_08_MOONCAKE_VIET, nNpcIdx)
	SetTask(WOOD_NUM_08_MOONCAKE_VIET, 0)
	SetTask(OBTAIN_CAKE_08_MOONCAKE_VIET, 0)
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function no()
end
