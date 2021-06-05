--file name:hand_in_hand_head.lua
--author:yanjun(yim)
--create date:2006-7-7
--describe:Я�����籭�ͷ�ļ�
TRIGGER_ID = 3119	--�������Զ���ID
TIME_TRIGGER_ID = 2	--ʱ�䴥���������ID

TASK_TEAMINDEX = 1687	--��¼ѡ��Ķ��������
TASK_GOTCARD_TIME = 1688	--��¼����ϴεõ���Ƭ��ʱ��
TASK_GOT4TEAM_AWARD = 1689	--��¼��ȡ4ǿ���鿨Ƭ��������
TASK_GOTALLTEAM_AWARD = 1690	--��¼��ȡ�׿���������
TASK_GOTRING_AWARD = 1691	--��¼��ȡ�����������Ĵ���
TASK_GOTCARD_COUNT = 1692	--��¼��ÿ�Ƭ������
TASK_GOTCARD_DATE = 1693	--��¼��ÿ�Ƭ������
TASK_GOTAWARD_TIME = 1694	--��¼����ϴλ�ȡ������ʱ��
TASK_GOTCHINA_CARD = 1695	--��¼��ҵõ��й���֮���Ĵ���
TASK_GOTPET_TIME = 1696	--��¼��ҳ��ﵮ��ʱ��
TASK_GOTGROUP_AWARD = 1697	--��¼��һ�ȡС�鿨�Ľ����Ĵ��� 

WAIT_TIME = 60*60;	--�������ʱ��,1Сʱ
GET_AWARD_INTERVAL = 60*60;	--��ȡ�������ʱ��
CARD_COUNT_LIMIT = 6;	--ÿ���ÿ�Ƭ����������

tTeamName = {
		[1] = "��c",	
		[2] = "Costa Rica",
		[3] = "Ba Lan",
		[4] = "Ecuador",
		[5] = "Anh",
		[6] = "Paraguay",
		[7] = "Trinidad v� Tobago",
		[8] = "Th�y �i�n",
		[9] = "�chentina",
		[10] = "B� Bi�n Ng�",
		[11] = "Nam T�",
		[12] = "H� Lan",
		[13] = "B� ��o Nha",
		[14] = "Iran",
		[15] = "Angola",
		[16] = "M� Hi C�",
		[17] = "�",
		[18] = "Ghana",
		[19] = "M�",
		[20] = "Ti�p Kh�c",
		[21] = "Brazil",
		[22] = "Croatia",
		[23] = "�c",
		[24] = "Nh�t B�n",
		[25] = "Ph�p",
		[26] = "Th�y S�",
		[27] = "H�n Qu�c",
		[28] = "Togo",
		[29] = "Ukraina",
		[30] = "T�y Ban Nha",
		[31] = "Tunisia",
		[32] = "� R�p X� �t",
		}
	
tItemCard = {	--���֣����1,���2,���3,����
		[1] = {"th� ��c ",2,0,410,300},
		[2] = {"th� Costa Rica ",2,0,411,600},
		[3] = {"Ba Lan card ",2,0,412,900},
		[4] = {"Ecuador card ",2,0,413,1200},
		[5] = {"th� Anh ",2,0,414,1500},
		[6] = {"th� Paraguay ",2,0,415,1800},
		[7] = {"th� Trinidad v� Tobago ",2,0,416,2100},
		[8] = {"th� Th�y �i�n ",2,0,417,2400},
		[9] = {"th� �chentina ",2,0,418,2700},
		[10] = {"th� B� Bi�n Ng� ",2,0,419,3000},
		[11] = {"th� Nam T� ",2,0,420,3300},
		[12] = {"th� H� Lan ",2,0,421,3600},
		[13] = {"th� B� ��o Nha ",2,0,422,3900},
		[14] = {"th� Iran ",2,0,423,4200},
		[15] = {"th� Angola ",2,0,424,4500},
		[16] = {"th� M� Hi C� ",2,0,425,5400},
		[17] = {"th� � ",2,0,426,4800},
		[18] = {"th� Ghana ",2,0,427,5100},
		[19] = {"th� M� ",2,0,428,5700},
		[20] = {"th� Ti�p Kh�c ",2,0,429,6000},
		[21] = {"th� Brazil ",2,0,430,6300},
		[22] = {"th� Croatia ",2,0,431,6600},
		[23] = {"th� �c ",2,0,432,6900},
		[24] = {"th� Nh�t B�n ",2,0,433,7200},
		[25] = {"th� Ph�p ",2,0,434,7500},
		[26] = {"th� Th�y S� ",2,0,435,7800},
		[27] = {"th� H�n Qu�c ",2,0,436,8100},
		[28] = {"th� Togo ",2,0,437,8400},
		[29] = {"th� Ukraina ",2,0,438,8700},
		[30] = {"th� T�y Ban Nha ",2,0,439,9000},
		[31] = {"th� Tunisia ",2,0,440,9300},
		[32] = {"th� � R�p ",2,0,441,9600},
		[33] = {"th� l�u ni�m c�p th� gi�i VLTK2",2,0,443,9995},
		[34] = {"th� Trung Qu�c",2,0,442,10000},
		}

tItemOther = {
		present_bag = {"L� bao k� ni�m c�p th� gi�i",2,1,499},
		ring = {"��i L�c Th�n H�ng Li�n",0,102,28},
		monster_card = {"Ti�u Ni�n Th� Th�n Ph�",2,1,498},
		transformer_card = {"B�ch Bi�n Ti�u Th�n Th�ng",2,1,497},
		intro_book = {"H��ng d�n ho�t ��ng c�p th� gi�i",2,0,409},
		}

function Is_HandInHand_Open()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060714 and nDate <= 060723 then
		return 1;	--��ڼ�
	elseif nDate >= 060714 and nDate <= 060806 then
		return 2;	--����������������콱
	else
		return 0;
	end;
end;

function nothing()

end;
