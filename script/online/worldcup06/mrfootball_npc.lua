Include("\\script\\lib\\string.lua");
Include("\\script\\online\\worldcup06\\worldcup_head.lua");
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\online\\afterworldcup06\\award_npc.lua");

tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");

function main()
	local sContent = "";
	local nDate = tonumber(date("%m%d"));
	local selTab = {
			"L�nh ph�n th��ng ho�t ��ng h�i ��p c�p th� gi�i c� th��ng/getaward",
			"\n*Tham gia ho�t ��ng c�p th� gi�i*\n\n/handinhand_main",
			"Ta ch� ��n xem th�/nothing",
			}
	if GetLevel() <= 10 then
		Talk(1,"","Xin l�i! Ho�t ��ng l�n n�y ch� d�nh cho nh�n v�t c� ��ng c�p <color=yellow>l�n h�n c�p 10<color>");
		return 0;
	end;
	if nDate > 630 then	--ȥ������4ǿ�������ӡ��ھ�ѡ��
		tinsert(selTab,1,"T�m d� �o�n cu�i c�ng c�a ta/seefinalforecast");
	end;
	Say("Ch�c m�ng ��i � �o�t c�p th� gi�i 2006 � ��c! Ch�c m�ng c�c c� ��ng vi�n c�a ��i �, c� ��ng vi�n c�a ��i kh�c c�ng ��ng bu�n, 4 n�m sau ch�ng ta l�i g�p nhau � c�p th� gi�i 2010 � Nam Phi.",getn(selTab),selTab);
end;
--===============================================================================================
--===============================================================================================
function getaward()
	local selTab = {
			"L�nh ph�n th��ng t�ch l�y/#getweekaward(0)",
			"L�nh ph�n th��ng d� �o�n k�t qu� chung cu�c/getfinalaward",
			"Ta s� l�nh sau/main"
			}
	Say("Ho�t ��ng l�n n�y chu�n b� cho b�n nh�ng gi�i th��ng phong ph�, b�n mu�n l�nh ph�n th��ng n�o?",getn(selTab),selTab);
end;

