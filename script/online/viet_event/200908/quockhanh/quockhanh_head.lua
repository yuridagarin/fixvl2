Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\writelog.lua");

-- Th�i gian event
START_DATE = 090830
END_DATE = 090906

INDEPENDENCE_DATE_TASKID = 2433

tIndependenceItem = 
{
	{"��u H�n",{2,1,1157,2}, 2, 2, 7},
	{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1}, 1, 1, 0},
	{"Qu�n C�ng ��i",{2,1,9998,1}, 1, 1, 7},
}

function CheckEventDate()
	local nDate = tonumber(date("%y%m%d"));
	if START_DATE <= nDate and nDate <= END_DATE then
		return 1
	end	
	return 0
end

function dialog_over()
end