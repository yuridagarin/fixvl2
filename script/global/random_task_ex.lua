--�ű����ƣ�RandomTaskTipEx�ص��ű�
--�ű����ܣ�RandomTaskTipEx��("xxxxxx", "yyyyyy")��:xxxxxxxxxΪ�Ի����ݣ�yyyyyyyyΪ���ű��ж�Ӧ�ĺ���
--			������������ѯ�峤����־
--�߻��ˣ��峤
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-05-23
--�����޸ļ�¼��
--=====================================��鼼�ܻص����========================================
random_tasktip_taskID = 1226
--************************�ص�������**********************

Include("\\script\\master_prentice\\some_op.lua")

function ma_trans_dia()
	local task_diff = GetTask(random_tasktip_taskID)
	--����������󼴷���
	if task_diff ~= 2 and task_diff ~= 4 then
		return
	end
	--��������򷵻�
	if IsPlayerDeath() == 1 then
		return
	end
	local ma_trans_dia = ""
	if task_diff == 2 then
		ma_trans_dia = "Khu v�c hi�n t�i "
	else
		ma_trans_dia = "{c�nh}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "Ng��i ch�i"
	else
		mate_sex = "Tha"
	end
	SetTask(random_tasktip_taskID,0)
	Say("<color=yellow>ch� d�n<color>: ��ng ��i y�u c�u b�n chuy�n ��n "..mate_sex..ma_trans_dia..", ��ng � kh�ng?",
	2,
	"��ng �/#ma_trans_callback("..task_diff..")",
	"Kh�ng ��ng �/Main_Exit"
	)
end
--���޴��ͻص�
function ma_trans_callback(task_diff)
	--����Ҫ�õ���ż���꣬����Ҫ������ż
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("��ng ��i kh�ng l�n m�ng!")
		return
	end
	--��̯״̬�޷�����
	if IsStalling() == 1 then
		Msg2Player("Tr�ng th�i b�y b�n kh�ng th� truy�n t�ng!")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "��ng ��i � tr�ng th�i b�y b�n!")
		return
	end	
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_callback", tostring(task_diff))
end

function momentumtip()
	Say("Nh�n th�y ch� s� tr�n khung k� n�ng s�ng l�n ch�a? �� l� tr� s�t kh�, cho b�n bi�t tr� s�t kh� hi�n th�i, t�y � di chuy�n v� tr�.", 0)
end

-- ʦͽ
function _prentice_see_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	Say("S� ph� g�i b�n k�a, sao h�?", 2, "��ng �/prentice_yes_la", "Kh�ng ��ng �/prentice_no_la")
end

function prentice_yes_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu v�c hi�n t�i kh�ng th� h� ho�n", 0)
		DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala_err", GetName())
		return
	end
	
	if IsPlayerDeath() == 1 then
		Msg2Player("� tr�ng th�i t� vong kh�ng th� tri�u g�i.")
		return
	end
	if IsStalling() == 1 then
		Msg2Player("�ang b�y b�n kh�ng th� tri�u g�i.")
		return
	end
	if IsReading() == 1 then
		Msg2Player("�ang tu luy�n m�t t�ch kh�ng th� tri�u g�i.")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
		Msg2Player("Ch� �� PK b�n ngo�i kh�ng th� tri�u g�i.")
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala", GetName())
end

function prentice_no_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_refuse_la", GetName())
end
