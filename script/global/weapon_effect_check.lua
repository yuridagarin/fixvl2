--�ű����ƣ����ǿ����ű�
--�ű����ܣ�������ǿ����Ļص��ű�����Ҫ���ڿ����������ж�
--�߻��ˣ�ǿ��
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2008-1-12
--�����޸ļ�¼��
Include("\\script\\weaponeffect\\ling_add_main.lua")
function main(aptitude_name)
	--���ǵȼ��Ļ�ȡ���ж�
	local aptitude_level = 0
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			aptitude_level = i
			break
		end
	end
	if aptitude_level == 0 and aptitude_name ~= "H�m Thi�n" then
		return 0
	end
	--���ǿ��������ж�
	local lin_remian_sec_num  = GetTime() -  GetTask(Break_sky_get_sec_seq_TaskID) - (30 * 86400)
	if lin_remian_sec_num >= 0 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Linh ph�ch �� qu� h�n, kh�ng th� m�!")
		return
	else
		if aptitude_name == "H�m Thi�n" or aptitude_level == getn(Tb_aptitude_info) then
			return 1
		end
		local chk_flag = dostring(Tb_aptitude_info[aptitude_level][2]) 
		if chk_flag == 0 then
			Talk(1,"","<color=green>Nh�c nh�<color>: Hi�n kh�ng th� ��p �ng �i�u ki�n k�ch ho�t Linh ph�ch <color=yellow>"..aptitude_name.."<color>:"..Tb_aptitude_info[aptitude_level][6]..", t�m th�i kh�ng th� tri�u g�i Linh h�n.")
		end
		return chk_flag
	end
end
