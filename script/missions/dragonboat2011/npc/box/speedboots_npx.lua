--�ٶ�ѥ��NPC�ű�
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--������Ч
	PlaySound("\\sound\\vn\\effect\\effect_speed.WAV")
	--������Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(),968,2,0)
	--ħ����������
	CastState("state_move_speed_percent_add",100,18*30,1,201133)
	Msg2Player(tSTRING_FLOAT_BOX[3])
end