--�η���Ӫ��Trap�㴥���Ľű�
Include("\\script\\battles\\butcher\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
				print("homeouttrap2  homeouttrap2  homeouttrap2  homeouttrap2")
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		elseif (GetCurCamp() == 1) then
			Msg2Player("Tr��c khi khai chi�n, t�t c� t��ng s� kh�ng ���c t� � r�i kh�i qu�n doanh c�a m�nh! H�y ��i l�c khai chi�n gi�t gi�c l�p c�ng!")
			SetFightState(1)
		end;
end;


