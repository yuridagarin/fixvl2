-- Created by TuanNA5

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

TOKEN_TASK_ID = 2428

tAward ={
	[5] = {"M�t T�ch T� Linh V� Song",{0,107,165,1},1,1},
	[6] = {"K� L�n Th�",{0,105,30000,1,1,-1,-1,-1,-1,-1,-1},1,100},
	[7] = {"Trang b� Vi�m ��",{0,100,8000,1,1,-1,-1,-1,-1,-1,-1,0,7},3,300},
	[8] = {"��nh H�n Thi�n Th�ch Th�n Th�ch",{2,1,1067,1},1,1},
	[9] = {"��i h�ng bao ho�ng kim",{2,1,539,30},1,1},
}

-- t�n ngo�i trang, G, D, P, s� l�n chuy�n sinh + lv mua ���c (do chuy�n sinh ti�p theo ko b� gi�i h�n lv mua n�n gh�p 2 s� th�nh 1)
t_translife_cloth = 
{
	[1] = {"V�n S� ngo�i trang",0,108,570,290},
	[2] = {"Thi�n �m ngo�i trang",0,108,562,390},
	[3] = {"Thi�u D��ng ngo�i trang",0,108,566,488},
	[4] = {"T� Linh Vi�t  ngo�i trang",0,108,30001,588},
}
-- t�n ngo�i trang, G, D, P, s� l�n chuy�n sinh + lv mua ���c (do chuy�n sinh ti�p theo ko b� gi�i h�n lv mua n�n gh�p 2 s� th�nh 1)
t_translife_cloth_cs6 = 
{
	[1] = {"V�n S� ngo�i trang",0,108,570,188, 288},
	[2] = {"Thi�n �m ngo�i trang",0,108,562,188, 288},
	[3] = {"Thi�u D��ng ngo�i trang",0,108,566,188, 288},
	[4] = {"T� Linh Ph�c Sinh ngo�i trang",0,108,30005,188, 288},	
	[5] = { --ph�c sinh 1
			[1] = {
					[1] = {{0,108,30005,1,4,5,639,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,5,639,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,5,639,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,5,639,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},
			[2] = {
					[1] = {{0,108,30005,1,4,6,302,6,102}, {0,109,30005,1,4,5,409,6,102}, {0,110,30005,1,4,5,79,5,80,6,102}},
					[2] = {{0,108,30006,1,4,6,302,6,102}, {0,109,30006,1,4,5,409,6,102}, {0,110,30006,1,4,5,79,5,80,6,102}},
					[3] = {{0,108,30007,1,4,6,302,6,102}, {0,109,30007,1,4,5,409,6,102}, {0,110,30007,1,4,5,79,5,80,6,102}},
					[4] = {{0,108,30008,1,4,6,302,6,102}, {0,109,30008,1,4,5,409,6,102}, {0,110,30008,1,4,5,79,5,80,6,102}},
				},
			[3] = {
					[1] = {{0,108,30005,1,4,2,13075,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,6,306,6,102}},
					[2] = {{0,108,30006,1,4,2,13075,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,6,306,6,102}},
					[3] = {{0,108,30007,1,4,2,13075,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,6,306,6,102}},
					[4] = {{0,108,30008,1,4,2,13075,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,6,306,6,102}},
				},
			[4] = {
					[1] = {{0,108,30005,1,4,5,27,6,102}, {0,109,30005,1,4,5,342,6,102}, {0,110,30005,1,4,4,292,4,293,6,102}},
					[2] = {{0,108,30006,1,4,5,27,6,102}, {0,109,30006,1,4,5,342,6,102}, {0,110,30006,1,4,4,292,4,293,6,102}},
					[3] = {{0,108,30007,1,4,5,27,6,102}, {0,109,30007,1,4,5,342,6,102}, {0,110,30007,1,4,4,292,4,293,6,102}},
					[4] = {{0,108,30008,1,4,5,27,6,102}, {0,109,30008,1,4,5,342,6,102}, {0,110,30008,1,4,4,292,4,293,6,102}},
				},
		},
	[6] = { --ph�c sinh 2
				[1] = {
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},
			[4] = {
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
				},
			[3] = {
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
				},											
			[2] = {
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
				},	
		},
}
t_translife_horse = 
{
	[1] = {"Ni�n Th�",{0, 105, 33, 1, 1, 3, 403}, 292, 1000000},
	[2] = {"B�ch H�", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 490, 10000000},
}
t_translife_horse_cs6 = 
{
	[1] = {"B�ch H�", {0, 105, 30009, 1, 4, -1, -1, -1, -1, -1, -1}, 190, 10000000},
	[2] = {"H�c H�", {0, 105, 30011, 1, 4, -1, -1, -1, -1, -1, -1}, 191, 10000000},	
	[3] = {"Ng� Ki�m", {0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1}, 290, 8},	--Ph�c Sinh 2 (cs7)
}

tSFX ={
	{957,931},
	{955,922},
	{959,927},
	{956,928},
}

tLife = {"Long","H�","�ng","Ph�ng"}
tLife_cs6 = {"Long","H�","�ng","Ph�ng"}

tb_translife_weapon_effect = {			
			"H�o m�n",
			"Ph�n V�n",
			"�o�n Giao",			
			"Ph� Qu�n",
}

function UseDragonToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "B�t Long T� Quang/#GetSFX(1)")
	tinsert(tSay, "T�t Long T� Quang/CloseSFX")
	tinsert(tSay, "K�ch ho�t hi�u �ng V� Kh�/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then
 		tinsert(tSay, "Long T� H�i l�nh/#TransferLife(1)")
 	else
 		tinsert(tSay, "T� Linh Long T� l�nh/#TranferTuLinh(1)")
 	end
 	tinsert(tSay, "��ng/closedialog")
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! Long T� H�i chi�u hi�n n�p s�, cao th� gi� Long T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)
end

function UseTigerToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "B�t H� T� Quang/#GetSFX(2)")
	tinsert(tSay, "T�t H� T� Quang/CloseSFX")
	tinsert(tSay, "K�ch ho�t hi�u �ng V� Kh�/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then	
		tinsert(tSay, "H� T� H�i l�nh/#TransferLife(2)")
	else
		tinsert(tSay, "T� Linh H� T� l�nh/#TranferTuLinh(2)")
	end	 	
	tinsert(tSay, "��ng/closedialog")	
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! H� T� H�i chi�u hi�n n�p s�, cao th� gi� H� T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)
end


function UseFengToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "B�t Ph�ng T� Quang/#GetSFX(3)")
	tinsert(tSay, "T�t Ph�ng T� Quang/CloseSFX")
	tinsert(tSay, "K�ch ho�t hi�u �ng V� Kh�/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
		tinsert(tSay, "Ph�ng T� H�i l�nh/#TransferLife(4)")
 	else
 		tinsert(tSay, "T� Linh Ph�ng T� l�nh/#TranferTuLinh(4)")
 	end	 	
 	tinsert(tSay, "��ng/closedialog")	
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! Ph�ng T� H�i chi�u hi�n n�p s�, cao th� gi� Ph�ng T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)
end


function UseYingToken(nItemIdx)
	local tSay={}	
	tinsert(tSay, "B�t �ng T� Quang/#GetSFX(4)")
	tinsert(tSay, "T�t �ng T� Quang/CloseSFX")
	tinsert(tSay, "K�ch ho�t hi�u �ng V� Kh�/#WeaponEffect(1)")
	if GetPlayerRebornParam(0) == 0 then			
 		tinsert(tSay, "�ng T� H�i l�nh/#TransferLife(3)")
 	else
 		tinsert(tSay, "T� Linh �ng T� l�nh/#TranferTuLinh(3)")
 	end	 		 		
	tinsert(tSay, "��ng/closedialog")	
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! �ng T� H�i chi�u hi�n n�p s�, cao th� gi� �ng T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)
end

function WeaponEffect(nIndex)
	BindWeaponEffect(tb_translife_weapon_effect[nIndex],1)	
end

function GetItem(nIndex)
	local nTaskVal = GetTask(TOKEN_TASK_ID)
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate >= 20091007 then
		Say("H�n nh�n th��ng �� k�t th�c!",0)
		return
	end	
	
	if GetBit(nTaskVal,nIndex) == 1 then
		Say("��i hi�p �� nh�n ph�n th��ng n�y r�i!",0)
		return
	end
	
	if GetExtPoint(4) ~= 2 then
		Say("��i hi�p ch�a �� �i�u ki�n nh�n th��ng!",0)
		return
	end
	
	if gf_JudgeRoomWeight(tAward[nIndex][3],tAward[nIndex][4],"") == 0 then
		return
	end		
	
	SetTask(TOKEN_TASK_ID,SetBit(nTaskVal,nIndex,1))
	
	if nIndex == 5 or nIndex == 9 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			WriteLogEx("Phan thuong bang chu","nh�n",1,tAward[nIndex][1])		
		end	
	elseif nIndex == 6 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			gf_SetItemExpireTime(nItemIdx,2010,03,31,24,0,0)
			WriteLogEx("Phan thuong bang chu","nh�n",1,tAward[nIndex][1])		
		end		
	elseif nIndex == 7 then
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,8000+ GetBody(),1,1,-1,-1,-1,-1,-1,-1,0,7},tAward[nIndex][1])
				if Ret == 1 then
					WriteLogEx("Phan thuong bang chu","nh�n",1,tAward[nIndex][1])
				end
			end
		end	
	elseif nIndex == 8 then
		local nRet, nItemIdx = gf_AddItemEx(tAward[nIndex][2],tAward[nIndex][1])
		if nRet == 1 then
			SetItemExpireTime(nItemIdx,30*24*60*60)
			WriteLogEx("Phan thuong bang chu","nh�n",1,tAward[nIndex][1])		
		end
	else
		return
	end
