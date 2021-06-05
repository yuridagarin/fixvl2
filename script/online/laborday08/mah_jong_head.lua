--2008����һ�ͷ�ļ�
--by vivi
--2008/04/10

--�������
--ע�⣺�޸��齫�����ǵ��޸�add_mahjong_prob����
TASK_MJ_TONG1 = 861; --����齫1Ͳ�ĸ������������ơ�
TASK_MJ_TONG2 = 862;
TASK_MJ_TONG3 = 863;
TASK_MJ_TONG4 = 864;
TASK_MJ_TONG5 = 865;
TASK_MJ_TONG6 = 866;
TASK_MJ_TONG7 = 867;
TASK_MJ_TONG8 = 868;
TASK_MJ_TONG9 = 869;
TASK_MJ_TIAO1 = 870; --����齫1���ĸ������������ơ�
TASK_MJ_TIAO2 = 871;
TASK_MJ_TIAO3 = 872;
TASK_MJ_TIAO4 = 873;
TASK_MJ_TIAO5 = 874;
TASK_MJ_TIAO6 = 875;
TASK_MJ_TIAO7 = 876;
TASK_MJ_TIAO8 = 877;
TASK_MJ_TIAO9 = 878;
TASK_MJ_WAN1 = 879; --����齫1��ĸ������������ơ�
TASK_MJ_WAN2 = 880;
TASK_MJ_WAN3 = 881;
TASK_MJ_WAN4 = 882;
TASK_MJ_WAN5 = 883;
TASK_MJ_WAN6 = 884;
TASK_MJ_WAN7 = 885;
TASK_MJ_WAN8 = 886;
TASK_MJ_WAN9 = 887;
TASK_MJ_DONG = 888; --����齫����ĸ�����
TASK_MJ_NAN = 889; --����齫�Ϸ�ĸ�����
TASK_MJ_XI = 890; --����齫����ĸ�����
TASK_MJ_BEI = 891; --����齫����ĸ�����
TASK_MJ_ZHONG = 892; --����齫���еĸ�����
TASK_MJ_FA = 893; --����齫���Ƶĸ�����
TASK_MJ_BAI =894; ----����齫�װ�ĸ�����
TASK_MJ_SINGLE_PRIZE = 895;--��ȡ���Ž����Ĵ���
TASK_MJ_PIHU_RPIZE = 896; --ƨ���һ���������
TASK_MJ_TONG_RPIZE = 897; --��һɫͲ�Ķһ�����
TASK_MJ_TIAO_RPIZE = 898; --��һɫ���Ķһ�����
TASK_MJ_WAN_RPIZE = 899; --��һɫ��Ķһ�����
TASK_MJ_SIXI_RPIZE = 900; --����ϲ�һ�����
TASK_MJ_BIWU_NUM = 901; --ÿ�ձ��������齫��
TASK_MJ_TX_DATE = 902; --ÿ��ֻ��һ�ο��Ի���齫
TASK_MJ_BIWU_DATE = 903;--�Ƿ���ȡ�˱����ᵱ�յ�15��
TASK_MS_BJ_NUM = 904; --�Ұ׾Ի�ȡ�齫������

--��ʱ����
TASK_TEMP_MJ_KIND = 126

--ȫ�ֱ���
PIHU_TOTAl_NUM = 42; --ƨ���һ���������
TONG_TOTAL_NUM = 21;
TIAO_TOTAL_NUM = 14;
WAN_TOTAL_NUM = 7;
SIXI_TOTAL_NUM = 2;
BAIJU_TOTAL_NUM = 120; --�Ұ׾����ɻ���齫����

--table
tMahJong = {--�齫�� id
	{"Nh�t ��ng",2,0,630},	
	{"Nh� ��ng",2,0,631},	
	{"Tam ��ng",2,0,632},	
	{"T� ��ng",2,0,633},	
	{"Ng� ��ng",2,0,634},	
	{"L�c ��ng",2,0,635},	
	{"Th�t ��ng",2,0,636},	
	{"B�t ��ng",2,0,637},	
	{"C�u ��ng",2,0,638},	
	{"M�t",2,0,639},	
	{"Nh� �i�u",2,0,640},	
	{"Ba",2,0,641},	
	{"B�n",2,0,642},	
	{"Ng� �i�u",2,0,643},	
	{"L�c �i�u",2,0,644},	
	{"Th�t �i�u",2,0,645},	
	{"B�t �i�u",2,0,646},	
	{"C�u �i�u",2,0,647},	
	{"Nh�t v�n",2,0,648},	
	{"Nh� v�n",2,0,649},	
	{"Tam v�n",2,0,650},	
	{"T� v�n",2,0,651},	
	{"Ng� v�n",2,0,652},	
	{"L�c v�n",2,0,653},	
	{"Th�t v�n",2,0,654},	
	{"B�t v�n",2,0,655},	
	{"C�u v�n",2,0,656},	
	{"��ng phong",2,0,657},	
	{"Nam phong",2,0,658},	
	{"T�y phong",2,0,659},	
	{"B�c phong",2,0,660},	
	{"H�ng trung",2,0,661},	
	{"ph�t t�i",2,0,662},	
	{"B�ch ban",2,0,663}	
	};
	
	

--function
function get_laborday08_state()
--�״̬�ж�
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080428 then
		return 0;
	elseif nDate >= 20080428 and nDate <= 20080505 then
		return 1;
	else 
		return 2;
	end 
end

function get_laborday08_award_state()
--��ȡ�����ж�
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20080428 and nDate <= 20080512 then	
		return 1;
	else
		return 0;
	end
end

function add_mahjong_prob(nP)
--ͨ���齫���� �������Ϊ�����ʡ���λ��ǧ�ֱȡ����紫��50 ��ʾ5%���
	local nRandOne = random(1,1000);
	if nRandOne <= nP then	
		local nRandTwo = random(1,100);
		if nRandTwo <= 55 then
			local nRandThree = random(1,9);
			SetTask(860+nRandThree,GetTask(860+nRandThree)+1);
			Msg2Player("B�n nh�n ���c 1 "..tMahJong[nRandThree][1].." , n� � trong r��ng M�t ch��c.");
		elseif nRandTwo <= 85 then
			local nRandThree = random(1,9);
			SetTask(869+nRandThree,GetTask(869+nRandThree)+1);
			Msg2Player("B�n nh�n ���c 1 "..tMahJong[9+nRandThree][1].." , n� � trong r��ng M�t ch��c.");
		elseif nRandTwo <= 95 then
			local nRandThree = random(1,9);
			SetTask(878+nRandThree,GetTask(878+nRandThree)+1);
			Msg2Player("B�n nh�n ���c 1 "..tMahJong[18+nRandThree][1].." , n� � trong r��ng M�t ch��c.");	
		else
			local nRandThree = random(1,7);
			SetTask(887+nRandThree,GetTask(887+nRandThree)+1);
			Msg2Player("B�n nh�n ���c 1 "..tMahJong[27+nRandThree][1].." , n� � trong r��ng M�t ch��c.");
		end							
		return 1;
	else
		return 0;
	end
end

--��ʯ�������ʣ���������ø߼���ʯ��;�������ڹ���
function laborday08_baoshi_prob(sName)
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
		Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..sName.."Nh�n ���c 1 vi�n Linh th�ch c�p 6");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..sName.."Nh�n ���c 1 vi�n Linh th�ch c�p 6");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 7, �� nh�p v�o T� linh ��nh.");		
		Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..sName.."Nh�n ���c 1 vi�n Linh th�ch c�p 7");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..sName.."Nh�n ���c 1 vi�n Linh th�ch c�p 7");
	end
end

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
--�������ƣ���Ʒ��Ӽ�麯��
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