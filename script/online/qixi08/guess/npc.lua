--08���˻������npc
--�������ڣ�08-07-16
--�����ˣ���ī��^_^
Include("\\script\\online\\qixi08\\guess\\function.lua");

guess_tb_num = {}

function aoyun_guess_main()
	local szTemp,nTemp;
	szTemp = "0";
	nTemp = -1;
	szTemp,nTemp = QX08_GetTodayGame();
	if nTemp ~= GAME_ID_GUESS then
			Talk(1,"",g_szInfoHead.."H�m nay <color=yellow>"..szTemp.."<color>ho�t ��ng b�t ��u, th�t th� v�.");
			return
	end;
	
	if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
		SetTask(TSK_AOYUN_GUESS_TURN,0);
		SetTask(TSK_AOYUN_GUESS_BEST,0);
		SetTask(TSK_AOYUN_GUESS_TIMES,0);
		SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
		SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
		SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
	elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--�������ﲻ��д��Ҳ����գ���ֹ������ʱ�䲻ͬ��������⡣
	end
	local selTab = {
		"Ta mu�n b�t ��y tr�n ��u/guess_start",
		"quy t�c Thi�n C� Th�n To�n/guess_rule",
		"Ta ��n nh�n ph�n th��ng H� R�n R�ng - Vui Ng�p Tr�n/guess_prize",
		"S� quay l�i sau/nothing"
	}
	Say(g_szInfoHead.."Hoan ngh�nh tham gia ho�t ��ng Thi�n C� Th�n To�n!",getn(selTab),selTab)
end

--�����Ի�
function nothing()
end

--ȷ�ϲ�������Ϸ�Ƿ�ʼ
function guess_start()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"",g_szInfoHead.."Th�i gian ho�t ��ng l� <color=yellow>9h s�ng ��n 11h ��m<color>, ng��i nh� k� nh�.");
		return 0;
	end;
	if GetLevel() <= 30 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l�i, ��ng c�p c�a ng��i qu� th�p, r�n luy�n th�m r�i h�n ��n.");
	
	else
--		--��Ʊ
--		if GetItemCount(2,0,1069) > 0 then
--			if DelItem(2,0,1069,1) ~= 1 then
--				WriteLog("���˻��"..GetName().."ɾ�����µ�һ���������뺯ʧ�ܣ�");
--				Talk(1,"aoyun_guess_main",g_szInfoHead.."��ȷ�������ϴ����㹻�����µ�һ���������뺯��");
--				return
--			end;
--		else
--			Talk(1,"aoyun_guess_main",g_szInfoHead.."��ȷ�������ϴ����㹻�����µ�һ���������뺯��");
--			return
--		end;
		--�������һ�죬����
		if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
			SetTask(TSK_AOYUN_GUESS_TURN,0);
			SetTask(TSK_AOYUN_GUESS_BEST,0);
			SetTask(TSK_AOYUN_GUESS_TIMES,0);
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
			SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
			SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
		elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--����
		end
		--��ʼ���������
		SetTask(TSK_AOYUN_GUESS_TURN,1)
		--���������
		guess_tb_num[GetName()] = random(0,100);
		local selTab = {
			"B�t ��u �o�n/guess_comfirm",
			--"ȡ��/main"
		}

		Say(g_szInfoHead.."���c r�i, m�i th� �� chu�n b� s�n s�ng, b�t ��u ��m th�i.",getn(selTab),selTab);
	end
end

--ȷ����Ҳµ�����
function guess_comfirm()
	AskClientForNumber("guess_num_confirm",0,100,"H�y nh�p s� v�o");
end