end

function GetSFX(nIndex)
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][1],1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),tSFX[nIndex][2],5,1)	
	end
end

function CloseSFX()
	if PlayerIndex > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,5,1)
	end
end

function GetAward()
	local tSay={
		"Nh�n ph�n th��ng M�t T�ch T� Linh V� Song/#GetItem(5)",
	 	"Nh�n ph�n th��ng K� L�n/#GetItem(6)",
	 	"Nh�n ph�n th��ng Vi�m ��/#GetItem(7)", 
	 	"Nh�n ph�n th��ng ��nh H�n Thi�n Th�ch Th�n Th�ch/#GetItem(8)",
	 	"Nh�n ph�n th��ng 30 ��i h�ng bao ho�ng kim/#GetItem(9)", 
	 	"��ng/closedialog",	
	}
	Say("Ph�n th��ng d�nh cho Bang ch� c�a Bang h�i h�ng nh�t nh�n kh�. Th�i gian nh�n th��ng <color=red>01/10/2009 - 24:00 07/10/2009<color>.",getn(tSay),tSay)
end

function TransferLife(szLife)
	local tSay={	 	
	 	"Mua ngo�i trang chuy�n sinh (c�n 200 v�t ph�m Xu, h�n s� d�ng 30 ng�y)/buy_translife_cloth",
	 	format("Mua trang b� d�ng %s T�/buy_translife_equip",tLife[szLife]),
	 	format("K�ch ho�t th� c��i d�ng %s T�/buy_translife_horse",tLife[szLife]),
	 	format("K�ch ho�t ch� t�o ngo�i trang U�n Linh d�ng %s T�/translife_cloth",tLife[szLife]),
	 	"K�ch ho�t ch� t�o V� Kh� Linh Ph�ch/nothing",
	 	"K�ch ho�t K� N�ng S�ng sau chuy�n sinh/nothing",
	 	"��ng/closedialog",	
	}
	Say(format("C�c ch�c n�ng c�a %s T� H�i:",tLife[szLife]),getn(tSay),tSay)
end

function buy_translife_equip()
	local tSay={
		"Nh�n H�u Ngh� L�c Nh�t Ho�n 1 l�n (y�u c�u ��ng c�p 86 + h�n s� d�ng 30 ng�y + tu luy�n theo h��ng Long/H�/�ng T�)/#get_translife_equip(1)",
		"Nh�n H�ng Nga Huy�n Th�n ��i 1 l�n (y�u c�u ��ng c�p 86 + h�n s� d�ng 30 ng�y + tu luy�n theo h��ng Ph�ng T�)/#get_translife_equip(2)",
		"Nh�n Khu�t Nguy�n B�i 1 l�n (y�u c�u ��ng c�p 92 + h�n s� d�ng 30 ng�y)/#get_translife_equip(3)",
		"Mua H�u Ngh� L�c Nh�t Ho�n (c�n 700 �i�m s� m�n + 700 �i�m danh v�ng + h�n s� d�ng 7 ng�y)/#confirm_buy_translife_equip(1)",		
		"Mua H�ng Nga Huy�n Th�n ��i (c�n 700 �i�m s� m�n + 700 �i�m danh v�ng + h�n s� d�ng 7 ng�y)/#confirm_buy_translife_equip(2)",
		"Mua Khu�t Nguy�n B� (c�n 1500 �i�m s� m�n + 1500 �i�m danh v�ng + h�n s� d�ng 7 ng�y)/#confirm_buy_translife_equip(3)",		
		"��ng/closedialog",
	}
	Say("C�c lo�i trang s�c: ",getn(tSay),tSay)
end

function get_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if (nType == 3) and (nTransCount < 592) then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if nTransCount < 388 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetTaskTrans() == 23 or GetTaskTrans() == 31 or GetTaskTrans() == 37 or GetTaskTrans() == 38  then
		if nType == 1 then
			if BigGetItemCount(0,102,43) > 0 then
				Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
				return
			end
			if GetTranslifeFaction() == 4 then
				Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Long/H�/�ng T� m�i c� th� nh�n trang s�c n�y!!")
				return
			end
			gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"H�u Ngh� L�c Nh�t Ho�n","Chuyen Sinh","nh�n",30*24*3600,1)	
		elseif nType == 2 then
			if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
				return
			end
			if GetTranslifeFaction() ~= 4 then
				Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Ph�ng T� m�i c� th� mua trang s�c n�y!!")
				return
			end
			gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H�ng Nga Nguy�t V� ��i","Chuyen Sinh","nh�n",30*24*3600,1)
		elseif nType == 3 then
			if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
				return
			end
			gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","Chuyen Sinh","nh�n",30*24*3600,1)
		end
		SetTaskTrans()
	else
		Talk(1,"","B�n �� nh�n trang s�c n�y r�i ho�c b�n ch�a �� �i�u ki�n nh�n!")
		return
	end
