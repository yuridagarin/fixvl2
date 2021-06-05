--Author:yim
--Date:2007.12.24 19:23
--Description:Define the function that use to initialize the stage and to create some limits
--this file must not be used singly,it's supposed to be included by the header script file.

--===============================================================================================================
--�����׼�
function BR_RF_InitStage_SLSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {};
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1602,3193);
	elseif nDiff == 5 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("M�t th�t s� m�n thi�u l�m","Thi�u L�m h� ph�p",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 9","C� quan",nMapID,1602,3193);
	elseif nDiff == 7 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("M�t th�t s� m�n thi�u l�m","Thi�u L�m h� ph�p",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1573,3205);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1609,3203);
	end;
end;
function BR_RF_ProcStageEven_SLSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o Thi�uL�mt�cgia","C� quan ngo�i c�ng",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o Thi�uL�mt�cgia","C� quan ngo�i c�ng",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
		if BR_CheckTimerPosition(40,60) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,1581,3213);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 3","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,6);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLSJ(nDiff,nStage)

end;
--===============================================================================================================
--������ɮ
function BR_RF_InitStage_SLCS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2","C� quan",nMapID,1602,3193);	
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3","C� quan",nMapID,1581,3213);	
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1609,3203);	
	end;
end;
function BR_RF_ProcStageEven_SLCS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh Thi�uL�mthi�n","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;			
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,30);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],30)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLCS(nDiff,nStage)

end;
--===============================================================================================================
--������ɮ
function BR_RF_InitStage_SLWS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1602,3193);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 9","C� quan",nMapID,1602,3193);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7","C� quan",nMapID,1609,3203);		
	end;
end;
function BR_RF_ProcStageEven_SLWS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;		
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 3","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 3","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 3","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20);
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 5","C� quan",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLWS(nDiff,nStage)

end;
--===============================================================================================================
--����
function BR_RF_InitStage_TM(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o ch�m 2","C� quan",nMapID,1592,3206);
	end;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1592,3189);
	end;
	if nDiff == 5 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o ch�m 3","C� quan",nMapID,1592,3206);
	end;
	if nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1584,3206);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1603,3206);
	end;	
	if nDiff == 7 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 6","C� quan",nMapID,1592,3189);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1584,3206);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1603,3206);
	end;	
	if (nDiff == 8 and nStage == MAX_STAGE) or (nDiff == 9 and nStage ~= MAX_STAGE) then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1592,3189);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1592,3231);
	end;
	if nDiff == 9 and nStage == MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1592,3189);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1592,3231);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o ch�m 2","C� quan",nMapID,1592,3206);
	end;
end;
function BR_RF_ProcStageEven_TM(nDiff,nStage)

end;
function BR_RF_UnInitStageEven_TM(nDiff,nStage)

end;
--===============================================================================================================
--���ҷ��
function BR_RF_InitStage_EMFJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1591,3199},{1596,3204},{1600,3208},{1604,3212},{1600,3213},{1590,3203}};
	local tbObstaclePos =
	{
		[1] = {"Giai nh�n �m n�i s�u",1584,3214},
		[2] = {"M�y li�u ���m t�nh s�u",1586,3216},
		[3] = {"V�a g�p l� tu�n d�i",1588,3218},
		[4] = {"V� ai l�ng qu�n �au",1590,3220},
	}
	if nDiff == 2 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1606,3198);
	elseif nDiff == 4 then
		BR_CreateFellow("Nga My s� t�","Nga My s� t�",5,CAMP_PLAYER,tbPos);	--��������
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1576,3212);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1614,3209);
	elseif nDiff == 7 then
		BR_CreateFellow("Nga My s� t�","Nga My s� t�",5,CAMP_PLAYER,tbPos);	--��������
		for i=1,getn(tbObstaclePos) do
			nNpcIdx = BR_CreateNpc("Nga My m�t th�t c� quan",tbObstaclePos[i][1],nMapID,tbObstaclePos[i][2],tbObstaclePos[i][3],CAMP_PLAYER);
		end;
		nNpcIdx = BR_CreateNpc("C� quan n� tr�nh","C� quan",nMapID,1584,3221);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1576,3212);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1614,3209);		
	elseif nDiff == 9 then
		BR_CreateFellow("Nga My s� t�","Nga My s� t�",5,CAMP_PLAYER,tbPos);	--��������
		for i=1,getn(tbObstaclePos) do
			nNpcIdx = BR_CreateNpc("Nga My m�t th�t c� quan",tbObstaclePos[i][1],nMapID,tbObstaclePos[i][2],tbObstaclePos[i][3],CAMP_PLAYER);
		end;
		nNpcIdx = BR_CreateNpc("C� quan n� tr�nh","C� quan",nMapID,1584,3221);
	end;
