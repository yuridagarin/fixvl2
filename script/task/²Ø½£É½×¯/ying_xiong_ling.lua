

function yxl_killed()
    local Index,TemplateID,MonsterName = GetTriggeringUnit();
    --判断玩家是否是30级以上任务，如果是的话，就要看他是否在带新手，触发掉落英雄令
   if (GetLevel()>=30) then
       if (MonsterName=="Th? r鮪g"   or MonsterName=="Th? x竚" or MonsterName=="L璾 Manh"   or MonsterName=="C玭 "   or MonsterName=="S鉯 x竚" or MonsterName=="Thi誸 Gi竝 Tr飊g"
        or MonsterName=="S鉯 xanh" or MonsterName=="Heo r鮪g" or MonsterName=="Ong v祅g" or MonsterName=="B竎h Nh藅 Ti詎" or MonsterName=="Tr閙 v苩"   or MonsterName=="D琲"
        or MonsterName=="Ki誱 Kh竎h"   or MonsterName=="M? H莡" or MonsterName=="Phi t芻"   or MonsterName=="o Hi謕"   or MonsterName=="M穘h h?"   or MonsterName=="H? thi"
        or MonsterName=="N? ki誱 kh竎h" or MonsterName=="H祅h Thi" or MonsterName=="S鉯 甶猲") then
            local TeamNum = GetTeamSize();
            --计算队伍里面有多少个新手
            local myPlayerId = PlayerIndex;
            local myLevel = GetLevel();
            local NewerNum = 0;--新手数目
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
                    local LostNum = 0;--掉落概率,千分率
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

                    --给予英雄令
                    if (random(1,1000) <= LostNum) then
                        AddItem(2,0,31,1);
                    end;
                end;
            end;
        end;
    end;
end