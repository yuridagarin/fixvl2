--08春节活动拜年npc触发脚本
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
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --删除触发器
		Talk(1,"","Ngi kh玭g ng th阨 h筺 n g苝 ta. Xin tr? v? t譵 Ni猲 S?.");
		return
	end
	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --删除触发器
	if nStep <= WIND_STEP_TOTAL then
		local nRand = randomx(1,getn(tWindNpc[nMapId][2]),nIdx);
		if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
			WriteLog("[Ho箃 ng n╩ m韎 08, k誸 n鑙 npc b? l鏸]: Ngi ch琲"..GetName().."Thi誸 l藀 k誸 n鑙 npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID)  th蕋 b筰, tr? WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". Tr? tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
			return 0;	--创建失败
		end	 
		SetTask(TASK_WIND_TABLE_IDX,nRand);
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,""," t?. Ta nghe n鉯 <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].." <color> c騨g c? n, ngi n猲 甶 ch骳 t誸 h緉.");
		Msg2Player("t譵"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Ch骳 t誸.");
	else
		SetTask(TASK_WIND_STEP,GetTask(TASK_WIND_STEP)+1);
		Talk(1,""," t?  ch髏 t誸 m鋓 ngi, tr? v? t譵 Ni猲 S?.");
		Msg2Player("Nhi謒 v? ch骳 t誸 ho祅 th祅h ho祅 th祅h nhi謒 v? ch骳 t誸, tr? v? t譵 Ni猲 S?.");
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