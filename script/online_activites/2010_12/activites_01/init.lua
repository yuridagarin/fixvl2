--=============================================
--create by xiongyizhi 2010.11.2
--describe:Խ�ϰ�2010��12�»1 ��ʼ���ļ�
--=============================================

Include("\\script\\online_activites\\2010_12\\activites_01\\head.lua");--�ͷ�ļ�

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 1 then
        VET_201012_01_GivePlayerLoginItem();
    end
end

