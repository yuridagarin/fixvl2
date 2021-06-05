Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(107,108,QHT_ZHONGJI_BOX_TIME);
end

function zhongji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thi�n T�m B�o R��ng c�p trung" then
		return 0;
	end
	if GetItemCount(2, 1, 30435) < 6 or GetCash() < 1000 then
		Talk(1,"",format("M� b�o r��ng c�n ti�u hao %d M�nh H� Ph� v� %d ti�n v�ng,ti�n v�ng tr�n ng��i kh�ng �� th� kh�ng th� m�", 6, 1));
		return 0;
	end
	if DelItem(2, 1, 30435, 6) ~= 1 or Pay(1000) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_two(npcIndex);
	AddRuntimeStat(22, 3, 0, 1);
end