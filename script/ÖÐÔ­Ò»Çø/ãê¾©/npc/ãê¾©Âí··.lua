Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");

function main()
  	local nTaskValue = FN_GetTaskState(FN_YM);

	if (nTaskValue==3) then
		task_107();
		return
  	end;
	Talk(1,"","B�n M� t�c ho�nh h�nh qu� n�n kh�ng c� ng�a qu� cung �ng, hay l� b�ng h�u ��n Ng� c�c xem th�!");
--
--	local strSay = {
--		"<color=green>�꾩��<color>����λ�������������д�����ǧ�����ԣ���֤û�з�ţ���������У���Ҫ������û���������",
--		"��Ҫ����/Buy",
--		"��Ҫι��/Feed",
--		"��Ҫ�뿪/Leave",
--	}
--	Say(strSay[1], 3, strSay[2], strSay[3], strSay[4])
end

function Buy()
	Sale(54)
	Talk(1,"","To�n l� ng�a qu� �i ng�n d�m, ng�i ch�n m�t con �i!")
end

function Feed()
	local strSay = {
		"Ng�a kh�ch quan c� ch�t m�t m�i, �n c� lo�i t�t c�n <color=red>",
		"<color> ti�n ��ng. Kh�ch quan mu�n cho ng�a �n kh�ng?",
		"Cho/FeedYes",
		"Kh�ng cho/Leave",
		"Ng�a kh�ch quan c�n kh�e kh�ng c�n �n th�m c�.",
		"V� kh�ch quan...c� tuy t�t nh�ng...Kh�ch quan mu�n d�ng th� �?",
	}

	local nPrice = GetFeedHorsePrice()
	if nPrice < 0 then
		Talk(1,"",strSay[6])
	elseif nPrice == 0 then
		Talk(1,"",strSay[5])
	else
		Say(strSay[1]..nPrice..strSay[2], 2, strSay[3], strSay[4])
	end
end

function FeedYes()
	local strSay = {
		"C� t�t ��y! �� ti�u nh�n gi�p kh�ch quan cho ng�a �n!",
		"Kh�ch quan �em �t ti�n sao mua ���c c� lo�i t�t?",
	}
	local nPrice = GetFeedHorsePrice()
	local nMoney = GetCash()

	if nPrice > nMoney then
		Talk(1,"",strSay[2])
	else
		Talk(1,"",strSay[1])
		FeedHorse()
	end
end

function Leave()
end
