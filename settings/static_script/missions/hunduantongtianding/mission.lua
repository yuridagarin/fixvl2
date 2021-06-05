Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\online_activites\\task_values.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

---------------------------------------------------------
function main()
	local nNpcIDX = GetTargetNpc();
	local tCurPhase = this.msPhases[1]:getPhase();
	if GetMissionV(this.mv23) ~= 0 then
		local nStep = GetMissionV(MV_STAGE);
		if nStep == 7 or nStep == 8 then
			Say("M� B�o R��ng Th�ng Thi�n m�i c� th� r�i �i",1,"\nTa bi�t r�i/ttd_nothing");
			return 0;
		else
			Say("M� B�o R��ng Th�ng Thi�n m�i c� th� v�o �i ti�p theo",1,"\nTa bi�t r�i/ttd_nothing");--,"\n�뿪�ؿ�/ttd_askClose");
			return 0;
		end
	end
	if tCurPhase and tCurPhase.onTalk then
		--print("main")
		tCurPhase:onTalk(nNpcIDX);
	end
end

function onPlayerDeath(nkiller)
	local tCurPhase = this.msPhases[1]:getPhase();
--	print("tCurPhase ,",tCurPhase)
--	print("tCurPhase.onPlayerDeath ,",tCurPhase.onPlayerDeath)
	if tCurPhase and tCurPhase.onPlayerDeath then
--		print("tCurPhase:onPlayerDeath")
		tCurPhase:onPlayerDeath(nkiller);
	end
end

function onNpcDeath(npcIdx, f, x)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onNpcDeath then
		tCurPhase:onNpcDeath(npcIdx);
	end
end

function OnDeath(id, f, x)
--	print("OnDeath",PlayerIndex, id, f, x);
--	print("PlayerIndex =",PlayerIndex);
--	print("f = ",f);
--	print("x = ",x)
	if f == nil then
		--print(format("onPlayerDeath(%d)",id));
		onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		--print(format("onNpcDeath(%d)",id));
		--print("id =",GetNpcName(id));
		--print("x =",GetNpcName(x));
		onNpcDeath(id, f, x);
	end
end

function onTrap(id)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onTrap then
		tCurPhase:onTrap(id);
	end
end
----------------------------------------------------------------------
--cycPhase.DEBUG = 1;

function cycPhase:onPlayerDeath(nkiller)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --��ʱ������
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "Tr��c khi v��t �i",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight00:createSomeNpc()
	local nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
	ttd_ChangeNpc2Talk(nNpcIDX);
	nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
	ttd_ChangeNpc2Talk(nNpcIDX);
	ttd_createWRD(); --���ʵ�
end

function stageFight00.init()
	self = stageFight00;
	--��ʼ�������-----------------------------------
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		tNpcInfo[m] = {};
	end
	--------------------------------------------------

	SetMissionV(this.mv21,0);
	SetMissionV(this.mv23,0);
	self:createSomeNpc();
	local tTraps = {
		{m, {1468,2944},{1468,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1468,2944},{1490,2944}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1490,2944},{1490,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1490,2964},{1468,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight00.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight00.checkPos()
	self = stageFight00;
	local nLFidx = ttd_findNpc("H��ng V�n Thi�n");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local nDialog = GetMissionV(this.mv21);
--	if nDialog ~= 0 then
		if nDialog >= 10 then --�ϻ�˵�꿪��
			self:onFinish();
		else
			SetMissionV(this.mv21,nDialog+1);
			local tDialogs = {
				{nQRSidx,"N�i n�y l� Th�ng Thi�n Huy�n C�nh, h�y b�o tr�ng, l�t n�a kh� tr�nh kh�i m�t tr�n ��i chi�n. "},
				{nLFidx,"Th�n Gi�o Tinh Anh �� t� t�p ��y ��, c� th� t�n c�ng b�t c� l�c n�o."},
				{nQRSidx,"T�n c�ng!"},
				{nLFidx,"Ph�a tr��c l� S�n M�n kh�ng bi�t ai �ang tr�n th�."},
				--{nLFidx,"�˴���ɽ��Ҫ����ͨ�����������ԭ���飬����ǿ���ڴ����أ���ʦ�����򲻿���С�"},
			};
			if mod(nDialog+1,2) == 0 then
				local tTemp = tDialogs[(nDialog+1)/2];
				if tTemp then
					NpcChat(tTemp[1],tTemp[2]);
				end
			end
		end
--	end
end

----------------------------------------------------------------------
stageFight00 = inherit(cycPhase, stageFight00);

stageFight00.actions = {
	[1] = stageFight00.init,
};
stageFight00.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight00.checkPos,
	},
};
----------------------------------------------------------------------

stageFight0 = {
	name = "B�a t�i cu�i c�ng",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight0:createSomeNpc()
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	if nNpcIDX == 0 then
		nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
		ttd_ChangeNpc2Talk(nNpcIDX);
	end
	local nNpcIDX = ttd_findNpc("H��ng V�n Thi�n");
	if nNpcIDX == 0 then
		nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
		ttd_ChangeNpc2Talk(nNpcIDX);
	end
	ttd_createWRD(); --���ʵ�
	this:Msg2MSAll("��i tr��ng h�y ��i tho�i v�i Nh�m Doanh Doanh m� �i!");
	this.msCamp:turnPlayer(0,HeadMsg2Player,"��i tr��ng h�y ��i tho�i v�i Nh�m Doanh Doanh m� �i!");
end

function stageFight0:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 1: Huy�t Chi�n S�n M�n/#stageFight0.gotoOne(1)",
			"\n M� �i th� 1: Huy�t Chi�n S�n M�n (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight0.gotoOne(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: T�i h� nh�t ��nh ph�i t�m ���c cha.",
			getn(strtab),
			strtab)
	end
end

function ttd_tiaoguan()
	local strtab = {
		"�i th� 2/#ttd_tg_choose(2)",
		"�i th� 3/#ttd_tg_choose(3)",
		"�i th� 4/#ttd_tg_choose(4)",
		"�i th� 5/#ttd_tg_choose(5)",
		"�i th� 6/#ttd_tg_choose(6)",
		"�i th� 7/#ttd_tg_choose(7)",
		"K�t th�c ��i tho�i/nothing",
	}
	Say("��ng ��o �i ��u?",
		getn(strtab),
		strtab)
end

function ttd_tg_choose(nType)
	local nCurState = nType-1
	local tcurPhaseLv = {2,4,6,8,10,12,14,14};
	if nCurState == 7 then
		nCurState = nCurState - 1;
	end
	SetMissionV(MV_STAGE,nCurState);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tbResetPos[nCurState][1],tbResetPos[nCurState][2]);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	local nCurLv = tcurPhaseLv[nType];
	SetMissionV(firePhases.curPhaseLv,nCurLv);
	local tCurPhase = firePhases:getPhase();
	tCurPhase:onInit(firePhases);
end

function stageFight0.gotoOne(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv1,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[1]);
	SetNpcActivator(nNpcIDX);
	nNpcIDX = ttd_findNpc("H��ng V�n Thi�n");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[1]);
--	ds_HDTTD:AddStatValue(1,3+nType,1);
end

function stageFight0.init()
--	print("GetMissionV(MV_MAP_ID)",GetMissionV(MV_MAP_ID))
	self = stageFight0;
--	SetMissionV(firePhases.curPhaseLv,1);
	self:createSomeNpc();
end

--function stageFight0.onFinish()
--	self = stageFight0;
--	firePhases:onFinish();
--end

function stageFight0.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight0.checkPos()
	self = stageFight0;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[1]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[1][nMax][1])^2+(nPosY-tQrsMovePos[1][nMax][2])^2));
	if nDistance <= 3 then --3����
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight0 = inherit(cycPhase, stageFight0);

stageFight0.actions = {
	[1] = stageFight0.init,
};
stageFight0.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight0.checkPos,
	},
};

---------------------------------------------------------
stageFight1 = {
	name = "C�a �i th� nh�t: Huy�t Chi�n S�n M�n",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Huy�t Chi�n S�n M�n",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

function stageFight1:createSomeNpc()
	ttd_createSomeNpc(tNpcs.tyss,tPos.tyss);
	ttd_createSomeNpc(tNpcs.wlrs1,tPos.wlrs1);
	ttd_createSomeNpc(tNpcs.wlrs2,tPos.wlrs2);
	ttd_createSomeNpc(tNpcs.wlrs3,tPos.wlrs3);
	ttd_createSomeNpc(tNpcs.wlrs4,tPos.wlrs4);
	ttd_createSomeNpc(tNpcs.wlrs5,tPos.wlrs5);
	local nBossIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1_init);
	ttd_ChangeNpc2Talk(nBossIDX);
end

function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Huy�t H�u Ti�u D��ng" then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"���c, l�p ��i c�ng b�m b�o ngay.");
		local nXwtIDX = ttd_findNpc("H��ng V�n Thi�n");
		NpcChat(nXwtIDX,"Huy�t H�u Ti�u D��ng n�i r�ng L�o T� �ang luy�n Ph� Th� ��i Ph�p, t�i h� �i �i�u tra xem c� th� ph� h�y �m m�u c�a L�o T� hay kh�ng");
		NpcChat(nQRSidx,"Th�i ���c,  H��ng H� Ph�p h�y c�n th�n.");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(1,strNpcName);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
	elseif strNpcName == "Th�n Gi�o Tinh Anh" then
		self:bossRestore();
		SetCurrentNpcSFX(nNpcIDX,954,2,0,18*3);
	end
end

function stageFight1:onPlayerDeath(nKiller)
	if self.DEBUG == 1 then
		print("stageFight1:onPlayerDeath")
	end
	self:bossRestore();
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --��ʱ������
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end

function stageFight1:bossRestore()
	local nNpcIDX = ttd_findNpc("Huy�t H�u Ti�u D��ng");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	--print("NpcChat nNpcIDx =",nNpcIDX);
	--print("NpcChat nQrSidx =",nQRSidx);
	if nNpcIDX ~= 0 then
		NpcChat(nNpcIDX,"Tr�n chi�n sinh t� l� ph�i m�ng ��i m�ng, m�u �� ��u r�i, quy�t chi�n t�i c�ng.");
		NpcChat(nQRSidx,"H�y c�n th�n b�n t� ma ngo�i ��o n�y gi�t ng��i h�t m�u �� h�i ph�c ch�n kh�, v� c�ng d� man!");
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIDX,1);
		local nAddLife = min(floor(nMaxLife*0.1),nMaxLife-nCurLife);
		ModifyNpcData(nNpcIDX,0,nAddLife,1);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"Huy�t H�u Ti�u D��ng h�i sinh");
	end
end

