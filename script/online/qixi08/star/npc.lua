Include("\\script\\online\\qixi08\\star\\function.lua");

function aoyun_star_main()
	local nLevel = GetLevel()
	if nLevel <= 10 then
		Talk(1,"",g_szInfoHead.."��ng c�p c�a b�n qu� th�p, xin h�y luy�n ��n c�p <color=yellow>11<color> r�i h�y ��n t�m ta.");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	local nYear1,nMonth1,nDay1 = QX08_GetDate(g_nQiXiBeginDate);
	local nYear2,nMonth2,nDay2 = QX08_GetDate(g_nQiXiEndDate);
	if nDate < g_nQiXiBeginDate then
		Talk(1,"",g_szInfoHead.."Th�i gian ho�t ��ng <color=yellow>"..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ��n "..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.."<color>, v� thi�u hi�p n�y ��n l�c nh� gh� l�i xem.");
		return 0;
	end;
	if nDate > g_nQiXiEndDate then
		Talk(1,"",g_szInfoHead.."Th�i gian l�n ho�t ��ng n�y l� <color=yellow>"..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ��n "..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.."<color>, hi�n �� qu� th�i gian ho�t ��ng, xin l�n sau quay l�i.");
		return 0;
	end;
	local selTab = {
				"Ta mu�n nh�n 1 t�m 'Tinh Tinh ��a ��'/aoyun_star_get_star_map",
				"Ta mu�n h�p th�nh 1 Tinh Tinh Chi V��ng/aoyun_star_compose_big_star",
				"Ta mu�n ��n Ng�n H� �� ch�m sao ��c nguy�n/aoyun_star_goto_galaxy",
				"Ta mu�n d�ng ��ng t�m ho�n �� ��i 1 t�m 'Tinh Tinh ��a ��'/aoyun_star_tongxinwan_exchange",
				"M� t� ho�t ��ng sao b�ng ��c nguy�n/aoyun_star_know_detail",
				"Ta s� quay l�i sau/nothing",
				}
	Say(g_szInfoHead.."Ai n�i giang h� nh�n s� kh�ng �a t�nh? Nh� n�m �� ta c�ng t�ng l� m�t hi�p kh�ch phong l�u! �y da, kh�ng n�i v�n v� n�a, c� m�i n�m ��n �� Th�t T�ch, l� tr�n tr�i sao b�ng l�i r�i r�ng ��y. Nh�ng ng�i sao b�ng �� t��ng tr�ng cho ��c nguy�n nam n�. � ��y ta c� m�t t�m Tinh Tinh ��a ��, ng��i c� mu�n b�t ch��c �i t�m m�t ng�i sao b�ng �� t� ��c nguy�n th�m k�n kh�ng? Th�i gian: <color=red>m�ng 7, m�ng 8, m�ng 9 th�ng 7 �m l�ch (ng�y 7, 8, 9 th�ng 8 d��ng l�ch)<color>",getn(selTab),selTab);
end;

function aoyun_star_get_star_map()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > GetTask(TSK_AOYUN_STAR_DATE) then
		local selTab = {
					"���c!/aoyun_star_get_star_map_1",
					"L�t n�a ta s� quay l�i nh�n/nothing",
					}
		Say(g_szInfoHead.."Ng��i h�u t�m c� th� d�a v�o ��a �� �� t�m ra ng�i sao b�ng c�a m�nh. ��y ch�nh l� 'Tinh Tinh ��a ��' trong truy�n thuy�t, xin c�c h� nh�n l�y.",getn(selTab),selTab);
	else
		Talk(1,"aoyun_star_main",g_szInfoHead.."Xin l�i, h�m nay c�c h� �� nh�n 'Tinh Tinh ��a ��' r�i. M�t v�t tr�n qu� nh� v�y, kh�ng th� ph�t tu� ti�n ���c.");
	end;
end;

function aoyun_star_get_star_map_1()
	local nDate = tonumber(date("%Y%m%d"));
	if gf_JudgeRoomWeight(2,10,g_szInfoHead) == 0 then
		return 0;
	end;
	SetTask(TSK_AOYUN_STAR_DATE,nDate);
	AddItem(2,0,407,1);
	Msg2Player("B�n nh�n ���c 1 Tinh Tinh ��a ��");
	WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ���c 1 Tinh Tinh ��a ��");
end;

function aoyun_star_compose_big_star()
	local selTab = {
				"���c/aoyun_star_compose_big_star_1",
				"Tinh Tinh Chi V��ng l� g� v�y/aoyun_star_know_big_star",
				"Ta ��i c�c h� quay l�i/nothing",
				}
	Say(g_szInfoHead.."D�ng 7 sao b�ng c� th� h�p th�nh 1 Tinh Tinh Chi V��ng. C� mu�n h�p th�nh kh�ng?",getn(selTab),selTab);
end;

function aoyun_star_know_big_star()
	Talk(1,"aoyun_star_main",g_szInfoHead.."Tr�n b�u tr�i sao m�nh m�ng, ng�i sao s�ng nh�t ch�nh l� ng�i sao ch�a t�m nguy�n th�m k�n c�a c�c h� ��. D�ng 7 'sao b�ng' �� ��i 1 'Tinh Tinh Chi V��ng'.");
end;

function aoyun_star_compose_big_star_1()
	if GetItemCount(2,0,408) < 7 then
		Talk(1,"aoyun_star_main",g_szInfoHead.."B�n kh�ng �� sao b�ng, h�y thu th�p th�m �i. H�p th�nh Tinh Tinh Chi V��ng c�n c� <color=yellow>7<color> sao b�ng.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10,g_szInfoHead) == 0 then
		return 0;
	end;
	if DelItem(2,0,408,7) == 1 then
		local nRetCode,nItemIdx = AddItem(2,0,1071,1);
		SetItemExpireTime(nItemIdx,aoyun_star_get_time_left());
		Msg2Player("B�n nh�n ���c 1 'Tinh Tinh Chi V��ng'");
		Talk(1,"aoyun_star_main",g_szInfoHead.."Xin h�y nh�n l�y, ��y l� 'Tinh Tinh Chi V��ng' v� c�ng qu� gi�, l� ng�i sao lung linh nh�t trong c�c v� sao.");
		WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().." �� h�p th�nh 1 Tinh Tinh Chi V��ng");
	end;
end;

function aoyun_star_goto_galaxy()
	SetLogoutRV(1);	--��Ϊ����������
	SetFightState(0);	--��ƽ״̬
	local nMapID = GetWorldPos();
	if nMapID ~= 100 and nMapID ~= 200 and nMapID ~= 300 then
		return 0;
	end;
	CleanInteractive();
	NewWorld(965+floor(nMapID/100),1628,3298);
end;

function aoyun_star_tongxinwan_exchange()
	local selTab = {
				"Ta mu�n ��i 1 Tinh Tinh ��a ��/aoyun_star_tongxinwan_exchange_1",
				"T�m th�i kh�ng ��i/nothing",
				}
	Say(g_szInfoHead.."B�n mu�n d�ng <color=yellow>1 ��ng t�m ho�n<color> ��i <color=yellow>1 Tinh Tinh ��a ��<color> ph�i kh�ng? <color=red>L�u �: M�i ng��i m�i ng�y ch� c� th� t�m ���c t�i �a 7 ng�i sao, b�n ��ng n�n ��i qu� nhi�u Tinh Tinh ��a ��.<color>",getn(selTab),selTab);
end;

function aoyun_star_tongxinwan_exchange_1()
	if GetItemCount(2,1,573) < 1 then
		Talk(1,"aoyun_star_main",g_szInfoHead.."Tr�n ng��i b�n kh�ng c� ��ng t�m ho�n.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10,g_szInfoHead) == 0 then
		return 0;
	end;
	if DelItem(2,1,573,1) == 1 then
		AddItem(2,0,407,1);
		Talk(1,"aoyun_star_main",g_szInfoHead.."C�m l�y �i, ��y l� Tinh Tinh ��a �� c�a b�n.");
		Msg2Player("B�n �� d�ng 1 ��ng t�m ho�n �� ��i 1 Tinh Tinh ��a ��");
		WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().." �� d�ng 1 ��ng t�m ho�n �� ��i 1 Tinh Tinh ��a ��");
	end;
end;

function aoyun_star_know_detail()
	Talk(2,"aoyun_star_main",g_szInfoHead.."M�ng 7, m�ng 8, m�ng 9 th�ng 7 (ng�y 7, 8, 9 th�ng 8 d��ng l�ch), trong 3 ng�y n�y, m�i ng�y ��u c� th� ��n ch� ta �� nh�n m�t t�m 'Tinh Tinh ��a ��'. D�ng ��a �� �� t�m ra to� ��, ��n to� �� ch� ��nh �� nh�t sao b�ng, <color=red>[T�m ph�n th��ng kinh nghi�m sao b�ng, m�i ng�y m�i ng��i c� th� nh�n ���c 1 l�n]<color>. N�u nam n� t� ��i t�m sao b�ng th� c� x�c su�t 80% t�m ���c 'Tinh Tinh ��a ��'. M�i ng�y m�i ng��i c� th� nh�t t�i �a 7 sao b�ng. Mang 7 sao b�ng ��n ch� '��c s� ��i H�i V� l�m' c� th� ��i ���c 1 'Tinh Tinh Chi V��ng'. 'Sao b�ng' v� 'Tinh Tinh Chi V��ng' ��u l� nh�ng v�t phi ph�m, v�t qua trong ch�p m�t, kh�ng th� gi� ��n ng�y h�m sau ���c.",g_szInfoHead.."Mang nh�ng sao b�ng b�n thu nh�t ���c c�ng v�i b�n b�, c�ng nhau v�o b�n �� Ng�n H�, ch�m v�o ng�i sao, ��c nguy�n nh�ng �i�u th�m k�n, b�n s� nh�n ���c nhi�u ph�n th��ng phong ph�. <color=yellow>M�i ng�y m�i ng��i ch� c� th� tr�ng 1 c�y ��c nguy�n<color>.");
end;

function aoyun_star_get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec);
	return nTimeLeft;
end;
