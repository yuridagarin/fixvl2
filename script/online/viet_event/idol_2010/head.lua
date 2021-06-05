Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 100816 or nDate > 100829 then
		return
	end
	local szName = "Th�n T��ng V� L�m"
	local tList = {
		[1] = 
		{
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		},
		[2] = 
		{
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		},
		[3] = 
		{		
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		},
		[4] = 
		{
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		},
		[5] = 
		{
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		},
		[6] = 
		{		
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		},
		[7] = 
		{		
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",
		},
		[8] = 
		{
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",	
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		},
		[9] = 
		{		
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",	
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		},
		[10] = 
		{		
		"Ta mu�n b�nh ch�n th�n t��ng 280 - Tr��ng Nh�t C�m Thy (m�y ch� Phi �ng)/#do_vote(10)",
		"Ta mu�n b�nh ch�n th�n t��ng 62 - D��ng Tu�n T� (m�y ch� X�ch Long)/#do_vote(1)",
		"Ta mu�n b�nh ch�n th�n t��ng 17 - V� Th� Thanh Nh�n (m�y ch� ��i H�)/#do_vote(2)",
		"Ta mu�n b�nh ch�n th�n t��ng 15 - Nguy�n H�i An (m�y ch� Quy�n Long)/#do_vote(3)",
		"Ta mu�n b�nh ch�n th�n t��ng 48 - Tr�n H�u Ph��c (m�y ch� K� �ng)/#do_vote(4)",
		"Ta mu�n b�nh ch�n th�n t��ng 213 - Ph�m Minh Ch�u (m�y ch� Ti�n Ph�ng)/#do_vote(5)",
		"Ta mu�n b�nh ch�n th�n t��ng 52 - Ng� ��nh Giang Tri�u (m�y ch� ��i �ng)/#do_vote(6)",	
		"Ta mu�n b�nh ch�n th�n t��ng 230 - Nguy�n Minh Hi�n (m�y ch� B�ch �ng)/#do_vote(7)",
		"Ta mu�n b�nh ch�n th�n t��ng 276 - Ph�m Ng�c Th�y Dung (m�y ch� Phi H�)/#do_vote(8)",
		"Ta mu�n b�nh ch�n th�n t��ng 206 - Tr�n Ki�n (m�y ch� Ho�ng H�)/#do_vote(9)",
		},
	}

	local nRand = random(1,10)
	local tSay = tList[nRand]
	
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng qu� ��ng ��o tham gia b�nh ch�n cu�c thi <color=red>Th�n t��ng �m nh�c V� L�m 2<color>. H�y b�nh ch�n cho th� sinh m� ��ng ��o c�m th�y �n t��ng nh�t trong danh s�ch d��i ��y:"
	
	tinsert(tSay, "Xem h��ng d�n/do_guide")
	tinsert(tSay, "Ta ch� gh� ngang./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_vote(nType)
	local tVoteName =
	{
		"62 - D��ng Tu�n T�",
		"17 - V� Th� Thanh Nh�n",
		"15 - Nguy�n H�i An",
		"48 - Tr�n H�u Ph��c",
		"213 - Ph�m Minh Ch�u",
		"52 - Ng� ��nh Giang Tri�u",
		"230 - Nguy�n Minh Hi�n",
		"276 - Ph�m Ng�c Th�y Dung",
		"206 - Tr�n Ki�n",
		"280 - Tr��ng Nh�t C�m Thy",
	}
	local szLogTitle = "JX2 Idol"
	local szName = "<color=green>Th�n T��ng V� L�m :<color>"
	local nDate = tonumber(date("%y%m%d"))
	local nVoteDate = floor(GetTask(JX2_IDOL_TASK) / 100)
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� tham gia b�nh ch�n!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch�a gia nh�p m�n ph�i kh�ng th� tham gia b�nh ch�n!")
		return
	end
	
	if nDate ~= nVoteDate then
		SetTask(JX2_IDOL_TASK, nDate * 100)
	end
	
	local nVote = mod(GetTask(JX2_IDOL_TASK), 100)
	
	if nVote >= 10 then
		local tSay =
		{
			"Hi�u r�i! ng�y mai ta s� quay l�i./do_nothing",
		}
		
		Say(szName.."M�i nh�n v�t ch� c� th� b�nh ch�n cho th�n t��ng m�nh y�u th�ch 10 l�n trong 1 ng�y. H�m nay c�c h� �� b�nh ch�n 10 l�n r�i, ng�y mai l�i ti�p t�c nh�.", getn(tSay), tSay)
		return
	end
	
	if GetItemCount(2, 0, 1162) <= 0 then
		local tSay =
		{
			"Th�t ng�i qu�! T�i h� s� quay l�i sau./do_nothing",
		}
		
		Say(szName.."M�i l�n k�ch ho�t b�nh ch�n c�n 1 Hoa H�ng, c�c h� kh�ng mang theo th� ph�i..", getn(tSay), tSay)
		return
	end

	if DelItem(2, 0, 1162, 1) == 1 then
		SetTask(JX2_IDOL_TASK, GetTask(JX2_IDOL_TASK) + 1)
		ModifyExp(1000000)
		Msg2Player("Nh�n ���c 1000000 �i�m kinh nghi�m!")
		Talk(1,"","B�nh ch�n cho "..tVoteName[nType])
		gf_WriteLogEx(szLogTitle, "Tham gia b�nh ch�n", 1, tVoteName[nType])
	end
end

function do_guide()
	local szName = "Th�n T��ng V� L�m"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch��ng tr�nh b�nh ch�n Th�n T��ng V� L�m di�n ra t� ng�y 16/08/2010 ��n 29/08/2010. Trong th�i gian b�nh ch�n, ��ng ��o c� th� s� d�ng ��o c� Hoa H�ng �� �� b�nh ch�n cho nh�n v�t Th�n T��ng c�a m�nh, m�i hoa h�ng s� mang v� 1 �i�m b�nh ch�n cho Th�n T��ng, m�i ng�y c� th� b�nh ch�n ���c 10 l�n. M�i b�nh ch�n th�nh c�ng s� nh�n ph�n th��ng kinh nghi�m. \nHoa H�ng c� th� thu th�p khi ho�n th�nh nhi�m v� thu th�p t�i nguy�n chi�n, tr�ng h�t gi�ng, tr�ng c�y b�t nh� nh�, s� d�ng N� Oa B�o H�p."
	
	tinsert(tSay, "Xem th�ng tin kh�c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end