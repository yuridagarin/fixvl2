--��ɽͭ����ű�
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

--�洢��ʯ�������
SYS_TSK_LINGSHI_ONE = 2321;   --1����ʯ������
SYS_TSK_LINGSHI_TWO = 2322;
SYS_TSK_LINGSHI_THREE = 2323;
SYS_TSK_LINGSHI_FOUR = 2324;
SYS_TSK_LINGSHI_FIVE = 2325;
SYS_TSK_LINGSHI_SIX = 2326;
SYS_TSK_LINGSHI_SEVEN = 2327;  --7����ʯ������

--�洢��ʯ�䷽�������
SYS_TSK_PEIFANG_ONE = 2328;   --1���䷽������
SYS_TSK_PEIFANG_TWO = 2329;
SYS_TSK_PEIFANG_THREE = 2330;
SYS_TSK_PEIFANG_FOUR = 2331;
SYS_TSK_PEIFANG_FIVE = 2332;
SYS_TSK_PEIFANG_SIX = 2333;
SYS_TSK_PEIFANG_SEVEN = 2334;  --7���䷽������

function OnUse()
	Say("M� r��ng ��ng Giang S�n ph�i c� ch�a kh�a ��ng Giang S�n, m� kh�ng? ",
		2,
		"��ng �/confirm_open",
		"Kh�ng c� g�/nothing")
end

function confirm_open()
	if GetItemCount(2,0,1017) < 1 then
		Talk(1,"","M� r��ng ��ng Giang S�n ph�i c� ch�a kh�a ��ng Giang S�n, b�n kh�ng c� ch�a kh�a ��ng Giang S�n!");
		return
	else 
		if Zgc_pub_goods_add_chk(5,35) ~= 1 then   --�ռ为�ؼ��
			return
		end	
		if DelItem(2,0,1026,1) == 1 and DelItem(2,0,1017,1) == 1 then
			AddItem(tBoxAward[2][1][2],tBoxAward[2][1][3],tBoxAward[2][1][4],tBoxAward[2][1][5],1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tBoxAward[2][1][1]..tBoxAward[2][1][5].."!");
			local nRandOne = random(1,100)
			if nRandOne <= tBoxAward[2][2][3] then
				local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
															SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}				
				local nLv = random(tBoxAward[2][2][1],tBoxAward[2][2][2]);
				Talk(1,"","Ch�c m�ng b�n nh�n ���c <color=yellow>"..nLv.."<color> (c�p) Linh th�ch <color=yellow>1<color>, b�n d�ng <color=yellow>T� Linh ��nh <color>�� l�y n� ra. T� Linh ��nh c� th� ��n ch� <color=yellow>V� L�m Minh Truy�n Nh�n<color>l�y.");
				SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])+1);
			else
				local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
															SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
				local nLv = random(tBoxAward[2][2][4],tBoxAward[2][2][5]);
				Talk(1,"","Ch�c m�ng b�n nh�n ���c <color=yellow>"..nLv.."<color> (c�p) Linh th�ch Ph�i Ph��ng <color=yellow>1<color>, b�n c� th� d�ng <color=yellow>T� Linh ��nh <color> l�y n� ra. T� Linh ��nh c� th� ��n <color=yellow>V� L�m Minh Truy�n Nh�n<color> �� nh�n.");
				SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])+1);
			end
			local nRandTwo = random(1,10000);
			local nRandThree = random(1,10000);
			local nRandFour = random(1,10000);
			if nRandTwo <= tBoxAward[2][3][6] then
				AddItem(tBoxAward[2][3][2],tBoxAward[2][3][3],tBoxAward[2][3][4],tBoxAward[2][3][5],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tBoxAward[2][3][1]..tBoxAward[2][3][5].."!");
				Msg2Global("Ng��i ch�i"..GetName().."M� r��ng ��ng Giang S�n nh�n ���c "..tBoxAward[2][3][1]..tBoxAward[2][3][5].."!");
			end
			if nRandThree <= tBoxAward[2][4][6] then
				AddItem(tBoxAward[2][4][2],tBoxAward[2][4][3],tBoxAward[2][4][4],tBoxAward[2][4][5],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tBoxAward[2][4][1]..tBoxAward[2][4][5].."!");
			end
			if nRandFour <= tBoxAward[2][5][2] then
				local nRoute = GetPlayerRoute();
				local nRand = random(1,getn(tbHuangDiRing1[nRoute]));
				local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRand][1]);
					Msg2Global("Ng��i ch�i"..GetName().."M� r��ng ��ng Giang S�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRand][1].."!");
					WriteLog("[07 Tam ti�t li�n th�ng]:"..GetName().."M� r��ng ��ng Giang S�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRand][1]);
				else
					WriteLog("[B�o l�i Tam ti�t li�n th�ng 07]:"..GetName().."M� r��ng ��ng Giang S�n nh�n ���c trang b� Ho�ng �� "..tbHuangDiRing1[nRoute][nRand][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
				end				
			end
		end
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