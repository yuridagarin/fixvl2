--08������ʱע��ű�
--by vivi
--2008/01/14

function OnUse()
	Say("S� d�ng Thi�n Th�i Ch� Gi�i s� t�ng 1000 kinh nghi�m thu th�p k� n�ng, b�n mu�n t�ng k� n�ng kinh nghi�m s�ng n�o? <color=yellow>Ch� �: t�ng kinh nghi�m s� kh�ng v��t qu� ��ng c�p k� n�ng s�ng tr��c ��y.<color>",
		5,
		"��n c�y/#get_lifeskill_exp(1)",
		"L�m da/#get_lifeskill_exp(2)",
		"��o kho�ng/#get_lifeskill_exp(5)",
		"K�o t�/#get_lifeskill_exp(6)",
		"Kh�ng s� d�ng/")
end

function get_lifeskill_exp(nType)
	if GetLifeSkillLevel(0,nType) == 0 then
		Talk(1,"","B�n ch�a h�c ���c k� n�ng s�ng n�y.");
	elseif GetLifeSkillLevel(0,nType) >= 99 then
		Talk(1,"","K� n�ng s�ng c�a b�n �� ��t t�i c�p 99, kh�ng th� nh�n ti�p kinh nghi�m.");
	else
		if GetLifeSkillLevel(0,nType) == 79 and GetLifeSkillMaxLevel(0,nType) == 79 then
			Talk(1,"","Kinh nghi�m s�ng hi�n t�i c�a b�n �� v��t gi�i h�n, kh�ng th� t�ng kinh nghi�m ���c n�a.");
			return
		end 
		if DelItem(2,1,3210,1) == 1 then
			AddLifeSkillExp(0,nType,1000);
		end
	end
end