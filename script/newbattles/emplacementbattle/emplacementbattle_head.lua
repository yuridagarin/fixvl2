Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\position.lua");

BATTLE_TYPE = EMPLACEMENT_ID;	--ս������

ENTRANCE_POINT = 	--�����
{
	[SONG_ID] = {MAPID_SONG,1617,3360},
	[LIAO_ID] = {MAPID_LIAO,1839,3365},
};

EMPLACEMENT_POS = {1725,2904};	--��̨����

tKillPlayerBonus = --ɱ����ͬ�����������Ӧ���¼�ID
{
	[1] = BP_EMPLACEMENT_KILL_SOLDIER,	--ɱ��ʿ��
	[2] = BP_EMPLACEMENT_KILL_LOOEY,	--ɱ��Уξ
	[3] = BP_EMPLACEMENT_KILL_CAPTAIN,	--ɱ����ͳ
	[4] = BP_EMPLACEMENT_KILL_PIONEER,	--ɱ���ȷ�
	[5] = BP_EMPLACEMENT_KILL_GENERAL,	--ɱ����
	[6] = BP_EMPLACEMENT_KILL_MARSHAL,	--ɱ��Ԫ˧
};	

EMPLACEMENT_HURT_RANGE = 40;	--��̨ը���˺���Χ
EMPLACEMENT_HURT_PROBABILITY = 5;	--��̨ը�Ÿ��ʣ�����

DEATH_SCRIPT = "\\script\\newbattles\\emplacementbattle\\playerdeath.lua";

--����NPC������������NPC
function Create_Npc(sNpcName,nNum)
	if nNum <= 0 then
		return 0;
	end;
	local tPos = {};
	local npcIndex = 0;
	local sModelName = "";
	if sNpcName == "Th� d�n" then
		tPos = tNative_Pos;
		sModelName = "Th� d�n";
	elseif sNpcName == "V� binh Ph�o ��i" then
		tPos = tGuard_Pos;
		sModelName = "V� binh Ph�o ��i";
	end;
	local nNpcCount = getn(tPos);
	local nPosIndex = 0;
	for i=1,nNum do
		nPosIndex = mod(i,nNpcCount+1);
		npcIndex = CreateNpc(sModelName,sNpcName,MAPID,tPos[nPosIndex][1],tPos[nPosIndex][2]);
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\npc_death.lua");
	end;	
end;
--������̨
function Create_Emplacement(nCamp)
	local tbNpcName = 
				{
				[0] = "Ph�o ��i",
				[1] = "Ph�o ��i: T�ng",
				[2] = "Ph�o ��i: Li�u"
				};
	local npcIndex = CreateNpc("H�a ph�o h� h�i",tbNpcName[nCamp],MAPID,EMPLACEMENT_POS[1],EMPLACEMENT_POS[2]);
	SetCampToNpc(npcIndex,tCampNameP[nCamp]);	
	SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\emplacement_death.lua");	
end;

function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B�o r��ng chi�n tr��ng","B�o r��ng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
end;
--�����λ�ô���N������
function Create_Random_Pos_Box(nNum)
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B�o r��ng chi�n tr��ng","B�o r��ng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
function nothing()

end;