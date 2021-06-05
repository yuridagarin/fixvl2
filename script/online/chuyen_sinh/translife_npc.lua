--=============================================
-- Nhi�m v� Chuy�n sinh l�n 1
-- Created by TuanNA5
--=============================================
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

function trans_talk_01()
	local str1, str2
	str1 = szNpcName.."T� c� ch� kim cho d� l� Tuy�t ��nh Cao Th� hay Ho�ng �� Trung Nguy�n c�ng kh�ng m�t ai tho�t kh�i quy lu�t <color=yellow>Sinh � L�o � B�nh � T�<color>. C�ng ch�nh v� �i�u n�y m� �� x�y ra bi�t bao cu�c chi�n �� tranh �o�t b� quy�t <color=green>C�i L�o Ho�n ��ng<color>."
	str2 = szNpcName.."300 n�m tr��c, do c� duy�n h�o h�p l�o phu �� ���c m�t th�n ti�n truy�n th� <color=green>H�n Nguy�n C�ng<color> - v� c�ng t�m ph�p gi�p con ng��i tr��ng sinh b�t l�o. Nh�ng do c�n c� v� h�c ch�a �� n�n l�o phu ch� l�nh h�i ���c 2 th�nh c�a H�n Nguy�n C�ng. Tuy ch� c� 2 th�nh c�ng l�c nh�ng �� l�m cho l�o phu c� th�n th� tr�ng ki�n v� tinh th�n minh m�n nh� hi�n t�i."	
	Talk(2, "trans_talk_01_01", str1, str2)
end

function trans_talk_01_01()
	local tSay = 	{
							"V�n b�i mu�n h�c H�n Nguy�n C�ng/learn_translife_skill",
							"N�ng l�c v�n b�i c�n h�n ch�!/nothing",	
						}
	local strSay = szNpcName.."<color=green>H�n Nguy�n C�ng<color> bao g�m 5  th�c, 10 th�nh <color=yellow>H�p T��ng Quy Nguy�n - Th�n H�nh Th� Ch�nh - H�n T�c H�a Quang - ��n Nhi�n V� C�u - Sinh T� V� Ng�<color>. L�nh h�i c�c chi�u th�c kh�ng ph�i d�, ph�i l� <color=yellow>Cao Th� V� L�m ��ng c�p 99, c� 2 t� �i�m kinh nghi�m t�ch l�y v� b� ki�p Th�i D�ch H�n Nguy�n Ph�<color> m�i l�nh h�i ���c v� c�ng tuy�t ��nh n�y."
	Say(strSay,getn(tSay),tSay)
end

function learn_translife_skill()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 0 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."N�ng l�c c�a ng��i c�n h�n ch�!")
		return
	end
	
	if GetExp() < TRANSLIFE_EXP then
		Talk(1,"",szNpcName.."N�ng l�c c�a ng��i c�n h�n ch�!")
		return
	end
	
	if GetItemCount(2,0,1083) < 1 then
		Talk(1,"",szNpcName.."Ph�i c� Th�i D�ch H�n Nguy�n Ph� m�i ch� d�n ng��i tu luy�n ���c!")
		return
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph�i gia nh�p h� ph�i m�i c� th� tu luy�n!")
		return
	end
	
	if get_task_thonuong(BYTE_COUNT_FINISH) < 4 then
		Talk(1,"",szNpcName.."H�y t�m gi�p l�o phu 4 nhi�m v� Th�t N��ng r�i l�o phu s� truy�n th�!")
		return
	end
	
	trans_talk_02()
end

function trans_talk_02()
	local tSay = 	{
							"���c, v�n b�i s� �i t�m cho ti�n b�i/trans_talk_02_01",
							"�� khi kh�c nh�!/nothing",	
						}						
	local strSay = "L�o phu nghe n�i t�u l�u � Bi�n Kinh c� b�n lo�i r��u <color=red>N� Nhi H�ng th��ng h�ng<color>, ng��i c� th� mang v� cho ta 1 b�nh �� th��ng th�c c�ng v�i Th�t N��ng kh�ng ? N�u c� r��u � ��y kh�ng ch�ng l�o phu s� suy ngh� ��n vi�c truy�n th� H�n Nguy�n C�ng cho ng��i."
	Say(strSay,getn(tSay),tSay)
end

function trans_talk_02_01()
	if GetItemCount(2,0,1083) < 1 then
		Talk(1,"",szNpcName.."Ph�i c� Th�i D�ch H�n Nguy�n Ph� m�i ch� d�n ng��i tu luy�n ���c!")
		return
	end	
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 0 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end	
	if DelItem(2,0,1083,1) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."�a t�, l�o phu ch� tin c�a ng��i!")
		TaskTip("��n Ti�u Nh� � Bi�n Kinh t�m mua N� Nhi H�ng th��ng h�ng cho B�ch Ti�n Sinh.")
	end
end

function trans_talk_03()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 1 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	Talk(3,"trans_talk_03_01","Ta mu�n mua 1 b�nh N� Nhi H�ng th��ng h�ng.",szNpcName.."Lo�i r��u �� l� b�o b�i c�a T�u L�u, gi� kh�ng r�. Kh�ch quan th� h�i �ng ch� xem!", "Xin �a t�!")
end

function trans_talk_03_01()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() ~= 1 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	SetTaskTrans()
	TaskTip("��n Ch� T�u L�u � Bi�n Kinh mua N� Nhi H�ng th��ng h�ng cho B�ch Ti�n Sinh.")
end

function trans_talk_04()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 2 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	Talk(4,"trans_talk_04_01","Ta mu�n mua 1 b�nh N� Nhi H�ng th��ng h�ng.", szNpcName.."Kh�ch quan mu�n mua N� Nhi H�ng Th��ng H�ng �? Th�t ��ng ti�c! V� tr�ng s� kia v�a mua b�nh r��u cu�i c�ng r�i.","H�! ��n 1 b�nh r��u c�ng kh�ng c�n cho ta sao?","(��nh ph�i l�m phi�n v� huynh ��i kia v�y...)")
end

function trans_talk_04_01()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 2 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	SetTaskTrans()
	TaskTip("��n Nh�n S� Giang H� � Bi�n Kinh th��ng l��ng.")
end

function trans_talk_05()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 3 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	Talk(1,"trans_talk_05_01","V� huynh ��i n�y c� th� nh��ng cho t�i h� b�nh r��u N� Nhi H�ng th��ng h�ng kia kh�ng? T�i h� �ang r�t c�n!")
end

function trans_talk_05_01()
	local tSay = {
							"Qu� th�t t�i h� c�n b�nh r��u n�y!/trans_talk_05_02",
							"T�n n�y qu� th�t h�ng h�ch, cho h�n 1 b�i h�c!/reject",
							"T�i h� ch� ��a th�i./nothing",
					   }
	SetTaskTrans()
	Say(szNpcName.."Ng��i mu�n ta nh��ng l�i b�nh N� Nhi H�ng th��ng h�ng n�y �? N�m m� �i!",getn(tSay),tSay)
end

function reject()
	if GetCash()  <= 1000000 then
		Pay(GetCash())
	else
		Pay(1000000)
	end
	Talk(1,"","B�n v�a xu�t chi�u th� h�n �� nhanh ch�n t�u tho�t ��ng th�i l�y c�a b�n 1 s� v�ng.")	
end

function trans_talk_05_02()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 4 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	local strSay = szNpcName.."Ng��i �� t�ng nghe qua ��i ti�c t�i Long M�n Tr�n ch�a? Nghe n�i qu�n h�ng s� h�i t� t�i ��, ta r�t mu�n �i xem ch� ti�c l� kh�ng c� Thi�p m�i. N�u ng��i c� <color=yellow>Thi�p d� ti�c Long M�n<color> ta s� ��i v�i ng��i."
	local tSay = {
							"(H�n qu� th�t hi�p ng��i qu� ��ng. Thi�p d� ti�c Long m�n qu� gi� nh� v�y m� mu�n ta ��i v�i b�nh r��u N� Nhi H�ng �� sao? H�, ��i xong ta s� c�u s�t ng��i!) ���c, ta ��i v�i ng��i!/trans_talk_05_03",							
							"�� ta suy ngh� l�i./nothing",
					  }
	Say(strSay,getn(tSay),tSay)
end

function trans_talk_05_03()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 4 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	if GetItemCount(2,0,1037) < 1 then
		Talk(1,"",szNpcName.."Thi�p d� ti�c Long M�n ��u?")
		return
	end	
	if DelItem(2,0,1037,1) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."B�nh r��u c�a ng��i ��y!")
		Msg2Player("B�n nh�n ���c 1 b�nh r��u N� Nhi H�ng.")
		TaskTip("�em b�nh r��u N� Nhi H�ng th��ng h�ng v� cho B�ch Ti�n Sinh.")
	end
end

function trans_talk_06()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 5 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	local str1 = "B�nh r��u ti�n b�i c�n ��y!"
	local str2 = szNpcName.."Ha ha ha! Ng��i �� tr�ng k� c�a ti�u t� kia r�i, b�nh r��u n�y ch� l� lo�i r��u th�ng th��ng th�i. Xem ng��i v� c�ng cao c��ng nh�ng kinh nghi�m giang h� ng��i c�n non k�m qu�!"
	local str3 = "(...Th�t kh�ng ng� ta b�n t�u giang h� b�y l�u nay ch� v� m�t ch�t s� su�t �� b� t�n ti�u t� kia qua m�t, l�n sau n�u �� ta g�p l�i ta s� s� l�y m�ng h�n...)"
	local str4 = "Xin ti�n b�i th� l�i, v�n b�i s� �i t�m b�nh r��u kh�c v� ��y!"
	local str5 = szNpcName.."Kh�ng sao! C�n c� v� h�c c�a ng��i c�ng kh�ng t� nh�ng kinh nghi�m giang h� v�n c�n non k�m, kh�ng tr�ch ���c ng��i. D� sao th� b�nh r��u n�y ��i v�i ta c�ng r�t c� � ngh�a, ta s� truy�n th� cho ng��i 2 th�nh c� b�n c�a H�n Nguy�n C�ng."
	SetTaskTrans()
	Talk(5,"trans_talk_07",str1,str2,str3,str4,str5)
