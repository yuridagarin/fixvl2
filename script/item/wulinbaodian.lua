--07圣诞活动武林宝典脚本
--by vivi
--2007/12/17

g_szThisFile = "\\script\\item\\wulinbaodian.lua";

tGaojiMiji = { --原来第2列为高级新法 后来取消了
	[2] = {{"Kim Cang B竧 Nh? Kinh",0,107,166},{"Kim Cang B竧 Nh? Kinh",0,107,166},{"Kim Cang Ph鬰 Ma kinh",0,107,1},{"Kim Cang Ph鬰 Ma T﹎ Ph竝",0,107,2}},
	[3] = {{"V? Tr莕 B? б Kinh",0,107,168},{"V? Tr莕 B? б Kinh",0,107,168},{"V? Tr莕 M藅 t辌h",0,107,5},{"V? Tr莕 T﹎ Ph竝",0,107,6}},
	[4] = {{"Ti襪 Long T辌h Di謙 Kinh",0,107,167},{"Ti襪 Long T辌h Di謙 Kinh",0,107,167},{"Ti襪 Long M藅 t辌h",0,107,3},{"Ti襪 Long T﹎ Ph竝",0,107,4}},
	[6] = {{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169},{"Thi猲 La Li猲 Ch﹗ L鬰",0,107,169},{"Thi猲 La M藅 T辌h",0,107,7},{"Thi猲 La T﹎ Ph竝",0,107,8}},
	[8] = {{"Nh? ? Kim жnh M藅 T辌h",0,107,170},{"Nh? ? Kim жnh M藅 T辌h",0,107,170},{"Nh? ? M藅 T辌h",0,107,9},{"Nh? ? T﹎ Ph竝",0,107,10}},
	[9] = {{"B輈h H秈 Tuy謙  Ph?",0,107,171},{"B輈h H秈 Tuy謙  Ph?",0,107,171},{"B輈h H秈 Ph?",0,107,11},{"B輈h H秈 T﹎ Ph竝",0,107,12}},
	[11] = {{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h"	,0,107,172},{"H鏽 чn Tr蕁 Nh筩 M藅 T辌h"	,0,107,172},{"H鏽 чn M藅 t辌h"	,0,107,13},{"H鏽 чn T﹎ Ph竝",0	,107,14}},
	[12] = {{"Qu? Thi猲 Du Long M藅 T辌h",0	,107,173},{"Qu? Thi猲 Du Long M藅 T辌h",0	,107,173},{"Qu? Thi猲 M藅 t辌h",0	,107,15},{"Qu? Thi猲 T﹎ Ph竝",0	,107,16}},
	[14] = {{"Huy詎 秐h M? Tung M藅 T辌h",0,107,174},{"Huy詎 秐h M? Tung M藅 T辌h",0,107,174},{"Huy襫 秐h M藅 t辌h",0,107,17},{"Huy襫 秐h T﹎ Ph竝",0,107,18}},
	[15] = {{"Qu﹏ T? Ti謙 Phong M藅 T辌h",0	,107,175},{"Qu﹏ T? Ti謙 Phong M藅 T辌h",0	,107,175},{"Qu﹏ T? M藅 t辌h",0	,107,19},{"Qu﹏ T? T﹎ Ph竝",0,107,20}},
	[17] = {{"Tr蕁 Qu﹏ Phi Long Thng Ph?"	,0,107,176},{"Tr蕁 Qu﹏ Phi Long Thng Ph?"	,0,107,176},{"Tr蕁 Qu﹏ M藅 t辌h"	,0,107,21},{"Tr蕁 Qu﹏ T﹎ Ph竝",0,107,22}},
	[18] = {{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0	,107,177},{"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",0	,107,177},{"Xuy猲 V﹏ M藅 t辌h",0	,107,23},{"Xuy猲 V﹏ T﹎ Ph竝",0	,107,24}},
	[20] = {{"U Minh Phong Ma L鬰",0,107,178},{"U Minh Phong Ma L鬰",0,107,178},{"U Minh Qu? L鬰",0,107,25},{"U Minh T﹎ Ph竝",0,107,26}},
	[21] = {{"Linh C? Huy詎 T? L鬰",0,107,179},{"Linh C? Huy詎 T? L鬰",0,107,179},{"Linh C? M藅 t辌h",0,107,27},{"Linh C? T﹎ Ph竝",0,107,28}}
};

function OnUse()
	local strtab = {
		"D飊g 5 Ng? H祅h M藅 T辌h i 1 Ng? H祅h M藅 T辌h to祅 t藀 (T蕋 nhi猲 c? th? s鯽 n t莕g 10)/#change_miji(1)",
		"D飊g 1 L╪g Ba Vi B? i 1 L╪g Ba Vi B? to祅 t藀 (T蕋 nhi猲 c? th? s鯽 n t莕g 10)/#change_miji(2)",
		"Ta mu鑞 d飊g M藅 t辌h s? m玭 s? c蕄 (t﹎ ph竝) i M藅 t辌h s? m玭 cao c蕄/#change_miji(3)",
		"Ta ch? n xem th?/nothing"
			}
	Say("B筺  tra V? L﹎ B秓 觧, ph竧 hi謓 c? th? so筺 th祅h M藅 T辌h m韎",
		getn(strtab),
		strtab)
end

function change_miji(nType)
	if nType == 1 then
		Say("B筺 x竎 nh d飊g 5 Ng? H祅h M藅 T辌h i 1 Ng? H祅h M藅 T辌h to祅 t藀? (T蕋 nhi猲 C? th? s鯽 n t莕g 10). V? L﹎ B秓 觧 s? bi課 m蕋.",
			2,
			"уng ?/#confirm_change_miji(1)",
			"Kh玭g, ta nh莔!/nothing");
	elseif nType == 2 then
		Say("B筺 x竎 nh d飊g 1 L╪g Ba Vi B? i 1 L╪g Ba Vi B? to祅 t藀 (T蕋 nhi猲 C? th? s鯽 n t莕g 10) ch?? V? L﹎ B秓 觧 c鬾g s? b? m蕋!",
			2,
			"уng ?/#confirm_change_miji(2)",
			"Kh玭g, ta nh莔!/nothing");
	elseif nType == 3 then
		local nRoute = GetPlayerRoute();
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute ==16 or nRoute == 19 then
			Talk(1,"","<color=green>V? L﹎ B秓 觧<color>: Hay l? thi誹 hi謕 v祇 l璾 ph竔 trc r錳 n i M藅 t辌h s? m玭.");
			return 0;
		end		
		PutinItemBox("Giao M藅 t辌h" ,1, "B筺 c? mu鑞 i M藅 t辌h n祔 kh玭g?",g_szThisFile,1);	
	end		
end

function confirm_change_miji(nType)
	if nType == 1 then
		if GetItemCount(0,107,155) < 5 then
			Talk(1,"","Trong ngi b筺 kh玭g c? 5 Ng? H祅h M藅 T辌h ");
			return
		end;
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ngi b筺 kh玭g c? 1 V? L﹎ B秓 觧 ");
			return
		end;		
		if DelItem(0,107,155,5) == 1 and DelItem(2,1,3206,1) == 1 then
		local add_flag = AddItem(0,107,157,1);
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g B筺 nh薾 頲 1 Ng? H祅h M藅 T辌h to祅 t藀 ");
			Msg2Global("Ngi ch琲"..GetName().."D飊g V? L﹎ B秓 觧 h穣 s鯽 ch鱝 ph鬰 h錳 Ng? H祅h M藅 T辌h th祅h Ng? H祅h M藅 T辌h to祅 t藀!");
			WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."D飊g V? L﹎ B秓 觧 nh薾 頲 1 Ng? H祅h M藅 T辌h to祅 t藀.");
		else
			WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."D飊g V? L﹎ B秓 觧 thu v? Ng? H祅h M藅 T辌h to祅 t藀 th蕋 b筰:"..add_flag);
		end
		else
			Talk(1,"","Ph秈 c? 5 Ng? H祅h M藅 T辌h v? 1 V? L﹎ B秓 觧 m韎 c? th? i 1 Ng? H祅h M藅 T辌h to祅 t藀.");
		end
	elseif nType == 2 then
	  if GetItemCount(0,112,78) < 1 then
	    Talk(1,"","Trong ngi b筺 kh玭g c? L╪g Ba Vi B?");
	    return
	  end
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ngi b筺 kh玭g c? 1 V? L﹎ B秓 觧 ");
			return
		end;	  
 	  if DelItem(0,112,78,1) == 1 and DelItem(2,1,3206,1) == 1 then
 	 		local add_flag = AddItem(0,112,158,1); 
 	 		if add_flag == 1 then
 	 			Msg2Player("Ch骳 m鮪g B筺 nh薾 頲 1 L╪g Ba Vi B? to祅 t藀");
 	 			Msg2Global("Ngi ch琲"..GetName().."D飊g V? L﹎ B秓 觧 h穣 s鯽 ch鱝 ph鬰 h錳 L╪g Ba Vi B? th祅h L╪g Ba Vi B? to祅 t藀!");
 	 			WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."D飊g V? L﹎ B秓 觧 nh薾 頲 1 L╪g Ba Vi B? to祅 t藀.");
 	 		else
 	 			WriteLog("07 Ho箃 ng Gi竛g sinh: Ngi ch琲 "..GetName().."D飊g V? L﹎ B秓 觧 thu v? L╪g Ba Vi B? to祅 t藀 th蕋 b筰:"..add_flag);
 	 		end
 	 	else
 	 		Talk(1,"","Ph秈 c? 1 L╪g Ba Vi B? v? 1 V? L﹎ B秓 觧 m韎 c? th? i 1 L╪g Ba Vi B? to祅 t藀.");
 	 	end
	end
