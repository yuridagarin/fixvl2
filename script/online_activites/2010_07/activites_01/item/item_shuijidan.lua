Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");


t_pet_type = {
	[2] = {
				[1] = {"��c Gi�p Tr�ng",4750,3},
				[2] = {"D�i",4750,4},
				[3] = {"H� Ly",500,5},				
			},
			
	[3]= 	{
				[1] = {"S�i r�ng",3000,1},
				[2] = {"Qu� �en",3000,2},
				[3] = {"C� s�u",2950,3},
				[4] = {"C�c",400,4},	
				[5] = {"D�i l�a",300,5},	
				[6] = {"B� c�p",100,6},	
				[7] = {"Ng�n H�",100,7},	
				[8] = {"Th��ng Vi�n",50,8},	
				[9] = {"Th� Qu�i",50,9},	
				[10] = {"G�u x�m",40,10},	
				[11] = {"Ong ��c",9,11},	
				[12] = {"Kim Gi�p",1,12},	
		 	},
	[4]= 	{
				[1] = {"H�ng B�o S� Gi�",3500,13,2},
				[2] = {"T�y B�c Tr�ng H�n",3000,14,1},
				[3] = {"Nh�t Ph�m ���ng M�t S�",3000,15,1},
				[4] = {"Xi H�a Tr��ng L�o",400,16,1},	
				[5] = {"Oa Kh�u",90,17,1},	
				[6] = {"Ti�n N�",4,18,2},	
				[7] = {"N� Ti�u Ti�n",4,19,2},	
				[8] = {"Tr� M�u H� V�",2,20,1},	
		 	},
}

t_pet_step =
{
	[2] = 0,
	[3] = 0,
	[4] = 12,
}

function OnUse(nItemIdx)
	Say("M� Tr�ng ng�u nhi�n �� c� ���c c�c lo�i B�n ��ng H�nh kh�c. B�n c� mu�n m�  tr�ng kh�ng?", 5, format("��ng � (c�n 1 B�n c� ph�)/#open_egg(%d)",nItemIdx), "Luy�n Thu�n Th� Thu�t c�p 1/learn_subskill_1_active", format("Ta mu�n ��p tr�ng nh�n 10 �i�m Linh L�c/#receive_pet_god_point(%d)", nItemIdx), format("Ta mu�n ��p tr�ng nh�n 30 �i�m N�ng C�p/#receive_pet_upgrade_point(%d)", nItemIdx), "T�m th�i c�t �i/gf_DoNothing")
end

function open_egg(nItemIdx)
	do return end;
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� s� d�ng v�t ph�m n�y!")
		return
	end
	if GetItemCount(0,200,26) < 1 then
		Talk(1,"","C�n ph�i c� 1 B�n c� ph� �� khai m� tr�ng n�y!")
		return
	end
	if DelItem(0,200,26,1) == 1 then
		if DelItemByIndex(nItemIdx,-1) == 1 then
			local nRand = gf_GetRandItemByTable(t_pet_type[nCurLevel],10000,1)
			local szPetType = t_pet_type[nCurLevel][nRand][1]
			Say("Ch�c m�ng b�n �� nh�n ���c 1 <color=yellow>"..szPetType.."<color>. B�n c� mu�n nh�n l�m B�n ��ng H�nh?",2,format("Ta ��ng �!/#confirm_open_egg(%d)",nRand),"Kh�ng mu�n nh�n/gf_DoNothing")		
		end	
	end
end

function confirm_open_egg(nRand)
	do return end;
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, t_pet_type[nCurLevel][nRand][3])
	-- Set gi�i t�nh cho pet c�p 4 tr� l�n
	if nCurLevel >= 4 then
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX, t_pet_type[nCurLevel][nRand][4])
	end
	Say("Ch�c m�ng b�n �� nh�n ���c 1 <color=yellow>"..t_pet_type[nCurLevel][nRand][1].."<color>!",0)
	WriteLogEx("Ban Dong Hanh","nh�n ���c B�n ��ng H�nh",1,t_pet_type[nCurLevel][nRand][1])
end

function receive_pet_god_point(nItemIdx)
	do return end;
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� s� d�ng t�nh n�ng n�y!")
		return
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nLastDate = floor(GetTask(TSK_RANDOMIZE_EGG) / 100)
	if nLastDate ~= nDate then
		SetTask(TSK_RANDOMIZE_EGG, nDate * 100)
	end
	
--	local nIsUsed = mod(GetTask(TSK_RANDOMIZE_EGG), 10)
--	if nIsUsed >= 2 then
--		Talk(1,"","H�m nay b�n �� s� d�ng t�nh n�ng n�y �� 2 l�n!")
--		return
--	end
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
--		SetTask(TSK_RANDOMIZE_EGG, GetTask(TSK_RANDOMIZE_EGG) + 1)
		Pet_AddGP(10)
		Msg2Player("B�n nh�n ���c 10 �i�m linh l�c!")
		gf_WriteLogEx("Trung Ngau Nhien", "s� d�ng ���c 10 �i�m Linh L�c")
	end
end

function receive_pet_upgrade_point(nItemIdx)
	do return end;
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 1 then
		Talk(1,"","Ph�i c� B�n ��ng H�nh  1 m�i c� th� s� d�ng t�nh n�ng n�y!")
		return
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nLastDate = floor(GetTask(TSK_RANDOMIZE_EGG) / 100)
	if nLastDate ~= nDate then
		SetTask(TSK_RANDOMIZE_EGG, nDate * 100)
	end
	
--	local nIsUsed = floor(mod(GetTask(TSK_RANDOMIZE_EGG), 100) / 10)
--	if nIsUsed >= 3 then
--		Talk(1,"","H�m nay b�n �� s� d�ng t�nh n�ng n�y �� 3 l�n!")
--		return
--	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
--		SetTask(TSK_RANDOMIZE_EGG, GetTask(TSK_RANDOMIZE_EGG) + 10)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (3000))
		Msg2Player("B�n nh�n ���c 30 �i�m n�ng c�p B�n ��ng H�nh!")
		gf_WriteLogEx("Trung Ngau Nhien", "s� d�ng ���c 30 �i�m N�ng C�p BDH")
	end
end