end

function trans_talk_07()
	if GetTranslifeCount() ~= 0 or GetTranslifeFaction() ~= 0 or GetTaskTrans() > 6 then
		Talk(1,"",szNpcName.."H�nh nh� c�c h� �� l�nh h�i v� c�ng n�y r�i!")
		return
	end
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#select_translife(1)",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#select_translife(2)",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4)",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3)",
							"Gi�i thi�u c�c h��ng tu luy�n/view_info",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."H�n Nguy�n C�ng th�c ch�t c� 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end

function trans_talk_08()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 7  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng��i v�n ch�a luy�n th�nh th�o H�p T��ng Quy Nguy�n �?")
		return
	end	
	if GetExp() < TRANSLIFE_EXP then
		Talk(1,"",szNpcName.."Ng��i v�n ch�a luy�n th�nh th�o H�p T��ng Quy Nguy�n �?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph�i gia nh�p h� ph�i m�i c� th� tu luy�n!")
		return
	end	
	local tSay = 	{
							"�a t� l�o ti�n b�i!/trans_talk_08_01",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."Ng��i �� luy�n <color=yellow>H�p T��ng Quy Nguy�n<color> th�nh th�o r�i sao? Qu� l� k� t�i hi�m th�y! Ta kh�ng c�n g� �� truy�n d�y ng��i n�a. Ta nghe ��o ch� ��o Hoa ��o n�i <color=yellow>Minh Ch� Kim S�n<color> �� luy�n th�nh c�ng th�c th� 2 c�a H�n Nguy�n C�ng <color=yellow>Th�n H�nh Th� Ch�nh<color>, h�y ��n b�i ki�n ��i nh�n �y xem sao!",getn(tSay),tSay)
end

function trans_talk_08_01()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 7  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Ch�c ng��i s�m luy�n th�nh c�ng!")	
	TaskTip("��n T��ng D��ng t�m g�p Minh Ch� Kim S�n.")
end

function trans_talk_09()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 8  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local str1 = szNpcName.."Hmmm..."
	local str2 = szNpcName.."Kh�ng ng� giang h� hi�n nay v�n c�n c� ng��i bi�t chuy�n n�y. C� ph�i l�o gi� ��o Hoa ��o n�i cho ng��i bi�t kh�ng? Ta v�i l�o gi� �y 400 n�m tr��c c�ng b�i s� � <color=yellow>T� Linh ��ng<color>, nh�ng H�n Nguy�n C�ng qu� huy�n c�, ta ch� l�nh h�i ���c ��n th�c th� 2 <color=yellow>Th�n H�nh Th� Ch�nh<color>.  Kh�ng bi�t l�o �y hi�n gi� c� kh�e kh�ng?"
	local str3 = "Ti�u b�i nghe B�ch L�o ti�n sinh k� l�i ch� kh�ng ph�i ��o ch� ��o Hoa ��o. Xin ��ng tr�ch B�ch L�o v� ti�u b�i r�t t�m huy�t v�i lo�i v� c�ng n�y. Minh Ch�, xin ng�i h�y nh�n ti�u b�i l�m �� t�!"
	local str4 = "H�! Nh� v� c�ng n�y m� ta m�i c� th� x�ng b� v� l�m, l�n ng�i v� Minh Ch�. H� c� th� truy�n th� d� d�ng cho ng��i sao? ��t n��c �ang chinh chi�n, h�y ��n <color=yellow>Thi�n M�n Tr�n - T�i nguy�n chi�n ho�n th�nh 2 nhi�m v� trong ng�y<color> r�i ��n g�p ta! �� xem ng��i c� x�ng ��ng hay kh�ng!"
	Talk(4,"trans_talk_09_01",str1,str2,str3,str4)
end

function trans_talk_09_01()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 8  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"","Ti�u b�i s� �i ngay!")	
	TaskTip("Ho�n th�nh 2 nhi�m v� T�ng Li�u T�i Nguy�n Chi�n r�i quay l�i g�p Minh Ch� Kim S�n.")
end

function trans_talk_10()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 10  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local str = "Xem ra ng��i c�ng l� m�t nam t� h�n c� l�ng trung hi�u v�i ��t n��c. ���c, h�y l�m th�m cho ta 1 nhi�m v� n�a! V� l�m hi�n �ang lo�n l�c, c��ng h�o �c b� ho�nh h�nh kh�p n�i. H�y �i ti�u di�t <color=yellow>Th��ng Th�n Doanh Thi�n, B�c L�c L�m Minh Ch� v� L�nh H��ng L�ng<color>, mang t�n v�t c�a ch�ng v� ��y cho ta!"
	Say(str,2,"Ti�u b�i tu�n l�nh!/trans_talk_10_01","Ti�u b�i suy ngh� l�i ��./nothing")	
end

function trans_talk_10_01()
	SetTask(2126, 0)
	SetTask(345, 0)
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 10  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		Talk(1,"","T�t l�m, qu� c� kh� kh�i nam nhi!")	
		TaskTip("Mang B�c L�c L�m l�nh, Tr�c �nh th��ng v� Tuy�t t�nh th�ch giao cho Minh Ch� Kim S�n.")
	end
end

function trans_talk_11()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 11  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"trans_talk_12",szNpcName.."Ha ha ta qu� kh�ng nh�n l�m ng��i. Ng��i qu� th�t c� t� ch�t l�nh h�i th�c th� 2 c�a H�n Nguy�n C�ng <color=yellow>Th�n H�nh Th� Ch�nh<color>.")
		end
	else
		Talk(1,"",szNpcName.."Th��ng Th�n Doanh Thi�n, B�c L�c L�m Minh Ch� v� L�nh H��ng L�ng kh�ng d� ��i ph�! Ng��i h�y c�n th�n.")
		return
	end
end

function trans_talk_12()
	if GetTranslifeCount() ~= 1 or GetTaskTrans() ~= 12  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
						"�� t� mu�n tu luy�n theo h��ng Long T�!/#select_translife(1)",
						"�� t� mu�n tu luy�n theo h��ng H� T�!/#select_translife(2)",
						"�� t� mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4)",
						"�� t� mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3)",
						"Gi�i thi�u c�c h��ng tu luy�n/view_info",
						"V�n b�i suy ngh� l�i ��./nothing",
					}
	Say(szNpcName.."<color=yellow>Th�n H�nh Th� Ch�nh<color> t�p trung kh� �m d��ng trong c� th�, h�nh th�nh h� kh�. Ng��i luy�n ���c 2 th�nh n�y �ao th��ng b�t nh�p. Ng��i mu�n tu luy�n theo h��ng n�o? <color=red>Ch� �: Th�n H�nh Th� Ch�nh n�u tu luy�n theo h��ng �ng T� s� luy�n th�nh B� Qua Ph�ng Ng� ��i Ph��ng<color>",getn(tSay),tSay)	
end

function trans_talk_13()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 13  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng��i v�n ch�a luy�n th�nh th�o Th�n Hinh Th� Ch�nh �?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph�i gia nh�p h� ph�i m�i c� th� tu luy�n!")
		return
	end	
	local tSay = 	{
							"Xin Minh Ch� ch� �� t� n�i � c�a ��o Ch� ��o ��o Hoa?/trans_talk_13_01",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."Ng��i �� luy�n <color=yellow>Th�n H�nh Th� Ch�nh<color> th�nh th�o r�i sao? Qu� l� k� t�i hi�m th�y! Ta kh�ng c�n g� �� truy�n d�y ng��i n�a. H�y �i t�m <color=yellow>��o Ch� ��o ��o Hoa<color> th�nh gi�o ti�p <color=yellow>H�n T�c H�a Quang<color> �i.",getn(tSay),tSay)
end

function trans_talk_13_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 13  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	SetTaskTrans()
	Talk(1,"",szNpcName.."Hi�n t�i ta c�ng kh�ng bi�t tung t�ch c�a l�o �y. Ng��i th� h�i B�ch Ti�n Sinh xem sao!")
	TaskTip("T�m B�ch Ti�n Sinh h�i n�i � c�a ��o Ch� ��o ��o Hoa")
end

function trans_talk_14()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 14  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	SetTaskTrans()
	Talk(2,"",szNpcName.."��o Ch� ��o ��o Hoa? Ta nghe n�i l�o �y kh�ng c�n � ��o ��o Hoa n�a. Ng��i t�m <color=yellow>Thuy�n phu ��ng H�i<color> h�i th�m ch� � c�a l�o �y xem. H�n th��ng xuy�n �i bi�n ch�c bi�t n�i � c�a l�o �y!", "�a t� l�o ti�n b�i, v�n b�i l�n ���ng ngay!")
	TaskTip("T�m Thuy�n phu ��ng H�i h�i n�i � c�a ��o Ch� ��o ��o Hoa")
end

function trans_talk_15()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 15  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	local tSay = 	{
							"Ta ��ng �!/trans_talk_15_01",
							"�� ta suy ngh� l�i/nothing",
						}
	Say(szNpcName.."��o Ch� ��o Hoa ��o? Ta c� bi�t v� cao nh�n n�y. N�u ng��i cho ta <color=yellow>500 v�ng<color> ta s� ch� n�i � c�a �ng �y cho ng��i!",getn(tSay),tSay)
end

