Include("\\script\\lib\\globalfunctions.lua");

SM_MAIN = 2;
SM_SUB1 = 1;
SM_SUB2 = 30242;

SM_titleTable = 
{
	{"Si�u Nh�n Tr�ng Mu�i (n�i c�ng +20)", 64, 1},
	{"Si�u Nh�n Gao (s�c m�nh +20)", 64, 2},
	{"Si�u Nh�n M� B� (th�n ph�p +20)", 64, 3},
	{"Si�u Nh�n M� G� (g�n c�t +20)", 64, 4},
	{"Si�u Nh�n M� T�m (linh ho�t +20)", 64, 5}
};

function OnUse(itemIndex)
	local menu = {};
	menu[0] = "Ch�n danh hi�u c�n ��i:"; 
	for i=1, getn(SM_titleTable) do
		tinsert(menu, SM_titleTable[i][1].."/#DoUse("..i..")");
	end
	gf_PageSay(menu,1, 6);
end

function DoUse(index)
	if 1 == DelItem(SM_MAIN, SM_SUB1, SM_SUB2, 1) then
		local now = GetTime();
		local year, month, day, hour, minute, second = GmTime(GetTime()+8*60*60);
		--WriteLog("year: "..year..", month: "..month..", day: "..day..", hour: "..hour..", minute: "..minute..", second: "..second);
		local expireTime = MkTime(year, month, day, 23, 59, 59);
		--WriteLog("now: "..now..", expireTime: "..expireTime);
		AddTitle(SM_titleTable[index][2], SM_titleTable[index][3]);
		SetCurTitle(SM_titleTable[index][2], SM_titleTable[index][3]);
		SetTitleTime(SM_titleTable[index][2], SM_titleTable[index][3], GetTime() + 30*24*3600);
	end
end