TASK_REWARD_EXP = 2428;
TASK_REWARD_GOLD = 2429;
TASK_REWARD_HORSE = 2430;

tRewardFaction =
{
	"Thi�u L�m",
	"V� �ang",
	"Nga My",
	"C�i Bang",
	"���ng M�n",
	"D��ng Gia",
	"Ng� ��c",
}

tRewardRoute =
{
	[2] 	=  {"Thi�u L�m t�c gia", 0},
	[3] 	=  {"Thi�u L�m thi�n t�ng", 2},
	[4] 	=  {"Thi�u L�m v� t�ng", 1},
	[14] 	=  {"V� �ang ��o gia", 8},
	[15] 	=  {"V� �ang t�c gia", 9},
	[8] 	=  {"Nga My ph�t gia", 4},
	[9] 	=  {"Nga My t�c gia", 5},
	[11] 	=  {"C�i Bang t�nh y", 6},
	[12] 	=  {"C�i Bang � y", 7},
	[6] 	=  {"���ng M�n", 3},
	[17] 	=  {"D��ng Gia th��ng", 10},
	[18] 	=  {"D��ng Gia cung", 11},
	[20] 	= {"Ng� ��c hi�p ��c", 12},
	[21] 	= {"Ng� ��c t� ��c", 13},
}

function funcReward()
		Say("C�c h� c� th� nh�n c�c  lo�i v�t ph�m th�ng qua c�m nang nh� sau:", 13,
			"Nh�n �i�m kinh nghi�m (ch� c� th� nh�n 1 l�n)/funcReward_01",
			"Nh�n 50000 v�ng (ch� c� th� nh�n 1 l�n)/funcReward_02",
			"Nh�n 20000 �i�m danh v�ng/funcReward_03", 
			"Nh�n 20000 �i�m S� m�n/funcReward_04",
			"Nh�n Trang b� S� M�n c�p 8/funcReward_05",
			"Nh�n Trang b� V� kh� B� Phi Y�n/funcReward_06",
			"S�ch/funcReward_07",
			"Y�u quy�t/funcReward_08",
			"Nh�n S�ch Skill tr�n ph�i/funcReward_09",
			"Nh�n D��c ph�m/funcReward_10",
			"Nh�n S�u c�/funcReward_11",
			"Nh�n c�c v�t ph�m kh�c/funcReward_12",
			"K�t th�c ��i tho�i/cancel")
end

function funcReward_01()
	if ( GetTask(TASK_REWARD_EXP) == 0 ) then
		SetLevel(85,0)
		ModifyExp(1900000000);
		SetTask(TASK_REWARD_EXP, 1) ;
		Msg2Player("��ng c�p ���c n�ng l�n 85 v� nh�n ���c 1900000000 �i�m kinh nghi�m.");
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." ���c t�ng c�p l�n 85 v� nh�n ���c 1900000000 �i�m kinh nghi�m.");
		funcReward();
	else
		Say("C�c h� �� nh�n 1 l�n r�i, kh�ng th� nh�n th�m ���c n�a!",1, "Th�t ng�i qu�./funcReward");
	end
end

function funcReward_02()
	if ( GetTask(TASK_REWARD_GOLD) == 0 ) then
		Earn(500000000);
		SetTask(TASK_REWARD_GOLD, 1) ;
		Msg2Player("B�n nh�n ���c 50000 v�ng.");
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." nh�n ���c 50000 v�ng.");
		funcReward();
	else
		Say("C�c h� �� nh�n 1 l�n r�i, kh�ng th� nh�n th�m ���c n�a!",1, "Th�t ng�i qu�./funcReward");
	end
end