function guess_num_confirm(nCount)
	--�����ִ�
	local nTempTurn = 0;
	SetTask(TSK_AOYUN_GUESS_TURN,GetTask(TSK_AOYUN_GUESS_TURN) + 1);
	nTempTurn = GetTask(TSK_AOYUN_GUESS_TURN);
	if nTempTurn > 6 or (nTempTurn == 6 and nCount ~= guess_tb_num[GetName()]) then
		--����5����
		SetTask(TSK_AOYUN_GUESS_TIMES,0);--��������������
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l�i, b�n �� �o�n sai 5 l�n. ��p �n ch�nh x�c l� "..guess_tb_num[GetName()]);
		return
	end
	if nCount == guess_tb_num[GetName()] and nTempTurn <= 6 then
		--�¶���
		if GetTask(TSK_AOYUN_GUESS_BEST) > nTempTurn - 1 or GetTask(TSK_AOYUN_GUESS_BEST) == 0 then
			--ˢ����óɼ�
			SetTask(TSK_AOYUN_GUESS_BEST,nTempTurn - 1);
		end
		SetTask(TSK_AOYUN_GUESS_TIMES,GetTask(TSK_AOYUN_GUESS_TIMES) + 1)
		if GetTask(TSK_AOYUN_GUESS_TIMES) >= 10 and GetTask(TSK_AOYUN_GUESS_TIMES) > GetTask(TSK_AOYUN_GUESS_BCOMPLETED) then
			--��������10������
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,GetTask(TSK_AOYUN_GUESS_TIMES));--��¼������������ʮ������
		end
		local szTemp;
		szTemp = "��ng r�i!";
		if nTempTurn <= 3 then
			szTemp = "C�c h� thi�n t� b�t ph�m, sau n�y �t s� n�n nghi�p l�n!";
		elseif nTempTurn <= 4 then
			szTemp = "Kh� khen kh� khen, ��i hi�p qu� l� v�n v� song to�n!";
		else
			szTemp = "Ch�c m�ng b�n, �� �o�n ��ng!";
		end
		Say(g_szInfoHead..szTemp.."��p �n ch�nh x�c l� "..guess_tb_num[GetName()].."!",1,"tr� l�i/aoyun_guess_main");
		
	else
	--��Ҳµ����ֱ�ϵͳָ�����ִ�50����	��̫���ˣ�����Ŭ����	
	--��Ҳµ����ֱ�ϵͳָ�����ִ�30��50	�е�̫����Ŷ�����ͣ�	
	--��Ҳµ����ֱ�ϵͳָ�����ִ�10��30	�е�ӽ��ˣ��������Ǵ��˵㡣	
	--��Ҳµ����ֱ�ϵͳָ�����ִ�10����	�ý��Ű�������һ��㣬��Ҫ���ˣ�	
	--��Ҳµ����ֱ�ϵͳָ������С50����	С̫���ˣ���ô���ܾ���ôС��	
	--��Ҳµ����ֱ�ϵͳָ������С30��50	�е�̫С��Ŷ�����ͣ�	
	--��Ҳµ����ֱ�ϵͳָ������С10��30	�е�ӽ��ˣ���������С�˵㡣	
	--��Ҳµ����ֱ�ϵͳָ������С10����	�ý��Ű�,С��һ��㣬��Ҫ���ˣ�
		local szTemp2;
		szTemp2 = "Sai";
		if nCount - guess_tb_num[GetName()] > 50 then
			szTemp2 = "Ch�a ch�nh x�c, c� g�ng l�n!";
		elseif nCount - guess_tb_num[GetName()] > 30 then
			szTemp2 = "Ch�a ch�nh x�c, c� g�ng l�n!";
		elseif nCount - guess_tb_num[GetName()] > 10 then
			szTemp2 = "�o�n s�p ��ng r�i, l�n m�t ch�t n�a.";
		elseif nCount - guess_tb_num[GetName()] > 0 then
			szTemp2 = "C�ng th�ng qu�, l�n m�t ch�t, s�p tr�ng r�i!";
		elseif nCount - guess_tb_num[GetName()] < -50 then
			szTemp2 = "Nh� qu�, sao l�i nh� nh� th� ���c?";
		elseif nCount - guess_tb_num[GetName()] < -30 then
			szTemp2 = "Qu� nh� r�i, c� l�n!"
		elseif nCount - guess_tb_num[GetName()] < -10 then
			szTemp2 = "�o�n s�p ��ng r�i, nh� m�t ch�t n�a.";
		elseif nCount - guess_tb_num[GetName()] < 0 then
			szTemp2 = "C�ng th�ng qu�, nh� 1 ch�t, s�p tr�ng r�i!";
		end
		Talk(1,"guess_comfirm",g_szInfoHead..szTemp2.."B�y gi� b�t ��u �o�n l�n th� "..nTempTurn.." l�n.");
	end
end

