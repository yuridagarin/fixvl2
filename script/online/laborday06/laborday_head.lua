--File name:laborday_head.lua
--Describe:�Ͷ��ڻ�ű�ͷ�ļ�
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\lib\\string.lua");
--ȫ�ֳ���
FALSE = 0;	--���Ŷ��������ĳ�����ʹ�����������һ���
TRUE = 1;

tNpcName = {
		"Nh� bu�n T� B�o Trai",
		"�ng ch� T� B�o Trai",
		"S�ch c�ng lao T� B�o Trai",
		};

tNumTab = {	--Ҫ��Ҫ�ô�д�أ�Ҽ��������½����N
		"Th�p",
		"ch�n",
		"t�m",
		"b�y",
		"s�u",
		"Ng� ",
		"b�n",
		"ba",
		"hai",
		"m�t",
		};

ItemTab = {
	{2,1,322,1,"C�nh A Tu La"},--1
	{2,1,26,20,"�m Y�n"},--2
	{2,1,82,1,"Quy Hoa K�nh"},--3
	{2,1,156,1,"Tr�ng B�ch �i�u"},--4
	{2,1,314,1,"B�ch L�n"},--5
	{2,1,170,20,"B�ch Ng� L�n"},--6
	{2,1,93,20,"V�ng B�ch Ng�c"},--7
	{2,1,81,20,"B�ch V�n b�i"},--8
	{2,1,40,20,"Th��ng g�y"},--9
	{2,1,29,20,"B�o B�nh"},--10
	{2,1,326,1,"B�ch Ng�c gi�i ch�"},--11
	{2,1,18,1,"C�nh d�i"},--12
	{2,1,46,20,"B�nh M�c B�i"},--13
	{2,1,303,20,"G�ng tay"},--14
	{2,1,299,20,"T�n ki�m"},--15
	{2,1,301,20,"T�n th��ng"},--16
	{2,1,166,20,"da Th��ng Vi�n"},--17
	{2,1,43,20,"Th�o h�i"},--18
	{2,1,55,20,"B�nh tr�"},--19
	{2,1,288,20,"Tr��ng �ao"},--20
	{2,1,193,1,"Tranh M�c H�a Di�m"},--21
	{2,1,189,1,"Tranh S�c Y�n Hoa"},--22
	{2,1,320,1,"Xi H�a Tr��ng �n"},--23
	{2,1,169,20,"Xi H�a c�n"},--24
	{2,1,282,20,"Xi H�a M�t T�n"},--25
	{2,1,321,1,"Xi H�a Th�nh �n"},--26
	{2,1,313,1,"Xi H�a �n"},--27
	{2,1,191,1,"X�ch M�c H�a Di�m"},--28
	{2,1,6,20,"No�n tr�ng"},--29
	{2,1,317,1,"Th� b� Tr��ng B�o"},--30
	{2,1,295,20,"��i Cang �ao"},--31
	{2,1,67,20,"��i T�ng ��a ch�"},--32
	{2,1,312,1,"��i Thi�t Ba"},--33
	{2,1,297,20,"Da voi"},--34
	{2,1,330,1,"��i Tu Vi�n K�nh"},--35
	{2,1,21,20,"Bao �ao"},--36
	{2,1,59,20,"�inh M�c B�i"},--37
	{2,1,73,20,"�inh Ba"},--38
	{2,1,100,1,"��ng L�ng"},--39
	{2,1,162,20,"D�i c�c"},--40
	{2,1,176,20,"��c Phong th�ch"},--41
	{2,1,324,1,"�o�n Th�a �n th� th�"},--42
	{2,1,161,20,"Ng�c v� c�t"},--43
	{2,1,180,1,"Ng�c Ng� Nh�n C�u"},--44
	{2,1,13,20,"T� ong"},--45
	{2,1,304,20,"Ph�t Kinh"},--46
	{2,1,302,20,"Ph� �n"},--47
	{2,1,308,1,"H� C�t"},--48
	{2,1,315,1,"L��ng kh�"},--49
	{2,1,327,1,"D�y th�p"},--50
	{2,1,70,20,"Canh M�c B�i"},--51
	{2,1,56,10,"C�ng V�n"},--52
	{2,1,63,20,"M�c C�u"},--53
	{2,1,290,20,"Tranh ch�"},--54
	{2,1,160,1,"Qu�i d� th�ch"},--55
	{2,1,34,20,"Quan ph�c"},--56
	{2,1,92,20,"Qu� H�n"},--57
	{2,1,179,1,"Qu� ��u Tr��ng"},--58
	{2,1,32,1,"H�ng Tinh"},--59
	{2,1,300,20,"T� ��n"},--60
	{2,1,171,20,"H�ng ng� l�n"},--61
	{2,1,16,20,"H�u Nhi Qu�"},--62
	{2,1,155,20,"L�ng c�o"},--63
	{2,1,104,1,"H� ph�"},--64
	{2,1,292,20,"Da h�"},--65
	{2,1,19,20,"H� v�"},--66
	{2,1,84,1,"H� Ph�ch"},--67
	{2,1,284,20,"H� Ph�p L�nh B�i"},--68
	{2,1,90,1,"Nh�n H� Ph�t"},--69
	{2,1,310,1,"Hoa Ban H� �i�p"},--70
	{2,1,99,1,"Huy�n Quang"},--71
	{2,1,107,1,"Ho�ng �� N�i Kinh"},--72
	{2,1,48,1,"�u�i H� v�ng"},--73
	{2,1,69,20,"Ho�ng Kim Ban Ch�"},--74
	{2,1,318,1,"C�n"},--75
	{2,1,178,10,"H�a �nh Th�n �ao"},--76
	{2,1,319,1,"C�nh Ph�ng Ho�ng"},--77
	{2,1,36,20,"Gia Ph�p b�ng"},--78
	{2,1,272,20,"X�c gi�p tr�ng"},--79
	{2,1,177,20,"Gi�p x�c phi�n"},--80
	{2,1,25,20,"Gi�p M�c B�i"},--81
	{2,1,80,20,"Ki�m H�n"},--82
	{2,1,41,20,"Kim Thoa"},--83
	{2,1,79,1,"Kim X�ng X�"},--84
	{2,1,86,1,"Kim Cang"},--85
	{2,1,329,1,"��u l�u Kh�n Na La"},--86
	{2,1,44,20,"T�u B�i"},--87
	{2,1,85,20,"Qu� M�c B�i"},--88
	{2,1,192,1,"Lam M�c H�a Di�m"},--89
	{2,1,190,1,"Lam S�c Y�n Hoa"},--90
	{2,1,37,1,"Lang H�n"},--91
	{2,1,5,20,"L�ng s�i"},--92
	{2,1,187,10,"Linh ��ch"},--93
	{2,1,184,10,"Linh Qu�"},--94
	{2,1,186,10,"Linh C�m"},--95
	{2,1,185,10,"Linh T�n"},--96
	{2,1,183,10,"Linh Ti�u"},--97
	{2,1,74,1,"Bao tay Da h��u"},--98
	{2,1,62,20,"L�c Ph�ch"},--99
	{2,1,91,1,"L�c Tr�"},--100
	{2,1,287,20,"Mao Ng�u b�"},--101
	{2,1,311,1,"Minh H�a Ph�"},--102
	{2,1,323,1,"��u l�u Ma H� La Ca"},--103
	{2,1,76,20,"M�u ��n"},--104
	{2,1,31,20,"M�c Th�"},--105
	{2,1,75,20,"M�c L�i V�n �ao"},--106
	{2,1,28,20,"Tr�ng chim"},--107
	{2,1,65,20,"B�u r��u da d�"},--108
	{2,1,279,20,"Ch�a kh�a s�t"},--109
	{2,1,278,20,"Ch�a kh�a ��ng"},--110
	{2,1,280,20,"Ch�a kh�a b�c"},--111
	{2,1,172,1,"D� �ao"},--112
	{2,1,154,1,"Ng�c Kh�"},--113
	{2,1,157,20,"Cung"},--114
	{2,1,106,10,"V�y K� L�n"},--115
	{2,1,17,20,"Thanh Kim"},--116
	{2,1,102,1,"Nh�n �� Ph�"},--117
	{2,1,83,20,"Nh�m M�c B�i"},--118
	{2,1,195,1,"S�t Th� L�nh"},--119
	{2,1,97,20,"Th��ng H�n lu�n"},--120
	{2,1,38,20,"H�ng h�a"},--121
	{2,1,8,1,"L�ng s�i th��ng ��ng"},--122
	{2,1,14,1,"Nanh heo th��ng h�ng"},--123
	{2,1,35,20,"B�nh n��ng"},--124
	{2,1,12,20,"Thi�u t�u"},--125
	{2,1,194,1,"Th�n b� Y�n Hoa"},--126
	{2,1,181,1,"Th�n b� ph�"},--127
	{2,1,182,1,"Ki�m th�n b�"},--128
	{2,1,49,20,"Th�n Ma ch�"},--129
	{2,1,298,20,"Thu�c n�"},--130
	{2,1,276,20,"M�m Th�c nh�n th�o"},--131
	{2,1,50,20,"Th� C�t"},--132
	{2,1,57,20,"H�p trang s�c"},--133
	{2,1,24,20,"S�u Th�n K�"},--134
	{2,1,293,20,"To�i c�t"},--135
	{2,1,316,1,"To�i th�ch"},--136
	{2,1,168,20,"Ng�n th��ng h�ng"},--137
	{2,1,101,1,"M�t n� Thi�n V��ng"},--138
	{2,1,158,20,"M�nh b�n �� Thi�n �m gi�o"},--139
	{2,1,159,20,"Thi�n �m M�t T�n"},--140
	{2,1,71,20,"Thi�t B�t Qu�i"},--141
	{2,1,10,20,"Thi�t Ban Ch�"},--142
	{2,1,47,20,"Thi�t Xoa"},--143
	{2,1,61,20,"D�y x�ch"},--144
	{2,1,20,20,"Thi�t Th��ng ��u"},--145
	{2,1,30,20,"��ng ki�m"},--146
	{2,1,42,20,"Mi�ng ��ng"},--147
	{2,1,3,20,"R�ng s�i"},--148
	{2,1,4,1,"Th� Nhi Qu�"},--149
	{2,1,2,20,"�u�i th�"},--150
	{2,1,23,20,"Th�i C�t"},--151
	{2,1,305,20,"�� La tr��ng"},--152
	{2,1,103,1,"B�nh �n d�ch"},--153
	{2,1,274,20,"C�nh mu�i"},--154
	{2,1,9,20,"V�n L� th�ch"},--155
	{2,1,273,20,"Ch�n r�t"},--156
	{2,1,105,1,"V� Kinh T�ng Y�u"},--157
	{2,1,173,20,"V� s� �ao"},--158
	{2,1,175,20,"M�t n� V� s�"},--159
	{2,1,174,20,"V� s� y�u ��i"},--160
	{2,1,64,20,"M�u M�c B�i"},--161
	{2,1,58,20,"C�nh d�i"},--162
	{2,1,89,20,"T� Ng�u Cung"},--163
	{2,1,98,20,"Kh� S�n ch�"},--164
	{2,1,277,20,"�u�i ��c t�ch"},--165
	{2,1,309,1,"Ti�u ��c Nang"},--166
	{2,1,289,20,"Kh�n tay"},--167
	{2,1,163,20,"H�t Ch�m"},--168
	{2,1,94,20,"T� Ph�t Ban Ch�"},--169
	{2,1,77,20,"T�n M�c B�i"},--170
	{2,1,296,20,"R�ng Tinh Tinh"},--171
	{2,1,15,20,"G�m lam"},--172
	{2,1,78,1,"H�ng V�n"},--173
	{2,1,54,20,"G�m v�ng"},--174
	{2,1,11,20,"T� hoa h�i"},--175
	{2,1,95,1,"Tuy�t Hoa Gi�i C�"},--176
	{2,1,22,20,"Tuy�t Tinh"},--177
	{2,1,45,20,"Tuy�t Ph�ch"},--178
	{2,1,286,20,"Huy�t bao"},--179
	{2,1,307,1,"Huy�t L�n"},--180
	{2,1,285,20,"Huy�t Nha v�"},--181
	{2,1,306,1,"H�p trang �i�m"},--182
	{2,1,60,20,"B�u r��u da d�"},--183
	{2,1,7,20,"Nanh heo r�ng"},--184
	{2,1,39,1,"D� Minh Ch�u"},--185
	{2,1,328,1,"Tr�ng h�t"},--186
	{2,1,331,1,"Nh�t D��ng Ch� T�n ch��ng 2"},--187
	{2,1,53,20,"Di T�c Chung"},--188
	{2,1,33,20,"�t M�c B�i"},--189
	{2,1,66,20,"D� M�c B�i"},--190
	{2,1,164,20,"D� T�c Qu�i Li�n"},--191
	{2,1,165,1,"D� T�c b� ngoa"},--192
	{2,1,27,20,"�m Ph�ch"},--193
	{2,1,294,20,"�m d��ng k�nh"},--194
	{2,1,167,20,"Ng�n H� ��n"},--195
	{2,1,72,1,"�n Th�ch"},--196
	{2,1,51,20,"U H�n"},--197
	{2,1,291,20,"V� nhung"},--198
	{2,1,88,20,"B�nh Ng�c"},--199
	{2,1,87,20,"Ng�c Nh� �"},--200
	{2,1,68,20,"Ch�m c�u ��ng nh�n"},--201
	{2,1,52,20,"Tr�m T�u"},--202
	{2,1,96,20,"Ch� Nam Ng�"},--203
}
g_TotalItemNum = getn(ItemTab);

