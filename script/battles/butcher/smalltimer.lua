Include("\\script\\battles\\butcher\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v�c s� c�p"
		lvllimit = 40
	elseif (lsf_level == 2) then
		resultstr = "Khu v�c cao c�p"
		lvllimit = 70
	end
	
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)

	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit() ) then
			SetMissionV(MS_MOSTDEATH, 1) 
			CloseMission(MISSIONID)
			return
		end
		RunMission(MISSIONID)
		AddGlobalNews(resultstr.."Thi�n M�n tr�n t�i Nh�n M�n quan �� m�. C�c hi�p kh�ch xin nhanh ch�n ��n b�o danh tham chi�n!");
		Msg2Global(resultstr.."Thi�n M�n tr�n t�i Nh�n M�n quan �� m�. C�c hi�p kh�ch xin nhanh ch�n ��n b�o danh tham chi�n!")
		Msg2MSAll(MISSIONID, "��i chi�n Nh�n M�n quan ch�nh th�c khai chi�n! C�c t��ng s�! Ti�n l�n!");
		WriteLog("butcher battle is entering fight state\tsong member count\t"..GetMSPlayerCount(MISSIONID, 1).."\tliao member count\t"..GetMSPlayerCount(MISSIONID, 2), "Nh�t k� T�ng Li�u")
	end

	if (t == CLOSE_SIGNUP_TIME) then
		AddGlobalNews("Chi�n tr��ng �ang di�n ra kh�c li�t. ���ng v�o chi�n tr��ng �� b� phong t�a! Vi�n qu�n m�i b�n xin ��i tr�n sau!")
		Msg2Global("Chi�n tr��ng �ang di�n ra kh�c li�t. ���ng v�o chi�n tr��ng �� b� phong t�a! Vi�n qu�n m�i b�n xin ��i tr�n sau!")
	end

	if (t < RUNGAME_TIME and mod(t, 3) == 0 ) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."Thi�n M�n tr�n t�i Nh�n M�n quan s�p khai chi�n. C�c hi�p kh�ch h�y mau ch�ng mang theo Anh h�ng l�nh ��n Nh�n M�n quan b�o danh! Th�i gian b�o danh c�n"..RestMin.." ph�t. �i�u ki�n tham chi�n: ��ng c�p t�"..lvllimit.." tr� l�n.";
			str2 = "Th�i gian khai chi�n c�n:"..RestMin.." Ph�t "
		else
			str1 = resultstr.."Thi�n M�n tr�n t�i Nh�n M�n quan s�p khai chi�n. C�c hi�p kh�ch h�y mau ch�ng mang theo Anh h�ng l�nh ��n Nh�n M�n quan b�o danh! Th�i gian b�o danh c�n"..RestMin.." Ph�t "..RestSec.." gi�y. �i�u ki�n tham chi�n: ��ng c�p kh�ng nh� h�n"..lvllimit.." tr� l�n.";
			str2 = "Th�i gian khai chi�n c�n:"..RestMin.." Ph�t "..RestSec.." Gi�y "
		end
		if( mod(t, 18) == 0 ) then
			AddGlobalNews(str1);
			Msg2Global(str1)
		end
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then

		--�������ĳһ��Ӫ����������С������������������˶����Ӫֱ�ӻ�ʤ
		if( t > RUNGAME_TIME and wl_search_memcount() == 1 ) then
			CloseMission(MISSIONID)
			return
		end

		--ÿһ����ͨ�浱ǰ˫��ս������npc
		if (mod(t, 3) == 0 ) then
			msstr = "Th�ng b�o: Chi�n c�ng 2 phe T�ng Li�u hi�n l�"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
			
			local gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
			local gamerestmin, gamerestsec = GetMinAndSec(gametime);
			if( gamerestmin ~= 0 ) then
				Msg2MSAll( MISSIONID, "Th�i gian k�t th�c tr�n chi�n c�n"..gamerestmin.." ph�t " )
				if ( mod(t,30) == 0 and t > RUNGAME_TIME and t < CLOSE_SIGNUP_TIME) then
					AddGlobalNews("Chi�n ��u gi�a T�ng qu�n v� Li�u binh �ang h�i k�ch li�t, th�i gian k�t th�c tr�n chi�n c�n"..gamerestmin.." ph�t, c�c t��ng s� kh�n tr��ng d�ng Anh h�ng l�nh th�ng ti�n Nh�n M�n quan tham chi�n!")
					Msg2Global("Chi�n ��u gi�a T�ng qu�n v� Li�u binh �ang h�i k�ch li�t, th�i gian k�t th�c tr�n chi�n c�n"..gamerestmin.." ph�t, c�c t��ng s� kh�n tr��ng d�ng Anh h�ng l�nh th�ng ti�n Nh�n M�n quan tham chi�n!")
				end
			end
			resttime_to_close = (CLOSE_SIGNUP_TIME - t) * TIMER_1 / FRAME2TIME
			m, s = GetMinAndSec(resttime_to_close);
			if (m > 0 and mod(t, 15) == 0) then
				Msg2Global("���ng v�o Nh�n M�n quan s� ��ng sau "..m.."  ph�t, vi�n qu�n m�i b�n h�y kh�n c�p ti�n v� chi�n tr��ng!")
			end
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end
end
