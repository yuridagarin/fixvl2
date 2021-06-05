--����ս��Ի��ű�
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	local szNpcName = gf_GetSafeStr(GetNpcName(npcIndex));
	local szTongName = gf_GetSafeStr(GetTongName());
	if qht_check_condition() ~= 1 then
		return 0;
	end
	if IsTongMember() == 0 or GetTime() - GetJoinTongTime() < 24 * 3600 then
		Talk(1,"","Ng��i ch�a gia nh�p m�n ph�i ho�c th�i gian giap nh�p m�n ph�i ch�a �� 1 ng�y th� kh�ng th� nh�n th��ng");
		return 0;
	end
	if szNpcName ~= szTongName then
		Talk(1,"","Ng��i kh�ng ph�i th�nh vi�n c�a bang h�i kh�ng th� nh�n th��ng");
		return 0;
	end
	local npcLevel = GetNpcLevel(npcIndex);
	--��Ѫ����ս��
	if 2 == npcLevel then
		qht_DailyTaskReSet();
		if QHT_TASK_GROUP:GetTaskBit(QHT_TASK_GROUP.TongFlag, 2) ~= 0 then
			Talk(1,"","Ng��i �� nh�n th��ng r�i");
			return 0;
		end
		local tSay = {
			"Ta mu�n nh�n th��ng/qht_award_tong_fight_flag_tiexue",
			"Ra kh�i/nothing",
		}
		Say("<color=green>"..szNpcName..":<color> B�n bang c�p 80 tr� l�n,h�c �� k� n�ng c�p 55, nh�p bang qu� 1 ng�y, s� nh�n ���c ph�n th��ng phong ph� t�i ��y.",getn(tSay), tSay);
		return 1;
	end
	--����ս��
	if 1 == npcLevel then
		qht_DailyTaskReSet();
		if QHT_TASK_GROUP:GetTaskBit(QHT_TASK_GROUP.TongFlag, 1) ~= 0 then
			Talk(1,"","Ng��i �� nh�n th��ng r�i");
			return 0;
		end
		local tSay = {
			"Ta mu�n nh�n th��ng/qht_award_tong_fight_flag",
			"Ra kh�i/nothing",
		}
		Say("<color=green>"..szNpcName..":<color> B�n bang c�p 80 tr� l�n,h�c �� k� n�ng c�p 55, nh�p bang qu� 1 ng�y, s� nh�n ���c m�t ph�n th��ng t�i ��y.",getn(tSay), tSay);
		return 1;
	end
end

