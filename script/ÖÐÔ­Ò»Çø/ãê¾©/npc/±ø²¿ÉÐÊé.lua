
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");




function main()
   
  local nTaskValue = FN_GetTaskState(FN_YM);

	if (nTaskValue==2) then
		task_105();
		return
	elseif (nTaskValue==3) then
		Say("Ra c�a l� th�y ngay ng��i b�n ng�a.",0);
		return
	elseif (nTaskValue==4) then
		task_109();
		return
	end;


  
	i=random(1,4)
	if i==1 then 
		Talk(1,"","T�c ng� c� c�u: Thi�n h� ��i th�, h�p c�u t�t ph�n, ph�n c�u t�t h�p. M�y n�m nay trung nguy�n ��i lo�n ��n l�c ph�i th�ng nh�t giang s�n!")
	elseif i==2 then
		Talk(1,"","Nh� n�m x�a ta theo ti�n �� nam chinh b�c ph�t c� tr�n chi�n n�o ch�a g�p qua, b�n Li�u c�u d�m ��n ta s� cho ch�ng bi�t tay.")
	elseif i==3 then
		Talk(1,"","Nam nhi ph�i h�c t�t v� ngh� x�ng pha chi�n tr��ng gi�t gi�c, gi�ng th� sinh l�m ���c tr� tr�ng g�?")
	else
		Talk(1,"","H�! Theo ti�n �� phi�u b�t giang h� hay h�n l�m Khu M�t s�, phi�n ch�t ta m�t!")
	end
  
end
  

