Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--�����ַ�������֧��

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 1 then
		strSay = {
							"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n (tr�n th� 1), ng��i ch�i tham gia thi ��u ��u c� th� nh�n ���c ph�n th��ng �i�m s�c kh�e t��ng �ng sau khi thi ��u k�t th�c.",
							"R�i kh�i tr�n ��a/LeaveTalk",
							"T�m hi�u quy t�c l�i ��i/#Rule_Hundred(2)",
							"Kh�ng c� g�/no"
							}
	elseif GetMissionV(GAME_TYPE) == 2 then
		strSay = 	{
							"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n (tr�n th� 2), ng��i ch�i tham gia thi ��u m�i l�n ��nh b�i ��i th� c� th� nh�n ���c ph�n th��ng ti�n nh�t ��nh. ��u th� chi�n th�ng sau c�ng s� nh�n ���c ph�n th��ng phong ph�.",
							"R�i kh�i tr�n ��a/LeaveTalk",
							"T�m hi�u quy t�c l�i ��i/#Rule_Hundred(3)",
							"Kh�ng c� g�/no"
							}
	else
		strSay = {
							"Hi�m khi c� d�p �� xem c�c ��i hi�p tr�n giang h� bi�u di�n v� ngh�, ��i khi h� ph�i ��nh ��i c� gia t�i m�i luy�n th�nh. L�n n�y ��ng d�p may! Ch�ng hay"..GetPlayerSex().."C� c�n g� kh�ng?",
							"R�i kh�i tr�n ��a/LeaveTalk",
							"T�m hi�u quy t�c l�i ��i/#Rule_Hundred(1)",
							"Kh�ng c� g�/no"
							}
	end

	SelectSay(strSay)

end

function LeaveTalk()

	Talk(1,"LeaveMultiMap","Hy v�ng l�n sau c� d�p tr� l�i n�i n�y xem ��u l�i ��i!"..GetPlayerSex().."Phong th�i c�a b�n.");

end


--���Ҫ���뿪��������
function LeaveMultiMap()

local nCamp = GetTaskTemp(PLAYER_CAMP)

	--�����볡
	if nCamp == 2 then
		DelMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);		
	--ѡ���볡	
	elseif nCamp == 1 then
		Msg2MSAll(GetName().." �� r�i kh�i tr�n ��a.");
		DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
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

function Rule_Hundred(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
		"Qu�n h�ng chi�n ph�i do 2 ho�c nhi�u h�n c�c hi�p kh�ch giang h� tham gia m�i c� th� m� chi�n ��a t� v�. M�i ��u s� tham chi�n s� t� m�nh l�m ch�. ��u th� m�nh m� chi�n ��u ��n cu�i c�ng s� l� ng��i chi�n th�ng!",
		"Qu�n h�ng chi�n l�n n�y th� nghi�m t� v� 1 ��i 1, ngo�i vi�c tr�c nghi�m c�ng l�c b�n th�n c�n c�n bi�t ���c s�ch l��c chi�n ��u kh�c nhau c�a c�c ��i th� m�nh y�u v� bi�n h�a c�a chi�n ��a �� gi�nh ���c chi�n th�ng cu�i c�ng. N�u c�c h� l� ng��i v� ��ch tr�n tr�n ��n ��u l�i ��i 1 ��i 1, ch�a t�m ���c ��i th�. H�y ��n ch�ng t� b�n l�nh c�a m�nh trong tr�n Qu�n h�ng chi�n!",
		"Qu�n h�ng chi�n ph� th�ng: cho ph�p hi�p kh�ch giang h� c�p 10 tr� l�n �� gia nh�p m�n ph�i tham gia v� kh�ng c�n n�p ti�n. ���ng nhi�n, ng��i chi�n th�ng c�ng kh�ng nh�n ���c ph�n th��ng n�o. Sau khi m�i v�o chi�n ��a th�nh c�ng s� c� th�i gian chu�n b� l� 3 ph�t, h�t th�i gian s� t� ��ng khai chi�n. N�u s� ng��i tham chi�n �t h�n 1 ng��i, thi ��u s� b� h�y b�.",
		}
	
	elseif nType == 2 then
		strTalk = {
			"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n- tr�n th� 1, ng��i ch�i tham gia thi ��u ��u c� th� nh�n ���c ph�n th��ng �i�m s�c kh�e t��ng �ng sau khi thi ��u k�t th�c.",
			"M�i ��u th� tham chi�n s� t� m�nh l�m ch�. ��u th� m�nh m� chi�n ��u ��n cu�i c�ng s� l� ng��i chi�n th�ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi ��u �ang t� ch�c l� Qu�n h�ng chi�n- tr�n th� 2, ng��i ch�i tham gia thi ��u m�i l�n ��nh b�i ��i th� c� th� nh�n ���c ph�n th��ng ti�n nh�t ��nh. ��u th� chi�n th�ng sau c�ng s� nh�n ���c ph�n th��ng phong ph�.",
			"M�i ��u th� tham chi�n s� t� m�nh l�m ch�. ��u th� m�nh m� chi�n ��u ��n cu�i c�ng s� l� ng��i chi�n th�ng!",
			}
	end

	TalkEx("#Rule_Hundred_1("..nType..")",strTalk)

end

function Rule_Hundred_1(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
			"M�i tr�n, s� ng��i tham chi�n t�i �a l� 100 ng��i, th�i gian thi ��u l� 15 ph�t. Khi k�t th�c, b�n n�o c�n l�i nhi�u ng��i h�n s� chi�n th�ng! N�u s� ng��i c�n l�i b�ng nhau th� b�n n�o l�c v�o �t h�n s� chi�n th�ng!",
--			"��־ǿ������һ��ʱ���ڿ���Ķ�����̨�����⣬{�ɶ�}�����ض���ʱ��ٰ�{����Ӣ�۴���}��ʱ��ֱ�Ϊ {����11:00}��{11:30}��{����17:00}��{17:30}��{����21:00}��{21:30}��",
--			"��־ǿ��{����Ӣ�۴���}����Ҫ��{60����������������}�Ľ�����ʿ�μӣ���һ��������ʤ���߿��Ի����Ӧ�Ľ������齱�������ڶ���������ʤ���߸��ɻ�÷��Ľ���",
--			"��־ǿ��ϣ����ʱ������̨��һ��"..GetPlayerSex().."��ķ�ɡ�",
			}
	
	elseif nType == 2 then
		strTalk = {
			"M�i tr�n, s� ng��i tham chi�n t�i �a l� 100 ng��i, th�i gian thi ��u l� 15 ph�t. Khi k�t th�c, b�n n�o c�n l�i nhi�u ng��i h�n s� chi�n th�ng! N�u s� ng��i c�n l�i b�ng nhau th� b�n n�o l�c v�o �t h�n s� chi�n th�ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"M�i tr�n, s� ng��i tham chi�n t�i �a l� 100 ng��i, th�i gian thi ��u l� 15 ph�t. Khi k�t th�c, b�n n�o c�n l�i nhi�u ng��i h�n s� chi�n th�ng! N�u s� ng��i c�n l�i b�ng nhau th� b�n n�o l�c v�o �t h�n s� chi�n th�ng!",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