function stageFight1:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[1][1], tbTraps[1][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap1.lua"},
		{m, tbTraps[1][3], tbTraps[1][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap1.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight1:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight1.init()
	self = stageFight1;
--	SetMissionV(firePhases.curPhaseLv,2);
	SetMissionV(MV_STAGE,1);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv1); --������ҵ���ӯӯ����
end

function stageFight1.npcFunnyChat()
	local nNpcIDX = ttd_findNpc("Th�ng Thi�n T� V�");
	--print("nNpcIdx = ",nNpcIDX);
	NpcChat(nNpcIDX,"K� n�o to gan d�m x�ng v�o Th�ng Thi�n Huy�n C�nh !");
	local nRyyIDX = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nRyyIDX,"Nh�m Doanh Doanh �i n� Nh�m Ng� H�nh");
	local nXwtIDX = ttd_findNpc("H��ng V�n Thi�n");
	NpcChat(nXwtIDX,"H��ng V�n Thi�n H� Ph�p Nh�t Nguy�t Th�n Gi�o");
	NpcChat(nNpcIDX,"K� n�o x�ng v�o Th�ng Thi�n Huy�n C�nh ph�i ch�t.");
end

function stageFight1:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nNpcIDX = ttd_findNpc("Huy�t H�u Ti�u D��ng");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nNpcIDX,"Mu�n ��nh b�i L�o phu �, c�c ng��i c�n ch�a �� t� c�ch!");
	NpcChat(nQRSidx,"Nguy r�i, ph�i r�t lui th�i.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv1,0);
end

function stageFight1.callBoss()
	self = stageFight1;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nNpcIDX,"C�c v� ��ng ��o v� l�m, nh�n l�c Thi�n �m Gi�o kh�ng ph�ng th� h�y t�n c�ng cho ch�ng kh�ng k�p tr� tay.");
	local nBossIDX = ttd_findNpc("Huy�t H�u Ti�u D��ng");
	if nBossIDX == nil or nBossIDX == 0 then
		nBossIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
	else
		NpcChat(nBossIDX,"Ch�m ch�p qu� �i, �� �� cho ta.");
		SetNpcActivator(nBossIDX);
		ttd_ChangeNpc2Fight(nBossIDX);
		g_NpcAI:setAI(nBossIDX, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(nBossIDX, {tPos.boss1_init[1],tPos.boss1[1]});
	end
	if nBossIDX ~= 0 then
		NpcChat(nBossIDX,"Ph� Th� ��i Ph�p c�a L�o T� �ang luy�n ��n c�nh gi�i cu�i c�ng, k� n�o d�m qu�y nhi�u. T� V� nghe l�nh: h�y gi�t ch�t nh�ng k� x�m nh�p.");
		NpcChat(nNpcIDX,"�, binh l�nh n�y v� c�ng k� qu�i, c�c ��ng ��o h�y c�n th�n ch� c� khinh ��ch.");
	end
	local tTyss = ttd_findAllNpc("Th�ng Thi�n T� V�");
	local nNum = getn(tTyss);
	if nNum ~= 0 then
		for i = 1,nNum do
			local nIDX = tTyss[i];
			if IsNpcDeath(nIDX) ~= 1 then --��û��
				local m,x,y = GetNpcWorldPos(nIDX);
				SetCurrentNpcSFX(nIDX,901,0,0,18*2);
				ttd_removeNpc(nIDX);
				local nNewIDX = ttd_createNpc("Th�ng Thi�n Ma V�","Th�ng Thi�n Ma V�",m,x,y);
				SetCampToNpc(nNewIDX,CampEnemy);
				NpcChat(nNewIDX,"C� g�ng l�n, h�y tr� h�t t�i ngh� xem n�o.");
				--SetNpcDeathScript(nNewIDX,thisFile);
			end
		end
	end
	this.msCamp:turnPlayer(0,HeadMsg2Player,"��nh b�i<color=red>Huy�t H�u Ti�u D��ng<color>")
end

function stageFight1.doSkill()
	local nNpcIDX = ttd_findNpc("Huy�t H�u Ti�u D��ng");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local m,x,y = GetNpcWorldPos(nNpcIDX);
	local nOldPlayerIDX = PlayerIndex;
	if nNpcIDX ~= 0 and IsNpcDeath(nNpcIDX) ~= 1 then
		local nPlayerIDX = ttd_findRandomPlayer(x,y);
		if nPlayerIDX ~= 0 then
			PlayerIndex = nPlayerIDX;
			local m1,x1,y1 = GetWorldPos();
			local strName = GetName();
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=green>%s<color>b� Ti�u D��ng �i�m danh r�i",strName));
			SetCurrentNpcSFX(NpcIdx2PIdx(),928,2,0,18*3);
			NpcChat(nNpcIDX,strName.."H�y xem l�i h�i ��y, Huy�t H�u S�t Lang �ao! ");
			NpcChat(nQRSidx,"Thanh �ao uy l�c v� song, kh�ng th� xem th��ng.");
			NpcCommand(nNpcIDX, NPCCOMMAND.do_skill,x1*32,y1*32,65536*4+1566);
			PlayerIndex = nOldPlayerIDX;
		end
	end
end
----------------------------------------------------------------------
stageFight1 = inherit(cycPhase, stageFight1);

stageFight1.actions = {
	[1] = stageFight1.init,
--	[50] = stageFight.warn,
	[10] = stageFight1.npcFunnyChat,
	[60] = stageFight1.callBoss,
}
stageFight1.cycActions = {
	[15] = { --15����һ��
		[0] = stageFight1.doSkill,
		start = 75,
	},
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "B�a t�i tr��c l�c v��t �i th� 2",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight1_2:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 2: Hi�p L� T��ng Ph�ng/#stageFight1_2.gotoTwo(1)",
			"\n M� �i th� 2: Hi�p L� T��ng Ph�ng (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight1_2.gotoTwo(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: Ph�a tr��c S�n M�n �� ���c d�n s�ch, H��ng H� Ph�p �i d� ���ng tr��c, c�c v� ��ng ��o nhanh ch�n �i th�i.",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv2,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nXWTIdx = ttd_findNpc("H��ng V�n Thi�n");
	ttd_ChangeNpc2Fight(nXWTIdx);
	NpcChat(nXWTIdx,"V�y t�i h� �i tr��c ��y");
	g_NpcAI:setAI(nXWTIdx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nXWTIdx, tQrsMovePos[2]);
	
	--ds_HDTTD:AddStatValue(1,5+nType,1);
end

function stageFight1_2.init()
	self = stageFight1_2;
--	SetMissionV(firePhases.curPhaseLv,3);
	ttd_createQRS(1); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight1_2.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight1_2.checkPos()
	self = stageFight1_2;
	local nNpcIDX2 = ttd_findNpc("Nh�m Doanh Doanh");
	local nNpcIDX = ttd_findNpc("H��ng V�n Thi�n");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMapID2,nPosX2,nPosY2 = GetNpcWorldPos(nNpcIDX2);
	local nMax = getn(tQrsMovePos[2]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[2][nMax][1])^2+(nPosY-tQrsMovePos[2][nMax][2])^2));
	local nDistance2 = floor(sqrt((nPosX2-tQrsMovePos[2][nMax][1])^2+(nPosY2-tQrsMovePos[2][nMax][2])^2));
	if nDistance <= 60 and nDistance >= 0 then
		SetCurrentNpcSFX(nNpcIDX, 962,2,0,18*3); --��������Ч
		ttd_removeNpc(nNpcIDX);
	
		ttd_ChangeNpc2Fight(nNpcIDX2);
		NpcChat(nNpcIDX2,"H��ng H� Ph�p �� ��t nh�p v�o doanh tr�i ��ch, c�c v� ��ng ��o ph�i nhanh ch�ng h�i ng�.");
		g_NpcAI:setAI(nNpcIDX2, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(nNpcIDX2, tQrsMovePos[2]);
		SetNpcActivator(nNpcIDX2);
	end	
	if nDistance2 <= 3 and nDistance >= 0 then
		NpcChat(nNpcIDX,"���ng �i hi�m tr�, m�t b�n l� thung l�ng, m�t b�n l� s��n n�i, e r�ng c� mai ph�c!");
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight1_2 = inherit(cycPhase, stageFight1_2);

stageFight1_2.actions = {
	[1] = stageFight1_2.init,
};
stageFight1_2.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight1_2.checkPos,
	},
};

---------------------------------------------------------------------
stageFight2 = {
	name = "�i th� 2: Hi�p L� T��ng Ph�ng",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Hi�p L� T��ng Ph�ng",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};
---------------------------------------------------------------------
function stageFight2:createSomeNpc()
	local nBossIDX2 = ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
	NpcChat(nBossIDX2,"Ti�u a ��u n�y qu� nhi�n th�ng minh!");
	local nBossIDX3 = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
	NpcChat(nBossIDX3,"T�i h� ch� c�c v� ��ng ��o ��i gi� quang l�m �� l�u r�i!");
	local nBossIDX4 = ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);
	NpcChat(nBossIDX4,"Gi�t! Gi�t�.!");
end

function stageFight2:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "S�t Ph� Lang" then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"��y r�t cu�c l� n�i n�o, sao ��ng s� qu�.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(2,strNpcName);
	end
end

