Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	
	--�
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk1()
		if nRet == 1 then
			return
		end
	end	
	
	--------------
	
	Talk(1,"","Sao m�i ng��i g�n ��y ��u l�n l��t d�n �i h�t?");
end;