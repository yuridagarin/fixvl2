--=============================================
--create by zhangming 2010.7.15
--describe:Խ�ϰ�2010��8�»1 ��ʼ���ļ�
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--�ͷ�ļ�

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
        VET_20100801_GivePlayerLoginItem()
    end
end

