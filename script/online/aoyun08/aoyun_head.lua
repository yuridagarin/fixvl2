--ʥ�𴫵ݻͷ�ļ�
--by vivi
--2008/05/28

--�������
--TASK_AOYUN_HUOJUSHOU = 905;  --������ʸ񣬴���������ݻʱ��
TASK_AOYUN_HUOJU_DATE = 906; --�Ƿ���ȡ���ճ��ʱ�������������ʥ��̨����������
TASK_AOYUN_TEMP_NUM = 907;  --�ճ���У���¼��ǰ�����ĸ�ʥ��̨
TASK_AOYUN_HUOJU_NUM = 908; --����ֵ������ţ�����Ҫ�����ĸ�ʥ��̨
TASK_AOYUN_ZHUWEI_NUM = 909; --�����ߵ������š�1-31��31��ʾʢ�����̨��
TASK_AOYUN_GET_SHENGHUO = 910; --������Ƿ���ȡ��ʥ�𣬴���ʱ��GetTime
TASK_AOYUN_DIAN_SHENGHUO = 911; --�Ƿ����ʥ��
TASK_AOYUN_ZHUWEI_LABA = 912;  --�Ƿ���ȡ��������
TASK_AOYUN_USE_LABA = 913;    --�Ƿ�ʹ�ù��������ȣ���ˢ
TASK_AOYUN_HUOJU_IDX = 914;   --��¼��Ӧ���̨����������������Ҿ����жϡ� 
TASK_AOYUN_FINAL_AWARD = 915; --�Ƿ���ȡ�����ս���


--���������� ע�⣬���ķ����������ǵ�ȥ��gmscript��autoexec�µ���Ӧ����
GLB_AOYUN_TIME_STATE = 200; --���ݻ��ʼ״̬
GLB_AOYUN_HUOJUTAI_NUM = 201; --��¼˳��������ڼ�̨���̨��
GLB_AOYUN_NPC_YI = 202;     --��¼ʥ��̨��������������
GLB_AOYUN_NPC_ER = 203;
GLB_AOYUN_NPC_SAN = 204;
GLB_AOYUN_NPC_SI = 205;
GLB_AOYUN_NPC_WU = 206;
GLB_AOYUN_NPC_LIU = 207;
GLB_AOYUN_NPC_QI = 208;
GLB_AOYUN_NPC_BA = 209;
GLB_AOYUN_NPC_JIU = 210;
GLB_AOYUN_NPC_SHI = 211;
GLB_AOYUN_NPC_SHIYI = 212;
GLB_AOYUN_NPC_SHIER = 213;
GLB_AOYUN_NPC_SHISAN = 214;
GLB_AOYUN_NPC_SHISI = 215;
GLB_AOYUN_NPC_SHIWU = 216;
GLB_AOYUN_NPC_SHILIU = 217;
GLB_AOYUN_NPC_SHIQI = 218;
GLB_AOYUN_NPC_SHIBA = 219;
GLB_AOYUN_NPC_SHIJIU = 220;
GLB_AOYUN_NPC_ERSHI = 221;
GLB_AOYUN_NPC_ERYI = 222;
GLB_AOYUN_NPC_ERER = 223;
GLB_AOYUN_NPC_ERSAN = 224;
GLB_AOYUN_NPC_ERSI = 225;
GLB_AOYUN_NPC_ERWU = 226;
GLB_AOYUN_NPC_ERLIU = 227;
GLB_AOYUN_NPC_ERQI = 228;
GLB_AOYUN_NPC_ERBA = 229;
GLB_AOYUN_NPC_ERJIU = 230;
GLB_AOYUN_NPC_SANSHI = 231;
GLB_AOYUN_NPC_SANYI = 232;

--ȫ�ֱ���
TRIGER_AOYUN_TIME_ID = 300; --ʱ�䴥����ID
TIME_TABLE_ID = 50; --����ID

tHuojuName = {
	[1] = {"Th�nh H�a ��i","��i �u�c 1"},
	[2] = {"��i �u�c 1","��i �u�c 2"},
	[3] = {"��i �u�c 2","��i �u�c 3"},
	[4] = {"��i �u�c 3","��i �u�c 4"},
	[5] = {"��i �u�c 4","��i �u�c 5"},
	[6] = {"��i �u�c 5","��i �u�c 6"},
	[7] = {"��i �u�c 6","��i �u�c 7"},
	[8] = {"��i �u�c 7","��i �u�c 8"},
	[9] = {"��i �u�c 8","��i �u�c 9"},
	[10] = {"��i �u�c 9","��i �u�c 10"},
	[11] = {"��i �u�c 10","��i �u�c 11"},
	[12] = {"��i �u�c 11","��i �u�c 12"},
	[13] = {"��i �u�c 12","��i �u�c 13"},
	[14] = {"��i �u�c 13","��i �u�c 14"},
	[15] = {"��i �u�c 14","��i �u�c 15"},
	[16] = {"��i �u�c 15","��i �u�c 16"},
	[17] = {"��i �u�c 16","��i �u�c 1-7"},
	[18] = {"��i �u�c 1-7","��i �u�c 18"},
	[19] = {"��i �u�c 18","��i �u�c 19"},
	[20] = {"��i �u�c 19","��i �u�c 20"},
	[21] = {"��i �u�c 20","��i �u�c 21"},
	[22] = {"��i �u�c 21","��i �u�c 22"},
	[23] = {"��i �u�c 22","��i �u�c 23"},
	[24] = {"��i �u�c 23","��i �u�c 24"},
	[25] = {"��i �u�c 24","��i �u�c 25"},
	[26] = {"��i �u�c 25","��i �u�c 26"},
	[27] = {"��i �u�c 26","��i �u�c 27"},
	[28] = {"��i �u�c 27","��i �u�c 28"},
	[29] = {"��i �u�c 28","��i �u�c 29"},
	[30] = {"��i �u�c 29","L� n��ng b�nh"},
	[31] = {"L� n��ng b�nh"}  --������
	}
	
