--=============================================
--create by TrojanPizza 2010.3.26
--describe:Խ�ϰ�2010��4�»3 ��ʼ���ļ�
--=============================================

Include("\\script\\online_activites\\2010_04\\activities_02\\head.lua");       --�ͷ�ļ�

function ServerStartUp(nStartTime, nEndTime)
    if DEBUG == 1 then
        print ("nStartTime = "..nStartTime);
        print ("nEndTime = "..nEndTime);
        print ("gf_CheckEventDateEx2(nStartTime, nEndTime) = "..gf_CheckEventDateEx2(nStartTime, nEndTime));
    end
    
    if gf_CheckEventDateEx2(nStartTime, nEndTime) == 1 then
        local nNpcIndex = 0;
        nNpcIndex = CreateNpc(VET_201004_02_TB_STRINGS[1][1], VET_201004_02_TB_STRINGS[1][2], 100, 1446, 2969);
        if DEBUG == 1 then
            nNpcIndex = CreateNpc("Nam nh�n ph��ng B�c2", "Li�u Nhu quan", 200, 1400, 2853);
            print ("nNpcIndex = "..nNpcIndex);
        end
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_02\\npc\\npc_businessman.lua");
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
end

