Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--�����ַ�������֧��

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 3 then
		strSay = {
							"Thi ��u �ang t� ch�c l� ��i chi�n (tr�n th� 1), ng��i ch�i tham gia thi ��u ��u c� th� nh�n ���c ph�n th��ng �i�m s�c kh�e t��ng �ng sau khi thi ��u k�t th�c.",
							"R�i kh�i tr�n ��a/LeaveMap",
							"T�m hi�u quy t�c l�i ��i/#Rule_Team(2)",
							"Kh�ng c� g�/no"
							}
	elseif GetMissionV(GAME_TYPE) == 4 then
		strSay = 	{
							"Thi ��u �ang t� ch�c l� ��i chi�n (tr�n th� 2), ng��i ch�i tham gia thi ��u m�i l�n ��nh b�i ��i th� c� th� nh�n ���c ph�n th��ng ti�n nh�t ��nh. ��u th� chi�n th�ng sau c�ng s� nh�n ���c ph�n th��ng phong ph�.",
							"R�i kh�i tr�n ��a/LeaveMap",
							"T�m hi�u quy t�c l�i ��i/#Rule_Team(3)",
							"Kh�ng c� g�/no"
							}
	else
		strSay = {
							"Hi�m khi c� d�p �� xem c�c ��i hi�p tr�n giang h� bi�u di�n v� ngh�, ��i khi h� ph�i ��nh ��i c� gia t�i m�i luy�n th�nh. L�n n�y ��ng d�p may! Ch�ng hay"..GetPlayerSex().."C� c�n g� kh�ng?",
							"R�i kh�i tr�n ��a/LeaveMap",
							"T�m hi�u quy t�c l�i ��i/#Rule_Team(1)",
							"Kh�ng c� g�/no"
							}
	end

	SelectSay(strSay)

end


--���Ҫ���뿪��������
function LeaveMap()

local i=0;

	if GetTaskTemp(PLAYER_CAMP) == 11 then
		DelMSPlayer(TEAM_MISSION_ID,0);
		return
	end

	--��ǰ�����˲��Ƕӳ�
	if PlayerIndex ~= gf_GetTeamMember(0) then
		Say("��i tr��ng m�i c� th� ��a ��i r�i kh�i ��u tr��ng!",0);
	else
		DelMSPlayer(TEAM_MISSION_ID,0);
	end
end

function GetPlayerSex()

local nSex = "";

	if GetSex() == 1 then
		nSex = "��i hi�p";
	else
		nSex = "N� hi�p ";
	end
	
	return nSex		

end

function Rule_Team(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"Qu�n h�ng chi�n ph�i c� 2 ��i ng� tr� l�n tham gia m�i c� th� m� chi�n ��a t� v�. M�i ��i ng� tham chi�n s� t� m�nh l�m ch�. ��i m�nh nh�t chi�n ��u ��n cu�i c�ng s� l� ��i chi�n th�ng!",
			"L�i ��i l�n n�y th� nghi�m t� ��i t� v� 1 ��i 1, ngo�i vi�c tr�c nghi�m c�ng l�c b�n th�n c�n c�n bi�t ���c s�ch l��c chi�n ��u kh�c nhau c�a c�c ��i th� m�nh y�u v� bi�n h�a c�a chi�n ��a �� gi�nh ���c chi�n th�ng cu�i c�ng. N�u c�c h� l� ng��i v� ��ch, ch�a t�m ���c ��i th�. H�y ��n ch�ng t� b�n l�nh c�a �o�n ��i trong h�n chi�n l�i ��i!",
			"Qu�n h�ng chi�n ph� th�ng cho ph�p ��i c� �t nh�t 2 ng��i t� c�p 10 tr� l�n �� gia nh�p m�n ph�i tham gia v� kh�ng c�n n�p ti�n. ���ng nhi�n, ��u th� chi�n th�ng c�ng kh�ng nh�n ���c ph�n th��ng n�o. Sau khi b�o danh th�nh c�ng s� c� 3 ph�t chu�n b�, h�t th�i gian s� t� ��ng khai chi�n. N�u s� ��i tham chi�n �t h�n 2 ��i, thi ��u s� b� h�y b�.",
			}
	elseif nType == 2 then
		strTalk = {
			"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n (tr�n th� 1), ng��i ch�i tham gia thi ��u ��u c� th� nh�n ���c ph�n th��ng �i�m s�c kh�e t��ng �ng sau khi thi ��u k�t th�c.",
			"Ch� c�n ��i c� t� 2 th�nh vi�n tr� l�n tr� l�n b�o danh, s� �� t� c�ch thi ��u. M�i ��i ng� tham chi�n s� t� m�nh l�m ch�. ��i m�nh nh�t chi�n ��u ��n cu�i c�ng s� l� ��i chi�n th�ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n (tr�n th� 2), ��i chi�n th�ng sau c�ng s� nh�n ���c ph�n th��ng phong ph�.",
			"Ch� c�n ��i c� t� 2 th�nh vi�n tr� l�n tr� l�n b�o danh, s� �� t� c�ch thi ��u. M�i ��i ng� tham chi�n s� t� m�nh l�m ch�. ��i m�nh nh�t chi�n ��u ��n cu�i c�ng s� l� ��i chi�n th�ng!",
			}
	end

	TalkEx("#Rule_Team_1("..nType..")",strTalk)