function funcReward_03()
	ModifyReputation(20000, 0);
	Msg2Player("B�n nh�n ���c 20000 �i�m Danh v�ng.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." nh�n ���c 20000 �i�m Danh v�ng.");
	funcReward();
end

function funcReward_04()
	SetTask(336, GetTask(336) + 20000);
	Msg2Player("B�n nh�n ���c 20000 �i�m S� m�n.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." nh�n ���c 20000 �i�m S� m�n.");
	funcReward();
end

function funcReward_05()
	local mRoute = GetPlayerRoute();
	local mBody = GetBody()	
	
	local tType = {103, 100, 101, 102} -- M�o, Th��ng y, H� y, Trang s�c
	local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11} -- V� kh�	
	
	if mRoute ==8 or mRoute == 9 then
		mBody = mBody - 2		
	end
	
	if ( GetFreeItemRoom() < 7 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	
	if CheckRoute(mRoute) == 1 then
		for i=1,3 do
			AddItem(0, tType[i], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);
		end
				
		AddItem(0, tWeapons[mRoute], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);	
		if mRoute == 2 then
			AddItem(0, tWeapons[12], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);	
		end
		
		if mRoute == 8 or  mRoute == 9 or  mRoute == 2 or mRoute == 3 or mRoute == 4 then
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody , 1, 1, -1, -1, -1, -1, -1, -1);	
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody + 2, 1, 1, -1, -1, -1, -1, -1, -1);	
		else
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody , 1, 1, -1, -1, -1, -1, -1, -1);	
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody + 4, 1, 1, -1, -1, -1, -1, -1, -1);	
		end					
		Msg2Player("B�n �� nh�n ���c 1 b�  S� m�n "..tRewardRoute[mRoute][1]);
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 b� S� m�n "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C�c h� ch�a gia nh�p h� ph�i!",1, "Th�t ng�i qu�./funcReward");
	end	
end

function CheckRoute(nRoute)
	local tRoute = {0, 1, 5, 7, 10, 13, 16, 19}	
	for v,k in tRoute do
		if nRoute == tRoute[v] then
			return 0
		end
	end	
	return 1	
end

