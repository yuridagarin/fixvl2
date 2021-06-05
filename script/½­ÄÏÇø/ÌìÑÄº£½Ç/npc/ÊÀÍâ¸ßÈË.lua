---�������.lua---
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

szNpcName = "<color=green>Th� Ngo�i cao nh�n<color>: "

function main()
	local nTaskTrans = GetTaskTrans()

	local tSay = {
							"H�y gi�p ta v� Trung Nguy�n/bianjing_gaoren",
							"Kh� kh�n l�m m�i ��n ���c ��o n�y, ta ph�i �i tham quan xem th� n�o!/no",
						 }
	if nTaskTrans >= 16 and nTaskTrans < 23 then		
		tinsert(tSay ,1,"T�m hi�u c�c h��ng tu luy�n/view_info")	
		tinsert(tSay ,1,"Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/translife_task_3")
	end
	
	if GetTranslifeCount() == 3 and GetLevel() == 99 and nTaskTrans < 25 then
		tinsert(tSay ,1,"T�m hi�u c�c h��ng tu luy�n/view_info")	
		tinsert(tSay ,1,"V�n b�i mu�n h�c H�n Nguy�n C�ng th�nh th� 8/learn_translife_skill_04")
	end
		
	Say("<color=green>Th� Ngo�i cao nh�n<color>: B�ng h�u sao l�u l�c ��n ��o n�y? Ch�c �� ch�u nhi�u v�t v�! C� mu�n tr� v� Trung Nguy�n kh�ng?",getn(tSay),tSay)
end;

function translife_task_3()
	if GetTaskTrans() == 16 then
		trans_talk_16()
	elseif GetTaskTrans() == 17 then
		trans_talk_17()
	elseif GetTaskTrans() == 18 then
		trans_talk_18()
	elseif GetTaskTrans() == 19 then
		trans_talk_19()
	elseif GetTaskTrans() == 20 then
		trans_talk_20()
	elseif GetTaskTrans() == 21 then
		trans_talk_21()
	elseif GetTaskTrans() == 22 then		
		trans_talk_22()
	elseif GetTaskTrans() >= 23 then
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng tung ho�nh thi�n h�, m�y ai l�nh h�i ���c?")
		return
	end
end

function learn_translife_skill_04()
	local nTaskTrans = GetTaskTrans()
	if nTaskTrans ~= 24 then
		Talk(1, "", "��i hi�p vui l�ng nh�n Ng�c B�i K� N�ng mi�n ph� tr��c khi l�m nhi�m H�n Nguy�n C�ng th�nh th� 8!")
		return
	end
	local szHeader = "��i hi�p mu�n C�i l�o ho�n ��ng? Tr��c ti�n ph�i ��nh b�i ���c Ng� Vi�t L�o T�. Nghe n�i B�ch Ti�n Sinh c� c�ch ��nh b�i Ng� Vi�t L�o T�. ��i hi�p mau l�n ���ng g�p th� xem."
	local tSay = {}
	
	tinsert(tSay, "V�n b�i s� �i g�p B�ch Ti�n Sinh �� h�i th�m ngay/trans_talk_24")
	tinsert(tSay, "V�n b�i �ang b�n, s� quay l�i v�o l�c kh�c/no")
	
	Say(szHeader, getn(tSay), tSay)
end

function bianjing_gaoren()
	DelMSPlayer(44,0);
end;

function no()
end;