function getweekaward(nType)
	local nAnswerCount,nRightAnswerCount = 0,0;
	local nForecastCount,nRightForecastCount = 0,0;
	if nType == 0 then
		local selTab = {
				"Nh�n ph�n th��ng t�ch l�y tr� l�i c�u h�i/#getweekaward(1)",
				"Ta s� l�nh sau/main",
				}
		Say("B�n mu�n l�nh ph�n th��ng t�ch l�y n�o?",getn(selTab),selTab);
	elseif nType == 1 then
		local nWeekTag = GetTask(AWARD_WEEK1);
		if nWeekTag < 0 or nWeekTag > 4 then
			Talk(1,"main","Xin l�i! H� th�ng b�o l�i, xin li�n h� ph�c v� kh�ch h�ng.");
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]: L�i tr� GetTask(AWARD_WEEK1), AWARD_WEEK1 l�:"..AWARD_WEEK1..". Tr� b�o l�i:"..nWeekTag);
			return 0;			
		end;
		if nWeekTag == WEEK1 then
			Talk(1,"main","Giai �o�n ��u (25 th�ng 6 ��n 10 th�ng 7) Ph�n th��ng t�ch l�y tr� l�i c�u h�i c�a ��i hi�p �� nh�n ��, xin ng��i h�y ti�p t�c tham gia ch� l�n ph�t th��ng sau.");
			return 0;
		end;
		nAnswerCount,nRightAnswerCount = get_answer_result();
		if nAnswerCount == 9999 then	--��ʾʱ��δ��
			Talk(1,"getaward","Xin l�i! Ch�a ��n th�i gian ph�t th��ng, tu�n sau m�i ph�t th��ng, b�n h�y ch� � theo d�i");
			return 0;
		end;
		if nAnswerCount == 0 then
			Talk(1,"","Xin l�i! Giai �o�n ��u (25 th�ng 6 ��n 10 th�ng 7) ��i hi�p kh�ng c� tham gia ho�t ��ng tr� l�i c�u h�i, kh�ng th� nh�n ph�n th��ng.");
			return 0;
		end;
		local selTab = {
				"Ta mu�n l�nh ngay/#getweekaward_confirm(1,"..nRightAnswerCount..")",
				"Ta s� quay l�i sau/nothing",
				}
		if nRightAnswerCount == 0 then
			Talk(1,"main","Giai �o�n ��u (25 th�ng 6 ��n 10 th�ng 7) ��i hi�p tr� l�i t�ng c�ng c�u h�i c�a <color=yellow>"..nAnswerCount.."<color> ng�y. B�n �� ��p sai ho�n to�n, hy v�ng l�n sau may m�n h�n.");
			return 0;
		end;
		Say("Giai �o�n ��u (25 th�ng 6 ��n 10 th�ng 7) ��i hi�p tr� l�i t�ng c�ng c�u h�i c�a <color=yellow>"..nAnswerCount.."ng�y, trong �� ��p ��ng <color=yellow>"..nRightAnswerCount.."<color> ng�y, nh�n ���c ph�n th��ng <color=red>"..nRightAnswerCount.."<color>, tr��c khi l�nh th��ng x�c nh�n h�nh trang c�n ch� tr�ng v� s�c l�c, tr�nh t�n th�t ngo�i � mu�n, Kh�ch quan mu�n l�nh ph�n th��ng ngay b�y gi�?",getn(selTab),selTab);
	elseif nType == 2 then
		local nWeekTag = GetTask(AWARD_WEEK2);
		if nWeekTag < 0 or nWeekTag > 2 then
			Talk(1,"main","Xin l�i! H� th�ng b�o l�i, xin li�n h� ph�c v� kh�ch h�ng.");
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]: L�i tr� s� GetTask(AWARD_WEEK2), tr� s� AWARD_WEEK2:"..AWARD_WEEK2..". Tr� b�o l�i:"..nWeekTag);
			return 0;			
		end;
		if nWeekTag == WEEK2 then
			Talk(1,"main","Tu�n tr��c (16 th�ng 6 ��n 23 th�ng 6) ��i hi�p �� nh�n ph�n th��ng t�ch l�y d� �o�n k�t qu� thi ��u, b�n h�y ti�p t�c tham gia v� ch� l�n ph�t th��ng sau.");
			return 0;
		end;
		nForecastCount,nRightForecastCount = get_forecast_result();
		if nForecastCount == 9999 then
			Talk(1,"getaward","Xin l�i! Ch�a ��n th�i gian ph�t th��ng, tu�n sau m�i ph�t th��ng, b�n h�y ch� � theo d�i");
			return 0;	--��ʾʱ��δ��
		end;
		if nForecastCount == 0 then
			Talk(1,"","Xin l�i! Tu�n tr��c (16 th�ng 6 ��n 23 th�ng 6) b�n kh�ng tham gia d� �o�n k�t qu� thi ��u, kh�ng th� nh�n ph�n th��ng.");
			return 0;		
		end;
		local selTab = {
				"Ta mu�n l�nh ngay/#getweekaward_confirm(2,"..nRightForecastCount..")",
				"Ta s� quay l�i sau/nothing",
				}
		if nRightForecastCount == 0 then
			Talk(1,"main","Tu�n tr��c (16 th�ng 6 ��n 23 th�ng 6) ��i hi�p �� d� �o�n t�ng c�ng k�t qu� thi ��u c�a <color=yellow>"..nForecastCount.."<color> ng�y, ng��i �� d� �o�n sai, hy v�ng l�n sau s� may m�n h�n.");
			return 0;
		end;
		Say("Tu�n tr��c (16 th�ng 6 ��n 23 th�ng 6) ��i hi�p �� d� �o�n t�ng c�ng k�t qu� thi ��u c�a <color=yellow>"..nForecastCount.."<color> ng�y, trong �� d� �o�n ��ng <color=yellow>"..nRightForecastCount.."<color> ng�y, nh�n ���c ph�n th��ng <color=red>"..nRightForecastCount.."<color>, tr��c khi l�nh th��ng x�c nh�n h�nh trang c�n ch� tr�ng v� s�c l�c, tr�nh t�n th�t ngo�i � mu�n, Kh�ch quan mu�n l�nh ph�n th��ng ngay b�y gi�?",getn(selTab),selTab);
	end;
