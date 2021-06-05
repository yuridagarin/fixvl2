--��ٽű�
--append by lizhi
--2005-10-14 22:52

Include("\\script\\global\\qingzhu_switch.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\voz\\xacthuc\\xacthuc.lua");

TASK_BUCHANG = 1781

function main()
	--Say("<color=green>���<color>������û�ж���������ȡŶ��",0);
	
	local nDate;
	nDate = tonumber(date("%Y%m%d%H"));
	
	local SayTable = {};
	local nCount = 3;
	SayTable[1] = "Nh�n trang b� Tr��ng Kh�ng./RequestChangKongCloth";
	SayTable[2] = "Nh�n ph�o hoa./RequestYanHuo";
	SayTable[3] = "Nh�n ph�n th��ng ch�ng gi�c Man/RequestWeekEnd";
	
	
	if nDate >= 2006011909 and nDate < 2006020207 then
		nCount = nCount + 1;
		SayTable[nCount] = "Nh�n b� trang b� n�m m�i/RequestNewYearCloth";
	end;
	
	if nDate > 2006012000 and nDate < 2006020600 then
		nCount = nCount + 1;
		SayTable[nCount] = "Nh�n bao l� x� n�m m�i/RequestNewYearPresent";
	end;

	if nDate > 2006012409 and nDate < 2006022307 then
		nCount = nCount + 1;
		SayTable[nCount] = "Nh�n trang b� ���c t�ng khi n�p ti�n b�ng th� ng�n h�ng/RequestClothByBank"
	end;
	
	if nDate >= 2006020900 and nDate < 2006021400 then
		nCount = nCount + 1;
		SayTable[nCount] = "Nh�n danh hi�u Ti�u Dao V�n Kh�c Tinh/RequestXiaoYaoTitle"
	end

	SayTable[nCount + 1] = "K�t th�c ��i tho�i/no";
	local szXacThuc ="T�i kho�n c�a b�n ch�a x�c th�c";
	
	if CheckXacThuc() == 1 then
		szXacThuc="T�i kho�n c�a b�n �� x�c th�c";
	end
	Say("N�m m�i ��n ch��ng m�n Kim S�n quy�t ��nh ban ph�t m�t s� qu� �� m�i ng��i �n T�t vui v�!\n".. szXacThuc,
		nCount + 1,
		SayTable
	);
end;

function RequestYanHuo()

	if QINGZHU_20W == 1 and GetTask(TASK_QINGZHU) < 3 then
		qingzhu();
	else
		Talk(1,"","Xin l�i! M�i ng��i ch� ���c l�nh m�t l�n!");
	end;
end;	
		

function qingzhu()
	local szSay1 = {
		"�� t�ng kh�ng kh� n�o nhi�t, Minh Ch� Kim S�n nh� ta ph�t ph�o hoa cho m�i ng��i, ch� c�n c�p 10 tr� l�n l� c� th� nh�n ���c 3 ph�o hoa.",
		"Nh�n ph�o hoa./begin"
	};
	local szSay2 = {
		"�� t�ng kh�ng kh� n�o nhi�t, Minh Ch� Kim S�n nh� ta ph�t ph�o hoa cho m�i ng��i, ch� c�n c�p 10 tr� l�n l� c� th� nh�n ���c 3 ph�o hoa.",
		"K�t th�c ��i tho�i/no"
	};
	if GetLevel() >= 10 then
		SelectSay(szSay1);
	else
		SelectSay(szSay2);
	end;
end;

--��Ļ���	2	1	191
--��Ļ���	2	1	192
--��Ļ���	2	1	193
--�����̻�	2	1	194

function begin()
	local szTalk = {
		"N�o h�y c�ng nhau ��t ph�o ch�c m�ng!"
	};
	local nRetCode = 0;
	
	if GetTask(TASK_QINGZHU) == 0 then
		nRetCode = GiveYanhuo(0);
	elseif GetTask(TASK_QINGZHU) == 1 then
		nRetCode = GiveYanhuo(1);
	elseif GetTask(TASK_QINGZHU) == 2 then
		nRetCode = GiveYanhuo(2);
	end;
	if nRetCode == 1 then
		TalkEx("", szTalk);
	end;