end
function confirm_buy_translife_equip(nType)
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nType == 3 and nTransCount < 592 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if nTransCount < 388 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B�n kh�ng �� 10000 �i�m S� M�n ho�c 10000 Danh V�ng �� mua trang s�c n�y!")
		return
	end
	if nType == 1 then
		if GetTranslifeFaction() == 4 then
			Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Long/H�/�ng T� m�i c� th� mua trang s�c n�y!!")
			return
		end
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� mua th�m!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"H�u Ngh� L�c Nh�t Ho�n","Chuyen Sinh","nh�n",7*24*3600,1)		
	elseif nType == 2 then
		if GetTranslifeFaction() ~= 4 then
			Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Ph�ng T� m�i c� th� mua trang s�c n�y!!")
			return
		end
		if BigGetItemCount(0,102,42) > 0 then
				Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� mua th�m!")
				return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H�ng Nga Nguy�t V� ��i","Chuyen Sinh","nh�n",7*24*3600,1)
	elseif nType == 3 then
		if BigGetItemCount(0,102,27) > 0 then
				Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
				return
		end
		ModifyReputation(-1500,1)
		SetTask(336,GetTask(336) - 1500)
		Msg2Player("B�n b� tr� 1500 �i�m s� m�n!")
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","Chuyen Sinh","nh�n",7*24*3600,1)
	end
end

function buy_translife_horse()
	local tSay={	 	
		"K� L�n Ni�n Th� (c�n 1 Phi�u V� + 100 v�ng)/#confirm_buy_translife_horse(1)",
		"B�ch H� Th�n Th� (c�n 1 Phi�u V� + 1000 v�ng)/#confirm_buy_translife_horse(2)",
		"��ng/closedialog",
	}
	Say("C�c th� c��i:",getn(tSay),tSay)
end

function confirm_buy_translife_horse(nType)
	
	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_horse[nType][3] then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if GetCash() <  t_translife_horse[nType][4] then
		Talk(1,"","B�n ch�a �� ng�n l��ng �� ��i!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng ho�c �� n�ng, vui l�ng s�p x�p l�i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B�n ph�i trang b� ng�a m�i c� th� ��i ���c!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B�n ph�i trang b� Phi�u V� m�i c� th� ��i ���c!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(t_translife_horse[nType][4]) == 1 then	
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse[nType][2],t_translife_horse[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)			
		end
		Msg2Player("B�n nh�n ���c 1 "..t_translife_horse[nType][1]..".")		
	end
end

function buy_translife_cloth()
	local tSay={	 	
		"V�n S� ngo�i trang/#confirm_buy_translife_cloth(1)",
		"Thi�n �m ngo�i trang/#confirm_buy_translife_cloth(2)",
		"Thi�u D��ng ngo�i trang/#confirm_buy_translife_cloth(3)",
		"T� Linh Vi�t  ngo�i trang/#confirm_buy_translife_cloth(4)",
		"T� Linh ngo�i trang/nothing",
		"��ng/closedialog",
	}
	Say("C�c ngo�i trang:",getn(tSay),tSay)
end


function confirm_buy_translife_cloth(nType)

	local nTransCount = tonumber(GetTranslifeCount()..GetLevel())
	if nTransCount < t_translife_cloth[nType][5] then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B�n kh�ng mang theo �� 200 v�t ph�m Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B�n nh�n ���c "..t_translife_cloth[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh","mua",	1, t_translife_cloth[nType][1])
	end
end

function translife_cloth()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	local tSay = {
		"K�ch ho�t M�o ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 100 v�ng)/#translife_cloth_confirm(6)",
		"K�ch ho�t Th��ng y  ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 100 v�ng)/#translife_cloth_confirm(7)",
		"K�ch ho�t H� y ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 100 v�ng)/#translife_cloth_confirm(8)",
		"��ng/closedialog",
	}
	Say("Ch�n lo�i ngo�i trang mu�n k�ch ho�t:",getn(tSay),tSay)
end

function translife_cloth_cs6()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	local tSay = {
		"K�ch ho�t M�o ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(6)",
		"K�ch ho�t Th��ng y  ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(7)",
		"K�ch ho�t H� y ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(8)",
		"��ng/closedialog",
	}
	Say("Ch�n lo�i ngo�i trang mu�n k�ch ho�t:",getn(tSay),tSay)