end;
function BR_RF_ProcStageEven_EMFJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbNpcIdx = {};
	local tbPos = {{1591,3199},{1596,3204},{1600,3208},{1604,3212},{1600,3213},{1590,3203}};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh NgaMyph�tgia","C� quan",nMapID,1597,3209);
			SetNpcLifeTime(nNpcIdx,10);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("Nga My s� t� 1","S� t� nguy�n th�n",1,CAMP_PLAYER,tbPos,10);	--��������
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;		
	elseif nDiff == 6 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,20) == 1 then
				BR_CastPlayerState("state_confusion",0,1,1,1);
				Msg2MSAll(MISSION_ID,"H�n lo�n 1 gi�y");
			end;
		end;
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,20) == 1 then
			BR_CastPlayerState("state_confusion",0,1,1,1);
			Msg2MSAll(MISSION_ID,"H�n lo�n 1 gi�y");
		end;
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,30) == 1 then
			BR_CastPlayerState("state_lost_mana_per18",20,30,1,2);
			Msg2MSAll(MISSION_ID,"Trong m�i gi�y n�i l�c gi�m 20 �i�m, k�o d�i 30 gi�y");
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_EMFJ(nDiff,nStage)

end;
--===============================================================================================================
--�����׼�
function BR_RF_InitStage_EMSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1591,3202},{1589,3209},{1601,3212},{1594,3205}};
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o NgaMyt�cgia","C� quan",nMapID,1606,3198);
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1587,3200);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 7 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1607,3218);
		BR_CreateFellow("Nga My s� t�","Nga My s� t�",4,CAMP_PLAYER,tbPos);	--��������
	elseif nDiff == 6 then
		if nStage == MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o NgaMyt�cgia","C� quan",nMapID,1584,3221);
		end;
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o NgaMyt�cgia","C� quan",nMapID,1584,3221);
	end;
end;
function BR_RF_ProcStageEven_EMSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbNpcIdx = {};
	local nRand = 0;
	local tbRandPos = {{1576,3212},{1587,3200},{1597,3190},{1584,3221},{1606,3198},{1595,3230},{1607,3218},{1614,3209}};
	local tbRandPos2 = {{1587,3200},{1597,3190},{1597,3209},{1606,3198},{1607,3218},{1614,3209}};
	local tbObstaclePos = 
	{
		[1] = {{1594,3206},{1593,3207},{1592,3206}},
		[2] = {{1602,3206},{1601,3207},{1600,3208}},
		[3] = {{1586,3209},{1585,3210},{1584,3211}},
	};
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("Nga My s� t� 1","S� t� nguy�n th�n",1,CAMP_PLAYER,tbRandPos2,10);	--��������
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C� quan m�t th�t s� m�n NgaMy1","Tr� ng�i",3,CAMP_EVIL,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("Nga My s� t� 1","S� t� nguy�n th�n",1,CAMP_PLAYER,tbRandPos2,10);	--��������
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C� quan m�t th�t s� m�n NgaMy1","Tr� ng�i",3,CAMP_EVIL,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1597,3209);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_EMSJ(nDiff,nStage)

end;
--===============================================================================================================
--ؤ�ﾻ��
function BR_RF_InitStage_GBJY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2","C� quan",nMapID,1598,3179);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3","C� quan",nMapID,1598,3179);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1587,3182);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1608,3213);
	end;
