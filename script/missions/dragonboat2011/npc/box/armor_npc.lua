--���׼�NPC�ű�
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--������Ч
	PlaySound("\\sound\\vn\\effect\\effect_arm.WAV")
	--������Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(),969,2,0)
	--ħ����������
	CastState("state_receive_half_damage",100,18*30,1,201132)
	Msg2Player(tSTRING_FLOAT_BOX[2])	
end