end

function translife_cloth_cs7()
	local nTransCount = GetTranslifeCount()
	if nTransCount < 1 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	local tSay = {
		"K�ch ho�t M�o ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(6)",
		"K�ch ho�t Th��ng y  ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(7)",
		"K�ch ho�t H� y ngo�i trang U�n Linh theo h��ng tu luy�n (c�n 800 v�ng)/#translife_cloth_confirm(8)",
		"��ng/closedialog",
	}
	Say("Ch�n lo�i ngo�i trang mu�n k�ch ho�t:",getn(tSay),tSay)
end

function translife_cloth_confirm(nType)
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = GetTranslifeCount()
	local nFaction = GetTranslifeFaction()
	if nPhucSinh < 1 then
		if nTransCount < 1 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	end
	if GetLevel() < 79 then
		Say("B�n ch�a �� ��ng c�p s� d�ng ch�c n�ng n�y!",0)
		return
	end
	if GetPlayerRebornParam(0) >= 1 then
		if GetCash()  < 8000000 then
			Talk(1,"","B�n kh�ng c� �� ng�n l��ng.")
			return
		end		
	else
		if GetCash()  < 1000000 then
			Talk(1,"","B�n kh�ng c� �� ng�n l��ng.")
			return
		end		
	end	
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then				
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(nType)
	local nItemIdx = GetPlayerEquipIndex(nType)
	local nCanAdd = 0
	local nIdex = 0
	if nG == 0 and nD ==0 and nP ==0 then
		Talk(1,"","Ph�i m�c ngo�i trang tr�n ng��i m�i c� th� k�ch ho�t thu�c t�nh.")
		return
	end
	for i=1, getn(tb_option_cloth) do 
		if tb_option_cloth[i][1] == nG and tb_option_cloth[i][2] == nD and tb_option_cloth[i][3] == nP then
			nCanAdd = 1			
			break
		end
	end	
	if nCanAdd == 0 then
		Talk(1,"","Ngo�i trang kh�ng ph� h�p. Ch� c� th� k�ch ho�t B�t B�t ngo�i trang, Linh Lung ngo�i trang, T��ng Qu�n ngo�i trang.")
		return
	end
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30*24*3600
	if nExpireTime <= 0 then
	 	nExpireTime =  30*24*3600
	 end
	UnEquipAtPosition(nType)
		--------------------------------------
	if GetPlayerRebornParam(0) == 1 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs6 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end
	elseif GetPlayerRebornParam(0) == 2 then
		if DelItemByIndex(nItemIdx,-1) and Pay(8000000) == 1 then	
			local nType_cs7 = GetPlayerRebornParam(1)
			local nBody = GetBody()	
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][nType-5])	--gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end			
			return
		end	
	else
		--------------------------------------	
		if DelItemByIndex(nItemIdx,-1) and Pay(1000000) == 1 then
			local _,_,_,_, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nFaction][nTransCount][nType-5][2])
			local nRet, nItemIdx2 = AddItem(nG, nD, nP, 1,1, lvatt1, att1, lvatt2, att2, lvatt3, att3)
			if nRet ==1 then
				SetItemStatus(nItemIdx2, 0, 1)
				SetItemExpireTime(nItemIdx2,nExpireTime)
			end
		end
	end
end
function TranferTuLinh(nLife)
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","��i hi�p kh�ng ph�i l� ng��i h�u duy�n v�i b� k�p T� Linh Ph�c Sinh.")
		return
	end
	local tSay = {}

	tinsert(tSay, 	"Ta mu�n nh�n trang b� mi�n ph�/get_TranferTuLinh")
	tinsert(tSay, 	"Ta mu�n mua trang b�/buy_TranferTuLinh")
	if nPhucSinh == 1 then
		tinsert(tSay, format("K�ch ho�t ch� t�o ngo�i trang U�n Linh Ph�c Sinh 1 d�ng %s T�/translife_cloth_cs6",tLife_cs6[nLife]))
	elseif nPhucSinh == 2 then
		tinsert(tSay, format("K�ch ho�t ch� t�o ngo�i trang U�n Linh Ph�c Sinh 2 d�ng %s T�/translife_cloth_cs7",tLife_cs6[nLife]))
	end
	tinsert(tSay, "��ng/closedialog")
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! Long T� H�i chi�u hi�n n�p s�, cao th� gi� Long T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)	
end

