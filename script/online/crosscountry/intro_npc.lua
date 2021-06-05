-- ԽҰ������NPC
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\crosscountry\\quarter_final.lua")

YY_FILE = new(KTabFile, "\\script\\online\\crosscountry\\intro_setting.txt")

-- ����˺��Ƿ�Ϊ4��ǰ�����ģ�2006������Ч
function chktime()
	-- Time in seconds since UTC 1/1/70
	local nBaseTimeGmt = 1150387200			-- 2006.6.16 00:00:00
	
	--nBaseTimeGmt������ʱ����
	local nBaseDay = 167					-- 2006.6.16 ����һ���еĵ�167��
	
	local nCurDay = tonumber(date("%j"))
	local nCurHour = tonumber(date("%H"))
	local nCurMin = tonumber(date("%M"))
	local nCurSec = tonumber(date("%S"))
	
	-- �������ں� nBaseTimeGmt ֮����˶�����
	local nDeffNowSec = nCurSec + nCurMin * 60 + nCurHour * 3600 + (nCurDay - nBaseDay) * 86400
	local n4DaySec = 345600					-- 4���ж�����
	
	local nCreateTime = GetCreateTime()
	-- ���㴴���˺ŵ�ʱ���BaseTimtGmt���˶�����
	local nDeffCreateSec = nCreateTime - nBaseTimeGmt
	
	if nDeffNowSec - nDeffCreateSec > n4DaySec then
		return 1
	else
		return 0
	end
end

function main()
	if YY_FILE:getRow() > 0 then
		main_yes()
	else
		main_no()
	end
end

function main_yes()		-- ��ԽҰ��������
	local szSay = "Tr�n b�n k�t thi ��u Vi�t D� �� k�t th�c<color=yellow><color>. Chung k�t s� di�n ra v�o tr�a 28/7 sau khi server b�o tr� ��n khi server thi ��u b�t ��u, k�o d�i ��n 30/7 tr��c khi server thi ��u b�o tr�. Chi ti�t xin xem trang ch�"
	Say(szSay, 0)
--	local t = 
--	{
--		--"�˽�Ԥ����ϸ���/game_info_yu",
--		"�˽ⳬ�����ԽҰ��/game_info_yes",
--		"��ȡԽҰ��Ԥ������/get_award_yu",
--		"����ս����ز���/qf_team_operation",
--		"��ȡ��������Ʒ�����ܸ�������/qf_get_award",
--		"�鿴ս������/qf_rank",
--		--"�������ֻ���/quarter_final_point_collect",
--		"�뿪/end_say",
--	}
--	Say(szSay, getn(t), t)
end

