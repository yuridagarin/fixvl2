Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
tNormalBook = 
{
	[1] = {"Ng� Qu� M�t t�ch",0,107,63},
	[2] = {"Thi�n H� M�t t�ch",0,107,64},
	[3] = {"T� H� M�t t�ch",0,107,65},
	[4] = {"Tu La M�t t�ch",0,107,60},
	[5] = {"Chi�m Y Ph�",0,107,66},
	[6] = {"Kim Thi�n Ph�",0,107,59},
}
tSpecialBook = 
{
	[1] = {"Kim Cang Ph�c Ma kinh",0,107,1},	
	[2] = {"Kim Cang Ph�c Ma T�m Ph�p",0,107,2},
	[3] = {"Ti�m Long M�t t�ch",0,107,3},	
	[4] = {"Ti�m Long T�m Ph�p",0,107,4},	
	[5] = {"V� Tr�n M�t t�ch",0,107,5},	
	[6] = {"V� Tr�n T�m Ph�p",0,107,6},	
	[7] = {"Thi�n La M�t T�ch",0,107,7},	
	[8] = {"Thi�n La T�m Ph�p",0,107,8},	
	[9] = {"Nh� � M�t T�ch",0,107,9},	
	[10] = {"Nh� � T�m Ph�p",0,107,10},
	[11] = {"B�ch H�i Ph�",0,107,11},
	[12] = {"B�ch H�i T�m Ph�p",0,107,12},
	[13] = {"H�n ��n M�t t�ch",0,107,13},
	[14] = {"H�n ��n T�m Ph�p",0,107,14},
	[15] = {"Qu� Thi�n M�t t�ch",0,107,15},
	[16] = {"Qu� Thi�n T�m Ph�p",0,107,16},
	[17] = {"Huy�n �nh M�t t�ch",0,107,17},
	[18] = {"Huy�n �nh T�m Ph�p",0,107,18},
	[19] = {"Qu�n T� M�t t�ch",0,107,19},
	[20] = {"Qu�n T� T�m Ph�p",0,107,20},
	[21] = {"Tr�n Qu�n M�t t�ch",0,107,21},
	[22] = {"Tr�n Qu�n T�m Ph�p",0,107,22},
	[23] = {"Xuy�n V�n M�t t�ch",0,107,23},
	[24] = {"Xuy�n V�n T�m Ph�p",0,107,24},
	[25] = {"U Minh Qu� L�c",0,107,25},
	[26] = {"U Minh T�m Ph�p",0,107,26},
	[27] = {"Linh C� M�t t�ch",0,107,27},
	[28] = {"Linh C� T�m Ph�p",0,107,28},
}

NEED_FRAG_COUNT = 10;	--������Ƭ����

function OnUse()
	local selTab = {
			"Ta ph�i th� m�i ���c/use",
			"Sau n�y h�y n�i/nothing",
			}
	Say("Ng��i c� mu�n th� gh�p m�y m�nh r�i n�y l�i kh�ng?",getn(selTab),selTab);
end;

function use()
	if GetItemCount(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4]) >= NEED_FRAG_COUNT then
		if gf_JudgeRoomWeight(1,20) ~= 1 then
			Talk(1,"","Kho�ng tr�ng trong h�nh trang c�a b�n kh�ng ��.");
			return 0;
		end;
		if DelItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],NEED_FRAG_COUNT) == 1 then
			local nRand = random(1,100);
			local nRetCode = 0;
			if nRand <= 99 then	--99%���ʻ����ͨ�ؼ�
				nRand = random(1,getn(tNormalBook));
				nRetCode = AddItem(tNormalBook[nRand][2],tNormalBook[nRand][3],tNormalBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch"..tNormalBook[nRand][1]);
					WriteLog("[S�t Th� ���ng]::"..GetName().."S�p x�p l�i nh�ng trang r�i nh�n 1 quy�n m�t t�ch"..tNormalBook[nRand][1]);
				else
					WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."S�p x�p l�i m�nh r�i, nh�n ���c m�t quy�n m�t t�ch, nRetCode:"..nRetCode);
				end;
			else	--1%���ʻ��ʦ���ؼ�
				nRand = random(1,getn(tSpecialBook));
				nRetCode = AddItem(tSpecialBook[nRand][2],tSpecialBook[nRand][3],tSpecialBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch s� m�n"..tSpecialBook[nRand][1]);
					WriteLog("[S�t Th� ���ng]::"..GetName().."S�p x�p l�i m�nh r�i nh�n ���c 1 quy�n m�t t�ch s� m�n:"..tSpecialBook[nRand][1]);
				else
					WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."S�p x�p l�i m�nh r�i nh�n ���c 1 quy�n m�t t�ch s� m�n, nRetCode:"..nRetCode);
				end;			
			end;
		end;
	else
		Talk(1,"","Nh�ng trang m�t t�ch r�i n�y c�ng c� th� s�p x�p l�i th�nh m�t quy�n, �t nh�t c�ng c�n"..NEED_FRAG_COUNT.."Trang");
	end;
end;

function nothing()

end;