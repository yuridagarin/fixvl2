--talk to ��������
--created by lizhi
--2005-8-30 10:35

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()
    local nStep = GetTask(TASK_XY_ONE);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 2 then
        task_02_00();
        return
    elseif nStep == 3 then
        task_03_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    elseif nStep == 5 then
        task_05_00();
        return
    end;
    Talk(1,"","C�ng vi�c b� b�n, ti�p ��n kh�ng ���c n�ng nhi�t, xin mi�n ch�p!");
end;
        
function task_01_00()
    local szTalk = {
        "C�ng vi�c b� b�n, ti�p ��n kh�ng ���c chu ��o! Xin mi�n ch�p!",
    	"T�i h� ph�c m�nh C�ng T�n Th� ��n th�ng b�o qu�n t�nh.",
    	"Th� ra l� ng��i c�a C�ng T�n ti�n sinh. <sex> c� g� c�n th�ng b�o kh�ng?",
    	"Li�u Qu�c v� T�y H� �ang ��ng qu�n � Ph�c Ng�u S�n B�c, m�u toan ��nh chi�m Ki�m M�n Quan. Vi�c n�y r�t g�p, mong T�ng binh chu�n b� nh�n m� �� �ng chi�n. T�i h� c� mang theo t�m b�n �� c�a Ph�c Ng�u S�n xin ng��i xem qua.",
    	"M�y ng�y g�n ��y t�nh h�nh ngo�i �i kh�c th��ng, th� ra l� qu�n Li�u �ang �i�u ��ng binh m�. Th�t �a t� <sex> v� C�ng T�n ti�n sinh �� v�t v�.  Ta c�ng ch�nh ��n nh�n m� chu�n b� xu�t binh, v�ic n�y quan tr�ng kh�ng th� ch�m tr� ���c. <sex> t�m th�i ngh� ng�i nh�!",
    	"Qu�c gia c� th�nh v��ng th� b� t�nh m�i an vui ���c! T�i h� l�m sao c� th� ng�i y�n nh�n b�n gi�c ng�ng cu�ng nh� v�y ���c. H�y �� cho t�i h� ���c ��ng g�p m�t ch�t c�ng s�c.",
    	"<sex>! Ta �� nghi�n c�u k� s� ��! Li�u qu�n � Ph�c Ng�u S�n chia l�m 2 nh�nh, m�i b�n ��u c� {L�u canh}. <sex> t�m c�ch x�m nh�p v�o {��t 2 l�u canh} c�a ch�ng.  Th�a l�c Li�u qu�n ho�ng lo�n ta s� ��a binh x�ng v�o nh�t ��nh s� chi�m ���c hai doanh tr�i c�a ch�ng.",
        "Th�t l� di�u k�! T�i h� s� �i {��t 2 l�u canh} c�a ch�ng!"
    };
    TalkEx("task_01_01", szTalk);
end;


function task_01_01()
    AddItem(2,0,70,2);
    SetTask(TASK_XY_ONE, 2);
    Msg2Player("Ph�ng h�a g�c canh qu�n Li�u");
    TaskTip("Ph�ng h�a g�c canh qu�n Li�u");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyBJKouzhun,"yehuoliangyuan")		--������·
end;

function task_02_00()
    local szTalk = {
        "<sex> c� th� l�m chuy�n n�y kh�ng?",
        "Qu�n li�u canh ph�ng nghi�m ng�t, g�c canh ki�n c� m�t �t thu�c n� v�y e l� kh�ng ��",
        "<sex> c�n bao nhi�u qu�n d�ng xin c� n�i!"
    };
    local szMsg = {
        "Qu�n Li�u � Ph�c Ng�u S�n chia l�m hai nh�nh, m�i b�n ��u c� {L�u canh}. <sex> h�y c�n th�n nh�!"
    };
    if GetItemCount(2,0,70) < 2 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_02_01()
    AddItem(2,0,70,2);
end;

function task_03_00()
    local szTalk = {
        "<sex> tu�i tr� t�i cao! {Ph� ���c 2 L�u canh} khi�n nhu� kh� ��ch qu�n gi�m s�t r�t nhi�u!",
        "C�ng l� nh� m�u k� c�a T�ng binh. Nh�n l�c qu�n Li�u ho�ng lo�n sao ta kh�ng th�a th�ng x�ng l�n ti�u di�t s�ch b�n ch�ng?",
        "Ta c� � nh� th� n�y, qu�n Li�u th� l�c tuy m�nh nh�ng binh ph�p r�t k�m, l��ng th�o nu�i qu�n ch�ng kh�ng bi�t b�o qu�n. Chi b�ng ta c��p s�ch l��ng th�o th� kh�ng c�n ��nh ch�ng c�ng th�t b�i r�i.",
        "Hi�n nay �ang l� m�a kh�, d�ng h�a l� c�ch t�t nh�t. C� l� t�i h� ph�i ��n Ph�c Ng�u S�n l�n n�a. {��t l��ng th�c qu�n ��ch}"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_XY_ONE, 4);
    AddItem(2,0,70,1);
    Msg2Player("Ph�ng h�a ��t l��ng th�c qu�n Li�u");
    TaskTip("Ph�ng h�a ��t l��ng th�c qu�n Li�u");
    --GivePlayerAward("Level_32", "easy");
end;

function task_04_00()
    local szTalk = {
        "L��ng th�c ch�ng mang theo r�t nhi�u, h�a d��c kh�ng �� d�ng",
        "<sex> c�n bao nhi�u qu�n d�ng xin c� n�i!"
    };
    local szMsg = {
        "L��ng th�o qu�n Li�u kh�ng ���c canh gi�, ��y l� c� h�i t�t <sex> mau ��ng th� �i!"
    };
    if GetItemCount(2,0,70) < 1 then
        TalkEx("task_04_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_04_01()
    AddItem(2,0,70,1);
end;

function task_05_00()
    local szTalk = {
        "<sex> qu� l� tu�i tr� t�i cao.",
        "�a t� T�ng binh! M�t ch�t c�ng s�c kh�ng ��ng l� bao!"
    }
    TalkEx("",szTalk);
end;