--����ָ��ʹ
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function main()
    local szTalk = {
        "Oa Kh�u ��t nhi�n xua qu�n t�n c�ng Trung Nguy�n, ai n�y ��u c�m ph�n!"
    };
    local szSay = {
    	"Oa Kh�u ��t nhi�n xua qu�n t�n c�ng Trung Nguy�n, ai n�y ��u c�m ph�n!",
    	"Nh�n ���c b�o v�t ��i T�ng/GetCallBossItem"
    };
	if CheckTime(6) == 0 and CheckTime(0) == 0 then	--ֻ������������������ͻ��������
		TalkEx("", szTalk);
		return
	end;

    if GetTask(TASK_GQ_DELIVER) == 1 then
        receive_goods();
        return
    end;
    
    if GetTask(TASK_GQ_KILLWK_START) == 1 then
        local szSay = {
            "�a t� <sex> gi�p chuy�n v�t ph�m! Nh�ng hi�n Oa Kh�u xua qu�n ti�n v�o H�i T�n, kh�ng bi�t <sex>gi�p �u�i l� gi�c �i ���c kh�ng?",
            "Qu�c gia l�m nguy sao c� th� ��ng nh�n/kill_enemy",
            "Ta �ang b�n!/end_say"
        };
        SelectSay(szSay);
        return
    end;
	if QueryTimes() > 0 and (CheckTime(6) == 1 or CheckTime(5) == 1 or CheckTime(0) == 1)then
		SelectSay(szSay);
    else
    	TalkEx("", szTalk);
    end;
end;
