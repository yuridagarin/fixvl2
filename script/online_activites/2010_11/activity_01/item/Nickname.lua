Include("\\script\\lib\\globalfunctions.lua");

NN_MAIN = 2;
NN_SUB1 = 1;
NN_SUB2 = 30243;

NN_titleTable = 
{
	{"S�ng Kh�ng Y�u!", 65, 1},
	{"H�n ��i V� ��i", 65, 2},
	{"Xinh Kh�ng Ki�u", 65, 3},
	{"V�a Xinh V�a �i�u", 65, 4},
	{"Xinh G�i Ngang Tr�i", 65, 5},
	{"X�u K�t C�u ��p", 65, 6},
	{"Teen V� L�m", 65, 7},
	{"Bu�n V� ��p Trai", 65, 8},
	{"B� Kh�e B� ��p", 65, 9},
	{"B�p B� V� L�m", 65, 10},	
	{"M� Nh�n V� L�m", 65, 11},
	{"M� N� V� L�m", 65, 12},
	{"V� L�m Ki�u N�", 65, 13},
	{"V� L�m M� Nam", 65, 14},
	{"Hoa H�ng V� L�m", 65, 15},
	{"L�ng T� �a T�nh", 65, 16},
	{"Hi�p Kh�ch V� Danh", 65, 17},
	{"V� L�m Truy�n K� 2", 65, 18}
};

function OnUse(itemIndex)
	local menu = {};
	menu[0] = "Ch�n danh hi�u c�n ��i, hi�u qu�: kh�ng t�t c� t�ng 10"; 
	for i=1, getn(NN_titleTable) do
		tinsert(menu, NN_titleTable[i][1].."/#DoUse("..i..")");
	end
	gf_PageSay(menu, 1, 6);
end

function DoUse(index)
	if 1 == DelItem(NN_MAIN, NN_SUB1, NN_SUB2, 1) then
		local now = GetTime();
		local year, month, day, hour, minute, second = GmTime(GetTime()+8*60*60);
		--WriteLog("year: "..year..", month: "..month..", day: "..day..", hour: "..hour..", minute: "..minute..", second: "..second);
		local expireTime = MkTime(year, month, day, 23, 59, 59);
		--WriteLog("now: "..now..", expireTime: "..expireTime);
		AddTitle(NN_titleTable[index][2], NN_titleTable[index][3]);
		SetCurTitle(NN_titleTable[index][2], NN_titleTable[index][3]);
		SetTitleTime(NN_titleTable[index][2], NN_titleTable[index][3], GetTime() + 30*24*3600);
	end
end