----------------[��˵����Ӧ����һ������]----------------
--------------------------------------------------------
--�ű�����:��������NPC���Ի��ű�                       |
--�ű�����:��������NPC�������                         |
--���ܿ�����:�����                                    |
--���ܿ���ʱ�䣺2009-12-28                             |
--��Ҫ�޸ļ�¼��                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc�ű����-----------------------------------------
function main()
	local tbSays = {}
	if CFG_NhiemVuDongHanh == 1 then
--		tinsert(tbSays, "Nhi�m v� ��ng h�nh/NhiemVuDongHanh_Menu")
	end
--	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect")          --�����������
--	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect")           --��װ�������
--	tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing")            --�պ���

    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
end