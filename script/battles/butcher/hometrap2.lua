--�𷽺�ӪTrap�㴥���Ľű�
Include("\\script\\battles\\butcher\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
			if( GetFightState() == 1) then
				print("hometrap2  hometrap2  hometrap2  hometrap2  GetFightState() == 1  GetCurCamp() == 1")
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
			else
				RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
				if ( RestTime < TIME_PLAYER_REV) then
					Say((TIME_PLAYER_REV - RestTime) .. " gi�y sau m�i v�o ���c chi�n tr��ng. T��ng s�! Xin ��ng n�ng l�ng!", 0)
				else
					file = GetMissionS(2)
					x,y = bt_getadata(file)
					print("hometrap2  hometrap2  hometrap2  hometrap2  RestTime >= TIME_PLAYER_REV and GetFightState() ~= 1  GetCurCamp() == 1")
					SetPos(floor(x/32), floor(y/32))
					SetTempRevPos(SubWorldIdx2ID(SubWorld) , GetMissionV(MS_HOMEIN_X2) * 32, GetMissionV(MS_HOMEIN_Y2) * 32);
					SetFightState(1)
				end
			end;
		elseif (GetCurCamp() == 1) then
				file = GetMissionS(2)
				x,y = bt_getadata(file)
				print("hometrap2  hometrap2  hometrap2  hometrap2  GetCurCamp() == 1")
				SetPos(floor(x/32), floor(y/32))
			Msg2Player("Tr��c khi khai chi�n, t�t c� t��ng s� kh�ng ���c t� � r�i kh�i qu�n doanh c�a m�nh! H�y ��i l�c khai chi�n gi�t gi�c l�p c�ng!")
		end;
end;