function stageFight2:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[2][1], tbTraps[2][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap2.lua"},
		{m, tbTraps[2][3], tbTraps[2][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap2.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight2:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight2.init()
	self = stageFight2;
--	SetMissionV(firePhases.curPhaseLv,4);
	SetMissionV(MV_STAGE,2);
	SetMissionV(this.mv8,0);
	SetMissionV(this.mv9,0);
	SetMissionV(this.mv10,0);
	SetMissionV(this.mv22,0);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv2); --������ҵ���ӯӯ����
end

function stageFight2:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nQRSidx,"T�i h���� c� h�t s�c!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv2,0);
end

function stageFight2.callBoss()
	if GetMissionV(this.mv9) ~= 0 then
		return 0;
	end
	local nNpcIDX1 = ttd_findNpc("Th�t S�t");
	local nNpcIDX2 = ttd_findNpc("Ph� Qu�n");
	local nNpcIDX3 = ttd_findNpc("Tham Lang");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local nMaxLife1,nCurLife1 = GetUnitCurStates(nNpcIDX1,1);
	local nMaxLife2,nCurLife2 = GetUnitCurStates(nNpcIDX2,1);
	local nMaxLife3,nCurLife3 = GetUnitCurStates(nNpcIDX3,1);
	local nPercent1 = floor(nCurLife1/nMaxLife1*100);
	local nPercent2 = floor(nCurLife2/nMaxLife2*100);
	local nPercent3 = floor(nCurLife3/nMaxLife3*100);
	if (nPercent1 <= 50 or nPercent2 <= 50 or nPercent3 <= 50) and GetMissionV(this.mv22) == 0 then
		NpcChat(nQRSidx,"Th�ng Thi�n L�o T� ph�i 3 ng��i v� c�ng t�m th��ng ph�c k�ch t�i ��y, �t h�n c� qu� k�, h�y c�n th�n.");
		SetMissionV(this.mv22,1)
	end
	if nPercent1 <= 20 or nPercent2 <= 20 or nPercent3 <= 20 then
		if GetMissionV(this.mv22) == 1 then
			SetMissionV(this.mv22,2);
			--this.msCamp:turnPlayer(0,Talk,1,"","ͨ�����棺��������������ԭ�һ������������������һ�Ѱɣ�");
			NpcChat(nNpcIDX1,"�� ��n l�c r�i, h�p th�, bi�n!");
			NpcChat(nNpcIDX2,"�� ��n l�c r�i, h�p th�, bi�n!");
			NpcChat(nNpcIDX3,"Gi�t�!gi�t�");
		else
			SetMissionV(this.mv22,3);
			local nSPLidx = ttd_createSomeNpc({"S�t Ph� Lang", "S�t Ph� Lang", thisFile, nil, CampEnemy, 0},{{1619,3015}});
			if nSPLidx ~= 0 then
				SetCurrentNpcSFX(nSPLidx,960,2,0,18*3)
				SetMissionV(this.mv9,1);
				ttd_removeNpc(nNpcIDX1);
				ttd_removeNpc(nNpcIDX2);
				ttd_removeNpc(nNpcIDX3);
				local nMaxLife,nCurLife = GetUnitCurStates(nSPLidx,1);
				local nPercent = floor((nPercent1+nPercent2+nPercent3)/3);
				if nPercent < 10 then nPercent = 10; end
				if nPercent > 100 then nPercent = 100; end
				ModifyNpcData(nSPLidx,0,floor(nMaxLife*nPercent/100),0);
				NpcChat(nSPLidx,"......");
				NpcChat(nQRSidx,"Qu� th�t qu� ��c �c, ng��i kh�ng n�n s�ng tr�n ��i n�y!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"��nh b�i<color=red>S�t Ph� Lang<color>");
			end
		end
	end
end

function stageFight2.doSkill()
	local nPJidx = ttd_findNpc("Ph� Qu�n");
	if nPJidx ~= 0 and IsNpcDeath(nPJidx) ~= 1 then
		local m,x1,y1 = GetNpcWorldPos(nPJidx);
		local nMaxLife,nCurLife = GetUnitCurStates(nPJidx,1);
		local nLastLife = GetMissionV(this.mv8);
		if nLastLife == 0 then
			nLastLife = nMaxLife;
		end
		if (nLastLife - nCurLife) >= floor(nMaxLife*0.1) then
			SetMissionV(this.mv8,nCurLife);
			NpcCommand(nPJidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*2+673);
		end
	end
	local nTLidx = ttd_findNpc("Tham Lang");
	if nTLidx ~= 0 and IsNpcDeath(nTLidx) ~= 1 then
		local m,x1,y1 = GetNpcWorldPos(nTLidx);
		local nMaxLife,nCurLife = GetUnitCurStates(nTLidx,1);
		if nCurLife <= floor(nMaxLife*0.5) then
			NpcCommand(nTLidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*20+614);
		end
	end
end

function stageFight2.doSkill2()
	if GetMissionV(this.mv9) == 0 then --ɱ���ǻ�û����
		return 0;
	end
	local nSkillLv = GetMissionV(this.mv10);
	local nSPLidx = ttd_findNpc("S�t Ph� Lang");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	if nSPLidx ~= 0 and IsNpcDeath(nSPLidx) ~= 1 then
		SetMissionV(this.mv10,nSkillLv+1);
		local m,x1,y1 = GetNpcWorldPos(nSPLidx);
		if nSkillLv > 19 then
			nSkillLv = 19;
		end
		NpcChat(nSPLidx,"��");
		NpcChat(nQRSidx,"Ti�ng k�u la c�a qu�i v�t s�t th��ng r�t l�n, ph�m vi s�t th��ng s� t�ng theo th�i gian, h�y mau gi�t ch�t ch�ng �i.");
		if self.DEBUG == 1 then
			print("stageFight2.nSkillLv",nSkillLv);
		end
		NpcCommand(nSPLidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*(nSkillLv+1)+1571);
	end
end

function stageFight2.doSkill3()
	local nQSidx = ttd_findNpc("Th�t S�t");
	if nQSidx ~= 0 and IsNpcDeath(nQSidx) ~= 1 then
		local tQSPos = {{1611,3015},{1626,3016},{1646,3059},{1626,3052}};
		local nRand = random(1,getn(tQSPos));
		SetCurrentNpcSFX(nQSidx,962,2,1,18*3);
		SetNpcPos(nQSidx,tQSPos[nRand][1],tQSPos[nRand][2]);
		NpcChat(nQSidx,"T� t� � ��y, ��n b�t �i!");
	end
end
----------------------------------------------------------------------
stageFight2 = inherit(cycPhase, stageFight2);

stageFight2.actions = {
	[1] = stageFight2.init,
--	[50] = stageFight.warn,
}
stageFight2.cycActions = {
	[1] = {
		[0] = {stageFight2.callBoss,stageFight2.doSkill},
		start = 0,
	},
	[10] = { --10����һ��
		[0] = stageFight2.doSkill2,
		start = 10,
	},
	[30] = { --30����һ��
		[0] = stageFight2.doSkill3,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight2_3 = {
	name = "B�ng ��m tr��c �i th� 3",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight2_3:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 3: Nh� M�ng Nh��c Ti�n/#stageFight2_3.gotoThree(1)",
			"\n M� �i th� 3: Nh� M�ng Nh��c Ti�n (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight2_3.gotoThree(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: ���ng l�n n�i kh�ng c� mai ph�c, ph�a tr��c l� Thi�n �m T� ��n, mau �i th�i, �� Kh�u Trang Ch� v� L�c S� Huynh ��nh l�c h��ng ��ch.",
			getn(strtab),
			strtab)
	end
end

function stageFight2_3.gotoThree(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv3,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[3]);
	SetNpcActivator(nNpcIDX);
	--ds_HDTTD:AddStatValue(1,7+nType,1);
end

function stageFight2_3.init()
--	SetMissionV(firePhases.curPhaseLv,5);
	SetMissionV(this.mv11,0);
	SetMissionV(this.mv12,0);
	ttd_createQRS(2); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight2_3.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight2_3.checkPos()
	self = stageFight2_3;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	local nFMidx = ttd_findNpc("Ph�c M�ng");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[3]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[3][nMax][1])^2+(nPosY-tQrsMovePos[3][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv11);
	local nDialog = GetMissionV(this.mv12);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3����
		if nCallBoss == 0 then --�г�����
			nFMidx = ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
			if nFMidx ~= 0 then
				SetMissionV(this.mv11,1);
				ttd_ChangeNpc2Talk(nFMidx);
				ttd_ChangeNpc2Talk(nNpcIDX);
				SetNpcScript(nNpcIDX,"");
				SetNpcActivator(nFMidx);
			end
		else
			if nDialog >= 14 then --�ϻ�˵�꿪��
				NpcChat(nFMidx,"Ng��i x�u ��u ��ng ch�t.");
				self:onFinish();
			else
				SetMissionV(this.mv12,nDialog+1);
				local tDialogs = {
					{nNpcIDX,"�, c� m�t c� n��ng!"},
					{nFMidx,"C� n��ng l� ai? sao c� n��ng c� M�ng Ma ��p nh� th�!"},
					{nNpcIDX,"T�i h� l� �i n� c�a Nh�m Ng� H�nh, Nh�m Doanh Doanh, c� n��ng ng��i ph��ng n�o?"},
					{nFMidx,"T�i h� l� ai? T�i h� l� ai?... t�i h� h�nh nh� l� Th�ng Thi�n Th�nh N�, t�i h� t�n�, a� nh�c ��u qu�!"},
					{nNpcIDX,"C� N��ng l�m sao th�?"},
					{nFMidx,"Ng��i l� ng��i x�u, ng��i nh�t ��nh l� M�ng Ma m�i, mu�n g�t t�i h� �!"},
					{nNpcIDX,"M�ng Ma g� ch�, c� n��ng c� sao kh�ng."},
				};
				if mod(nDialog+1,2) == 0 then
					local tTemp = tDialogs[(nDialog+1)/2];
					if tTemp then
						NpcChat(tTemp[1],tTemp[2]);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight2_3 = inherit(cycPhase, stageFight2_3);

stageFight2_3.actions = {
	[1] = stageFight2_3.init,
};
stageFight2_3.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight2_3.checkPos,
	},
};

---------------------------------------------------------------------
stageFight3 = {
	name = "�i th� 3: Nh� M�ng Nh��c Ti�n",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Nh� M�ng Nh��c Ti�n",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};
---------------------------------------------------------------------
function stageFight3:createSomeNpc()
	local nFMidx = ttd_findNpc("Ph�c M�ng");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	--AddUnitStates(nQRSidx, 8, -1000);
	--g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
	--g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[3]);
	SetNpcActivator(nQRSidx);
	if nFMidx ~= 0 then
		ttd_ChangeNpc2Fight(nFMidx);
	else
		ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
	end
end

function stageFight3:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Ph�c M�ng" then
		NpcChat(nNpcIDX,"C�m �n, cu�i c�ng c�ng tho�t ra r�i.")
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(3,strNpcName);
	end
end

function stageFight3:onTalk(nNpcIDX)
	if GetNpcName(nNpcIDX) == "Ng�c M�ng Chi Hoa" then
		SetCurrentNpcSFX(nNpcIDX, 930,0,1);
	end
	SetTaskTemp(this.TempTask1,nNpcIDX);
	DoWait(101,102,2);
end

function stageFight3:callBack()
	local nNpcIDX = GetTaskTemp(this.TempTask1);
	local strName = GetNpcName(nNpcIDX);
	if strName == "Ng�c M�ng Chi Hoa" then
		SetCurrentNpcSFX(nNpcIDX, 922,2,1);
		ttd_removeNpc(nNpcIDX);
	end
end

function stageFight3:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[3][1], tbTraps[3][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap3.lua"},
		{m, tbTraps[3][3], tbTraps[3][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap3.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight3:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight3.init()
	self = stageFight3;
--	SetMissionV(firePhases.curPhaseLv,6);
	SetMissionV(MV_STAGE,3);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv3); --������ҵ���ӯӯ����
	this.msCamp:turnPlayer(0,HeadMsg2Player,"��nh b�i<color=red>Ph�c M�ng<color>");
end

function stageFight3:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nFMidx = ttd_findNpc("Ph�c M�ng");
	NpcChat(nFMidx,"T�i sao, t�i h� ��nh b�i M�ng Ma r�i, nh�ng M�ng v�n ch�a t�nh.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv3,0);
end

function stageFight3.callFish()
	local nFMidx = ttd_findNpc("Ph�c M�ng");
	if nFMidx ~= 0 and IsNpcDeath(nFMidx) ~= 1 then
		local m,x,y = GetNpcWorldPos(nFMidx);
		local tFish1 = ttd_findAllNpc("Tham Lam Chi M�ng");
		local tFish2 = ttd_findAllNpc("Ph�n N� Chi M�ng");
		local tFish3 = ttd_findAllNpc("Si M� Chi M�ng");
		local nNum1,nNum2,nNum3 = getn(tFish1),getn(tFish2),getn(tFish3);
		if nNum1 ~= 0 then
			for i = 1,nNum1 do
				local nIDX = tFish1[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		if nNum2 ~= 0 then
			for i = 1,nNum2 do
				local nIDX = tFish2[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		if nNum3 ~= 0 then
			for i = 1,nNum3 do
				local nIDX = tFish3[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nFMidx,"Nh�n xem Ng�c M�ng Chi Hoa ��p qu�, ch�ng s�p k�t tr�i r�i!");
		NpcChat(nQRSidx,"C� n��ng c� th� th�c th� h�a M�ng C�nh, ph� h�y nh�ng ��a hoa kh�ng cho ch�ng k�t tr�i!");
		ttd_createSomeNpc(tNpcs.fish,tPos.fish);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Ng�c M�ng Chi Hoa<color>xu�t hi�n r�i");
	end
end

function stageFight3.changeFish()
	local nFMidx = ttd_findNpc("Ph�c M�ng");
	if nFMidx ~= 0 and IsNpcDeath(nFMidx) ~= 1 then
		local tFish = ttd_findAllNpc("Ng�c M�ng Chi Hoa");
		local nNum = getn(tFish);
		if nNum ~= 0 then
			local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
			NpcChat(nFMidx,"Gian �c, c�m gi�n, s�c d�c ��u xu�t hi�n trong M�ng C�nh!");
			NpcChat(nQRSidx,"��y l� h�nh d�ng sau khi th�c th� h�a Ng�c M�ng, h�y gi�t ch�ng �i, n�u kh�ng l� tr� s� b� m� mu�i.");
			for i = 1,nNum do
				local nIDX = tFish[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					local m,x,y = GetNpcWorldPos(nIDX);
					ttd_removeNpc(nIDX);
					local nRand = random(1,3);
					local tNpcFish = {"Tham Lam Chi M�ng","Ph�n N� Chi M�ng","Si M� Chi M�ng"};
					local nNewIDX = ttd_createNpc(tNpcFish[nRand],tNpcFish[nRand],m,x,y);
					SetCampToNpc(nNewIDX,CampEnemy);
				end
			end
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Ng�c M�ng Chi Hoa<color>k�t tr�i r�i");
		end
	end
end

----------------------------------------------------------------------
stageFight3 = inherit(cycPhase, stageFight3);

stageFight3.actions = {
	[1] = stageFight3.init,
--	[50] = stageFight.warn,
}
stageFight3.cycActions = {
	[10] = { --10����һ��
		[0] = stageFight3.changeFish,
		start = 30,
	},
	[30] = {
		[1] = stageFight3.callFish,
		start = 30,
	},
}

----------------------------------------------------------------------
stageFight3_4 = {
	name = "B�nh minh tr��c �i th� 4",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight3_4:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 4:  B� Nh�n M�u/#stageFight3_4.gotoFour(1)",
			"\n M� �i th� 4: Huy�t Nh�c Kh�i L�i (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight3_4.gotoFour(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: Nguy r�i, H��ng H� Ph�p b� Th�ng Thi�n L�o T� ph�t hi�n r�i. Mau �i c�u th�i.",
			getn(strtab),
			strtab)
	end
end

function stageFight3_4.gotoFour(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv4,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	NpcChat(nNpcIDX,"C�y c�u ph�a sau T� ��n ch�nh l� l�i v�o ��nh c�a Th�ng Thi�n ��nh!");
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[4]);
	SetNpcActivator(nNpcIDX);
--	ds_HDTTD:AddStatValue(1,9+nType,1);
	self:onFinish();
end

function stageFight3_4.init()
--	SetMissionV(firePhases.curPhaseLv,7);
	ttd_createQRS(3); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight3_4.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end


----------------------------------------------------------------------
stageFight3_4 = inherit(cycPhase, stageFight3_4);

stageFight3_4.actions = {
	[1] = stageFight3_4.init,
};
stageFight3_4.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight3_4.checkPos,
	},
};

---------------------------------------------------------------------
stageFight4 = {
	name = "�i th� 4: Huy�t Nh�c Kh�i L�i",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Huy�t Nh�c Kh�i L�i",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight4:createSomeNpc()
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local nBossIDX6 = ttd_createSomeNpc(tNpcs.boss6,tPos.boss6);
	NpcChat(nBossIDX6,"Ch� ti�c c�c ng��i tr�n kh�ng tho�t ���c!");
	NpcChat(nQRSidx,"C�n th�n, � ��y c� qu�n mai ph�c.");
	this.msCamp:turnPlayer(0,HeadMsg2Player,"��nh b�i<color=red>T�t Y�n<color>");
end

function stageFight4:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "T�t Y�n" then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"X�ng th�ng l�n.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(4,strNpcName);
	end
end

function stageFight4:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[4][1], tbTraps[4][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap4.lua"},
		{m, tbTraps[4][3], tbTraps[4][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap4.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight4:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight4.init()
	self = stageFight4;
--	SetMissionV(firePhases.curPhaseLv,8);
	SetMissionV(MV_STAGE,4);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv4); --������ҵ���ӯӯ����
end

function stageFight4:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nBYidx = ttd_findNpc("T�t Y�n");
	NpcChat(nBYidx,"M�u t��i th�t ngon qu� r�t kho�i kh�u!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv4,0);
end

function stageFight4.callFish()
	local nBYidx = ttd_findNpc("T�t Y�n");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		NpcChat(nBYidx,"B�o b�i h�y mau ch�y ��n b�n c�nh cha �i!");
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"H�y ng�n c�n Kh�i L�i Huy�t Nh�c ti�p c�n ��nh T� ��n!");
		ttd_createSomeNpc({"Th�ng Thi�n Huy�t Nh�c Kh�i L�i","Huy�t Nh�c Kh�i L�i", thisFile, nil, CampEnemy, 0},{{1535,2972}},{{1551,2991},{1577,2947}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th�ng Thi�n Huy�t Nh�c Kh�i L�i","Huy�t Nh�c Kh�i L�i", thisFile, nil, CampEnemy, 0},{{1579,3016}},{{1559,2999},{1585,2953}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th�ng Thi�n Huy�t Nh�c Kh�i L�i","Huy�t Nh�c Kh�i L�i", thisFile, nil, CampEnemy, 0},{{1611,2989}},{{1587,2950}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th�ng Thi�n Huy�t Nh�c Kh�i L�i","Huy�t Nh�c Kh�i L�i", thisFile, nil, CampEnemy, 0},{{1593,2915}},{{1612,2931},{1594,2943}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th�ng Thi�n Huy�t Nh�c Kh�i L�i","Huy�t Nh�c Kh�i L�i", thisFile, nil, CampEnemy, 0},{{1637,2957}},{{1612,2930},{1590,2944}},AT_SM_MOVE);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Huy�t Nh�c Kh�i L�i <color>xu�t hi�n r�i ");
	end
end

function stageFight4.changeFish()
	local nBYidx = ttd_findNpc("T�t Y�n");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		local tfish = ttd_findAllNpc("Huy�t Nh�c Kh�i L�i");
		local nNum = getn(tfish);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					local m,x,y = GetNpcWorldPos(nIDX);
					local nDistance = floor(sqrt((1588-x)^2+(2949-y)^2)); --�������߾���
					if nDistance <= 15 then --10����
						NpcChat(nBYidx,"T�t qu�, h�y t�nh d�y �i, con.");
						NpcChat(nQRSidx,"Th�ch Nh�n �� b� c��ng h�a, r�t hung d�, h�y c�n th�n!");
						SetCurrentNpcSFX(nIDX,901,0,0,18*3);
						ttd_removeNpc(nIDX);
						local nNewIDX = ttd_createNpc("Th�ng Thi�n Huy�t Ma Kh�i L�i","Huy�t Ma Kh�i L�i",m,x,y);
						SetCampToNpc(nNewIDX,CampEnemy);
					end
				end
			end
		end
	end
end

function stageFight4.doSkill()
	local nBYidx = ttd_findNpc("T�t Y�n");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nBYidx,"�� c�c ng��i th�y ���c l�i h�i c�a t�i h�!");
		NpcChat(nQRSidx,"C�n th�n, Vu T� ph�ng th�ch m�t Vu ��c v� c�ng nguy hi�m, h�y tr�nh xa.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Vu T� b�t ��u ph�ng th�ch Vu ��c<color>");
		SetNpcPos(nBYidx,1588,2949);
		NpcCommand(nBYidx, NPCCOMMAND.do_skill,1586*32,2947*32,65536*1+1635);
	end
end
----------------------------------------------------------------------
stageFight4 = inherit(cycPhase, stageFight4);

stageFight4.actions = {
	[1] = stageFight4.init,
--	[50] = stageFight.warn,
}
stageFight4.cycActions = {
	[2] = {
		[0] = stageFight4.changeFish,
		start = 35,
	},
	[30] = { --30����һ��
		[0] = stageFight4.doSkill,
		start = 45,
	},
	[35] = { --35����һ��
		[0] = stageFight4.callFish,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight4_5 = {
	name = "B�a s�ng tr��c �i th� 5",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight4_5:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 5:  Luy�n Ma Th�n L�/#stageFight4_5.gotoFive(1)",
			"\n M� �i th� 5: Th�n L� Luy�n Ma (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight4_5.gotoFive(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: Ti�n v� ph�a tr��c Th�ng Thi�n Gi�o Ch� kh�ng c�n bao xa n�a.",
			getn(strtab),
			strtab)
	end
end

function stageFight4_5.gotoFive(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv5,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[5]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Qua kh�i c�u ch�nh l� ��nh c�a Th�ng Thi�n ��nh.");
--	ds_HDTTD:AddStatValue(1,11+nType,1);
end

function stageFight4_5.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	SetMissionV(this.mv13,0);
	SetMissionV(this.mv14,0);
	ttd_createQRS(4); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight4_5.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight4_5.checkPos()
	self = stageFight4_5;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[5]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[5][nMax][1])^2+(nPosY-tQrsMovePos[5][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv13);
	local nDialog = GetMissionV(this.mv14);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3����
		if nCallBoss == 0 then --�г���ħ�����
			local nJWidx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);
			if nJWidx ~= 0 then
				SetMissionV(this.mv13,1);
				ttd_ChangeNpc2Talk(nNpcIDX);
				SetNpcScript(nNpcIDX,"");
				ttd_ChangeNpc2Talk(nJWidx);
				SetNpcActivator(nJWidx);
			else
				return 0;
			end
			--�Ž�---------------------------------------------
			local nJxidx = ttd_createSomeNpc(tNpcs.J1,tPos.J1);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J2,tPos.J2);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J3,tPos.J3);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J4,tPos.J4);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J5,tPos.J5);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J6,tPos.J6);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J7,tPos.J7);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J8,tPos.J8);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J9,tPos.J9);
			ttd_ChangeNpc2Talk(nJxidx);
			---------------------------------------------------
		else
			if nDialog >= 14 then --�ϻ�˵�꿪��
				self:onFinish();
			else
				--print("nDialog =",nDialog)
				if nDialog == 8 then
					--print("�ؽ�����¯NPC CREATE")
					local nLjnNpc = ttd_createSomeNpc(tNpcs.njn1,tPos.njn1);
					SetCurrentNpcSFX(nLjnNpc,928,2,1);
				end
				SetMissionV(this.mv14,nDialog+1);
				local tDialogs = {
					{nJWidx,"��n r�i �, ch� ti�c l� g�p ph�i t�i h�. C�c ng��i n�p m�ng �i."},
					{nNpcIDX,"Ki�m Ma. Ng��i l�m g� cha ta r�i!"},
					{nJWidx,"Cha ng��i, ha�ha�ch�ng qua ch� tr�u ��a ch�t th�i, nh�ng m� c� n��ng s� nhanh ch�ng g�p l�i cha th�i."},
					{nNpcIDX,"H�n l�o. Ki�m Ma, xem ��y."},
					{nJWidx,"L�m sao ng��i c� L� luy�n ki�m !"},
					{nJWidx,"V� ngo�i r�t gi�ng ch�ng qua ch� l� �� gi� m�o."},
					{nNpcIDX,"L� luy�n T�ng Ki�m c� th� luy�n th�nh Thi�n H� Ki�m H�n, h�y luy�n �!"},
				};
				if mod(nDialog+1,2) == 0 then
					local tTemp = tDialogs[(nDialog+1)/2];
					if tTemp then
						NpcChat(tTemp[1],tTemp[2]);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight4_5 = inherit(cycPhase, stageFight4_5);

stageFight4_5.actions = {
	[1] = stageFight4_5.init,
};
stageFight4_5.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight4_5.checkPos,
	},
};

----------------------------------------------------------------------
stageFight5 = {
	name = "�i th� 5: Th�n L� Luy�n Ma",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Th�n L� Luy�n Ma",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
	fishname = {"B�n X�","T� �i�n","�o�n th�y","Tri�u D��ng ki�m","Th�ch Duy�n ki�m","�� H�n ki�m","Hi�n Vi�n ki�m","Truy T�nh ki�m","T�ng S�t"},
};

---------------------------------------------------------------------
function stageFight5:createSomeNpc()
	local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
		SetCurrentNpcSFX(nJWidx,927,2,1,18*3)
	else
		ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);
	end
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[5]);
	CastState2Npc(nQRSidx,"state_vertigo",1,300*18,0,19999);
	CastState2Npc(nQRSidx,"state_lost_life_per18",610000,300*18,0,19998);