PrizeTab = {	--��������
	{"�i�m kinh nghi�m v� danh v�ng.",5000,5},	--EXP5000	����5
	{"�i�m kinh nghi�m, danh v�ng v� 1 Quy�n m�t t�ch.",50000,10,{{1,50},{2,100}}},	--EXP50000	����10	���һ���ؼ�
	{"�i�m kinh nghi�m, danh v�ng, 1 Quy�n m�t t�ch v� Thi�n th�ch.",200000,10,{{1,40},{2,80},{3,100}},3},	--EXP200000	����20	���һ���ؼ�	����3��
	{"�i�m kinh nghi�m, danh v�ng, 1 Quy�n m�t t�ch v� Thi�n th�ch.",1000000,30,{{1,15},{2,30},{3,60},{4,80},{5,100}},3},	--EXP1000000	����30	���һ���ؼ�	����3��
	{"�i�m kinh nghi�m, danh v�ng, 1 Quy�n m�t t�ch v� Thi�n th�ch.",3000000,50,{{3,20},{4,40},{5,60},{6,80},{7,90},{8,100}},8},	--EXP3000000	����50	���һ���ؼ�	����8��
	{"�i�m kinh nghi�m, danh v�ng, 1 Quy�n m�t t�ch v� Thi�n th�ch.",7000000,100,{{6,20},{7,50},{8,80},{9,100}},15},	--EXP7000000	����100	���һ���ؼ�	����15��
	{"�i�m kinh nghi�m, danh v�ng, 1 Quy�n m�t t�ch v� Thi�n th�ch.",15000000,150,{{6,20},{7,50},{8,80},{9,100}},30},	--EXP15000000	����150	���һ���ؼ�	����30��
	{"�i�m kinh nghi�m, danh v�ng, Thi�n th�ch, c�c ph�m m�t t�ch v� n�n c�c ph�m.",20000000,200,{{6,20},{7,50},{8,80},{9,100}},40,1},	--EXP20000000	����200	���һ���ؼ�	����40��	�̶�����ñ��
	{"�i�m kinh nghi�m, danh v�ng, Thi�n th�ch, c�c ph�m m�t t�ch v� qu�n c�c ph�m.",30000000,300,{{7,35},{8,70},{9,100}},50,2},	--EXP30000000	����300	���һ���ؼ�	����50��	�̶����Կ���
	{"�i�m kinh nghi�m, danh v�ng, Thi�n th�ch, c�c ph�m m�t t�ch v� v� kh� c�c ph�m.",50000000,500,{{7,30},{8,60},{9,80},{10,100}},60,3},	--EXP50000000	����500	���һ���ؼ�	����60��	�̶���������
	};