end;
function BR_RF_ProcStageEven_GBJY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbObstaclePos = 
	{
		[1] = {{1603,3190},{1602,3191},{1601,3192}},
		[2] = {{1599,3195},{1598,3196},{1597,3197}},
		[3] = {{1592,3204},{1591,3205},{1590,3206}},
	};
	local funLifeProcess = function()
		local nBossIdx = 0;
		local nNpcCurLife = 0;
		local nNpcMaxLife = 0;
		local nNpcLifePercent = 0;
		local nNpcIdx = 0;
		local nNpcMapID = 0;
		local szNpcName = "";
		if %nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,10) == 1 then
				for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
					nNpcIdx = GetMissionV(i);
					nNpcMapID = GetNpcWorldPos(nNpcIdx);	
					if nNpcIdx ~= 0 and nNpcMapID == %nMapID then	--�ж�һ��NPC�ĵ�ͼ�Է���һ
						BR_ModifyNpcLife(nNpcIdx,100,0,1);
						BR_SetCurrentNpcSFX(nNpcIdx,961);
					end;
				end;
				Msg2MSAll(MISSION_ID,"Sinh l�c c�a t�t c� v� binh h�i ph�c 100%");
			end;
		else
			if BR_CheckTimerPosition(0,60) == 1 then
				BR_CastPlayerState("state_life_restore_per8f",200,60);
				Msg2MSAll(MISSION_ID,"M�i n�a gi�y h�i ph�c sinh l�c 200 �i�m, k�o d�i 60 gi�y");
			end;
			if BR_CheckTimerPosition(0,30) == 1 then
				nBossIdx = GetMissionV(MV_NSC_BOSS_INDEX);
				szNpcName = tostring(GetNpcName(nBossIdx));
				nNpcMaxLife,nNpcCurLife = GetUnitCurStates(nBossIdx,1);
				nNpcLifePercent = (floor((nNpcCurLife/nNpcMaxLife)*10)+1)*10;
				if nNpcLifePercent > 100 then
					nNpcLifePercent = 100;
				end;
				BR_ModifyNpcLife(nBossIdx,nNpcLifePercent,0,1);
				BR_SetCurrentNpcSFX(nBossIdx,961);
				Msg2MSAll(MISSION_ID,szNpcName.."Sinh l�c ph�c h�i ��n "..nNpcLifePercent.."%");
			end;
		end;
	end;
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1598,3196);
			SetNpcLifeTime(nNpcIdx,8);
		end;		
	elseif nDiff == 4 then
		funLifeProcess();
	elseif nDiff == 5 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
	elseif nDiff == 6 then
		funLifeProcess();
	elseif nDiff == 7 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
	elseif nDiff == 8 then
		funLifeProcess();
	elseif nDiff == 9 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1598,3196);
			SetNpcLifeTime(nNpcIdx,10);
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_GBJY(nDiff,nStage)

end;
--===============================================================================================================
--ؤ������
function BR_RF_InitStage_GBWY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1598,3193);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1598,3179);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1598,3218);
	end;
end;
function BR_RF_ProcStageEven_GBWY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandAllPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3196},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbRandPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbObstaclePos = 
	{
		[1] = {{1603,3190},{1602,3191},{1601,3192}},
		[2] = {{1599,3195},{1598,3196},{1597,3197}},
		[3] = {{1592,3204},{1591,3205},{1590,3206}},
	};
	if nDiff == 4 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,40) == 1 then
				nRand = random(1,getn(tbRandAllPos));
				nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 1","C� quan",nMapID,tbRandAllPos[nRand][1],tbRandAllPos[nRand][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,25);
			end;
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,40);
			--�����ϰ�
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			--�����ϰ�
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_GBWY(nDiff,nStage)

end;
--===============================================================================================================
--�䵱����
function BR_RF_InitStage_WDDJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1585,3196);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1595,3237);
	elseif nDiff == 4 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1585,3196);
		end;
	end;
