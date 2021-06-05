--�����

Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\camp0912\\head.lua")

tJunxuItem = {
	{"Kim Tinh",2,201,2,1990,0},
	{"M�c Tinh",2,201,4,1990,0},
	{"Th�y Tinh",2,201,6,1990,0},
	{"H�a Tinh",2,201,8,1990,0},
	{"Th� Tinh",2,201,10,1986,0},
	{"Li�t Nham (��u) c�p 1"		,2 ,144,14,3,0},
	{"Ph� Kh�ng (��u) c�p 1"		,2 ,144,23,3,0},
	{"T�y Ki�m (��u) c�p 1"		,2 ,144,32,3,0},
	{"T�t Phong (��u) c�p 1"		,2 ,144,41,3,0},
	{"T�n V� (��u) c�p 1"		,2 ,144,50,3,0},
	{"�ng T�p (��u) c�p 1"		,2 ,144,2,3,0},
	{"Linh T�m (��u) c�p 1"      ,2 ,144,62,3,0},
	{"Lang Ti�u (��u) c�p 1"      ,2 ,144,71,3,0},
	{"Th�n L�c (��u) c�p 1"		,2 ,144,77,3,0},
	{"Ng�ng Th�n (��u) c�p 1"		,2 ,144,86,3,0},
	{"V� Gian (��u) c�p 1"		,2 ,144,95,3,0},
	{"V� C�c (��u) c�p 1"		,2 ,144,104,3,0},
	{"Cu�n Nh�n (��u) c�p 1"		,2 ,144,113,3,0},
	{"L�ng Nhu� (��u) c�p 1"		,2 ,144,122,3,0},
	{"Linh Vi�n (��u) c�p 1"		,2 ,144,131,3,0},
	{"H�i V�n (��u) c�p 1"		,2 ,144,140,3,0},
	{"H�i T�m (��u) c�p 1"		,2 ,144,149,3,0},
	{"�ng T�p (��u) c�p 2"		,2 ,144,3,3,0},	
};

function OnUse()
	Say("<color=green>Thi�n M�n Tr�n qu�n nhu bao<color>: s� d�ng qu�n nhu bao Thi�n M�n Tr�n c� c� h�i nh�n ���c Ng� H�nh Nguy�n Th�ch, mu�n s� d�ng ngay kh�ng?",
		2,
		"\n��ng/confrim_use",
		"\nKh�ng c�n/gf_DoNothing")
end

function confrim_use()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	local nRand = random(1,10000);
	local nTotal = 0;
	for i = 1,getn(tJunxuItem) do
		nTotal = nTotal + tJunxuItem[i][5];
		if nRand <= nTotal then
			if DelItem(2,1,3855,1) == 1 then
				if isOpen_0912() == 1 then
					AddItem(2,95,203,1,1);
					Msg2Player("Nh�n ���c [L� bao song ��n]x1");
				end
				if tJunxuItem[i][6] == 0 then
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1);
				else
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1,-1,-1,-1,-1,-1,-1);
				end
				Msg2Player("B�n nh�n ���c ["..tJunxuItem[i][1].."]x1")
--				Observer:onEvent(OE_TMZ_Open_Junxubao);
			end
			return 1;
		end
	end
end
