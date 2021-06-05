--�����޸�������ɼ��ܵȼ��쳣����
--ת�����ý�ɫ�ȼ�С��85�� ���������ؼ����������� ���½�ɫ���ɼ��ܵȼ��쳣
--�ҷ�Ŀǰ�ݶ����޸ķ���Ϊ��
--1.�޸��ؼ��������õ������ ���ɼ��ܵȼ��쳣������
--2.����һ��Npc���� ͨ��npc�Ի� �Զ����Ѿ��쳣�Ľ�ɫ���ɼ��ܵȼ�����Ϊ10����Ҫ��������������ؼ���
--�Զ����õ��ж�����Ϊ��a.����Ѿ���4ת��4ת����
--b.������ɼ��ܲ���10��
--��NPC����ʱ������Ϊ7�� 7��֮��ù�����Ч



Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
t_zhenpai_skill = --���ɼ���
{
	[2] = 32, --�����׼�
	[3] = 57,--��������
	[4] = 44,--��������
	[6] = 74,--����
	[8] = 89,--���ҷ��
	[9] = 102,--�����׼�
	[11] = 113,--ؤ�ﾻ��
	[12] = 124,--ؤ������
	[14] = 146,--�䵱����
	[15] = 159,--�䵱�׼�
	[17] = 732,--����ǹ��
	[18] = 745,--���Ź���
	[20] = 775,--�嶾а��
	[21] = 774,--�嶾��ʦ
}

function OnNpcTalkRepairGreatSkill()
	local nDate = tonumber(date("%Y%m%d"))
	if not (nDate >= 20130418 and nDate <= 20130511) then--���ڲ�����
		Talk (1,"",format("%s","T�nh n�ng kh�ng n�m trong th�i h�n c� hi�u l�c"))
		return
	end
	
	local szTitle = format("�i�u ki�n s�a ch�a k� n�ng tr�n ph�i: chuy�n sinh 4 tr� l�n, kh�ng c� ph� m�t t�ch trang b�, k� n�ng tr�n ph�i kh�ng �� 10 c�p")
	local tbSay = {}
	tinsert(tbSay, format("%s/_On_Repair","Th�a �� �i�u ki�n �� ph�c h�i k� n�ng tr�n ph�i"))
	tinsert(tbSay, "T� b�/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _On_Repair()
	local nSkillId = t_zhenpai_skill[GetPlayerRoute()]
	if not nSkillId then--�����쳣
		Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","�i�u ki�n kh�ng ph� h�p !"))
		return
	end
	if GetTranslifeCount() < 4 and GetPlayerRebornParam(0) < 1 then
		Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","�i�u ki�n kh�ng ph� h�p !!"))
		return
	end
	if GetPlayerEquipIndex(9) ~= 0 then--���ؼ�λ����װ��
		Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","�i�u ki�n kh�ng ph� h�p !!!"))
		return
	end
	
	if GetSkillLevel(nSkillId) >= 10 then--��������
		Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","�i�u ki�n kh�ng ph� h�p !!!!"))
		return
	end
	
	local nOldSkillLv = GetSkillLevel(nSkillId) or 0
	
	--ִ���޸�����
	if nOldSkillLv <= 0 then
		LearnSkill(nSkillId)
	end
	local nSkillNewLv = GetSkillLevel(nSkillId) or 0
	while nSkillNewLv < 10 do
		local nSkillLvBfUp = GetSkillLevel(nSkillId) or 0
		if LevelUpSkill(nSkillId) ~= 1 then
			Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","Th�t b�i"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail", 1, "Fix fail");
			break
		end
		nSkillNewLv = GetSkillLevel(nSkillId) or 0
		if nSkillNewLv <= nSkillLvBfUp then
			Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i","Th�t b�i"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail2", 1, "Fix fail2");
			break
		end
	end
	
	Talk (1,"",format("%s%s!","S�a ch�a k� n�ng tr�n ph�i"," th�nh c�ng "))
	local szLog = format("Role[%s] Route[%d] update greate skill[%d] from[%d]-->[%d] ",GetName(), GetPlayerRoute(), nSkillId, nOldSkillLv, nSkillNewLv)
	gf_WriteLogEx("repair great skill", szLog, "", "", "")
	gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update th�nh c�ng", 1, "Fix th�nh c�ng")

end

function no()
end