function get_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","��i hi�p kh�ng ph�i l� ng��i h�u duy�n v�i b� k�p T� Linh Ph�c Sinh.")
		return
	end
	local tSay = {}
	if nPhucSinh == 1 then
		tinsert(tSay, "Ta mu�n nh�n ngo�i trang T� Linh mi�n ph� 120 ng�y (1 l�n duy nh�t + c�n ��ng c�p 79)/cs6_get_translife_cloth")
	end
	if nPhucSinh == 2 then
		tinsert(tSay, "Ta mu�n nh�n ngo�i trang Th�t T�ch mi�n ph� 120 ng�y (1 l�n duy nh�t + c�n ��ng c�p 79)/cs7_get_translife_cloth") --new
	end
	tinsert(tSay, "Ta mu�n nh�n Ng�c B�i K� N�ng 30 ng�y (1 l�n duy nh�t + c�n ��ng c�p 86)/cs6_get_HNHN")		
	tinsert(tSay, "Ta mu�n nh�n Khu�t Nguy�n B�i 30 ng�y (1 l�n duy nh�t + c�n ��ng c�p 89)/cs6_get_KNB")	
	tinsert(tSay, "��ng/closedialog")
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! Long T� H�i chi�u hi�n n�p s�, cao th� gi� Long T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)		
end

function buy_TranferTuLinh()
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh < 1 then
		Talk(1,"","��i hi�p kh�ng ph�i l� ng��i h�u duy�n v�i b� k�p T� Linh Ph�c Sinh.")
		return
	end
	local tSay = {}
	tinsert(tSay, 	"Ta mu�n mua H�u Ngh� L�c Nh�t Ho�n 1 l�n (c�n ��ng c�p 86 + h�n s� d�ng 7 ng�y + tu luy�n theo h��ng Long/H�/�ng T�)/#cs6_buy_HNHN(1)")
	tinsert(tSay, 	"Ta mu�n mua H�ng Nga Huy�n Th�n ��i 1 l�n (c�n ��ng c�p 86 + h�n s� d�ng 7 ng�y + tu luy�n theo h��ng Ph�ng T�)/#cs6_buy_HNHN(2)")	
	tinsert(tSay, "Ta mu�n mua ngo�i trang V�n S� 30 ng�y (200 xu V�t ph�m + c�n ��ng c�p 88)/#cs6_buy_translife_cloth(1)")
	tinsert(tSay, "Ta mu�n mua ngo�i trang Thi�n �m 30 ng�y (200 xu V�t ph�m + c�n ��ng c�p 88)/#cs6_buy_translife_cloth(2)")
	tinsert(tSay, "Ta mu�n mua ngo�i trang Thi�u D��ng 30 ng�y (200 xu V�t ph�m + c�n ��ng c�p 88)/#cs6_buy_translife_cloth(3)")
	tinsert(tSay, "Ta mu�n mua ngo�i trang T� Linh 30 ng�y (200 xu V�t ph�m + c�n ��ng c�p 88)/#cs6_buy_translife_cloth(4)")	
	tinsert(tSay, "Ta mu�n mua Khu�t Nguy�n B�i 30 ng�y (1500 danh v�ng + 1500 s� m�n + c�n ��ng c�p 89)/cs6_buy_KNB")
	tinsert(tSay, "N�ng c�p Th� C��i Th�n Th� B�ch H� (c�n Phi�u V� + 1000 v�ng)/#buy_horse(1)")
	tinsert(tSay, "N�ng c�p Th� C��i Th�n Th� H�c H� (c�n Phi�u V� + 1000 v�ng)/#buy_horse(2)")	
	if nPhucSinh == 2 then
		tinsert(tSay, "N�ng c�p Ng� Ki�m (c�n Phi�u V� + 8 ��i ng�n phi�u)/#buy_horse(3)")
	end
	tinsert(tSay, "��ng/closedialog")
	Say("C�n c�n tr��ng giang ��ng th� th�y. L�ng hoa ��o t�n anh h�ng. Th� phi th�nh b�i chuy�n ��u kh�ng ! Long T� H�i chi�u hi�n n�p s�, cao th� gi� Long T� �n c� th� hi�u l�nh: ",getn(tSay),tSay)	
end
function cs6_get_translife_cloth()
	local nType = 5
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nTransCount < 179 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 1 then
		Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " B� ngo�i trang mi�n ph� ", "Ngoai trang chuyen sinh 6","nh�n", 120*24*3600, "Nh�n trang b� mi�n ph� th�nh c�ng")
		
	end
--	if DelItem(2,1,30230,200) == 1 then
--		for i = 0, 2 do
--			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
--			if nOk == 1 then
--				SetItemStatus(nItemIndex, 0, 1)
--				SetItemExpireTime(nItemIndex, 120*24*3600)
--			end
--		end
--		Msg2Player("B�n nh�n ���c "..t_translife_cloth[nType][1])
--		WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "B� ngo�i trang mi�n ph�")
--	end
	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end
