--��������ͽ�ܽű�
--by vivi
--08/30/2007

--2008���ڻ
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--��ʯͷ�ļ�
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");


--��ʱ����
TT_BOX_TYPE = 123;

--�������
TASK_BUCHANG_ID = 1285;           --����������Ʒ��������

buchang_id 	= 20071018;				--���εĲ������ţ����벹����ʼ����
buchang_start_date 	= 2007101800;			--������ʼʱ��
buchang_end_date 	= 2007102600;			--��������ʱ��

THIS_FILE = "\\script\\��ԭ����\\����\\npc\\liutiejiangdizi.lua"

tZbWz = {
	[1]={0,"��u kh�i"},
	[2]={1,"Ngo�i trang"},
	[3]={3,"H� y"}
	}

tChangeRing = {
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"��ng Ph��ng Long Ch�u",0,102,24},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"L�m gi�m n�i, ngo�i ph�ng c�a ��i ph��ng 10%",5,444},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"T�ng Ki�m B�o Ch�u",0,102,38},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"Sinh l�c, n�i l�c t�i �a t�ng 8%",1,481},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Ng�c",0,102,129},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�c m�nh +40",7,264},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n B�i",0,102,132},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"N�i c�ng +40",7,267},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Ho�n",0,102,131},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"G�n c�t +40",7,263},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n ��i",0,102,130},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"Th�n ph�p +40",7,265},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Gi�i",0,102,133},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"Linh ho�t +40",7,266},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n ��i",0,102,134},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"T�n c�ng k�m ��c s�t 35",1,480},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Th�ch",0,102,135},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�t th��ng t�ng 40",2,331},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"Khu�t Nguy�n B�i",0,102,27},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"600 gi�y �� b�n v� kh� h�i ph�c 5",5,43},"Hi�n Vi�n Chi�n"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"��i L�c Th�n H�ng Li�n",0,102,28},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"T�c �� di chuy�n t�ng 10%",1,101},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"T�ng Ki�m Kim �n",0,102,40},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�t th��ng gi�m 10%",3,107},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"T�ng Ki�m K� Th�ch",0,102,39},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"T� l� xu�t chi�u t�ng 3%",2,27},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Ng�c",0,102,129},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�c m�nh +40",7,264},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n B�i",0,102,132},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"N�i c�ng +40",7,267},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Ho�n",0,102,131},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"G�n c�t +40",7,263},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n ��i",0,102,130},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"Th�n ph�p +40",7,265},"Hi�n Vi�n ��u"}, 
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Gi�i",0,102,133},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"Linh ho�t +40",7,266},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n ��i",0,102,134},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"T�n c�ng k�m ��c s�t 35",1,480},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"C�u Thi�n Huy�n Th�ch",0,102,135},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�t th��ng t�ng 40",2,331},"Hi�n Vi�n ��u"},
{{"Th�nh Th� kim b�o r��ng",2,0,1028,2},{"Khu�t Nguy�n B�i",0,102,27},{"T�c �� thi tri�n v� c�ng t�ng 5%",1,477,"Sinh l�c t�i �a 6%",2,253,"S�c l�c t�ng 1000",1,479},"Hi�n Vi�n ��u"}
	}