end;
function BR_RF_ProcStageEven_WDDJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1582,3224},{1582,3206},{1585,3237},{1585,3196},{1595,3237},{1595,3195},{1599,3224},{1599,3206}};
	local tbObstaclePos = 
	{
		[1] = {{1589,3205},{1590,3205},{1591,3205}},
		[2] = {{1589,3212},{1590,3212},{1591,3212}},
		[3] = {{1589,3223},{1590,3223},{1591,3223}},
	};
	local tbJiGuanPos = 
	{
		[1] = {{1586,3201},{1586,3208}},
		[2] = {{1586,3233},{1586,3226}},
		[3] = {{1595,3232},{1595,3225}},
		[4] = {{1595,3201},{1595,3208}},
	};
	if nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbJiGuanPos));
			nNpcIdx = BR_CreateNpc("V� �ang m�t th�t c� quan 1","C� quan",nMapID,tbJiGuanPos[nRand][1][1],tbJiGuanPos[nRand][1][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nNpcIdx = BR_CreateNpc("V� �ang m�t th�t c� quan 2","C� quan",nMapID,tbJiGuanPos[nRand][2][1],tbJiGuanPos[nRand][2][2],CAMP_PLAYER);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,40);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbJiGuanPos));
			nNpcIdx = BR_CreateNpc("V� �ang m�t th�t c� quan 1","C� quan",nMapID,tbJiGuanPos[nRand][1][1],tbJiGuanPos[nRand][1][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nNpcIdx = BR_CreateNpc("V� �ang m�t th�t c� quan 2","C� quan",nMapID,tbJiGuanPos[nRand][2][1],tbJiGuanPos[nRand][2][2],CAMP_PLAYER);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,40);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	end;
end;
function BR_RF_UnInitStageEven_WDDJ(nDiff,nStage)

end;
--===============================================================================================================
--�䵱�׼�
function BR_RF_InitStage_WDSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1591,3237);		
	end;
	if (nDiff == 4 and nStage ~= MAX_STAGE) then 	--ˢһ��
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2","C� quan",nMapID,1591,3194);
	end;
	if nDiff == 6 then	--ˢһ��
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3","C� quan",nMapID,1591,3194);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1591,3237);		
	end;
	if (nDiff == 8 and nStage == MAX_STAGE) or nDiff == 9 then	--ˢ����
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2","C� quan",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 2","C� quan",nMapID,1591,3237);
	end;
end;
function BR_RF_ProcStageEven_WDSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = GetMissionV(MV_NSC_BOSS_INDEX);
	if nDiff == 3 and nStage == MAX_SATGE then	--3ѭ��BOSS
		if BR_CheckTimerPosition(0,30) == 1 then
			if nNpcIdx ~= 0 and GetNpcWorldPos(nNpcIdx) == nMapID then
				CastState2Npc(nNpcIdx,"state_vertigo",6,-1,1);	--BOSS��6��
			end;
		end;
	end;
	if nDiff == 4 and nStage == MAX_SATGE then	--4ѭ��BOSS
		if BR_CheckTimerPosition(0,30) == 1 then
			if nNpcIdx ~= 0 and GetNpcWorldPos(nNpcIdx) == nMapID then
				CastState2Npc(nNpcIdx,"state_vertigo",6,-1,1);	--BOSS��6��
			end;
		end;	
	end;
	if (nDiff == 4 and nStage == MAX_STAGE) or (nDiff == 5 and nStage ~= MAX_STAGE) or nDiff == 7 or nDiff == 9 then
		local tbPos = {{1584,3202},{1597,3202},{1584,3225},{1597,3225}};
		if BR_CheckTimerPosition(0,30) == 1 then
			local nNpcIdx = 0;
			for i=1,getn(tbPos) do
				nNpcIdx = BR_CreateNpc("C� quan n� tr�nh","C� quan",nMapID,tbPos[i][1],tbPos[i][2]);
				SetNpcLifeTime(nNpcIdx,10);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
				SetCampToNpc(nNpcIdx,TB_CAMP_NAME[CAMP_ENEMY]);
			end;
			nNpcIdx = BR_CreateNpc("C�c g� phe m�nh","C� quan",nMapID,1591,3209);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			SetCampToNpc(nNpcIdx,TB_CAMP_NAME[CAMP_PLAYER]);
		end;
	end;
end;
function BR_RF_UnInitStageEven_WDSJ(nDiff,nStage)

end;
--===============================================================================================================
--����ǹ��
function BR_RF_InitStage_YMQQ(nDiff,nStage)
	local nNpcIdx = 0;
	local nMapID = BR_GetCurMapID();
	if nDiff == 3 or nDiff == 5 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1604,3188);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1583,3165);
	end;
	if nDiff == 4 or nDiff == 6 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3188);
	end;
	if nDiff == 7 or (nDiff == 8 and nStage == MAX_STAGE) then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1604,3188);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3","C� quan",nMapID,1604,3188);
	end;
	if nDiff == 9 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1611,3178);
	end;
	if nDiff == 9 and nStage == MAX_STAGE then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1611,3178);
	end;
