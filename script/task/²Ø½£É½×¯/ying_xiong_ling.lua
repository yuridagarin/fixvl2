

function yxl_killed()
    local Index,TemplateID,MonsterName = GetTriggeringUnit();
    --�ж�����Ƿ���30��������������ǵĻ�����Ҫ�����Ƿ��ڴ����֣���������Ӣ����
   if (GetLevel()>=30) then
       if (MonsterName=="Th� r�ng"   or MonsterName=="Th� x�m" or MonsterName=="L�u Manh"   or MonsterName=="C�n ��"   or MonsterName=="S�i x�m" or MonsterName=="Thi�t Gi�p Tr�ng"
        or MonsterName=="S�i xanh" or MonsterName=="Heo r�ng" or MonsterName=="Ong v�ng" or MonsterName=="B�ch Nh�t Ti�n" or MonsterName=="Tr�m v�t"   or MonsterName=="D�i"
        or MonsterName=="Ki�m Kh�ch"   or MonsterName=="M� H�u" or MonsterName=="Phi t�c"   or MonsterName=="�ao Hi�p"   or MonsterName=="M�nh h�"   or MonsterName=="H� thi"
        or MonsterName=="N� ki�m kh�ch" or MonsterName=="H�nh Thi" or MonsterName=="S�i �i�n") then
            local TeamNum = GetTeamSize();
            --������������ж��ٸ�����
            local myPlayerId = PlayerIndex;
            local myLevel = GetLevel();
            local NewerNum = 0;--������Ŀ
            if (TeamNum>=2) then
                local OtherLevel = 0;
                for i=1,TeamNum do
		            PlayerIndex = GetTeamMember(i);
		            if (PlayerIndex~=myPlayerId) then
                        OtherLevel = GetLevel();
                        if (OtherLevel<30 and myLevel>=OtherLevel+9 and IsPlayerNear(myPlayerId)~=0) then
                            NewerNum = NewerNum+1;
                        end;
		            end;
	            end;
                PlayerIndex = myPlayerId;

                if (NewerNum > 0) then
                    local LostNum = 0;--�������,ǧ����
                        if (NewerNum == 1) then
                            LostNum = 30;
                    elseif (NewerNum == 2) then
                            LostNum = 50;
                    elseif (NewerNum == 3) then
                            LostNum = 70;
                    elseif (NewerNum == 4) then
                            LostNum = 100;
                    elseif (NewerNum == 5) then
                            LostNum = 70;
                    elseif (NewerNum == 6) then
                            LostNum = 50;
                    elseif (NewerNum == 7) then
                            LostNum = 30;
                    end;

                    --����Ӣ����
                    if (random(1,1000) <= LostNum) then
                        AddItem(2,0,31,1);
                    end;
                end;
            end;
        end;
    end;
end