end

function stageFight5:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" then
		this:Msg2MSAll("V��t �i th�t b�i!");
		local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
		NpcChat(nJWidx,"Th�n L� Luy�n Ma");
		local nCurStage = GetMissionV(MV_STAGE);
		local m = this.msPosition:getMapID();
		ttd_clearMapNpc(m);
		ttd_reviveAll();
		ttd_cleanAllGodState();
		this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
		this.msCamp:turnPlayer(0,StopTimeGuage,-2);
		self:onFailed();
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--		SetMissionV(this.mv5,0);
	end
	for i = 1,getn(self.fishname) do
		if strNpcName == self.fishname[i] then
			SetMissionV(this.mv15,GetMissionV(this.mv15)+1);
			ttd_removeNpc(nNpcIDX);
		end
	end
	--stageFight5:checkMissionV
end

function stageFight5:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[5][1], tbTraps[5][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap5.lua"},
		{m, tbTraps[5][3], tbTraps[5][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap5.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight5:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight5.init()
	self = stageFight5;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,5);
	SetMissionV(this.mv15,0); --�Ž���������0
	local tSeq = floyd_rm4n(9,9);
	local strSeq = "";
	for i = 1,getn(tSeq) do
		strSeq = strSeq..tostring(tSeq[i]);
	end
	SetMissionS(this.ms1,strSeq); --�Ž�����˳��
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv5); --������ҵ���ӯӯ����
	this.msCamp:turnPlayer(0,HeadMsg2Player,"Nh�m Doanh Doanh tr��c l�c ch�t ��nh b�i to�n b�<color=red>Ma Ki�m<color>");
end

function stageFight5:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
	NpcChat(nJWidx,"Th�n L� Luy�n Ma");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv5,0);