end;
function BR_RF_ProcStageEven_YMQQ(nDiff,nStage)
	if (nDiff == 5) or (nDiff == 6 and nStage ~= MAX_STAGE) then
		if BR_CheckTimerPosition(0,35) == 1 then	--��������CDʱ������ڶ���
			BR_CastPlayerState("state_fetter",0,4,1,1);
			Msg2MSAll(MISSION_ID,"��ng y�n 4 gi�y");
		end;
	end;
	if (nDiff == 7) or ((nDiff == 8 or nDiff == 9) and (nStage ~= MAX_STAGE)) then
		if BR_CheckTimerPosition(0,20) == 1 then	--С������CDʱ������ڶ���
			BR_CastPlayerState("state_fetter",0,4,1,1);
			Msg2MSAll(MISSION_ID,"��ng y�n 4 gi�y");
		end;
	end;
	if (nDiff == 6 or nDiff == 8 or nDiff == 9) and (nStage == MAX_STAGE) then
		local nBossIdx = GetMissionV(MV_NSC_BOSS_INDEX);
		local szBossName = tostring(GetNpcName(nBossIdx));
		if BR_CheckTimerPosition(40,50) == 1 then	--ÿ50��������м���CD
			BR_CastPlayerState("imme_clear_skill_interval",-1,0);
			BR_SetCurrentPlayerSFX(960);
			Msg2MSAll(MISSION_ID,"ph�c h�i t�t c� nh�ng k� n�ng b� ��ng b�ng");
		end;
		if BR_CheckTimerPosition(0,50) == 1 then	--ÿ50��BOSSѪ��Ϊ5��
			BR_ModifyNpcLife(nBossIdx,5,0,1);
			BR_SetCurrentNpcSFX(nBossIdx,965);
			Msg2MSAll(MISSION_ID,"Sinh l�c BOSS ��i th�nh 5%");
		end;
		local nChangeTimes = GetMissionV(MV_NSC_VALUE1);
		local nValue = 0;
		if BR_CheckTimerPosition(10,50) == 1 then	--10���ʼÿ50��BOSS�ظ�������n%
			nValue = 100 - nChangeTimes*10;
			nValue = max(nValue,30);	--��͵�30��
			BR_ModifyNpcLife(nBossIdx,nValue,0,1);
			BR_SetCurrentNpcSFX(nBossIdx,961);
			SetMissionV(MV_NSC_VALUE1,nChangeTimes+1);
			Msg2MSAll(MISSION_ID,szBossName.."Sinh l�c ��i th�nh "..nValue.."%");
		end;
	end;
end;
function BR_RF_UnInitStageEven_YMQQ(nDiff,nStage)

end;
--===============================================================================================================
--���Ź���
function BR_RF_InitStage_YMGQ(nDiff,nStage)	--�ؿ���ʼ��
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3166);
	end;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1594,3177);
	end;
	if nDiff == 7 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1604,3166);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1583,3188);
	end;
	if nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1611,3178);		
	end;
	if nDiff == 9 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1574,3177);
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1611,3178);				
		else
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1580,3166);
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 3 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1604,3188);	
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3166);	
		end;
	end;
end;
--ִ�йؿ��¼�
function BR_RF_ProcStageEven_YMGQ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh D��ngM�ncung","C� quan",nMapID,1594,3177);	
			SetNpcLifeTime(nNpcIdx,10);	
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;		
	end;
end;
--����ʼ���ؿ�
function BR_RF_UnInitStageEven_YMGQ(nDiff,nStage)

end;
--===============================================================================================================
--�嶾а��
function BR_RF_InitStage_WDXX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1604,3183);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1593,3220);		
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3183);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1606,3220);		
	end;
