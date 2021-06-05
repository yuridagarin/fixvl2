--08���ڻ����npc�����ű�
--by vivi
--2008/01/10

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nState = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nMapId = GetWorldPos();
	local nStep = GetTask(TASK_WIND_STEP);
		
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --ɾ��������
		Talk(1,"","Ng��i kh�ng ��ng th�i h�n ��n g�p ta. Xin tr� v� t�m Ni�n S�.");
		return
	end
	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --ɾ��������
	if nStep <= WIND_STEP_TOTAL then
		local nRand = randomx(1,getn(tWindNpc[nMapId][2]),nIdx);
		if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
			WriteLog("[Ho�t ��ng n�m m�i 08, k�t n�i npc b� l�i]: Ng��i ch�i"..GetName().."Thi�t l�p k�t n�i npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) �� th�t b�i, tr� WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". Tr� tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
			return 0;	--����ʧ��
		end	 
		SetTask(TASK_WIND_TABLE_IDX,nRand);
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,"","�a t�. Ta nghe n�i <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].." <color> c�ng c� ��n, ng��i n�n �i ch�c t�t h�n.");
		Msg2Player("t�m"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Ch�c t�t.");
	else
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,"","�a t� �� ch�t t�t m�i ng��i, tr� v� t�m Ni�n S�.");
		Msg2Player("Nhi�m v� ch�c t�t ho�n th�nh ho�n th�nh nhi�m v� ch�c t�t, tr� v� t�m Ni�n S�.");
	end
end

function randomx(a,b,c)
	local r = random(a,b-1);
	if r < c then
		return r;
	else
		return r+1;
	end
end