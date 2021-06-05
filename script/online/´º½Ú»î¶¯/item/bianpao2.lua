
function OnUse()
	if HaveLearnedSkill(853) == 0 then
		Say("H�c k� n�ng ngh�nh t�n ni�n t�n 1 vi�n ph�o, b�n ��ng � h�c kh�ng?",2,"V�ng, ta mu�n h�c./learn","Th�i, �� l�n sau./no")
	elseif HaveLearnedSkill(853) == 1 then
		Say("Mu�n h�y b� k� n�ng ngh�nh t�n ni�n c�n t�n 1 vi�n ph�o, b�n c� ��ng � h�y b� kh�ng?",2,"V�ng, ta mu�n h�y b�./forget","Th�i, h�y gi� l�i./no")
	end
end

function learn()
	if DelItem(2,3,215,1) == 1 then
		LearnSkill(853)
		Say("B�n �� h�c k� n�ng ngh�nh t�n ni�n, n�u mu�n h�y b� h�y nh�p chu�t ph�i v�o vi�n ph�o.",0)
		TaskTip("H�y ch�n k� n�ng mu�n s� d�ng trong � k� n�ng b�n ph�i (kh�ng ph�i giao di�n F5).")
	end
end

function forget()
	if DelItem(2,3,215,1) == 1 then
		RemoveSkill(853)
		Say("B�n �� h�y b� k� n�ng ngh�nh t�n ni�n, n�u mu�n h�c l�i h�y nh�p chu�t ph�i v�o vi�n ph�o.",0)
	end
end

function no()

end