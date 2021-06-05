Include("\\script\\online\\olympic\\oly_head.lua")

function main()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_IsActivityOpen() ~= 1 then
		return 0;
	end
	local tbSay = {
		"Th�p s�ng b�ng 5 lo�i Th�nh H�a/free_fire",
		"Th�p s�ng b�ng Ng� Th�i Th�nh H�a/ib_fire",
		"\n r�t lui/do_nothing",
	}
	local sTitle = "H�c S�c Th�nh H�a : C�c h� �� th�p s�ng c�ng d�n %d l�n , th�p s�ng th�m %d l�n n�a s� nh�n ���c %s gi�i th��ng";
	local nCount = gf_GetMyTaskByte(VET_OLY_TASK2,1,2);
	local nIndex = oly_GetCountStep(nCount);
	sTitle = format(sTitle,nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][1]-nCount,OLY_ACCUMULATE_FIRE_AWARD_TABLE[nIndex][4]);
	Say(sTitle,getn(tbSay),tbSay);
end

function free_fire()
	if gf_GetTaskBit(VET_OLY_TASK3,2) ~= 0 then
		--Talk(1,"","ÿ�����еİ���ʥ��̳һ��ֻ�ܵ�ȼ1��");
		Talk(1,"","Th�nh H�a ��n c�a m�i th�nh 1 ng�y ch� ���c �i�m h�a 1 l�n");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
  		return 0;
	end
	--������ȫ
	local tempTb = "Kh�ng �� v�t ph�m th�p s�ng ch�a th�nh c�ng: \n";
	local nFlag = 0;
	for i=1,getn(Flame_Table) do
		if GetItemCount(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3]) < 1 then
		 tempTb = tempTb..Flame_Table[i][5].." ";
		 nFlag = 1;
		end
	end
	if nFlag == 1 then
		Talk(1,"",tempTb);
		return 0;
	end	
	--ɾ������
	nFlag = 0;
	for i=1,getn(Flame_Table) do
		if DelItem(Flame_Table[i][1],Flame_Table[i][2],Flame_Table[i][3],1) ~= 1 then
			nFlag = 1;
		end
	end
	if nFlag == 1 then
		return -1;
	end
	--�����1
	gf_SetTaskBit(VET_OLY_TASK3,2,1,TASK_ACCESS_CODE_OLYMPIC);
	SetCurrentNpcSFX(GetTargetNpc(),972,2,0,3);
	--���յ�����
	if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--�ۼƵ�����
	oly_Accumulate_FireNum();
	--������2
	oly_GiveAward2();
end

function ib_fire()
	AskClientForNumber("ib_fire_Rec",1,min(OLY_IB_FIRE_MAX_NUM,GetItemCount(2,1,30402)),"H�y  nh�p s� l�n th�p s�ng v�o :");
end

function ib_fire_Rec(nNum)
	if not nNum or nNum <= 0 then
		return
	end
	SetCurrentNpcSFX(GetTargetNpc(),972,2,0,3);
	for i=1,nNum do
		if ib_fire_do() ~= 1 then
			break;
		end
	end
end

function ib_fire_do()
	if gf_Judge_Room_Weight(2,1,"") ~= 1 then
  		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
  		return 0;
	end
	if GetItemCount(2,1,30402) < 1 then
		Talk(1,"","Ng� Th�i Th�nh H�a kh�ng ��, kh�ng th� th�p s�ng Th�nh H�a ��n.");
		return 0;
	end
	if DelItem(2,1,30402,1) ~= 1 then
		return -1;
	end
	--���յ�����
	if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
		gf_SetTaskByte(VET_OLY_TASK,1,gf_GetTaskByte(VET_OLY_TASK,1) + 1,TASK_ACCESS_CODE_OLYMPIC);
	end
	--�ۼƵ�����
	oly_Accumulate_FireNum();
	--������3
	oly_GiveAward3();
	return 1;
end