function trans_talk_15_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 15  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	if GetCash() < 5000000 then
		Talk(1,"",szNpcName.."500 v�ng c�a ta ��u?")
		return
	end
	if Pay(5000000) == 1 then
		Talk(1,"",szNpcName.."Ha ha xin �a t�! Ng��i qu� l� h�o ph�ng! ���c, cao nh�n �y hi�n �ang �n c� t�i <color=yellow>C� ��o<color>. Ng��i th� ��n �� h�i th�m tin t�c xem.")
		SetTaskTrans()
		TaskTip("�i thuy�n ��n C� ��o t�m g�p ��o Ch� ��o ��o Hoa")	
	end
end

function trans_talk_16()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end	
	Talk(4,"trans_talk_16_01","V�n b�i m�n ph�p h�i l�o cao nh�n ��y c� ph�i ��o Ch� ��o ��o Hoa?",szNpcName.."Ng��i t�m ta c� vi�c g�?","V�n b�i nghe danh cao nh�n �� l�u, nay mu�n g�p cao nh�n �� th�nh gi�o chi�u th�c th� 3 c�a H�n Nguy�n C�ng <color=yellow>H�n T�c H�a Quang<color>. Xin cao nh�n truy�n th�!",szNpcName.."...")	
end

function trans_talk_16_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i ��ng �/trans_talk_16_02",
							"V�n b�i suy ngh� l�i/nothing",
						}
	Say(szNpcName.."Th�i ���c r�i, th�y ng��i c�ng th�nh t�m ��n g�p ta. Ta ��ng � truy�n th� th�c th� 3 c�a H�n Nguy�n C�ng cho ng��i. Nh�ng ng��i ph�i ho�n th�nh c�c y�u c�u c�a ta! Tr��c h�t h�y mang <color=yellow>B�c L�c L�m l�nh, Tr�c �nh th��ng v� Tuy�t t�nh th�ch<color> v� ��y g�p ta. N�u ng��i �� s�c ��nh b�i ch�ng th� ta s� truy�n d�y.",getn(tSay),tSay)
end

function trans_talk_16_02()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 16  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		SetTask(2126, 0)
		SetTask(345, 0)
		Talk(1,"",szNpcName.."T�t l�m, ta � ��y ��i tin ng��i!")	
		TaskTip("Mang B�c L�c L�m l�nh, Tr�c �nh th��ng v� Tuy�t t�nh th�ch giao cho ��o Ch� ��o ��o Hoa")
	end
end

function trans_talk_17()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 17 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"trans_talk_18",szNpcName.."Ng��i qu� th�t c� t� ch�t l�nh h�i th�c th� 3 c�a H�n Nguy�n C�ng <color=yellow>H�n T�c H�a Quang<color>.")
		end
	else
		Talk(1,"",szNpcName.."Th��ng Th�n Doanh Thi�n, B�c L�c L�m Minh Ch� v� L�nh H��ng L�ng kh�ng d� ��i ph�! Ng��i h�y c�n th�n.")
		return
	end
end

function trans_talk_18()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 18 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i ��ng �!/trans_talk_18_01",
							"V�n b�i suy ngh� l�i/nothing",
						}
	Say(szNpcName.."H�y ti�p t�c l�m cho ta c�c nhi�m v� sau ��y:\nHo�n th�nh T�ng Li�u T�i Nguy�n Chi�n: <color=yellow>48 l�n<color>\nTr�ng th�nh c�ng H�t Gi�ng: <color=yellow>192 l�n<color>\nTr�ng th�nh c�ng B�t Nh� Nh�: <color=yellow>128 l�n<color>\nTr�ng th�nh c�ng B�t Nh� L�n: <color=yellow>64 l�n<color>\n\nSau khi ho�n th�nh nhi�m v� quay v� g�p ta!",getn(tSay),tSay)
end


function trans_talk_18_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 18 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Th� th�ch l�n n�y c�n nhi�u th�i gian �� r�n luy�n t�nh ki�n tr� c�a ng��i!")
	TaskTip("Ho�n th�nh c�c y�u c�u c�a ��o Ch� ��o ��o Hoa")
end

function trans_talk_19()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 19 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local nResWar = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1)
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3)
	local nBigSeed = gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4)
	
	if nResWar == 48 and nSeed == 192 and nSmallSeed == 128 and nBigSeed == 64 then
		SetTask(TRANSLIFE_TASK_34,0)
		SetTaskTrans()
		Talk(3,"trans_talk_20",szNpcName.."Th� th�ch kh� v�y ng��i c�ng c� th� ho�n th�nh sao?",szNpcName.."...",szNpcName.."���c, h�y th�c hi�n th� th�ch cu�i c�ng c�a ta!")
	else
		Talk(1,"",format(szNpcName.."S� l�n ho�n th�nh nhi�m v�:\nHo�n th�nh T�ng Li�u T�i Nguy�n Chi�n: <color=yellow>%s/48 l�n<color>\nTr�ng th�nh c�ng H�t Gi�ng: <color=yellow>%s/192 l�n<color>\nTr�ng th�nh c�ng B�t Nh� Nh�: <color=yellow>%s/128 l�n<color>\nTr�ng th�nh c�ng B�t Nh� L�n: <color=yellow>%s/64 l�n<color>",nResWar,nSeed,nSmallSeed,nBigSeed))
	end
end

function trans_talk_20()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 20 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i ��ng �!/trans_talk_20_01",
							"V�n b�i suy ngh� l�i/nothing",
						}
	Say(szNpcName.."Tr�n C� ��o n�y ta c� t� ch�c so t�i B�n ��ng H�nh. Ng��i c�ng c� B�n ��ng H�nh ph�i kh�ng? H�y h� tr� B�n ��ng H�nh c�a ng��i <color=yellow>chi�n th�ng 4 tr�n so t�i<color> v� r�n luy�n B�n ��ng H�nh <color=yellow> 200 �i�m Linh L�c<color> r�i ��n g�p ta.",getn(tSay),tSay)
end

function trans_talk_20_01()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 20 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"","B�n ��ng H�nh r�t quan tr�ng tr�n ���ng h�nh t�u giang h�. H�y ch�m s�c t�t B�n ��ng H�nh!")
	TaskTip("Chi�n th�ng 4 tr�n so t�i B�n ��ng H�nh �� ho�n th�nh y�u c�u c�a ��o Ch� ��o ��o Hoa")
end

function trans_talk_21()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 21 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if GetTask(TRANSLIFE_TASK_34) ~= 4 then
		Talk(1,"",szNpcName.."Mau �i so t�i B�n ��ng H�nh!")
		return
	end
	if floor(GetTask(TASK_VNG_PET_GODPOINT)/100) < 200 then
		Talk(1,"",szNpcName.."B�n ��ng H�nh c�a ng��i ch�a tu luy�n �� 200 �i�m Linh L�c!")
		return
	end	
	SetTaskTrans()
	SetTask(TRANSLIFE_TASK_34,0)
	Talk(1,"",szNpcName.."Ha ha ng��i qu� x�ng ��ng ���c truy�n th� th�c th� 3 c�a H�n Nguy�n C�ng <color=yellow>H�n T�c H�a Quang<color>. H�y �em <color>1 Th�i D�ch H�n Nguy�n Ph�<color> ��n �� b�t ��u tu luy�n!")
	TaskTip("Mang 1 Th�i D�ch H�n Nguy�n Ph� ��n cho ��o Ch� ��o ��o Hoa")
end

function trans_talk_22()
	if GetTranslifeCount() ~= 2 or GetTaskTrans() ~= 22 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#select_translife(1)",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#select_translife(2)",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4)",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3)",
							"Gi�i thi�u c�c h��ng tu luy�n/view_info",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end

function select_translife(nType)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c chuy�n sinh")
		return
	end	
	if nType <= 0 then
		return
	end
	if GetExp() < TRANSLIFE_EXP then
		Talk(1,"",szNpcName.."Ng��i ch�a �� 2 t� �i�m kinh nghi�m, l�m sao ta truy�n d�y ���c?")
		return
	end	
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end
	if GetTranslifeCount() == 3 and GetTaskTrans() == 30 then
		local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
		if nCurPetLevel < 4 then
			Talk(1,"",szNpcName.."Ng��i ph�i c� k� n�ng B�n ��ng H�nh c�p 4 tr� l�n m�i c� th� tu luy�n H�n Nguy�n C�ng th�nh th� 8!")
		return
		end
	end
	if GetCash() < 10000000 and GetTranslifeCount() == 4 and GetTaskTrans() == 36 then
			Talk(1,"","Ti�n trong h�nh trang c�a b�n kh�ng �� !!")
			return
	end
