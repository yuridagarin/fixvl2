--�����Ժ�Ľ���

AwardExp = {
	20,
	50,
	360,
	630,
	1000,
	1800,
	3700,
	5700,
	16000,
	40000,
}

-- �ش���ȷ�ľ��齱��
function QuesAward()
--	 AddItem(1,0,2,1)
	 nLevel = GetAwardLevel()
	 nAddExp = AwardExp[nLevel / 10] 
	 nRandom = random(1,1000)
	
	 if ( nRandom == 999 ) then
		nAddExp = nAddExp * 20
	 end
	 
     ModifyExp(nAddExp)
end


--�����涨�������������ĳͷ�
function Punish(nParam)
	 UseSkillEnable(0)
	 if (nParam > 0) then
		Talk(1,"","<color=red>**<color>: B�n �� s� d�ng ch��ng tr�nh auto, s� b� b� t�, xin h�y y�u th�ch tr� ch�i, ��ng d�ng auto!")
	 else
		Talk(1,"","<color=red>**<color>: B�n �� s� d�ng ch��ng tr�nh auto, nh�n v�t s� b� ��ng b�ng, xin h�y y�u th�ch tr� ch�i, ��ng d�ng auto!")
	 end
end

--�ӱܴ���ĳͷ�
function PunishAnnouce(nParam)
	 UseSkillEnable(0)
	 Talk(1,"","<color=red>**<color>: B�n b� �i�m huy�t ��o, trong"..nParam.." ph�t b�n s� kh�ng th� s� d�ng v� c�ng!")
end

--�ָ��ӱܴ���ĳͷ�
function PunishEndAnnouce()
	 UseSkillEnable(1)
	 Talk(1,"","<color=red>**<color>: Huy�t ��o c�a b�n �� ���c gi�i, c� th� s� d�ng l�i v� c�ng!")
end

-- ���ٱ���ش���ȷ�Ľ���
function QuesAward2()
     Restore()
end

-- �������ε��������ͷź�Ĺ���
function ReleaseAnnouce()
	 Talk(1,"","<color=red>**<color>: Th�i gian th� h�nh c�a b�n �� ��, c� th� t�m cai ng�c �� r�i thi�n lao!")
end

-- �������ε�������һ���Ļ�¸��ʾ
function BribeAnnouce()
	 Talk(1,"","<color=red>**<color>: B�n �� � ��y ���c m�t th�i gian, c� th� t�m cai ng�c �� ra t�!")
end