function cs7_get_translife_cloth()
	local nType = 6
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	
	if nTransCount < 279 then
		Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
		return
	end
	local nNhan = mod(GetTask(2685),10)
	if nNhan >= 2 then
		Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	local nTypePS = GetPlayerRebornParam(1)
	local nKieuHinh = GetBody()
	for i = 1, 3 do
		gf_AddItemEx2(t_translife_cloth_cs6[nType][nTypePS][nKieuHinh][i], " B� ngo�i trang mi�n ph� ", "Ngoai trang chuyen sinh 7","nh�n", 120*24*3600, "Nh�n trang b� mi�n ph� th�nh c�ng")
	end

	SetTask(TSK_CS6_GET1TIME, GetTask(2685) + 1)
end
function buy_horse(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nType == 1 then
			if nTransCount < 190 then
				Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
				return
			end
		elseif nType == 2 then
			if nTransCount < 191 then
				Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
				return
			end
		end
		if GetCash() <  t_translife_horse_cs6[nType][4] then
			Talk(1,"","B�n ch�a �� ng�n l��ng �� ��i!")
			return
		end		
	elseif nPhucSinh == 2 then
		if nType == 1 or nType == 2 or nType == 3 then
			if nTransCount < 290 then
				Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
				return
			end
		end
		if nType == 1 or nType == 2 then
			if GetCash() <  t_translife_horse_cs6[nType][4] then
				Talk(1,"","B�n ch�a �� ng�n l��ng �� ��i!")
				return
			end				
		elseif nType == 3 then
			if GetItemCount(2,1,199) < 8 then
				Talk(1,"","B�n kh�ng mang �� 8 ��i ng�n phi�u")
				return
			end
		end
	end


	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng ho�c �� n�ng, vui l�ng s�p x�p l�i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B�n ph�i trang b� ng�a m�i c� th� ��i ���c!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B�n ph�i trang b� Phi�u V� m�i c� th� ��i ���c!")
		return
	end

	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx, -1) == 1 then	
		if nType == 1 or nType == 2 then
			Pay(t_translife_horse_cs6[nType][4])
		else
			DelItem(2,1,199,8)
		end
		local nOk, nItemIndex = gf_AddItemEx2(t_translife_horse_cs6[nType][2],t_translife_horse_cs6[nType][1],"Thu cuoi chuyen sinh","mua",nExpireTime,0)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
		end
		Msg2Player("B�n nh�n ���c 1 "..t_translife_horse_cs6[nType][1]..".")	
		if nType < 3 then
			WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, t_translife_horse_cs6[nType][1])		
		else
			WriteLogEx("Ngoai trang chuyen sinh 7","mua",1, t_translife_horse_cs6[nType][1])		
		end
	end
end
function cs6_get_HNHN()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if nPhucSinh == 1 then
		if nTransCount < 186 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H�ng Nga Nguy�t V� ��i","Chuyen Sinh 6","nh�n",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "H�ng Nga Nguy�t V� ��i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"H�u Ngh� L�c Nh�t Ho�n","Chuyen Sinh 6","nh�n",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "H�u Ngh� L�c Nh�t Ho�n")	
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 286 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/10)
		local nCon = mod(GetTask(2685), 10)
		local nTotal = (nNhan + 1) * 10 + nCon
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
			return	
		end
		if BigGetItemCount(0,102,43) > 0 or  BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end	
		if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
			return
		end	
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		if GetPlayerRebornParam(1) == 4 then	
			gf_AddItemEx2({0,102,42,1,4,-1,-1,-1,-1,-1,-1},"H�ng Nga Nguy�t V� ��i","Chuyen Sinh 7","nh�n",30*24*3600,1)
			WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "H�ng Nga Nguy�t V� ��i")		
		else
			gf_AddItemEx2({0,102,43,1,4,-1,-1,-1,-1,-1,-1},"H�u Ngh� L�c Nh�t Ho�n","Chuyen Sinh 7","nh�n",30*24*3600,1)	
			WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "H�u Ngh� L�c Nh�t Ho�n")	
		end
	end
end

function cs6_buy_HNHN(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nTransCount < 186 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 286 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	end
	if GetReputation() < 10000 or GetTask(336) < 10000 then
		Talk(1,"","B�n kh�ng �� 10000 �i�m S� M�n ho�c 10000 Danh V�ng �� mua trang s�c n�y!")
		return
	end	
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if nType == 1 then
		if BigGetItemCount(0,102,43) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end
		if GetPlayerRebornParam(1) == 4 then
			Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Long/H�/�ng T� m�i c� th� mua trang s�c n�y!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B�n b� tr� 700 �i�m s� m�n!")		
		gf_AddItemEx2({0,102,43,1,1,-1,-1,-1,-1,-1,-1},"H�u Ngh� L�c Nh�t Ho�n","Chuyen Sinh 6","mua",7*24*3600,1)	
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "H�u Ngh� L�c Nh�t Ho�n")	
	elseif nType == 2 then
		if BigGetItemCount(0,102,42) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end
		if GetPlayerRebornParam(1) ~= 4 then
			Talk(1,"","Ch� c� ng��i tu luy�n theo h��ng Ph�ng T� m�i c� th� mua trang s�c n�y!")
			return
		end
		ModifyReputation(-700,1)
		SetTask(336,GetTask(336) - 700)
		Msg2Player("B�n b� tr� 700 �i�m s� m�n!")	
		gf_AddItemEx2({0,102,42,1,1,-1,-1,-1,-1,-1,-1},"H�ng Nga Nguy�t V� ��i","Chuyen Sinh 6","mua",7*24*3600,1)
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "H�ng Nga Nguy�t V� ��i")		
	end