--	if GetTranslifeCount() == 4 and GetTaskTrans() == 35 then
--		local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--		if nCurPetLevel < 4  or GetCash() <10000000 then
--			Talk(1,"",szNpcName.."Ng��i ph�i c� k� n�ng B�n ��ng H�nh c�p 4 v� trong h�nh trang ph�i c� 1000 v�ng  tr� l�n m�i c� th� tu luy�n H�n Nguy�n C�ng th�nh th� 10!")
--		return
--		end
--	end
	if GetTranslifeCount() > 0 then
		if GetItemCount(2,0,1083) < 1 then
			Talk(1,"",szNpcName.."Ph�i c� Th�i D�ch H�n Nguy�n Ph� m�i ch� d�n ng��i tu luy�n ���c!")
			return
		end
		DelItem(2,0,1083,1)
	end
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	
	ModifyExp(-2000000000)
	-- Tr� v�ng cho nhi�m v� chuy�n sinh 5
	if GetTranslifeCount() == 4 and GetTaskTrans() == 36 then
		Pay(10000000)
	end
	
	local nRoute = GetPlayerRoute()
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, gf_GetTaskByte(TRANSLIFE_TASK_ID,TRANSLIFE_BYTE_COUNT) +1)
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	
	if GetTranslifeCount() == 1 and GetTaskTrans() == 6 then			
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nh�n ngo�i trang",0,1)
		end
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		if GetStoreBoxPageCount() < 4 then
			SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		end
		SetTaskTrans()
		ResetProperty()
		SetLevel(90,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� nh�t...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 2 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	elseif GetTranslifeCount() == 2 and GetTaskTrans() == 12  then		
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nh�n ngo�i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� hai...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 4 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif GetTranslifeCount() ==3 and GetTaskTrans() == 22 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V�n S� Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� ba...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 6 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif GetTranslifeCount() == 4 and GetTaskTrans() == 30 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thi�n �m Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	elseif  GetTranslifeCount() == 5 and GetTaskTrans() == 36 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		SetTaskTrans()
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	else
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng qu� l� tuy�t th� v� c�ng c�a trung nguy�n!")
		return
	end	
end

function get_translife_item()
	if GetTranslifeCount() <= 0 or GetTaskTrans() <= 0 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return	
	end	
	Say(szNpcName.."Ng��i mu�n l�y l�i �n t�n v� ngo�i trang ph�i kh�ng?",2,"V�n b�i �� l�m m�t, xin ti�n b�i giao l�i!/confirm_get_translife_item","Kh�ng c� g�/nothing")	
end

function confirm_get_translife_item()
	if GetTranslifeCount() <= 0 or GetTaskTrans() <= 0 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return	
	end
	if GetTask(336) < 100 then
		Talk(1,"",szNpcName.."C�n 100 �i�m S� M�n �� nh�n l�i v�t ph�m.")
		return	
	end
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end	

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nTransCount = GetTranslifeCount()	
	local nType = GetTranslifeFaction()	
	---------chuy�n sinh 6
	if GetPlayerRebornParam(0) == 1 then
		local nType_cs6 = GetPlayerRebornParam(1)
		local nBody = GetBody()	
		gf_AddItemEx(tb_translife_seal_cs6[nType_cs6][2], tb_translife_seal_cs6[nType_cs6][1])		
		if GetLevel() < 79 then
			Talk(1,"","��i hi�p ch�a �� y�u c�u �� nh�n l�i trang b�")	
			return
		end
		SetTask(336,GetTask(336) - 100)
		Msg2Player("B�n b� tr� 100 �i�m s� m�n.")
	--	local nType_cs6 = GetPlayerRebornParam(1) -- x�a trang bi CS6
	--	local nBody_cs6 = GetBody()
		for i=1, getn(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end					
		for i = 1, 3 do
			gf_AddItemEx(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i], "Nh�n l�i trang b�")
		end
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		--	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
		end				
		Talk(1,"","��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
		WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh theo h��ng "..tb_translife_seal[nType_cs6][3])		
		return
	end
	---------chuy�n sinh 7
	if GetPlayerRebornParam(0) == 2 then
		local nType_cs7 = GetPlayerRebornParam(1)
		local nBody = GetBody()	
		gf_AddItemEx(tb_translife_seal_cs6[nType_cs7][2], tb_translife_seal_cs6[nType_cs7][1])		
		if GetLevel() < 79 then
			Talk(1,"","��i hi�p ch�a �� y�u c�u �� nh�n l�i trang b�")	
			return
		end
		SetTask(336,GetTask(336) - 100)
		Msg2Player("B�n b� tr� 100 �i�m s� m�n.")
	--	local nType_cs6 = GetPlayerRebornParam(1) -- x�a trang bi CS6
	--	local nBody_cs6 = GetBody()
		for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end					
		for i = 1, 3 do
			gf_AddItemEx(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i], "Nh�n l�i trang b�")
		end
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		--	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
		end				
		Talk(1,"","��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
		WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh 7 theo h��ng "..tb_translife_seal[nType_cs6][3])		
		return
	end	
	---------------
	gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
	for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
		P = P + GetBody() - 1
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
	end	
	SetTask(336,GetTask(336) - 100)	
	Msg2Player("B�n b� tr� 100 �i�m s� m�n.")	
	Talk(1,"",szNpcName.."��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
	WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
end


function trans_talk_24()
	SetTaskTrans()
	Talk(1,"",szNpcName.."Ta s� ch� tin c�a c�c h�!")
	TaskTip("��n t�m B�ch Ti�n Sinh �� h�i th�m tin t�c.")
end


function trans_talk_25()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 25 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i ��ng �!/trans_talk_25_01",
							"�� v�n b�i suy ngh� l�i/nothing",
						}
	Say(szNpcName.."H�y l�m cho ta c�c nhi�m v� sau ��y:\nHo�n th�nh T�ng Li�u T�i Nguy�n Chi�n: <color=yellow>80 l�n<color>\nTr�ng th�nh c�ng H�t Gi�ng: <color=yellow>480 l�n<color>\nTr�ng th�nh c�ng B�t Nh� Nh�: <color=yellow>320 l�n<color>\nTr�ng th�nh c�ng B�t Nh� L�n: <color=yellow>160 l�n<color>\n\nSau khi ho�n th�nh nhi�m v� quay v� g�p ta!", getn(tSay), tSay)
end


function trans_talk_25_01()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 25 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Th� th�ch l�n n�y c�n nhi�u th�i gian �� r�n luy�n t�nh ki�n tr� c�a ng��i!")
	TaskTip("Ho�n th�nh c�c y�u c�u c�a B�ch Ti�n Sinh")
end


function trans_talk_26()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 26 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local nResWar = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK1) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK1)
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) 
	local nBigSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) 
	
	if nResWar == 80 and nSeed == 480 and nSmallSeed == 320 and nBigSeed == 160 then
		SetTask(TRANSLIFE_TASK_34, 0)
		SetTask(TRANSLIFE_TASK_34_FLAG, 0)
		SetTaskTrans()
		Talk(3,"trans_talk_27",szNpcName.."Th� th�ch kh� v�y ng��i c�ng c� th� ho�n th�nh sao?",szNpcName.."...",szNpcName.."���c, h�y th�c hi�n th� th�ch cu�i c�ng c�a ta!")
	else
		Talk(1,"",format(szNpcName.."S� l�n ho�n th�nh nhi�m v�:\nHo�n th�nh T�ng Li�u T�i Nguy�n Chi�n: <color=yellow>%s/80 l�n<color>\nTr�ng th�nh c�ng H�t Gi�ng: <color=yellow>%s/480 l�n<color>\nTr�ng th�nh c�ng B�t Nh� Nh�: <color=yellow>%s/320 l�n<color>\nTr�ng th�nh c�ng B�t Nh� L�n: <color=yellow>%s/160 l�n<color>",nResWar,nSeed,nSmallSeed,nBigSeed))
	end
end


function trans_talk_27()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 27 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	SetTaskTrans()
	Talk(1,"",szNpcName.."Nghe ��n Th�n Th� t�i Tuy�n Ch�u �ang c�n m�t s� b�o v�t, ng��i h�y �i t�m �� th� s�c!")
	TaskTip("T�m Th�n Th� t�i Tuy�n Ch�u �� nh�n nhi�m v�")
end


function trans_talk_28()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 28 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	
	local szHeader = "��i hi�p h�y khi�u chi�n B�c L�c L�m Minh Ch�, Th��ng Th�n Doanh Thi�n, L�nh H��ng L�ng v� mang v� cho ta 3 t�n v�t B�c L�c L�m l�nh, Tr�c �nh th��ng v� Tuy�t t�nh th�ch."
	local tSay = 	{
							"Ta s� �i ngay!/trans_talk_28_01",
							"�� ta suy ngh� l�i/nothing",
						}
	Say(szNpcName..szHeader, getn(tSay), tSay)
end


function trans_talk_28_01()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 28 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if BigDelItem(2, 0, 399, BigGetItemCount(2,0,399)) == 1 and BigDelItem(2, 0, 400, BigGetItemCount(2,0,400)) == 1 and BigDelItem(2, 0, 401, BigGetItemCount(2,0,401)) == 1 then
		SetTaskTrans()
		Talk(1,"",szNpcName.."H�y gi� m�nh c�n th�n, t�t nh�t h�y t�m t� ��i �� c�ng l�m nhi�m v� n�y!")
		TaskTip("Mang B�c L�c L�m l�nh, Tr�c �nh th��ng v� Tuy�t t�nh th�ch giao cho Th�n Th�.")
	end
end


function trans_talk_29()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 29  or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	
	if GetItemCount(2,0,399) > 0 and GetItemCount(2,0,400) > 0 and GetItemCount(2,0,401) > 0 then
		if DelItem(2,0,399,1) == 1 and DelItem(2,0,400,1) ==1 and DelItem(2,0,401,1) == 1 then
			SetTaskTrans()
			Talk(1,"", szNpcName.."Ha ha ta qu� kh�ng nh�n l�m ng��i. Ng��i qu� th�t c� t� ch�t l�nh h�i th�c th� 8 c�a H�n Nguy�n C�ng <color=yellow>��n Nhi�n V� C�u<color>, h�y �i t�m B�ch Ti�n Sinh �� ho�n th�nh tu luy�n.")
			TaskTip("Quay v� t�m B�ch Ti�n Sinh �� ho�n th�nh tu luy�n v� c�ng.")
		end
	else
		Talk(1,"",szNpcName.."Th��ng Th�n Doanh Thi�n, B�c L�c L�m Minh Ch� v� L�nh H��ng L�ng kh�ng d� ��i ph�! Ng��i h�y c�n th�n, khi n�o c� t�n v�t h�y mang v� ngay cho ta.")
		return
	end
end


function trans_talk_30()
	if GetTranslifeCount() ~= 3 or GetTaskTrans() ~= 30 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#select_translife(1)",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#select_translife(2)",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4)",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3)",
							"Gi�i thi�u c�c h��ng tu luy�n/view_info",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end


