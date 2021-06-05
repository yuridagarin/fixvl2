--filename:yuelao_npc.lua
--create date:2006-01-18
--author:yanjun
--describe:���Ͻű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if GetLevel() < 10 then
		Say("B�n m�i b��c ch�n v�o giang h�, h�y r�n luy�n th�m r�i h�y ��n t�m ta.",0)
		return 0
	end
	if Is_QRYX_Activity() == 1 then
		local nDate = tonumber(date("%d"))
		if GetTask(TASK_GOT_AWARD) ~= nDate then
			SetTask(TASK_GOT_AWARD,0)
		end
		if GetTask(TASK_GOT_AWARD) ~= 0 then
			Say("H�m nay b�n �� ho�n th�nh xong t�t c� nhi�m v� l� t�nh nh�n v� �� nh�n gi�i th��ng, ng�y mai h�y l�m ti�p nh�.",0)
			return 0
		end
		if GetTask(TASK_LOVESTORY1) == 0 or GetTask(TASK_LOVESTORY2) == 0 or GetTask(TASK_LOVESTORY3) == 0 or GetTask(TASK_LOVESTORY4) == 0 then
			local selTab = {
						"�o tr� s� duy�n ph�n/question1",
						"Xem n�i dung ho�t ��ng./know_detail",
						"Ta nh�n ���c gi�ng hoa h�ng, s� d�ng nh� th� n�o?/know_useseed",
						"Nh�n l�i nhi�m v�./reaccept",
						"K�t th�c ��i tho�i./nothing"
						}
			Say("L� t�nh nh�n l� do c�c nh� truy�n gi�o T�y Ph��ng mang ��n, hi�n nay n� r�t ph� bi�n.",5,selTab)
		elseif AllTaskComplete() == 1 then
			local selUseSeed = {
						"Ta mu�n l�nh th��ng./get_present",
						"Ta nh�n ���c gi�ng hoa h�ng, s� d�ng nh� th� n�o?/know_useseed",
						"K�t th�c ��i tho�i./nothing"
						}
			Say("Ch�c m�ng ng��i ho�n th�nh t�t c� nhi�m v�, t�m ta c� vi�c g�?",3,selUseSeed)
		else
			local selReset = {
						"Ta mu�n l�m l�i nhi�m v�./reset",
						"Ta mu�n tra xem quy t�c nhi�m v�./know_detail",
						"K�t th�c ��i tho�i./nothing"
						}
			Say("Sao ch�a l�m nhi�m v� v�y? G�p kh� kh�n �?",3,selReset)
		end
	else
		local selUseSeed = {
					"Ta mu�n l�nh th��ng./get_present",
					"Ta nh�n ���c gi�ng hoa h�ng, s� d�ng nh� th� n�o?/know_useseed",
					"K�t th�c ��i tho�i./nothing"
					}
		Say("Ch�c c�c ��i t�nh nh�n s�m th�nh phu th�.",3,selUseSeed)
	end
end

function abandon()
	SetTask(TASK_YUANFEN,0)
end

function nothing()

end