end

function cs6_get_KNB()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nPhucSinh == 1 then
		if nTransCount < 189 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/100)
		local nCon = mod(GetTask(2685), 100)
		local nTotal = (nNhan + 1) * 100 + nCon
		if mod(nNhan, 10) >= 1 then
			Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
			return	
		end	
		if BigGetItemCount(0,102,27) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","Chuyen Sinh 6","nh�n",30*24*3600,1)
		Msg2Player("B�n nh�n ���c Khu�t Nguy�n B�i h�n s� d�ng 30 ng�y")
		WriteLogEx("Ngoai trang chuyen sinh 6","nh�n",1, "Khu�t Nguy�n B�i")		
	elseif nPhucSinh == 2 then
		if nTransCount < 289 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
		local nNhan = floor(GetTask(2685)/100)
		local nCon = mod(GetTask(2685), 100)
		local nTotal = (nNhan + 1) * 100 + nCon
		if mod(nNhan, 10) >= 2 then
			Talk(1,"","��i hi�p �� nh�n mi�n ph� 1 l�n r�i n�n kh�ng th� nh�n ���c n�a !!!!")
			return	
		end	
		if BigGetItemCount(0,102,27) > 0 then
			Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
			return
		end
		SetTask(TSK_CS6_GET1TIME, nTotal)	
		gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","Chuyen Sinh 7","nh�n",30*24*3600,1)
		Msg2Player("B�n nh�n ���c Khu�t Nguy�n B�i h�n s� d�ng 30 ng�y")
		WriteLogEx("Ngoai trang chuyen sinh 7","nh�n",1, "Khu�t Nguy�n B�i")		
	end
end

function cs6_buy_KNB()
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return
	end
	if nPhucSinh == 1 then
		if nTransCount < 189 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < 289 then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	end
	if GetReputation() < 1500 or GetTask(336) < 1500 then
		Talk(1,"","B�n kh�ng �� 1500 �i�m S� M�n ho�c 1500 Danh V�ng �� mua trang s�c n�y!")
		return
	end	
	if BigGetItemCount(0,102,27) > 0 then
		Talk(1,"","C�c h� �� s� h�u trang s�c n�y, kh�ng th� nh�n th�m!")
		return
	end
	ModifyReputation(-1500,1)
	SetTask(336,GetTask(336) - 1500)
	Msg2Player("B�n b� tr� 1500 �i�m s� m�n!")
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","Chuyen Sinh 6","nh�n",30*24*3600,1)	
	Msg2Player("B�n nh�n ���c Khu�t Nguy�n B�i h�n s� d�ng 30 ng�y")
	WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, "Khu�t Nguy�n B�i")		
end

function cs6_buy_translife_cloth(nType)
	local nTransCount = tonumber(GetPlayerRebornParam(0)..GetLevel())
	local nPhucSinh = GetPlayerRebornParam(0)
	if nPhucSinh == 1 then
		if nTransCount < t_translife_cloth_cs6[nType][5] then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	elseif nPhucSinh == 2 then
		if nTransCount < t_translife_cloth_cs6[nType][6] then
			Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
			return
		end
	end
	if GetItemCount(2,1,30230) < 200 then
		Say("B�n kh�ng mang theo �� 200 v�t ph�m Xu!",0)
		return
	end
	if gf_Judge_Room_Weight(4, 100, " ") == 0 then				
		return
	end
	if DelItem(2,1,30230,200) == 1 then
		for i = 0, 2 do
			local nOk, nItemIndex = AddItem(0, 108 + i, t_translife_cloth_cs6[nType][4]  + GetBody() - 1, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, 30*24*3600)
			end
		end
		Msg2Player("B�n nh�n ���c "..t_translife_cloth_cs6[nType][1])
		WriteLogEx("Ngoai trang chuyen sinh 6","mua",1, t_translife_cloth_cs6[nType][1])
	end
end

function nothing()
	Say("B�n ch�a �� �i�u ki�n s� d�ng ch�c n�ng n�y!",0)
end

function closedialog()
end