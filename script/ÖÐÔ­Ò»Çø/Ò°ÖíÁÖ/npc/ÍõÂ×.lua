Include("\\script\\lib\\task_main.lua");

function OnDeath()
if CTask:IsTaskStart("Th�i Thi�n T��ng D��ng (3 )")==1 and CTask:IsTaskFinish("Th�i Thi�n T��ng D��ng (3 )")==0 then
	i=random(1,100)
	if i <= 50 then
		AddItem(2,0,12,1)
	end	
end
end;