Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(109,110,QHT_GAOJI_BOX_TIME);
end

function gaoji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thi?n T?m B?o R??ng c?p cao" then
		return 0;
	end
	if GetItemCount(2, 1, 30435) < 9 or GetCash() < 4000 then
		Talk(1,"",format("M? b?o r??ng c?n ti?u hao %d M?nh H? Ph? v? %d ti?n v?ng,ti?n v?ng tr?n ng??i kh?ng ?? th? kh?ng th? m?", 9, 3));
		return 0;
	end
	if DelItem(2, 1, 30435, 9) ~= 1 or Pay(4000) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_three(npcIndex);
	AddRuntimeStat(22, 4, 0, 1);
end