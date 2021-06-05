--Èý´óbossµôµÄÐ¡°ü¹ü
--by vivi
--2008/12/10
Include("\\script\\lib\\globalfunctions.lua");

TSK_GET_ITEM_TIME = 584; --¼ÇÂ¼Ê°Æð°ü¹üµÄÈÕÆÚ Ã¿ÌìÒ»´Î
TSK_GET_ITEM_COUNT_BYTE = 1;
TSK_GET_ITEM_DAY_BYTE = 2;
TSK_GET_ITEM_MONTH_BYTE = 3;

t_TUOGUAN_HIG_VOZ = {
	[1] = {"Kim Cang B¸t Nh· Ch©n QuyÓn", {0,107,204,1,1}},
	[2] = {"V« TrÇn Bå §Ò Ch©n QuyÓn",{0,107,206,1,1}},
	[3] = {"TiÒm Long Tóc DiÖt Ch©n QuyÓn",{0,107,205,1,1}},
	[4] = {"Thiªn La Liªn Ch©u Ch©n QuyÓn",{0,107,207,1,1}},
	[5] = {"Nh­ ý Kim §Ønh Ch©n QuyÓn",{0,107,208,1,1}},
	[6] = {"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn",{0,107,209,1,1}},
	[7] = {"Hçn §én TrÊn Nh¹c Ch©n QuyÓn",{0,107,210,1,1}},
	[8] = {"Quú Thiªn Du Long Ch©n QuyÓn",{0,107,211,1,1}},
	[9] = {"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn",{0,107,212,1,1}},
	[10] = {"Qu©n Tö §íi Phong Ch©n QuyÓn",{0,107,213,2,1}},
	[11] = {"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn",{0,107,214,1,1}},
	[12] = {"Xuyªn V©n L¹c Hång Ch©n QuyÓn",{0,107,215,1,1}},
	[13] = {"HuyÒn Minh Phong Ma Ch©n QuyÓn",{0,107,216,1,1}},
	[14] = {"Linh Cæ HuyÒn Tµ Ch©n QuyÓn",{0,107,217,2,1}},
	[15] = {"Cöu Thiªn Phong L«i Ch©n QuyÓn", {0,107, 218,1,1}},		
	[16] = {"Hång TrÇn Tóy Méng Ch©n QuyÓn", {0,107, 222,1,1}},		
	[17] = {"Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0,107, 223,1,1}},			
};

function main()
	local npcIndex = GetTargetNpc()
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))

	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE) ~= nDay or gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE) ~= nMonth then
		gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, 0)
	end
	
	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) >= 4 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhÆt tèi ®a 4 tói")
		return 0
	end
	
	local nWait = 300 - (GetTime() - GetUnitCurStates(npcIndex, 6))
	if nWait > 0 then
		Talk(1,"","Cßn "..nWait.." gi©y míi cã thÓ nhÆt tói!")
		return 0
	end
	
	local nDelay = 5 - (GetTime() - GetTask(2278))
	if nDelay > 0 then
		Talk(1,"","Sau "..nDelay.." gi©y míi cã thÓ nhÆt tói tiÕp theo!")
		return 0
	end
	
	-- °Ñ×Ô¼ºÉ¾³ý
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE, nDay)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE, nMonth)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) + 1)
	SetTask(2278, GetTime())
	
	local nLv = GetLevel();
	local nExp = nLv^3*2;
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
	local nRand = random(1,10000);
	if nRand <= 5 then
		AddItem(0,102,15,1,1,2,24,3,14,0,0);
	elseif nRand <= 10 then
		AddItem(0,102,20,1,1,2,24,3,14,0,0);
	end
	
	if nRand <= 9975 then
		gf_EventGiveCustomAward(3, 10, "Tui boss The Gioi")
	else
		gf_AddItemEx2({2, 1, 30071, 1}, "Nh©n S©m V¹n N¨m", "Tui boss The Gioi")
	end
	
	if nRand <= 300 then
		AddItem(0,107,66,1,4) 
	elseif nRand <= 600 then
		AddItem(0,107,65,1,4) 
	elseif nRand <= 900 then
		AddItem(0,107,64,1,4) 
	end
	
	local nRandomNum = 0;
	nRandomNum = random(1,100);
	if nRandomNum <= 5 then
		if AddItem(2,2,7,1) == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 m¶nh Thiªn Th¹ch");
			WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 1 m¶nh Thiªn Th¹ch");
		end;		
	end;
	

	nRandomNum = random(1,500);
	if nRandomNum <= 1  then
		local nRandBook = random(1,17);
		gf_AddItemEx(t_TUOGUAN_HIG_VOZ[nRandBook][2], t_TUOGUAN_HIG_VOZ[nRandBook][1]);		
		Msg2Player("B¹n ®· nhËn ®­îc 1 MËt tÞch m«n ph¸i "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
		WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().." ®· nhËn ®­îc 1 MËt tÞch m«n ph¸i "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
	end;

end