function trans_talk_32()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 32 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	if GetLevel() < TRANSLIFE_LEVEL then
		Talk(1,"",szNpcName.."Ng��i v�n ch�a luy�n th�nh th�o ��n Nhi�n V� C�u �?")
		return
	end	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Ph�i gia nh�p h� ph�i m�i c� th� tu luy�n!")
		return
	end	
	str1 = szNpcName.."��i hi�p mu�n C�i l�o ho�n ��ng? Tr��c ti�n ph�i ��nh b�i ���c Ng� Vi�t L�o T�. Nghe n�i Ng� Vi�t L�o T� lang thang ��u �� trong Thi�n S� ��ng t�ng 2. H�y mau t�m v� ti�u di�t."
	Talk(1, "trans_talk_32_01", str1)
end


function trans_talk_32_01()
	local tSay = 	{
							"V�n b�i mu�n h�c H�n Nguy�n C�ng/trans_talk_32_01_01",
							"N�ng l�c v�n b�i c�n h�n ch�!/nothing",	
						}
	local strSay = szNpcName.."<color=green>Ch��ng m�n nh�c ��n Ng� Vi�t L�o T� v� h��ng d�n ng��i ch�i ��n g�p �� t� C�n L�n th�n b� t�i (Thi�n s� ��ng t�ng 2-(197,178)) �� t�m c�ch ��nh b�i Ng�Vi�tL�oT�."
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_32_01_01()
	SetTaskTrans()
	TaskTip("��n g�p �� t� C�n L�n th�n b� t�i (Thi�n s� ��ng t�ng 2-(197,178)) �� t�m c�ch ��nh b�i Ng� Vi�t L�oT�")
end


function trans_talk_33()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 33 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"H�c c�ch ��nh b�i Ng� Vi�t L�o T�/trans_talk_33_01",
							"N�ng l�c ta c�n h�n ch�!/nothing",	
						}
	local strSay = szNpcName.."C�ch ��nh b�i Ng� Vi�t L�oT�."
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_33_01()
	SetTaskTrans()
	TaskTip("��n g�p B�ch Ti�n Sinh h�c c�ch ��nh b�i Ng� Vi�t L�oT�!")
end


function trans_talk_34()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 34 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"Nhi�m v� l�nh h�i ch�n kh�/trans_talk_34_01",
							"Tr� nhi�m v� l�nh h�i ch�n kh�/trans_talk_34_02",
							"N�ng l�c ta c�n h�n ch�!/nothing",	
						}
	
	local strSay = szNpcName.."H�y mau ho�n th�nh nhi�m v� : \nHo�n th�nh �i Thi�n M�n Tr�n <color=yellow>80<color> l�n \nHo�n th�nh �i L��ng S�n B�c <color=yellow>60<color> l�n\nS� d�ng <color=yellow>2000<color> n� oa b�o h�p \nTr�ng th�nh c�ng <color=yellow>320<color> c�y b�t nh� nh�\nTr�ng th�nh c�ng <color=yellow>500<color> h�t gi�ng \nTr�ng th�nh c�ng <color=yellow>69<color> c�y t� linh"
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_34_01()
	Talk(1,"",szNpcName.."Th� th�ch l�n n�y c�n nhi�u th�i gian �� r�n luy�n t�nh ki�n tr� c�a ng��i!H�y mau ho�n th�nh nhi�m v� : \nHo�n th�nh �i Thi�n M�n Tr�n <color=yellow>80<color> l�n \nHo�n th�nh �i L��ng S�n B�c <color=yellow>60<color> l�n\nS� d�ng <color=yellow>2000<color> N� Oa B�o H�p \nTr�ng th�nh c�ng <color=yellow>320<color> c�y b�t nh� nh�\nTr�ng th�nh c�ng <color=yellow>500<color> h�t gi�ng \nTr�ng th�nh c�ng <color=yellow>69<color> c�y t� linh")
	TaskTip("H�y mau ho�n th�nh nhi�m v� :Ho�n th�nh �i Thi�n M�n Tr�n 80 l�n, Ho�n th�nh �i L��ng S�n B�c 60,S� d�ng 2000, N� Oa B�o H�p ,Tr�ng th�nh c�ng 320c�y b�t nh� nh�, Tr�ng th�nh c�ng 500 h�t gi�ng ,Tr�ng th�nh c�ng 69 c�y t� linh")
end


function trans_talk_34_02()
	local nSeed = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2)
	local nSmallTree = gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) * 10 + gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) 
	local nTMT_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1)
	local nLSB_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK2)
	local n4Soul_Times = gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3)
	local nUseBaoHe = GetTask(TRANSLIFE_TASK_5_2)
	if nSeed == 500 and nSmallTree == 320 and nTMT_Times == 80 and nLSB_Times == 60 and n4Soul_Times == 69 and nUseBaoHe == 2000  then
		SetTask(TRANSLIFE_TASK_34, 0)
		SetTask(TRANSLIFE_TASK_34_FLAG, 0)
		SetTask(TRANSLIFE_TASK_5_1,0)
		SetTask(TRANSLIFE_TASK_5_2,0)
		SetTaskTrans()
		TaskTip("H�y mau ��n gi�p Ho�ng T� �o�n T� Thu�n")
	else
		Talk(1,"",format(szNpcName.."S� l�n ho�n th�nh nhi�m v�:\nTr�ng th�nh c�ng H�t Gi�ng: <color=yellow>%s/500 l�n<color>\nTr�ng th�nh c�ng B�t Nh� Nh�: <color=yellow>%s/320 l�n<color>\nHo�n th�nh �i Thi�n m�n tr�n : <color=yellow>%s/80 l�n<color>\nHo�n th�nh �i L��ng S�n B�c : <color=yellow>%s/60 l�n<color>\nTr�ng th�nh c�ng C�y T� Linh: <color=yellow>%s/69 l�n<color>\n S� d�ng N� Oa B�o H�p: <color=yellow>%s/2000 l�n<color>",nSeed,nSmallTree,nTMT_Times,nLSB_Times,n4Soul_Times,nUseBaoHe))
	end
end


function trans_talk_35()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 35 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"Nhi�m v� ti�u di�t h�n ma L�nh H��ng L�ng/trans_talk_35_01",
							"Tr� nhi�m v� ti�u di�t h�n ma L�nh H��ng L�ng/trans_talk_35_02",
							"N�ng l�c ta c�n h�n ch�!/nothing",	
						}
	local strSay = szNpcName.."H�mm ... nhanh v�y, B�n Ho�ng T� ch�a tin ng��i c� th� l�m nhanh nh� v�y, L�nh H��ng L�ng r�t t�n b�o v� hung �c , h�y th� s�c l�n n�a xem sao"
	Say(strSay,getn(tSay),tSay)
end


function trans_talk_35_01()
	Talk(1,"",szNpcName.."L�nh H��ng L�ng r�t t�n b�o v� hung �c , h�y th� s�c l�n n�a xem sao!")
	TaskTip("H�y mau ho�n th�nh nhi�m v� ti�u di�t L�nh H��ng L�ng r�t t�n b�o v� hung �c , h�y th� s�c l�n n�a xem sao")
end


function trans_talk_35_02()
	if GetTask(TRANSLIFE_TASK_5_2) == 1 then
		SetTask(TRANSLIFE_TASK_5_2,0)
		SetTaskTrans()
		TaskTip("H�y mau ��n g�p B�ch Ti�n Sinh ch�n h��ng tu luy�n")
	else
		Talk(1,"","Ng��i ch�a ho�n th�nh nhi�m v�!")
	end
end


function trans_talk_36()
	if GetTranslifeCount() ~= 4 or GetTaskTrans() ~= 36 or GetTranslifeFaction() == 0 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#select_translife(1)",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#select_translife(2)",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4)",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3)",
							"Gi�i thi�u c�c h��ng tu luy�n/view_info",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."<color=yellow>Sinh T� V� Ng�<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end


function view_info()
	local str1 = szNpcName.."<color=green>H�n Nguy�n C�ng<color> bao g�m 5 th�c, 10 th�nh. C�c chi�u th�c g�m  <color=yellow>H�p T��ng Quy Nguy�n - Th�n H�nh Th� Ch�nh - H�n T�c H�a Quang - ��n Nhi�n V� C�u - Sinh T� V� Ng�<color>. <color=green>H�n Nguy�n C�ng<color> c� 4 h��ng tu luy�n g�m <color=yellow>Long T�, H� T�, �ng T�, Ph�ng T�<color>. M�i h��ng tu luy�n s� �em l�i hi�u qu� kh�c nhau."
	local str2 = szNpcName.."<color=yellow>Long T�<color> d�ng ch�n kh� Long T� Quang t�o ra s�c c�ng k�ch c�c l�n, t�n c�ng ��ch th�. Ng��i tu luy�n theo h��ng <color=yelow>Long T�<color> c� th� gia t�ng <color=yellow>C�ng K�ch, �� T�p Trung, Ch�nh X�c<color>.\n<color=yellow>H� T�<color> d�ng ch�n kh� H� T� Quang t�o ra b�c t��ng ph�ng ng� v�ng ch�c, gi�m s�c t�n c�ng c�a ��ch th�. Ng��i tu luy�n theo h��ng <color=yelow>H� T�<color> c� th� gia t�ng <color=yellow>Gi�m Th� Th��ng, N�i Ngo�i Ph�ng, Sinh L�c, N�i L�c<color>."
	local str3 = szNpcName.."<color=yellow>Ph�ng T�<color> d�ng ch�n kh� Ph�ng T� Quang �em l�i hi�u qu� h� tr� v� bi�n, k�o d�i hi�u qu� c�c chi�u th�c v� c�ng. Ng��i tu luy�n theo h��ng <color=yelow>Ph�ng T�<color> c� th� gia t�ng <color=yellow>X�c Su�t Xu�t Chi�u, �� T�p Trung, Th�i Gian H� Tr� T�n C�ng, Th�i Gian H� Tr� Ph�ng Th�<color>.\n<color=yellow>�ng T�<color> d�ng ch�n kh� �ng T� Quang khi�n cho th�n ph�p nh� nh�ng nh� phong v�n, xu�t chi�u ��ch th� kh�ng k�p ph�n �ng. Ng��i tu luy�n theo h��ng <color=yelow>�ng T�<color> c� th� gia t�ng <color=yellow>B� Qua Ph�ng Ng� ��i Ph��ng, �� T�p Trung, Ch�nh X�c<color>."
	Talk(3,"",str1,str2,str3)
