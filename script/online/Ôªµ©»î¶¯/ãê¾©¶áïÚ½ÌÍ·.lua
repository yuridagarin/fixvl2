--filename:�꾩���ڽ�ͷ.lua
--create date:2005-12-21
--author:yanjun
--describe:ְ��NPC�ű�
Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--ȷ���������ͷ�
	if GetSex() == 1 then
		str_sex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		str_sex = "C� n��ng"
	else
		str_sex = "Thi�u hi�p/N� hi�p"
	end
	SelTab = {
		"Ta mu�n n�p ti�u k�./hand_up",
		"Ta mu�n t�m hi�u ho�t ��ng Nguy�n ��n �o�t k�./know_detail",
		"Ta ch� mu�n h�i th�m./nothing"
		}
	Say("Nguy�n ��n �o�t k� �� b�t ��u!"..str_sex..", ��y l� l�c ch�ng minh s�c m�nh c�a ng��i!",3,SelTab)
end

function hand_up()
	KillFollower()
	RemoveTitle(3,3)
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--�µ�һ�죬�Ѷ�������0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("Ng��i �� �o�t k� th�nh c�ng, h�m nay kh�ng th� tham gia ti�p, ng�y mai h�y quay l�i nh�!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		Say("Xin l�i, ng��i kh�ng c� ti�u k�!.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		SetTask(TASK_FLAG_HANDUP,GetCurDate())
		SetGlbValue(ID_FLAG_NUMBER_BJ,GetGlbValue(ID_FLAG_NUMBER_BJ)-1)
		if GetGlbValue(ID_FLAG_NUMBER_BJ) < 0 then
			SetGlbValue(ID_FLAG_NUMBER_BJ,0)
		end
		local flag_left = GetGlbValue(ID_FLAG_NUMBER_BJ)
		if AddItem(0,102,21,1,1,-1,-1,-1,-1,-1,-1) == 1 then
			Say("Hay qu�!"..str_sex.."C� th� �o�t l�y ti�u k�, th�t kh�ng ph�i d�! ��y l� ph�n th��ng c�a b�n!",0)
			Msg2Player("B�n nh�n ���c 1 t��ng qu�n gi�i ch�!")
		end
		if GetGlbValue(ID_FLAG_NUMBER_BJ) == 0 then
			AddGlobalNews("5 ti�u k� � Nam Bi�n Kinh �� b� l�y h�t, ho�t ��ng � khu v�c n�y �� k�t th�c.")
			Msg2SubWorld("5 ti�u k� � Nam Bi�n Kinh �� b� l�y h�t, ho�t ��ng � khu v�c n�y �� k�t th�c.")
			return 0
		end
		Msg2SubWorld("Nam Bi�n Kinh c�n"..flag_left.."ti�u k�.")
	end
end

function nothing()

end

function know_detail()
	Talk(7,"","<color=red>21h v� 23h m�i t�i t� 31/12/2005 ��n 05/01/2006<color> � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u m�i n�i s� xu�t hi�n 5 ti�u k�.","Sau khi nh�p chu�t v�o ti�u k�, ti�u k� s� �i theo b�n.","Khi mang ti�u k�, n�u ch�t, ��i b�n ��, r�t m�ng, ��u s� l�m m�t ti�u k�, ng��i ch�i kh�c c� th� tranh �o�t.","Mang ti�u k� v� g�p �o�t k� gi�o ��u c�ng b�n �� s� nh�n ���c ph�n th��ng.","Ng��i ch�i ti�n v�o b�n �� �o�t k�, v� ng��i ch�i ���c ti�u k� ��u kh�ng c� s� tr�ng ph�t PK.","��ng c�p y�u c�u: <color=red>t� c�p 10 tr� l�n<color>.","Ph�n th��ng: <color=yellow>T��ng qu�n gi�i ch�<color>, n�i c�ng t�ng 4%, ngo�i c�ng t�ng 4%.")
end

