--2008���ڻȪ��pk������
--by vivi
--2008/01/16

Include("\\script\\online\\newyear08\\newyear08_head.lua");

tQuanzhou = {{1418,3178},{1454,3182},{1503,3192},{1555,3180},{1585,3106},{1526,3112},{1492,3078},{1451,3099},
{1419,3097},{1448,2985},{1491,2970},{1555,3006},{1575,3049},{1586,2895},{1533,2884},{1486,2929},{1443,2899}}

function enter_game()
	if get_spring_festival_state() == 1 then
		SetPlayerRevivalPos(100,100); --���������㣺Ȫ�ݱ�
		LeaveTeam();	--�뿪����
		SetPKFlag(2,0); --��ɱ״̬
		SetFightState(1);	--ս��״̬
		ForbidChangePK(1); --�����Ƿ�������Ҹı�PK״̬����Ϊ��ֹ����Ϊ����
		SetCreateTeam(1); --�ر���ӹ��ܣ�����������Ϊ�أ���Ϊ��
		CleanInteractive(); --�������		
		InteractiveEnable(0);	--��ֹ����
		SetDeathPunish(0);	--�������ͷ�
		local nRand = random(1,getn(tQuanzhou));
		NewWorld(108,tQuanzhou[nRand][1],tQuanzhou[nRand][2]);
	end
end

function leave_game()
	if get_spring_festival_state() == 1 then
		ForbidChangePK(0); --�����Ƿ�������Ҹı�PK״̬����Ϊ��ֹ����Ϊ����
		SetPKFlag(0,0);	--��PK״̬
		SetCreateTeam(0); --�ر���ӹ��ܣ�����������Ϊ�أ���Ϊ��
		InteractiveEnable(1);	--����
		SetDeathPunish(1);	--�������ͷ�
	end
end