end;
function BR_RF_ProcStageEven_WDXX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1590,3208},{1588,3190},{1593,3220},{1593,3184},{1606,3220},{1604,3183},{1611,3208},{1611,3192}};
	local tbObstaclePos = 
	{
		[1] = {{1601,3189},{1600,3190},{1599,3191}},
		[2] = {{1601,3196},{1600,3197},{1599,3198}},
		[3] = {{1691,3213},{1600,3214},{1599,3215}},
	};
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o Ng��ct�hi�p","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = getn(tbObstaclePos);
			BR_CreateFellow("C�c g� phe m�nh","Tr� ng�i",3,CAMP_PLAYER,tbObstaclePos[nRand],10)
		end; 	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o Ng��ct�hi�p","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o Ng��ct�hi�p","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 
		if BR_CheckTimerPosition(30,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_WDXX(nDiff,nStage)

end;
--===============================================================================================================
--�嶾��ʦ
function BR_RF_InitStage_WDGS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1596,3199},{1606,3199},{1599,3199},{1602,3199}};
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3183);
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1606,3220);
	elseif nDiff == 6 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3183);
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1593,3220);
		else
			BR_CreateFellow("Ng� ��c S� Huynh","Ng� ��c S� Huynh",getn(tbPos),CAMP_PLAYER,tbPos);
		end;	
	elseif nDiff == 7 then
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1 (c� th� h�y)","C� quan (c� th� ph� h�y)",nMapID,1606,3220);		
	elseif nDiff == 8 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1604,3183);
		else
			BR_CreateFellow("Ng� ��c S� Huynh","Ng� ��c S� Huynh",getn(tbPos),CAMP_PLAYER,tbPos)
		end;
	elseif nDiff == 9 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1593,3184);
			nNpcIdx = BR_CreateNpc("C� quan ��n ph�o 1","C� quan",nMapID,1606,3220);
		else
			BR_CreateFellow("Ng� ��c S� Huynh","Ng� ��c S� Huynh",getn(tbPos),CAMP_PLAYER,tbPos)
		end;
	end;