end

function nothing()

end

function OnPutinCheck(nParam,nItemIdx,nID1,nID2,nID3)
	-- 锁定的不让交
	if GetItemSpecialAttr(nItemIdx, "LOCK") > 0 then
		Say("<color=green>V? L﹎ B秓 觧<color>: Зy l? v藅 ph萴 thi誹 hi謕 r蕋 qu?, thi誹 hi謕  kh鉧, kh玭g th? i, n誹 mu鑞 i th? h穣 m? kh鉧.", 0)
		return 0;
	end	
	local nRoute = GetPlayerRoute();
	if (nID1 == tGaojiMiji[nRoute][3][2] and nID2 == tGaojiMiji[nRoute][3][3] and nID3 == tGaojiMiji[nRoute][3][4]) or (nID1 == tGaojiMiji[nRoute][4][2] and nID2 == tGaojiMiji[nRoute][4][3] and nID3 == tGaojiMiji[nRoute][4][4])	then
		return 1
	end	

	Say("<color=green>V? L﹎ B秓 觧<color>: Зy kh玭g ph秈 l? v藅 ta c莕, th? ta c莕 l? <color=yellow>"..tGaojiMiji[nRoute][3][1].." ho芻 "..tGaojiMiji[nRoute][4][1].."<color>, ngi h穣 xem k? l筰.",0);
	return 0
