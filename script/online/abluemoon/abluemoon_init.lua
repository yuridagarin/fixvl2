--���������СѾNPC�ű�,˳���һ��MISSION
tMap = {
	{"Ȫ��", 100, 1459, 2811},
	{"�꾩", 200, 1169, 2845},
	{"�ɶ�", 300, 1653, 3559},
	{"����", 350, 1436, 2808},
	{"����", 150, 1680, 3118},
	{"����", 400, 1485, 3018},
}

function abluemoon_init(nMapID)
	SubWorld = SubWorldID2Idx(tMap[nMapID][2]);
	AddGlobalNews("�ƿ�����СѾ�Ѿ���"..tMap[nMapID][1].."���¿�������ҸϿ�ǰȥ�μӽ���2��һ��ƾٿ��ԣ�")
	Msg2Global("�ƿ�����СѾ�Ѿ���"..tMap[nMapID][1].."���¿�������ҸϿ�ǰȥ�μӽ���2��һ��ƾٿ��ԣ�")	
	if SubWorld >= 0 then
		OpenMission(33);  
		npcIndex = CreateNpc("��СѾ","��СѾ",tMap[nMapID][2],tMap[nMapID][3],tMap[nMapID][4]);
		SetNpcLifeTime(npcIndex,1*60*60);  --NPC����ʱ��1Сʱ
		SetNpcScript(npcIndex,"\\script\\online\\abluemoon\\abluemoon_npc.lua");
		SetMissionV(10,npcIndex)
	end
end