BookTab = {
	{0,107,57,"T� Nguy�n C�ng Ph�"},--1
	{0,107,58,"Huy�n Th�ch C�ng Ph�"},--2
	{0,107,59,"Kim Thi�n Ph�"},--3
	{0,107,61,"B� Kim M�t t�ch"},--4
	{0,107,62,"B� Th�ch M�t t�ch"},--5
	{0,107,63,"Ng� Qu� M�t t�ch"},--6
	{0,107,64,"Thi�n H� M�t t�ch"},--7
	{0,107,65,"T� H� M�t t�ch"},--8
	{0,107,66,"Chi�m y ph�"},--9
	{0,107,155,"Ng� H�nh M�t t�ch"},--10
	}

--���������
LABORDAY_ITEM_BEGIN = 1877;	--��¼�Ͻ�������Ʒ
LABORDAY_ITEM2 		= 1878;
LABORDAY_ITEM3 		= 1879;
LABORDAY_ITEM4 		= 1880;
LABORDAY_ITEM5 		= 1881;
LABORDAY_ITEM6 		= 1882;
LABORDAY_ITEM_END  	= 1883;

ITEMNUM = 1884; --��¼����Ͻ��Ĳ��ϵ�����
GET_PRIZE = 1885;	--��¼�����ȡ�����������1�ֽڼ�¼��ȡ���ڣ�2�ֽڼ�¼�Ľ���ȡ������3�ֽڼ�¼�影��ȡ������4�ֽڼ�¼������ȡ����
GET_PRIZE2 = 1886 	--��¼�����ȡ�����������1�ֽڼ�¼�߽���ȡ������2�ֽڼ�¼�˽���ȡ������3�ֽڼ�¼�Ž���ȡ������4�ֽڼ�¼ʮ����ȡ����
BIG_PRIZE = 1887;	--��¼�����ȡ�󽱵������1�ֽ���һ����2�ֽ��Ƕ�����3�ֽ���3����4�ֽ�������ű��
TSK_LABORDAY_WEEK = 1356; --��¼�ܵ����� ȡ������1885�����ĵ�һ�ֽ�

tPrizeMapByte = {	--������������������ֽڵĶ�Ӧ��ϵ
			{GET_PRIZE2,4},	--����1��ӦGET_PRIZE2�ĵ�4���ֽ�(ʮ��)
			{GET_PRIZE2,3},	--����2��ӦGET_PRIZE2�ĵ�3���ֽ�(�Ž�)
			{GET_PRIZE2,2},	--����3��ӦGET_PRIZE2�ĵ�2���ֽ�(�˽�)
			{GET_PRIZE2,1},	--����4��ӦGET_PRIZE2�ĵ�1���ֽ�(�߽�)
			{GET_PRIZE,4},	--����5��ӦGET_PRIZE�ĵ�4���ֽ�(����)
			{GET_PRIZE,3},	--����6��ӦGET_PRIZE�ĵ�3���ֽ�(�影)
			{GET_PRIZE,2},	--����7��ӦGET_PRIZE�ĵ�2���ֽ�(�Ľ�)
			{BIG_PRIZE,3},	--����8��ӦBIG_PRIZE�ĵ�3���ֽ�(����)
			{BIG_PRIZE,2},	--����9��ӦBIG_PRIZE�ĵ�2���ֽ�(����)
			{BIG_PRIZE,1},	--����10��ӦBIG_PRIZE�ĵ�1���ֽ�(һ��)
			};
			