end;

tWeapon = {
	{"V�n Nh�n ch�a gi�m ��nh",2,1,375},
	{"H�a Tinh ch�a gi�m ��nh",2,1,376},
	{"Li�t Di�m ch�a gi�m ��nh",2,1,377},
	{"M�n Thi�n Hoa V� ch�a gi�m ��nh",2,1,378},
	{"C� ��nh ch�a gi�m ��nh",2,1,379},
	{"Hi Nh�n C�m ch�a gi�m ��nh",2,1,380},
	{"Th�n H�nh ch�a gi�m ��nh",2,1,381},
	{"A La H�n Tr��ng ch�a gi�m ��nh",2,1,382},
	{"��i H�o L�i Th��ng ch�a gi�m ��nh",2,1,383},
	{"Th�n Cung ch�a gi�m ��nh",2,1,384},
	{"M�nh H� ch�a gi�m ��nh",2,1,385},
	{"L�ng Phong ch�a gi�m ��nh",2,1,386},
}

function getweekaward_confirm(nType,nCount)
	if nType == 1 then
		local nRow = tonumber(tabLVEXP:selectRowNum("C�p",GetLevel()+1))
		local nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghi�m ��ng c�p nh�n v�t"))
		if nExp < 0 or nExp > 986241823 then	--��С��0�������92�����辭��Ϊ�쳣
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Tr� s� �i�m kinh nghi�m ph�n th��ng nh�n ���c d� th��ng, tr� s� l�:"..nExp);
			return 0;
		end;
		SetTask(AWARD_WEEK1,WEEK1);
		ModifyExp(floor(nExp/100)*nCount);
		Msg2Player("B�n nh�n ���c "..nCount.."% kinh nghi�m");
		if AddItem(2,0,398,nCount) == 1 then
			Msg2Player("B�n nh�n ���c "..nCount.."h�t gi�ng c�y Th�i H� B�t Nh�");
		end;
		if AddItem(1,0,32,3*nCount) == 1 then
			Msg2Player("B�n nh�n ���c "..3*nCount.." C�u Chuy�n Ho�n H�n ��n");
		end;
		WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."T�i c�p th� gi�i tu�n th�"..WEEK1.."nh�n ���c ph�n th��ng t�ch l�y tr� l�i c�u h�i. S� l��ng ph�n th��ng l�"..nCount..".");
		Talk(1,"main","��y l� ph�n th��ng t�ch l�y tr� l�i c�u h�i! Xin h�y nh�n l�y.");
	else
		SetTask(AWARD_WEEK2,WEEK2);
		Earn(200000*nCount);
		if AddItem(2,2,8,5*nCount) == 1 then
			Msg2Player("B�n nh�n ���c "..5*nCount.."Thi�n th�ch");
		end;
		if GetLevel() >= 75 then
			for i=1,nCount do
				local nWeaponIndex = random(1,getn(tWeapon));
				if AddItem(tWeapon[nWeaponIndex][2],tWeapon[nWeaponIndex][3],tWeapon[nWeaponIndex][4],1) == 1 then
					Msg2Player("B�n nh�n ���c 1 m�n v� kh�:"..tWeapon[nWeaponIndex][1]);
				end;
			end;	
		end;
		WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."T�i c�p th� gi�i tu�n th�"..WEEK2.."nh�n ���c ph�n th��ng t�ch l�y tr� l�i c�u h�i. S� l��ng ph�n th��ng l�"..nCount..".");
		Talk(1,"main","��y l� ph�n th��ng t�ch l�y d� �o�n b�ng ��! Xin h�y nh�n l�y.");
	end;
end;