--��Ϸ����
function guess_rule()
	if IB_VERSION == 0 then--�շ���
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi tr�n ��u b�t ��u, h� th�ng s� ch�n m�t s� nguy�n ng�u nhi�n t� 0-100, b�n h�y nh�p s� t� 0-100 �� �o�n, khi s� �o�n qu� l�n ho�c qu� nh� th� h� th�ng s� th�ng b�o. M�i ng��i c� th� �o�n nhi�u nh�t l� 5 l�n. (M�i ng�y m�i ng��i ch� c� 1 l�n nh�n th��ng, gi�i th��ng s� c�n c� v�o th�nh t�ch t�t nh�t c�a b�n h�m nay)\n ",g_szInfoHead.."Khi nh�n ph�n th��ng s� c�n c� v�o th�nh t�ch t�t nh�t c�a b�n.\n ");
	else--�����
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi tr�n ��u b�t ��u, h� th�ng s� ch�n m�t s� nguy�n ng�u nhi�n t� 0-100, b�n h�y nh�p s� t� 0-100 �� �o�n, khi s� �o�n qu� l�n ho�c qu� nh� th� h� th�ng s� th�ng b�o. M�i ng��i c� th� �o�n nhi�u nh�t l� 5 l�n. (M�i ng�y m�i ng��i ch� c� 1 l�n nh�n th��ng, gi�i th��ng s� c�n c� v�o th�nh t�ch t�t nh�t c�a b�n h�m nay)\n ",g_szInfoHead.."Khi nh�n ph�n th��ng s� c�n c� v�o th�nh t�ch t�t nh�t c�a b�n.\n  N�u ch�n ��ng trong m�t l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*500 v�n kinh nghi�m.  Ng��i c�p 99 t�ng 6 T�i b�o th�ch. ���c 5 �i�m t�ch l�y.\n  N�u �o�n ��ng trong hai l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*420 v�n kinh nghi�m. Ng��i ch�i c�p 99 t�ng 5 T�i b�o th�ch. ���c 4 �i�m t�ch l�y.\n N�u �o�n ��ng trong 3 l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*380 v�n kinh nghi�m. Ng��i ch�i c�p 99 t�ng 4 T�i b�o th�ch. ���c 3 �i�m t�ch l�y.");
	end;
end

function guess_rule_2()
	if IB_VERSION == 0 then--�շ���
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	N�u �o�n ��ng trong 4 l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100 v�n kinh nghi�m, c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*300 v�n s�c kh�e. C�p 99 t�ng 3 T�i b�o th�ch. ���c 2 �i�m t�ch l�y.\n N�u �o�n ��ng trong 5 l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100 v�n kinh nghi�m, c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*250 v�n s�c kh�e. Ng��i ch�i c�p 99 t�ng 2 T�i b�o th�ch. ���c 1 �i�m t�ch l�y.\n ");
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	N�u �o�n ��ng trong 4 l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*350 v�n kinh nghi�m. Ng��i ch�i c�p 99 t�ng 3 T�i b�o th�ch. ���c 2 �i�m t�ch l�y\n N�u �o�n ��ng trong 5 l�n, s� nh�n ���c b�nh ph��ng ��ng c�p/b�nh ph��ng 80*300 v�n kinh nghi�m. Ng��i ch�i c�p 99 t�ng 2 T�i b�o th�ch. ���c 1 �i�m t�ch l�y.\n ");
	end;
end;

--��Ϸ����
function guess_prize()
	if GetTask(TSK_AOYUN_GUESS_BPRIZED) == 1 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin l�i, h�m nay ng��i �� nh�n ph�n th��ng r�i!");
		return
	end;
	guess_prize_real();
end;

function guess_prize_real()
	if GetTask(TSK_AOYUN_GUESS_BCOMPLETED) >= 10 or (GetTask(TSK_AOYUN_GUESS_BEST) > 0 and GetTask(TSK_AOYUN_GUESS_BEST) <= 5) then
		QX08_GetAward(1,GetTask(TSK_AOYUN_GUESS_BEST),TSK_AOYUN_GUESS_BPRIZED);--����ͷ�ļ��ĺ���
		return
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Ng��i kh�ng �o�n ��ng ���c l�n n�o, c�n mu�n nh�n ph�n th��ng g� ch�? Th� l�i l�n n�a �i!");
		return
	end;
end;