end

function OnPutinComplete(nParam)
	local nRoute = GetPlayerRoute();
	local tbDelItemInfo = GetPutinItem();
	local nCherk = 0;
	local nDelflag = 0;

	if (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][3][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][3][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][3][4]) or (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][4][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][4][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][4][4])	then
		nCherk = 1;
	end

	if nCherk ~= 1 then
		Talk(1,"","<color=green>V? L﹎ B秓 觧<color>: V藅 ngi giao h譶h nh? c? ch髏 v蕁 , phi襫 ngi xem l筰 gi髉.");
		return 0;
	end		
	if DelItemByIndex(tbDelItemInfo[1][1],-1) == 1 and DelItem(2,1,3206,1) == 1 then
		local nAddFlag = AddItem(tGaojiMiji[nRoute][1][2],tGaojiMiji[nRoute][1][3],tGaojiMiji[nRoute][1][4],1);
		if nAddFlag == 1 then
			Talk(1,"","<color=green>V? L﹎ B秓 觧<color>: Ch骳 m鮪g ngi  i "..tGaojiMiji[nRoute][1][1].."Th祅h c玭g.");
			WriteLog("V? L﹎ B秓 觧: Ngi ch琲"..GetName().."  i 頲 m藅 t辌h"..tGaojiMiji[nRoute][1][1]);
		else
			WriteLog("V? L﹎ B秓 觧: Ngi ch琲"..GetName().."фi m藅 t辌h"..tGaojiMiji[nRoute][1][1].." th蕋 b筰, k? hi謚:"..nAddFlag);
		end
	else
		Talk(1,"","<color=green>V? L﹎ B秓 觧<color>: V藅 ngi giao h譶h nh? c? ch髏 v蕁 , phi襫 ngi xem l筰 gi髉.");
	end
end