--=============================================
--create by baiyun 2010.1.12
--describe:Խ�ϰ�2010��1�´��ڻ ���˺���ű�
--=============================================

Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");

function OnUse(nItemIdx)
	if GetLevel() < 73 then
		Talk(1,"","��ng c�p 73 tr� l�n m�i s� d�ng ���c v�t ph�m n�y!")
		return 0;
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","V� m�n ph�i kh�ng th� s� d�ng v�t ph�m n�y!")
		return 0;
	end	

    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, nItemIdx);
    	DoWait(16, 17, 10);
end