end;

function GiveYanhuo(value)
	local szNot = {
		"Xin l�i! Kh�ng �� kho�ng tr�ng trong h�nh trang! S�p x�p l�i r�i h�y ��n t�m ta!"
	};
	local nRetCode = 0;
	if value == 0 then
		nRetCode = AddItem(2,1,189,-1,1); 	--��ɫ�̻�
		if nRetCode ~= 1 then	--û�гɹ����
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 1);
			return GiveYanhuo(1)
		end;
	elseif value == 1 then
		nRetCode = AddItem(2,1,190,-1,1);	--��ɫ�̻�
		if nRetCode ~= 1 then	--û�гɹ����
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 2);
			return GiveYanhuo(2)
		end;
	elseif value == 2 then
		--�������̻��漴��һ��
		local yh_table = {
			{2, 1, 191},
			{2, 1, 192},
			{2, 1, 193},
			{2, 1, 194}
		};
		local nCount = getn(yh_table);
		local nIndex = random(1, nCount);
		nRetCode = AddItem(yh_table[nIndex][1], yh_table[nIndex][2], yh_table[nIndex][3],-1,1);
		if nRetCode ~= 1 then	--û�гɹ����
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 3);	--ȫ����ȡ���
			return 1
		end;
	end;
end;

function no()
end;

function RequestClothByBank()
	if GetExtPoint(3) >= 2 then
		Say("Th�i gian c� hi�u l�c khi n�p ti�n b�ng th� ng�n h�ng �� nh�n ���c trang b� l� <color=yellow>9:00 s�ng ng�y 24 th�ng 1 ��n 9:00 s�ng ng�y 14 th�ng 2<color>. Th�i gian l�nh th��ng l� <color=yellow>9:00 ng�y 24 th�ng 1 ��n ng�y b�o tr� 23 th�ng 2<color>. H�y ki�m tra l�i kho�ng tr�ng v� s�c l�c c�a h�nh trang!",
			2,
			"L�nh th��ng/GetClothByBank",
			"��i ta ki�m tra l�i!/no"
		);
	else
		Say("Xin l�i! �� h�t th�i gian nh�n trang b� khi n�p ti�n b�ng th� ng�n h�ng!", 0);
	end;
end;

function GetClothByBank()
	if GetExtPoint(3) >= 2 then
		PayExtPoint(3, 2);
	end;
end;

function RequestChangKongCloth()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","Ch�a gia nh�p m�n ph�i, t�m th�i kh�ng nh�n ���c trang b� Tr��ng Kh�ng.!");
		return
	end;
	
	if (GetExtPoint(4) >= 32768) then	
		Talk(1,"","D� li�u c� nh�n c� ch�t kh�c th��ng! Vui l�ng li�n h� nh� cung c�p!");
		
	elseif (GetExtPoint(4) >= 1)then
		Say("<color=yellow>Tr��ng Kh�ng ��i hi�p<color> nh� ta t�ng m�n trang b�, ng��i mu�n nh�n kh�ng?",
				2,
				"Nh�n trang b� Tr��ng Kh�ng./changkongcloth",
				"Kh�ng! L�n sau �i!/no");
	else
		Talk(1,"","<color=yellow>Tr��ng Kh�ng ��i hi�p<color> ch�?�� l�i trang b� cho ng��i.");
	end;
end;

				
function changkongcloth()		
	PayExtPoint(4,1);
end;

--�������
function RequestLuckyBag()

		Talk(1,"","Ho�t ��ng n�p th� t�ng l� x� �� k�t th�c v�o <color=yellow>19 th�ng 12 n�m 2005<color>.");
		return
end;

function RequestWeekEnd()

local szSay = {
			"��i T�ng s� ghi nh� c�ng tr�ng ��nh �u�i gi�c Man c�a <sex>, gi� mu�n xem m�c g�?",
			"Ta mu�n nh�n th� lao/get_award",
			"Ta mu�n xem c�ng lao/query_offer"};
			
	if CheckTime(5) == 1 or CheckTime(6) == 1 or CheckTime(0) == 1 then	--��ĩ��ʱ����л
		SelectSay(szSay);
	else
		Talk(1,"","Xin l�i! Trong th�i gian di�n ra ho�t ��ng m�i c� th� nh�n th��ng!");
	end;