end


function cs6_infor()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta �ang n�m gi� ph�n ��u c�a b� k�p <color=yellow>T� Linh Ph�c Sinh<color>, l�nh ng� th�nh c�ng b� b� k�p n�y c� th� gi�p c�c h� ��t ��n m�t c�nh gi�i m�i trong �� Th�ng Kinh M�ch !!!"
		
	tinsert(tSay, "T�i h� �� c�ng l�c �� l�nh ng� b� k�p/cs6_npc1_infor1")		
	tinsert(tSay, "C�ng l�c c�a t�i h� c�n y�u/nothing")
	Say(tHeader, getn(tSay), tSay)
end


function cs6_npc1_infor1()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."�� l�nh ng� b� k�p <color=yellow>T� Linh Ph�c Sinh<color>, ��i hi�p ch� c�n c� �� 4000 v�ng, �� t�ng chuy�n sinh �t nh�t 1 l�n v� ph�i gi�p l�o phu l�m v�i nhi�m v� th� l�o phu m�i truy�n th� ph�n ��u c�a b� k�p <color=yellow>T� Linh Ph�c Sinh<color> !!!"
		
	tinsert(tSay, "L�nh ng� b� k�p T� Linh Ph�c Sinh (ti�u hao 4000 v�ng)/cs6_npc1_infor2")		
	tinsert(tSay, "C�ng l�c c�a t�i h� c�n y�u/nothing")
	Say(tHeader, getn(tSay), tSay)
end


function cs6_npc1_infor2()
	--if GetTranslifeCount() < 6 and GetTaskTrans() == 36 then		--b�t �k and �� kh�ng cho v� settask l�n 37 l�n n�a
	if GetTask(TSK_CS6_TULINH) < 1 then
		if GetTranslifeCount() < 1 then
			Talk(1,"","Kinh nghi�m chuy�n sinh c�a ��i hi�p kh�ng �� �� nh�n nhi�m v� !!!!")
			return 0		
		end
--		if GetLevel() < 99 then
--			Talk(1,"","Kinh nghi�m h�nh hi�p tr�n giang h� c�a ��i hi�p ch�a �� �� nh�n nhi�m v� !!!!")
--			return 0		
--		end
--		if GetExp() < 2000000000 then
--			Talk(1,"","Kinh nghi�m b�n t�u tr�n giang h� c�a ��i hi�p ch�a �� �� nh�n nhi�m v� !!!!")
--			return 0		
--		end
		if GetCash() < 40000000 then
			Talk(1,"","��i hi�p kh�ng mang theo �� v�ng �� gi�p �� l�o phu !!!!")
			return 0		
		end	
--		if MeridianGetLevel() < 2 then	
--			Talk(1,"","Kinh m�ch c�a ��i hi�p ch�a ��t c�p �� V� T��ng !!!!")
--			return 0			
--		end
		Pay(40000000)
		SetTask(TSK_CS6_TULINH,1)	--b�t ��u l�m nv chuy�n sinh 6
		--SetTaskTrans() --��t m�c 37, b�t ��u l�m nv chuy�n sinh 6
		local nSolanCS = GetTranslifeCount()
 		gf_WriteLogEx("CHUYEN SINH 6", "nh�n nhi�m v� chuy�n sinh 6", 1, "Nh�n nv chuy�n Sinh 6 npc 1: chuy�n sinh l�n "..nSolanCS)			
	end
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1,"","Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i nha !!!!")
		return 0			
	end	
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p qu� l� m�t k� nh�n trong V� L�m, b�t ��u l�nh ng� b� k�p <color=yellow>T� Linh Ph�c Sinh<color> �� ��t ph� b�nh c�nh. L�nh ng� th�nh c�ng c� th� kich th�ch ti�m l�c c�a b�n th�n ��t c�nh gi�i m�i trong �� Th�ng Kinh M�ch. Tr��c ti�n ��i hi�p h�y gi�p l�o phu ho�n th�nh c�c nhi�m v� c�u gi�p thi�n h�, t�o s�c s�ng cho qu�c gia !!!"
		
	tinsert(tSay, "Ho�n th�nh nhi�m v� /cs6_finish_npc1")			
	tinsert(tSay, "Ti�n �� nhi�m v� Tr� Qu�c - B�nh Thi�n H� /cs6_infor_nv_1")		
	tinsert(tSay, "Ti�n �� nhi�m v� ��m M�m S�c S�ng /cs6_infor_nv_2")		
	tinsert(tSay, "Ta ch� gh� th�m/nothing")			
	Say(tHeader, getn(tSay), tSay)
end


function cs6_finish_npc1()
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_TA = mod(floor(GetTask(TSK_CS6_COUNTA)/100),100)
	local nCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_LD = mod(floor(GetTask(TSK_CS6_COUNTB)/100),100)
	local nMax = 30
	local nCS6_BNN =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000),1000)	--B�t nh� nh�
	local nCS6_HG =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000000),1000)	--H�t gi�ng
	local cCS6_TL =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000),1000)		--T� linh
	local nCS6_NS =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000000),1000)		--Ng�i sao
	local nCS6_BH =  mod(floor(GetTask(TSK_CS6_GET1TIME)/1000),10000)		--N� oa b�o h�p
	if GetTask(TSK_CS6_TULINH) < 1 then
--	if GetTaskTrans() < 37 then
		Talk(1,"","��i hi�p ch�a nh�n nhi�m v� T� Linh Ph�c Sinh !!!!")
		return 0			
	end
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1,"","��i hi�p �� ho�n th�nh nhi�m v� T� Linh Ph�c Sinh !!!!")
		return 0			
	end	
	if nCS6_CT < nMax or nCS6_TA < nMax or nCS6_TL < nMax or nCS6_LD < nMax then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong nhi�m v� Tr� Qu�c - B�nh Thi�n H� !!!!")
		return 0	
	end
	if nCS6_BNN < 150 or nCS6_HG < 150 or cCS6_TL < 150 or nCS6_NS < 160 or nCS6_BH < 1000 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong nhi�m v� ��m M�m S�c S�ng !!!!")
		return 0	
	end	
	if GetTask(TSK_CS6_TULINH) == 1 then
		SetTask(TSK_CS6_TULINH,2)		--ho�n th�nh xong nhi�m v� B�ch Ti�n Sinh, �i t�m Quan Vi�n Tho�i nhi�m nh�n nv
		Talk(1,"","Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
	 	gf_WriteLogEx("CHUYEN SINH 6", "finish nhi�m v� chuy�n sinh 6 l�n 1", 1, "Finish nv chuy�n Sinh 6 npc 1")					
	end
end


function cs6_infor_nv_1()
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_TA = mod(floor(GetTask(TSK_CS6_COUNTA)/100),100)
	local cCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_LD = mod(floor(GetTask(TSK_CS6_COUNTB)/100),100)
	
	Talk(1,"","Ti�n �� th�c hi�n nhi�m v� !!!! \nC�ng T�: <color=red>"..nCS6_CT.."/30<color> \nTr� An: <color=red>"..nCS6_TA.."/30<color> \nTh�y L�i: <color=red>"..cCS6_TL.."/30<color> \nLuy�n ��n: <color=red>"..nCS6_LD.."/30<color>")
end


function cs6_infor_nv_2()
	local nCS6_BNN =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000),1000)	--B�t nh� nh�
	local nCS6_HG =  mod(floor(GetTask(TSK_CS6_COUNTA)/10000000),1000)	--H�t gi�ng
	local cCS6_TL =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000),1000)		--T� linh
	local nCS6_NS =  mod(floor(GetTask(TSK_CS6_COUNTB)/10000000),1000)		--Ng�i sao
	local nCS6_BH =  mod(floor(GetTask(TSK_CS6_GET1TIME)/1000),10000)		--N� oa b�o h�p
	Talk(1,"","Ti�n �� th�c hi�n nhi�m v� !!!! \nC�y B�t Nh� nh�: <color=red>"..nCS6_BNN.."/150<color> \nH�t Gi�ng: <color=red>"..nCS6_HG.."/150<color> \nT� Linh: <color=red>"..cCS6_TL.."/150<color> \nNg�i Sao: <color=red>"..nCS6_NS.."/160<color> \nN� Oa B�o H�p: <color=red>"..nCS6_BH.."/1000<color>")
end


function cs6_infor_nv_3()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	
	Talk(1,"","Ti�n �� th�c hi�n nhi�m v� !!!! \nT�i Nguy�n Chi�n: <color=red>"..nCS6_TNN.."/20<color> \nThi�n M�n Tr�n: <color=red>"..nCS6_TMT.."/20<color> \nL��ng S�n: <color=red>"..nCS6_LS.."/15<color>")
end