tPrizeJifen = { --������Ӧ�Ĵ�����ÿ�ܣ��ͻ�ȡ�Ļ���
	{1,35},{1,30},{1,22},{1,20},{1,18},{1,15},{1,12},{1,10},{1,8},{1,5}
};			
--=============================================================================================
--==================================��غ���===================================================
--�жϵ�ǰ�Ľ���״̬
function Get_Laborday_State()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20060428 then
		return 0;	--�δ��ʼ
	elseif nDate > 20060514 then
		return 3;	--�콱��ֹ
	elseif nDate > 20060507 then
	 	return 2;	--��ֹ�����ռ�
	else 
		return 1;	--�����ڻ�ڼ䣨�����Ͻ���ƷҲ�ܻ�ȡ������
	end; 
end;
--�õ��������ĳ����Ʒ������
function Get_Item_Count(nItemNo)
	return GetItemCount(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3]);
end;
--�Ͻ�һ����Ʒ����Ʒ��Ӧλ��1,�Ͻ���Ʒ������1
function Hand_In_Item(nItemNo)
	local nGroup = floor((nItemNo-1)/30);
	local nBit = mod((nItemNo-1),30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then	--�ѽ������ֲ���
		return FALSE;
	end;
	if Get_Item_Count(nItemNo) < ItemTab[nItemNo][4] then	--��������
		return FALSE;
	end;
	if DelItem(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3],ItemTab[nItemNo][4]) == 1 then
		SetTask(LABORDAY_ITEM_BEGIN+nGroup,SetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit,1));
		SetTask(ITEMNUM,GetTask(ITEMNUM)+1);
		return TRUE;
	else
		return FALSE;
	end;
end;
--��ȡ��������������Ͻ������״̬
function Clear_HandIn_State()
	for i=LABORDAY_ITEM_BEGIN,LABORDAY_ITEM_END do
		SetTask(i,0);
	end;
	SetTask(ITEMNUM,0);
end;
--�õ����Ͻ��Ĳ��ϵ��ַ���Table
function Get_Info_Table(nType)
	local nGroup = 0;
	local nBit = 0;
	local sContent = "";
	local nTab = 0;
	for i=1,g_TotalItemNum do
		nGroup = floor((i-1)/30);
		nBit = mod(i-1,30)+1;
		if mod(i,31) ~=0 or mod(i,32) ~= 0 then
			if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == nType then
				nTab = nTab + 1;
				if mod(nTab,50) == 0 then
					sContent = sContent..ItemTab[i][5].."|";
				else
					sContent = sContent..ItemTab[i][5]..", ";
				end;
			end;
		end;
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	return split(sContent,"|");
end;

