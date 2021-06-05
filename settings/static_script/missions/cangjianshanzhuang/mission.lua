Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\box_jingli.lua")

---------------------------------------------------------
function main()
	local nNpcIDX = GetTargetNpc();
	local tCurPhase = this.msPhases[1]:getPhase();
	if GetMissionV(this.mv22) ~= 0 then
		local nStep = GetMissionV(MV_STAGE);
		if nStep == 4 then
			Say("M� B�o R��ng V�n Ki�m Tr�ng m�i c� th� r�i �i",1,"\nTa bi�t r�i/ttd_nothing");
			return 0;
		else
			Say("M� B�o R��ng V�n Ki�m Tr�ng m�i c� th� v�o �i k� ti�p",2,"\nTa bi�t r�i/ttd_nothing","\n r�i �i/ttd_askClose");
			return 0;
		end
	end
	remove_jingli_box()--ɾ����������
	if tCurPhase and tCurPhase.onTalk then
		tCurPhase:onTalk(nNpcIDX);
	end
end

function onPlayerDeath(nkiller)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onPlayerDeath then
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
	if f == nil then
		onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
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
cycPhase.DEBUG = 1;

function cycPhase:onPlayerDeath(nkiller)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1760*32,3232*32); --��ʱ������
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "Tr��c khi v��t �i",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight00:createSomeNpc()
--	local nNpcIDX = ttd_createSomeNpc(tNpcs.jtyl,tPos.jtyl);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	ttd_createSomeNpc(tNpcs.yzq,tPos.yzq);
--	ttd_createSomeNpc(tNpcs.cjzl,tPos.cjzl);
--	ttd_createSomeNpc(tNpcs.cjxj,tPos.cjxj);
--	ttd_createSomeNpc(tNpcs.nyzg,tPos.nyzg);
--	ttd_createSomeNpc(tNpcs.wyzg,tPos.wyzg,{{1699,3154}},AT_SM_MOVE);

	ttd_createJTYL(1)

	local MAX_STAGE = getn(t_stand_npc)
	for i = 1, MAX_STAGE do
		local nNpcIDX = ttd_createSomeNpc(t_stand_npc[i].npc, t_stand_npc[i].pos);
		ttd_ChangeNpc2Talk(nNpcIDX)
	end
end

function stageFight00.init()
	self = stageFight00;
	self:createSomeNpc();
end

function stageFight00.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight00.checkPos()
	self = stageFight00;
--	local nWYZGidx = ttd_findNpc(this.szNpc_waiyuanzongguan);
	local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
--	local nYZQidx = ttd_findNpc(this.szNpc_yeziqiu);
	local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
--	local nCJZLidx = ttd_findNpc(this.szNpc_zhanglao);
--	local nCJXJidx = ttd_findNpc(this.szNpc_xiaojie);
--	local nNYZGidx = ttd_findNpc(this.szNpc_neiyuanzongguan); 
	local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
--	local nMapID,nPosX,nPosY = GetNpcWorldPos(nWYZGidx);
--	local m,x,y = GetNpcWorldPos(nYZQidx);
----	local nDistance = floor(sqrt((nPosX-1699)^2+(nPosY-3154)^2));
--	local nDistance2 = floor(sqrt((x-1672)^2+(y-3125)^2));
	local nDialog = GetMissionV(this.mv1);
--	if nDistance2 <= 3 then
--		ttd_removeNpc(nYZQidx);
--		ttd_removeNpc(nWYZGidx);
--		ttd_removeNpc(nCJZLidx);
--		ttd_removeNpc(nCJXJidx);
--		ttd_removeNpc(nNYZGidx);
--	end
--	if nDialog ~= 0 then
		if nDialog >= 14 then --�ϻ�˵�꿪��
			self:onFinish();
		else
			SetMissionV(this.mv1,nDialog+1);
			local tDialogs = {
				{nJTYLidx,"Nh�m gi�o ch� qu� nhi�n gi� l�i l�a, ��n ��ng h�n. �� N� hi�p n�y l�?"},
				{nLFidx, "Ha�ha�, ��y l� �i n� c�a t�i h� Nh�m Doanh Doanh. "},
				{nJTYLidx,"L�nh thi�n kim t�i s�c v�n to�n, kh�ng h� danh l� �i n� c�a Nh�m gi�o ch�."},
				{nQRSidx, "Giang Huynh qu� l�i r�i."},
				{nLFidx, "C�c v� ��ng ��o �� ��n ��, h�y mau ph� h�y Phong �n th�i."},
				{nJTYLidx,"Nh� v�y th� t�t qu�. C�c v� ��ng ��o kh�i h�nh ���c ch�a?"},
			};
--			if nDialog == 8 then
--				ttd_ChangeNpc2Fight(nYZQidx);
--				g_NpcAI:setAI(nYZQidx, AT_SM_MOVE);
--				g_NpcAI:setWayPoint(nYZQidx, {{1672,3125}});
--				g_NpcAI:setAI(nWYZGidx, AT_SM_MOVE);
--				g_NpcAI:setWayPoint(nWYZGidx, {{1672,3125}});				
--			end
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
	name = "Cao tr�o tr��c khi v��t �i",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight0:createSomeNpc()
	local szMsg = format("��i tr��ng ��i tho�i Giang Bi�t H�c m� �i �i!")
	this:Msg2MSAll(szMsg);
    this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
end

function stageFight0:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n m� �i th� 1: S�t th� Binh M� D�ng/#stageFight0.gotoOne(1)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		Say("Giang Bi�t H�c: C�c v� ��ng ��o kh�i h�nh ���c ch�a?",
			getn(strtab),
			strtab)
	end
end

