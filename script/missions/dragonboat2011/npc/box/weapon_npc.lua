--������NPC�ű�
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--������Ч
	PlaySound("\\sound\\vn\\effect\\effect_weapon.WAV")
	--������Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(),967,2,0)
	--ħ����������
	CastState("state_npc_event_2_magic",6553638,18*30,1,201131)
	Msg2Player(tSTRING_FLOAT_BOX[1])
end