end;

--��ת�ػ굤(1,0,32)

function RedeemAccountBlock()

	if PlayerIndex <= 0 then
		return
	end;
	if GetCreateTime() > 1135785775 then
		local szTalk = {
			"Xin l�i! Nh�n v�t m�i t�o kh�ng th� nh�n b�i th��ng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	nDate = tonumber(date("%Y%m%d"));
	if nDate < 20051229 or nDate > 20060109 then
		local szTalk = {
			"Xin l�i! Th�i gian nh�n b�i th��ng �� h�t!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	if GetLevel() < 10 or GetExtPoint(0) == 0 then
		local szTalk = {
			"Xin l�i! Nh�n v�t c�p 10 tr� l�n n�p th� m�i nh�n ���c b�i th��ng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	local nTask = GetTask(TASK_BUCHANG);
	if nTask >= 6 then
		local szTalk = {
			"�a t� <sex> �� nh�n ch�t l�ng th�nh c�a ta!"
		}
		TalkEx("", szTalk);
		return
	end;
	
	local n = 6 - nTask;
	if nTask >= 1 and nTask < 6 then
		local szSay = {
			"<sex> c� h�i l�ng v�i s� b� ��p n�y kh�ng?",
			"H�i l�ng/#OkRedeem("..n..")",
			"Kh�ng h�i l�ng/NoRedeem"
		};
		SelectSay(szSay);
		return
	end
	
	local szTalk = {
		"Minh Ch� Kim S�n c� n�i m�y ng�y nay g�y nhi�u c�n tr� cho ng��i khi h�nh hi�p giang h�. �� t� l�i, Minh ch� s� b�i th��ng 3 ng�y nh�n ��i �i�m kinh nghi�m. Th�i gian nh�n ��i b�t ��u t� 18:00 ng�y 31 th�ng 12 ��n 6:00 ng�y 4 th�ng 1. Th�i gian l�nh b�i th��ng b�t ��u t� h�m nay ��n 6:00 ng�y 9 th�ng 1.",
		"Ta t�ng ng��i tr��c 1 vi�n C�u Chuy�n Ho�n H�n ��n!",
		"Sau �� h�y ch�n 3 b� v�t ph�m ti�n d�ng!"
	};
	
	TalkEx("RedeemBlockNext", szTalk);
	do
		return
	end

	if PlayerIndex > 0 then
		-- 1132862405=2005��11��25���賿4��     1133279385=2005��11��30���賿0��
		if GetLastLoginTime() > 1132862405 and GetCreateTime() < 1133279385 then
			if GetTask(600) == 0 then
				local nLevel = GetLevel()
				if nLevel <= 50 then
					local nExp = nLevel * nLevel * 100
					if nExp < 10000 then
						nExp = 10000
					end
					ModifyExp(nExp)
				else
					ModifyExp(nLevel * 10000)
				end
				Talk(1, "", "Xin l�i! Ch�c �� g�y cho ng��i nhi�u phi�n ph�c. Ph�n �i�m kinh nghi�m n�y xin nh�n l�y. T� nay, n�u x�y ra s� c� n�o, tri�u ��nh s� ho�n to�n ch�u tr�ch nhi�m!")
			else
				Talk(1, "", "B�ng h�u �� nh�n b�i th��ng. T� nay, n�u c�n s� c�, tri�u ��nh s� ho�n to�n ch�u tr�ch nhi�m!")
			end
		else
			Talk(1, "", "D��ng nh� ng��i ch�a ch�u t�n h�i n�o. L�o phu kh�ng th� b�i th��ng cho ng��i!")
		end
		SetTask(600, 1)
	end
end

function RedeemBlockNext()
	local szSay = {
		"H�y x�c nh�n �� 5 � h�nh trang ch�a v�t ph�m v� s�c l�c 167!",
		"Nh�n b�i th��ng./GetRedeemBlock",
		"Vui l�ng s�p x�p l�i h�nh trang!/no"
	};
	SelectSay(szSay);
end;

--������	0	200	23
--����	0	200	24
--�׵۳�	0	200	25
--�̹Ÿ�	0	200	26
--֯Ů��	0	200	27
--��ũ��	0	200	28

function GetRedeemBlock()
	local szSay = {
		"H�y ch�n l�y v�t ph�m ho�ng kim th� 1!",
		"Cu�c C�ng C�ng/#GetRedeemItemOne(0)",
		"L�i Th�n �ao/#GetRedeemItemOne(1)",
		"Cu�c Vi�m ��/#GetRedeemItemOne(2)",
		"B�n C� ph�/#GetRedeemItemOne(3)",
		"Ch�c N� thoa/#GetRedeemItemOne(4)",
		"Cu�c Th�n N�ng/#GetRedeemItemOne(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemOne(nIndex)
	SetTaskTemp(240, nIndex);
	
	local szSay = {
		"H�y ch�n l�y v�t ph�m ho�ng kim th� 2!",
		"Cu�c C�ng C�ng/#GetRedeemItemTwo(0)",
		"L�i Th�n �ao/#GetRedeemItemTwo(1)",
		"Cu�c Vi�m ��/#GetRedeemItemTwo(2)",
		"B�n C� ph�/#GetRedeemItemTwo(3)",
		"Ch�c N� thoa/#GetRedeemItemTwo(4)",
		"Cu�c Th�n N�ng/#GetRedeemItemTwo(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemTwo(nIndex)
	SetTaskTemp(241, nIndex);
	
	local szSay = {
		"H�y ch�n l�y v�t ph�m ho�ng kim th� 3!",
		"Cu�c C�ng C�ng/#GetRedeemItemThree(0)",
		"L�i Th�n �ao/#GetRedeemItemThree(1)",
		"Cu�c Vi�m ��/#GetRedeemItemThree(2)",
		"B�n C� ph�/#GetRedeemItemThree(3)",
		"Ch�c N� thoa/#GetRedeemItemThree(4)",
		"Cu�c Th�n N�ng/#GetRedeemItemThree(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemThree(nIndex)
	SetTaskTemp(242, nIndex);
	
	ITEM_TABLE = {
		"Cu�c C�ng C�ng",
		"L�i Th�n �ao",
		"Cu�c Vi�m ��",
		"B�n C� ph�",
		"Ch�c N� thoa",
	    "Cu�c Th�n N�ng"
	};
	if GetTask(TASK_BUCHANG) == 0 then	--��û����ȡ��
		AddItem(1, 0, 32, 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(240), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(241), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(242), 1, 1);
		SetTask(TASK_BUCHANG, 1);
		WriteLog("#Ho�t ��ng b�i th��ng trong t�t Nguy�n ��n LOG: ["..GetAccount().."] ["..GetName().."] ["..date("%y%m%d").."]nh�n ���c 1 C�u Chuy�n, 1 ["..ITEM_TABLE[GetTaskTemp(240)+1].."], ["..ITEM_TABLE[GetTaskTemp(241)+1].."] v� 1 ["..ITEM_TABLE[GetTaskTemp(242)+1].."]");
	end;
	
	local szSay = {
		"<sex> c� h�i l�ng v�i s� b� ��p n�y kh�ng?",
		"H�i l�ng/#OkRedeem(5)",
		"Kh�ng h�i l�ng/NoRedeem"
	};
	SelectSay(szSay);
end

--�����̻�	2	1	194
function OkRedeem(nCount)
	local n = GetTask(TASK_BUCHANG);
	local szTalk = {
		"<sex> Xin �a t�!"
	};
	SetTask(TASK_BUCHANG, n + nCount);
	AddItem(2, 1, 194, nCount, 1);
end;

function NoRedeem()
	local nTask = GetTask(TASK_BUCHANG);
	
	if nTask >= 6 then
		return
	end;
	
	local szTalk = {
		"<sex> c�n ch�a h�i l�ng sao? Xin h�y nh�n l�y ph�o hoa cho ngu�i gi�n!"
	};
	TalkEx("NoRedeemNext", szTalk);
end;

function NoRedeemNext()
	local nTask = GetTask(TASK_BUCHANG);
	SetTask(TASK_BUCHANG, nTask + 1);
	AddItem(2, 1, 194, 1, 1);
end;

function RequestNewYearCloth()
	if GetExtPoint(5) > 0 then
		Say("Th�i gian ho�t ��ng n�p th� th�ng nh�n b� trang b� n�m m�i c� hi�u l�c t� <color=yellow>9:00 s�ng ng�y 17 th�ng 1 ��n 9:00 s�ng ng�y 26 th�ng 1<color>. Th�i gian l�nh th��ng c� hi�u l�c l� <color=yellow>9h:00 ng�y 19.01 ��n ng�y b�o tr� 2 th�ng 2<color>. H�y ki�m tra l�i h�nh trang v� s�c l�c!",
			2,
			"L�nh th��ng/GetNewYearCloth",
			"��i ta ki�m tra l�i!/no"
		);
	else
		Say("Xin l�i! �� h�t th�i gian nh�n trang b� khi n�p th� th�ng!", 0);
	end;
end;

function GetNewYearCloth()
	PayExtPoint(5, 1);
end;

--�����ʹ����(added by yanjun,06-01-10)
function RequestNewYearPresent()
	if GetLevel() < 10 then
		Say("<color=green>L� Quan<color>Xin l�i! Nh�n v�t c�p 10 tr� l�n m�i nh�n ���c bao l� x� n�m m�i!",0)
		return 0
	end
	Say("Ho�t ��ng t�ng l� x� n�m m�i k�t th�c v�o <color=yellow>5 th�ng 2 n�m 2006<color>. H�y ki�m tra l�i kho�ng tr�ng v� s�c l�c c�a h�nh trang!",
			2,
			"L�nh th��ng/GiveNYPresent",
			"��i ta ki�m tra l�i!/no");	
end

function GiveNYPresent()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TASK_GOT_LIBAO) ~= nDate then
		SetTask(TASK_GOT_LIBAO,0)
	end
	if GetTask(TASK_GOT_LIBAO) == 0 then
		if nDate == 20060128 or nDate == 20060129 then
			if AddItem(2,1,265,2) == 1 then	--�����
				WriteLog("[Ho�t ��ng m�a xu�n (l�nh l� x�)]:"..GetName().."�� nh�n 2 bao l� x� n�m m�i!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H�y nh�n l�y t�ng ph�m c�a ng��i!",0)
			end
		else
			if AddItem(2,1,265,1) == 1 then	--�����
				WriteLog("[Ho�t ��ng m�a xu�n (l�nh l� x�)]:"..GetName().."�� nh�n 1 bao l� x� n�m m�i!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H�y nh�n l�y t�ng ph�m c�a ng��i!",0)
			end		
		end
	else
		Say("Xin l�i! M�i ng�y ch� ���c l�nh m�t l�n!",0)
	end
end

function RequestXiaoYaoTitle()
	local PlayerTab = {}
	PlayerTab[1] = {"Ng��i l� quen thu�c","406087445"}
	PlayerTab[2] = {"Hi hi-ha ha ha","sutanqing"}
	PlayerTab[3] = {"Ph�t T�m Ph� ��","huanglei1204"}
	PlayerTab[4] = {"L�nh V�n T� Y�n","231238193"}
	PlayerTab[5] = {"*Ba La Hi�p*","cz_wangke"}
	PlayerTab[6] = {"B�c M� Khinh Ngh�","zhen2519"}
	PlayerTab[7] = {"Th�i C�c_T�y M�n Xuy Tuy�t","szh881028"}
	for i=1,getn(PlayerTab) do 
		if GetName() == PlayerTab[i][1] and GetAccount() == PlayerTab[i][2] then
			AddTitle(5,1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c danh hi�u Ti�u Dao V�n Kh�c Tinh!")
			WriteLog("[Ti�u Dao h�i]:"..GetName().."Nh�n ���c danh hi�u Ti�u Dao V�n Kh�c Tinh")
			return 1
		end
	end
	Say("Xin l�i! Ng��i kh�ng c� t�n trong danh s�ch nh�n th��ng!",0)
end