function question1()
	if GetTask(TASK_GOT_QRJ) == 1 then
		Say("B�n �� tr� l�i qu� c�u h�i, l� n�o b�n qu�n ch� s� duy�n ph�n! H�y s� d�ng T�nh nh�n k�t �� tra xem.",0)
		return 0
	end
	SetTask(TASK_YUANFEN,0)
	local ansTab = {
			"Th�ch/#question2(9)",
			"Kh�ng m�ng ��n/#question2(6)",
			"Kh�ng th�ch/#question2(3)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	Say("C�u h�i 1: B�n c� th�ch PK gi�a nh�ng ng��i ch�i v�i nhau kh�ng?",4,ansTab)
end

function question2(i)
	local ansTab = {
			"Th�ch/#question3(3)",
			"Kh�ng m�ng ��n/#question3(6)",
			"Kh�ng th�ch/#question3(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u h�i 2: B�n c� th�ch nh�ng c�u chuy�n trong chu�i nhi�m v� li�n ho�n kh�ng?",4,ansTab)
end

function question3(i)
	local ansTab = {
			"Th�ch/#question4(3)",
			"Kh�ng m�ng ��n/#question4(6)",
			"Kh�ng th�ch/#question4(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u h�i 3: B�n c� th�ch k� n�ng s�ng kh�ng?",4,ansTab)
end

function question4(i)
	local ansTab = {
			"Th�ch/#question5(9)",
			"Kh�ng m�ng ��n/#question5(6)",
			"Kh�ng th�ch/#question5(3)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u h�i 4: B�n c� th�ch l�m bang ch� kh�ng?",4,ansTab)
end

function question5(i)
	local ansTab = {
			"Th�ch/#question6(3)",
			"Kh�ng m�ng ��n/#question6(6)",
			"Kh�ng th�ch/#question6(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 5: B�n c� th�ch ngo�i trang kh�ng?",4,ansTab)
end

function question6(i)
	local ansTab = {
			"Th�ch/#question7(9)",
			"Kh�ng m�ng ��n/#question7(6)",
			"Kh�ng th�ch/#question7(3)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 6: B�n c� th�ch trang b� c�c ph�m kh�ng?",4,ansTab)
end

function question7(i)
	local ansTab = {
			"Th�ch/#question8(3)",
			"Kh�ng m�ng ��n/#question8(6)",
			"Kh�ng th�ch/#question8(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 7: B�n c� th�ch h� th�ng b�y b�n ��c bi�t s�p m� kh�ng?",4,ansTab)
end

function question8(i)
	local ansTab = {
			"Th�ch/#question9(3)",
			"Kh�ng m�ng ��n/#question9(6)",
			"Kh�ng th�ch/#question9(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 8: B�n c� th�ch t�o th�m m�n ph�i m�i kh�ng?",4,ansTab)
end

function question9(i)
	local ansTab = {
			"Th�ch/#question10(3)",
			"Kh�ng m�ng ��n/#question10(6)",
			"Kh�ng th�ch/#question10(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 9: B�n c� th�ch h� th�ng th� nu�i kh�ng?",4,ansTab)
end

function question10(i)
	local ansTab = {
			"Th�ch/#question11(3)",
			"Kh�ng m�ng ��n/#question11(6)",
			"Kh�ng th�ch/#question11(9)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 10: B�n c� th�ch khi�u chi�n v�i BOSS c�p cao kh�ng?",4,ansTab)
end

function question11(i)
	local ansTab = {
			"Th�ch/#endquestion(9)",
			"Kh�ng m�ng ��n/#endquestion(6)",
			"Kh�ng th�ch/#endquestion(3)",
			"L�n sau m�i n�i ti�p nh�./abandon"
			}
	SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
	Say("C�u 11: B�n c� th�ch khi�u chi�n trong T�ng Ki�m s�n trang?",4,ansTab)
end

function endquestion(i)
	if GetTask(TASK_YUANFEN) >= 30 then
		AddItem(2,1,333,1)	--���˽�
		SetTask(TASK_LOVESTORY1,1)
		SetTask(TASK_LOVESTORY2,1)
		SetTask(TASK_LOVESTORY3,1)
		SetTask(TASK_LOVESTORY4,1)
		TaskTip("�� tra xem nhi�m v� l� t�nh nh�n, nh�n F11.")
		Msg2Player("B�n �� nh�n 4 nhi�m v� t� Nguy�t l�o, h�y tra xem trong giao di�n nhi�m v�.")
		SetTask(TASK_YUANFEN,GetTask(TASK_YUANFEN)+i)
		SetTask(TASK_GOT_QRJ,1)
		CreateTrigger(0,1202,3110) --���ɿ���������
		Say("Ha! Ha! Ch� s� duy�n ph�n c�a ng��i l�: <color=yellow>"..GetTask(TASK_YUANFEN).."<color>, h�y mau �i t�m � trung nh�n c�a m�nh �i.",0)
	end
end

function know_detail()
	Talk(4,"main","Khi ho�t ��ng m�i b�t ��u, c� th� tr�c nghi�m ch� s� duy�n ph�n � ch� ta. Sau �� hai ng��i gi�p ta t�c h�p 4 ��i uy�n ��ng kh�c.",
				"H�y gi�p ta t�c h�p 4 ��i t�nh nh�n, sau �� quay l�i ��y nh�n th��ng nh�!",
				"��y xem nh� l� 4 nhi�m v� nh�, m�i nhi�m v� m�i ng�y m�i ng��i ch� c� th� l�m 1 l�n. ��ng th�i 2 ng��i v�n trong t� ��i th� m�i ho�n th�nh nhi�m v�, n�u kh�ng th� nhi�m v� h�m �� xem nh� kh�ng ho�n th�nh.",
				"S� kh�c nhau ch� s� duy�n ph�n v� �� th�n thi�n c�a 2 ng��i s� �nh h��ng ��n x�c su�t r�i v�t ph�m nhi�m v�. N�u ch� s� duy�n ph�n t��ng ��ng ho�c �� th�n thi�n l�n h�n 2000 th� x�c su�t r�i v�t ph�m cao nh�t, ng��c l�i s� th�p d�n.")
end

function reset()
	SetTask(TASK_LOVESTORY1,1)
	SetTask(TASK_LOVESTORY2,1)
	SetTask(TASK_LOVESTORY3,1)
	SetTask(TASK_LOVESTORY4,1)
	SetTask(TASK_TEAM_INDEX,0)
	Say("Th�i ���c, l� h�i t�nh nh�n �� b�t ��u, ng��i h�y nhanh ch�ng tham gia!",0)
	TaskTip("�� tra xem nhi�m v� l� t�nh nh�n, nh�n F11.")	
	Msg2Player("B�n �� nh�n 4 nhi�m v� t� Nguy�t l�o, h�y tra xem trong giao di�n nhi�m v�.")
end

function get_present()
	if AllTaskComplete() == 1 then
		if IsLoversTeam() == 1 then
			local nDate = tonumber(date("%d"))
			local OldPlayerIndex = PlayerIndex
			local maleIndex,femaleIndex = GetLoversIndex()
			local teamIndex1,teamIndex2
			PlayerIndex = maleIndex
			teamIndex1 = GetTask(TASK_TEAM_INDEX)
			PlayerIndex = femaleIndex
			teamIndex2 = GetTask(TASK_TEAM_INDEX)
			if teamIndex1 ~= teamIndex2 then
				Say("Tho�t ��u l� ��i b�n, sao b�y gi� l� ��i t�nh nh�n v�y?",0)
				PlayerIndex = OldPlayerIndex
				return 0
			else
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					if GetSex() == 1 then
						if AddItem(2,0,352,1) == 1 then	--õ�廨����
							Msg2Player("B�n nh�n ���c 1 h�t gi�ng hoa h�ng.")
							WriteLog("[Ho�t ��ng l� t�nh nh�n v� t�t nguy�n ti�u (ph�n th��ng ho�n th�nh nhi�m v�)]:"..GetName().."Nh�n ���c 1 h�t gi�ng hoa h�ng.")						
						end
					end
					if AddItem(2,1,332,1) == 1 then	--֥������Ԫ��
						WriteLog("[Ho�t ��ng l� t�nh nh�n v� t�t nguy�n ti�u (ph�n th��ng ho�n th�nh nhi�m v�)]:"..GetName().."Nh�n ���c 1 Chi Ma H��ng")
						Msg2Player("B�n nh�n ���c 1 Chi Ma H��ng")
					end
					SetTask(TASK_GOT_AWARD,nDate)
					SetTask(TASK_LOVESTORY1,0)
					SetTask(TASK_LOVESTORY2,0)
					SetTask(TASK_LOVESTORY3,0)
					SetTask(TASK_LOVESTORY4,0)
					SetTask(TASK_TEAM_INDEX,0)	
				end
				PlayerIndex = OldPlayerIndex
			end
		else
			Say("Tho�t ��u l� ��i b�n, sao b�y gi� l� ��i t�nh nh�n v�y?",0)
		end
	else
		Say("H�m nay b�n �� ho�n th�nh xong t�t c� nhi�m v� l� t�nh nh�n v� �� nh�n gi�i th��ng, ng�y mai h�y l�m ti�p nh�.",0)
	end
end

function know_useseed()
	Talk(3,"main","Sau khi ho�n th�nh nhi�m v� t�nh y�u, nh�n v�t nam s� nh�n ���c h�t gi�ng hoa h�ng v� l� th�y, ch� c� ng��i nam trong t� ��i m�i c� th� tr�ng h�t gi�ng hoa h�ng, sau khi tr�ng, t�i v� tr� ng��i nam �ang ��ng s� hi�n l�n 1 c�y con mang t�n nh�n v�t n�.",
				"C� 30 ph�t c� th� t��i l� th�y cho c�y con m�t l�n, trong qu� tr�nh t��i n��c 2 ng��i v�n � trong t� ��i. N�u nh� trong v�ng 1h, kh�ng t��i n��c, hoa h�ng s� kh� ch�t.",
				"M�i l�n t��i n��c, hoa s� l�n l�n, sau 30 ph�t � tr�ng th�i hoa h�ng, ng��i n� m�i c� th� h�i xu�ng.")
end

function reaccept()
	if GetTask(TASK_GOT_QRJ) == 0 then
		Say("B�n v�n ch�a ti�p nh�n tr�c nghi�m ch� s� duy�n ph�n �?",0)
	else
		SetTask(TASK_LOVESTORY1,1)
		SetTask(TASK_LOVESTORY2,1)
		SetTask(TASK_LOVESTORY3,1)
		SetTask(TASK_LOVESTORY4,1)
		SetTask(TASK_TEAM_INDEX,0)		
		Say("Th�i ���c, l� h�i t�nh nh�n �� b�t ��u, ng��i h�y nhanh ch�ng tham gia!",0)
		TaskTip("�� tra xem nhi�m v� l� t�nh nh�n, nh�n F11.")
		Msg2Player("B�n �� nh�n 4 nhi�m v� t� Nguy�t l�o, h�y tra xem trong giao di�n nhi�m v�.")
	end
end