end

function Rule_Team_1(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"M�i tr�n, s� ng��i tham gia m�i ��i t�i �a l� 10 ng��i, th�i thi ��u l� 15 ph�t. H�t gi� thi ��u, ��i c�n l�i nhi�u ng��i h�n s� gi�nh chi�n th�ng.",
			"Ngo�i ra, trong khi thi ��u, b�t c� l�c n�o ��i tr��ng b� r�t m�ng ho�c v� th�nh th� ��i m�nh s� b� x� thua!",   
--			"��־ǿ������һ��ʱ���ڿ���Ķ�����̨�����⣬{�ɶ�}�����ض���ʱ��ٰ�{�ŶӼ�ս����}��ʱ��ֱ�Ϊ {����12:00}��{12:30}��{����18:00}��{18:30}��{����23:00}��{23:30}��",
--			"��־ǿ��{�ŶӼ�ս����}����Ҫ��{60����������������}��{2�����ϵĶ���}�μӣ��������ɶӳ�����{10��}��Ϊ�������볡���ã���һ��������ʤ��������Ի����Ӧ�Ľ������齱�������ڶ���������ʤ��������ɻ�÷��Ľ���",
--			"��־ǿ��ϣ����ʱ������̨��һ��"..GetPlayerSex().."��ķ�ɡ�",
			}
	elseif nType == 2 then
		strTalk = {
			"M�i tr�n, s� ng��i tham gia m�i ��i t�i �a l� 10 ng��i, th�i thi ��u l� 15 ph�t. H�t gi� thi ��u, ��i c�n l�i nhi�u ng��i h�n s� gi�nh chi�n th�ng.",
			"Ngo�i ra, trong khi thi ��u, b�t c� l�c n�o ��i tr��ng b� r�t m�ng ho�c v� th�nh th� ��i m�nh s� b� x� thua!",   
			"L�i ��i l�n n�y th� nghi�m h�n chi�n t� v�, ngo�i vi�c tr�c nghi�m c�ng l�c b�n th�n c�n c�n bi�t ���c s�ch l��c chi�n ��u kh�c nhau c�a c�c ��i th� m�nh y�u v� bi�n h�a c�a chi�n ��a �� gi�nh ���c chi�n th�ng cu�i c�ng.",
			"Hy v�ng c�c giang h� hi�p kh�ch tham gia ��ng ��!"..GetPlayerSex().."Phong th�i c�a b�n.",
			}
	elseif nType == 3 then
		strTalk = {
			"M�i tr�n, s� ng��i tham gia m�i ��i t�i �a l� 10 ng��i, th�i thi ��u l� 15 ph�t. H�t gi� thi ��u, ��i c�n l�i nhi�u ng��i h�n s� gi�nh chi�n th�ng.",
			"Ngo�i ra, trong khi thi ��u, b�t c� l�c n�o ��i tr��ng b� r�t m�ng ho�c v� th�nh th� ��i m�nh s� b� x� thua!",   
			"L�i ��i l�n n�y th� nghi�m h�n chi�n t� v�, ngo�i vi�c tr�c nghi�m c�ng l�c b�n th�n c�n c�n bi�t ���c s�ch l��c chi�n ��u kh�c nhau c�a c�c ��i th� m�nh y�u v� bi�n h�a c�a chi�n ��a �� gi�nh ���c chi�n th�ng cu�i c�ng.",
			"Hy v�ng c�c giang h� hi�p kh�ch tham gia ��ng ��!"..GetPlayerSex().."Phong th�i c�a b�n.",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
