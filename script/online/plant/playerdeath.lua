Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");

function OnDeath(Launcher)
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then
		SetDeathScript("");	--���������ű�Ϊ��
		SetTask(TASK_TREEINDEX,0);	--
		SetTask(TASK_TREEGROW,0);	--
		SetTask(TASK_PLANTTIME,0);		
		return 0;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	KillerIndex = NpcIdx2PIdx(Launcher);
	OldPlayerIndex = PlayerIndex;
	local sName = GetName();
	SetDeathScript("");	--���������ű�Ϊ��
	SetNpcLifeTime(GetTask(TASK_TREEINDEX),0);	--����ʧ��
	SetNpcScript(GetTask(TASK_TREEINDEX),"");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	WriteLogEx("Trong cay Bat Nha", "Mat cay");
	PlayerIndex = KillerIndex;
	if PlayerIndex > 0 then
		if AddItem(2,0,398,1) == 1 then
			Msg2Player(TREETYPE[nTreeGrow][2].."Linh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng, b�n mau nh�t l�y h�t gi�ng");
		end;
		sName = GetName();
		PlayerIndex = OldPlayerIndex;
		Msg2Player(TREETYPE[nTreeGrow][2].."Linh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng, b�n mau nh�t l�y h�t gi�ng, h�t gi�ng c�ng b� t�n c��p �o�t m�t.");
	end;
end;