function get_answer_result()	--���������Ҫ�ڰ汾���µ�ʱ�����
	local nDate = tonumber(date("%m%d"));
	local nAnswerCount,nRightAnswerCount = 0,0;
	local nAnswer = 0;
	if nDate < 714 then	--����ʱ���ҲҪ�ı䣬�´���626,���´���701,�����´���703,�������´���714
		return 9999;
	end;
	for i=16,31 do	--��һ�θ��º�Ӧ��Ϊ for i=8,15 do���ڶ��θ��º�Ӧ��Ϊ for i=16,23 do�������θ��º�Ӧ��Ϊ for i=24,31 do
		nAnswer = GetTask(ANSWER610+i-1);
		if nAnswer ~= 0 then
			if nAnswer == tMatchResult[i] then
				nRightAnswerCount = nRightAnswerCount + 1;
			end;
			nAnswerCount = nAnswerCount + 1;
		end;
	end;
	return nAnswerCount,nRightAnswerCount;
end;

function getfinalaward()
	if GetTask(AWARD_FINAL) == 1 then
		Talk(1,"getaward","Xin l�i! Ng��i �� nh�n ph�n th��ng cu�i c�ng r�i.");
		return 0;
	end;
	if GetTask(AWARD_FINAL) == 2 then
		local selTab = {
					"Ta mu�n l�nh ngay/get_worldcup_ring",
					"Ta s� quay l�i sau/nothing",
					}
		Say("��i L�c Th�n H�ng Li�n c�a ��i hi�p �� l�m xong, b�y gi� ng��i mu�n l�nh?",getn(selTab),selTab);
		return 0;
	end;
	local nDate = tonumber(date("%m%d"));
	if nDate <= 713 then
		Talk(1,"getaward","Xin l�i! Ch�a ��n th�i gian ph�t th��ng, ph�n th��ng n�y s� ph�t v�o ng�y <color=yellow>14 th�ng 7<color>, xin b�n ch� �.");
		return 0;
	end;	
	if GetTask(TEAM4_1) == 0 and GetTask(TEAM2_1) == 0 and GetTask(TEAM_CHAMPION) == 0 then
		Talk(1,"getaward","Xin l�i! ��i hi�p kh�ng c� tham gia ho�t ��ng d� �o�n k�t qu�, kh�ng th� nh�n ph�n th��ng.");
		return 0;
	end;
	local sContent = "B�n �� tham d� "
	local tTable = {
			{"","<color=yellow>D� �o�n 4 ��i cu�i c�ng<color>,",""},
			{"","<color=yellow>D� �o�n ��i v�o chung k�t<color>,",""},
			{"","<color=yellow>D� �o�n ��i v� ��ch<color>,",""},
			}
	local tAward = {
			{"","<color=yellow>1 quy�n m�t t�ch s� m�n<color>,",""},
			{"","<color=yellow>1 quy�n s� tay ch� t�o v� kh�<color>,",""},
			{"","<color=yellow>1 b� trang ph�c ��i b�ng v� ��ch<color>,",""},
			}
	local nResult1 = judge_team4();
	local nResult2 = judge_team2();
	local nResult3 = judge_team_champion();
	if nResult1 == 3 and nResult2 == 3 and nResult3 == 3 then
		Talk(1,"getaward","<color=green>��a b�<color>:"..sContent..tTable[1][nResult1-1]..tTable[2][nResult2-1]..tTable[3][nResult3-1].."K�t qu� b�n d� �o�n �� sai, hy v�ng b�n s� may m�n h�n.");
		return 0;
	elseif nResult1 == 2 or nResult2 == 2 or nResult3 == 2 then
		local selTab = {
				"Ta mu�n l�nh ngay/givefinalaward",
				"Ta s� quay l�i sau/nothing",
				}
		local sBigPrize = "";
		if nResult1 == 2 and nResult2 == 2 and nResult3 == 2 then
			sBigPrize = "Ngo�i ra, do b�n d� �o�n ��ng 3 l�n, b�n c�n nh�n ���c ph�n th��ng ��c bi�t: <color=yellow>1 s�i ��i L�c Th�n H�ng Li�n<color>.";
		end;
		local sMiJi = "";
		if nResult1 == 2 then
			sMiJi = "<color=red> Ch� �: Nh�n v�t ��ng c�p d��i 50 ho�c ch�a theo tr��ng ph�i s� kh�ng nh�n ���c m�t t�ch s� m�n<color>.";
		end;
		Say("B�n d� �o�n,"..tTable[1][nResult1]..tTable[2][nResult2]..tTable[3][nResult3].."l� ch�nh x�c, ph�n th��ng c�a b�n l�:"..tAward[1][nResult1]..tAward[2][nResult2]..tAward[3][nResult3]..sBigPrize.."B�y gi� ph�t ph�n th��ng cho b�n"..sMiJi.."Xin x�c nh�n h�nh trang c�n ch� tr�ng",getn(selTab),selTab);
	else
		Talk(1,"","Xin l�i! D� �o�n c�a b�n kh�ng ch�nh x�c, kh�ng th� nh�n ph�n th��ng.");
	end;
