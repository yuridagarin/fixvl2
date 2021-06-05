--���ߣ��Ͼ�
--�������ڣ�07��11��21��14:34
--��������ű�

g_szThisFile = "\\script\\task\\faction_back_room\\death_player.lua";

Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	WantTo1v1(PlayerIndex,"B�n b� ��nh ng�, b�n c� mu�n ti�p t�c kh�ng? C�n "..NEED_NUM_JIEGUAN.."c�i"..TB_ITEM[1][1]..". ��m ng��c %d gi�y...",30,g_szThisFile);
end;

function OnWant(nPIdx, nType)
	if BR_CheckMissionName() ~= 1 then
		return 0;
	end;
	RevivePlayer(0);
	if nType == 0 then	--ѡ��ȡ���������ʱ
		Say("V��t �i th�t b�i, �ang ��a b�n tr� v�, xin h�y ��i......",0);
		process_failure();
		return 0;
	end;
	if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < NEED_NUM_JIEGUAN then
		Say("C�n c� "..NEED_NUM_JIEGUAN.."c�i"..TB_ITEM[1][1].." m�i c� th� ti�p t�c, v��t �i th�t b�i! �ang ��a b�n tr� v�, xin h�y ��i......",0);
		process_failure();
		return 0;
	end;
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	--�ɹ��ӹ�
	Say("Ti�p t�c th�nh c�ng !",0);
	Msg2MSAll(MISSION_ID,"Ti�p t�c th�nh c�ng !");
	BR_RestorePlayer();
	DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],NEED_NUM_JIEGUAN);
	BR_UnInitStageEven(nDiff,nStage);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then	--��ǰҪ�ӵĹ���1,5,9��
		BR_PauseStage();	--�����׶�
	else	--���������Ϣ��
		--�Խ���ĳһ�ؿ���Ϊ�ؿ�֮��ķֽ��
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;

function process_failure()
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	Msg2MSAll(MISSION_ID,"V��t �i th�t b�i ......");
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
	WriteLog(LOG_HEADER.."V��t �i th�t b�i. �� kh�: "..nCurDiff..", �i  "..nCurStage..". T�n: "..GetName()..", c�p:"..GetLevel()..","..GetMissionV(MV_ROUTE)..", nguy�n nh�n: t� vong n�n kh�ng th� ti�p t�c");
end;