function stageFight0.gotoOne(nType)
	self:onFinish();
	ds_JZMY:AddStatValue(1,1,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight0.init()
	self = stageFight0;
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_createJTYL(1);
	ttd_createWRX();
	self:createSomeNpc();
end

function stageFight0.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight0 = inherit(cycPhase, stageFight0);

stageFight0.actions = {
	[1] = stageFight0.init,
};


---------------------------------------------------------
stageFight1 = {
	name = "�i th� 1: S�t th� Binh M� D�ng",
	maxsecond = 8*60,
	actionsType = "second",
	guage = {
		msg = "S�t th� Binh M� D�ng",
		time = 8*60,
		cyc = 0,
		id = 2,
	},
	fishNum = { --��������
		{{"V�n Ki�m Binh M� D�ng",4, "Binh M� D�ng"},{"V�n Ki�m Binh M� D�ng X� Th�",1, "X� th� Binh M� D�ng"},{"V�n Ki�m Binh M� D�ng X� Th�",1, "X� th� Binh M� D�ng"}},
		{{"V�n Ki�m Binh M� D�ng",6, "Binh M� D�ng"},{"V�n Ki�m Binh M� D�ng X� Th�",4, "X� th� Binh M� D�ng"},{"V�n Ki�m Binh M� Phu Tr��ng",2, "Binh M� B�ch Phu Tr��ng"}},
		{{"V�n Ki�m Binh M� D�ng",8, "Binh M� D�ng"},{"V�n Ki�m Binh M� D�ng X� Th�",8, "X� th� Binh M� D�ng"},{"V�n Ki�m Binh M� Phu Tr��ng",4, "Binh M� B�ch Phu Tr��ng"}},
		},
	fishPos = {{1672,3125},{1667,3137},{1684,3120},{1698,3122},{1663,3150}},
};

function stageFight1:createSomeNpc()
--	local nCurFish = GetMissionV(this.mv2)+1;
--	local nFishNum = self.fishNum[nCurFish][1][2] + self.fishNum[nCurFish][2][2];
--	for i = 1,self.fishNum[nCurFish][1][2] do
--		local nRand = random(1,getn(self.fishPos))
--		ttd_createSomeNpc({self.fishNum[nCurFish][1][1],self.fishNum[nCurFish][1][1],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
--	end
--	for j = 1,self.fishNum[nCurFish][2][2] do
--		local nRand = random(1,getn(self.fishPos))
--		ttd_createSomeNpc({self.fishNum[nCurFish][2][1],self.fishNum[nCurFish][2][1],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
--	end	
--	SetMissionV(this.mv2,nCurFish);
--	SetMissionV(this.mv3,nFishNum);
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	NpcChat(nNpcIdxJBH, "T� Linh Chi H�n nghe tri�u g�i, ph� ph�p��ng Linh hi�n");
	
--	local MAX_STAGE = getn(t_stand_npc)
--	for i = 1, MAX_STAGE do
--		local nNpcIDX = ttd_findNpc(t_stand_npc[i].npc[2]);
--		ttd_removeNpc(nNpcIDX)
--	end
	
	ttd_StagePreStart(1)
	SetMissionV(this.mv4,5)
end

function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_tongling then
		ttd_passStage(1,strNpcName);
		local szMsg = format("V��t �i th�nh c�ng")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    	--local szMsg2 = format("%s:�������ܣ�û����ס��ڣ��", strNpcName)
    	--this.msCamp:turnPlayer(0, Msg2Player, szMsg2);
    	NpcChat(nNpcIDX, "Thu�c h� b�t t�i kh�ng th� tr�n th� V�n Ki�m Tr�ng.");
	elseif strNpcName == self.fishNum[3][1][3] or strNpcName == self.fishNum[3][2][3] or strNpcName == self.fishNum[3][3][3] then
		SetMissionV(this.mv3,GetMissionV(this.mv3)-1);
	end
end

function stageFight1.init()
	self = stageFight1;
	SetMissionV(MV_STAGE,1);	
	SetMissionV(this.mv2,0);
	SetMissionV(this.mv3,0);
	SetMissionV(this.mv4,0);
	SetMissionV(this.mv5,0);
	SetMissionV(this.mv10,0);
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --�������
end

function stageFight1:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight1.callBoss()
	self = stageFight1;
	if GetMissionV(this.mv5) == 0 then
		local nCurFish = GetMissionV(this.mv2);
		local nCurNum = GetMissionV(this.mv3);
		local nCurTime = GetMissionV(this.mv4);		
		if nCurFish == 3 then
			if nCurNum <= 0 then
				if nCurTime <= 0 then
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv5,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --��Ч
						g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nNpcIDX, {{1689, 3154}});
						
						NpcChat(nNpcIDX,"K� n�o x�ng v�o ��y ��u ph�i ch�t.");
						local szMsg = format("��nh b�i Binh M� D�ng Th�ng L�nh")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
				else
					SetMissionV(this.mv4,nCurTime - 1);
				end
			end
		end
	end
end

function stageFight1.callFish()
	self = stageFight1;
	local nCurFish = GetMissionV(this.mv2)+1;
	local nCurNum = GetMissionV(this.mv3);
	local nCurTime = GetMissionV(this.mv4);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nCurFish < 4 then --��3�ؾͲ����ж���
		if nCurNum <= 0 then
			if nCurTime <= 0 then
				
				SetMissionV(this.mv4,5); --5��
				
				if nPreStageStatus ~= 0 then
					ttd_StagePreEnd()
					local szMsg = format("�� ph� h�y Th��ng �ng Phong �n ")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				SetMissionV(this.mv4,3);
				else
					local nFishNum = self.fishNum[nCurFish][1][2] + self.fishNum[nCurFish][2][2] + self.fishNum[nCurFish][3][2];
    				for i = 1,self.fishNum[nCurFish][1][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][1][1],self.fishNum[nCurFish][1][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end
    				for j = 1,self.fishNum[nCurFish][2][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][2][1],self.fishNum[nCurFish][2][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end
    				for k = 1,self.fishNum[nCurFish][3][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][3][1],self.fishNum[nCurFish][3][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end			
    				SetMissionV(this.mv2,nCurFish);
    				SetMissionV(this.mv3,nFishNum);
    				
    				local szMsg = format("Th� v� ��t th� %d xu�t hi�n ", nCurFish)
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				if 1 == nCurFish then
    					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
						local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
						local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
						--3��NPC��ս��NPC
						ttd_ChangeNpc2Fight(nJTYLidx);
						ttd_ChangeNpc2Fight(nLFidx);
						ttd_ChangeNpc2Fight(nQRSidx);
    					g_NpcAI:setAI(nJTYLidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nJTYLidx, {{1676, 3153}});
						g_NpcAI:setAI(nLFidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nLFidx, {{1684, 3148}});
						g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nQRSidx, {{1690, 3139}});
    				end
				end		
			else
				SetMissionV(this.mv4,nCurTime - 1);
				
				if nPreStageStatus ~= 0 then
					local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
    				local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
					if nPreStageStatus == 1 then
        				local t_talk = {
        					--[10] = {nNpcIdxJBH, "����֮�������ٻ����Ʒ���"},
        					[4]  = {nNpcIdxRYY, "Giang huynh qu� th�t l�i h�i."},
        				}
        				if t_talk[nCurTime] then
        					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
        				end
    					if nCurTime == 3 then
    						ttd_StagePreMid()
    					end
					elseif nPreStageStatus == 2 then
						local t_talk = {
        					[2] = {nNpcIdxJBH, "Hay l�m, Th��ng �ng Phong �n ph� h�y r�i. H�y chu�n b� chi�n ��u, h� v� Th��ng �ng Phong �n s�p xu�t hi�n."},
        					[1]  = {nNpcIdxRYY, "Nguy! b� bao v�y r�i...."},
        				}
        				if t_talk[nCurTime] then
        					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
        				end
					end
				end
			end
		end
	end
end

function stageFight1.callFish2()
	self = stageFight1;
	local nBossIdx = ttd_findNpc(this.szNpc_tongling);
	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
		local nNum = GetMissionV(this.mv10)
		if nNum >= 3 then
			return 0;
		end

		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		local m,x,y = GetNpcWorldPos(nBossIdx);
		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
			local nNewBoss = ttd_createSomeNpc({"V�n Ki�m Th�ng L�nh ph�n th�n",this.szNpc_tongling, nil, 30, CampEnemy, 0},{{x,y}});
			if nNewBoss ~= 0 then
				SetMissionV(this.mv10,nNum+1);
				local nMaxLife2 = GetUnitCurStates(nNewBoss,1);
				ModifyNpcData(nNewBoss,0,floor(nMaxLife2*nPercent/100),0);
				NpcChat(nNewBoss,"Thi�n bi�n v�n h�a, l�i h�i tuy�t ��nh!");
				NpcChat(nBossIdx,"Thi�n bi�n v�n h�a, l�i h�i tuy�t ��nh!");
			end
		end
	end
end
----------------------------------------------------------------------
stageFight1 = inherit(cycPhase, stageFight1);

stageFight1.actions = {
	[1] = stageFight1.init,
}
stageFight1.cycActions = {
	[1] = {
		[0] = {stageFight1.callFish,stageFight1.callBoss},
		start = 5,
	},
	[2] = {
		[0] = stageFight1.callFish2,
		start = 15,
	},	
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "Tr��c khi v��t �i l�n 2",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight1_2:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n m� �i th� 2: Ki�m Tr�ng C� Quan/#stageFight1_2.gotoTwo(1)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		Say("Giang Bi�t H�c: chu�n b� t�n c�ng.",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
	self:onFinish();
	ds_JZMY:AddStatValue(1,2,1);
	remove_tong_box()
	remove_yin_box()
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight1_2.init()
	self = stageFight1_2;
	ttd_createJTYL(2);
	ttd_createWRX();
end

function stageFight1_2.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight1_2 = inherit(cycPhase, stageFight1_2);

stageFight1_2.actions = {
	[1] = stageFight1_2.init,
};

---------------------------------------------------------------------
stageFight2 = {
	name = "�i th� 2: Ki�m Tr�ng C� Quan",
	maxsecond = 8*60, 
	actionsType = "second",
	guage = {
		msg = "Ki�m Tr�ng C� Quan",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
	fishNum = { --��������
		{{"Th�ch Nh�n Qu� Kh�i L�i",8},},
		{{"Th�ch Nh�n Qu� Kh�i L�i",6},{"M�c Nh�n Y�u",4},},
		{{"Th�ch Nh�n Qu� Kh�i L�i",6},{"M�c Nh�n Y�u",4},{"H�a Di�m Th�ch Nh�n Kh�i L�i",2}},
		},
	fishPos = {{1672,3125},{1667,3137},{1684,3120},{1698,3122},{1663,3150}},
};

function stageFight2:createSomeNpc()
--	local nCurFish = GetMissionV(this.mv6)+1;
--	local nFishNum = self.fishNum[nCurFish][1][2]
--	for i = 1,self.fishNum[nCurFish][1][2] do
--		local nRand = random(1,getn(self.fishPos))
--		ttd_createSomeNpc({self.fishNum[nCurFish][1][1],self.fishNum[nCurFish][1][1],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
--	end
--	SetMissionV(this.mv6,nCurFish);
--	SetMissionV(this.mv7,nFishNum);
	SetMissionV(this.mv8,5); --5��
	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	NpcChat(nNpcIdxJBH, "T� Linh Chi H�n nghe tri�u g�i, ph� ph�p�Thanh Long hi�n");
	
	ttd_StagePreStart(2)
end

function stageFight2:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiguanzhu then
		ttd_passStage(2,strNpcName);
		local szMsg = format("V��t �i th�nh c�ng")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
	elseif strNpcName == self.fishNum[3][1][1] or strNpcName == self.fishNum[3][2][1] or strNpcName == self.fishNum[3][3][1] then
		SetMissionV(this.mv7,GetMissionV(this.mv7)-1);
	end
end

function stageFight2.init()
	self = stageFight2;
	SetMissionV(MV_STAGE,2);	
	SetMissionV(this.mv6,0);
	SetMissionV(this.mv7,0);
	SetMissionV(this.mv8,0);
	SetMissionV(this.mv9,0);
	SetMissionV(this.mv11,0);
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --�������
end

function stageFight2:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight2.callBoss()
	self = stageFight2;
	if GetMissionV(this.mv9) == 0 then
		local nCurFish = GetMissionV(this.mv6);
		local nCurNum = GetMissionV(this.mv7);
		local nCurTime = GetMissionV(this.mv8);		
		if nCurFish == 3 then
			if nCurNum <= 0 then
				if nCurTime <= 0 then
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv9,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --��Ч
						
						local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
						NpcChat(nNpcIdxJBH,"Qu� nhi�n l� B�n Long C� Quan. Mau ch�ng gi�t ch�t ��ng �� ch�ng tri�u g�i H�a Vi�m Th�ch Nh�n.");
						local szMsg = format("Ph� h�y B�n Long C� Quan.")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
				else
					SetMissionV(this.mv8,nCurTime - 1);
				end
			end
		end
	end
end

function stageFight2.callFish()
	self = stageFight2;
	local nCurFish = GetMissionV(this.mv6)+1;
	local nCurNum = GetMissionV(this.mv7);
	local nCurTime = GetMissionV(this.mv8);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nCurFish < 4 then --��3�ؾͲ����ж���
		if nCurNum <= 0 then
			if nCurTime <= 0 then
				SetMissionV(this.mv8,5); --5��
				if nPreStageStatus ~= 0 then
					--3��NPC��ս��NPC
					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
					local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
					local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
					ttd_ChangeNpc2Fight(nJTYLidx);
					ttd_ChangeNpc2Fight(nLFidx);
					ttd_ChangeNpc2Fight(nQRSidx);
					
					ttd_StagePreEnd()
					local szMsg = format("Thanh Long Phong �n b� ph� h�y r�i.")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				SetMissionV(this.mv8,3); --5��
				else
					local nFishNum = 0
					for x = 1, 3 do
						local t = self.fishNum[nCurFish][x]
						if t then
							local nCurNum = t[2]
							nFishNum = nFishNum + nCurNum
							for i = 1,nCurNum do
    							local nRand = random(1,getn(self.fishPos))
    							ttd_createSomeNpc({t[1],t[1],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    						end
						end
						
					end
    				SetMissionV(this.mv6,nCurFish);
    				SetMissionV(this.mv7,nFishNum);
    				
    				local szMsg = format("Th� v� ��t th� %d xu�t hi�n ", nCurFish)
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				if 1 == nCurFish then
    					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
						local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
						local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
    					g_NpcAI:setAI(nJTYLidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nJTYLidx, {{1676, 3153}});
						g_NpcAI:setAI(nLFidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nLFidx, {{1684, 3148}});
						g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nQRSidx, {{1684, 3139}});
    				end
				end	
			else
				SetMissionV(this.mv8,nCurTime - 1);
				
				if nPreStageStatus ~= 0 then
					local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
    				local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
					if nPreStageStatus == 1 then
        				local t_talk = {
        					--[10] = {nNpcIdxJBH, "����֮�������ٻ����Ʒ���"},
        					[4]  = {nNpcIdxRYY, "Kh�ng bi�t Thanh Long Phong �n ai �ang tr�n th�."},
        				}
        				if t_talk[nCurTime] then
        					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
        				end
    					if nCurTime == 2 then
    						ttd_StagePreMid()
    					end
					elseif nPreStageStatus == 2 then
						--do nothing
					end
				end
			end
		end
	end
end

function stageFight2.callFish2()
	self = stageFight2;
	local nBossIdx = ttd_findNpc(this.szNpc_jiguanzhu);
	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
		local nNum = GetMissionV(this.mv11)
		if nNum >= 3 then
			return 0;
		end
		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		local m,x,y = GetNpcWorldPos(nBossIdx);
		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
			local nNewBoss = ttd_createSomeNpc({"H�a Di�m Th�ch Nh�n Kh�i L�i","H�a Di�m Th�ch Nh�n", nil, nil, CampEnemy, 0},{{x+1,y+1},{x-1,y-1}});
			if nNewBoss ~= 0 then
				SetMissionV(this.mv11,nNum+1);
				local szMsg = format("H�a Di�m Th�ch Nh�n xu�t hi�n ")
    			this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
			end
		end
	end
end

--function stageFight2.callFish3(nType)
--	self = stageFight2;
--	if not nType then
--		return 0;
--	end
--	local nBossIdx = ttd_findNpc(this.szNpc_jiguanzhu);
--	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then	
--		local tFishModelName = {"�򽣱���ٸ","�򽣱���ٸ����","�򽣱���ٷ�"};
--		local tFishName = {"����ٸ","����ٸ����","����ٷ�"};
--		ttd_createSomeNpc({tFishModelName[nType],tFishName[nType], nil, nil, CampNeutral, 0},{{1672,3125}},{{1699,3154}});
--	end
--end
----------------------------------------------------------------------
stageFight2 = inherit(cycPhase, stageFight2);

stageFight2.actions = {
	[1] = stageFight2.init,
}
stageFight2.cycActions = {
	[1] = {
		[0] = {stageFight2.callFish,stageFight2.callBoss},
		start = 5,
	},
	[2] = {
		[0] = stageFight2.callFish2,
		start = 15,
	},
--	[10] = {
--		[0] = callout(stageFight2.callFish3,1),
--		start = 10,
--	},
--	[15] = {
--		[0] = callout(stageFight2.callFish3,2),
--		start = 25,
--	},
--	[30] = {
--		[0] = callout(stageFight2.callFish3,3),
--		start = 60,
--	},	
}

----------------------------------------------------------------------
stageFight2_3 = {
	name = "Cao tr�o l�n 2",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight2_3:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n m� �i th� 3: H� Ki�m Ki�m Linh/#stageFight2_3.gotoThree(1)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		Say("Giang Bi�t H�c: Ha� mau ph� h�y 2 Phong �n �i.",
			getn(strtab),
			strtab)
	end
end

function stageFight2_3.gotoThree(nType)
	self:onFinish();
	ds_JZMY:AddStatValue(1,3,1);
	remove_tong_box()
	remove_yin_box()
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight2_3.init()
	ttd_createJTYL(3);
	ttd_createWRX();
end

function stageFight2_3.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight2_3 = inherit(cycPhase, stageFight2_3);

stageFight2_3.actions = {
	[1] = stageFight2_3.init,
};

---------------------------------------------------------------------
stageFight3 = {
	name = "�i th� 3: H� Ki�m Ki�m Linh",
	maxsecond = 8*60, 
	actionsType = "second",
	guage = {
		msg = "H� Ki�m Ki�m Linh",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
};
---------------------------------------------------------------------
function stageFight3:createSomeNpc()
--	local nBossIdx = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
--	g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	NpcChat(nNpcIdxJBH, "T� Linh Chi H�n nghe tri�u g�i, ph� kh�ng�H�a Ph��ng hi�n");
	
	ttd_StagePreStart(3)
	SetMissionV(this.mv21,0) --��ʱ������
end

function stageFight3:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_tianjian or strNpcName == this.szNpc_dijian or strNpcName == this.szNpc_renjian then
		ttd_removeNpc(nNpcIDX);
		SetMissionV(this.mv12,GetMissionV(this.mv12)+1);
		SetMissionV(this.mv13,5);
		if GetMissionV(this.mv12) >= 4 then
			NpcChat(nNpcIDX, "�...kh�ng...b�n ng��i nh�t ��nh ph�i h�n h�n!");
		end
	end
	if GetMissionV(this.mv12) >= 6 then
		--this.msCamp:turnPlayer(0, Msg2Player, "�콣Ҷ�磬�ؽ�Ҷ�����˽�Ҷ�Σ������������ǻ��ڵģ�");
        local szMsg = format("V��t �i th�nh c�ng")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
		ttd_passStage(3,"Ki�m Linh");
	end	
end

function stageFight3.init()
	self = stageFight3;
	SetMissionV(MV_STAGE,3);	
	SetMissionV(this.mv12,0);
	SetMissionV(this.mv13,0);
	SetMissionV(this.mv14,0);
	SetMissionV(this.mv15,0);
	SetMissionV(this.mv16,0);		
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --�������
end

function stageFight3:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight3.callBoss()
	self = stageFight3;
	local nBossIdx1 = ttd_findNpc(this.szNpc_tianjian);
	local nBossIdx2 = ttd_findNpc(this.szNpc_dijian);
	local nBossIdx3 = ttd_findNpc(this.szNpc_renjian);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nPreStageStatus == 0 then
		if GetMissionV(this.mv12) == 0 then
			if nBossIdx1 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --��Ч
					g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
					g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
					NpcChat(nBossIdx, "K� n�o d�m x�ng v�o V�n Ki�m Tr�ng!");
					local szMsg = format("��nh b�i h� v� Thi�n Ki�m")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
		elseif GetMissionV(this.mv12) == 1 then
    		if nBossIdx2 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --��Ч
    				g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
    				g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
    				NpcChat(nBossIdx, "T�i h� ch� h� v� V�n Ki�m Tr�ng ng�n n�m nay, ai d�m ph� ho�i k� �� ph�i ch�t!");
					local szMsg = format("��nh b�i h� v� ��a Ki�m")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
    	elseif GetMissionV(this.mv12) == 2 then
    		if nBossIdx3 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --��Ч
    				g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
    				g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
    				NpcChat(nBossIdx, "Th�ng Thi�n M�t C�nh kh�ng th� t�i xu�t giang h�, t�i h� s�ng ch� �� ng�n c�n ng�y n�y.");
					local szMsg = format("��nh b�i h� v� Nh�n Ki�m")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
    	elseif GetMissionV(this.mv12) == 3 then
    		
    		local nCurTime = GetMissionV(this.mv21);
			SetMissionV(this.mv21,nCurTime + 1);
			
			if nCurTime >= 8 then
				if nBossIdx1 == 0 then
					SetMissionV(this.mv13, 0);--���ü�ʱ�ˣ��Ի�����ֱ�ӿ���
        			local nCurTime = GetMissionV(this.mv13);	
        			if nCurTime <= 0 then
        				local idx1 = ttd_createSomeNpc(tNpcs.boss3,{1686,3151});
        				local idx2 = ttd_createSomeNpc(tNpcs.boss4,{1686,3151});
        				local idx3 = ttd_createSomeNpc(tNpcs.boss5,{1686,3151});
        				SetCurrentNpcSFX(idx1, 905, 0, 0); --��Ч
        				SetCurrentNpcSFX(idx2, 905, 0, 0); --��Ч
        				SetCurrentNpcSFX(idx3, 905, 0, 0); --��Ч
        				local szMsg = "Tr�m!"
        				NpcChat(idx1, szMsg);
        				NpcChat(idx2, szMsg);
        				NpcChat(idx3, szMsg);
        				
        				local szMsg = format("��nh b�i Thi�n ��a Nh�n Tam Ki�m")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
        			else
        				SetMissionV(this.mv13,nCurTime - 1);
        			end
        		end	
			else
				t_msg = {
					[1] = {"Thi�n Ki�m Di�p Phong: T�i h� l� Ki�m Th�n"},
					[3] = {"��a Ki�m Di�p B�ng: T�i h� l� Ki�m B�nh "},
					[5] = {"Nh�n Ki�m Di�p M�ng: T�i h� l� Ki�m H�n"},
					[7] = {"Thi�n Ki�m Di�p Phong, ��a Ki�m Di�p B�ng, Nh�n Ki�m Di�p M�ng: Thi�n ��a Nh�n Ki�m t�i xu�t giang h�."},
					}
				if t_msg[nCurTime] then
					this.msCamp:turnPlayer(0, Msg2Player, t_msg[nCurTime][1]);
				end
			end
        		
    	end

	else
		local nCurTime = GetMissionV(this.mv21);
		SetMissionV(this.mv21,nCurTime + 1);
				
		if nPreStageStatus ~= 0 then
			--local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
			--local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
			local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
			if nPreStageStatus ~= 0 then
				local t_talk = {
					[2] = {nNpcIdxRWX, "Ha..ha�, L�o phu kh�ng th� ch� n�a r�i."},
					--[8]  = {nNpcIdxRYY, "��֪����׻���ӡ��˭�����ء�"},
				}
				if t_talk[nCurTime] then
					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
				end
				if nCurTime == 5 then
					ttd_StagePreMid()
				elseif nCurTime == 8 then
					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
					local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
					local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
					ttd_ChangeNpc2Fight(nJTYLidx);
					ttd_ChangeNpc2Fight(nLFidx);
					ttd_ChangeNpc2Fight(nQRSidx);
--					if 1 == nCurFish then
--						
--    					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
--						local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
--						local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
--    					g_NpcAI:setAI(nJTYLidx, AT_SM_ATTACK);
--						g_NpcAI:setWayPoint(nJTYLidx, {{1676, 3153}});
--						g_NpcAI:setAI(nLFidx, AT_SM_ATTACK);
--						g_NpcAI:setWayPoint(nLFidx, {{1684, 3148}});
--						g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
--						g_NpcAI:setWayPoint(nQRSidx, {{1690, 3139}});
--    				end
					SetMissionV(this.mv21, 0);
					ttd_StagePreEnd()
					local szMsg = format("H�a Ph��ng Phong �n b� ph� h�y r�i.")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
				end
			elseif nPreStageStatus == 2 then
				--do nothing
			end
		end
	end

end

function stageFight3.doSkill()
	self = stageFight3;
	if GetMissionV(this.mv12) >= 3 then
		local nBossIdx3 = ttd_findNpc(this.szNpc_tianjian);
		local nBossIdx4 = ttd_findNpc(this.szNpc_dijian);
		local nBossIdx5 = ttd_findNpc(this.szNpc_renjian);
		if nBossIdx3 ~= 0 and IsNpcDeath(nBossIdx3) ~= 1 and GetMissionV(this.mv14) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx3);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx3,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv14,1);
				NpcCommand(nBossIdx3, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1622);
			end
		end
		if nBossIdx4 ~= 0 and IsNpcDeath(nBossIdx4) ~= 1 and GetMissionV(this.mv15) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx4);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx4,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv15,1);
				NpcCommand(nBossIdx4, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1623);
			end
		end
		if nBossIdx5 ~= 0 and IsNpcDeath(nBossIdx5) ~= 1 and GetMissionV(this.mv16) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx5);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx5,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv16,1);
				NpcCommand(nBossIdx5, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1624);
			end			
		end
	end
end

----------------------------------------------------------------------
stageFight3 = inherit(cycPhase, stageFight3);

stageFight3.actions = {
	[1] = stageFight3.init,
}
stageFight3.cycActions = {
	[1] = {
		[0] = stageFight3.callBoss,
		start = 5,
	},
	[2] = {
		[1] = stageFight3.doSkill,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight3_4 = {
	name = "Tr��c khi v��t �i l�n 3",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight3_4:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n m� �i th� 4: Ma Ki�m/#stageFight3_4.gotoFour(1)",
			"\n r�i �i/ttd_askClose",
			"\nK�t th�c ��i tho�i/nothing"
		};
		Say("Giang Bi�t H�c: Ha�ha�ch� c�n l�i B�ch H� Phong �n .",
			getn(strtab),
			strtab)
	end
end

function stageFight3_4.gotoFour(nType)
	SetMissionV(this.mv17,1);
	ds_JZMY:AddStatValue(1,4,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
	
	self:onFinish();--������һ�׶�
	
	remove_tong_box()
	remove_yin_box()
end

function stageFight3_4.init()
	SetMissionV(this.mv17,0)
	ttd_createJTYL(4);
	ttd_createWRX();
end

function stageFight3_4.onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight3_4.checkPos()
--	local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
--	local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
--	local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
--	local nHyidx = ttd_findNpc(this.szNpc_jiaozhu);
--	local nDialog = GetMissionV(this.mv17);
--	if nDialog ~= 0 then --3����
--		if nDialog >= 7 then --�ϻ�˵�꿪��
--			self:onFinish();
--		else
--			SetMissionV(this.mv17,nDialog+1);
----			local tDialogs = {
----				{nJTYLidx,"ħ����ԭ�������ħ����������"},
----				{nJTYLidx,"�ؽ�Ҷ�Һ��˲�����д�ħ����������û����ֹ�ҡ�"},
----				{nJTYLidx,"�����Ҳ��ǡ������ǡ���"},
----				{nQRSidx,"������ħħ�����أ��ٶ���ֹ������"},
----				{nHyidx,"�������������ѱ���"},
----				{nLFidx,"�Ǻ�ӡ������������ʯ�Ž����ˣ�ʦ������ȥ��ס������������˾ͽ�������������ֹ�ɡ�"},
----			};
----			if nDialog == 4 then
----				ttd_createSomeNpc(tNpcs.boss6,tPos.boss6); --��ӡ����
----			end
----			local tTemp = tDialogs[nDialog];
----			if tTemp then
----				NpcChat(tTemp[1],tTemp[2]);
----			end
--		end
--	end
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
	name = "�i th� 4: Ma Ki�m",
	maxsecond = 8*60,
	actionsType = "second",
	guage = {
		msg = "Ma Ki�m",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
};

---------------------------------------------------------------------
function stageFight4:createSomeNpc()
	--local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
	local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
	SetNpcPos(nIdxRWX,1698, 3153)
	local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
	SetNpcPos(nIdxRYY,1693, 3157)
		
--	ttd_ChangeNpc2Fight(nLFidx);
--	CastState2Npc(nLFidx,"state_fetter",1,30*18,0,19999);
--	SetNpcPos(nQRSidx,1672,3125);	
--	ttd_ChangeNpc2Fight(nQRSidx);
--	CastState2Npc(nQRSidx,"state_fetter",1,30*18,0,19999);
--	ttd_removeNpc(nJTYLidx);
--	local nNewIdx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7); --ħ��ū
--	ttd_ChangeNpc2Talk(nNewIdx);
	--g_NpcAI:setAI(nNewIdx, AT_SM_ATTACK);
	--g_NpcAI:setWayPoint(nNewIdx, {{1698,3160}});
	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	SetNpcPos(nNpcIdxJBH,1686, 3151)
	NpcChat(nNpcIdxJBH, "T� Linh Chi H�n nghe tri�u g�i, ph� kh�ng�B�ch H� hi�n");
	
	ttd_StagePreStart(4)
	SetMissionV(this.mv21,0) --��ʱ������
end

function stageFight4:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == tNpcs.boss7[2] then
		SetMissionV(this.mv20, 4);--���¿����Ự
		SetMissionV(this.mv21, 0);--���¿����Ự
		NpcChat(nNpcIDX, "L�n n�y nguy r�i.");
		local szMsg = format("V��t �i th�nh c�ng")
    this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
    this.msCamp:turnPlayer(0, wjz_DailyWeeklyTask, 1);
    	
    local tFishs = ttd_findAllNpc("Huy�n �nh Ki�m H�n")
    for i = 1,getn(tFishs) do
    	SetNpcLifeTime(tFishs[i],0);
    end
    	
    local nJTYLidx = ttd_findNpc(this.szNpc_jiaozhu);
		local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
		local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
		ttd_ChangeNpc2Talk(nJTYLidx);
		ttd_ChangeNpc2Talk(nLFidx);
		ttd_ChangeNpc2Talk(nQRSidx);
		
		this.msCamp:turnPlayer(0, _vc_WJZ_Pass_4, 0);
	end
end

function stageFight4.init()
	self = stageFight4;
	SetMissionV(this.mv18, 0)--��Ӱ��������
	SetMissionV(MV_STAGE,4);	
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --�������
end

function stageFight4:onTimeout()
	SetMissionV(this.mv18, 0)--��Ӱ��������
	this:Msg2MSAll("V��t �i th�t b�i!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight4.callFish()
	self = stageFight4;
	local nPreStageStatus = GetMissionV(this.mv20);

	if nPreStageStatus == 0 then
    	local nBossIdx = ttd_findNpc(tNpcs.boss7[2]);--"ħ��ū"
    	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
    		local nNum = GetMissionV(this.mv18)
    		if nNum >= 3 then
    			return 0;
    		end
    		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
    		local nPercent = floor(nCurLife/nMaxLife*100);
    		local m,x,y = GetNpcWorldPos(nBossIdx);
    		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
    			local nNewBoss = 0;
    			for i = 1,(nNum+1)*3+1 do
    				nNewBoss = ttd_createSomeNpc({"Huy�n �nh Ki�m H�n","Huy�n �nh Ki�m H�n", nil, nil, CampEnemy, 0},{{x,y}});
    			end
    			if nNewBoss ~= 0 then
    				SetMissionV(this.mv18,nNum+1);
    			end
    		end
    	end
	else
		local nCurTime = GetMissionV(this.mv21);
		SetMissionV(this.mv21,nCurTime + 1);

		if nPreStageStatus <= 3 then
--			local nNpcIdxMJN = ttd_findNpc(this.szNpc_mjn);
--			local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
--			local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
--			local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
			if nPreStageStatus ~= 0 then
				local nTalkB = 8;
				local t_talk = {
					[5] = {nil, nil, function() ttd_StagePreMid()	end },
					[8] = {nil, nil, 
						function()
--							SetMissionV(this.mv21, 0);
        					ttd_StagePreEnd()
        					local szMsg = format("V�n Ki�m Tr�ng Phong �n �� b� ph� h�y to�n b�.")
            				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
            				SetMissionV(this.mv20,3);--�����Ự
        
                        	local nNewIdx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7); --ħ��ū
                        	ttd_ChangeNpc2Talk(nNewIdx);
                        	SetCurrentNpcSFX(nNewIdx, 905, 0, 0); --��Ч
        --                	g_NpcAI:setAI(nNewIdx, AT_SM_ATTACK);
        --                	g_NpcAI:setWayPoint(nNewIdx, {{1698,3160}});
						end
						},
					[nTalkB+1] = {this.szNpc_mjn, "K� n�o to gan d�m g�i L�o phu? m�i m�u tanh con ng��i, ng�n n�m nay kh�ng ���c ng�i m�i n�y r�i, s�ng kho�i th�t."},
					[nTalkB+3]  = {this.szNpc_jiangbiehe, "Ki�m N�, nh�n th�y L�o phu sao kh�ng h�nh l�."},
					[nTalkB+5]  = {this.szNpc_mjn, "�, th� ra l� T� �i�n ��i nh�n, g�p l�i t�t qu� r�i, ��i nh�n, c� th� ban th��ng cho ti�u nh�n v�i Di�u D��ng Thi�n Tinh kh�ng."},
					[nTalkB+7]  = {this.szNpc_jiangbiehe, "N�i hay ��, L�o phu h�i ng��i, Thi�n Th�ng Huy�n C�nh, l�m ��n ��u r�i?"},
					[nTalkB+9]  = {this.szNpc_mjn, "L�o n� ra tay k� n�o d�m ng�n c�n, ��i nh�n c� t�y � v�o Th�ng Thi�n Huy�n C�nh."},
					[nTalkB+11]  = {this.szNpc_jiangbiehe, "Kh� l�m, quay v� L�o phu s� tr�ng th��ng cho ng��i."},
					[nTalkB+13]  = {this.szNpc_jiangbiehe, "Th�t v� d�ng, Ma Ki�m N� h�y gi�t to�n b�!"},
					[nTalkB+15]  = {this.szNpc_renwoxing, "Giang huynh, huynh l�m v�y l� � g�?!"},
					[nTalkB+17]  = {this.szNpc_jiangbiehe, "Ha...ha... Nh�m huynh l�m v�y l� � g�. T�i h� ch� mu�n d�n huynh �i g�p l�i c� nh�n, �i n� c�a huynh Ki�m N� s� ch�m s�c chu ��o."},
					[nTalkB+19]  = {this.szNpc_renwoxing, "L�o phu � ��y, k� n�o d�m ��ng ��n."},
					[nTalkB+21]  = {this.szNpc_jiangbiehe, "Th�t kh�ng bi�t �i�u, h�y xem ��y. Ma h�a. ",
						function()
							local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
            				SetCurrentNpcSFX(nIdxJbh, 962, 2, 1); --��Ч
						end
							},
					[nTalkB+22] = {nil, nil, 
						function()
							local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
            				ttd_removeNpc(nIdxJbh);
            				local nNewIdx = ttd_createSomeNpc(tNpcs.boss6,tPos.boss6); --��ӡ����
            				SetCurrentNpcSFX(nNewIdx, 904, 0, 0); --��Ч
						end
						},
					[nTalkB+23]  = {this.szNpc_jiaozhu, "Ha..ha� Nh�m Ng� H�nh, ng��i d�m ��u m�t tr�n."},
					[nTalkB+25]  = {this.szNpc_renwoxing, "S� ng��i sao, ti�p chi�u �i.",
						function()
							local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
							g_NpcAI:setAI(nNpcIdxRWX, AT_SM_MOVE);
							g_NpcAI:setWayPoint(nNpcIdxRWX, {{1682, 3143}});
						end
							},
					[nTalkB+27]  = {this.szNpc_jiaozhu, "Ha��� L�o phu ti�p v�i chi�u. Ma Ki�m N� gi�t ch�ng �i."},
					[nTalkB+29]  = {this.szNpc_mjn, "�n ���c ch�a? T�i h� ��i r�i.",
						function()
							SetMissionV(this.mv20,0);--�Ự�׶ν���
							local nNpcIdxMJN = ttd_findNpc(this.szNpc_mjn);
							ttd_ChangeNpc2Fight(nNpcIdxMJN);
							g_NpcAI:setAI(nNpcIdxMJN, AT_SM_ATTACK);
							g_NpcAI:setWayPoint(nNpcIdxMJN, {{1698,3160}});
							local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
                        	--SetNpcPos(nIdxRWX,1698, 3153)
                        	ttd_ChangeNpc2Fight(nIdxRWX);
                        	CastState2Npc(nIdxRWX,"state_fetter",1,30*18,0,19999);
                        	local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
                        	--SetNpcPos(nIdxRYY,1693, 3157)
                        	ttd_ChangeNpc2Fight(nIdxRYY);
                        	CastState2Npc(nIdxRYY,"state_fetter",1,30*18,0,19999);
						end
							},
				}
				if t_talk[nCurTime] then
					if t_talk[nCurTime][1] then
						local nNpcIdx = ttd_findNpc(t_talk[nCurTime][1])
						NpcChat(nNpcIdx, t_talk[nCurTime][2]);
					end
					if t_talk[nCurTime][3] then
						t_talk[nCurTime][3]()--���ù��ܺ���
					end
				end
--				if nCurTime == 8 then
--					ttd_StagePreMid()
--				elseif nCurTime == 11 then
--					SetMissionV(this.mv21, 0);
--					ttd_StagePreEnd()
--					local szMsg = format("��ڣ��ӡȫ�����ƻ���")
--    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
--    				SetMissionV(this.mv20,3);--�����Ự
--
--                	local nNewIdx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7); --ħ��ū
--                	ttd_ChangeNpc2Talk(nNewIdx);
--                	SetCurrentNpcSFX(nNewIdx, 905, 0, 0); --��Ч
----                	g_NpcAI:setAI(nNewIdx, AT_SM_ATTACK);
----                	g_NpcAI:setWayPoint(nNewIdx, {{1698,3160}});
--    			elseif nCurTime == 32 then
--    				local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
--    				SetCurrentNpcSFX(nIdxJbh, 962, 2, 1); --��Ч
--    			elseif nCurTime == 33 then
--    				local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
--    				ttd_removeNpc(nIdxJbh);
--    				local nNewIdx = ttd_createSomeNpc(tNpcs.boss6,tPos.boss6); --��ӡ����
--    				SetCurrentNpcSFX(nNewIdx, 904, 0, 0); --��Ч
--    			elseif nCurTime == 36 then
--    				
--    			elseif nCurTime == 40 then
--    				SetMissionV(this.mv20,0);--�Ự�׶ν���
--				end
			end
		elseif nPreStageStatus == 4 then
    		local t_talk = {
        		[3] = {this.szNpc_jiaozhu, "��nh b�i ���c Ma Ki�m N�, r�t cu�c h� l� ai!",
        			function()
        				local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
                        local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
                        local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
                        ttd_ChangeNpc2Talk(nIdxRWX);
                        ttd_ChangeNpc2Talk(nIdxRYY);
                        ttd_ChangeNpc2Talk(nNpcIdxJMJBH);
        			end
        			},
        		[5]  = {this.szNpc_renwoxing, "Qu� nhi�n b� Ki�m Ma nh�p r�i, h�m nay L�o phu ph�i ti�u di�t ng��i."},
        		[7]  = {this.szNpc_jiaozhu, "Ha..ha�Ng��i kh�ng ph�i ��i th� c�a L�o phu?"},
        		[9]  = {this.szNpc_renwoxing, "Sao kh�ng th� c� ��ng ���c.",
        			function()
        				local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
            			SetCurrentNpcSFX(nIdxRWX, 930, 2, 1); --��Ч
        			end
        			},
        		[11]  = {this.szNpc_renyingying, "Cha, Cha sao r�i?"},
        		[13]  = {this.szNpc_jiaozhu, "Ha�l�c giao ��u, ng��i �� tr�ng T� ��c Ki�m Kh�, hi�n t�i T� ��c Ki�m Kh� �� ph�t t�n, ���ng nhi�n kh�ng th� c� ��ng ���c. Nh�m Ng� H�nh, h�y mau theo L�o phu, ha�"},
        		[15]  = {this.szNpc_jiaozhu, "H�y truy�n l�nh m� Th�ng Thi�n Huy�n C�nh.",
        			function()
        				local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
        				SetCurrentNpcSFX(nIdxRWX, 0, 2, 1); --��Ч
        				SetCurrentNpcSFX(nIdxRWX, 912, 0, 1); --��Ч
    					local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
    					SetCurrentNpcSFX(nNpcIdxJMJBH, 912, 0, 1); --��Ч
        			end
        			},
        		[17]  = {this.szNpc_renwoxing, "Kh�ng."},
        		[19]  = {this.szNpc_renyingying, "Cha, con ��n c�u cha ��y.",
        			function()
        				local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
        				g_NpcAI:setAI(nNpcIdxRYY, AT_SM_MOVE);
						g_NpcAI:setWayPoint(nNpcIdxRYY, {{1686, 3147}});
        			end
        			},
        		[21]  = {this.szNpc_renyingying, "Cha!",
        			function()
        				local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
						ttd_removeNpc(nNpcIdxRWX);
    					local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
    					ttd_removeNpc(nNpcIdxJMJBH);
        			end
        				},
        		[25] = {nil, nil, 
						function()
							ttd_passStage(4,"Ma Ki�m");--�ؿ�����
						end
						},
        		
        	}
        	if t_talk[nCurTime] then
				if t_talk[nCurTime][1] then
					local nNpcIdx = ttd_findNpc(t_talk[nCurTime][1]);
					NpcChat(nNpcIdx, t_talk[nCurTime][2]);
				end
				if t_talk[nCurTime][3] then
					t_talk[nCurTime][3]()--���ù��ܺ���
				end
			end
		end

	end
end
----------------------------------------------------------------------
stageFight4 = inherit(cycPhase, stageFight4);

stageFight4.actions = {
	[1] = stageFight4.init,
}
stageFight4.cycActions = {
	[1] = {
		[0] = stageFight4.callFish,
		start = 5,
	},
}

----------------------------------------------------------------------
stageFight9 = {
	name = "Cao tr�o l�n 3",
	maxsecond = 5*60, --5����
	actionsType = "second",
};

function stageFight9:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_renyingying and ttd_isCaption() == 1 then
		local strtab = {
				"\n r�i kh�i V�n Ki�m Tr�ng/_all_pass_leave",
				"\nK�t th�c ��i tho�i/nothing"
			};
		Say("<color=green>Nh�m Doanh Doanh<color>: cha, con nh�t ��nh c�u cha ra.",
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
--	local nNpcIDX = ttd_createSomeNpc(tNpcs.yzq,tPos.yzq);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	ttd_createJTYL();
	local nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
	ttd_ChangeNpc2Talk(nNpcIDX);
	ttd_createWRX();
end

function stageFight9.onTimeout()
	this:Msg2MSAll(format("Th�i gian k�t th�c, r�i kh�i%s!",this.name));
	ttd_reviveAll();
	ttd_confirmClose();
end
----------------------------------------------------------------------
stageFight9 = inherit(cycPhase, stageFight9);

stageFight9.actions = {
	[1] = stageFight9.init,
};
stageFight9.cycActions = {

};

----------------------------------------------------------------------
firePhases.phases = {stageFight00,stageFight0,stageFight1,stageFight1_2,stageFight2,stageFight2_3,stageFight3,stageFight3_4,stageFight4,stageFight9};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, format("Trong 150 ph�t kh�ng v��t%s, �i s� k�t th�c!",this.name));
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
tbJZMY = gf_CopyInherit(missionBase, tbJZMY);

tbJZMY.msOption.bSetPkFlag = 0; --����ģʽ
tbJZMY.msOption.bSetPkCamp = 0;
tbJZMY.msOption.szInitDeahScript = thisFile;

tbJZMY.msPhases[1] = firePhases;

tbJZMY.msPosition.entryPos = {
	{1696, 3158},
};
tbJZMY.msPosition.exitPos = {500,1706,3060};

tbJZMY.msPosition.getExitPos = function()
	local nGoMapID = GetMissionV(this.mv19);
	local t = {
			[500] = {1706,3060},
		};
	if t[nGoMapID] then
		return nGoMapID,t[nGoMapID][1],t[nGoMapID][2];
	else
		return 500,t[500][1],t[500][2];
	end 
end

--function tbJZMY:onInit()
----	print("tbJZMY:onInit")
--	missionBase.onInit(self);
--	firePhases:onInit();
--end

tbJZMY.msOption.OnPlayerJoin = function(self, nCamp)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1760*32,3232*32); --��ʱ������
--	if GetCaptainName() == GetName() then --�ӳ�
--		SetTeamForbitType(GetTeamID(),-1,0);
--	end
	--�������-----------------------------------------
	local t = {49,69,79,89,99};
	local nLv = GetLevel();
	for i = 1,getn(t) do
		if nLv <= t[i] then
			ds_JZMY:AddStatValue(1,8+i,1);
			break;
		end
	end
	---------------------------------------------------
	
	--gf_WriteLogEx("wanjianzhong mission", "enter mission");
	
	MissionAward_Initialize()--��ʼ���ؿ�����
end

tbJZMY.msOption.OnPlayerLeave = function(self, nCamp)
	ttd_cleanGodState();
--	if GetCaptainName() == GetName() then --�ӳ�
--		SetTeamForbitType(GetTeamID(),0,0);
--	end
	--local nCurStage = GetMissionV(MV_STAGE) or 0;
	--gf_WriteLogEx("wanjianzhong mission", format("leave mission at stage %d", nCurStage));
	MissionAward_UnInitialize()--����ʼ���ؿ�����
end

this = tbJZMY;