end;

function givefinalaward()
	local nResult1 = judge_team4();
	local nResult2 = judge_team2();
	local nResult3 = judge_team_champion();
	local nRetCode = 0;
	SetTask(AWARD_FINAL,1);
	if nResult1 == 2 then
		if GetLevel() < 50 then
			nRetCode = AddItem(0,107,random(59,60),1,1);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch");
			else
				WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(0,107,random(59,60),1,1) tr� quay l�i l�:"..nRetCode);
			end;
			WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c quy�n m�t t�ch (Ph�n th��ng c�a ��ng c�p nh� h�n 50)");
		else
			local nPlayerRoute = GetPlayerRoute();
			if nPlayerRoute == 2 then	--����
				give_book({0,107,1},{0,107,2});
			elseif nPlayerRoute == 3 then	--��ɮ
				give_book({0,107,5},{0,107,6});
			elseif nPlayerRoute == 4 then	--��ɮ
				give_book({0,107,3},{0,107,4});
			elseif nPlayerRoute == 6 then 	--����
				give_book({0,107,7},{0,107,8});
			elseif nPlayerRoute == 8 then	--FMM
				give_book({0,107,9},{0,107,10});
			elseif nPlayerRoute == 9 then	--QMM
				give_book({0,107,11},{0,107,12});
			elseif nPlayerRoute == 11 then	--����
				give_book({0,107,13},{0,107,14});
			elseif nPlayerRoute == 12 then	--����
				give_book({0,107,15},{0,107,16});
			elseif nPlayerRoute == 14 then	--���
				give_book({0,107,17},{0,107,18});
			elseif nPlayerRoute == 15 then	--����
				give_book({0,107,19},{0,107,20});
			elseif nPlayerRoute == 17 then	--��ǹ
				give_book({0,107,21},{0,107,22});
			elseif nPlayerRoute == 18 then	--�
				give_book({0,107,23},{0,107,24});
			elseif nPlayerRoute == 20 then	--а��
				give_book({0,107,25},{0,107,26});
			elseif nPlayerRoute == 21 then	--��ʦ
				give_book({0,107,27},{0,107,28});
			else
				nRetCode = AddItem(0,107,66,1,1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 quy�n Ni�m Y Ph�");
				else
					WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(0,107,66,1,1) tr� quay l�i l�:"..nRetCode);
				end;
				WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c 1 quy�n Ni�m Y Ph�, ���ng m�n ph�i ng��i ch�i theo l�:"..nPlayerRoute);			
			end;
		end;
	end;
	if nResult2 == 2 then
		nRetCode = AddItem(2,0,397,1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 quy�n s� tay ch� t�o v� kh�");
		else
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(2,0,397,1) tr� quay l�i l�:"..nRetCode);
		end;
		WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c 1 quy�n s� tay ch� t�o v� kh�");
	end;
	if nResult3 == 2 then
		local nBodyType = GetBody();
		if nBodyType == 1 then
			nRetCode = AddItem(0,109,149,1);
		elseif nBodyType == 2 then
			nRetCode = AddItem(0,109,150,1);
		elseif nBodyType == 3 then
			nRetCode = AddItem(0,109,151,1);
		else
			nRetCode = AddItem(0,109,152,1);
		end
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 b� trang ph�c ��i b�ng v� ��ch");
		else
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(trang ph�c ��i b�ng v� ��ch,1) tr� quay l�i l�:"..nRetCode);
		end;
		WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."B�n nh�n ���c 1 b� trang ph�c ��i b�ng v� ��ch");
	end;
	if nResult1 == 2 and nResult2 == 2 and nResult3 == 2 then
		nRetCode = AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 s�i ��i L�c Th�n H�ng Li�n");
		else
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(��i L�c Th�n H�ng Li�n,1) tr� quay l�i l�:"..nRetCode);
		end;
		WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c 1 s�i ��i L�c Th�n H�ng Li�n");	
	end;
	Talk(1,"main","��y l� ph�n th��ng cu�i c�ng c�a ��i hi�p, h�y nh�n l�y.");
end;

function give_book(tBook1,tBook2)
	local nRetCode = 0;
	if random(1,2) == 1 then
		nRetCode = AddItem(tBook1[1],tBook1[2],tBook1[3],1,1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch");
			WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c quy�n m�t t�ch");
		else
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Trong h�m s� give_book tr� quay l�i AddItem l�:"..nRetCode);
		end;
	else
		nRetCode = AddItem(tBook2[1],tBook2[2],tBook2[3],1,1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch");
			WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c quy�n m�t t�ch");
		else
			WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Trong h�m s� give_book tr� quay l�i AddItem l�:"..nRetCode);
		end;
	end;
end;

function judge_team4()
	if GetTask(TEAM4_1) == 0 then
		return 1;	--��ʾû�μӹ�Ԥ��
	end;
	for i=TEAM4_1,TEAM4_4 do
		for j=1,4 do
			if GetTask(i) == tTeam4Result[j] then
				break;
			else
				if j == 4 then
					return 3;	--��ʾû����ȫԤ���
				end;
			end;
		end;
	end;
	return 2;	--��ʾԤ��ȫ��
end;

function judge_team2()
	if GetTask(TEAM2_1) == 0 then
		return 1;
	end;
	for i=TEAM2_1,TEAM2_2 do
		for j=1,2 do
			if GetTask(i) == tTeam2Result[j] then
				break;
			else
				if j == 2 then
					return 3;
				end;
			end;
		end;
	end;
	return 2;
end;

function judge_team_champion()
	if GetTask(TEAM_CHAMPION) == 0 then
		return 1;
	end;
	if GetTask(TEAM_CHAMPION) ~= nTeamChampion then
		return 3;
	else
		return 2;
	end;
end;
--===============================================================================================
--===============================================================================================
function checktime()
	local nHour = tonumber(date("%H"));
	if nHour >= 12 and nHour < 21 then	--����12��������9��ش������Ԥ�����ʱ��
		return 1;
	else
		return 1;
	end;
end;

function confirm()
	Talk(1,"main","C�m �n ��i hi�p �� tham gia, xin ti�p t�c theo d�i c�p th� gi�i, VLTK 2 s� c�ng b�n t�n h��ng ni�m vui n�y.");
end;

function knowdetail()
	local selTab = {
			"L�m sao tr� l�i c�u h�i?/howtoanswer",
			"L�m sao d� �o�n c�u h�i?/howtoforecast",
			"L�m sao nh�n ph�n th��ng?/howtogetaward",
			"Ta �� hi�u r�i/main",
			}
	Say("��i hi�p c� g� kh�ng hi�u xin c� h�i ch�u!",getn(selTab),selTab);
end;

function howtoanswer()
	Talk(1,"knowdetail","<color=yellow>M�i ng�y t� 12 gi� tr�a ��n 9 gi� t�i<color>, ng��i c� th� ��n ��y tr� l�i t�nh h�nh c�p th� gi�i t�i qua v� r�ng s�ng nay, ng��i ch� c�n c�n c� k�t qu� thi ��u ch�n c�u tr� l�i ch�nh x�c, ho�t ��ng tr� l�i c�u h�i k�o d�i ��n khi c�p th� gi�i k�t th�c.");
end;

function howtoforecast()
	Talk(3,"knowdetail","<color=yellow>M�i ng�y t� 12 gi� tr�a ��n 9 gi� t�i<color>, ng��i c� th� ��n ��y d� �o�n k�t qu� thi ��u b�ng �� t�i nay v� r�ng s�ng mai, c�n c� v�o kinh nghi�m v� tr�c gi�c �� ch�n, ch�u s� ghi l�i k�t qu� ng��i d� �o�n, sau m�t th�i gian ng��i c� th� ��n ��y nh�n ph�n th��ng.",
					"Ng��i c� th� ��n �� thay ��i l�a ch�n c�a m�nh tr��c 9 gi� t�i.",
					"Sau khi v�ng b�ng c�p th� gi�i k�t th�c, d� �o�n giai �o�n v�ng b�ng c�ng s� ch�m d�t, ng��i c� th� b�t ��u d� �o�n 4 ��i v�o b�n k�t, ��i h�ng 2 v� ��i v� ��ch, th�i gian d� �o�n ch�m d�t tr��c v�ng t� k�t, t�c 9 gi� ng�y 30 th�ng 6.");
end;

function howtogetaward()
	local selTab = {
	"Gi�i tham gia m�i ng�y/#awarddetail(1)",
	"Gi�i tr� l�i c�u h�i t�ch l�y/#awarddetail(2)",
	"Gi�i d� �o�n k�t qu� thi ��u t�ch l�y/#awarddetail(3)",
	"Gi�i d� �o�n 4 ��i v�o b�n k�t/#awarddetail(4)",
	"Gi�i d� �o�n ��i v�o chung k�t/#awarddetail(5)",
	"Gi�i d� �o�n ��i v� ��ch/#awarddetail(6)",
	"Gi�i ��c bi�t/#awarddetail(7)",
	"Ta hi�u r�i!/knowdetail",
	};
	Say("Gi�i th��ng ho�t ��ng n�y r�t phong ph�, ch� c�n tham gia l� c� th��ng. Gi�i th��ng chia l�m nhi�u d�ng: gi�i tham gia m�i ng�y, gi�i tr� l�i c�u h�i t�ch l�y, gi�i d� �o�n k�t qu� t�ch l�y, gi�i d� �o�n 4 ��i v�o b�n k�t, gi�i",getn(selTab),selTab);
end;

function awarddetail(nType)
	if nType == 1 then
		Talk(1,"howtogetaward","Gi�i tham gia m�i ng�y l� ph�n th��ng sau khi tr� l�i xong c�u h�i ho�c d� �o�n k�t qu� thi ��u ng��i c� th� l�nh, ph�n th��ng l� <color=yellow>1% �i�m kinh nghi�m v� 1 mi�ng Thi�n th�ch<color>.");
	elseif nType == 2 then
		Talk(1,"howtogetaward","Gi�i tr� l�i c�u h�i t�ch l�y s� l�nh ��nh k�, th��ng l� sau khi server b�o tr� v�o ng�y th� 2. Ng��i tr� l�i ��ng c�u h�i c�a m�y ng�y s� nh�n ph�n th��ng t��ng �ng, ph�n th��ng l� <color=yellow>1% �i�m kinh nghi�m, 1 h�t gi�ng Th�i H� B�t Nh� v� 3 C�u Chuy�n Ho�n H�n ��n<color>");
	elseif nType == 3 then
		Talk(1,"howtogetaward","Gi�i d� �o�n k�t qu� t�ch l�y s� l�nh ��nh k�, th��ng l� th� 2 sau khi server b�o tr�. Ng��i d� �o�n ��ng k�t qu� c�a m�y ng�y th� s� nh�n ph�n th��ng t��ng �ng, ph�n th��ng l� <color=yellow>20 ti�n v�ng, 5 thi�n th�ch v� 1 m�n v� kh� ng�u nhi�n (��ng c�p y�u c�u tr�n 75)<color>, ch� �: <color=red>n�u b�n �o�n ��ng nhi�u l�n s� ���c nhi�u v� kh� nh�ng n� s� �nh h��ng ��n s�c s�c l�c, h�y s�p x�p l�i h�nh trang r�i m�i nh�n th��ng.<color>");
	elseif nType == 4 then
		Talk(1,"howtogetaward","Gi�i d� �o�n 4 ��i v�o b�n k�t, ng��i c� th� ch�n 4 ��i trong 16 ��i m�nh �� l�m l�a ch�n cu�i c�ng. N�u d� �o�n ch�nh x�c, ng��i s� nh�n ���c ph�n th��ng <color=yellow>M�t t�ch s� m�n ho�c 1 quy�n T�m ph�p<color><color=red>(��ng c�p tr�n 50 v� �� v�o l�u ph�i)<color>.");
	elseif nType == 5 then
		Talk(1,"howtogetaward","Gi�i d� �o�n ��i v�o chung k�t, ng��i c� th� ch�n 2 trong s� 16 ��i l�m l�a ch�n cu�i c�ng. N�u nh� d� �o�n ch�nh x�c, ng��i s� nh�n ���c <color=yellow>1 quy�n s� tay ch� t�o v� kh�<color>.");
	elseif nType == 6 then
		Talk(1,"howtogetaward","Gi�i d� �o�n ��i v� ��ch, ng��i c� th� ch�n 1 trong 16 ��i �� l�m l�a ch�n cu�i c�ng. N�u d� �o�n ch�nh x�c, ng��i s� nh�n ���c <color=yellow>1 b� trang ph�c ��i v� ��ch<color>.");
	elseif nType == 7 then
		Talk(1,"howtogetaward","Khi 4 ��i ng��i d� �o�n v�o b�n k�t, ��i v�o chung k�t v� ��i v� ��ch ��u ��ng, ng��i s� nh�n ���c gi�i th��ng ��c bi�t.");
	end;
end;

function seefinalforecast()
	local str1,str2,str3 = "","","";
	if GetTask(TEAM4_4) == 0 then
		str1 = "B�n ch�a d� �o�n ho�c ch�a ch�n xong 4 ��i m�nh";
	else
		str1 = "B�n d� �o�n ��i h�ng 4 l�: <color=yellow>"..tTeam16[GetTask(TEAM4_1)]..","..tTeam16[GetTask(TEAM4_2)]..","..tTeam16[GetTask(TEAM4_3)]..","..tTeam16[GetTask(TEAM4_4)].."<color>";
	end;
	if GetTask(TEAM2_2) == 0 then
		str2 = "B�n ch�a d� �o�n ho�c ch�a ch�n xong ��i v�o chung k�t";
	else
		str2 = "B�n d� �o�n ��i v�o chung k�t: <color=yellow>"..tTeam16[GetTask(TEAM2_1)]..","..tTeam16[GetTask(TEAM2_2)].."<color>";
	end;
	if GetTask(TEAM_CHAMPION) == 0 then
		str3 = "B�n kh�ng d� �o�n ��i v� ��ch";
	else
		str3 = "B�n d� �o�n ��i v� ��ch l�: <color=yellow>"..tTeam16[GetTask(TEAM_CHAMPION)].."<color>";
	end;
	Talk(1,"main","<color=green>��a b�<color>:<enter>"..str1.."<enter>"..str2.."<enter>"..str3);
end;

function nothing()

end;

function get_worldcup_ring()
	SetTask(AWARD_FINAL,1);
	local nRetCode = AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 s�i ��i L�c Th�n H�ng Li�n");
	else
		WriteLog("[L�i h�i ��p c�p th� gi�i c� th��ng]:"..GetName().."AddItem(��i L�c Th�n H�ng Li�n,1) tr� quay l�i l�:"..nRetCode);
	end;
	WriteLog("[H�i ��p c�p th� gi�i c� th��ng]:"..GetName().."Nh�n ���c 1 s�i ��i L�c Th�n H�ng Li�n");	
end;