function game_info_yes()	--������ΪԽҰ����������
	local szSay = "Thi ��u Vi�t d� si�u c�p<color=yellow>Hi�n t�i �� v�o v�ng ��u lo�i<color>, nh�n v�o c�c h�ng m�c d��i ��y �� xem ch��ng tr�nh thi ��u, chi ti�t xin xem trang ch�"
	local t=
	{
		"Giai �o�n 1: b�o danh/sign_info",
		"\nGiai �o�n 2: v�ng lo�i\n\n/game_info_yu",
		"Giai �o�n 3: B�n k�t/game_info2",
		"Giai �o�n 4: chung k�t/game_info3",
		"Tin t�c kh�c./game_info4",
		"R�i kh�i/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info_yu()
	local szSay = "Th�i gian thi ��u: sau ��t b�o tr�, ng��i ch�i h�y ��ng nh�p v�o server ch� ��nh ti�n h�nh thi ��u k�o d�i ��n tr��c ��t b�o tr� l�n sau\n �i�u ki�n tham d�: t�t c� ng��i ch�i nh�n ���c t�i kho�n thi ��u v� �i�n ��y �� nh�ng th�ng tin c� nh�n \nH�nh th�c b�o danh: a. nh�n l�y t�i kho�n thi ��u t� c�c ti�m net, c�c tr��ng ��i h�c, c�c chi nh�nh c�a VNG b.v�o trang web ch�nh th�c nh�n l�y t�i kho�n thi ��u \n H�nh th�c thi ��u: t�ng c�p \n Ch� �: ng��i ch�i tham gia thi ��u kh�ng ph�i � c�c server ch� ��nh th� s� kh�ng ���c t�nh.\n b�n update tr� ch�i: ph�i l� b�n m�i nh�t\n khu v�c tham gia: b�t c� n�i n�o (ti�m net, tr��ng ��i h�c, gia ��nh vv...)"
	Say(szSay, 2, "Ti�p t�c t�m hi�u (server ch� ��nh)/game_info_yu_svr", "R�i kh�i/end_say")
end

function game_info_yu_svr()
	local szSay = "C�m server �i�n T�n tr�n 1: V�n Nam, Qu� Ch�u, T� Xuy�n, T�y T�ng, Thi�m T�y, Cam T�c, T�n C��ng\n C�m server �i�n T�n tr�n 2: H� B�c, Giang T�y, Chi�t Giang, Th��ng H�i, Giang T�, An Huy \n C�m server �i�n T�n tr�n 3: H� Nam, Ph�c Ki�n, Qu�ng ��ng, Qu�ng T�y, H�i Nam\n\n C�m server vi�n th�ng tr�n 1: B�c Kinh, Thi�n T�n, S�n T�y, S�n ��ng, T�n C��ng, H� Nam, H� B�c\n C�m server Vi�n Th�ng tr�n 2: Li�u Ninh, C�t L�m, H�c Long Giang, N�i M�ng, Thanh H�i."
	Say(szSay, 2, "Ti�p t�c t�m hi�u quy t�c./game_info_yu_guize", "R�i kh�i/end_say")
end

function game_info_yu_guize()
	local szSay = "1. Nghi�m c�m s� d�ng auto ho�c l�i d�ng l�i game (BUG), n�u ph�t hi�n s� h�y b� t� c�ch thi ��u\n2. Sau khi thi ��u k�t th�c, ch�ng t�i s� ch�n ra nh�ng nh�n v�t c� ��ng c�p cao nh�t trong server thi ��u �� trao th��ng (v� d�: m�t t�i kho�n c� 3 nh�n v�t c�p 12, c�p 60, c�p 47, ch�ng t�i s� ch�n nh�n v�t c�p 60 ti�n h�nh x�p h�ng)\n3.Sau khi server thi ��u m� ra, ng��i ch�i ph�i t� t�o nh�n v�t m�i, t�n, ch�n h�nh t��ng, m�n ph�i\n4.Trong khi thi ��u, c� th� nh� ng��i kh�c tr� gi�p\n5.M�c ��ng c�p l� 30\n6. Ng�y cu�c thi t�ng c�p k�t th�c s� chi�u theo ��ng c�p nh�n v�t h�m �� ti�n h�nh x�t ch�n qu�n qu�n m�n ph�i v� t�ng qu�n qu�n cho v�ng lo�i (n�u ��ng c�p b�ng nhau s� so s�nh tr� kinh nghi�m, n�u v�n b�ng nhau s� so s�nh �i�m danh v�ng)"
	Say(szSay, 2, "Tra xem ph�n th��ng./game_info_yu_award", "R�i kh�i/end_say")
end

function game_info_yu_award()
	local szSay = "1. B�t k� nh�n v�t n�o trong t�i kho�n thi ��u ��t ��n c�p 30 v� th�i gian t�o nh�n v�t �t nh�t 4 ng�y, ��u c� th� nh�n l�y ph�n th��ng: (1)1 ng�a h�ng m� hay ho�ng m� c�p 30; (2)1 trang b� s� m�n c�p 40; (3) th� luy�n qu� t� 1- 3 vi�n ; (4) 5 Thi�n th�ch. Th�i gian nh�n th��ng: t� v�ng lo�i ng�y 16/06 ��n tr�n b�n k�t ng�y 25/07, ��a �i�m nh�n th��ng: S� gi� vi�t d� � ba ��i th�nh th�\n2.Gi�i nh�t gi�nh cho ng��i ch�i ��t ��ng c�p cao nh�t c�a 7 m�n ph�i t�t c� server thi ��u l� 1 MP3 tr� gi� 500 NDT\n3.T�ng qu�n qu�n to�n server thi ��u l� 1 b� card m�n h�nh tr� gi� 1000 NDT\nKh�ng th� nh�n c�ng l�c 2,3 gi�i th��ng."
	Say(szSay, 2, "tr� l�i/game_info_yes", "R�i kh�i/end_say")
end

function get_award_yu()
	local nRoute = GetPlayerRoute()
	if GetLevel() < 30 then
		Talk(1, "", "Xin l�i, nh�n v�t tr�n 30 c�p m�i c� th� nh�n th��ng.")
		return
	elseif nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		Talk(1,"","Xin l�i, h�y gia nh�p tr��ng ph�i r�i quay l�i nh�n th��ng.")
		return 0
	elseif chktime() == 0 then
		Talk(1, "", "Xin l�i, th�i gian t�o nh�n v�t �t nh�t 4 ng�y m�i c� th� nh�n l�y ph�n th��ng")
		return
	elseif GetTask(1785) == 1 then
		Talk(1, "", "B�n �� nh�n ph�n th��ng n�y r�i.")
		return
	elseif GetTask(1785) == 0 then
		Talk(1, "", "Xin l�i, ch� c� ng��i ch�i ��t �i�u ki�n nh�n th��ng � v�ng lo�i v� ch�a nh�n m�i c� th� nh�n th��ng.")
		return
	elseif GetTask(1785) == 2 then
		Say("Ph�n th��ng v�ng lo�i bao g�m:\n(1)1 con ng�a h�ng m� hay ho�ng m� c�p 30\n(2)1 trang b� s� m�n c�p 40\n(3) th� luy�n qu� t� 1 - 3 vi�n\n(4) 5 mi�ng Thi�n th�ch\n\n<color=yellow>Khi nh�n th��ng, h�y s�p x�p h�nh trang l�i<color>", 2, "Nh�n l�y ph�n th��ng./get_award_yu_yes", "Th�i! L�n sau �i!/end_say")
	end
end

function get_award_yu_yes()
	if chktime() == 0 or GetTask(1785) ~= 2 or GetLevel() < 30 then
		return
	end
	SetTask(1785, 1)

	local nRet = 0
	if random(10000) >= 5000 then
		nRet = AddItem(0, 105, 1, 1, 1, -1, -1, -1, -1, -1, -1)		--��
	else
		nRet = AddItem(0, 105, 2, 1, 1, -1, -1, -1, -1, -1, -1)		--��
	end
	if nRet ~= 1 then
		WriteLog("[Thi ��u vi�t d�]l�i: ng�a c�p 30 v�n ch�a ph�n ph�t;"..GetAccount().." : "..GetName())
	end
	-- ��������װ
	local nType = random(1, 3)			-- ������/����/ñ��/�·�
	if nType == 1 then
		nRet = GiveWeapon()
	else
		nRet = GiveEquip(nType)
	end
	if nRet ~= 1 then
		WriteLog("[Thi ��u vi�t d�]l�i: Trang b� s� m�n v�n ch�a ph�n ph�t;"..GetAccount().." : "..GetName())
	end
	
	local nCount = mod(random(1, 100000), 3) + 1
	nRet = AddItem(2, 0, 392, nCount, 1)
	if nRet ~= 1 then
		WriteLog("[Thi ��u vi�t d�]l�i: Th� luy�n qu� v�n ch�a ph�n ph�t;"..GetAccount().." : "..GetName())
	end
	
	nRet = AddItem(2, 2, 8, 5, 1)
	if nRet ~= 1 then
		WriteLog("[Thi ��u vi�t d�]l�i: Thi�n th�ch v�n ch�a ph�n ph�t;"..GetAccount().." : "..GetName())
	end
end

function GiveWeapon()
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	local nRetEx = 1

	if nRoute == 2 then
		nRet = AddItem(0, 3, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
		nRetEx = AddItem(0, 5, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 3 then
		nRet = AddItem(0, 8, 301 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 4 then
		nRet = AddItem(0, 0, 401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 6 then
		nRet = AddItem(0, 1, 601 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 8 then
		nRet = AddItem(0, 2, 801 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 9 then
		nRet = AddItem(0, 10, 901 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 11 then
		nRet = AddItem(0, 0, 1101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 12 then
		nRet = AddItem(0, 5, 1201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 14 then
		nRet = AddItem(0, 2, 1401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 15 then
		nRet = AddItem(0, 9, 1501 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 17 then
		nRet = AddItem(0, 6, 1701 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 18 then
		nRet = AddItem(0, 4, 1801 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 20 then
		nRet = AddItem(0, 7, 2001 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 21 then
		nRet = AddItem(0, 11, 2101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	end
	
	if nRet == 1 and nRetEx == 1 then
		Msg2Player("B�n nh�n ���c 1 m�n v� kh�.")
		return 1
	else
		return 0
	end
end

function GiveEquip(nType)
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	--����/ñ��/�·�
	local tType =
	{
		[2] = 101,
		[3] = 103,
		[4] = 100,
	}
	local nParticular = 0
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		return 0
	elseif nRoute == 8 or nRoute == 9 then
		nParticular = nRoute * 100 + nBody - 2
	else
		nParticular = nRoute * 100 + nBody
	end
	
	nRet = AddItem(0, tType[nType], nParticular, 1, 1, -1,-1,-1,-1,-1,-1)
	if nRet == 1 then
		Msg2Player("B�n nh�n ���c 1 m�n trang b�.")
		return 1
	else
		return 0
	end
end


-------------------------------------------------------------------------------------------


function main_no()		-- ����ԽҰ��������
	local szSay = "Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!"
	local t =
	{
		"T�m hi�u cu�c thi t�ng c�p./game_info",
		"R�i kh�i/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info()

	local szSay = "Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!"
	local t=
	{
		"Giai �o�n 1: b�o danh/sign_info",
		"\nGiai �o�n 2: v�ng lo�i\n\n/game_info1",
		"Giai �o�n 3: B�n k�t/game_info2",
		"Giai �o�n 4: chung k�t/game_info3",
		"Tin t�c kh�c./game_info4",
		"R�i kh�i/end_say"
	}
	Say(szSay, getn(t), t)
end

function sign_info()
	Say("Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!", 2, "tr� l�i/game_info", "R�i kh�i/end_say")
end

function game_info1()
	Say("Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!", 2, "tr� l�i/game_info", "R�i kh�i/end_say")
end

function game_info2()
	Say("Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!", 2, "tr� l�i/game_info", "R�i kh�i/end_say")
end

function game_info3()
	Say("Cu�c thi Vi�t d� vi�t v� hi�p 2007 �� ch�nh th�c kh�i ��ng!", 2, "tr� l�i/game_info", "R�i kh�i/end_say")
end

function game_info4()
	Say("C�c c�m server thi ��u v�ng lo�i, v�ng b�n k�t cu�c thi t�ng c�p c�ng cho nh�ng ng��i ch�i b�nh th��ng t�o nh�n v�t, sau khi cu�c thi k�t th�c c�c server thi ��u s� v�n h�nh b�nh th��ng nh� c�c server c�. Sau khi thi ��u k�t th�c, t�t c� tin t�c c�a ng��i ch�i thi ��u s� ���c b�o l�u tr�ng th�i, ng��i ch�i c� th� ti�p t�c s� d�ng t�i kho�n n�y �� ��ng nh�p v�o tr� ch�i.", 2, "tr� l�i/game_info", "R�i kh�i/end_say")
end

function end_say()

end