end

function stageFight5.changeFish(nStart,nEnd)
	self = stageFight5;
	local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
	if nJWidx ~= 0 and IsNpcDeath(nJWidx) ~= 1 and GetMissionV(this.mv15) < 9 then
		local strSeq = GetMissionS(this.ms1);
		if strSeq == "" then
			print("[error] [stageFight5:changeFish] [strSeq='']");
			return 0;
		end
		local strFishName = "";
		for i = nStart,nEnd do
			local nSetFight = tonumber(strsub(strSeq,i,i));
			if nSetFight and self.fishname[nSetFight] then
				local nFishIDX = ttd_findNpc(self.fishname[nSetFight]);
				if nFishIDX ~= 0 and IsNpcDeath(nFishIDX) ~= 1 then
					strFishName = strFishName..self.fishname[nSetFight]..",";
					ttd_ChangeNpc2Fight(nFishIDX);
--					g_NpcAI:setAI(nFishIDX, AT_SM_ATTACK);
					SetNpcActivator(nFishIDX);
					SetCurrentNpcSFX(nFishIDX,921,0,1,18*60)
				end
			end
		end
		if nEnd <= 1 then
			NpcChat(nJWidx,strFishName.."Gi�i quy�t ch�ng �i.");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>t�nh r�i",strFishName));
		elseif nEnd <= 3 then
			NpcChat(nJWidx,"Xem ra c�ng c� ch�t b�n l�nh,"..strFishName.."H�y ti�u di�t ch�ng �i!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>t�nh r�i",strFishName));
		elseif nEnd <= 6 then
			NpcChat(nJWidx,"��ng qu�y nhi�u  �"..strFishName.."��n l�c th��ng th�c m�u c�a ch�ng r�i!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>t�nh r�i",strFishName));
		elseif nEnd <= 9 then
			NpcChat(nJWidx,strFishName.."H�y t�nh d�y t� trong gi�c ng� s�u th�m!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>t�nh r�i",strFishName));
		end
	end
end

function stageFight5.doSkill()
	self = stageFight5;
	local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
	local nDeadNum = GetMissionV(this.mv15);
	if nJWidx ~= 0 and IsNpcDeath(nJWidx) ~= 1 and nDeadNum < 9 then
		local nSkillLv = 9 --9 - nDeadNum;
		if self.DEBUG == 1 then
			print("stageFight5.nSkillLv",nSkillLv);
		end
		NpcChat(nJWidx,"Kh�ng bi�t Nh�n ng� Ki�m, hay l� Ki�m ng� Nh�n. Ma Ki�m n�i. ");
		this.msCamp:turnPlayer(0,self.damage,nJWidx,nSkillLv);
	end
end

function stageFight5.damage(nJWidx,nSkillLv)
	if self.DEBUG == 1 then
		print("stageFight5.nSkillLv2",nSkillLv);
	end
	local m,x,y = GetWorldPos();
	local d = floor(sqrt((1532-x)^2+(2821-y)^2));
	if d < 50 and IsPlayerDeath() == 0 then
		NpcCommand(nJWidx, NPCCOMMAND.do_skill,x*32,y*32,65536*nSkillLv+1585);
	end
end

function stageFight5.setView5()
	local npcIndex = ttd_findNpc("Nh�m Doanh Doanh");
--	print("stageFight5.setView5()",npcIndex)
	if npcIndex then
		AddUnitStates(npcIndex, 8, 1000);
	end
end

function stageFight5.checkMissionV()
	local nLjnNpc = ttd_findNpc("L� luy�n T�ng Ki�m");
	if GetMissionV(this.mv15) == 9 then
		this.msCamp:turnPlayer(0,ttd_setPos,1531,2830);
		local nJWidx = ttd_findNpc("Ki�m Ma Giang Bi�t H�c");
		NpcChat(nJWidx,"�� kh�ng�c�c h� sao c� th� l�m ���c�");
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"Ha�ha�h�a ra �� gi�, tuy c� ch�t uy l�c, ch� ti�c t�c �� ch�m qu��.");
		SetCurrentNpcSFX(nJWidx,913,0,1,18*3)
		--ɾ���ؽ�����¯
		ttd_removeNpc(nLjnNpc);
	end
	if (nLjnNpc == nil or nLjnNpc == 0) and GetMissionV(this.mv15) == 9 then
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		ttd_passStage(5,"Ki�m Ma Giang Bi�t H�c");
	end
end
----------------------------------------------------------------------
stageFight5 = inherit(cycPhase, stageFight5);

stageFight5.actions = {
	[1] = stageFight5.init,
	[2] = callout(stageFight5.changeFish,1,1),
	[30] = stageFight5.setView5,
	[45] = callout(stageFight5.changeFish,2,3),
	[90] = callout(stageFight5.changeFish,4,6),
	[150] = callout(stageFight5.changeFish,7,9),
}
stageFight5.cycActions = {
	[10] = {
		[0] = stageFight5.checkMissionV,
		start = 10,
	},
	[15] = {
		[5] = stageFight5.doSkill,
		start = 10,
	},
}
----------------------------------------------------------------------
stageFight5_6 = {
	name = "B�a tr�a tr��c �i th� 6",
	maxsecond = 15*60, --5����
	actionsType = "second",
};

function stageFight5_6:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n M� �i th� 6: S�ng Ch�t C�ng Nhau/#stageFight5_6.gotoSix(1)",
			"\n M� �i th� 6: Sinh T� T��ng Y (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight5_6.gotoSix(2)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: H�y nhanh l�n, t�i h� linh c�m c� �i�u b�t an.",
			getn(strtab),
			strtab)
	end
end

function stageFight5_6.gotoSix(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv6,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[6]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Ph�i mau l�n Th�ng Thi�n ��nh.");
--	ds_HDTTD:AddStatValue(1,13+nType,1);
end

function stageFight5_6.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	ttd_createQRS(5); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight5_6.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight5_6.checkPos()
	self = stageFight5_6;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[6]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[6][nMax][1])^2+(nPosY-tQrsMovePos[6][nMax][2])^2));
	if nDistance <= 3 then --3����
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight5_6 = inherit(cycPhase, stageFight5_6);

stageFight5_6.actions = {
	[1] = stageFight5_6.init,
};
stageFight5_6.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight5_6.checkPos,
	},
};

----------------------------------------------------------------------
stageFight6 = {
	name = "�i th� 6: Sinh T� T��ng Y",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Sinh T� T��ng Y",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
	bossname = {"H�c Tr��ng L�o Ti�u Nguy�t","B�ch Tr��ng L�o T�t Thi�n"},
};

---------------------------------------------------------------------
function stageFight6:createSomeNpc()
	local nBossIDX8 = ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
	NpcChat(nBossIDX8,"Ch� d�a v�o c�c ng��i mu�n ph� h�ng chuy�n c�a L�o T�, kh�ng ph�i t� t�m c�i ch�t sao!  ");
	local nBossIDX9 = ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);
	NpcChat(nBossIDX9,"Ch�ng �ang ��u thai, kh�ng n�n ng�n ch�n ��ng kh�ng!");
	--ttd_createSomeNpc(tNpcs.wlrs6,tPos.wlrs6);
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nQRSidx,"C�n th�n, ch�ng c� s� tr��ng h�p k�ch, t�ch ra s� d� ��nh b�i h�n.");
end

