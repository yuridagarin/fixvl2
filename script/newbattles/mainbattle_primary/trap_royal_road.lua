Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
function main()
	local _,nMapX,_ = GetWorldPos();
	local nSide = 0;	--��ʾ��ߵ�TRAP��
	local nDirection = 0;	--��ʾ����������
	if nMapX >= 1752 then
		nSide = 1;		--��ʾ�ұߵ�TRAP��
	end;
	if nMapX == 1670 or nMapX == 1829 then
		nDirection = 1;	--��ʾ����������
	end;
	local nCamp = BT_GetCamp();
	local nCampPlace = nCamp;
	if (GetMissionV(MV_NPC_TYPE_SONG+nCamp-1) < 2 and nSide == nCampPlace-1) or (GetMissionV(MV_NPC_TYPE_SONG+2-nCamp) < 2 and nSide == 2-nCampPlace) then
		local tLeftPos = {{1640,3671},{1688,3668}};
		local tRightPos = {{1813,3671},{1865,3663}};
		if nSide == 0 then	--�������ߵ�TRAP��
			if nDirection == 0 then
				SetPos(tLeftPos[1][1]+random(-7,7),tLeftPos[1][2]+random(-7,7));
			else
				SetPos(tLeftPos[2][1]+random(-7,7),tLeftPos[2][2]+random(-7,7));
			end;
		else
			if nDirection == 0 then
				SetPos(tRightPos[1][1]+random(-7,7),tRightPos[1][2]+random(-7,7));
			else
				SetPos(tRightPos[2][1]+random(-7,7),tRightPos[2][2]+random(-7,7));
			end;
		end;
		Talk(1,"","Tr�n chi�n �ang di�n ra kh�c li�t, �� tr�nh mai ph�c ta kh�ng n�n theo l�i n�y.");
	end;
end;