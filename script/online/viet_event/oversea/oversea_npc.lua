Include("\\script\\online\\qixi08\\box\\mission_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

szNpcName = "<color=green>Thuy�n phu ��ng H�i<color>: "

function main()
	local tSay = 
	{
		"Mau ��a ta t�i C� ��o (t�n 1 v�ng)/go_island",
		"��ng k� t�i khu v�c ��ng H�i - ��o Hi�p Kh�ch/go_oversea",
		"T�m th�i ta ch�a mu�n �i/gf_DoNothing",
	}
	if GetTaskTrans() == 15 then
		trans_talk_15()
	else
		Say(szNpcName.."Thuy�n �i kh�ng ��i ng��i. M�i c�c v� ��i hi�p mau ch�ng l�n ���ng.",getn(tSay),tSay)
	end
end

function go_island()
	if mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID) == MS_STATE_BEGIN then
		Talk(1,"",szNpcName.."H�m nay bi�n c� nhi�u bi�n ��ng, t�t nh�t kh�ng n�n �i!");
		return 0;
	end;
	if GetCash() < 10000 then
		Talk(1,"",szNpcName.."V� ��i hi�p ��y h�nh nh� kh�ng mang theo ti�n v�ng trong ng��i?")
		return
	end	
	if GetPKValue() >= 9 then	
		Talk(1,"",szNpcName.."V� ��i hi�p ��y �� g�y r�t nhi�u t�i �c. Th� l�i t�i h� kh�ng th� ��a l�n thuy�n ���c! Xin h�y gi�m �i�m PK!");
		return 0;
	end;
	if floor(GetTask(TASK_VNG_PET) / 100) < 200 then
		Talk(1,"",szNpcName.."B�n ��ng H�nh c�a ��i hi�p ch�a �� 200 �i�m N�ng C�p, ch�a th� l�n ��o!");
		return 0;
	end
	if Pay(10000) ==1 then			
		mf_JoinMission(MISSION_ID,CAMP_1,MAP_ID);		
	end
end

function go_oversea()
	Talk(1,"",szNpcName.."Thuy�n �� r�i b�n. M�i ��i hi�p quay l�i sau!")
end