--�Զ���д��־��������һ������Ϊ�¼������ڶ�������Ϊ�¼�����
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--�õ���ҵ��Ա��ַ�������\script\task\world\task_head.lua����copy�����ġ�
--Copyright��2005�@peres
function GetPlayerSex()	
	local mySex -- ������ʾ�����Ա���ַ�
	if (GetSex() == 1) then
		mySex = "Thi�u hi�p";
	elseif (GetSex() == 2) then
		mySex = "C� n��ng";
	end;
	return mySex;
end;

--����ĳ���������ĳһ�ֽڵ�ֵ
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--�õ�ĳ�������ĳһ�ֽڵ�ֵ
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;
--���ϸ˵�����������ָ������һ��NPC
function knowdetail(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	Talk(1,sCmd,"<color=green>"..tNpcName[npcNo]..": <color>G�n ��y b�n ti�m chu�n b� thu th�p nh�ng b�o v�t trong giang h�, v�t thu th�p s� thu th�p theo nh�m v�i s� l��ng kh�ng b�ng nhau. Sau khi giao n�p �� s� l��ng s� nh�n ���c ph�n th��ng. Ng�i c� th� nh�n l�y 1 quy�n s�ch c�ng lao T� B�o Trai, c� ghi r� danh m�c v�t thu th�p, ph�n th��ng c� th� nh�n l�y. H�y ��n T��ng D��ng, D��ng Ch�u g�p �ng ch� T� B�o Trai �� ��i ph�n th��ng. ");
end;
--���ܻ�ȡ���������������ͬ��
function knowrule(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang k�/#nextrule1("..npcNo..")",
			"Quay l�i ��i tho�i ch�nh./"..sCmd,
			"K�t th�c ��i tho�i/nothing",
			};
	local sContent = "";
	local rule10 = "<color=green>Ph�n th��ng 10<color>: N�p 7 lo�i c� th� ��i "..tPrizeJifen[10][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[10][1].." l�n<enter>";
	local rule9 = "<color=green>Ph�n th��ng 9<color>: N�p 1-7 lo�i c� th� ��i "..tPrizeJifen[9][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[9][1].." l�n<enter>";
	local rule8 = "<color=green>Ph�n th��ng 8<color>: N�p 31 lo�i c� th� ��i "..tPrizeJifen[8][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[8][1].." l�n<enter>";
	local rule7 = "<color=green>Ph�n th��ng 7<color>: N�p 60 lo�i c� th� ��i "..tPrizeJifen[7][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[7][1].." l�n<enter>";
	local rule6 = "<color=green>Ph�n th��ng 6<color>: N�p 90 lo�i c� th� ��i "..tPrizeJifen[6][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[6][1].." l�n";
	sContent = rule10..rule9..rule8..rule7..rule6;
	Say(sContent,getn(selTab),selTab);
end;
function nextrule1(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang tr��c/#knowrule("..npcNo..")",
			"Quay l�i ��i tho�i ch�nh./"..sCmd,
			"K�t th�c ��i tho�i/nothing",
			};
	local rule5 = "<color=green>Ph�n th��ng 5<color>: N�p 106 lo�i c� th� ��i "..tPrizeJifen[5][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[5][1].." l�n<enter>";
	local rule4 = "<color=green>Ph�n th��ng 4<color>: N�p 125 lo�i c� th� ��i "..tPrizeJifen[4][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[4][1].." l�n<enter>";
	local rule3 = "<color=green>Ph�n th��ng 3<color>: N�p 144 lo�i c� th� ��i "..tPrizeJifen[3][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[3][1].." l�n<enter>";
	local rule2 = "<color=green>Ph�n th��ng 2<color>: N�p 185 lo�i c� th� ��i "..tPrizeJifen[2][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[2][1].." l�n<enter>";
	local rule1 = "<color=green>Ph�n th��ng 1<color>: N�p 203 lo�i c� th� ��i "..tPrizeJifen[1][2].." �i�m t�ch l�y, m�i tu�n c� th� ��i "..tPrizeJifen[1][1].." l�n";	
	sContent = rule5..rule4..rule3..rule2..rule1;
	Say(sContent,getn(selTab),selTab);
end;

--��ѯ�Ͻ��ռ�Ʒ������������ͬ��
function queryinfor(npcNo)
	local selTab = {
				"Tra xem v�t ph�m �� giao./#seemoreinfo("..npcNo..",1)",
				"Tra xem nh�ng v�t ph�m ch�a giao n�p./#seemoreinfo("..npcNo..",0)",
				"Tra theo s� hi�u v�t ph�m./requestno",
				"Trang tr��c./main",
				"K�t th�c ��i tho�i/nothing",
				}
	Say("<color=green>"..tNpcName[npcNo]..":<color> B�n �� giao n�p"..g_TotalItemNum.."<color=yellow>"..GetTask(ITEMNUM).."<color> lo�i v�t thu th�p.",getn(selTab),selTab);
end;

function seemoreinfo(npcNo,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nType == 1 then
		if nItemNum == 0 then
			Talk(1,"main","<color=green>"..tNpcName[npcNo]..":<color> B�n v�n ch�a giao n�p v�t ph�m.");
			return FALSE;
		end;
	end;
	tInfoTab = Get_Info_Table(nType);
	local nSize = getn(tInfoTab);
	nextpage(1,nSize,nType);
end;

function nextpage(nPageNo,nSize,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nPageNo > nSize then
		main();
		return 1;
	end;
	nPageNo = nPageNo + 1;
	tInfoTab = Get_Info_Table(nType);
	Talk(1,"#nextpage("..nPageNo..","..nSize..","..nType..")",tInfoTab[nPageNo-1]);	--�ݹ�
end;
--Ҫ����������
function requestno()
	AskClientForString("searchbyno","",1,3,"H�y nh�p s� hi�u v�t ph�m:");
end;
--AskClientForString�Ļص�����
function searchbyno(sItemNo)
	local nItemNo = tonumber(sItemNo);	
	if not nItemNo or nItemNo <= 0 or nItemNo > g_TotalItemNum then
		Talk(1,"main","<color=green>G�i �<color>: H�y nh�p s� <color=yellow>t� 1 ��n"..g_TotalItemNum.."<color> (s� trung gian)");
		return FALSE;
	end;	
	nItemNo = nItemNo - 1;
	local nGroup = 0;
	local nBit = 0;
	nGroup = floor(nItemNo/30);
	nBit = mod(nItemNo,30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then
		Talk(1,"main","V�t ph�m b�n mu�n xem l�: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr�ng th�i: <color=yellow>�� giao n�p<color>.");
		return 1;
	else
		Talk(1,"main","V�t ph�m b�n mu�n xem l�: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr�ng th�i: <color=red>Ch�a giao n�p<color>.");
		return 1;
	end;
end;
--��ȡ���۱�ի���Ͳᡷ
function getbook(npcNo)
	if GetItemCount(2,0,391) >=1 then
		Talk(1,"","<color=green>"..tNpcName[npcNo]..":<color> V� "..GetPlayerSex().."c� s�ch c�ng lao T� B�o Trai sao?");
		return FALSE;
	end;
	if AddItem(2,0,391,1) == 1 then
		Msg2Player("B�n nh�n ���c s�ch c�ng lao T� B�o Trai.");
	end;
end;
--�佱
function giveprize(nPrizeType)
	local sContent = "Ng��i ��i ���c <color=yellow>";
	ModifyExp(PrizeTab[nPrizeType][2]);
	sContent = sContent..PrizeTab[nPrizeType][2].." �i�m kinh nghi�m,";
	Msg2Player("B�n nh�n ���c "..PrizeTab[nPrizeType][2].." �i�m kinh nghi�m");
	ModifyReputation(PrizeTab[nPrizeType][3],0);
	sContent = sContent..PrizeTab[nPrizeType][3].." �i�m danh v�ng, ";
	Msg2Player("B�n nh�n ���c "..PrizeTab[nPrizeType][3].." �i�m danh v�ng");
	if PrizeTab[nPrizeType][4] then
		local nBookID = giverandombook(PrizeTab[nPrizeType][4]);
		sContent = sContent..BookTab[nBookID][4]..", ";
		Msg2Player("B�n nh�n ���c "..BookTab[nBookID][4]);
	end;
	if PrizeTab[nPrizeType][5] then
		AddItem(2,2,8,PrizeTab[nPrizeType][5]);
		sContent = sContent..PrizeTab[nPrizeType][5].."Thi�n th�ch,";
		Msg2Player("B�n nh�n ���c "..PrizeTab[nPrizeType][5].."Thi�n th�ch");
	end;
	if PrizeTab[nPrizeType][6] then
		giverandomequipment(PrizeTab[nPrizeType][6]);
		sContent = sContent.."1 m�n trang b�.";
		Msg2Player("B�n nh�n ���c 1 m�n trang b�.");
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color>";
	Talk(1,"",sContent);
	if nPrizeType >= 1 and nPrizeType <= 7 then
		Talk(1,"","Ch�c m�ng, ng��i �� nh�n ���c gi�i"..tNumTab[nPrizeType]..". Ch� �, <color=red>Trong th�i gian di�n ra ho�t ��ng m�i ng�y, m�i nh�n v�t ch� c� th� nh�n 3 gi�i th��ng"..tNumTab[nPrizeType].."<color>. ��y l� l�n th� <color=yellow>"..Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]).."<color> nh�n"..tNumTab[nPrizeType].."gi�i th��ng.");
	end
	if nPrizeType == 8 then
		Talk(1,"","Ch�c m�ng, b�n nh�n ���c gi�i ba. Ch� �, <color=red>trong th�i gian di�n ra ho�t ��ng m�i nh�n v�t t�i �a c� th� nh�n ���c 3 gi�i ba<color>, b�n �� nh�n <color=yellow>"..GetByte(GetTask(BIG_PRIZE),3).."<color> l�n gi�i ba.");
	elseif nPrizeType == 9 then
		Talk(1,"","Ch�c m�ng, b�n nh�n ���c gi�i hai!");
	elseif nPrizeType == 10 then
		Talk(1,"","Ch�c m�ng, b�n nh�n ���c gi�i nh�t!");
		local sSex = "�nh/ch�";
		if GetSex() == 1 then
			sSex = "Tha";
		elseif GetSex() == 2 then
			sSex = "Ng��i ch�i";
		end;
		AddGlobalNews(GetName().." �� nh�n ���c gi�i nh�t, xin ch�c m�ng!"..sSex.."!");
		Msg2SubWorld(GetName().." �� nh�n ���c gi�i nh�t, xin ch�c m�ng!"..sSex.."!");
	end;
	Write_Log("��i ph�n th��ng t�t lao ��ng",". Lo�i ph�n th��ng:"..nPrizeType);
end;
--�����һ���ؼ����ؼ����ͺ͸����������������
function giverandombook(tBookInfo)
	local nTabSize = getn(tBookInfo);
	local nRandomNum = random(1,100);
	if nRandomNum <= tBookInfo[1][2] then
		nResult = 1;
	elseif nRandomNum > tBookInfo[nTabSize-1][2] then
		nResult = nTabSize;
	else
		for i=1,nTabSize-1 do
			if nRandomNum > tBookInfo[i][2] and nRandomNum <= tBookInfo[i+1][2] then
				nResult = i+1;
			end;
		end;
	end;
	AddItem(BookTab[tBookInfo[nResult][1]][1],BookTab[tBookInfo[nResult][1]][2],BookTab[tBookInfo[nResult][1]][3],1,1);
	return tBookInfo[nResult][1];
end;
--��װ��
function giverandomequipment(nType)
	if nType == 1 then
		giverandomhat();
	elseif nType == 2 then
		giverandomtrousers();
	elseif nType == 3 then
		giverandomweapon();
	end;
end;
--�����ñ��
function giverandomhat()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		};
	local nRandomNum = random(1,getn(HatTab));
	if AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("��i ph�n th��ng t�t lao ��ng","Nh�n ���c n�n, ID l�:"..nRandomNum);
	end;
end;
--���������
function giverandomtrousers()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		};
	local nRandomNum = random(1,getn(TrousersTab));
	if AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("��i ph�n th��ng t�t lao ��ng","Nh�n ���c qu�n, ID l�:"..nRandomNum);
	end;
end;
--���������
function giverandomweapon()
	local WeaponTab = {
		{0,0,13},	--1��
		{0,2,26},	--2��
		{0,5,39},	--3��
		{0,1,52},	--4����
		{0,3,63},	--5����
		{0,10,74},	--6��
		{0,9,85},	--7��
		{0,8,96},	--8��
		{0,6,107},	--9ǹ
		{0,4,118},	--10��
		{0,11,11},	--11צ
		{0,7,11},	--12˫��
		};
	local nRandomNum = random(1,getn(WeaponTab));
	local nAttribute;
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131;	--��,����,����,��,ǹ,��,˫��
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--��,��,��,צ
	else	--��
		nAttribute = random(131,132);
	end;
	if AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251) == 1 then
		Write_Log("��i ph�n th��ng t�t lao ��ng","Nh�n ���c v� kh�, ID l�:"..nRandomNum);
	end;
end;
--do nothing����
function nothing()

end;

--=====================��Ԫ2008��10��20���¼�=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--�����ܵ�����
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;