--���̨pos	
tHuoJuPos = {
		{"Th�nh H�a ��i","Th�nh H�a ��i",500,1829,3065},{"��i �u�c","��i �u�c 1",500,1678,3214},{"��i �u�c","��i �u�c 2",500,1662,3099},{"��i �u�c","��i �u�c 3",500,1778,3203},
		{"��i �u�c","��i �u�c 4",350,1538,2870},{"��i �u�c","��i �u�c 5",350,1417,2790},{"��i �u�c","��i �u�c 6",350,1346,2878},{"��i �u�c","��i �u�c 7",350,1366,3052},{"��i �u�c","��i �u�c 8",350,1514,3051},
		{"��i �u�c","��i �u�c 9",300,1676,3676},{"��i �u�c","��i �u�c 10",300,1705,3487},{"��i �u�c","��i �u�c 11",300,1861,3490},{"��i �u�c","��i �u�c 12",300,1764,3553},{"��i �u�c","��i �u�c 13",300,1866,3632},
		{"��i �u�c","��i �u�c 14",400,1534,2920},{"��i �u�c","��i �u�c 15",400,1431,2963},{"��i �u�c","��i �u�c 16",400,1451,3094},{"��i �u�c","��i �u�c 1-7",400,1560,3112},
		{"��i �u�c","��i �u�c 18",100,1352,2894},{"��i �u�c","��i �u�c 19",100,1353,3051},{"��i �u�c","��i �u�c 20",100,1513,3053},{"��i �u�c","��i �u�c 21",100,1507,2899},
		{"��i �u�c","��i �u�c 22",150,1625,3060},{"��i �u�c","��i �u�c 23",150,1626,3185},{"��i �u�c","��i �u�c 24",150,1747,3182},{"��i �u�c","��i �u�c 25",150,1736,3076},
		{"��i �u�c","��i �u�c 26",200,1270,2974},{"��i �u�c","��i �u�c 27",200,1468,2946},{"��i �u�c","��i �u�c 28",200,1465,2783},{"��i �u�c","��i �u�c 29",200,1302,2755},{"L� n��ng b�nh","L� n��ng b�nh",200,1364,2875}}
		
			
--�ʱ�� ָ�ճ�� ���ݻʱ����reyal����
function get_aoyun_state()
	--�״̬�ж�
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080630 then
		return 0;
	elseif nDate >= 20080630 and nDate <= 20080806 then
		return 1;
	else 
		return 2;
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

--��ʯ��������
function aoyun_baoshi_prob()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch C�p 1, n� trong T� linh ��nh.");
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 2, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c1 Linh Th�ch c�p 3, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 4, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 5, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 6, �� nh�p v�o T� linh ��nh.");
		Msg2Global("Ng��i ch�i"..GetName().."Tham gia ho�t ��ng R��c �u�c nh�n ���c 1 Linh th�ch c�p 6");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Tham gia ho�t ��ng R��c �u�c nh�n ���c 1 Linh th�ch c�p 6.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 7, �� nh�p v�o T� linh ��nh.");		
		Msg2Global("Ng��i ch�i"..GetName().."Tham gia ho�t ��ng R��c �u�c nh�n ���c 1 Linh th�ch c�p 7");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Tham gia ho�t ��ng R��c �u�c nh�n ���c 1 Linh th�ch c�p 7.");
	end
end

--���������̨
function goto_huojutai()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","B�n �� hi�n t�i kh�ng th� d�ng ch�c n�ng di chuy�n n�y!");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"","Xin d�ng ch�c n�ng di chuy�n n�y � khu v�c h�a b�nh (th�nh tr�n)!");
		return
	end
	local nTask = 1;
	if GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	elseif GetTask(TASK_AOYUN_ZHUWEI_NUM) ~= 0 then
		nTask = GetTask(TASK_AOYUN_ZHUWEI_NUM);
	end
	if PrePay(5000)==0 then 
		Talk(1,"","C� ti�n th� h�y ng�i xe!")
	else 
		CleanInteractive();	
		NewWorld(tHuoJuPos[nTask][3],tHuoJuPos[nTask][4],tHuoJuPos[nTask][5]);
		SetFightState(0);
	end		
end

function nothing()

end