function stageFight6:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	for i = 1,getn(self.bossname) do
		if strNpcName == self.bossname[i] then
			SetMissionV(this.mv16,GetMissionV(this.mv16)+1);
			if GetMissionV(this.mv16) == 2 then
				local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
				NpcChat(nQRSidx,"T�i h� ph�i t�m ���c H��ng V�n Thi�n, b�ng kh�ng s� kh�ng r�i kh�i ��y!");
				local m,x,y = GetNpcWorldPos(nNpcIDX);
				ttd_passStage(6,"H�c B�ch Tr��ng L�o");
				return 1;
			end
			this:Msg2MSAll(self.bossname[i].."H�y gi�t m�t ng��i kh�c trong v�ng 20 gi�y!");
			local nBossIDX = ttd_findNpc(self.bossname[3-i]);
			if i == 1 then
				NpcChat(nBossIDX,"H�c B� T� ��ng ng� xu�ng, l�o ��n c�u ��y!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"T�c �� gi�t<color=red>B�ch Tr��ng L�o<color>");
			elseif i == 2 then
				NpcChat(nBossIDX,"B�ch L�o Qu� ��ng r�i xu�ng, l�o ��n c�u ��y!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"T�c �� gi�t<color=red>H�c Tr��ng L�o<color>");
			end
			local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
			NpcChat(nQRSidx,"Mau ��nh b�i tr��ng l�o c�n l�i, b�n t� ma n�y c� th� h�i sinh ng��i b� ng�.");
			break;
		end
	end
	if GetMissionV(this.mv16) == 2 then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"Tr�n chi�n n�y qu� th�t hi�m �c!");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(6,"H�c B�ch Tr��ng L�o");
	end
end

function stageFight6:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[6][1], tbTraps[6][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap6.lua"},
--		{m, tbTraps[6][3], tbTraps[6][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap6.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight6:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight6.init()
	self = stageFight6;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,6);
	SetMissionV(this.mv16,0); --������������0
	SetMissionV(this.mv17,0); --����ʱ��0
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv6); --������ҵ���ӯӯ����
end

function stageFight6:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nQRSidx,"Thi�u� ch�t n�a.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv6,0);
end

function stageFight6.callFish()
	self = stageFight6;
	local nXRYidx = ttd_findNpc("H�c Tr��ng L�o Ti�u Nguy�t");
	local nBTidx = ttd_findNpc("B�ch Tr��ng L�o T�t Thi�n");
	if nXRYidx ~= 0 and IsNpcDeath(nXRYidx) ~= 1 and nBTidx ~= 0 and IsNpcDeath(nBTidx) ~= 1 then
		local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
		NpcChat(nQRSidx,"C�n th�n, h�y tr�nh xa C� Tr�ng.");
		local m,x,y = GetNpcWorldPos(nXRYidx);
		local m1,x1,y1 = GetNpcWorldPos(nBTidx);
		ttd_createSomeNpc({"Thi�n S� C�","Thi�n S� C�", thisFile, nil, CampEnemy, 0},{{x,y}},{{x1,y1}},AT_SM_MOVE);
		ttd_createSomeNpc({"Minh H�n C�","Minh H�n C�", thisFile, nil, CampEnemy, 0},{{x1,y1}},{{x,y}},AT_SM_MOVE);
	end
end

function stageFight6.checkBoss()
	local nXRYidx = ttd_findNpc("H�c Tr��ng L�o Ti�u Nguy�t");
	local nBTidx = ttd_findNpc("B�ch Tr��ng L�o T�t Thi�n");
	local nDeadNum = GetMissionV(this.mv16);
	if GetMissionV(this.mv16) == 2 or GetMissionV(this.mv16) == 0 then
		return 0;
	end
	if nXRYidx ~= 0 and IsNpcDeath(nXRYidx) == 1 then
		local nCurSec = GetMissionV(this.mv17);
		if nCurSec >= 20 then
			SetMissionV(this.mv16,GetMissionV(this.mv16)-1); --����������
			SetMissionV(this.mv17,0); --����ʱ��0
			ttd_removeNpc(nXRYidx);
			ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>H�c Tr��ng L�o<color>h�i sinh");
		else
			SetMissionV(this.mv17,nCurSec+1);
		end
	elseif nBTidx ~= 0 and IsNpcDeath(nBTidx) == 1 then
		local nCurSec = GetMissionV(this.mv17);
		if nCurSec >= 20 then
			SetMissionV(this.mv16,GetMissionV(this.mv16)-1); --����������
			SetMissionV(this.mv17,0); --����ʱ��0
			ttd_removeNpc(nBTidx);
			ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>B�ch Tr��ng L�o<color>h�i sinh");
		else
			SetMissionV(this.mv17,nCurSec+1);
		end
	end
end

----------------------------------------------------------------------
stageFight6 = inherit(cycPhase, stageFight6);

stageFight6.actions = {
	[1] = stageFight6.init,
}
stageFight6.cycActions = {
	[1] = {
		[0] = stageFight6.checkBoss,
		start = 0,
	},
	[15] = {
		[0] = stageFight6.callFish,
		start = 10,
	},
}
----------------------------------------------------------------------
stageFight6_7 = {
	name = "Tr��c �i th� 7",
	maxsecond = 25*60, --5����
	actionsType = "second",
};

function stageFight6_7:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {};
		if ttd_checkConsume() == 0 then
			strtab = {
				"\n M� �i th� 7: Th�ng Thi�n L�o T� /#stageFight6_7.gotoSeven(1)",
				"\n M� �i th� 7: Th�ng Thi�n L�o T� (d�ng h�nh th�c gian l�n ph�i ti�u hao Th�ng Thi�n L�nh x2)/#stageFight6_7.gotoSeven(2)",
				"\n r�i �i/ttd_askClose",
				"\nK�t th�c ��i tho�i/nothing"
			};
		else
			strtab = {
				"\n M� �i th� 7: Th�ng Thi�n L�o T� /#stageFight6_7.gotoSeven(3)",
				"\n r�i �i/ttd_askClose",
				"\nK�t th�c ��i tho�i/nothing"
			};
		end
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T�i h� mu�n v��t �i/ttd_tiaoguan");
		end
		Say("Nh�m Doanh Doanh: T�i h� linh c�m cha � T�a Th�p ph�a tr��c�nh�ng t�i h� linh c�m c� �i�u g� b�t an.",
			getn(strtab),
			strtab)
	end
end

function stageFight6_7.gotoSeven(nType)
	if nType == 1 then
		SetMissionV(this.mv7,0);
		SetMissionV(this.mv18,1);
	elseif nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>Nh�m Doanh Doanh<color>: Th�ng Thi�n L�nh B�i c�a c�c h� kh�ng ��!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv7,1);
			SetMissionV(this.mv18,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th�ng Thi�n L�nh", item_para);
		end
	elseif nType == 3 then
		SetMissionV(this.mv7,1);
		SetMissionV(this.mv18,2);
	end
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[7]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Cu�i c�ng �� ��n Th�ng Thi�n Huy�n C�nh.");
--	ds_HDTTD:AddStatValue(1,15+nType,1);
end

function stageFight6_7.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	SetMissionV(this.mv18,0);
	SetMissionV(this.mv19,0);
	SetMissionV(this.mv20,0);
	ttd_createQRS(6); --��ӯӯ
	ttd_createWRD(); --���ʵ�
end

function stageFight6_7.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight6_7.checkPos()
	self = stageFight6_7;
	local nNpcIDX = ttd_findNpc("Nh�m Doanh Doanh");
	local nJZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	local nLFidx = ttd_findNpc("T� Nh�m Ng� H�nh");
	local nLFidx2 = ttd_findNpc("Nh�m Ng� H�nh");
	local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[7]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[7][nMax][1])^2+(nPosY-tQrsMovePos[7][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv19);
	local nDialog = GetMissionV(this.mv20);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3����
		if GetMissionV(this.mv18) == 1 then --����
			if nCallBoss == 0 then --�г�ͨ������
				nJZidx = ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);
				nLFidx = ttd_createSomeNpc(tNpcs.boss11,tPos.boss11);
				nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
				if nJZidx ~= 0 then
					SetMissionV(this.mv19,1);
					ttd_ChangeNpc2Talk(nNpcIDX);
					SetNpcScript(nNpcIDX,"");
					ttd_ChangeNpc2Talk(nJZidx);
					ttd_ChangeNpc2Talk(nLFidx);
					ttd_ChangeNpc2Talk(nJWidx);
					SetNpcActivator(nJZidx);
				else
					return 0;
				end
			else
				if nDialog >= 20 then --�ϻ�˵�꿪��
					self:onFinish();
				else
					SetMissionV(this.mv20,nDialog+1);
					local tDialogs = {
						{nJZidx,"��n ���c ch� n�y! N�u kh�ng b� Ti�u t� n�y ��nh l�n, gi� �� ��i c�ng c�o th�nh r�i!"},
						{nLFidx,"Doanh Doanh! �!..."},
						{nLFidx,"Ti�u a ��u, d�m ph� h�ng ��i s� c�a L�o phu, h�m nay ng��i ph�i ch�t."},
						{nJWidx,"Thi�u ch�, Th�ng Thi�n L�o T� mu�n ph� th� v�o ng��i gi�o ch�, b� t�i h� ph�t hi�n ph� tan �m m�u ��."},
						{nJWidx,"N�u b�y gi� ��nh b�i Th�ng Thi�n L�o T�, c�n c� th� c�u ���c gi�o ch�."},
						{nNpcIDX,"Th�ng Thi�n L�o T�c h�y n�p m�ng �i!"},
						{nJZidx,"D�a v�o b�n l�nh c�c ng��i."},
						{nLFidx,"D�a v�o b�n l�nh c�c ng��i."},
						{nNpcIDX,"Nguy�n H�n c�a Th�ng Thi�n L�o T� �� t�i h� ��i ph�, h�y �i c�u cha �i."},
						{nNpcIDX,"Nh�t Nguy�t Th�n �n, H� Th�n."},
						{nJZidx,"��ng��i d�m ra tay v�i ta, h�y ch�t �i!"},
						{nLFidx,"��ng��i d�m ra tay v�i ta, h�y ch�t �i!"},
					};
					if mod(nDialog+1,2) == 0 then
						local tTemp = tDialogs[(nDialog+1)/2];
						if tTemp then
							NpcChat(tTemp[1],tTemp[2]);
						end
					end
				end
			end
		else   -----ϲ��
			if nCallBoss == 0 then --�г�ͨ������
				nJZidx = ttd_createSomeNpc(tNpcs.boss12,tPos.boss12);
				nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
				nLFidx = ttd_createSomeNpc(tNpcs.boss14,tPos.boss14);
				if nJZidx ~= 0 then
					SetMissionV(this.mv19,1);
					ttd_ChangeNpc2Talk(nNpcIDX);
					SetNpcActivator(nNpcIDX);
					SetNpcScript(nNpcIDX,"");
					ttd_ChangeNpc2Talk(nJZidx);
					ttd_ChangeNpc2Talk(nJWidx);
					ttd_ChangeNpc2Talk(nLFidx);
					SetNpcActivator(nJZidx);
				else
					return 0;
				end
			else
				if nDialog >= 14 then --�ϻ�˵�꿪��
					SetMissionV(firePhases.curPhaseLv,GetMissionV(firePhases.curPhaseLv)+1); --��һ��
					self:onFinish();
				else
					SetMissionV(this.mv20,nDialog+1);
					local tDialogs = {
						{nJZidx,"��n ���c ch� n�y! N�u kh�ng b� Ti�u t� n�y ��nh l�n, gi� �� ��i c�ng c�o th�nh r�i!"},
						{nJWidx,"Thi�u ch�, Th�ng Thi�n L�o T� �ang luy�n Ph� Th�n c�nh gi�i cu�i c�ng, t�i h� ��t k�ch kh�ng th�nh c�ng."},
						{nJWidx,"Mau s� d�ng Nh�t Nguy�t Th�n �n, c�u t�i h� v� gi�o ch�."},
						{nNpcIDX,"Nh�t Nguy�t Th�n �n, Nh�t Kh� Ph� V�n Ph�p."},
						{nLFidx2,"Ha..ha�L�o phu t� do n�a r�i. Mu�n l�y m�ng L�o phu, Th�ng Thi�n L�o T�, ng��i t� t�m ���ng ch�t �i."},
						{nJZidx,"Xem ra L�o phu xem th��ng c�c ng��i r�i, kh�ng sao, h�y ch� L�o phu b�t t�ng ng��i m�t ��."},
						{nNpcIDX,"Nh�t Nguy�t Th�n �n, H� Ph�p!"}
					};
					if mod(nDialog+1,2) == 0 then
						local tTemp = tDialogs[(nDialog+1)/2];
						if tTemp then
							NpcChat(tTemp[1],tTemp[2]);
						end
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight6_7 = inherit(cycPhase, stageFight6_7);

stageFight6_7.actions = {
	[1] = stageFight6_7.init,
};
stageFight6_7.cycActions = {
	[1] = { --ÿ����һ��
		[0] = stageFight6_7.checkPos,
	},
};

----------------------------------------------------------------------
stageFight7 = {
	name = "�i th� 7: Th�ng Thi�n L�o T�",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Th�ng Thi�n L�o T�",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight7:createSomeNpc()
	local nJZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	local nLFidx = ttd_findNpc("T� Nh�m Ng� H�nh");
	local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
	if nJZidx ~= 0 then
		ttd_ChangeNpc2Fight(nJZidx);
		SetNpcActivator(nJZidx);
	else
		ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);
	end
	if nLFidx ~= 0 then
		ttd_ChangeNpc2Fight(nLFidx);
		SetNpcPos(nLFidx,1614,2698);
		SetNpcActivator(nLFidx);
		SetCurrentNpcSFX(nLFidx,929,2,1,18*3)
	else
		nLFidx = ttd_createSomeNpc(tNpcs.boss11,tPos.boss11);
		SetNpcPos(nLFidx,1614,2698);
		SetCurrentNpcSFX(nLFidx,929,2,1,18*3)
	end
	if nJWidx ~= 0 then
		--ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
	else
		nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
		--ttd_ChangeNpc2Fight(nJWidx);
		SetCurrentNpcSFX(nJWidx,930,2,1,18*3)
	end
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	SetNpcScript(nQRSidx,thisFile);
--	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[7]);
	--CastState2Npc(nQRSidx,"state_fetter",1,300*18,0,19999);
	--CastState2Npc(nQRSidx,"state_lock",1,300*18,0,19998);
	CastState2Npc(nQRSidx,"state_lost_life_per18",2000000,300*18,0,19997);
	CastState2Npc(nQRSidx,"state_knockback_immune",100,300*18,0,20000);
	CastState2Npc(nQRSidx,"state_knockdown_immune",100,300*18,0,20001);
	CastState2Npc(nQRSidx,"state_fetter_immune",100,300*18,0,20002);

	
	AddUnitStates(nQRSidx, 8, -1000);