function cs6_infor_nv_4()
	local nCS6_DaoQuy = mod(floor(GetTask(TSK_CS6_DaoQuy_XoaQuy)/10000),10000)
	local nCS6_XoaQuy = mod(GetTask(TSK_CS6_DaoQuy_XoaQuy),10000)
	local nCS6_SaMac = mod(floor(GetTask(TSK_CS6_SaMac_TamBao)/10000),10000)
	local nCS6_TamBao = mod(GetTask(TSK_CS6_SaMac_TamBao),10000)
	local nCS6_KiemTien = mod(floor(GetTask(TSK_CS6_KiemTien_DichTien)/10000),10000)
	local nCS6_DichTien = mod(GetTask(TSK_CS6_KiemTien_DichTien),10000)
	local nCS6_LiLong = mod(floor(GetTask(TSK_CS6_LiLong_HoaHo)/10000),10000)
	local nCS6_HoaHo = mod(GetTask(TSK_CS6_LiLong_HoaHo),10000)
	Talk(1,"","Ti�n �� th�c hi�n nhi�m v� !!!! \nTi�u Lam �ao Qu�: <color=red>"..nCS6_DaoQuy.."/9999<color> \nTi�u Lam Xoa Qu�: <color=red>"..nCS6_XoaQuy.."/9999<color> \nSa M�c H�nh Nh�n: <color=red>"..nCS6_SaMac.."/9999<color>\nT�m B�o Nh�n: <color=red>"..nCS6_TamBao.."/9999<color>\nKi�m Ti�n T�: <color=red>"..nCS6_KiemTien.."/9999<color>\n��ch Ti�n T�: <color=red>"..nCS6_DichTien.."/9999<color>\nLi�t Nhan Li Long: <color=red>"..nCS6_LiLong.."/9999<color>\nX�ch Luy�n H�a H�: <color=red>"..nCS6_HoaHo.."/9999<color>")
end


function cs6_npc2_infor1()
	--if GetTranslifeCount() < 6 and GetTaskTrans() == 38 then		--b�t �k and �� kh�ng cho v� settask l�n 39 l�n n�a
--	if GetTask(TSK_CS6_TULINH) >= 2 then 
--		Talk(1,"","Khi th�i c� ch�n m�i, ta s� ti�t l� th�ng tin v� b� k�p T� Linh Ph�c Sinh cho ��i hi�p bi�t !!!!")		
--		return
--	end
	if GetTask(TSK_CS6_TULINH) == 2 then 
		--SetTaskTrans() --��t m�c 39, b�t ��u l�m nv chuy�n sinh 6 � NPC Vi�n Quan Tho�i Nhi�m
		SetTask(TSK_CS6_TULINH,3)
 		gf_WriteLogEx("CHUYEN SINH 6", "nh�n nhi�m v� chuy�n sinh 6", 1, "Nh�n nv chuy�n Sinh 6 npc 2a")		
	end
	
	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p qu� l� m�t k� nh�n trong V� L�m v� c� l�ng nh�n ��c, c�u gi�p ��t n��c"
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "Ho�n th�nh nhi�m v� C�ng hi�n cho qu�c gia/cs6_finish_phoban")	
		tinsert(tSay, "Gi�p �� ho�n th�nh c�ng hi�n qu�c gia/cs6_help_conghienquocgia_menu")
		tinsert(tSay, "Ti�n �� nhi�m v�/cs6_infor_nv_3")	
	end
	if GetTask(TSK_CS6_TULINH) == 4 then 	
		tinsert(tSay, "Ho�n th�nh nhi�m v� ��nh qu�i/cs6_finish_danhquai")	
		tinsert(tSay, "Gi�p �� gi�t qu�i/cs6_help_danhquai_infor")
		tinsert(tSay, "Ti�n �� nhi�m v�/cs6_infor_nv_4")		
	end
	tinsert(tSay, "Ta ch� gh� th�m/nothing")
	Say(tHeader, getn(tSay), tSay)
end

function cs6_finish_phoban()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if GetTask(TSK_CS6_TULINH) < 3 then
		Talk(1,"","��i hi�p c� g� c�n n�i v�i ta �!!!!")	
		return
	end	
	if nCS6_TNN < 20 or nCS6_TMT < 20 or nCS6_LS < 15 then
		Talk(1,"","��i hi�p c�n c� nhi�m v� n�o ch�a ho�n th�nh �!!!!")	
		return	
	end
--	if GetTask(TSK_CS6_TULINH) == 3 then 
--		SetTask(TSK_CS6_TULINH,4) -- ho�n th�nh xong chu�i nhi�m v� ph� b�n
-- 		gf_WriteLogEx("CHUYEN SINH 6", "nh�n nhi�m v� chuy�n sinh 6", 1, "Nh�n nv chuy�n Sinh 6 npc 2")		
--	end
	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p l� m�t ng��i r�t d�ng c�m v� y�u qu� h��ng, l�o phu r�t kh�m ph�c. Tuy nhi�n th� th�ch nh� v�y v�n ch�a �� �� l�o phu c� th� giao cho ��i hi�p b�o v�t gia truy�n. N�u ��i hi�p th�t s� c� h�ng th� v�i b�o v�t gia truy�n c�a ta th� ��i hi�p h�y ch�p nh�n th� th�ch c�a ta th�m m�t l�n n�a !!!"
		
	tinsert(tSay, "Ch�p nh�n th� th�ch ti�p theo/cs6_infor_danhquai")
	tinsert(tSay, "Ta ch� gh� th�m/nothing")
	Say(tHeader, getn(tSay), tSay)	
end
function cs6_infor_danhquai()
	if GetTask(TSK_CS6_TULINH) == 3 then 
		SetTask(TSK_CS6_TULINH,4)
 		gf_WriteLogEx("CHUYEN SINH 6", "nh�n nhi�m v� chuy�n sinh 6", 1, "Nh�n nv chuy�n Sinh 6 npc 2b")		
	end
	
	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p qu� l� m�t k� nh�n trong V� L�m v� c� l�ng nh�n ��c, c�u gi�p ��t n��c"
		
	tinsert(tSay, "Ho�n th�nh nhi�m v� ��nh qu�i/cs6_finish_danhquai")	
	tinsert(tSay, "Gi�p �� gi�t qu�i/cs6_help_danhquai_infor")		
	tinsert(tSay, "Ti�n �� nhi�m v�/cs6_infor_nv_4")	
	tinsert(tSay, "Ta ch� gh� th�m/nothing")
	Say(tHeader, getn(tSay), tSay)
end
function cs6_help_danhquai_infor()
	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."N�u ��i hi�p b�n luy�n c�ng, kh�ng c� th�i gian �� gi�t qu�i th� ta c� th� gi�p ��i hi�p. ��i qu�n tinh nhu� b� �n c�a ta hi�n �ang r�nh, c� th� gi�p ���c ��i hi�p nh�ng ph�i t�n ph� !!!"
		
	for i = 1, getn(tbMobsList_cs6) do
		tinsert(tSay,"Gi�p �� gi�t qu�i "..tbMobsList_cs6[i][1].."/#cs6_help_danhquai_kill("..i..")");
	end
	tinsert(tSay, "Gi�p ti�u di�t to�n b� qu�i nhi�m v�/#cs6_help_danhquai_kill(9)")	
	tinsert(tSay, "Ta ch� gh� th�m/nothing")
	Say(tHeader, getn(tSay), tSay)
end
function cs6_help_danhquai_kill(nType)
	if nType ~= 9 then
		if GetItemCount(2,1,30230) < 1000 then
			Talk(1, "","��i hi�p kh�ng c� �� 1000 xu v�t ph�m �� tr� ph� cho ��i qu�n c�a ta")
			return	
		end
	else
		if GetItemCount(2,1,30230) < 6000 then
			Talk(1, "","��i hi�p kh�ng c� �� 6000 xu v�t ph�m �� tr� ph� cho ��i qu�n c�a ta")
			return			
		end	
	end
	if nType ~= 9 then
		local nTaskValue = GetTask(tbMobsList_cs6[nType][2])
		local nMobCount = floor(nTaskValue/10000)
		local nPosition = tbMobsList_cs6[nType][3]
		local szMobName = tbMobsList_cs6[nType][1]
		if nPosition ~= 1 then
			nMobCount = mod(nTaskValue,10000)
		end
		if nMobCount >= 9999 then
			Talk(1, "","��i hi�p �� gi�t �� lo�i qu�i n�y r�i !!!")
			return		
		end
		DelItem(2,1,30230, 1000)	
		gf_WriteLogEx("GIET QUAI NHANH", "th�nh c�ng", 1, "Qu�i "..tbMobsList_cs6[nType][1])	
		if GetTask(TSK_CS6_TULINH) == 4 and nMobCount < 9999 then
			if nPosition == 1 then
				SetTask(tbMobsList_cs6[nType][2], 99990000 + mod(GetTask(tbMobsList_cs6[nType][2]),10000))
			else
				SetTask(tbMobsList_cs6[nType][2], floor(GetTask(tbMobsList_cs6[nType][2])/10000)*10000 + 9999)		
			end
			Msg2Player("Nhi�m v� T� Linh Ph�c Sinh: �� gi�t ���c 9999 "..szMobName)
		end			
	else
		local nCheck = 0
		for i = 1, getn(tbMobsList_cs6) do
			local nTaskValue_d = GetTask(tbMobsList_cs6[i][2])
			local nMobCount_d = floor(nTaskValue_d/10000)
			local nPosition_d = tbMobsList_cs6[i][3]
			local szMobName_d = tbMobsList_cs6[i][1]
			if nPosition_d ~= 1 then
				nMobCount_d = mod(nTaskValue_d,10000)
			end
			if nMobCount_d < 9999 then
				nCheck = 1
				break
			end	
		end
		if nCheck == 0 then
			Talk(1, "","��i hi�p �� gi�t h�t qu�i r�i, c�n ta gi�p �� g� n�a ???")
			return			
		end
		DelItem(2,1,30230, 6000)
	 	gf_WriteLogEx("GIET QUAI NHANH", "th�nh c�ng", 1, "T�t c� Qu�i")		
		SetTask(TSK_CS6_DaoQuy_XoaQuy, 99999999)
		SetTask(TSK_CS6_SaMac_TamBao, 99999999)
		SetTask(TSK_CS6_KiemTien_DichTien, 99999999)
		SetTask(TSK_CS6_LiLong_HoaHo, 99999999) 			
	end