function funcReward_06()
	mFaction = GetPlayerRoute();
	
	if CheckRoute(mFaction) == 1 then
		if (  (GetFreeItemRoom() < 2 and mRoute == 2) or GetFreeItemRoom() < 1 ) then
			Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
			return
		end
		if ( mFaction == 2 ) then
			AddItem(0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1);
			AddItem(0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Ph� Y�n c�n v� Ph� Y�n �ao.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Ph� Y�n c�n  v� Ph� Y�n �ao.");
		elseif ( mFaction == 3 ) then
			AddItem(0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Ph� Y�n tr��ng.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Ph� Y�n tr��ng.");
		elseif ( mFaction == 4 ) then
			AddItem(0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c H�m Y�n th�.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c H�m Y�n th�.");
		elseif ( mFaction == 6 ) then
			AddItem(0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c T�ng Y�n ch�m.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c T�ng Y�n ch�m.");
		elseif ( mFaction == 8 ) then
			AddItem(0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Phi Y�n ki�m.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Phi Y�n ki�m.");
		elseif ( mFaction == 9 ) then
			AddItem(0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c V�n Y�n c�m.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c V�n Y�n c�m.");
		elseif ( mFaction == 11 ) then
			AddItem(0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c V�n Y�n th�.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c V�n Y�n th�.");
		elseif ( mFaction == 12 ) then
			AddItem(0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c L�u Y�n c�n.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c L�u Y�n c�n.");
		elseif ( mFaction == 14 ) then
			AddItem(0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Huy�n Y�n ki�m.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Huy�n Y�n ki�m.");
		elseif ( mFaction == 15 ) then
			AddItem(0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c V� Y�n b�t.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c V� Y�n b�t.");
		elseif ( mFaction == 17 ) then
			AddItem(0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c H� Ti�m Th��ng.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c H� Ti�m Th��ng.");
		elseif ( mFaction == 18 ) then
			AddItem(0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c H�nh Y�n Cung.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c H�nh Y�n Cung.");
		elseif ( mFaction == 20 ) then
			AddItem(0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Tr�c Y�n nh�n.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Tr�c Y�n nh�n..");
		elseif ( mFaction == 21 ) then
			AddItem(0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B�n �� nh�n ���c Y�u Y�n tr�o.");
			WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c Y�u Y�n tr�o.");
		end
		funcReward();
	else
		Say("C�c h� ch�a gia nh�p h� ph�i!",1, "Th�t ng�i qu�./funcReward");
	end	
end

function funcReward_07()
	Say ( "C�c h� c� th� nh�n c�c v�t ph�m sau ��y:", 8,
		"Nh�n Thi�n H� M�t T�ch/funcReward_7_1",
		"Nh�n T� H� M�t T�ch/funcReward_7_2",
		"Nh�n Chi�m Y M�t T�ch/funcReward_7_3",
		"Nh�n M�t t�ch M�n Ph�i/funcReward_7_4",
		"Nh�n Tu Ch�n Y�u Quy�t/funcReward_7_5",
		"Nh�n Nh�n S�m Qu�/funcReward_7_6",
		"Luy�n nhanh m�t t�ch ch�nh/funcReward_7_7",
		"Nh�n v�t ph�m kh�c!/funcReward"
		)
end

function funcReward_08()
	local nRoute  = GetPlayerRoute();
	local nFaction = GetPlayerFaction()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	
	-- Faction ���ng M�n v� V� �ang b� ��o ng��c
	if nFaction == 5 then
		nFaction = 2
	elseif nFaction == 2 then
		nFaction = 5
	end	
	
	if CheckRoute(nRoute) == 1 then
		AddItem(2, 0, nFaction + 606, 1, 1);
		Msg2Player("B�n �� nh�n ���c 1 t�i b� ki�p "..tRewardFaction[GetPlayerFaction()]);
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 t�i b� ki�p "..tRewardFaction[GetPlayerFaction()]);
		funcReward();
	else
		Say("C�c h� ch�a gia nh�p h� ph�i!",1, "Th�t ng�i qu�./funcReward");
	end	
end

function funcReward_09()
	mRoute = GetPlayerRoute();
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	if CheckRoute(mRoute) == 1 then
		AddItem(0, 112, tRewardRoute[mRoute][2] + 101, 1);
		Msg2Player("B�n �� nh�n ���c 1 s�ch skill tr�n ph�i "..tRewardRoute[mRoute][1]);
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 s�ch skill tr�n ph�i "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C�c h� ch�a gia nh�p h� ph�i!",1, "Th�t ng�i qu�./funcReward");
	end	
end

function funcReward_10()
	if ( GetFreeItemRoom() < 3 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 1, 484, 1);
	AddItem(2, 1, 490, 1);
	AddItem(2, 1, 496, 1);
	
	Msg2Player("B�n �� nh�n ���c 1 Sinh Sinh H�a T�n (��i), 1 H�c Ng�c �o�n T�c Cao (��i) v� 1 V�n V�t Quy Nguy�n ��n (��i).");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Sinh Sinh H�a T�n (��i), 1 H�c Ng�c �o�n T�c Cao (��i) v� 1 V�n V�t Quy Nguy�n ��n (��i).");
	funcReward();
end

function funcReward_11()
	if ( GetFreeItemRoom() < 30 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	for mCount = 0, 29 do 
		AddItem(2, 17, 2 + mCount, 100, 1); 
	end
	Msg2Player("B�n �� nh�n ���c 30 s�u c�.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 30 s�u c�.");
	funcReward();
end

function funcReward_12()
	Say ( "C�c h� c� th� nh�n c�c v�t ph�m sau ��y:", 8,
		"Nh�n ng�a Phi�u V�( ch� nh�n 1 l�n)/funcReward_12_1",
		"Nh�n Th�n H�nh B�o �i�n/funcReward_12_2",
		"Nh�n Thi�n Th�ch Linh Th�ch/funcReward_12_3",
		"Nh�n M�t n� S�t th� ���ng/funcReward_12_4",
		"Nh�n H�i Minh L�nh B�i/funcReward_12_5",
		"Nh�n K�t H�n L� Bao/funcReward_12_6",		
		"Nh�n V� L�m L�nh B�i/funcReward_12_8",
		"Nh�n v�t ph�m kh�c!/funcReward"
		)
end

function funcReward_12_1()
	if ( GetTask(TASK_REWARD_HORSE) == 0 ) then
		if ( GetFreeItemRoom() < 1 ) then
			Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
			return
		end
		AddItem(0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1);
		SetTask(TASK_REWARD_HORSE, 1) ;
		Msg2Player("B�n �� nh�n ���c 1ng�a Phi�u V�.");
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c ng�a Phi�u V�.");
		funcReward();
	else
		Say("C�c h� �� nh�n Ng�a r�i, kh�ng th� nh�n th�m ���c n�a!",1, "Th�t ng�i qu�./funcReward");
	end
end

function funcReward_12_2()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(0, 200, 40, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 Th�n H�nh B�o �i�n.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Th�n H�nh B�o �i�n.");
	funcReward();
end

function funcReward_12_3()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 1, 1068, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 Thi�n Th�ch Linh Th�ch.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Thi�n Th�ch Linh Th�ch.");
	funcReward();
end

function funcReward_12_4()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 1, 1087, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 M�t n� S�t th� ���ng.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 M�t n� S�t th� ���ng.");
	funcReward();
end

function funcReward_12_5()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 0, 125, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 H�i Minh L�nh B�i.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 H�i Minh L�nh B�i.");
	funcReward();
end

function funcReward_12_6()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 1, 585, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 K�t H�n L� Bao.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 K�t H�n L� Bao.");
	funcReward();
end

function funcReward_12_7()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��.",0);
		return
	end
	AddItem(2, 0, 141, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 Ti�u Ki�p T�n.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Ti�u Ki�p T�n.");
	funcReward();
end

function funcReward_12_8()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 1, 29000, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 V� L�m L�nh B�i.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 V� L�m L�nh B�i.");
	funcReward();
end

function funcReward_7_1()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(0, 107, 64, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 Thi�n H� M�t T�ch.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Thi�n H� M�t T�ch.");
	funcReward();
end

function funcReward_7_2()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(0, 107, 65, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 T� H� M�t T�ch.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 T� H� M�t T�ch.");
	funcReward();
end

function funcReward_7_3()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(0, 107, 66, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 Chi�m Y M�t T�ch.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Chi�m Y M�t T�ch.");
	funcReward();
end

function funcReward_7_4()
	mRoute = GetPlayerRoute();
	if ( GetFreeItemRoom() < 2 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	if CheckRoute(mRoute) == 1 then
		AddItem(0, 107, tRewardRoute[mRoute][2] + 166, 1, 1);		
		Msg2Player("B�n �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[mRoute][1]);
		WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 M�t t�ch m�n ph�i "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C�c h� ch�a gia nh�p h� ph�i!",1, "Th�t ng�i qu�./funcReward");
	end	
end

function funcReward_7_5()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 0, 554, 1, 1 );
	Msg2Player("B�n �� nh�n ���c 1 Tu Ch�n Y�u Quy�t.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 Tu Ch�n Y�u Quy�t.");
	funcReward();
end

function funcReward_7_6()
	if ( GetFreeItemRoom() < 1 ) then
		Say("S� � tr�ng trong h�nh trang kh�ng ��", 0);
		return
	end
	AddItem(2, 0, 553, 1, 1);
	Msg2Player("B�n �� nh�n ���c 1 ��i Nh�n S�m.");
	WriteLog("[Ph�n th��ng giang h� ch� nam]:"..GetName().." �� nh�n ���c 1 ��i Nh�n S�m.");
	funcReward();
end

function funcReward_7_7()	
	for i=1,100 do LevelUpBook() end                    
	Msg2Player("M�t t�ch �� ���c luy�n ��n m�c t�i �a.");
	funcReward()
end

function cancel()
end