end

function stageFight7:onNpcDeath(nNpcIDX)
	--print("stageFight7:onNpcDeath");
	local strNpcName = GetNpcName(nNpcIDX);
	--print("stageFight7:onNpcDeath ,",strNpcName);
	if strNpcName == "T� Nh�m Ng� H�nh" then
		--this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>�ؿ�ʤ��<color>");
		ttd_passStage(7,strNpcName);
		this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
	elseif strNpcName == "Nh�m Doanh Doanh" then
		this:Msg2MSAll("Nh�m Doanh Doanh �� ch�t!");
		this.msCamp:turnPlayer(0,StopTimeGuage,-2);
		self:onTimeout();
	end
end

function stageFight7:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[7][1], tbTraps[7][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
--		{m, tbTraps[7][3], tbTraps[7][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight7:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight7.init()
	self = stageFight7;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,7);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv7); --������ҵ���ӯӯ����
	this.msCamp:turnPlayer(0,HeadMsg2Player,"T�i<color=green>Nh�m Doanh Doanh<color>tr��c l�c ch�t ��nh b�i<color=red>T� Nh�m Ng� H�nh<color>");
end

function stageFight7:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nLFidx = ttd_findNpc("T� Nh�m Ng� H�nh");
	local nTtidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	NpcChat(nTtidx,"H�, con Ki�n kh�n khi�p!");
	NpcChat(nLFidx,"H�, con Ki�n kh�n khi�p!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
--	SetMissionV(this.mv7,0);
end

function stageFight7.callFish()
	self = stageFight7;
	local nLFidx = ttd_findNpc("T� Nh�m Ng� H�nh");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	if nLFidx ~= 0 and IsNpcDeath(nLFidx) ~= 1 and nQRSidx ~= 0 and IsNpcDeath(nQRSidx) ~= 1 then
		local m,x,y = GetNpcWorldPos(nLFidx);
		local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
		local tFishName = {"�c ��c Chi Huy�t T��ng Vi","�i H� Chi Ph�n Mai Kh�i"};
		local tFishModel = {"T�t �� Chi Huy�t T��ng Vi","T� Luy�n Chi Ph�n Mai Kh�i "};
		NpcChat(nLFidx,"Y�u nh� hoa, h�n c�ng nh� hoa�..Nh�m Ng� H�nh ph�i b�t l�c v�y sao?");
		NpcChat(nLFidx,"Ch� � m�u s�c hoa, m�u �� s� s�t th��ng Doanh Doanh, m�u h�ng ph�n ch�a tr� cho c� �y.");
		for i = 1,5 do
			local tFishPos = {{{1603,2709}},{{1596,2709}},{{1592,2720}},{{1600,2732}},{{1606,2720}}};
			local nRand = random(1,getn(tFishName));
			ttd_createSomeNpc({tFishModel[nRand],tFishName[nRand], thisFile, nil, CampEnemy, 0},tFishPos[i],{{1647,2656}},AT_SM_MOVE);
		end
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>T��ng Vi, Hoa Kh�i<color>xu�t hi�n r�i");
	end
end

function stageFight7.checkFish()
	local nLFidx = ttd_findNpc("T� Nh�m Ng� H�nh");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	if nLFidx ~= 0 and IsNpcDeath(nLFidx) ~= 1 and nQRSidx ~= 0 and IsNpcDeath(nQRSidx) ~= 1 then
		local tfish1 = ttd_findAllNpc("�c ��c Chi Huy�t T��ng Vi");
		local tfish2 = ttd_findAllNpc("�i H� Chi Ph�n Mai Kh�i");
		local nNum = getn(tfish1);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish1[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					local m,x,y = GetNpcWorldPos(nIDX);
					local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
					local x2,y2 = 1647,2656;
					local nDistance = floor(sqrt((x1-x)^2+(y1-y)^2)); --�������ӯӯ����
					local nDistance2 = floor(sqrt((x2-x)^2+(y2-y)^2));
					if nDistance <= 3 or nDistance2 <= 2 then --3����
						ttd_removeNpc(nIDX);
						CastState2Npc(nQRSidx,"imme_damage_life",10000000,1*18,0,19996);
					end
				end
			end
		end
		nNum = getn(tfish2);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish2[i];
				if IsNpcDeath(nIDX) ~= 1 then --��û��
					local m,x,y = GetNpcWorldPos(nIDX);
					local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
					local x2,y2 = 1647,2656;
					local nDistance = floor(sqrt((x1-x)^2+(y1-y)^2)); --�������ӯӯ����
					local nDistance2 = floor(sqrt((x2-x)^2+(y2-y)^2));
					if nDistance <= 3 or nDistance2 <= 2 then --3����
						ttd_removeNpc(nIDX);
						CastState2Npc(nQRSidx,"imme_life_point_add",10000000,1*18,0,19995);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight7 = inherit(cycPhase, stageFight7);

stageFight7.actions = {
	[1] = stageFight7.init,
}
stageFight7.cycActions = {
	[1] = {
		[0] = stageFight7.checkFish,
		start = 10,
	},
	[20] = {
		[0] = stageFight7.callFish,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight8 = {
	name = "�i th� 7: Th�ng Thi�n L�o T�",
	maxsecond = 5*60, --5����
	actionsType = "second",
	guage = {
		msg = "Th�ng Thi�n L�o T�",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight8:createSomeNpc()
	local nJZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
	local nLFidx = ttd_findNpc("Nh�m Ng� H�nh");
	if nJZidx ~= 0 then
		ttd_ChangeNpc2Fight(nJZidx);
		SetNpcActivator(nJWidx);
	else
		ttd_createSomeNpc(tNpcs.boss12,tPos.boss12);
	end
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
	else
		ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
	end
	if nLFidx ~= 0 then
		ttd_ChangeNpc2Fight(nLFidx);
		SetNpcActivator(nLFidx);
	else
		ttd_createSomeNpc(tNpcs.boss14,tPos.boss14);
	end

	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
--	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[7]);
end

function stageFight8:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Th�ng Thi�n L�o T�" then
		NpcChat(nNpcIDX,"Ph� th�n th�t b�i t�n bi�t bao c�ng phu, t�i h� th�t kh�ng cam l�ng!");
		--this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>�ؿ�ʤ��<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(8,strNpcName);
		this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
	end
end

function stageFight8:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[7][1], tbTraps[7][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
--		{m, tbTraps[7][3], tbTraps[7][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight8:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight8.init()
	self = stageFight8;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,8);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv7); --������ҵ���ӯӯ����
	this.msCamp:turnPlayer(0,HeadMsg2Player,"Gi�t<color=red>Th�ng Thi�n L�o T�<color>");
end

function stageFight8:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	NpcChat(nQRSidx,"Kh�ng ng� li�n th�, c�ng kh�ng ph�i ��i th� c�a Ma ��u!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	SetMissionV(firePhases.curPhaseLv,GetMissionV(firePhases.curPhaseLv)-1); --��һ��
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v��t �i th�t b�i#<color>");
end

function stageFight8.checkBoss()
	local nJZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	if nJZidx ~= 0 and IsNpcDeath(nJZidx) ~= 1 then
		local nMaxLife,nCurLife = GetUnitCurStates(nJZidx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		if nPercent <= 10 then
			local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
			local nLFidx = ttd_findNpc("Nh�m Ng� H�nh");
			local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
			NpcChat(nJZidx,"Giang s�n x� t�c c� nh�n t�i ph� tr� r�i, xem ra t�i h� gi� r�i, kh�ng th� s�nh v�i tu�i tr�, th�i, L�o phu �i ��y....");
			NpcChat(nLFidx,"T� g�y nghi�p ch��ng kh�ng th� s�ng.");
			NpcChat(nQRSidx,"��ch kh�ng c�n ���ng tho�t th�n, c�c v� ��ng ��o c�ng s�c c�ng l�c ki�t may l� kh�ng sao.");
			NpcChat(nJWidx,"Gi�o ch�, Doanh Doanh ch�ng ta l�i g�p n�a r�i.");
			local m,x,y = GetNpcWorldPos(nJZidx);
			ttd_passStage(8,GetNpcName(nJZidx));
			ttd_removeNpc(nJZidx);
			this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
		end
	end
end

----------------------------------------------------------------------
stageFight8 = inherit(cycPhase, stageFight8);

stageFight8.actions = {
	[1] = stageFight8.init,
}
stageFight8.cycActions = {
	[1] = {
		[0] = stageFight8.checkBoss,
		start = 0,
	},
}
----------------------------------------------------------------------
stageFight9 = {
	name = "K�t c�c c�a bi k�ch",
	maxsecond = 10*60, --5����
	actionsType = "second",
};

function stageFight9:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
				"\n r�i �i/_all_pass_leave",
				"\nK�t th�c ��i tho�i/nothing"
			};
		Say("Nh�m Doanh Doanh: Vi�c n�y �� k�t th�c, hy v�ng Cha sau n�y c� th� s�ng y�n �n r�i ��",
			getn(strtab),
			strtab)
	end
end

--�˳�
function _all_pass_leave()
	_op_on_team(_stat_on_player_when_all_pass)
	_stat_when_all_pass()
	ttd_confirmClose()
end

function stageFight9.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	local nQRSidx = ttd_createSomeNpc(tNpcs.qrs,{{1647,2656}});
	local nJWidx = ttd_createSomeNpc(tNpcs.boss13,{{1645,2647}});
	local nRWXidx = ttd_createSomeNpc(tNpcs.boss14,{{1657,2655}});
	local nTTLZidx = ttd_createSomeNpc(tNpcs.boss10,{{1656,2646}});
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Talk(nJWidx);
		SetNpcScript(nJWidx,"");
		SetNpcActivator(nJWidx);
	end
	if nQRSidx ~= 0 then
		ttd_ChangeNpc2Talk(nQRSidx);
		SetNpcScript(nQRSidx,"");
		SetNpcActivator(nQRSidx);
	end
	if nRWXidx ~= 0 then
		ttd_ChangeNpc2Talk(nRWXidx);
		SetNpcActivator(nRWXidx);
	end
	if nTTLZidx ~= 0 then
		ttd_ChangeNpc2Talk(nTTLZidx);
		SetNpcActivator(nTTLZidx);
	end
	this.msCamp:turnPlayer(0,ttd_setPos,1651, 2659); --�������
	SetCurrentNpcSFX(nTTLZidx,913,0,1,18*60*2);
	NpcChat(nTTLZidx,"Kh�ng... t�i h� �� th�t b�i r�i.");
end

function stageFight9.checkBoss()
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local nRWXidx = ttd_findNpc("Nh�m Ng� H�nh");
	local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
	local nTTLZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	if nTTLZidx ~= 0 then
		NpcChat(nRWXidx,"T�i h� r�t cu�c c�ng �� t�nh r�i.");
		NpcChat(nQRSidx,"Cha�cha�");
		NpcChat(nJWidx,"Qu� t�t r�i, gi�o ch� b�nh y�n v� s� r�i.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		ttd_removeNpc(nTTLZidx);
		---------------------
		--������
		this.msCamp:turnPlayer(0,ttd_ModifyExp,7); --����
		--������
		local m,x,y = GetWorldPos();
		local nNpcIndex = CreateNpc("B�o r��ng T�i nguy�n",format("%s B�o R��ng","Th�ng Thi�n L�o T�"),m,tTtdBoxAward[7][1],tTtdBoxAward[7][2]);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\hunduantongtianding\\head.lua");
		--���ý�����һ�ؿ���
		SetMissionV(tbHDTTD.mv23,nNpcIndex);
		---------------------
		SetNpcScript(nQRSidx,thisFile);
	end
end

function stageFight9.onTimeout()
	this:Msg2MSAll("Th�i gian k�t th�c, h�y r�i kh�i Thi�n Th�ng ��nh!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight9 = inherit(cycPhase, stageFight9);

stageFight9.actions = {
	[1] = stageFight9.init,
};
stageFight9.cycActions = {
	[1] = {
		[0] = stageFight9.checkBoss,
		start = 8,
	},
};

----------------------------------------------------------------------
stageFight10 = {
	name = "K�t c�c c�a h�i k�ch",
	maxsecond = 10*60, --5����
	actionsType = "second",
};

function stageFight10:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Nh�m Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
				"\n r�i �i/ttd_confirmClose",
				"\nK�t th�c ��i tho�i/nothing"
			};
		Say("Nh�m Doanh Doanh: Vi�c n�y �� k�t th�c, hy v�ng Cha sau n�y c� th� s�ng y�n �n r�i ��",
			getn(strtab),
			strtab)
	end
end

function stageFight10.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	local nQRSidx = ttd_createSomeNpc(tNpcs.qrs,{{1647,2656}});
	local nJWidx = ttd_createSomeNpc(tNpcs.boss13,{{1645,2647}});
	local nRWXidx = ttd_createSomeNpc(tNpcs.boss14,{{1657,2655}});
	local nTTLZidx = ttd_createSomeNpc(tNpcs.boss10,{{1656,2646}});
	if nQRSidx ~= 0 then
		ttd_ChangeNpc2Talk(nQRSidx);
		SetNpcScript(nQRSidx,"");
		SetNpcActivator(nQRSidx);
	end
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Talk(nJWidx);
		SetNpcScript(nJWidx,"");
		SetNpcActivator(nJWidx);
	end
	if nRWXidx ~= 0 then
		ttd_ChangeNpc2Talk(nRWXidx);
		SetNpcActivator(nRWXidx);
	end
	if nTTLZidx ~= 0 then
		ttd_ChangeNpc2Talk(nTTLZidx);
		SetNpcActivator(nTTLZidx);
	end
	this.msCamp:turnPlayer(0,ttd_setPos,1651, 2659); --�������
	SetCurrentNpcSFX(nTTLZidx,913,0,1,18*60*2);
	NpcChat(nTTLZidx,"Kh�ng... t�i h� �� th�t b�i r�i.");
end

function stageFight10.checkBoss()
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	local nRWXidx = ttd_findNpc("Nh�m Ng� H�nh");
	local nJWidx = ttd_findNpc("H��ng V�n Thi�n");
	local nTTLZidx = ttd_findNpc("Th�ng Thi�n L�o T�");
	if nTTLZidx ~= 0 then
		NpcChat(nRWXidx,"T�i h� r�t cu�c c�ng �� t�nh r�i.");
		NpcChat(nQRSidx,"Cha�cha�");
		NpcChat(nJWidx,"Qu� t�t r�i, gi�o ch� b�nh y�n v� s� r�i.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v��t �i th�nh c�ng<color>");
		ttd_removeNpc(nTTLZidx);
		---------------------
		--������
		this.msCamp:turnPlayer(0,ttd_ModifyExp,8); --����
		--������
		local m,x,y = GetWorldPos();
		local nNpcIndex = CreateNpc("B�o r��ng T�i nguy�n",format("%s B�o R��ng","Th�ng Thi�n L�o T�"),m,tTtdBoxAward[8][1],tTtdBoxAward[8][2]);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\hunduantongtianding\\head.lua");
		--���ý�����һ�ؿ���
		SetMissionV(tbHDTTD.mv23,nNpcIndex);
		---------------------
		SetNpcScript(nQRSidx,thisFile);
	end
end

function stageFight10.onTimeout()
	this:Msg2MSAll("Th�i gian k�t th�c, h�y r�i kh�i Thi�n Th�ng ��nh!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight10 = inherit(cycPhase, stageFight10);

stageFight10.actions = {
	[1] = stageFight10.init,
};
stageFight10.cycActions = {
	[1] = {
		[0] = stageFight10.checkBoss,
		start = 8,
	},
};

----------------------------------------------------------------------
firePhases.phases = {stageFight00,stageFight0,stageFight1,stageFight1_2,stageFight2,stageFight2_3,stageFight3,stageFight3_4,stageFight4,stageFight4_5,stageFight5,stageFight5_6,stageFight6,stageFight6_7,stageFight7,stageFight8,stageFight9,stageFight10};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "Trong 150 ph�t n�u kh�ng v��t qua Th�ng Thi�n ��nh, c�a �i s� ��ng l�i!");
	ttd_confirmClose();
end

function firePhases:getPhase()
	local n = GetMissionV(self.curPhaseLv);
	local s = self.phases[n];
	if not s then
		print(format("[error] [firePhases:getPhase] [n=%s, s=%s]", tostring(n), tostring(s)));
		return nil;
	end
	return s;
end

function firePhases:onFailed()
	local nCurLv = GetMissionV(self.curPhaseLv)-1;
	SetMissionV(self.curPhaseLv,nCurLv);
	if self.phases[nCurLv] then
		self.phases[nCurLv]:onInit(self);
	else
		self:onTimeout();
	end
end

----------------------------------------------------------------------
tbHDTTD = gf_CopyInherit(missionBase, tbHDTTD);

tbHDTTD.msOption.bSetPkFlag = 0; --����ģʽ
tbHDTTD.msOption.bSetPkCamp = 0;
tbHDTTD.msOption.szInitDeahScript = thisFile;

tbHDTTD.msPhases[1] = firePhases;

tbHDTTD.msPosition.entryPos = {
	{1592,3201},
};
tbHDTTD.msPosition.exitPos = {500, 1736, 3043};

--function tbHDTTD:onInit()
----	print("tbHDTTD:onInit")
--	missionBase.onInit(self);
--	firePhases:onInit();
--end

tbHDTTD.msOption.OnPlayerJoin = function(self, nCamp)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --��ʱ������

	--��ʼ������
	MissionAward_Initialize();
	
	--gf_WriteLogEx("tongtian mission", "enter mission");

--	if GetCaptainName() == GetName() then --�ӳ�
--		SetTeamForbitType(GetTeamID(),-1,0);
--	end
end

tbHDTTD.msOption.OnPlayerLeave = function(self, nCamp)
	ttd_cleanGodState();
	MissionAward_UnInitialize()--����ʼ���ؿ�����
--	if GetCaptainName() == GetName() then --�ӳ�
--		SetTeamForbitType(GetTeamID(),0,0);
--	end
	--local nCurStage = GetMissionV(MV_STAGE) or 0;
	--gf_WriteLogEx("tongtian mission", format("leave mission at stage %d", nCurStage));
end

this = tbHDTTD;
