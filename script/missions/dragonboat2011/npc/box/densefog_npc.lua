--����NPC�ű�
--by liubo

Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnDeath(launcher)
	SetNpcLifeTime(launcher,0)
	--������Ч
	PlaySound("\\sound\\vn\\effect\\effect_dispearA.WAV")
	--������Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(),966,2,0)
	--ħ����������
	CastState("state_illusion_latent",0,18*CONTINUE_TIME,1,201134)
	Msg2Player(tSTRING_FLOAT_BOX[4])	
end