Include("\\script\\lib\\task_main.lua");

function OnDeath()
if CTask:IsTaskStart("Th�i Thi�n T��ng D��ng (2 )")==1 and CTask:IsTaskFinish("Th�i Thi�n T��ng D��ng (2 )")==0 then
	i=random(1,100)
	if i <= 30 then
		AddItem(2,0,19,1)
	end	
end
end;