end;
function BR_RF_ProcStageEven_WDGS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbEnemyPos = 
	{
		[1] = {{1590,3200},{1592,3201},{1592,3199}},
		[2] = {{1611,3292},{1609,3291},{1609,3293}},
		[3] = {{1593,3184},{1592,3186},{1594,3186}},
		[4] = {{1606,3220},{1605,3218},{1607,3218}},
	}
	
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1601,3200);
			SetNpcLifeTime(nNpcIdx,10);			
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	elseif nDiff == 6 then
		if nStage == MAX_STAGE then
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				nNpcIdx = BR_CreateNpc("Ng� ��c �n S�","Ng� ��c �n S�",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan","C� quan",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan","C� quan",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
			end;
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1601,3200);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	elseif nDiff == 8 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,30) == 1 then
				nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 4","C� quan",nMapID,1601,3200);
				SetNpcLifeTime(nNpcIdx,10);		
				BR_SetCurrentNpcSFX(nNpcIdx,962);	
			end;		
		else
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				if random(1,2) == 1  then
					nNpcIdx = BR_CreateNpc("Ng� ��c �n S�","Ng� ��c �n S�",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				else
					nNpcIdx = BR_CreateNpc("Ng� ��c Cu�ng Nh�n","Ng� ��c Cu�ng Nh�n",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				end;
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan","Tr� ng�i",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan","Tr� ng�i",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
			end;		
		end;
	elseif nDiff == 9 then
		if nStage == MAX_STAGE then
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				if random(1,2) == 1  then
					nNpcIdx = BR_CreateNpc("Ng� ��c �n S�","Ng� ��c �n S�",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				else
					nNpcIdx = BR_CreateNpc("Ng� ��c Cu�ng Nh�n","Ng� ��c Cu�ng Nh�n",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				end;
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan 2","Tr� ng�i",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("Ng� ��c m�t th�t c� quan 2","Tr� ng�i",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
			end;
			if BR_CheckTimerPosition(20,60) == 1 then
				nNpcIdx = BR_CreateNpc("C� quan n� tr�nh 2","C� quan",nMapID,1601,3200);
				SetNpcLifeTime(nNpcIdx,10);	
				BR_SetCurrentNpcSFX(nNpcIdx,962);	
			end;
		end;	
	end;
end;
function BR_RF_UnInitStageEven_WDGS(nDiff,nStage)

end;
--===============================================================================================================
TB_INIT_STAGE_FUN = 
{
	[0] = nil,
	[1] = nil,	--����
	[2] = BR_RF_InitStage_SLSJ,	--�����׼�
	[3] = BR_RF_InitStage_SLCS,	--������ɮ
	[4] = BR_RF_InitStage_SLWS,	--������ɮ
	[5] = nil,	--����
	[6] = BR_RF_InitStage_TM,	--����
	[7] = nil,	--����
	[8] = BR_RF_InitStage_EMFJ,	--���ҷ��
	[9] = BR_RF_InitStage_EMSJ,	--�����׼�
	[10] = nil,	--ؤ��
	[11] = BR_RF_InitStage_GBJY,	--ؤ�ﾻ��
	[12] = BR_RF_InitStage_GBWY,	--ؤ������
	[13] = nil,	--�䵱
	[14] = BR_RF_InitStage_WDDJ,	--�䵱����
	[15] = BR_RF_InitStage_WDSJ,	--�䵱�׼�
	[16] = nil,	--����
	[17] = BR_RF_InitStage_YMQQ,	--����ǹ��
	[18] = BR_RF_InitStage_YMGQ,	--���Ź���
	[19] = nil,	--�嶾
	[20] = BR_RF_InitStage_WDXX,	--�嶾а��
	[21] = BR_RF_InitStage_WDGS,	--�嶾��ʦ
}

TB_PROC_STAGE_EVEN_FUN = 
{
	[0] = nil,
	[1] = nil,	--����
	[2] = BR_RF_ProcStageEven_SLSJ,	--�����׼�
	[3] = BR_RF_ProcStageEven_SLCS,	--������ɮ
	[4] = BR_RF_ProcStageEven_SLWS,	--������ɮ
	[5] = nil,	--����
	[6] = nil,	--����
	[7] = nil,	--����
	[8] = BR_RF_ProcStageEven_EMFJ,	--���ҷ��
	[9] = BR_RF_ProcStageEven_EMSJ,	--�����׼�
	[10] = nil,	--ؤ��
	[11] = BR_RF_ProcStageEven_GBJY,	--ؤ�ﾻ��
	[12] = BR_RF_ProcStageEven_GBWY,	--ؤ������
	[13] = nil,	--�䵱
	[14] = BR_RF_ProcStageEven_WDDJ,	--�䵱����
	[15] = BR_RF_ProcStageEven_WDSJ,	--�䵱�׼�
	[16] = nil,	--����
	[17] = BR_RF_ProcStageEven_YMQQ,	--����ǹ��
	[18] = BR_RF_ProcStageEven_YMGQ,	--���Ź���
	[19] = nil,	--�嶾
	[20] = BR_RF_ProcStageEven_WDXX,	--�嶾а��
	[21] = BR_RF_ProcStageEven_WDGS,	--�嶾��ʦ
}

TB_UNINIT_STAGE_FUN = 
{
	[0] = nil,
	[1] = nil,	--����
	[2] = BR_RF_UnInitStageEven_SLSJ,	--�����׼�
	[3] = BR_RF_UnInitStageEven_SLCS,	--������ɮ
	[4] = BR_RF_UnInitStageEven_SLWS,	--������ɮ
	[5] = nil,	--����
	[6] = BR_RF_UnInitStageEven_TM,	--����
	[7] = nil,	--����
	[8] = BR_RF_UnInitStageEven_EMFJ,	--���ҷ��
	[9] = BR_RF_UnInitStageEven_EMSJ,	--�����׼�
	[10] = nil,	--ؤ��
	[11] = BR_RF_UnInitStageEven_GBJY,	--ؤ�ﾻ��
	[12] = BR_RF_UnInitStageEven_GBWY,	--ؤ������
	[13] = nil,	--�䵱
	[14] = BR_RF_UnInitStageEven_WDDJ,	--�䵱����
	[15] = BR_RF_UnInitStageEven_WDSJ,	--�䵱�׼�
	[16] = nil,	--����
	[17] = BR_RF_UnInitStageEven_YMQQ,	--����ǹ��
	[18] = BR_RF_UnInitStageEven_YMGQ,	--���Ź���
	[19] = nil,	--�嶾
	[20] = BR_RF_UnInitStageEven_WDXX,	--�嶾а��
	[21] = BR_RF_UnInitStageEven_WDGS,	--�嶾��ʦ
}