Include("\\script\\task\\practice\\practice_head.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --�����Ľű�

function main()
    local nFaction = GetPlayerFaction();
    local faction_table = {
        "Thi�u L�m", "V� �ang", "Nga My", "C�i Bang", "���ng M�n", "Thi�n Ba D��ng ph�", "Ng� ��c"
    };
    local szMsg = "<color=green>Qu� �i h� t�ng nh�n<color>: Ta l�"..faction_table[nFaction].." Xa phu duy nh�t n�i n�y. C�n ta gi�p g� kh�ng?";
    if GetItemCount(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3]) >= 1 then
        Say(szMsg,
            3,
            "R�i kh�i/quit_practice",
            "Ti�p t�c tu luy�n/continue_practice",
            "Kh�ng c� g�/exit_say"
        );
    else
        Say(szMsg,
            2,
            "R�i kh�i/quit_practice",
            "Kh�ng c� g�/exit_say"
        );
    end;
end;

function quit_practice()
    --practice_end();
    NewWorld(GetTask(TASK_PRACTICE), GetTask(TASK_PRACTICE + 1), GetTask(TASK_PRACTICE + 2));
    --print("practice debug : quit_practice");
end;

function continue_practice()
    --��������һ��ʦ������
    local nFaction = GetPlayerFaction();
    if GetItemCount(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3]) >= 1 then
        DelItem(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3], 1);
        --˫�������ٶ�
        SetPopBoost(DOUBLE_SPEED);
        ContinueTimer(GetTrigger(TIME_PRACTICE));   --������ʱ��10Сʱ
        Msg2Player("T�c �� tu luy�n t�ng g�p ��i");
    else
        Talk(1,"","B�n kh�ng mang l�nh b�i s� m�n, kh�ng th� ti�p t�c tu luy�n!");
    end;
    --print("practice debug : continue_practice");
end;

function exit_say()

end;