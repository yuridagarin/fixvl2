Include("\\script\\battles\\butcher\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
	if(GetMissionV(MS_STATE) == 1) then
		if(GetCurCamp() == 1) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("Tr��c khi khai chi�n, t�t c� t��ng s� kh�ng ���c t� � r�i kh�i qu�n doanh c�a m�nh! H�y ��i l�c khai chi�n gi�t gi�c l�p c�ng!", 0)
		elseif (GetCurCamp() == 2) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("Tr��c khi khai chi�n, t�t c� t��ng s� kh�ng ���c t� � r�i kh�i qu�n doanh c�a m�nh! H�y ��i l�c khai chi�n gi�t gi�c l�p c�ng!", 0)
		end;
	else
		SetFightState(1)
	end;
end;


