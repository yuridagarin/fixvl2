--����Ӣ�������NPC�������꣨�꾩��

Include "\\script\\task\\teach\\teach_main.lua"
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\newbattles\\sign_up_npc.lua");

--g_sNpcName = "Tri�u Di�n Ni�n";
g_sNpcName = "Ti�u Ph��ng";
g_nNpcCamp = SONG_ID;

function main()
		if random(1,40) == 1 then
			NpcChat(GetTargetNpc(),"�� kh�ch l� t��ng s� ��i T�ng ta anh d�ng gi�t gi�c, nh�ng ai tham gia tr�n ��nh Nh�n m�n quan ��u ���c nh�n Linh Th�ch!");
		end;
    local nStep = GetTask(TASK_FIVE);
    if GetTask(TASK_ONE) == 101 then
        talk_one();
        return
    end;
    if GetTask(127) == 1 then   --�ĺ���֪ͨ����������
        talk_five();
        return
    end;
    
    local nStep = GetTask(1);
    if nStep == 21 then
        task_021_00();
        return
    elseif nStep == 22 then
        task_022_00();
        return
    elseif nStep == 23 then
        if GetLevel() >= 10 then
            task_023_00();
            return
        else
            Talk(1,"","��i ng��i ��t c�p 10 ch�ng minh ���c t� ch�t c�a m�nh m�i ��n t�m ta.");
            return
        end;
    end;
--   if GetTargetNpcName() == "Tri�u Di�n Ni�n" then
--		Talk(1,"","<color=green>Tri�u Di�n Ni�n<color>: Ch�n tr�i g�c bi�n !!!");
--		--return 0;
--	else
--		battle_main();
--	end
end

function talk_one()
    
    local szTalk = {
        "M�y ng�y kh�ng g�p <sex> qu� nhi�n ti�n b� h�n!",
        "Kh�u Chu�n ��i nh�n c�th� g�i cho ti�n b�i!",
        "Th� g�? ��a ta xem.....",
        "[Tri�u Di�n Ni�n m� th� ra xem xong suy ngh� h�i l�u]",
        "Kh�ng ng� s� vi�c l�i h� tr�ng ��n v�y. Ng��i ra s�c gi�p ��i T�ng, Tri�u m� n�y r�t kh�m ph�c. Kh�ng gi�u g� ng��i, ta ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}.",
        "Ra l� v�y! {Tr��ng Ca M�n}, {Thi�n �m gi�o} l�m ta r�i c� l�n, ti�n b�i gi�i th�ch m�t ch�t ���c kh�ng?"
    };
    
    if GetTask(TASK_ONE) == 101 then
        TalkEx("task_002_00", szTalk);
    end;
end;

function talk_five()
    local szMsg = {
        "V�n b�i ���c l�nh c�a H� H�u C�m ��n th�ng b�o v� m�nh S�n H� X� T�c g�n Giang Nam c� kh� n�ng r�i v�o tay b�n Xi H�a gi�o, h�n n�a th�n ph�n �ng ta b� b�i l�, xin xem qua b�c th� s� r�!",
        "�a t� ng��i!",
        "C�n nhi�u ng��i c�n ph�i th�ng b�o n�a, v�n b�i �i ��y!"
    };
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(127,2);
        DelItem(2,0,43,1);
        TalkEx("", szMsg);
    end;
end;

function task_002_00()
    local szTalk = {
        "Lai l�ch Tr��ng Ca M�n b�t ��u t� ng�y khai qu�c, sau khi Th�i T� ��i tr��c b�nh ��nh giang s�n B�i T�u Th�ch Binh Quy�n, c�c t��ng l�nh Th�ch Th� T�n, Cao Ho�i ��c, Tr��ng L�nh Phong, Tri�u Ng�n Huy ��u c�o l�o h�i h��ng. {Tri�u Ng�n Huy} ��i nh�n kh�ng cam c�nh c� ��n, �� li�n l�c v�i b�ng h�u giang h�, th��ng c�ng nhau ng�m th� ��i x��ng ho�c t� th� v� c�ng.",
        "V� sau nh�ng v� b�ng h�u n�y th�nh l�p th�nh m�t m�n ph�i. L�c �� trong ph�i nhi�u ng��i s�ng t�c nh�c l�m th� cho n�n m�i c� t�n {Tr��ng Ca M�n}. Vi�c c�n l�m l�c n�y l� th�ng b�o cho nh�ng huynh �� �y bi�t.",
        "Hi�n {4 ng��i} ��u �ang ph�ng m�nh �i�u tra, ta ph�i th�ng b�o cho {�u D��ng H�a} tr��c. {H� H�u C�m} � {D��ng Ch�u}, {C�ng T�n Th�} � {T��ng D��ng}, {Gia C�t K�} � {Giang T�n Th�n}, kh�ng bi�t <sex> c� th� gi�p ta th�ng b�o cho 3 v� kh�ng?",
        "V�n b�i �i ngay!"
    };
    TalkEx("task_002_000", szTalk);
end;

function task_002_000()
    local szTalk = {
        "C�m �n <sex>! Th�c ra B�ch Hi�u Sinh c�ng l� ng��i c�a Tr��ng Ca M�n, ng��i ��i g�i �ng ta l� {Tr� hi�p}. <sex> mu�n bi�t th�m v� Tr��ng Ca M�n c� th� ��n ��.",
        "�� ta ti�n b�i ch� d�n, sau khi th�ng b�o cho xong 3 v� ti�n b�i kia v�n b�i s� t�m {B�ch Hi�u Sinh} th�nh gi�o."
    };
    TalkEx("task_002_01", szTalk);
end;

function task_002_01()
    SetTask(TASK_ONE, 102);
    
    SetTask(124,1); --talk to �ĺ���
    SetTask(126,1); --talk to �����
    SetTask(125,1); --talk to ������
    
    Msg2Player("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    TaskTip("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    
    --���������Ұ�����
    SetTask(TASK_TWO, 1);
end;