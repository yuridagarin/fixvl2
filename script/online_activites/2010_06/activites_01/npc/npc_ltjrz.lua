--=============================================
--create by zhoulimei 2010.5.12
--describe:Խ�ϰ�2010��6�»1 ���������ӽű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_06\\activites_01\\head.lua");
function main()
    local nSex = GetSex();
    if gf_CheckEventDateEx2(VET_201006_01_GIVETOSON_STARTTIME, VET_201006_01_GIVETOSON_ENDTIME) == 0 then
        Talk(1, "", VET_201006_01_TB_STRING[19][nSex]);
        return 0;
    end
    
    vet_201006_01_give_to_son(1);
end