Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 110519 or nDate > 110602 then
		Talk(1, "", "�� h�t h�n b�nh ch�n!")
		return
	end
	local szName = "Th�n T��ng V� L�m"
	local tList = {
		[1] = 
		{
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
		},
		[2] =
		{
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
		},
		[3] =
		{
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
		},
		[4] =
		{
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
		},
		[5] =
		{
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
		},
		[6] =
		{
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
		},
		[7] =
		{
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
		},
		[8] =
		{
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
		},
		[9] =
		{
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
		},
		[10] =
		{
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
		},
		[11] =
		{
			"B�nh ch�n SBD 050 - Qu�ch Minh C��ng - o0oMichaelQuach (m�y ch� T�ng Long)/#do_vote(11)",
			"B�nh ch�n SBD 047 - Tr�n Ph� - xIxHeoAnh (m�y ch� Vi�t �ng-)/#do_vote(1)",
			"B�nh ch�n SBD 007 - Ph�m Th�nh Nh�n - phamthanhnhan (m�y ch� Vi�t �ng)/#do_vote(2)",
			"B�nh ch�n SBD 090 - Tr�n Th� B�ch Ph��ng - o4ever (m�y ch� B�ch H�)/#do_vote(3)",
			"B�nh ch�n SBD 067 - Th�i �� Ch� Minh - DuongBatMuoi (m�y ch� Tr� Long)/#do_vote(4)",
			"B�nh ch�n SBD 068 - T� Huy�n Trinh - PeXjnhNgamy(m�y ch� Tr� Long)/#do_vote(5)",
			"B�nh ch�n SBD 064 - V� Huy Vinh - zB�chM�Ho�ngT�z (m�y ch� K� H�)/#do_vote(6)",
			"B�nh ch�n SBD 093 - L� M�nh C��ng - ZxBinhThuongxZ (m�y ch� Song H�)/#do_vote(7)",
			"B�nh ch�n SBD 033 - L� Tu�n Anh - zZ4NhH4iZz (m�y ch� Ho�ng H�	)/#do_vote(8)",
			"B�nh ch�n SBD 015 - Mai Nguy�n Minh Huy -  hi3px0ngz0ng(m�y ch� B�ch H�)/#do_vote(9)",
			"B�nh ch�n SBD 038 - Ph�m Vi�t D�ng - policehotboy (m�y ch� Tr� Long)/#do_vote(10)",
		},
		
}

	local nRand = random(1,11)
	local tSay = tList[nRand]
	
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng qu� ��ng ��o tham gia  cu�c thi <color=red>B�nh ch�n ho�t ��ng Karaoke V� L�m 2<color>. H�y b�nh ch�n cho th� sinh m� ��ng ��o c�m th�y �n t��ng nh�t trong danh s�ch d��i ��y:"
	
	tinsert(tSay, "Xem h��ng d�n/do_guide")
	tinsert(tSay, "Ta ch� gh� ngang./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_vote(nType)

	local szLogTitle = "B�nh ch�n Karaoke"
	local szName = "<color=green>Th�n T��ng V� L�m :<color>"
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� tham gia b�nh ch�n!")
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch�a gia nh�p m�n ph�i kh�ng th� tham gia b�nh ch�n!")
		return
	end
	
	SetTaskTemp(TSK_KARAOKETEMP, nType) 
	
	WinFlowerNumber()
	
end

function do_guide()
	local szName = "Th�n T��ng V� L�m"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch��ng tr�nh b�nh ch�n ho�t ��ng Karaoke di�n ra t� ng�y 19/05/2011 ��n 2/06/2011. Trong th�i gian b�nh ch�n, ��ng ��o c� th� s� d�ng ��o c� b� hoa chi�n th�ng �� b�nh ch�n cho nh�n v�t Th�n T��ng c�a m�nh. T� b� hoa th� 1.001 tr� �i, ng��i ch�i ch� nh�n ���c �i�m b�nh ch�n. "
	
	tinsert(tSay, "Xem th�ng tin kh�c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function WinFlowerNumber()
	AskClientForNumber("WinFlower",1,999,"S� b� hoa chi�n th�ng !")
end

function WinFlower( nCount)
	
	local tVoteName =
	{
		"047 - Tr�n Ph�",
		"007 - Ph�m Th�nh Nh�n",
		"090 - Tr�n Th� B�ch Ph��ng",
		"067 - Th�i �� Ch� Minh",
		"068 - T� Huy�n Trinh",
		"064 - V� Huy Vinh",
		"093 - L� M�nh C��ng",
		"033 - L� Tu�n Anh",
		"015 - Mai Nguy�n Minh Huy",
		"038 - Ph�m Vi�t D�ng",
		"050 - Qu�ch Minh C��ng",
	}
	
	if  nCount < 1 or nCount > 999  then
		Msg2Player("S� b� hoa chi�n th�ng nh�p v�o kh�ng h�p l�")
		return
	end
	if GetItemCount(2, 1, 30296)  < nCount  then
		Msg2Player("H�nh trang ��i hi�p kh�ng �� "..nCount.." b� hoa chi�n th�ng!!")
		return
	end
	local nVotedCount = GetTask(TSK_KARAOKE)
	local nWinFlower = 0
	local nExpCount = 0
	local nMark = 0;
	
	if nVotedCount >= 1000 then
		 nWinFlower = nCount
		 nMark = nWinFlower * 20
	else
		local nTotalVoted =  nVotedCount + nCount
		if nTotalVoted > 1000  then
			nWinFlower = nTotalVoted - 1000
			nExpCount = 1000 -  nVotedCount
			nMark = nExpCount * 10 + nWinFlower * 20
		else
			nWinFlower = nCount
			nExpCount = nCount
			nMark = nCount * 10
		end
	end
	
	if nExpCount == 0 then
		if DelItem(2, 1, 30296, nCount) == 1  then
			SetTask(TSK_KARAOKE, GetTask(TSK_KARAOKE) + nWinFlower)
		end
	else
		if DelItem(2, 1, 30296, nCount) == 1  then
			SetTask(TSK_KARAOKE, GetTask(TSK_KARAOKE) + nWinFlower)
			local nExp = nExpCount * 250000
			ModifyExp(nExp)
			Msg2Player("Nh�n ���c  "..nExp.." �i�m kinh nghi�m!")
		end
	end
	
	local nType  = GetTaskTemp(TSK_KARAOKETEMP)
	
	gf_WriteLogEx(szLogTitle, "Tham gia b�nh ch�n", nMark, tVoteName[nType])
	
	Talk(1,"","S� �i�m b�n b�nh ch�n cho "..tVoteName[nType] .. " " .. nMark)
end

function do_nothing()

end