end
function cs6_finish_danhquai()
	--- b�t �i�u ki�n ��nh qu�i
	local nCS6_DaoQuy = mod(floor(GetTask(TSK_CS6_DaoQuy_XoaQuy)/10000),10000)
	local nCS6_XoaQuy = mod(GetTask(TSK_CS6_DaoQuy_XoaQuy),10000)
	local nCS6_SaMac = mod(floor(GetTask(TSK_CS6_SaMac_TamBao)/10000),10000)
	local nCS6_TamBao = mod(GetTask(TSK_CS6_SaMac_TamBao),10000)
	local nCS6_KiemTien = mod(floor(GetTask(TSK_CS6_KiemTien_DichTien)/10000),10000)
	local nCS6_DichTien = mod(GetTask(TSK_CS6_KiemTien_DichTien),10000)
	local nCS6_LiLong = mod(floor(GetTask(TSK_CS6_LiLong_HoaHo)/10000),10000)
	local nCS6_HoaHo = mod(GetTask(TSK_CS6_LiLong_HoaHo),10000)
	local nMax = 9999
	if nCS6_DaoQuy < nMax or nCS6_XoaQuy < nMax or nCS6_SaMac < nMax or nCS6_TamBao < nMax or nCS6_KiemTien < nMax or nCS6_DichTien < nMax or nCS6_LiLong < nMax or nCS6_HoaHo < nMax then
		Talk(1, "","��i hi�p ch�a ho�n th�nh xong th� th�ch c�a ta")
		return
	end
	if GetTask(TSK_CS6_TULINH) < 4 then
		Talk(1,"","��i hi�p ch�a ��p �ng y�u c�u c�a ta !!!!!")	
		return
	end	
	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p qu� l� m�t k� nh�n trong V� L�m, b�t ��u l�nh ng� b� k�p <color=yellow>T� Linh Ph�c Sinh<color> �� ��t ph� b�nh c�nh. L�nh ng� th�nh c�ng c� th� kich th�ch ti�m l�c c�a b�n th�n ��t c�nh gi�i m�i trong �� Th�ng Kinh M�ch. !!!"
	--- b�t �i�u ki�n � ��y		
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#cs6_finish_confrim(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#cs6_finish_confrim(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#cs6_finish_confrim(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#cs6_finish_confrim(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function cs6_finish_confrim(nType)
	local nTransCount = GetTranslifeCount()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	if nTransCount < 5 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong nhi�m v� chuy�n sinh 5!!!")	
		return		
	end
	if GetTask(TSK_CS6_TULINH) < 4 then
		Talk(1,"","��i hi�p ch�a ��p �ng y�u c�u c�a ta!!!")	
		return
	end
	if GetTask(TSK_CS6_TULINH) >= 5 then
		Talk(1,"","��i hi�p qu� l� ng��i h�u duy�n v�i b� k�p T� Linh Ph�c Sinh!!!")	
		return
	end
	--- b�t �i�u ki�n � ��y
	if GetItemCount(2,0,1083) < 3 then
		Talk(1,"","��i hi�p kh�ng mang theo 3 cu�n Th�i D�ch H�n Nguy�n C�ng Ph� !!!!")	
		return
	end
	if GetItemCount(2,1,30345) < 1 then
		Talk(1,"","��i hi�p kh�ng mang theo 1 Chuy�n Sinh ��n !!!!")	
		return
	end
	if GetItemCount(2,1,30229) < 2 then
		Talk(1,"","��i hi�p kh�ng mang theo 2 B�ch Kim H�ng Bao !!!!")	
		return
	end	
	if GetLevel() < 99 then
		Talk(1,"","Kinh nghi�m h�nh hi�p tr�n giang h� c�a ��i hi�p ch�a �� �� nh�n nhi�m v� !!!!")
		return 0		
	end
	if GetExp() < 2000000000 then
		Talk(1,"","Kinh nghi�m b�n t�u tr�n giang h� c�a ��i hi�p ch�a �� �� nh�n nhi�m v� !!!!")
		return 0		
	end
	if MeridianGetLevel() < 2 then	
		Talk(1,"","Kinh m�ch c�a ��i hi�p ch�a ��t c�p �� V� T��ng !!!!")
		return 0			
	end
	DelItem(2,0,1083,3)
	DelItem(2,1,30345,1)
	DelItem(2,1,30229,2)
	ModifyExp(-2000000000)
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	
--
--	for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
--			P = P + GetBody() - 1
--			Pnew = 561 + GetBody()
--			lvatt3 = lvatt3 or 0
--			att3 = att3 or 0
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
--			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
--	end	
	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy�n Sinh 6 th�nh c�ng		
--	SetLevel(1,0)
	AddTitle(61,05)
	SetTask(TSK_CS6_TULINH,5)		--ho�n th�nh nh�m v� chuy�n sinh
 	gf_WriteLogEx("CHUYEN SINH 6", "chuy�n sinh th�nh c�ng", 1, "Finish nv chuy�n Sinh 6 npc 2")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")
end


function cs6_help_conghienquocgia_menu()
	tbSay = {}
	tinsert(tbSay, "Ti�u hao 1200 xu v�t ph�m ho�n th�nh 20 l�n t�i nguy�n chi�n/cs6_help_conghienquocgia_tnc")
	tinsert(tbSay, "Ti�u hao 1200 xu v�t ph�m ho�n th�nh 20 l�n Thi�n M�n Tr�n/cs6_help_conghienquocgia_tmt")
	tinsert(tbSay, "Ti�u hao 1200 xu v�t ph�m ho�n th�nh 15 l�n nhi�m v� L��ng S�n B�c/cs6_help_conghienquocgia_lsb")
	tinsert(tbSay, "Ti�u hao 3000 xu v�t ph�m ho�n th�nh nhi�m v� c�ng hi�n qu�c gia/cs6_help_conghienquocgia_all")
	tinsert(tbSay, "Ta mu�n t� m�nh ho�n th�nh nhi�m v�/gf_DoNothing")
	local szSay = "Ta l� ng��i ghi nh�n th�nh t�ch c�ng hi�n qu�c gia. N�u ng��i kh�ng mu�n c�ng hi�n s�c l�c th� c� th� c�ng hi�n t�i l�c, ta c�ng ghi nh�n..."
	Say(szSay,getn(tbSay), tbSay)
end


function cs6_help_conghienquocgia_tnc()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_TNN >= 20 then
		Talk(1,"","C�c h� �� ho�n th�nh ph�n nhi�m v� n�y, kh�ng c�n ph�i ti�u t�n th�m nhi�u t�i l�c.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C�c h� kh�ng �� 1200 xu v�t ph�m. Ta c�n s� ti�n n�y �� chi�u m� binh s� l�m nhi�m v� thay c�c h�.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = nCS6_LS *10000 + nCS6_TMT*100 + 20
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Ho�n th�nh 20 l�n nhi�m v� T�i nguy�n chi�n")
	end
end


function cs6_help_conghienquocgia_tmt()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_TMT >= 20 then
		Talk(1,"","C�c h� �� ho�n th�nh ph�n nhi�m v� n�y, kh�ng c�n ph�i ti�u t�n th�m nhi�u t�i l�c.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C�c h� kh�ng �� 1200 xu v�t ph�m. Ta c�n s� ti�n n�y �� chi�u m� binh s� l�m nhi�m v� thay c�c h�.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = nCS6_LS *10000 + 20*100 + nCS6_TNN
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Ho�n th�nh 20 l�n nhi�m v� Thi�n M�n Tr�n")
	end
end


function cs6_help_conghienquocgia_lsb()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_LS >= 15 then
		Talk(1,"","C�c h� �� ho�n th�nh ph�n nhi�m v� n�y, kh�ng c�n ph�i ti�u t�n th�m nhi�u t�i l�c.")
		return 0
	end
	if GetItemCount(2,1,30230) < 1200 then
		Talk(1,"","C�c h� kh�ng �� 1200 xu v�t ph�m. Ta c�n s� ti�n n�y �� chi�u m� binh s� l�m nhi�m v� thay c�c h�.")
		return 0
	end
	-- zzyyxx
	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)
	if DelItem(2,1,30230,1200) == 1 then
		local nTaskValue = 15 *10000 + nCS6_TMT*100 + nCS6_TNN
		SetTask(TSK_CS6_COUNTC, nTaskValue)
		TaskTip("Ho�n th�nh 15 l�n nhi�m v� L��ng S�n B�c")
	end
end


function cs6_help_conghienquocgia_all()
	local nCS6_TNN =  mod(GetTask(TSK_CS6_COUNTC),100)
	local nCS6_TMT =  mod(floor(GetTask(TSK_CS6_COUNTC)/100),100)
	local nCS6_LS =  mod(floor(GetTask(TSK_CS6_COUNTC)/10000),100)
	if nCS6_LS >= 15 and nCS6_TNN >= 20 and nCS6_TMT >= 20 then
		Talk(1,"","C�c h� �� ho�n th�nh nhi�m v� n�y, kh�ng c�n ph�i ti�u t�n th�m nhi�u t�i l�c.")
		return 0
	end
	if GetItemCount(2,1,30230) < 3000 then
		Talk(1,"","C�c h� kh�ng �� 3000 xu v�t ph�m. Ta c�n s� ti�n n�y �� chi�u m� binh s� l�m nhi�m v� thay c�c h�.")
		return 0
	end
	if DelItem(2,1,30230,3000) == 1 then
		SetTask(TSK_CS6_COUNTC, 152020)
		TaskTip("Ho�n th�nh nhi�m v� c�ng hi�n qu�c gia.")
	end
end



function go_exit()
	ExitGame()
end


function nothing()
end