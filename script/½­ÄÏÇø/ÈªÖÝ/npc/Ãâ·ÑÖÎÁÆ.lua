--����ָ��
--lijinyong

function main()
	if HaveLearnedSkill("V� �ang ki�m kinh") == 1 and HaveLearnedSkill("L�u Quang ki�m ph�p") == 1 and HaveLearnedSkill("Ng� Ki�m Quy�t") == 1 then
		Talk(1, "", "KAO! Ng��i �� h�c h�t v� c�ng c�a l�o n��ng, c�n ��n h�c g� n�a!?")
	else
		Say("L�o n��ng s� d�y ng��i ch�t v� c�ng! Ng��i mu�n h�c v� c�ng g�?", 4, "V� �ang ki�m kinh/learn_wdjj", "L�u Quang ki�m ph�p/learn_lgjf", "Ng� Ki�m Quy�t/learn_yjj", "Kh�ng h�c!!!/endtalk")
	end
end;

function learn_wdjj()
	if HaveLearnedSkill(1) == 1 and HaveLearnedSkill(2) == 1 then
		LearnSkill("V� �ang ki�m kinh")
		Talk(1, "", "Ti�u t�! Ng��i �� h�c ���c V� �ang ki�m kinh! Thi tri�n th� xem!")
	else
		Talk(1, "", "Ti�u t�! S�c l�c c�a ng��i kh�ng ��! Kh�ng h�c ���c V� �ang ki�m kinh. H�y trau d�i Kh�ng Th� c�ng c� b�n v� Ki�m c�ng c� b�n tr��c!")
	end
end;

function learn_lgjf()
	if HaveLearnedSkill("V� �ang ki�m kinh") == 1 then
		LearnSkill("L�u Quang ki�m ph�p")
		Talk(1, "", "Ti�u t�! Ng��i �� h�c ���c L�u Quang ki�m ph�p! Thi tri�n th� xem!")
	else
		Talk(1, "", "Ti�u t�! S�c l�c c�a ng��i kh�ng ��! Kh�ng h�c ���c L�u Quang ki�m ph�p. Ph�i h�c ���c V� �ang ki�m kinh tr��c!")
	end
end;

function learn_yjj()
	if HaveLearnedSkill("L�u Quang ki�m ph�p") == 1 then
		LearnSkill("Ng� Ki�m Quy�t")
		Talk(1, "", "Ti�u t�! Ng��i �� h�c ���c Ng� Ki�m Quy�t! Thi tri�n th� xem!")
	else
		Talk(1, "", "Ti�u t�! S�c l�c c�a ng��i kh�ng ��! Kh�ng h�c ���c Ng� Ki�m Quy�t. Ph�i h�c ���c L�u Quang ki�m ph�p!")
	end
end;

function endtalk()
	Talk(1, "", "Kh�ng h�c th� th�i! T�i c�n g� ch�!")
end;