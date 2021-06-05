Include("\\script\\online\\newyear08\\newyear08_head.lua");--08Ê¥µ®½Ú
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

t_TUOGUAN_MIJI = {
	[1] = {"Kim Cang B¸t Nh· Kinh", {0,107,166,2}},
	[2] = {"V« TrÇn Bå §Ò Kinh",{0,107,168,1}},
	[3] = {"TiÒm Long TÞch DiÖt Kinh",{0,107,167,1}},
	[4] = {"Thiªn La Liªn Ch©u Lôc",{0,107,169,1}},
	[5] = {"Nh­ ý Kim §Ønh MËt TÞch",{0,107,170,1}},
	[6] = {"BÝch H¶i TuyÖt ¢m Phæ",{0,107,171,1}},
	[7] = {"Hçn §én TrÊn Nh¹c MËt TÞch"	,{0,107,172,1}},
	[8] = {"Quü Thiªn Du Long MËt TÞch",{0,107,173,1}},
	[9] = {"HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174,1}},
	[10] = {"Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175,1}},
	[11] = {"TrÊn Qu©n Phi Long Th­¬ng Phæ"	,{0,107,176,1}},
	[12] = {"Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177,1}},
	[13] = {"U Minh Phong Ma Lôc",{0,107,178,1}},
	[14] = {"Linh Cæ HuyÔn Tµ Lôc",{0,107,179,1}},
	[15] = {"Cöu Thiªn Phong L«i QuyÕt",{0,107,198,1}},	
	[16] = {"Hång TrÇn Tóy Méng Phæ",{0,107,202,1}},
	[17] = {"Phong Hoa Thiªn DiÖp Phæ",{0,107,203,1}},
};

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

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if get_chrims_state() == 1 then
		local nRand = random(1,1000);
		if nRand <= 1000 then
			AddItem(2,1,1192,1);
			Msg2Player("B¹n nhËn ®­îc mét tói lÔ vËt Gi¸ng Sinh");
		end
	end
	if npcName == "B¾c Lôc L©m Minh Chñ" then
		local npcIndex = CreateNpc("B¾c Lôc L©m lÖnh","B¾c Lôc L©m lÖnh",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña B¾c Lôc L©m Minh Chñ", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "Th­¬ng ThÇn Doanh Thiªn" then
		local npcIndex = CreateNpc("Trôc ¶nh Th­¬ng","Trôc ¶nh Th­¬ng",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ	
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña Th­¬ng ThÇn Doanh Thiªn", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "L·nh H­¬ng L¨ng" then
		---- NhiÖm vô chuyÓn sinh 5
	local nTeamSize = GetTeamSize()
	if nTeamSize >= 2 then
		local nOldPlayerIdx = PlayerIndex
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
			end
			if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Hoµn thµnh yªu cÇu cña NhÞ Hoµng Tö §oµn Tè ThuËn tiªu diÖt hån ma L·nh H­¬ng L¨ng  ")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
		end
		if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Hoµn thµnh yªu cÇu cña NhÞ Hoµng Tö §oµn Tè ThuËn tiªu diÖt hån ma L·nh H­¬ng L¨ng  ")
		end
	end
		
		local npcIndex = CreateNpc("TuyÖt T×nh Th¹ch","TuyÖt T×nh Th¹ch",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ	
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña L·nh H­¬ng L¨ng", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end			
	else
		Talk(1,"","B¹n nh×n xung quanh vÉn kh«ng ph¸t hiÖn g×.");
	end;
	
	if AddItem(2,2,7,3) == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 m¶nh Thiªn Th¹ch");
			WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 1 m¶nh Thiªn Th¹ch");
	end;		
	

	local nRandBook = random(1,17);
	gf_AddItemEx(t_TUOGUAN_MIJI[nRandBook][2], t_TUOGUAN_MIJI[nRandBook][1]);		
	Msg2Player("B¹n ®· nhËn ®­îc 1 MËt tÞch m«n ph¸i "..t_TUOGUAN_MIJI[nRandBook][1]);
	WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().." ®· nhËn ®­îc 1 MËt tÞch m«n ph¸i "..t_TUOGUAN_MIJI[nRandBook][1]);

end