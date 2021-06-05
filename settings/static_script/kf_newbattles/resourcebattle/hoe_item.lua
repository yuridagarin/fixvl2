Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnUse(nItemIndex)
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("C�ng c� n�y ch� d�ng ���c trong Chi�n tr��ng Th�o c�c.");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("T�m th�i kh�ng th� d�ng c�ng c� n�y.");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--�Ƿ�����
		Msg2Player("Tr�n ng�a kh�ng th� nh�t l��ng th�o.");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("���������������ɼ����ݱ���쳣���ѡ�");
--		return 0;
--	end;
	if nMapX < 1598 or nMapY < 3227 or nMapX > 1737 or nMapY > 3512 then	--�������С���������Ļ����ǷǷ�λ��
		Msg2Player("Khu v�c n�y kh�ng c� l��ng th�o");
		return 0;
	end;
	local nPosIndex = Get_ResIndex_ByPos(nMapX,nMapY);
	if nPosIndex < 1 or nPosIndex > 110 then
		WriteLog("[Chi�n tr��ng b�o l�i]: hoe_item.lua tr� v� tr� ph�n h�i Get_ResIndex_ByPos b�o l�i"..nPosIndex);
		Msg2Player("H� th�ng b�o l�i: B�n kh�ng nh�n ���c t�i nguy�n n�o h�t");
		return 0;
	end;
	local nGroup,nBit = 0,0;
	nGroup = floor(nPosIndex/32);
	nBit = mod((nPosIndex-1),32)+1;
	if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 0 then
		if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,1));
			Msg2Player("�ang thu th�p l��ng th�o��......");
			CastState("state_fetter",1,5*18)
			ProgressSlot(5*18);	--5��
			SetItemUseLapse(nItemIndex,5);	--��ȴʱ�䣺5��
		else
			Msg2Player("Kh�ng th� l�m ��ng t�c n�y � tr�ng th�i ng�i")
		end;
	else
		Msg2Player("Khu n�y �� b� ��o qua!");
	end;
	return 1;
end;

function OnProgressCallback()
	local nTime = GetTime();
	local n1MIN2TYPE = BT_GetData(PT_1MIN2TYPE);
	local n1MIN3TYPE = BT_GetData(PT_1MIN3TYPE);
	local n1MIN3TYPEDOUBLE = BT_GetData(PT_1MIN3TYPEDOUBLE);
	local n1MINDOUBLE = BT_GetData(PT_1MINDOUBLE);
	local n3MINDOUBLE = BT_GetData(PT_3MINDOUBLE);
	if nTime - n1MIN2TYPE <= 60 then
		Get_Resource(2);	--һ�����ڲ�ȡ�Ķ����м�����
	elseif nTime - n1MIN3TYPE <= 60 then
		Get_Resource(3);	--һ�����ڲ�ȡ�Ķ��Ǹ߼�����
	elseif nTime - n1MIN3TYPEDOUBLE <= 60 then
		Get_Resource(3,2);	--һ�����ڲ�ȡ�Ķ���2���߼�����
	elseif nTime - n1MINDOUBLE <= 60 then
		Get_Random_Resource(2);	--һ�����ڲ�ȡ�Ķ���2������
	elseif nTime - n3MINDOUBLE <= 180 then
		Get_Random_Resource(2);	--�������ڲ�ȡ�Ķ���2������
	else
		Get_Random_Resource();
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;