tXuanyuanZhan = 
{
	[0] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805},{"Hi�n Vi�n Chi�n",0,102,8807},{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811},{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815},{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819},{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823},{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[1] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805}},
	[2] = {{"Hi�n Vi�n Chi�n",0,102,8801}},
	[3] = {{"Hi�n Vi�n Chi�n",0,102,8803}},
	[4] = {{"Hi�n Vi�n Chi�n",0,102,8805}},
	[5] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[6] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[7] = {{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811}},
	[8] = {{"Hi�n Vi�n Chi�n",0,102,8809}},
	[9] = {{"Hi�n Vi�n Chi�n",0,102,8811}},
	[10] = {{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815}},
	[11] = {{"Hi�n Vi�n Chi�n",0,102,8813}},
	[12] = {{"Hi�n Vi�n Chi�n",0,102,8815}},
	[13] = {{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819}},
	[14] = {{"Hi�n Vi�n Chi�n",0,102,8817}},
	[15] = {{"Hi�n Vi�n Chi�n",0,102,8819}},
	[16] = {{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823}},
	[17] = {{"Hi�n Vi�n Chi�n",0,102,8821}},
	[18] = {{"Hi�n Vi�n Chi�n",0,102,8823}},
	[19] = {{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[20] = {{"Hi�n Vi�n Chi�n",0,102,8825}},
	[21] = {{"Hi�n Vi�n Chi�n",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806},{"Hi�n Vi�n ��u",0,102,8808},{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812},{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816},{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820},{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824},{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[1] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806}},
	[2] = {{"Hi�n Vi�n ��u",0,102,8802}},
	[3] = {{"Hi�n Vi�n ��u",0,102,8804}},
	[4] = {{"Hi�n Vi�n ��u",0,102,8806}},
	[5] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[6] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[7] = {{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812}},
	[8] = {{"Hi�n Vi�n ��u",0,102,8810}},
	[9] = {{"Hi�n Vi�n ��u",0,102,8812}},
	[10] = {{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816}},
	[11] = {{"Hi�n Vi�n ��u",0,102,8814}},
	[12] = {{"Hi�n Vi�n ��u",0,102,8816}},
	[13] = {{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820}},
	[14] = {{"Hi�n Vi�n ��u",0,102,8818}},
	[15] = {{"Hi�n Vi�n ��u",0,102,8820}},
	[16] = {{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824}},
	[17] = {{"Hi�n Vi�n ��u",0,102,8822}},
	[18] = {{"Hi�n Vi�n ��u",0,102,8824}},
	[19] = {{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[20] = {{"Hi�n Vi�n ��u",0,102,8826}},
	[21] = {{"Hi�n Vi�n ��u",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804},{"Hi�n Vi�n Gi�i T� Kim",0,1,8805},{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807},{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809},{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811},{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813},{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[1] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[2] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802}},
	[3] = {{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803}},
	[4] = {{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[5] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[6] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[7] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[8] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806}},
	[9] = {{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[10] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[11] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808}},
	[12] = {{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[13] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[14] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810}},
	[15] = {{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[16] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[17] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812}},
	[18] = {{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[19] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[20] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814}},
	[21] = {{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
}
	

tChangeWp = {
	[1]={"Hi�n Vi�n To�i V� �ao",0,3,8801},
	[2]={"Hi�n Vi�n To�i V� C�n",0,5,8802},
	[3]={"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803}, 
	[4]={"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804},
	[5]={"Hi�n Vi�n Gi�i T� Kim",0,1,8805},
	[6]={"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},
	[7]={"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807},
	[8]={"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},
	[9]={"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809},
	[10]={"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},
	[11]={"Hi�n Vi�n Sinh T� B�t",0,9,8811},
	[12]={"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},
	[13]={"Hi�n Vi�n Khai Thi�n Cung",0,4,8813},
	[14]={"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},
	[15]={"Hi�n Vi�n U Minh Tr�o",0,11,8815}
	}

tWpChangeRing = {
	 [1]={{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n ��u",0,102,8802}},
	 [2]={{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n ��u",0,102,8802}},
	 [3]={{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n ��u",0,102,8804}}, 
	 [4]={{"Hi�n Vi�n Chi�n",0,102,8805},{"Hi�n Vi�n ��u",0,102,8806}},
	 [5]={{"Hi�n Vi�n Chi�n",0,102,8807},{"Hi�n Vi�n ��u",0,102,8808}},
	 [6]={{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n ��u",0,102,8810}},
	 [7]={{"Hi�n Vi�n Chi�n",0,102,8811},{"Hi�n Vi�n ��u",0,102,8812}},
	 [8]={{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n ��u",0,102,8814}},
	 [9]={{"Hi�n Vi�n Chi�n",0,102,8815},{"Hi�n Vi�n ��u",0,102,8816}},
	[10]={{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n ��u",0,102,8818}},
	[11]={{"Hi�n Vi�n Chi�n",0,102,8819},{"Hi�n Vi�n ��u",0,102,8820}},
	[12]={{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n ��u",0,102,8822}},
	[13]={{"Hi�n Vi�n Chi�n",0,102,8823},{"Hi�n Vi�n ��u",0,102,8824}},
	[14]={{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n ��u",0,102,8826}},
	[15]={{"Hi�n Vi�n Chi�n",0,102,8827},{"Hi�n Vi�n ��u",0,102,8828}}
	}

tBaguaNum = {--��2��3��4Ϊ��Ʒid����5λΪ����ֵ81-100��Ҫ������  ����λ����ֵ61-80��Ҫ������
	[1]={"Kh�m",2,1,471,10,10},
	[2]={"Kh�n",2,1,470,10,10},
	[3]={"Ch�n",2,1,474,3,2},
	[4]={"T�n",2,1,476,3,2},
	[6]={"C�n",2,1,469,10,10},
	[7]={"�o�i",2,1,472,10,10},
	[8]={"C�n",2,1,475,3,3},
	[9]={"Ly",2,1,473,3,3}
	};

--�˾ż�����
tHighLvWp = {{"Th�n Quy",0,0,15},{"�m D��ng �n",0,0,16},{"H�a �nh",0,2,37},{"Nha C�u",0,2,38},{"Ng�c Tr�",0,5,41},{"Th�n Ch�m",0,5,42},
{"Khoa Ph�",0,1,54},{"Kh�ng c�",0,1,55},{"L�u C�nh",0,3,65},{"Ngh�ch L�n",0,3,66},{"��i Th�nh Di �m",0,10,76},{"Kh� M�c Long Ng�m",0,10,77},{"Toan D�",0,9,87},
{"Th�i H�",0,9,88},{"M�c Ki�n Li�n Tr��ng",0,8,98},{"D��c S� tr��ng",0,8,99},{"C�u Long To�n K�ch",0,6,109},{"Th��ng N�",0,6,110},{"Vi�n ��",0,4,120},
{"B�t X� Chi X�",0,4,121},{"V� Ng�n",0,11,13},{"Thanh Long",0,11,14},{"B�ch Th�y",0,7,13},{"Thi�n T�n",0,7,14}}; 

--�����������
tTiandiWp ={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}};

--�������װ�� �ĸ�����
tTiandiZb = {
	[1] = {{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	[2] = {{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	[4] = {{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
};

tTiandi = {
	{{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	{{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	{{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
	{[0]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [1]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [2]={{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [3]={{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [4]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [5]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [6]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [7]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [8]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [9]={{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [10]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [11]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [12]={{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [13]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [14]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [15]={{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [16]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [17]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111}},
	 [18]={{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [19]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [20]={{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [21]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15}}}
	};

tHuihuang = {{"Huy Ho�ng Chi Th�y",0,102,8840},{"Huy Ho�ng Chi K�",0,102,8842},{"Huy Ho�ng Qu�t Kh�i",0,102,8844},{"Huy Ho�ng",0,102,8846}};
tRongyao = {{"Vinh D� Chi Th�y",0,102,8841},{"Vinh D� Chi K�",0	,102,8843},{"Vinh D� Qu�t Kh�i",0,102,8845},{"Vinh D�",	0,102,8847}};
tUplevel = {{"Thi�n Th�ch Tinh Th�ch",2,1,1009,400},{"Thi�n Th�ch Tinh Th�ch",2,1,1009,400},{"Thi�n Th�ch Tinh Th�ch",2,1,1009,1000}};

function main()
	local strtab = {
--		"��Ҫ��������װ���ĵȼ�/enhance_level",
--		"��������ʲô��������װ��/about_enhance",
--		"Ch� t�o v� n�ng c�p trang b�/npc_upgrade_talk",
		
--		"Vi�m ��/ViemDeMenu",
--		"T��ng Qu�n/TuongQuanMenu",
--		"Nguy�n So�i/NguyenSoaiMenu",
--		"Thi�n H� V� Song/VoSong_Menu",
--		"Chuy�n ��i trang b� T�ng Li�u/npc_convert_talk",
--		"Chuy�n h�a trang b� linh kh�/lingqi_item_change",			
--		"�׻Ƶ�װ�����/about_huangdi",
--		"��Ҫ�ø��ֱ���һ��»�/box_change_yuehua",
--		"�������װ�����/about_tdxh",
--		"װ�������仯���/add_item_lingqi",
--		"Th�ng c�p trang b�/item_uplevel",
--		"�����̡�������ҩ���Ȼƽ�װ�����/about_bufeiyan",
--		"�Ի���ҫ�������/about_hhry"
		}
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130925 then
--		tinsert(strtab,1,"R�n l�i v� kh�/NangCapLevelVuKhi_Menu")
	end
	if nDate <= 20140405 then
--		tinsert(strtab,1,"Trang b� L�i H�/LoiHo_Menu")
	end
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= buchang_start_date and nDate < buchang_end_date then
--		tinsert(strtab,"Ta mu�n nh�n b�i th��ng/buchang_dia");
--	end;
--	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		tinsert(strtab,1,"M�ng Tam Ti�t, mi�n ph� th�o r�i trang b� B�t Qu�i (h�t h�n l�c 7h ng�y 12/10)/lingqi_item_update");
--	elseif nTime >= 2008101208 then
--		tinsert(strtab,3,"V� trang b� B�t Qu�i/lingqi_item_update")
--	end	
	--tinsert(strtab,"C��ng h�a may m�n/LuckyEnhance");
	tinsert(strtab,"Ta ch� ��n th�m �ng th�i!/nothing")
	Say("<color=green>�� t� th� r�n L�u<color>: Ta l� �� t� gi�i nh�t c�a th� r�n L�u. Ta c� th� gi�p ng��i th�ng c�p trang b� linh kh� cao c�p. Ngo�i ra, n�u ng��i c� trang b� th��ng c� th�n kh� Ho�ng ��, ta c�ng c� th� th�i th�n kh� gi�p ng��i, l�m cho trang b� ph� h�p v�i ng��i h�n. <color=red>L�u �, n�u v� kh� c�a ng��i �� k�ch ho�t Linh Ph�ch, sau khi ta ti�n h�nh thao t�c, Linh Ph�ch s� b� hu�.<color>",
		getn(strtab),
		strtab);
end

function LuckyEnhance()
	LuckyEnhanceEquipment();
end


function about_huangdi()
	Say("N�u ng��i c� ki�m c� Ho�ng ��, ta s� gi�p ng��i truy�n th�n kh�, �� n� ph� h�p v�i ng��i.",
		7,
		"Ta mu�n t�ng tr� s� v� kh� Ho�ng ��/weapon_update",
		"Ta mu�n ��i trang b� Ho�ng �� c� thu�c t�nh ��c bi�t/change_ring",
		"L�m th� n�o ��i trang b� Ho�ng �� c� thu�c t�nh ��c bi�t/#how_change_ring(0)",
		"Ta mu�n d�ng v� kh� Ho�ng �� ��i trang s�c Ho�ng ��/weapon_change_ring",
		"Ta mu�n d�ng 15 R��ng Ho�ng Kim Th�nh Th� �� ��i v� kh� Ho�ng ��/box_change_weapon",
		"Ta mu�n d�ng 4 R��ng Ho�ng Kim Th�nh Th� �� ��i trang s�c Ho�ng ��/jinbox_huan_ring",
		"Ch�n sai r�i, tr� l�i/main")
end

function enhance_level()
	if GetLevel() < 80 then
		Talk(1,"","Ta ch� l� cao th� t�ng ��ng c�p linh kh� trang b�, ng��i ph�i kh� luy�n m�t phen tr�n giang h� n�a, ��n <color=yellow>c�p 80<color> h�y ��n t�m ta.");
	else
		Say("Ng��i mu�n t�ng ��ng c�p trang b� c�a v� tr� n�o",
			4,
			"��u kh�i/#enhance_zhuangbei(0)",
			"Ngo�i trang/#enhance_zhuangbei(1)",
			"H� y/#enhance_zhuangbei(3)",
			"��i ta m�c trang b� l�n ��./nothing"
			)
	end
end

function enhance_zhuangbei(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nPlayerLv = floor(GetLevel()/10);
	local nZhuangbeiLv = GetEquipLevel(nIndex); --��ȡ��ǰװ���ȼ�
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	if nIndex	== 0 then
		Talk(1,"","Ng��i kh�ng m�c theo "..tZbWz[nTb][2].." �?");
		return
	else 
		if nLingqi == 0 or nZhuangbeiLv < 7 then
			Talk(1,"","Ta ch� t�ng linh kh� trang b� c�p 7 ho�c c�p 8, xin x�c ��nh �� m�c "..tZbWz[nTb][2].."!");
			return
		end
		if nPlayerLv <= nZhuangbeiLv then
			Talk(1,"","Quy t�c t�ng c�p trang b� l� ch� c� th� t�ng <color=yellow>��ng c�p trang b� ph�i nh� h�n ��ng c�p c�a ng��i v� chia cho 10 (l�y ch�n)<color>, trang b� hi�n t�i c�a ng��i <color=red>kh�ng th�<color> t�ng c�p, ��i trang b� kh�c r�i ��n t�m ta!")
			return
		else
			Say("�i�m linh kh� d��i <color=yellow>80 mi�n ph�<color> t�ng ��ng c�p trang b�, �i�m linh kh� <color=yellow>80 ho�c h�n<color> m�i l�n t�ng ��ng c�p trang b� s� l�y <color=yellow>10 v�ng<color>. C� mu�n t�ng ��ng c�p linh kh� trang b� kh�ng?",
				2,
				"���c, ta mu�n t�ng"..tZbWz[nTb][2].."��ng c�p linh kh� trang b� /#confirm_enhance("..nWz..")",
				"Ta suy ngh� l�i/nothing")
		end		
	end
end

function confirm_enhance(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end	
	local nIndex = GetPlayerEquipIndex(nWz);
	local nLingqi = GetItemMaxLingQi(nIndex);
	local nMaxLv = floor(GetLevel()/10);
	local nBaseLv = GetEquipBaseLevel(nIndex); --��ȡװ�������ȼ�
	if nLingqi >= 80 then
		if GetCash() < 100000 then
			Talk(1,"","Ng��i kh�ng c� �� <color=yellow>10 v�ng<color> �");
			return
		end
		if Pay(100000) == 1 then
			if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
				Talk(1,"","Ch�c m�ng ng��i, t�ng c�p trang b� <color=yellow>th�nh c�ng<color>!")
				Msg2Player("T�ng c�p linh kh� trang b� th�nh c�ng!");
				WriteLog("T�ng c�p linh kh� trang b�: Ng��i ch�i "..GetName().."T�ng"..tZbWz[nTb][2].."trang b� th�nh c�ng.");
			else
				WriteLog("T�ng c�p linh kh� trang b�: Ng��i ch�i "..GetName().."T�ng"..tZbWz[nTb][2].."trang b� th�t b�i.");
			end
		end
	else 
		if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
			Talk(1,"","Ch�c m�ng ng��i, t�ng c�p trang b� <color=yellow>th�nh c�ng<color>!")
			Msg2Player("T�ng c�p linh kh� trang b� th�nh c�ng!");
			WriteLog("T�ng c�p linh kh� trang b�: Ng��i ch�i "..GetName().."T�ng"..tZbWz[nTb][2].."trang b� th�nh c�ng.");
		else
			WriteLog("T�ng c�p linh kh� trang b�: Ng��i ch�i "..GetName().."T�ng"..tZbWz[nTb][2].."trang b� th�t b�i.");
		end		
	end			
end

function about_enhance()
	Talk(1,"about_enhance2","Ta l� cao th� v� t�ng linh kh� trang b� cao c�p, ta ch� t�ng c�p <color=yellow>n�n, <color>th��ng y, <color=yellow>v�<color> h� y. Khi ng��i ��t c�p 80 tr� l�n, ta s� gi�p ng��i t�ng c�p linh kh� trang b� t� <color=yellow>c�p 7<color> l�n <color=yellow>c�p 8<color>, n�u ng��i ��t c�p 90 tr� l�n th� s� gi�p ng��i t�ng c�p linh kh� trang b� t� <color=yellow>c�p 7 ho�c c�p 8<color> l�n <color=yellow>c�p 9<color>.");
end

function about_enhance2()
	Talk(1,"main","�i�m linh kh� d��i <color=yellow>80<color>, ta s� <color=yellow>mi�n ph�<color> t�ng ��ng c�p trang b�; �i�m linh kh� <color=yellow>80 ho�c h�n<color>, th� m�i trang b� s� thu ph� l� <color=yellow>10 v�ng<color>.");
end

function weapon_update()
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i c� th� ��a v� kh� Ho�ng �� cho ta, ta s� gi�p ng��i thay ��i c�c thu�c t�nh c�a v� kh� Ho�ng �� mi�n ph�, ng��i c� th� thay ��i ��n khi n�o v�a � th� th�i. Ng��i x�c nh�n mu�n thay ��i? <color=red>L�u �, trong l�c ��i ph�i trang b� v� kh� tr�n ng��i. Kh�ng gi� l�i hi�u qu� c��ng ho� v� ��nh h�n c�a v� kh�!<color>",
		2,
		"�, ta mu�n ��i./confirm_weapon_update",
		"Kh�ng, ta nh�m!/main")
end

function confirm_weapon_update()
	local nIndex = 0; --��ӦtChangeWp�������
	local nIdx = GetPlayerEquipIndex(2); --�������ϵ���������
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m n�y l� v�t ph�m kh�a, m� kh�a r�i ��i nh�!");
		return
	end	
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --û�������������õĲ��ǻƵ�����
		Talk(1,"","Ng��i �ang mang kh�ng ph�i v� kh� Ho�ng ��, h�y mang v� kh� Ho�ng �� v�o ng��i �i!");
		return
	else
		if DelItemByIndex(nIdx,-1) == 1 then
			if AddItem(tChangeWp[nIndex][2],tChangeWp[nIndex][3],tChangeWp[nIndex][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
				Msg2Player("Ng��i �� ��i 1 v� kh� Ho�ng �� th�nh c�ng: "..tChangeWp[nIndex][1]);
			else
				WriteLog("�� t� th� r�n L�u t�ng c�p tr� s� v� kh� Ho�ng ��: Ng��i ch�i "..GetName().."��i v� kh� Ho�ng �� th�t b�i.");
			end
		end
	end		
end

function how_change_ring(nPage)
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 6;
	if nRemaid < 6 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c�i"..tChangeRing[nPage*nPageNum+i][1][1].." (ho�c 1 "..tChangeRing[nPage*nPageNum+i][4]..") +1 "..tChangeRing[nPage*nPageNum+i][2][1].."--> Thu�c t�nh ��c bi�t"..tChangeRing[nPage*nPageNum+i][4].."/#change_ring_detail("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr��c/#how_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k�/#how_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"tr� l�i/main");
	Say("Ng��i l�y <color=yellow>"..tChangeRing[1][1][5].."c�i"..tChangeRing[1][1][1].." ho�c trang s�c Ho�ng �� Hi�n Vi�n chi�n ho�c Hi�n Vi�n ��u <color>th�m m�t trang s�c Ho�ng kim v�n c� cho ta, ta s� ��i <color=yellow>trang b� Ho�ng �� Hi�n Vi�n chi�n ho�c Hi�n Vi�n ��u c� thu�c t�nh ��c bi�t <color>cho ng��i, quy t�c ��i c� th� nh� sau, ch� �, h�ng li�n kh�c nhau s� ��i thu�c t�nh trang b� Ho�ng �� kh�c nhau.",
		getn(strtab),
		strtab)
end

function change_ring_detail(nIndex)
	Talk(1,"#how_change_ring(0)","�"..tChangeRing[nIndex][1][5].."c�i"..tChangeRing[nIndex][1][1].." (ho�c 1 "..tChangeRing[nIndex][4]..") v� 1 "..tChangeRing[nIndex][2][1].."��i 3 thu�c t�nh th�nh: <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]);
end

function change_ring()
	local strtab = {
		"Ta mu�n d�ng R��ng v�ng Th�nh th� v� trang s�c Ho�ng kim ��i trang s�c Ho�ng �� thu�c t�nh ��c bi�t/#box_change_ring(0)",
		"Ta mu�n d�ng trang s�c Ho�ng �� v� trang s�c Ho�ng kim ��i trang s�c Ho�ng �� c� thu�c t�nh ��c bi�t/#ring_change_ring(0)",
		"Ta kh�ng ��i/nothing"	
		}
	Say("Ng��i mu�n d�ng v�t ph�m n�o �� ��i? <color=red>Ch� �, trang s�c Ho�ng �� v� trang s�c Ho�ng kim mu�n ��i ��u ph�i mang l�n ng��i!<color>",
		getn(strtab),
		strtab)
end	

function box_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tChangeRing[nPage*nPageNum+i][1][5].."c�i"..tChangeRing[nPage*nPageNum+i][1][1].." v� 1 "..tChangeRing[nPage*nPageNum+i][2][1].." ��i "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_box_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr��c/#box_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang k�/#box_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"��i m�t l�t, ta ph�i mang trang s�c mu�n ��i l�n ng��i/nothing");		
	Say("Ch�n lo�i ng��i mu�n ��i. <color=red>Ch� �, ��t trang s�c Ho�ng kim ng��i mu�n ��i v�o v� tr� trang s�c ��u ti�n tr�n ng��i!<color>",
		getn(strtab),
		strtab)
end

function confirm_box_change_ring(nIndex)
	Say("Ng��i ch�n d�ng "..tChangeRing[nIndex][1][5].."c�i"..tChangeRing[nIndex][1][1].." v� 1 "..tChangeRing[nIndex][2][1].." ��i 3 thu�c t�nh th�nh <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X�c ��nh kh�ng?",
		2,
		"��ng �/#give_the_ring("..nIndex..")",
		"Ta ch�n nh�m r�i./#box_change_ring(0)")
end

function give_the_ring(nIndex)
	if GetItemCount(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4]) < 2 then
		Talk(1,"","Ng��i kh�ng c� �� "..tChangeRing[nIndex][1][1]);
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	local nIdx = GetPlayerEquipIndex(4); --���ڵ�һ������λ�õ����� 
	if nIdx == 0 then
		Talk(1,"","Ng��i kh�ng ��t trang s�c mu�n ��i v�o v� tr� trang s�c ��u ti�n tr�n ng��i �!");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m ng��i ��t � v� tr� trang s�c ��u ti�n tr�n ng��i l� v�t ph�m kh�a, m� kh�a r�i ��i!");
		return
	end
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 == tChangeRing[nIndex][2][2] and nId2 == tChangeRing[nIndex][2][3] and nId3 == tChangeRing[nIndex][2][4] then
		local nRoute = GetPlayerRoute();
		local nRand = 0;
		if nIndex < 11 then
			nRand = random(1,getn(tXuanyuanZhan[nRoute]));
		else
			nRand = random(1,getn(tXuanyuanDou[nRoute]));
		end 
		if DelItem(tChangeRing[nIndex][1][2],tChangeRing[nIndex][1][3],tChangeRing[nIndex][1][4],2) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local Add_flag = 0;
			if nIndex < 11 then
				Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			else
				Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
			end
			if Add_flag == 1 then
				Msg2Player("Ch�c m�ng ng��i ��i trang s�c Ho�ng �� th�nh c�ng!");
				WriteLog("�� t� th� r�n L�u ��i trang s�c Ho�ng ��: Ng��i ch�i "..GetName().."d�ng 2 "..tChangeRing[nIndex][1][1].." v�"..tChangeRing[nIndex][2][1].." ��i 1 trang s�c Ho�ng ��");
			else
				WriteLog("�� t� th� r�n L�u ��i trang s�c Ho�ng ��: Ng��i ch�i "..GetName().."d�ng 2 "..tChangeRing[nIndex][1][1].." v�"..tChangeRing[nIndex][2][1].."��i trang s�c Ho�ng �� th�t b�i, log: "..Add_flag);
			end
		end
	else
		Talk(1,"","� v� tr� trang s�c ��u ti�n tr�n ng��i ng��i kh�ng ph�i "..tChangeRing[nIndex][2][1]);
		return
	end
end

function ring_change_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tChangeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,"1 "..tChangeRing[nPage*nPageNum+i][4].." v� 1 "..tChangeRing[nPage*nPageNum+i][2][1].." ��i "..tChangeRing[nPage*nPageNum+i][4].."/#confirm_ring_change_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr��c/#ring_change_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"Trang k�/#ring_change_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"Ta kh�ng ��i/nothing");		
	Say("Ch�n lo�i ng��i mu�n ��i. <color=red>Ch� �, ��t trang s�c Ho�ng �� ng��i mu�n ��i v�o v� tr� trang s�c ��u ti�n tr�n ng��i, trang s�c Ho�ng kim � v� tr� trang s�c th� hai!<color>",
		getn(strtab),
		strtab)
end

function confirm_ring_change_ring(nIndex)
	Say("Ng��i ch�n d�ng 1 "..tChangeRing[nIndex][4].." v� 1 "..tChangeRing[nIndex][2][1].." ��i 3 thu�c t�nh th�nh <color=yellow>"..tChangeRing[nIndex][3][1]..","..tChangeRing[nIndex][3][4]..","..tChangeRing[nIndex][3][7].."<color> "..tChangeRing[nIndex][4]..". X�c ��nh kh�ng?",
		2,
		"��ng �/#give_the_ring2("..nIndex..")",
		"Ta ch�n nh�m r�i./#ring_change_ring(0)")	
end

function give_the_ring2(nIndex)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --��һ���������������Ƶ���������
	local nIdx2 = GetPlayerEquipIndex(5); --�ڶ����������������ƽ���������
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","��t trang s�c Ho�ng �� ng��i mu�n ��i v�o v� tr� trang s�c ��u ti�n tr�n ng��i, trang s�c Ho�ng kim � v� tr� trang s�c th� hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m ng��i ��t � v� tr� trang s�c ��u ti�n tr�n ng��i l� v�t ph�m kh�a, m� kh�a r�i ��i!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m ng��i ��t � v� tr� trang s�c th� hai tr�n ng��i l� v�t ph�m kh�a, m� kh�a r�i ��i!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	local nFlag = 0;
	local nParticular = 0;
	if nIndex < 11 then
		for i=1,27,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end
	else
		for i=2,28,2 do	
			if nId1 == 0 and nId2 == 102 and nId3 == 8800+i then
				nFlag = 1;
				nParticular = 8800+i;
				break
			end
		end		
	end	
	if nFlag == 0 then
		Talk(1,"","� v� tr� trang s�c ��u ti�n tr�n ng��i ng��i kh�ng ph�i "..tChangeRing[nIndex][4]);
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tChangeRing[nIndex][2][2] or nId5 ~= tChangeRing[nIndex][2][3] or nId6 ~= tChangeRing[nIndex][2][4] then
		Talk(1,"","� v� tr� trang s�c th� hai tr�n ng��i ng��i kh�ng ph�i "..tChangeRing[nIndex][2][1]);
		return
	end
	local nRoute = GetPlayerRoute();
	local nRand = 0;
	if nIndex < 11 then
		nRand = random(1,getn(tXuanyuanZhan[nRoute]));
	else
		nRand = random(1,getn(tXuanyuanDou[nRoute]));
	end 
	if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
		local Add_flag = 0;
		if nIndex < 11 then
			Add_flag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		else
			Add_flag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,tChangeRing[nIndex][3][2],tChangeRing[nIndex][3][3],tChangeRing[nIndex][3][5],tChangeRing[nIndex][3][6],tChangeRing[nIndex][3][8],tChangeRing[nIndex][3][9]);
		end
		if Add_flag == 1 then
			Msg2Player("Ch�c m�ng ng��i ��i trang s�c Ho�ng �� th�nh c�ng!");
			WriteLog("�� t� th� r�n L�u ��i trang s�c Ho�ng ��: Ng��i ch�i "..GetName().."D�ng th�"..tChangeRing[nIndex][2][1].." v�"..tChangeRing[nIndex][4].." ��i 1 trang s�c Ho�ng ��");
		else
			WriteLog("�� t� th� r�n L�u ��i trang s�c Ho�ng ��: Ng��i ch�i "..GetName().."D�ng th�"..tChangeRing[nIndex][2][1].." v�"..tChangeRing[nIndex][4].."��i trang s�c Ho�ng �� th�t b�i, log: "..Add_flag);
		end
	end
end

function weapon_change_ring()
	Say("N�u ng��i c� v� kh� Ho�ng �� d�, ��n ch� ta ��i trang s�c Ho�ng �� l�u ph�i t��ng �ng. <color=red>Ch� �, mang v� kh� Ho�ng �� mu�n ��i v�o ng��i. <color> Ng��i mu�n ��i trang s�c n�o?",
		3,
		"Ta mu�n l�y v� kh� Ho�ng �� ��i Hi�n Vi�n chi�n/#confirm_wp_change_ring(1)",
		"Ta mu�n l�y v� kh� Ho�ng �� ��i Hi�n Vi�n ��u/#confirm_wp_change_ring(2)",
		"T�m th�i kh�ng ��i. /nothing")
end

function confirm_wp_change_ring(nType)
	local nIndex = 0; --��ӦtChangeWp�������
	local nIdx = GetPlayerEquipIndex(2); --�������ϵ���������
	for i = 1,getn(tChangeWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tChangeWp[i][2] and nId2 == tChangeWp[i][3] and nId3 == tChangeWp[i][4] then 
			nIndex = i;
			break
		end
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m n�y l� v�t ph�m kh�a, m� kh�a r�i ��i nh�!");
		return
	end
	if nIdx == 0 or nIndex == 0 then  --û�������������õĲ��ǻƵ�����
		Talk(1,"","Ng��i �ang mang kh�ng ph�i v� kh� Ho�ng ��, h�y mang v� kh� Ho�ng �� v�o ng��i �i!");
		return
	end
	Say("Ng��i x�c ��nh d�ng <color=red>"..tChangeWp[nIndex][1].."<color>��i <color=yellow>"..tWpChangeRing[nIndex][nType][1].."<color> ch�?",
		2,
		"�, ta mu�n ��i./#give_change_ring("..nIndex..","..nType..")",
		"Kh�ng ph�i, ta mu�n x�c ��nh l�i v� kh� Ho�ng �� ta mu�n ��i/nothing")
end

function give_change_ring(nIndex,nType)
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local nIdx = GetPlayerEquipIndex(2);
	if DelItemByIndex(nIdx,-1) == 1 then
		local Add_flag = AddItem(tWpChangeRing[nIndex][nType][2],tWpChangeRing[nIndex][nType][3],tWpChangeRing[nIndex][nType][4],1,1,-1,-1,-1,-1,-1,-1);
		if Add_flag == 1 then
			Msg2Player("Ch�c m�ng ng��i d�ng "..tChangeWp[nIndex][1].."��i"..tWpChangeRing[nIndex][nType][1].." th�nh c�ng!");
			WriteLog("�� t� th� r�n L�u-V� kh� Ho�ng �� ��i trang s�c Ho�ng ��: Ng��i ch�i"..GetName().."D�ng th�"..tChangeWp[nIndex][1].."��i"..tWpChangeRing[nIndex][nType][1].." th�nh c�ng!");
		else
			WriteLog("�� t� th� r�n L�u-V� kh� Ho�ng �� ��i trang s�c Ho�ng ��: Ng��i ch�i"..GetName().."D�ng th�"..tChangeWp[nIndex][1].."��i"..tWpChangeRing[nIndex][nType][1].."th�t b�i! log: "..Add_flag);
		end
	end
end	

function box_change_yuehua()
	local strtab = {
		"Ta mu�n d�ng Giang S�n thi�t b�o r��ng l�y 1 Nguy�t Hoa (m�i b�o r��ng t�ng 0.1%)/#input_box_num(1)",
		"Ta mu�n d�ng Giang S�n ��ng b�o r��ng l�y 1 Nguy�t Hoa (m�i b�o r��ng t�ng 0.25%)/#input_box_num(2)",
		"Ta mu�n d�ng Th�nh Th� ng�n b�o r��ng l�y 1 Nguy�t Hoa (m�i b�o r��ng t�ng 5%)/#input_box_num(3)",
		"Ta mu�n d�ng R��ng v�ng Th�nh th� l�y 1 Nguy�t Hoa (m�i b�o r��ng t�ng 50%)/#input_box_num(4)",
		"Ta kh�ng ��i/nothing"	
		}
	Say("Ta c� th� ��c s� b�o r��ng n�y, l�y Nguy�t Hoa b�n trong ra, d�a v�o <color=yellow>s� b�o r��ng<color> kh�c nhau, Nguy�t Hoa nh�n ���c <color=yellow>s�<color> kh�c nhau, ng��i ch�n �i!",
		getn(strtab),
		strtab)	 
end

function input_box_num(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --�ռ为�ؼ��
		return
	end		
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local tBox = {"Giang S�n thi�t b�o r��ng","Giang S�n ��ng b�o r��ng","Th�nh Th� ng�n b�o r��ng","Th�nh Th� kim b�o r��ng"};
	local nNum = GetItemCount(2,0,tId[nType]);
	if nNum == 0 then
		Talk(1,"","Ng��i kh�ng c� <color=yellow>"..tBox[nType].."<color>.")
		return
	end
	if nNum > 10000/tProb[nType] then
		nNum = 10000/tProb[nType];
	end
	SetTaskTemp(TT_BOX_TYPE,nType);
	AskClientForNumber("confirm_change_yuehua", 1, tonumber(nNum), "Xin nh�p "..tBox[nType].."Ch�n");
end

function confirm_change_yuehua(nCount)
	local tProb = {0.1,0.25,5,50};
	local nType = GetTaskTemp(TT_BOX_TYPE);
	Say("Ng��i c� <color=yellow>"..format("%.2f",nCount*tProb[nType]).."%<color> nh�n ���c <color=yellow>1 Nguy�t Hoa<color>, ��i th�t b�i s� kh�ng c� g� c�, ng��i mu�n ��i kh�ng?",
		2,
		"�, ta mu�n ��i./#give_yuehua("..nType..","..nCount..")",
		"T�m th�i kh�ng ��i/nothing")
end

function give_yuehua(nType,nCount)
	local tProb = {10,25,500,5000};
	local tId = {1025,1026,1027,1028};
	local nProb = nCount*tProb[nType];
	local nRand = random(1,10000);
	if DelItem(2,0,tId[nType],nCount) == 1 then
		if nRand <= nProb then
			AddItem(2,1,2002,1);
			Msg2Player("Ch�c m�ng ng��i nh�n ���c 1 Nguy�t Hoa!");
		else
			Talk(1,"","V�n kh� c�a ng��i kh� �en, kh�ng ��i ���c, ti�p t�c ki�n tr� nh�.");
		end
	end
end

function buchang_dia()
	Say("Tr�n tr��c trong b�o r��ng V� L�m Minh ch� ��a ra c� gi�u lo�i nguy�n li�u qu� hi�m Nguy�t Hoa n�y, nh�ng do h� gi�i quy�t kh�ng th�a ��ng, t�o nguy�n li�u th�n kh� tr� th�nh ph� ph�m, l�ng ph� t�m huy�t c�a th� ��ng, v� th� h� nh� ta b�i th��ng c�c v� cao nh�n c�a h� ch� t�o. T� 23:00 ng�y 18 th�ng 10 ��n ng�y 25 th�ng 10, ch� c�n h� ch� t�o v� kh� c�a ng��i, k� thu�t ch� t�o b�t k� ho�c ch� t�o n�n, ch� t�o h� gi�p, ch� t�o h� y c�p 70 tr� l�n, s� nh�n m�t ph�n b�i th��ng � ch� ta, nh�ng m�i ng��i ch� c� th� nh�n 1 l�n, b�i th��ng bao g�m 2 Nguy�t Hoa ��c bi�t (v�t ph�m kh�a), 40 T� linh kho�ng (v�t ph�m kh�a, th�m gi� tr� v�t ph�m 250), n�u th�a m�n �i�u ki�n th� ��n nh�n nh�.",
		2,
		"Nh�n b�i th��ng./get_buchang",
		"L�n sau l�i ��n/nothing")
end

function get_buchang()
	if GetTask(TASK_BUCHANG_ID) == buchang_id then
		Talk(1,"","Ng��i �� nh�n 1 l�n r�i. Sao tham lam v�y h�?");
		return
	end
	local playerlevel = GetLevel();
	if playerlevel < 10 then
		Talk(1,"","Ng��i t�ng tr�i giang h� kh�ng nhi�u, ��n c�p <color=red>10<color> r�i quay l�i t�m ta!")
		return
	end	
	if Zgc_pub_goods_add_chk(2,42) ~= 1 then   --�ռ为�ؼ��
		return
	end	 
	if GetLifeSkillLevel(1,2) >= 70 or GetLifeSkillLevel(1,3) >= 70 or GetLifeSkillLevel(1,4) >= 70 or GetLifeSkillLevel(1,5) >= 70 or GetLifeSkillLevel(1,9) >= 70 or GetLifeSkillLevel(1,10) >= 70 then
		AddItem(2,1,1173,2);
		AddItem(2,1,1174,40);
		Msg2Player("Ch�c m�ng ng��i nh�n ���c 2 Nguy�t Hoa ��c bi�t v� 40 T� linh th�ch!");
		SetTask(TASK_BUCHANG_ID,buchang_id);
	else
		Talk(1,"","H� ch� t�o v� kh� c�a ng��i, ho�c k� thu�t ch� t�o n�n, ch� t�o h� gi�p, ch� t�o h� y kh�ng c� c�i n�o ��t c�p 70 c�!");
		return
	end
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end

function nothing()

end

function lingqi_item_update()
	local strtab = {
--			"��Ҫ��������װ��������/update_item_lingqi",
			"Ta mu�n ph�n m�nh trang b� b�t qu�t c�a ta/dasan_bagua_tixing",
			"Ta mu�n nh�n thi�t h�i c�a vi�c ph�n m�nh trang b� b�t qu�i./get_bagua_buchang",
			"Ta mu�n l�y linh th�ch c�a trang b� b�t qu�i/quchu_bagua_lingshi",
			"Ch�n sai r�i, tr� l�i/main",
			"Ta s� quay l�i sau!/nothing"
			};
	Say("<color=green>�� t� th� r�n L�u<color>: S� ta kh� th�t, s� ph� l�i t�m ra vi�c cho ta l�m n�a r�i. Sau n�y, n�u ai mang 'L�nh th�o g� mi�n ph�' ��n ch� ta �� th�o r�i trang b� B�t Qu�i, ��u c� th� nh�n ti�n b�i th��ng th�o g�. <color=yellow>L�u �, m�i l�n nh�n ti�n b�i th��ng s� ti�u hao 1 l�nh th�o g� mi�n ph�<color>. T�t nhi�n ng��i c�ng c� th� ��n ch� ta �� th�o Linh th�ch. <color=red>Linh th�ch c� linh kh� 80 tr� l�n c� th� quay v� v�ng Th�i H� B�t Qu�i.<color>",
		getn(strtab),
		strtab);
end

function update_item_lingqi()
	Say("Ch�c m�i ng��i n�m m�i v�n s� nh� �,trang b� linh kh� c� 91 linh kh� (bao g�m 91) tr� l�n, 100 linh kh� tr� xu�ng bao g�m 100 linh kh�, ��u s� nh�n mi�n ph� t�ng linh kh� ng�u nhi�n 10, 12, 14, 16, 18, 20 ng�u nhi�n � ch� ta, nh�ng t�ng bao nhi�u th� ph�i xem v�n may c�a ng��i. ��y l� �u ��i T�t, h�y nhanh ch�n ��n s�m. <color=yellow>S� d�ng 2 V� Ng�n Th�y s� t�ng 20 linh kh�.<color>",
		3,
		"Ta mu�n t�ng linh kh� trang b� (t�ng ng�u nhi�n 10, 12, 14, 16, 18, 20)/#choose_item_weizhi(0)",
		"Ta mu�n d�ng 2 V� Ng�n Th�y �� t�ng linh kh� trang b� (t�ng 20)/#choose_item_weizhi(1)",
		"Sau n�y ta l�i ��n t�ng/nothing")
end

function choose_item_weizhi(nAddMax)
	Say("Ng��i mu�n t�ng linh kh� c�a trang b� n�o, sau khi t�ng s� t�ng ng��i m�t v�i linh kh�.",
		5,
		"��u/#confirm_update_lingqi(0,"..nAddMax..")",
		"Ngo�i trang/#confirm_update_lingqi(1,"..nAddMax..")",
		"H� y/#confirm_update_lingqi(3,"..nAddMax..")",
		"V� kh�/#confirm_update_lingqi(2,"..nAddMax..")",
		"��i ta m�c trang b� l�n ��./nothing")
end

function confirm_update_lingqi(nWz,nAddMax)
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nXq = GetItemAttr(nIndex,1);--��ȡ��һ��ħ������id �ж��Ƿ���Ƕ��ʯͷ
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����
	local nRandSeed = GetItemRandSeed(nIndex);--�������
	
	
	if nIndex == 0 then 
		Talk(1,"","Tr�n ng��i ng��i kh�ng c� trang b� mu�n t�ng linh kh�.");
		return
	end
	if nLingqi < 91 or nLingqi > 100 or nXq ~= 0 then
		Talk(1,"","Cho d� mu�n t�ng c�ng ph�i mang trang b� ta c� th� t�ng ��n, tay ngh� ta c� h�n, ch� c� l� ch�a kh�m, ��ng th�i �i�m linh kh� l� 91-100 m�i c� th� t�ng linh kh�.");
		return
	end
	
	if nWz == 0 then
		if nId1 == 0 and nId2 == 103 and nId3 >= 73 then
			Talk(1,"","Ch� t�o ph�i h�p k� n�ng cu�c s�ng m�i th�m trong ho�t ��ng xu�n, trang b� c�p 8, c�p 9 kh�ng th� t�ng.");
			return
		end
	elseif nWz == 1 then
		if nId1 == 0 and nId2 == 100 and nId3 >= 73 then
			Talk(1,"","Ch� t�o ph�i h�p k� n�ng cu�c s�ng m�i th�m trong ho�t ��ng xu�n, trang b� c�p 8, c�p 9 kh�ng th� t�ng.");
			return
		end
	elseif nWz == 3 then
		if nId1 == 0 and nId2 == 101 and nId3 >= 73 then
			Talk(1,"","Ch� t�o ph�i h�p k� n�ng cu�c s�ng m�i th�m trong ho�t ��ng xu�n, trang b� c�p 8, c�p 9 kh�ng th� t�ng.");
			return
		end
	elseif nWz == 2 then
		for i=1,getn(tHighLvWp) do
			if nId1 == tHighLvWp[i][2] and nId2 == tHighLvWp[i][3] and nId3 == tHighLvWp[i][4] then
				Talk(1,"","Ch� t�o ph�i h�p k� n�ng cu�c s�ng m�i th�m trong ho�t ��ng xu�n, trang b� c�p 8, c�p 9 kh�ng th� t�ng.");
				return
			end
		end
	end				
	
	if nLock == 1 then
		Talk(1,"","Trang b� tr�n ng��i ng��i �� kh�a, c�n m� kh�a m�i c� th� th�ng c�p.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi t�ng linh kh� trang b� h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end
	if nAddMax == 1 then
		if GetItemCount(2,1,503) < 2 then
			Talk(1,"","Ng��i kh�ng c� �� V� Ng�n Th�y.");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end	
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local tLq = {10,12,14,16,18,20};
		local nRand = random(1,getn(tLq));
		local nNewLq = nLingqi+tLq[nRand]; --����������
		if nAddMax == 1 then
			if DelItem(2,1,503,2) == 1 then
				nNewLq = nLingqi+20;
			end
		end
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nNewLq,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --����
			end
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
			Talk(1,"","Ch�c m�ng ng��i t�ng linh kh� trang b� th�nh c�ng!");
			WriteLog("Ho�t ��ng Xu�n-�� t� th� r�n L�u: Ng��i ch�i"..GetName().."T�ng linh kh� trang b� th�nh c�ng, id v�t ph�m g�c, �i�m linh kh�, ��ng c�p c��ng h�a, v� tr� ��nh h�n: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		else
			WriteLog("Ho�t ��ng Xu�n-�� t� th� r�n L�u: Ng��i ch�i"..GetName().."T�ng linh kh� trang b� th�t b�i, id v�t ph�m g�c, �i�m linh kh�, ��ng c�p c��ng h�a, v� tr� ��nh h�n: "..nId1..", "..nId2..", "..nId3..", "..nLingqi..", "..nQianghua..", "..nDing..".");
		end
	else
		Talk(1,"","H�y b�o ��m ng��i �� mang trang b� mu�n t�ng tr�n ng��i!");
	end
end

function dasan_bagua_tixing()
	Say("<color=green>�� t� th� r�n L�u<color>: L�u � ��c bi�t ��y! Ch� c� b� ra <color=red>10000 gi� tr�<color> m�i c� th� ��m b�o trang b� c�a ng��i kh�ng b� bi�n m�t trong l�c th�o g�, <color=yellow>c� th� mang L�nh th�o g� mi�n ph� ��n ch� ta �� nh�n l�i s� ti�n �� ti�u hao, gi� tr� s� kh�ng ���c ho�n l�i.<color>",
		2,
		"M� giao di�n ��c/dasan_bagua_item",
		"Kh�ng c� g�/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --����������װ����
end

function finish_dasan_bagua(nGold)
	local nTime = tonumber(date("%Y%m%d%H"));
--	if nTime >= 2008091108 and nTime <= 2008101207 then
--		if GetTask(TASK_DASAN_NUM) < DASAN_TOTAL_NUM then
			SetTask(TASK_DASAN_NUM,GetTask(TASK_DASAN_NUM)+1);
			SetTask(TASK_BAGUA_GOLD,GetTask(TASK_BAGUA_GOLD)+nGold);
--		end
--	end
end

function get_bagua_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM and nGold == 0 then
--		Talk(1,"","<color=green>����������<color>��ÿ���˿�����ȡ"..DASAN_TOTAL_NUM.."�װ���װ������ɢ�Ĳ��������Ѿ������ˡ�");
--	else
		if nBuchang == 0 or nGold == 0 then
			Talk(1,"","Hi�n nay ng��i kh�ng c� b�i th��ng c� th� l�nh.");
			return
		end		
--		if GetTask(TASK_DASAN_NUM) <= DASAN_TOTAL_NUM then
			Say("<color=green>�� t� th� r�n L�u<color>: B�y gi� ng��i c� th� nh�n ti�n b�i th��ng th�o g� trang b� B�t Qu�i<color=yellow>"..nBuchang.."<color> l�n, c�n c� <color=yellow>L�nh th�o g� mi�n ph� "..nBuchang.." c�i<color>, ti�n b�i th��ng c� th� nh�n ���c "..nGold.." ��ng, ���c kh�ng?",
				2,
				"���c/confirm_get_buchang",
				"S� ��n nh�n sau/nothing");
--		end
--	end		
end

function confirm_get_buchang()
	local nBuchang = GetTask(TASK_DASAN_NUM)-GetTask(TASK_BAGUA_BUCHANG);
	local nGold = GetTask(TASK_BAGUA_GOLD)-GetTask(TASK_BUCHANG_GOLD);
	if nBuchang == 0 or nGold == 0 then
		Talk(1,"","Hi�n nay ng��i kh�ng c� b�i th��ng c� th� l�nh.");
		return
	end
	if GetItemCount(2,1,3388) < nBuchang then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: B�y gi� ng��i c� th� th�o g� trang b� B�t Qu�i <color=yellow>"..nBuchang.."<color> l�n, c�n c� <color=yellow>L�nh th�o g� mi�n ph� "..nBuchang.." c�i<color>, ng��i kh�ng c� �� r�i.");
		return
	end		
--	if GetTask(TASK_BAGUA_BUCHANG) >= DASAN_TOTAL_NUM then
--		Talk(1,"","<color=green>����������<color>��ÿ���˿�����ȡ"..DASAN_TOTAL_NUM.."�װ���װ������ɢ�Ĳ��������Ѿ������ˡ�");
--	else
		if DelItem(2,1,3388,nBuchang) == 1 then
			SetTask(TASK_BAGUA_BUCHANG,GetTask(TASK_BAGUA_BUCHANG)+nBuchang);
			SetTask(TASK_BUCHANG_GOLD,GetTask(TASK_BUCHANG_GOLD)+nGold);
			Earn(nGold);
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i �� nh�n ti�n b�i th��ng r�i.");
			WriteLog("�� t� th� r�n L�u: Ng��i ch�i: "..GetName().." �� nh�n ti�n b�i th��ng th�o g� B�t Qu�i, s� ti�n: "..nGold);
		end
--	end
end

function get_bagua_lingshi(nType)
	Say("Ng��i mu�n l�y linh kh� c�a trang b� n�o tr�n ng��i?",
		5,
		"��u/#ask_quchu_lingshi(0,"..nType..")",
		"Ngo�i trang/#ask_quchu_lingshi(1,"..nType..")",
		"H� y/#ask_quchu_lingshi(3,"..nType..")",
		"V� kh�/#ask_quchu_lingshi(2,"..nType..")",
		"��i ta m�c trang b� l�n ��./nothing")	
end

function ask_quchu_lingshi(nWz,nType)
	local tChouqu = {"��u","Ngo�i trang","V� kh�","H� y"}
	Say("Ng��i mu�n l�y �� tr�n <color=yellow>"..tChouqu[nWz+1].."<color> �?",
		3,
		"���c/#confirm_quchu_lingshi("..nWz..","..nType..")",
		"Ta ch�n nh�m r�i./#get_bagua_lingshi("..nType..")",
		"��i ta m�c trang b� l�n ��./nothing")
end

function confirm_quchu_lingshi(nWz,nType)
	local nRoute = GetPlayerFaction();
	local tItem = {	
	[1] = {2,0,448,"Ph� Hi�n X� L�i"},	--����
	[2] = {2,0,469,"Thi�n C� M�c"},--�䵱
	[3] = {2,0,457,"Kim Li�n Hoa"},--����
	[4] = {2,0,466,"T� Kim B�t"},--ؤ��
	[5] = {2,0,454,"B� ��c ph��ng"},--����	
	[6] = {2,0,477,"Tinh B� Ti�n ��i"},	--����
	[7] = {2,0,484,"R�t ��c"},--�嶾
	[8] = {2,0,491,"Mai Qu� L�"},--����
	[9] = {2,0,495,"Khu Ma H��ng"},--����
	[10] = {2,0,499,"Th�nh H�a L�nh"}--����
	};
	if nType == 1 then  
		if GetItemCount(2,1,533) < 1 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Mu�n th�o Linh th�ch linh kh� 80 tr� xu�ng ra kh�i trang b� B�t Qu�i, c�n 1 Tinh luy�n B�ng Th�ch, ng��i kh�ng c� v�t n�y.")
			return
		end
	elseif nType == 2 then	
		if GetItemCount(2,1,504) < 1 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Mu�n th�o Linh th�ch linh kh� 80 tr� l�n ra kh�i trang b� B�t Qu�i, c�n 1 N� Oa Tinh Th�ch, ng��i kh�ng c� v�t n�y.");
			return
		end
	elseif nType == 3 then
		if nRoute == 0 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�a gia nh�p m�n ph�i kh�ng th� s� d�ng ch�c n�ng th�o Linh th�ch.");
			return
		else
			if GetItemCount(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3]) < 100 then
				Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Mu�n th�o Linh th�ch linh kh� 80 tr� l�n ra kh�i trang b� B�t Qu�i c�n 100 "..tItem[nRoute][4]..", ng��i kh�ng c� v�t n�y.")
				return
			end
		end
	elseif nType == 4 then	
		if GetItemCount(2,1,3388) < 1 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Mu�n th�o Linh th�ch linh kh� 80 tr� l�n ra kh�i trang b� B�t Qu�i, c�n 1 L�nh th�o g� mi�n ph�, ng��i kh�ng c� v�t n�y.");
			return
		end			
	end
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --��ȡ��ǰװ���ȼ�
	local nBaseLv = GetEquipBaseLevel(nIndex); --��ȡװ�������ȼ�
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--��ȡ��һ��ħ������id �ȼ�
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--��ȡ�ڶ���ħ������id �ȼ�
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--��ȡ������ħ������id �ȼ�
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nGuawei = GetEquipBaGua(nIndex); --��ȡ��λ
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--�Ƿ��Ѿ�����
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����	
	local nRandSeed = GetItemRandSeed(nIndex);--�������
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --����һ���������
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --���Զ����������
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --���������������
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --����һ��������2Ϊ������������1Ϊ����ż����
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --���Զ���������2Ϊ����1Ϊ��
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --��������������2Ϊ����1Ϊ��
	
	if nIndex == 0 then 
		Talk(1,"","Ng��i kh�ng c� mang trang b� mu�n l�y linh kh� ra tr�n ng��i.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng��i �ang mang trang b� b�t qu�i �, sau khi ph�n m�nh ��n nh�n linh th�ch.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang b� n�y c�a ng��i kh�ng c� kh�m �� l�m sao l�y ���c!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� tr�n ng��i ng��i �� kh�a, c�n m� kh�a m�i c� th� th�ng c�p.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi l�y linh th�ch ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end	
	if Zgc_pub_goods_add_chk(6,200) ~= 1 then
		return
	end
	if nType == 1 then
		if nLingqi >= 80 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�n trang b� c� linh kh� tr�n 80, xin h�y d�ng ��o c� th�o Linh th�ch t��ng �ng.")
			return
		end
		if DelItem(2,1,533,1) ~= 1 then
			return
		end
	elseif nType == 2 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�n trang b� c� linh kh� d��i 80, xin h�y d�ng ��o c� th�o Linh th�ch t��ng �ng.")
			return
		end		
		if DelItem(2,1,504,1) ~= 1 then
			return
		end
	elseif nType == 3 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�n trang b� c� linh kh� d��i 80, xin h�y d�ng ��o c� th�o Linh th�ch t��ng �ng.")
			return
		end 
		if DelItem(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3],100) ~= 1 then
			return
		end
	elseif nType == 4 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�n trang b� c� linh kh� d��i 80, xin h�y d�ng ��o c� th�o Linh th�ch t��ng �ng.")
			return
		end 
		if DelItem(2,1,3388,1) ~= 1 then
			return
		end		
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --����
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --���ض�Ӧ��ż����
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --���ض�Ӧ��ż����
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --���ض�Ӧ��ż����
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nGuawei == 10 then   --����
				AddItem(2,0,1084,1);
			else	
				if nJihuo ~= 0 and nLingqi >= 80 then   --�Ѿ�����
					if nGuawei ~= 0 and nGuawei ~= 5 then
						AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
					end
				end
			end				  
			Talk(1,"","Ch�c m�ng ng��i �� l�y linh th�ch th�nh c�ng.");
			WriteLog("�� t� th� r�n L�u l�y linh th�ch: Ng��i ch�i"..GetName().."L�c th�o Linh th�ch th�nh c�ng, id v�t ph�m, Linh kh�, C��ng ho�, ��nh h�n, H�t gi�ng ng�u nhi�n, thu�c t�nh Linh th�ch 1, ��ng c�p, thu�c t�nh 2, ��ng c�p, thu�c t�nh 3, ��ng c�p, lo�i Linh th�ch th�o ra, thu�c qu�: "..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		else
			WriteLog("�� t� th� r�n L�u l�y linh th�ch: Ng��i ch�i"..GetName().."L�c th�o Linh th�ch th�t b�i, v� tr� th�t b�i, id v�t ph�m, Linh kh�, C��ng ho�, ��nh h�n, H�t gi�ng ng�u nhi�n, thu�c t�nh Linh th�ch 1, ��ng c�p, thu�c t�nh 2, ��ng c�p, thu�c t�nh 3, ��ng c�p, lo�i Linh th�ch th�o ra, thu�c qu�: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		end		
	end			
end

function lingqi_item_change()
	local strtab = {
			"Ta mu�n chuy�n h�a trang b� linh kh� c� linh kh� t� 60-79 th�nh 5 X�ch Thi�t Tinh (gi� tr� 500)/#choose_change_wz(1)",
			"Ta mu�n chuy�n linh kh� t� 80 ��n 120 c�a trang b� Linh kh� th�nh 5 X�ch Thi�t Tinh (500 gi� tr�), 1 nguy�t hoa (x�c su�t 50%)/#choose_change_wz(2)",
			"Ta mu�n chuy�n h�a trang b� b�t qu�i c� linh kh� t� 60-79 th�nh 5 X�ch Thi�t Tinh (gi� tr� 500) v� 2 linh th�ch ng�u nhi�n c�p 1-5/#choose_change_wz(3)",
--			"��Ҫ��80��120�����İ���װ��ת��Ϊ������(500��ֵ��)5����2��1��5�������ʯ��50%����1���»�/#choose_change_wz(4)",
			"Ch�n sai r�i, tr� l�i/main",
			"Ta s� quay l�i sau!/nothing"
			};
	Say("C� m�t s� trang b� linh kh� kh�ng d�ng, ta gi�p ng��i chuy�n h�a ch�ng th�nh nguy�n li�u, ng��i c� mu�n th� kh�ng. <color=yellow>Ch� �, linh th�ch �� kh�m nh�ng ch�a h�nh th�nh trang b� b�t qu�i th� d�a v�o trang b� linh kh� �� gi�i quy�t. <color><color=red>Mang trang b� mu�n chuy�n h�a l�n ng��i.<color>",
		getn(strtab),
		strtab);
end

function choose_change_wz(nType)
	Say("Ng��i mu�n chuy�n h�a <color=yellow>trang b� n�o<color> tr�n ng��i <color=red>Ch� �, sau khi ch�n trang b� s� chuy�n h�a th�nh nguy�n li�u.<color>",
		6,
		"��u/#confirm_change_cailiao("..nType..",0)",
		"Ngo�i trang/#confirm_change_cailiao("..nType..",1)",
		"H� y/#confirm_change_cailiao("..nType..",3)",
		"V� kh�/#confirm_change_cailiao("..nType..",2)",
		"Ch�n sai. Tr� v�/lingqi_item_change",
		"��i ta m�c trang b� l�n ��./nothing")		
end

function confirm_change_cailiao(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nGuawei = GetEquipBaGua(nIndex); --��ȡ��λ
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	
	if nIndex == 0 then 
		Talk(1,"","Ng��i kh�ng c� mang trang b� mu�n chuy�n h�a l�n ng��i.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng��i �ang mang trang b� b�t qu�i �, h�y ph�n m�nh r�i ��n chuy�n h�a.");
		return
	end
	if nLingqi < 60 or nLingqi > 120 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Trang b� chuy�n th�nh nguy�n li�u �i�m Linh kh� ph�i � trong kho�ng 60 ��n 120.");
		return
	end
	if nLock > 0 then
		Talk(1,"","Trang b� c�a ng��i hi�n �ang � tr�ng th�i kh�a, h�y m� kh�a r�i ��n chuy�n h�a.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi chuy�n h�a trang b� linh kh� ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end
	if nQianghua >= 5 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Xin l�i, �� c��ng ho� c�a trang b� l�n h�n 5, kh�ng th� chuy�n ho�.");
		return
	end
	--������������װ��
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 1 or is_xuanhuang_zhuangbei(nId1,nId2,nId3) == 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Trang b� Thi�n ��a Huy�n Ho�ng kh�ng th� chuy�n ho�.");
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end			
	if nType == 1 then
		if nGuawei ~= 0 then
			Talk(1,"","��y l� trang b� b�t qu�i �, ng��i ch�n sai r�i.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","�i�m linh kh� kh�ng ��ng, ng��i ch�n sai r�i.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					WriteLog("�� t� th� r�n L�u-Trang b� chuy�n h�a nguy�n li�u: Ng��i ch�i"..GetName().."chuy�n h�a th�nh c�ng �i�m linh kh� th�nh "..nLingqi.."trang b� linh kh�. Id "..nId1..","..nId2..","..nId3..". �� c��ng ho� "..nQianghua..".");
					Talk(1,"","Ch�c m�ng ng��i, chuy�n h�a trang b� linh kh� th�nh nguy�n li�u th�nh c�ng.");
				end
			end
		end
	elseif nType == 2 then
		if nGuawei ~= 0 then
			Talk(1,"","��y l� trang b� b�t qu�i �, ng��i ch�n sai r�i.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","�i�m linh kh� kh�ng ��ng, ng��i ch�n sai r�i.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRanda = random(1,100);
					if nRanda <= 50 then
						AddItem(2,1,2002,1);
					end
					WriteLog("�� t� th� r�n L�u-Trang b� chuy�n h�a nguy�n li�u: Ng��i ch�i"..GetName().."chuy�n h�a th�nh c�ng �i�m linh kh� th�nh "..nLingqi.."trang b� linh kh�. Id "..nId1..","..nId2..","..nId3..". �� c��ng ho� "..nQianghua..".");

					Talk(1,"","Ch�c m�ng ng��i, chuy�n h�a trang b� linh kh� th�nh nguy�n li�u th�nh c�ng.");
				end
			end
		end	
	elseif nType == 3 then
		if nGuawei == 0 then
			Talk(1,"","��y kh�ng ph�i l� trang b� b�t qu�i, ng��i ch�n sai r�i.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","�i�m linh kh� kh�ng ��ng, ng��i ch�n sai r�i.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
					end						
					WriteLog("�� t� th� r�n L�u-Trang b� chuy�n h�a nguy�n li�u: Ng��i ch�i"..GetName().."chuy�n h�a th�nh c�ng �i�m linh kh� th�nh "..nLingqi.."trang b� B�t Qu�i. Id "..nId1..","..nId2..","..nId3..". �� c��ng ho� "..nQianghua..".");

					Talk(1,"","Ch�c m�ng ng��i, chuy�n h�a trang b� linh kh� th�nh nguy�n li�u th�nh c�ng.");
				end
			end
		end	
	elseif nType == 4 then
		if nGuawei == 0 then
			Talk(1,"","��y kh�ng ph�i l� trang b� b�t qu�i, ng��i ch�n sai r�i.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","�i�m linh kh� kh�ng ��ng, ng��i ch�n sai r�i.")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRandb = random(1,100);
					if nRandb <= 50 then
						AddItem(2,1,2002,1);
					end
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
					end						
					WriteLog("�� t� th� r�n L�u-Trang b� chuy�n h�a nguy�n li�u: Ng��i ch�i"..GetName().."chuy�n h�a th�nh c�ng �i�m linh kh� th�nh "..nLingqi.."trang b� B�t Qu�i. Id "..nId1..","..nId2..","..nId3..". �� c��ng ho� "..nQianghua..".");
					Talk(1,"","Ch�c m�ng ng��i, chuy�n h�a trang b� linh kh� th�nh nguy�n li�u th�nh c�ng.");
				end
			end
		end	
	end			
end

--���ض�Ӧ��ʯ����ż���� nNumֵΪ��2Ϊ������1Ϊż��
function get_lingqi_jiou(nId,nWz,nLv,nNum)
	local nMin,nMax = GetLingShiAttrRange(nId,nWz,nLv);
	local tJishu = {};
	local tOushu = {};
	local nLingqi = 0;
	
	for i=nMin,nMax do
		if mod(i,2) == 0 then
			tinsert(tOushu,i);
		else
			tinsert(tJishu,i);
		end
	end
	
	if nNum == 1 then
		local nRand = random(1,getn(tOushu));
		nLingqi = tOushu[nRand];
	elseif nNum == 2 then
		local nRand = random(1,getn(tJishu));
		nLingqi = tJishu[nRand];
	end
	return nLingqi;
end

function about_tiandiWp()
	Say("<color=green>�� t� th� r�n L�u<color>: N�u ng��i kh�ng th�ch l�c c�ng k�ch c�a v� kh� Thi�n ��a Huy�n Ho�ng hi�n t�i, th� c� th� ��n ch� ta, d�ng <color=yellow>3 B�n Long b�ch<color> �� ��c l�i, <color=yellow>l�u �, l�c c�ng k�ch ng�u nhi�n. <color>S� l�u l�i �� c��ng ho� v� hi�u qu� ��nh h�n c�a v� kh� Thi�n ��a Huy�n Ho�ng. <color=yellow>V� kh� �� kh�m n�m Linh th�ch kh�ng th� ��c l�i.<color>",
		2,
		"��c v� kh� Thi�n ��a Huy�n Ho�ng/give_new_tiandi",
		"Ta kh�ng ��c/nothing")
end

function give_new_tiandi()
	local nIndex = 0; --��ӦtTiandiWp�������
	local nIdx = GetPlayerEquipIndex(2); --�������ϵ���������
	local nLingqi = GetItemMaxLingQi(nIdx);   --��ȡ����ֵ
	local nQianghua = GetEquipAttr(nIdx,2);--��ȡ��Ʒǿ���ȼ�
	local nDing = GetItemSpecialAttr(nIdx,"DING7"); --��ȡװ���Ƿ񶨻�	
	local nMofa,nLv = GetItemAttr(nIdx,1);--��ȡ��һ��ħ������id �ȼ�
	
	if GetItemCount(2,1,1000) < 3 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� �� B�n Long b�ch.");
		return
	end
	if nMofa ~= 0 then
		Talk(1,"","Trang b� n�y �� kh�m linh th�ch, kh�ng th� ��c l�i.");
		return
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m n�y l� v�t ph�m kh�a, m� kh�a r�i ��i nh�!");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi ��c l�i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end			
	if Zgc_pub_goods_add_chk(1,230) ~= 1 then
		return
	end
	for i = 1,getn(tTiandiWp) do 
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
			nIndex = i;
			break
		end
	end
	if nIdx == 0 or nIndex == 0 then  --û�������������õĲ��������������
		Talk(1,"","Ng��i �ang mang kh�ng ph�i v� kh� Thi�n ��a Huy�n Ho�ng, h�y mang trang b� v� kh� Thi�n ��a Huy�n Ho�ng mu�n ��c l�i v�o ng��i!");
		return
	else
		if DelItem(2,1,1000,3) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local add_flag,add_idx = AddItem(tTiandiWp[nIndex][2],tTiandiWp[nIndex][3],tTiandiWp[nIndex][4],1,1,0,0,0,0,0,0,0,nQianghua,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				if nDing == 1 then
					SetItemSpecialAttr(add_idx,"DING7",1); --����
				end 
				Msg2Player("Ng��i �� ��c l�i 1 v� kh� Thi�n ��a Huy�n Ho�ng: "..tTiandiWp[nIndex][1]);
				WriteLog("�� t� th� r�n L�u-V� kh� Thi�n ��a Huy�n Ho�ng: Ng��i ch�i"..GetName().."��c l�i"..tTiandiWp[nIndex][1].."Th�nh c�ng.")
			else
				WriteLog("�� t� th� r�n L�u-V� kh� Thi�n ��a Huy�n Ho�ng: Ng��i ch�i"..GetName().."��c l�i"..tTiandiWp[nIndex][1].." th�t b�i.");
			end
		end
	end		
end

function about_tdxh()
		local strtab = {
			"Ta mu�n �i�u ch�nh v� kh� Thi�n ��a Huy�n Ho�ng/about_tiandiWp",
			"Ta mu�n thay ��i linh kh� c�a trang b� Thi�n ��a Huy�n Ho�ng/add_tiandi_lingqi",
			"Thanh ��ng ��nh ��i trang b� Thi�n ��a Huy�n Ho�ng/chang_yijiding",
			"Vi�m Ho�ng thi�t h�n ��i trang b� Thi�n ��a Huy�n Ho�ng/chang_yanhuangtiehun",
			"Ta ch� ��n xem th�/nothing"};
		Say("<color=green>�� t� th� r�n L�u<color>: S� ph� �ang s�u t�p Thanh ��ng ��nh c�p 1, n�n mang h�t trang b� Thi�n ��a Huy�n Ho�ng ra �� ��i. N�u ng��i c� Vi�m Ho�ng thi�t h�n, c�ng c� th� mang ��n ch� ta �� ��i trang b� Thi�n ��a Huy�n Ho�ng.",
			getn(strtab),
			strtab)		
end

function add_item_lingqi()
	local strtab = {
		"Ta mu�n d�ng V� Ng�n Th�y �� �i�u ch�nh linh kh� trang b�/add_lingqi_wz",
		"Ta ch� ��n xem th�/nothing"};
	Say("<color=green>�� t� th� r�n L�u<color>: Ta c� th� d�ng <color=yellow>1 V� Ng�n Thu�<color> �� <color=yellow>h� 1 �i�m linh kh�<color> c�a trang b�. <color=yellow>L�u �, ch� c� trang b� ch�a kh�m n�m Linh kh� m�i c� th� h� Linh kh�. <color><color=red>N�u l� trang b� Thi�n ��a Huy�n Ho�ng 119 Linh kh�, c� th� d�ng c�ch kh�c �� chuy�n th�nh 120 Linh kh�. Nh�ng trang b� Thi�n ��a Huy�n Ho�ng 118 Linh kh� kh�ng th� k�ch ho�t b� B�t Qu�i Thi�n ��a Huy�n Ho�ng.<color>",
		getn(strtab),
		strtab)
end

function add_lingqi_wz()
	local strtab = {
		"��u/#add_lingqi_ask(0)",
		"Ngo�i trang/#add_lingqi_ask(1)",
		"H� y/#add_lingqi_ask(3)",
		"V� kh�/#add_lingqi_ask(2)",
		"��i ta m�c trang b� l�n ��./nothing"};
	Say("Ng��i mu�n �i�u ch�nh linh kh� c�a trang b� n�o tr�n ng��i? Ch� �, ch� c� trang b� linh kh� ch�a kh�m m�i c� th� �i�u ch�nh.",
		getn(strtab),
		strtab)
end

function add_lingqi_ask(nWz)
	local tWz = {"��u","Ngo�i trang","V� kh�","H� y"};
	Say("Ng��i c� mu�n �i�u ch�nh linh kh� c�a trang b� <color=yellow>"..tWz[nWz+1].."<color> kh�ng?",
		3,
		"Ta mu�n �i�u ch�nh/#add_lingqi_confirm("..nWz..")",
		"Kh�ng, ta nh�m!/add_lingqi_wz",
		"��i ta m�c trang b� l�n ��./nothing");
end

function add_lingqi_confirm(nWz)
	if GetItemCount(2,1,503) < 1 then
		Talk(1,"","�i�u ch�nh linh kh� c�n 1 V� Ng�n Th�y, tr�n ng��i ng��i kh�ng c�.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --��ȡ��ǰװ���ȼ�
	local nBaseLv = GetEquipBaseLevel(nIndex); --��ȡװ�������ȼ�
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--��ȡ��һ��ħ������id �ȼ�
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����	
	local nRandSeed = GetItemRandSeed(nIndex);--�������
	
	if nIndex == 0 then 
		Talk(1,"","Ng��i kh�ng mang trang b� mu�n �i�u ch�nh linh kh� tr�n ng��i.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng��i �ang mang trang b� b�t qu�i �, sau khi ph�n m�nh r�i ��n �i�u ch�nh linh kh�.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","Ch� c� trang b� linh kh� ch�a kh�m m�i �i�u ch�nh ���c!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� c�a ng��i hi�n �ang � tr�ng th�i kh�a, h�y m� kh�a r�i ��n �i�u ch�nh.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi �i�u ch�nh linh kh� trang b� ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,503,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi-1,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --����
				end			  
				Talk(1,"","Ch�c m�ng ng��i �� �i�u ch�nh linh kh� trang b� th�nh c�ng.");
				WriteLog("�� t� th� r�n L�u-�i�u ch�nh linh kh�: Ng��i ch�i "..GetName().."�i�u ch�nh linh kh� trang b� th�nh c�ng, id v�t ph�m, linh kh�, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n: "..nId1..","..nId2..","..nId3..","..(nLingqi-1)..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("�� t� th� r�n L�u-�i�u ch�nh linh kh�: Ng��i ch�i "..GetName().."�i�u ch�nh linh kh� trang b� th�t b�i, v� tr� th�t b�i, id v�t ph�m, linh kh�, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n: "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end	
end

function quchu_bagua_lingshi()
	local strtab = {
		"D�ng 1 Tinh Luy�n B�ng Th�ch �� g� Linh th�ch trang b� B�t Qu�i t� 0-79 Linh kh�/#get_bagua_lingshi(1)",
		"D�ng 1 N� Oa Tinh Th�ch �� g� Linh th�ch trang b� B�t Qu�i t� 80-120/#get_bagua_lingshi(2)",
		"D�ng 100 b� t�n v�t trang b� s� m�n 4 �� g� Linh th�ch trang b� B�t Qu�i t� 80-120/#get_bagua_lingshi(3)",
		"D�ng 1 L�nh th�o g� mi�n ph� �� g� Linh th�ch trang b� B�t Qu�i t� 80-120/#get_bagua_lingshi(4)",
		"�� ta suy ngh� l�i/nothing"};
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i c� th� ��n ch� ta, d�a v�o Linh kh� trang b� B�t Qu�i c�a ng��i, d�ng <color=yellow>1 Tinh Luy�n B�ng Th�ch ho�c 1 N� Oa Tinh Th�ch<color>, ho�c <color=yellow>100<color> b� t�n v�t trang b� s� m�n 4 �� g� Linh th�ch. �� c��ng ho�, ��nh h�n v� ��ng c�p c�a trang b� s� ���c gi� l�i, k�ch ho�t trang b� Linh kh� t� 0-79, s� kh�ng quay v� v�ng Th�i H�, trang b� Linh kh� t� 80-120, s� quay v� v�ng Th�i H�. <color=red>L�c g� b� trang b� Thi�n Qu�i, s� quay v� Thi�n Qu�i th�ch, Linh th�ch v� trang b� kh�ng c� v� tr� qu� s� ���c gi� l�i �� c��ng ho�, ��nh h�n v� ��ng c�p, nh�ng kh�ng th� quay l�i B�t Qu�i B�i.<color>",
		getn(strtab),
		strtab)
end

function add_tiandi_lingqi()
	local strtab = {
		"Ta mu�n ��c trang b� Thi�n ��a Huy�n Ho�ng th�nh 120 linh kh�/add_tiandi_wz",
		"Ta ch� ��n xem th�/nothing"
	}
	Say("Ta c� th� gi�p ng��i ��c trang b� Thi�n ��a Huy�n Ho�ng th�nh 120 linh kh�, ng��i ch� c�n t�n <color=yellow>1 N� Oa tinh th�ch<color> � ch� ta th�i.",
		getn(strtab),
		strtab)
end

function add_tiandi_wz()
	local strtab = {
		"��u/#add_tiandi_ask(0)",
		"Ngo�i trang/#add_tiandi_ask(1)",
		"H� y/#add_tiandi_ask(3)",
		"V� kh�/#add_tiandi_ask(2)",
		"��i ta m�c trang b� l�n ��./nothing"};
	Say("Ng��i mu�n ��c linh kh� c�a trang b� Thi�n ��a Huy�n Ho�ng n�o tr�n ng��i? Ch� �, ch� c� trang b� Thi�n ��a Huy�n Ho�ng ch�a kh�m m�i ��c ���c.",
		getn(strtab),
		strtab)	
end

function add_tiandi_ask(nWz)
	local tWz = {"��u","Ngo�i trang","V� kh�","H� y"};
	Say("Ng��i mu�n ��c Thi�n ��a Huy�n Ho�ng <color=yellow>"..tWz[nWz+1].."<color> kh�ng?",
		3,
		"Ta mu�n �i�u ch�nh/#add_tiandi_confirm("..nWz..")",
		"Kh�ng, ta nh�m!/add_tiandi_wz",
		"��i ta m�c trang b� l�n ��./nothing");		
end

function add_tiandi_confirm(nWz)
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","�i�u ch�nh linh kh� trang b� Thi�n ��a Huy�n Ho�ng c�n 1 N� Oa tinh th�ch, tr�n ng��i ng��i kh�ng c�.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--��ȡ��һ��ħ������id �ȼ�
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����	
	local nRandSeed = GetItemRandSeed(nIndex);--�������
	local nBody = GetBody();
	
	if nIndex == 0 then 
		Talk(1,"","Ng��i kh�ng mang trang b� Thi�n ��a Huy�n Ho�ng mu�n �i�u ch�nh linh tr� tr�n ng��i.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng��i �ang mang trang b� b�t qu�i �, sau khi ph�n m�nh r�i ��n �i�u ch�nh linh kh�.");
		return
	end
	
	if nWz ~= 2 then		
		if nId1 ~= tTiandiZb[nWz+1][nBody][2] or nId2 ~= tTiandiZb[nWz+1][nBody][3] or nId3 ~= tTiandiZb[nWz+1][nBody][4] then
			Talk(1,"","Ng��i �ang mang kh�ng ph�i trang b� Thi�n ��a Huy�n Ho�ng.");
			return
		end
	else
		local nWpIdx = 0;
		for i = 1,getn(tTiandiWp) do 
			if nId1 == tTiandiWp[i][2] and nId2 == tTiandiWp[i][3] and nId3 == tTiandiWp[i][4] then
				nWpIdx = i;
				break
			end
		end
		if nWpIdx == 0 then
			Talk(1,"","Ng��i �ang mang kh�ng ph�i trang b� Thi�n ��a Huy�n Ho�ng.");
			return		
		end
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","Ch� c� trang b� Thi�n ��a Huy�n Ho�ng ch�a kh�m m�i c� th� �i�u ch�nh ���c!");
		return
	end
	if nLingqi == 120 then
		Talk(1,"","Trang b� Thi�n ��a Huy�n Ho�ng c�a ng��i �� l� 120 linh kh� r�i.");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� c�a ng��i hi�n �ang � tr�ng th�i kh�a, h�y m� kh�a r�i ��n �i�u ch�nh.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi �i�u ch�nh linh kh� trang b� ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	if DelItem(2,1,504,1) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,120,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				if nDing == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --����
				end			  
				Talk(1,"","Ch�c m�ng ng��i �� �i�u ch�nh linh kh� c�a trang b� Thi�n ��a Huy�n Ho�ng th�nh c�ng.");
				WriteLog("�� t� th� r�n L�u-Thi�n ��a Huy�n Ho�ng: Ng��i ch�i"..GetName().."�i�u ch�nh linh kh� trang b� Thi�n ��a Huy�n Ho�ng th�nh c�ng, id v�t ph�m, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n:"..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("�� t� th� r�n L�u-Thi�n ��a Huy�n Ho�ng: Ng��i ch�i"..GetName().."�i�u ch�nh linh kh� trang b� th�t b�i, v� tr� th�t b�i, id v�t ph�m, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n:"..add_flag..","..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end		
end

function item_uplevel()
	local strtab = {
		"Ta mu�n th�ng c�p trang b� B�t Qu�i Linh kh� 40-79 (ti�u hao 1 Tinh Luy�n B�ng Th�ch)/#item_uplevel_wz(1)",
		"Ta mu�n th�ng c�p trang b� B�t Qu�i Linh kh� 80-100 (ti�u hao 1 V� Ng�n Thu�)/#item_uplevel_wz(2)",
--		"��Ҫ��101-120�����İ���װ������һ��������һ��Ů派�ʯ��/#item_uplevel_wz(3)",
--		"��Ҫ�ѷǰ���װ������һ��������һ��Ů派�ʯ��/#item_uplevel_wz(4)",
		"Ta mu�n th�ng c�p trang b� ��n c�p 9 (ti�u hao 1 N� Oa Tinh Th�ch)/#item_uplevel_wz(5)",
		"Ta ch� ��n xem th�/nothing"
		}
	Say("<color=green>�� t� th� r�n L�u<color>: Hi�n nay ta nh�n th�ng c�p trang b� c� thu ph�, n�u c� nhu c�u c� ��n t�m ta, <color=red>l�u �, m�i trang b� ch� c� th� th�ng c�p 1 l�n<color>.",
		getn(strtab),
		strtab)
end

function item_uplevel_wz(nType)
	local tItem = {"1 Tinh Luy�n B�ng Th�ch","1 V� Ng�n Thu�","1 N� Oa Tinh Th�ch","1 N� Oa Tinh Th�ch","1 N� Oa Tinh Th�ch"}
	local strtab = {
		"��u/#confirm_item_uplevel("..nType..",0)",
		"Ngo�i trang/#confirm_item_uplevel("..nType..",1)",
		"H� y/#confirm_item_uplevel("..nType..",3)",
		"tr� l�i/item_uplevel"
		}
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n th�ng c�p trang b� n�y, c�n ph�i c� <color=yellow>"..tItem[nType].."<color>, ng��i mu�n th�ng c�p trang b� � v� tr� n�o?",
		getn(strtab),
		strtab)
end

function confirm_item_uplevel(nType,nWz)
	local tItem = {{"Tinh luy�n B�ng Th�ch",2,1,533,1,40,79},
								 {"V� Ng�n Th�y",2,1,503,1,80,100},
								 {"N� Oa Tinh Th�ch",2,1,504,1,101,120},
								 {"N� Oa Tinh Th�ch",2,1,504,1,0,0},
								 {"N� Oa Tinh Th�ch",2,1,504,1}};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n th�ng c�p trang b� n�y, c�n ph�i c� <color=yellow>"..tItem[nType][5].."c�i"..tItem[nType][1].."<color>, ng��i kh�ng �� �i�u ki�n.");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nZhuangbeiLv = GetEquipLevel(nIndex); --��ȡ��ǰװ���ȼ�
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nBaseLv = GetEquipBaseLevel(nIndex); --��ȡװ�������ȼ�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����	
	if nIndex == 0 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i ch�a m�c trang b� mu�n th�ng c�p l�n ng��i.");
		return
	end
	if nZhuangbeiLv > nBaseLv then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Trang b� n�y �� th�ng c�p r�i, kh�ng th� th�ng c�p th�m n�a.");
		return
	end
	if nZhuangbeiLv >= 9 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Trang b� �� ��t ��n c�p cao nh�t, kh�ng th� th�ng c�p th�m n�a.");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Trang b� �ang kho�, xin h�y m� kho� r�i ��n g�p ta sau.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: �� b�o v� an to�n cho t�i kho�n, xin h�y m� r��ng ch�a �� tr��c khi ��i trang b�, c�m �n!");
		return
	end	
	if nType ~= 5 then
		if nLingqi >= tItem[nType][6] and nLingqi <= tItem[nType][7] then	
			if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
				SetItemIncreaseLevel(nIndex,1);
				Talk(1,"","<color=green>�� t� th� r�n L�u<color>: B�n �� th�ng c�p trang b� th�nh c�ng.");
				WriteLog("[�� t� th� r�n L�u, th�ng c�p trang b�]: Ng��i ch�i "..GetName().." �� th�ng c�p trang b� th�nh c�ng, lo�i v� v� tr�: "..nType..", "..nWz);
			end
		else
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Lo�i trang b� b�n ch�n kh�ng ph� h�p, c� ph�i ch�n nh�m kh�ng?")
			return
		end
	else
		if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
			if nZhuangbeiLv < 9 then
				SetItemIncreaseLevel(nIndex,9-nBaseLv);
				Talk(1,"","<color=green>�� t� th� r�n L�u<color>: B�n �� th�ng c�p trang b� th�nh c�ng.");
				WriteLog("[�� t� th� r�n L�u, th�ng c�p trang b�]: Ng��i ch�i "..GetName().." �� th�ng c�p trang b� th�nh c�ng, lo�i v� v� tr�: "..nType..", "..nWz);
			end
		end 
	end
end

function about_bufeiyan()
	local strtab = {
		"Ta mu�n d�ng [V� kh� B� Phi Y�n] �� ��i 2 Linh th�ch c�p 7 ng�u nhi�n/#ask_bufeiyan(1)",
		"Ta mu�n d�ng [V� kh� B� Phi Y�n] �� ��i 5 Linh th�ch c�p 6 ng�u nhi�n/#ask_bufeiyan(2)",
		"Ta mu�n d�ng [Ng�c Th� D��c Bao] v� 500 v�ng �� ��i 1 Linh th�ch c�p 7/#ask_bufeiyan(3)",
		"Ta mu�n d�ng [Ng�c Th� D��c Bao] v� 500 v�ng �� ��i 3 Linh th�ch c�p 6/#ask_bufeiyan(4)",
		"Ta ch� ��n xem th�/nothing"}
	Say("<color=green>�� t� th� r�n L�u<color>: G�n ��y s� ph� mu�n th� n�ng c�p linh kh� c�a c�c v� kh� qu� hi�m, cho n�n ta �ang s�u t�p c�c trang b� Ho�ng Kim nh� B� Phi Y�n, Ng�c Th� D��c Bao. N�u ng��i c� th� ta c� th� d�ng Linh th�ch �� ��i v�i ng��i.",
		getn(strtab),
		strtab)
end

function ask_bufeiyan(nType)
	if nType == 1 then
		PutinItemBox("V� kh� B� Phi Y�n ��i Linh th�ch" ,1 , "Ng��i mu�n d�ng 1 <color=yellow>v� kh� B� Phi Y�n Ho�ng Kim<color> �� ��i <color=yellow>2 Linh th�ch c�p 7<color>, sau khi ��i Linh th�ch s� ���c ��t v�o T� Linh ��nh. X�c nh�n mu�n ��i?", THIS_FILE, 1617)
	elseif nType == 2 then
		PutinItemBox("V� kh� B� Phi Y�n ��i Linh th�ch" ,1 , "Ng��i mu�n d�ng 1 <color=yellow>v� kh� B� Phi Y�n Ho�ng Kim<color> �� ��i <color=yellow>5 Linh th�ch c�p 6<color>, sau khi ��i Linh th�ch s� ���c ��t v�o T� Linh ��nh. X�c nh�n mu�n ��i?", THIS_FILE, 1619)
	elseif nType == 3 then
		if GetCash() < 5000000 then
			Say("<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� �� 500 v�ng, kh�ng th� ��i.", 0)
			return
		end
		PutinItemBox("Ng�c Th� D��c Bao ��i Linh th�ch" ,1 , "Ng��i mu�n d�ng 1 <color=yellow>Ng�c Th� D��c Bao v� 500 v�ng<color> �� ��i <color=yellow>1 Linh th�ch c�p 7<color>, sau khi ��i Linh th�ch s� ���c ��t v�o T� Linh ��nh. X�c nh�n mu�n ��i?", THIS_FILE, 1621)
	elseif nType == 4 then
		if GetCash() < 5000000 then
			Say("<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� �� 500 v�ng, kh�ng th� ��i.", 0)
			return
		end
		PutinItemBox("Ng�c Th� D��c Bao ��i Linh th�ch" ,1 , "Ng��i mu�n d�ng 1 <color=yellow>Ng�c Th� D��c Bao v� 500 v�ng<color> �� ��i <color=yellow>3 Linh th�ch c�p 6<color>, sau khi ��i Linh th�ch s� ���c ��t v�o T� Linh ��nh. X�c nh�n mu�n ��i?", THIS_FILE, 1623)
	else
		return
	end
	
	if GetTask(805) == 2 then
		OpenBox()
	end
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tItem =
	{
		["Ph� Y�n �ao"] = {0,3,6001,},
		["Ph� Y�n c�n"] = {0,5,6002,},
		["Ph� Y�n tr��ng"] = {0,8,6003,},
		["H�m Y�n th�"] = {0,0,6004,},
		["T�ng Y�n ch�m"] = {0,1,6005,},
		["Phi Y�n ki�m"] = {0,2,6006,},
		["V�n Y�n c�m"] = {0,10,6007,},
		["V�n Y�n th�"] = {0,0,6008,},
		["L�u Y�n c�n"] = {0,5,6009,},
		["Huy�n Y�n ki�m"] = {0,2,6010,},
		["V� Y�n b�t"] = {0,9,6011,},
		["H� Ti�m Th��ng"] = {0,6,6012,},
		["H�nh Y�n Cung"] = {0,4,6013,},
		["Tr�c Y�n nh�n"] = {0,7,6014,},
		["Y�u Y�n tr�o"] = {0,11,6015,},
	}
	
	-- �����Ĳ��ý�
	if GetItemSpecialAttr(idx, "LOCK") > 0 then
		Say("<color=green>�� t� th� r�n L�u<color>: ��y l� v�t qu� gi�, thi�u hi�p �� kho� l�i, kh�ng th� ��i ���c. N�u mu�n ��i xin h�y m� kho� r�i ��n g�p ta.", 0)
		return 0
	end

	local allow_item = 0
	if param == 1617 or param == 1619 then
		for i, v in tItem do
			if v[1] == genre and v[2] == detail and v[3] == particular then
				allow_item = 1
				break
			end
		end
		
		if allow_item == 1 then
			return 1
		else
			Say("<color=green>�� t� th� r�n L�u<color>: ��y kh�ng ph�i l� v�t ta c�n.", 0)
			return 0
		end
	elseif param == 1621 or param == 1623 then
		if GetCash() < 5000000 then
			Say("<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� �� 500 v�ng, kh�ng th� ��i.", 0)
			return 0
		end
		
		if genre == 0 and detail == 102 and particular == 41 then
			return 1
		else
			Say("<color=green>�� t� th� r�n L�u<color>: ��y kh�ng ph�i l� v�t ta c�n.", 0)
			return 0
		end
	end
	return 0
end


function OnPutinComplete(param)
	if param ~= 1617 and param ~= 1619 and param ~= 1621 and param ~= 1623 then		-- �Ƿ��ص�
		return
	end
	
	if (param == 1621 or param == 1623) and Pay(5000000) ~= 1 then
		Say("<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� �� 500 v�ng, kh�ng th� ��i.", 0)
		return
	end

	local t = GetPutinItem()
	if getn(t) > 1 then		-- ������
		return
	end
	local ItemName = t[1][5]

	if DelItemByIndex(t[1][1], -1) == 1 then
		if param == 1617 then
			lspf_AddLingShiInBottle(7,2);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 2 Linh th�ch c�p 7, Linh th�ch �� ���c ��t v�o T� Linh ��nh.");
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i �� d�ng trang b� ��i Linh th�ch th�nh c�ng!");
			WriteLog("[�� t� th� r�n L�u B� Phi Y�n]: Name="..GetName().." Result=Success Event=UseBFY(7,2) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1619 then
			lspf_AddLingShiInBottle(6,5);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 5 Linh th�ch c�p 6, Linh th�ch �� ���c ��t v�o T� Linh ��nh.");
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i �� d�ng trang b� ��i Linh th�ch th�nh c�ng!");
			WriteLog("[�� t� th� r�n L�u B� Phi Y�n]: Name="..GetName().." Result=Success Event=UseBFY(6,5) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1621 then
			lspf_AddLingShiInBottle(7,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 7, Linh th�ch �� ���c ��t v�o T� Linh ��nh.");
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i �� d�ng trang b� ��i Linh th�ch th�nh c�ng!");
			WriteLog("[�� t� th� r�n L�u B� Phi Y�n]: Name="..GetName().." Result=Success Event=UseYLT(7,1) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		elseif param == 1623 then
			lspf_AddLingShiInBottle(6,3);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 3 Linh th�ch c�p 6, Linh th�ch �� ���c ��t v�o T� Linh ��nh.");
			Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i �� d�ng trang b� ��i Linh th�ch th�nh c�ng!");
			WriteLog("[�� t� th� r�n L�u B� Phi Y�n]: Name="..GetName().." Result=Success Event=UseYLT(6,3) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		else
			WriteLog("[�� t� th� r�n L�u B� Phi Y�n]: Name="..GetName().." Result=fail Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		end
	else
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� <color=yellow>"..ItemName.."<color>!")
		if param == 1621 or param == 1623 then
			Earn(5000000)	-- �ѿ۳���Ǯ������
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� Thanh ��ng ��nh c�p 1.");	
	else
		Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n ��i trang b� n�o?",
			5,
			"Thi�n ��a Huy�n Ho�ng Kh�i/#choose_tiandi_lingqi(1,0)",
			"Thi�n ��a Huy�n Ho�ng Gi�p /#choose_tiandi_lingqi(2,0)",
			"Gi�y Thi�n ��a Huy�n Ho�ng/#choose_tiandi_lingqi(3,0)",
			"V� kh� Thi�n ��a Huy�n Ho�ng/choose_tiandi_weapon",
			"T�m th�i kh�ng ��i. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n ��i v� kh� n�o?",
			3,
			"Thi�n ��a Huy�n Ho�ng Dao/#choose_tiandi_lingqi(4,1)",
			"Thi�n ��a Huy�n Ho�ng C�n/#choose_tiandi_lingqi(4,2)",
			"T�m th�i kh�ng ��i. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("<color=green>�� t� th� r�n L�u<color>: H�y ch�n �i�m linh kh� c�a trang b� n�y.",
		3,
		"119 linh kh� [C�n Kh�m Ch�n C�n]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh�n �o�i Ly T�n]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T�m th�i kh�ng ��i. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi�n ��a Huy�n Ho�ng Kh�i","Thi�n ��a Huy�n Ho�ng Gi�p ","Gi�y Thi�n ��a Huy�n Ho�ng","V� kh� Thi�n ��a Huy�n Ho�ng"};
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n d�ng Thanh ��ng ��nh c�p 1 ��i linh kh� <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu�n ��i./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh�ng, ta nh�m!/chang_yijiding",
		"T�m th�i kh�ng ��i. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� Thanh ��ng ��nh c�p 1.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Thanh ��ng ��nh c�p 1 ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Thanh ��ng ��nh c�p 1 ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Thanh ��ng ��nh c�p 1 ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
			end	
		end
	end				
end

function chang_yanhuangtiehun()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� Vi�m Ho�ng Thi�t H�n.");	
	else
		Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n ��i trang b� n�o?",
			5,
			"Thi�n ��a Huy�n Ho�ng Kh�i/#yanhuang_tiandi_lingqi(1,0)",
			"Thi�n ��a Huy�n Ho�ng Gi�p /#yanhuang_tiandi_lingqi(2,0)",
			"Gi�y Thi�n ��a Huy�n Ho�ng/#yanhuang_tiandi_lingqi(3,0)",
			"V� kh� Thi�n ��a Huy�n Ho�ng/yanhuang_tiandi_weapon",
			"T�m th�i kh�ng ��i. /nothing")
	end
end

function yanhuang_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n ��i v� kh� n�o?",
			3,
			"Thi�n ��a Huy�n Ho�ng Dao/#yanhuang_tiandi_lingqi(4,1)",
			"Thi�n ��a Huy�n Ho�ng C�n/#yanhuang_tiandi_lingqi(4,2)",
			"T�m th�i kh�ng ��i. /nothing")
	else
		yanhuang_tiandi_lingqi(4,0);
	end
end

function yanhuang_tiandi_lingqi(nType,nWp)
	Say("<color=green>�� t� th� r�n L�u<color>: H�y ch�n �i�m linh kh� c�a trang b� n�y.",
		3,
		"119 linh kh� [C�n Kh�m Ch�n C�n]/#ask_yanhuang_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh�n �o�i Ly T�n]/#ask_yanhuang_duihuan("..nType..","..nWp..",120)",
		"T�m th�i kh�ng ��i. /nothing")
end

function ask_yanhuang_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi�n ��a Huy�n Ho�ng Kh�i","Thi�n ��a Huy�n Ho�ng Gi�p ","Gi�y Thi�n ��a Huy�n Ho�ng","V� kh� Thi�n ��a Huy�n Ho�ng"};
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n d�ng Vi�m Ho�ng Thi�t H�n ��i �i�m linh kh� <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu�n ��i./#confirm_change_yanhuang("..nType..","..nWp..","..nLingqi..")",
		"Kh�ng, ta nh�m!/chang_yanhuang",
		"T�m th�i kh�ng ��i. /nothing"
		)
end

function confirm_change_yanhuang(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� Vi�m Ho�ng Thi�t H�n.");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,1146,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�t b�i, v� tr� th�t b�i: "..add_flag);
				end
			end
		else
			if DelItem(2,1,1146,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�t b�i, v� tr� th�t b�i: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,1146,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ch�c m�ng ng��i d�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
			else
				WriteLog("[�� t� th� r�n L�u Thi�n ��a Huy�n Ho�ng]: Ng��i ch�i "..GetName().."D�ng Vi�m Ho�ng Thi�t H�n ��i th�t b�i, v� tr� th�t b�i: "..add_flag);
			end	
		end
	end				
end

function get_bagua_lingshi_mianfei()
	Say("Ng��i mu�n l�y linh kh� c�a trang b� n�o tr�n ng��i?",
		5,
		"��u/#ask_quchu_lingshi_mianfei(0)",
		"Ngo�i trang/#ask_quchu_lingshi_mianfei(1)",
		"H� y/#ask_quchu_lingshi_mianfei(3)",
		"V� kh�/#ask_quchu_lingshi_mianfei(2)",
		"��i ta m�c trang b� l�n ��./nothing")	
end

function ask_quchu_lingshi_mianfei(nWz)
	local tChouqu = {"��u","Ngo�i trang","V� kh�","H� y"}
	Say("Ng��i mu�n l�y �� tr�n <color=yellow>"..tChouqu[nWz+1].."<color> �?",
		3,
		"���c/#confirm_quchu_lingshi_mianfei("..nWz..")",
		"Ta ch�n nh�m r�i./get_bagua_lingshi_mianfei",
		"��i ta m�c trang b� l�n ��./nothing")
end

function confirm_quchu_lingshi_mianfei(nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --��ȡװ��id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --��ȡ��ǰװ���ȼ�
	local nBaseLv = GetEquipBaseLevel(nIndex); --��ȡװ�������ȼ�
	local nLingqi = GetItemMaxLingQi(nIndex);   --��ȡ����ֵ
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--��ȡ��һ��ħ������id �ȼ�
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--��ȡ�ڶ���ħ������id �ȼ�
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--��ȡ������ħ������id �ȼ�
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nGuawei = GetEquipBaGua(nIndex); --��ȡ��λ
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--�Ƿ��Ѿ�����
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����	
	local nRandSeed = GetItemRandSeed(nIndex);--�������
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --����һ���������
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --���Զ����������
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --���������������
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --����һ��������2Ϊ������������1Ϊ����ż����
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --���Զ���������2Ϊ����1Ϊ��
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --��������������2Ϊ����1Ϊ��
	
	if nIndex == 0 then 
		Talk(1,"","Ng��i kh�ng c� mang trang b� mu�n l�y linh kh� ra tr�n ng��i.");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","Ng��i �ang mang trang b� b�t qu�i �, sau khi ph�n m�nh ��n nh�n linh th�ch.");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","Trang b� n�y c�a ng��i kh�ng c� kh�m �� l�m sao l�y ���c!");
		return
	end
	if nLock == 1 then
		Talk(1,"","Trang b� tr�n ng��i ng��i �� kh�a, c�n m� kh�a m�i c� th� th�ng c�p.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi l�y linh th�ch ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end	
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --����
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --���ض�Ӧ��ż����
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --���ض�Ӧ��ż����
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --���ض�Ӧ��ż����
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nJihuo ~= 0 and nLingqi >= 80 then   --�Ѿ�����
				if nGuawei ~= 0 and nGuawei ~= 5 then
					AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
				end
			end				  
			Talk(1,"","Ch�c m�ng ng��i �� l�y linh th�ch th�nh c�ng.");
			WriteLog("�� t� th� r�n L�u l�y linh th�ch: Ng��i ch�i"..GetName().."Th�nh c�ng khi l�y linh th�ch t�ng trang b�, id v�t ph�m, linh kh�, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n, linh th�ch thu�c t�nh 1, ��ng c�p, thu�c t�nh 2, ��ng c�p, thu�c t�nh 3, ��ng c�p:"..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		else
			WriteLog("�� t� th� r�n L�u l�y linh th�ch: Ng��i ch�i"..GetName().."Th�t b�i khi l�y linh th�ch t�ng trang b�, v� tr� th�t b�i, id v�t ph�m, linh kh�, c��ng h�a, ��nh h�n, h�t gi�ng ng�u nhi�n, linh th�ch thu�c t�nh 1, ��ng c�p, thu�c t�nh 2, ��ng c�p, thu�c t�nh 3, ��ng c�p:"..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		end		
	end			
end

function box_change_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("<color=green>�� t� th� r�n L�u<color>: D�ng 15 R��ng v�ng Th�nh Th� ��i 1 v� kh� Ho�ng �� <color=yellow>c�a l�u ph�i<color> t��ng �ng. Ng��i c� mu�n ��i kh�ng?",
			3,
			"Ph�i, ta mu�n ��i Hi�n Vi�n To�i V� �ao/#confirm_box_change_weapon(1)",
			"Ph�i, ta mu�n ��i Hi�n Vi�n To�i V� C�n/#confirm_box_change_weapon(2)",
			"Ch� xem th�!/nothing")		
	else
		Say("<color=green>�� t� th� r�n L�u<color>: D�ng 15 R��ng v�ng Th�nh Th� ��i 1 v� kh� Ho�ng �� <color=yellow>c�a l�u ph�i<color> t��ng �ng. Ng��i c� mu�n ��i kh�ng?",
			2,
			"�, ta mu�n ��i./#confirm_box_change_weapon(0)",
			"Ch� xem th�!/nothing")
	end
end

function confirm_box_change_weapon(nType)
	if GetItemCount(2,0,1028) < 15 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� 15 R��ng v�ng Th�nh Th�.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi l�y linh th�ch ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --�ռ为�ؼ��
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: H�y v�o m�n ph�i r�i h�y ��i.");
		return
	end
	if DelItem(2,0,1028,15) == 1 then
		local nRand = random(1,getn(tHuangDiWeapon[nRoute]));
		if nRoute == 2 then
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch�c m�ng ng��i nh�n ���c 1  "..tHuangDiWeapon[nRoute][nType][1]);
				WriteLog("[R��ng v�ng Th�nh Th� ��i v� kh� Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 15 R��ng v�ng Th�nh Th� ��i 1 "..tHuangDiWeapon[nRoute][nType][1]);
			else
				WriteLog("[R��ng v�ng Th�nh Th� ��i v� kh� Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 15 R��ng v�ng Th�nh Th� ��i 1 "..tHuangDiWeapon[nRoute][nType][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end		
		else
			local nAddFlag = AddItem(tHuangDiWeapon[nRoute][nRand][2],tHuangDiWeapon[nRoute][nRand][3],tHuangDiWeapon[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch�c m�ng ng��i nh�n ���c 1  "..tHuangDiWeapon[nRoute][nRand][1]);
				WriteLog("[R��ng v�ng Th�nh Th� ��i v� kh� Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 15 R��ng v�ng Th�nh Th� ��i 1 "..tHuangDiWeapon[nRoute][nRand][1]);
			else
				WriteLog("[R��ng v�ng Th�nh Th� ��i v� kh� Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 15 R��ng v�ng Th�nh Th� ��i 1 "..tHuangDiWeapon[nRoute][nRand][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end		
		end
	else
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� 15 R��ng v�ng Th�nh Th�.");
	end
end

function jinbox_huan_ring()
	Say("<color=green>�� t� th� r�n L�u<color>: D�ng 4 R��ng v�ng Th�nh Th� ��i trang s�c Ho�ng �� <color=yellow> c�a l�u ph�i<color> t��ng �ng, ng��i mu�n ��i trang s�c Ho�ng �� n�o?",
		3,
		"Ta mu�n ��i Hi�n Vi�n Chi�n/#choose_xuanyuan(1)",
		"Ta mu�n ��i Hi�n Vi�n ��u/#choose_xuanyuan(2)",
		"Kh�ng c� g�!/nothing")
end

function choose_xuanyuan(nType)
	local tRing = {"Hi�n Vi�n Chi�n","Hi�n Vi�n ��u"};
	Say("<color=green>�� t� th� r�n L�u<color>: D�ng 4 R��ng v�ng Th�nh Th� ��i 1 <color=yellow>"..tRing[nType].."<color> ch�?",
		2,
		"�, ta mu�n ��i./#confirm_jinbox_xuanyuan("..nType..")",
		"Ta ch�n nh�m r�i./jinbox_huan_ring")
end

function confirm_jinbox_xuanyuan(nType)
	if GetItemCount(2,0,1028) < 4 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� 4 R��ng v�ng Th�nh Th�.");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","�� b�o ��m t�i s�n an to�n, tr��c khi l�y linh th�ch ng��i h�y m� kh�a r��ng ch�a �� tr��c!");
		return
	end		
	if Zgc_pub_goods_add_chk(1,50) ~= 1 then   --�ռ为�ؼ��
		return
	end		
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: H�y v�o m�n ph�i r�i h�y ��i.");
		return
	end
	if DelItem(2,0,1028,4) == 1 then
		if nType == 1 then
			local nRand = random(1,getn(tXuanyuanZhan[nRoute]));
			local nAddFlag = AddItem(tXuanyuanZhan[nRoute][nRand][2],tXuanyuanZhan[nRoute][nRand][3],tXuanyuanZhan[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch�c m�ng ng��i nh�n ���c 1 "..tXuanyuanZhan[nRoute][nRand][1]);
				WriteLog("[R��ng v�ng Th�nh Th� ��i trang s�c Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 4 R��ng v�ng Th�nh Th� ��i 1 "..tXuanyuanZhan[nRoute][nRand][1]);
			else
				WriteLog("[R��ng v�ng Th�nh Th� ��i trang s�c Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 4 R��ng v�ng Th�nh Th� ��i 1"..tXuanyuanZhan[nRoute][nRand][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end		
		elseif nType == 2 then
			local nRand = random(1,getn(tXuanyuanDou[nRoute]));
			local nAddFlag = AddItem(tXuanyuanDou[nRoute][nRand][2],tXuanyuanDou[nRoute][nRand][3],tXuanyuanDou[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("Ch�c m�ng ng��i nh�n ���c 1 "..tXuanyuanDou[nRoute][nRand][1]);
				WriteLog("[R��ng v�ng Th�nh Th� ��i trang s�c Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 4 R��ng v�ng Th�nh Th� ��i 1 "..tXuanyuanDou[nRoute][nRand][1]);
			else
				WriteLog("[R��ng v�ng Th�nh Th� ��i trang s�c Ho�ng ��]: Ng��i ch�i "..GetName().."D�ng 4 R��ng v�ng Th�nh Th� ��i 1"..tXuanyuanDou[nRoute][nRand][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end			
		end
	else
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Ng��i kh�ng c� 4 R��ng v�ng Th�nh Th�.");
	end		

end

function is_xuanhuang_wuqi(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandi[4] do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	return 0
end

function is_xuanhuang_zhuangbei(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandiZb do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	
	return 0
end

function about_hhry()
	local strtab = {
		"Huy Ho�ng Chi Th�y, Vinh D� Chi Th�y th�ng c�p th�nh Huy Ho�ng Chi K�, Vinh D� Chi K� (400 Thi�n Th�ch Tinh Th�ch)/#uplevel_hhry(1)",
		"Huy Ho�ng Chi K�, Vinh D� Chi K� th�ng c�p th�nh Huy Ho�ng Qu�t Kh�i, Vinh D� Qu�t Kh�i (400 Thi�n Th�ch Tinh Th�ch)/#uplevel_hhry(2)",
		"Huy Ho�ng Qu�t Kh�i, Vinh D� Qu�t Kh�i th�ng c�p th�nh Huy Ho�ng, Vinh D� (1000 Thi�n Th�ch Tinh Th�ch1000)/#uplevel_hhry(3)",
		"Xem c�c thu�c t�nh c�p c�a huy ho�ng, vinh d� (kh�ng th� mua)/ring_Sale",
		"Kh�ng c� g�!/nothing"
		}
	Say("<color=green>�� t� th� r�n L�u<color>: Huy ho�ng, vinh d� t�ng c�ng c� 4 c�p, ng��i c� th� xem c�c thu�c t�nh c�p c�a huy ho�ng, vinh d� b�n d��i, n�u mu�n th�ng c�p t�m hi�u n�i dung �i!",
		getn(strtab),
		strtab)
end

function ring_Sale()
	Sale(100,100,1);
end 

function uplevel_hhry(nType)
	Say("<color=green>�� t� th� r�n L�u<color>: Ng��i mu�n l�y <color=yellow>"..tHuihuang[nType][1].." v�"..tRongyao[nType][1].."<color> th�ng c�p th�nh <color=yellow>"..tHuihuang[nType+1][1].." v�"..tRongyao[nType+1][1].."<color> kh�ng? C�n thu th�p <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].." <color>. <color=yellow>Ch� �, mang 2 trang s�c mu�n th�ng c�p l�n ng��i. <color>",
		3,
		"���c, ta mu�n th�ng c�p /#confirm_uplevel_hhry("..nType..")",
		"Xem c�c thu�c t�nh c�p c�a huy ho�ng, vinh d� (kh�ng th� mua)/ring_Sale",
		"��i ch�t, ta mang trang s�c l�n ng��i tr��c/nothing")
end

function confirm_uplevel_hhry(nType)
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	local nIdx1 = GetPlayerEquipIndex(4); --��һ����������
	local nIdx2 = GetPlayerEquipIndex(5); --�ڶ�����������
	
	if nIdx1 == 0 or nIdx2 == 0 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: L�y trang s�c Huy Ho�ng ng��i mu�n ��i c�i l�n v� tr� trang s�c th� nh�t, trang s�c vinh d� c�i l�n v� tr� trang s�c th� hai!")
		return
	end
	if GetItemSpecialAttr(nIdx1,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m ng��i ��t � v� tr� trang s�c ��u ti�n tr�n ng��i l� v�t ph�m kh�a, m� kh�a r�i ��i!");
		return
	end
	if GetItemSpecialAttr(nIdx2,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m ng��i ��t � v� tr� trang s�c th� hai tr�n ng��i l� v�t ph�m kh�a, m� kh�a r�i ��i!");
		return
	end		
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: �� b�o ��m c�a c�i an to�n, tr��c khi th�ng c�p trang b� h�y m� kh�a r��ng tr��c, �a t�!");
		return
	end	
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	if nId1 ~= tHuihuang[nType][2] or nId2 ~= tHuihuang[nType][3] or nId3 ~= tHuihuang[nType][4] then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: L�y trang s�c Huy Ho�ng mu�n th�ng c�p c�i l�n v� tr� trang s�c th� nh�t, trang s�c vinh d� mu�n th�ng c�p c�i l�n v� tr� trang s�c th� hai.");
		return
	end
	local nId4,nId5,nId6 = GetPlayerEquipInfo(5);
	if nId4 ~= tRongyao[nType][2] or nId5 ~= tRongyao[nType][3] or nId6 ~= tRongyao[nType][4] then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: L�y trang s�c Huy Ho�ng mu�n th�ng c�p c�i l�n v� tr� trang s�c th� nh�t, trang s�c vinh d� mu�n th�ng c�p c�i l�n v� tr� trang s�c th� hai.");
		return
	end
	if GetItemCount(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4]) < tUplevel[nType][5] then
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Th�ng c�p c�n thu th�p <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ng��i kh�ng c� ��.");
		return
	end
	if DelItem(tUplevel[nType][2],tUplevel[nType][3],tUplevel[nType][4],tUplevel[nType][5]) == 1 then
		if DelItemByIndex(nIdx1,-1) == 1 and DelItemByIndex(nIdx2,-1) == 1 then
			local nAddFlag = AddItem(tHuihuang[nType+1][2],tHuihuang[nType+1][3],tHuihuang[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B�n ��t th�nh c�ng "..tHuihuang[nType][1].."T�ng c�p th�nh "..tHuihuang[nType+1][1]);
				Msg2Global("Qua t�i luy�n,"..GetName().." th�nh c�ng m� ti�m n�ng c�a "..tHuihuang[nType][1]..", h�a th�nh "..tHuihuang[nType+1][1].."!");
				WriteLog("[Huy ho�ng vinh d�]: Ng��i ch�i "..GetName().." th�nh c�ng �em "..tHuihuang[nType][1].."T�ng c�p th�nh "..tHuihuang[nType+1][1]);
			else
				WriteLog("[Huy ho�ng vinh d�]: Ng��i ch�i "..GetName().." �em "..tHuihuang[nType][1].."T�ng c�p th�nh "..tHuihuang[nType+1][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end
			nAddFlag = AddItem(tRongyao[nType+1][2],tRongyao[nType+1][3],tRongyao[nType+1][4],1,1,-1,-1,-1,-1,-1,-1);
			if nAddFlag == 1 then
				Msg2Player("B�n ��t th�nh c�ng "..tRongyao[nType][1].."T�ng c�p th�nh "..tRongyao[nType+1][1]);
				Msg2Global("Qua t�i luy�n,"..GetName().." th�nh c�ng m� ti�m n�ng c�a "..tRongyao[nType][1]..", h�a th�nh "..tRongyao[nType+1][1].."!");
				WriteLog("[Huy ho�ng vinh d�]: Ng��i ch�i "..GetName().." th�nh c�ng �em "..tRongyao[nType][1].."T�ng c�p th�nh "..tRongyao[nType+1][1]);
			else
				WriteLog("[Huy ho�ng vinh d�]: Ng��i ch�i "..GetName().." �em "..tRongyao[nType][1].."T�ng c�p th�nh "..tRongyao[nType+1][1].." th�t b�i, k� hi�u:"..nAddFlag);
			end
		else
			WriteLog("[Huy ho�ng vinh d�]: Ng��i ch�i "..GetName().."T�ng"..tHuihuang[nType][1]..", kh�u tr� trang s�c th�t b�i.");
		end		
	else
		Talk(1,"","<color=green>�� t� th� r�n L�u<color>: Th�ng c�p c�n thu th�p <color=yellow>"..tUplevel[nType][1]..tUplevel[nType][5].."<color> , ng��i kh�ng c� ��.");
	end
end