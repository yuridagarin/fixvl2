--file function :Vn activity base class info
--function design:cunzhang
--develop date 5-17-2011
--modify list: liubo
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

TB_VN_ACTIVITY_MAIN = {}

EVENT_LOG_TITLE = "Hoat dong thang 11 nam 2014"
SVN_ACTIVITY_INI_FILE = "\\script\\online_activites\\ini\\VnOnlineMain.ini"
g_objVNAcitivityInfo = ff_GetIniFileObj(SVN_ACTIVITY_INI_FILE)
if g_objVNAcitivityInfo:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SVN_ACTIVITY_INI_FILE)
end

--���Ҵ��¼�����
function CLASS_ACTIVITY:JinNangOpen()
	local nTag = 0;
	local tbSayDialog = {};
	local szSayHead = "";
	if self:OnlineTimeChk() == 1 then
		nTag = 1;
		szSayHead = self:CreateActivityHead()
		--�һ�ѡ��
		for i = 1,self.nItemChgNum do
--			tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#gf_VnItemChgDeal("..tonumber(self.sActivityChgKey)..","..tonumber(i)..")");
			
			if i == 1 then
				tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form1(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
			elseif i == 2 then
				--tinsert(tbSayDialog,gf_VnGetChangeSaySel(self.sActivityChgKey.."Chg"..tostring(i)).."/#VNG_DoiEvent_Form2(\""..self.sActivityChgKey.."Chg"..tostring(i).."\")")
				--tinsert(tbSayDialog,"��i 1hoa 3/8(c�n 5 gi�y b�ng ki�ng + 5 b� c�ng + 2 xu v�t ph�m)/VNG_DoiEvent_Form2")
			end
		end
		for i = 1,getn(self.tbPrizeItemInfo) do
			if getn(self.tbPrizeItemInfo[i].tbExpPrizeNum) == 2 and self.nPrizeMode ~= 1 then
				tinsert(tbSayDialog,format(self.tbHintString[2].."/#gf_VnSetActivityPrizeModel("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
			if self.tbPrizeItemInfo[i].nItemUseTimesMax then
				if self.tbPrizeItemInfo[i].nTaskIdGetFinalPrize ~= 0 then
					tinsert(tbSayDialog,format(self.tbHintString[3][1].."/#Vet_Activity_GetLastPrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end
				if self.nPrizeMode == 1 then
					tinsert(tbSayDialog,format(self.tbHintString[3][2].."/#Vet_Activity_GetCapsValuePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
				end	
				--�鿴ʹ������
				tinsert(tbSayDialog,format(self.tbHintString[13].."/#Vet_ShowUsedCount("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..i..")",self.tbPrizeItemInfo[i].tbItemInfo[4]))
			end
		end
		for nIep = 1, self.nItemExcgPrizeCount do
			if getn(self.tbItemExchangePrize[nIep]) == 4 then
				tinsert(tbSayDialog,format(self.tbHintString[16].."/#Vet_ItemExchangePrize("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..","..nIep..")",self.tbItemExchangePrize[nIep][4]))
			end
		end
		if self.nFlag == 1 then
			tinsert(tbSayDialog,self.tbHintString[15].."/#Vet_Activity_GetLastPrizeBoth("..self.tbTaskGroup[1]..","..self.tbTaskGroup[2]..")");
		end
	end
	return tbSayDialog,szSayHead,nTag;
end

function CLASS_ACTIVITY:CreateActivityHead()
	local sStartTime = GetEventStartDate(self.nActivityID)
	local nEndTime = GetEventEndDate(self.nActivityID)
	local sTimString = "ng�y "..tostring(tonumber(strsub(sStartTime,7,8))).." th�ng "..tostring(tonumber(strsub(sStartTime,5,6))).." n�m "..tostring(strsub(sStartTime,1,4))
	sTimString = sTimString.." ��n 24:00".." ng�y "..tostring(tonumber(strsub(nEndTime,7,8)) - 1).." th�ng "..tostring(tonumber(strsub(nEndTime,5,6))).." n�m "..tostring(strsub(nEndTime,1,4))
--	if strsub(sStartTime,1,4) ~= strsub(nEndTime,1,4) then
--		sTimString = sTimString.." n�m "..tostring(strsub(sStartTime,1,4))
--	end
	return  format(self.tbHintString[1],self.sActivityName,sTimString)
end

--�����ʱ���ж�
function CLASS_ACTIVITY:OnlineTimeChk()
	return gf_CheckEventDateEx(self.nActivityID)
end

--������ȡ����
function CLASS_ACTIVITY:ItemPrizeOnUse(nItemIndex,nItemSeq)
	--ʱ����
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	local tbPrizeItemInfo = self.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
	local nPrizeType = 1
	--ʹ�������ж�
	if tbPrizeItemInfo.nItemUseTimesMax and tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
		if nUseTimes >= tbPrizeItemInfo.nItemUseTimesMax then
			Talk(1,"",format(self.tbHintString[5],tbPrizeItemInfo.tbItemInfo[4],tbPrizeItemInfo.nItemUseTimesMax))
			return
		end
	end
	if self.nPrizeMode ~= 1 then
		--�һ�������
		if getn(tbPrizeItemInfo.tbExpPrizeNum) == 2 then
			nPrizeType = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdPrizeType)
			if nPrizeType == 0 then
				self:PrizeTypeSel(nItemSeq)
				return
			end
		end
	end
	--�����ռ��ж�
	if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbAdditionalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	else
		if gf_Judge_Room_Weight(tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[1],tbPrizeItemInfo.tbNormalPrize.tbItemRoomWeight[2],"") ~= 1 then
			return
		end
	end
	--��ͨ��������
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		if self.nPrizeMode ~= 1 then
			if nPrizeType == 1 then		--ģʽ1
				if tbPrizeItemInfo.tbExpPrizeNum[1] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[1]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[1] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo1,tbPrizeItemInfo.tbNormalPrize.nRandomBase1,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--�Ƿ�����������Ĵ���ģʽ1��ģʽ2�����������������
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			else		--ģʽ2
				if tbPrizeItemInfo.tbExpPrizeNum[2] > 0 then
					ModifyExp(tbPrizeItemInfo.tbExpPrizeNum[2]);
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[1] > 0 then
						gf_EventGiveCustomAward(3, tbPrizeItemInfo.bHaveThings[1], 1);
					end
					if tbPrizeItemInfo.bHaveThings and tbPrizeItemInfo.bHaveThings[2] > 0 then
						gf_EventGiveCustomAward(4, tbPrizeItemInfo.bHaveThings[2], 1);
					end
				end
				if getn(tbPrizeItemInfo.tbPrizeCondition) == 2 and tbPrizeItemInfo.tbPrizeCondition[2] ~= 0 then
					self:GiveItemPrize(tbPrizeItemInfo.tbNormalPrize.tbPrizeInfo2,tbPrizeItemInfo.tbNormalPrize.nRandomBase2,format(self.tbHintString[10][1],tbPrizeItemInfo.tbItemInfo[4]))
				end
				--�Ƿ�����������Ĵ���ģʽ1��ģʽ2�����������������
				if tbPrizeItemInfo.nPrizeAdditionalTimes > 0 and mod((nUseTimes + 1),tbPrizeItemInfo.nPrizeAdditionalTimes) == 0 then
					self:GiveItemAdditionPrize(tbPrizeItemInfo.tbAdditionalPrize,format(self.tbHintString[10][2],tbPrizeItemInfo.tbItemInfo[4]))
					--self:OnGetItemAddionalPrize(nUseTimes + 1)
				end
			end
		elseif self.nPrizeMode == 1 then
			self:GivePmModePrize(nItemSeq)
		end
		--ʹ�ô�������
		if tbPrizeItemInfo.nItemUseTimesMax then
			Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes,(nUseTimes + 1))
			local msg = ""
			if tbPrizeItemInfo.nItemUseTimesMax ~= 0 then
				msg = msg..format(self.tbHintString[11][1],tbPrizeItemInfo.tbItemInfo[4],(nUseTimes + 1),tbPrizeItemInfo.nItemUseTimesMax)
			end
			if self.nPrizeMode == 1 then
				msg = msg..","..format("�i�m t�ch l�y l� <color=green>%d<color>", Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], tbPrizeItemInfo.nPmAccPoint))
			end
--			Talk(1,"",msg)
		end
	end
end
--����ģʽѡȡ
function CLASS_ACTIVITY:PrizeTypeSel(nItemSeq)
	local tbItemPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	if not tbItemPrizeInfo.tbExpPrizeName or getn(tbItemPrizeInfo.tbExpPrizeName) ~= 2 then
		Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2], tbItemPrizeInfo.nTaskIdPrizeType, 1)
		return
	end
	if getn(tbItemPrizeInfo.tbExpPrizeNum) == 2 then
		Say(format(self.tbHintString[9][1],tbItemPrizeInfo.tbItemInfo[4]),
			3,
			format(self.tbHintString[9][2][1],format(tbItemPrizeInfo.tbExpPrizeName[1],tbItemPrizeInfo.tbExpPrizeNum[1]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			format(self.tbHintString[9][2][2],format(tbItemPrizeInfo.tbExpPrizeName[2],tbItemPrizeInfo.tbExpPrizeNum[2]),self.tbTaskGroup[1],self.tbTaskGroup[2],tbItemPrizeInfo.nTaskIdPrizeType, 1),
			self.tbHintString[9][2][3]
		)
	end
end
--��ȡ���ս���
function CLASS_ACTIVITY:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex)
	--ʱ����
	if self:OnlineTimeChk() ~= 1 then
		Talk(1,"",self.tbHintString[8])
		return
	end
	--�����Ƿ��ͨ
	if nPrizeDiff == 9 or nPrizeDiff == 40 then
		if MeridianGetLevel() < 1 then
			Msg2Player("C�c h� ch�a k�ch ho�t Kinh M�ch, kh�ng th� nh�n ���c Ch�n Kh�.")
			return 0;
		end
		--����ʣ����������
		if MeridianGetLeftGenuineQiCapcity() < 1500 then
			Msg2Player("Kh� h�i c�a thi�u hi�p kh�ng �� kh�ng th� nh�n ch�n kh�");
			return 0;
		end
	end
	--����ת��1�����������˽���
	if nPrizeDiff == 26 then
		if VetInterface_ConditionCheck1() ~= 1 then
			Msg2Player("Ch� c� nh�n v�t nh�n nhi�m v� ph�c sinh 1 m�i c� th� nh�n ph�n th��ng n�y");
			return 0;
		end
	end
	if nPrizeDiff == 27 or nPrizeDiff == 37 then	--or nPrizeDiff == 49
		if VetInterface_ConditionCheck1_6() ~= 1 then
			Msg2Player("Ch� c� nh�n v�t nh�n nhi�m v� ph�c sinh 1 ( tr�ng sinh 6) m�i c� th� nh�n ph�n th��ng n�y");
			return 0;
		end
	end
	if nPrizeDiff == 49 or nPrizeDiff == 57 then
		local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		if nGetQuest < 1 then
			Talk(1, "", "C�c h� ch�a nh�n nhi�m v� ph�c sinh b�n ��ng h�nh.")
			return 0
		end
		if nGetQuest >= 2 then
			Talk(1, "", "C�c h� �� ho�n th�nh nhi�m v� ph�c sinh b�n ��ng h�nh.")
			return 0
		end
	end
	if nPrizeDiff == 55 then
		local nLevel = mod(TASK_VNG_PET,100)
		if nLevel < 2 then
				Msg2Player("B�n ch�a c� PET c�p 1 n�n kh�ng th� nh�n ph�n th��ng n�y")
				return 0
		end
	end
--	if nPrizeDiff == 37 then	--and VetInterface_Reborn_ConditionCheck() ~= 1
--		return 0;
--	end
	--��Ҫ�ж�һ��
	if self.tbPrizeItemInfo[nItemSeq] == nil then
		return
	end
	local tbPrizeInfo = self.tbPrizeItemInfo[nItemSeq]
	--�ж��Ƿ������ս���
	if tbPrizeInfo.nItemUseTimesMax == nil then
		return
	end
	--�ж���Ϸʱ��
	if self:OnlineTimeChk() ~= 1 then
		return
	end
	--�жϴ���
	local nUseTimes = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdUseItemTimes)
	if nUseTimes < tbPrizeInfo.nItemUseTimesMax then
		Talk(1,"",format(self.tbHintString[6],tbPrizeInfo.tbItemInfo[4],tbPrizeInfo.nItemUseTimesMax))
		return
	end
	if self.nFinalPrizeMode == 0 then 
		--�Ƿ���ȡ�ж�
		if Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--�ռ为���ж�
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--��������
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				--���Ĵ���
				if nPrizeDiff == 37 and VetInterface_Reborn_ConditionCheck() ~= 1 then
					return 0;
				end
--				if nPrizeDiff == 57 and Vet_Complete_Revive_OnePartner_FirstStage_check() ~= 1 then
--					return 0;
--				end
--				if nPrizeDiff == 58 and Vet_Complete_Revive_OnePartner_SecondStage_check() ~= 1 then
--					return 0;
--				end
				if nPrizeDiff ~= 58 then
					Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
					self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
				end
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	elseif self.nFinalPrizeMode == 1 then
		--�Ƿ���ȡ�ж�
		if nIndex - 1 > 0 then
			if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex - 1) ~= 1 then
				Talk(1,"",self.tbHintString[17])
				return
			end
		end
		if Vet_Activity_GetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex) == 1 then
			Talk(1,"",self.tbHintString[7])
			return
		else
			--�ռ为���ж�
			if tbPrizeInfo.tbFinalPrize and tbPrizeInfo.tbFinalPrize.tbItemRoomWeight and gf_Judge_Room_Weight(tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[1],tbPrizeInfo.tbFinalPrize.tbItemRoomWeight[2],"") ~= 1 then
				return 0
			end
			--��������
			if tbPrizeInfo.tbFinalPrize.tbPrizeInfo then
				Vet_Activity_SetItemUseInfoBit(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize, nIndex, 1)
				self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
			end
			self:OnGetFinalPrize(nPrizeDiff,nOrder)
		end
	end
end

--���轱��
function CLASS_ACTIVITY:GiveItemAdditionPrize(tbItemPrizeInfo,szLog)
	gf_EventGiveRandAward(tbItemPrizeInfo.tbPrizeInfo,tbItemPrizeInfo.nRandomBase,1,self.sActivityName,szLog)
end

function CLASS_ACTIVITY:GiveItemPrize(tbItemPrizeTable,nRandomBase,szLog)
	gf_EventGiveRandAward(tbItemPrizeTable,nRandomBase,1,self.sActivityName,szLog)
end

--ÿ��ʹ�õ��߽���
function CLASS_ACTIVITY:GivePmModePrize(nItemSeq)
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local tPoint = {
  	{1, 60},
  	{2, 24},
  	{3, 10},
  	{4, 5},
  	{5, 1},
  }
  local nRand = gf_GetRandItemByTable(tPoint, gf_SumRandBase(tPoint), 1)
	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1], self.tbTaskGroup[2], self.tbPrizeItemInfo[nItemSeq].nPmAccPoint, nPmAccPoint + tPoint[nRand][1])
	Msg2Player(format("B�n nh�n ���c %d �i�m t�ch l�y ", tPoint[nRand][1]))
	if type(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize) == "string" then
		dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)
	else
		print("ERROR:dostring(self.tbPrizeItemInfo[nItemSeq].tbPmFuncPrize)")	
	end
end

--ipairs ���
ipairs = ipairs or function(t)
	for i,v in t do
		if i == "n" then
			t[i]= nil
		end
	end
 return t
end

--��������������
function ServerStartUp(nStartTime,nEndTime)
end

--��ҵ�½����
function PlayerLogin(bExchangeComing,nStartTime,nEndTime)
end

--���������
function Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTask(nTaskIDSeq)
end

function Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq,nTaskValue,bSetType)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	if bSetType and bSetType == 1 then
		if nTaskValue == 1 then
			Msg2Player("Ch�n h�nh th�c ph�n th��ng 1");
		elseif nTaskValue == 2 then
			Msg2Player("Ch�n h�nh th�c ph�n th��ng 2");
		end
	end
	return g_objVetAcitivityTaskGroupTemp:SetTask(nTaskIDSeq,nTaskValue)
end

function Vet_Activity_GetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:GetTaskBit(nTaskIDSeq, nBit)
end

function Vet_Activity_SetItemUseInfoBit(nTaskGrouId,nTaskGroupVersionId,nTaskIDSeq, nBit, nTaskValue)
	local g_objVetAcitivityTaskGroupTemp = TaskManager:Create(nTaskGrouId,nTaskGroupVersionId)
	return g_objVetAcitivityTaskGroupTemp:SetTaskBit(nTaskIDSeq, nBit, nTaskValue)
end

--����ģʽѡȡ
function gf_VnSetActivityPrizeModel(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:PrizeTypeSel(nItemSeq) end
end

--ѡ�����ս���
function Vet_Activity_SelLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq,nPrizeDiff,nOrder,nIndex)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if tbActivity then tbActivity:GetFinalPrize(nItemSeq,nPrizeDiff,nOrder,nIndex) end
end

--ʹ�ô����鿴
function Vet_ShowUsedCount(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local PrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
	local nUseTimes = Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,PrizeItemInfo.nTaskIdUseItemTimes)
	Talk(1,"",format(tbActivity.tbHintString[11][1],PrizeItemInfo.tbItemInfo[4],nUseTimes,PrizeItemInfo.nItemUseTimesMax))
end

function Vet_Activity_GetLastPrize(nTaskGrouId,nTaskIDSeq,nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tTempSel = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.sel
	local tTempPriKind = tbActivity.tbPrizeItemInfo[nItemSeq].tbFinalPrize.tbFinalPrizeKind
	local tTempDiaSel = {}
	if  tTempSel ~= nil and tTempPriKind ~= nil and getn(tTempSel) == getn(tTempPriKind) then
		for j = 1,getn(tTempSel) do
			if tTempSel[j] ~= nil and tTempSel[j] ~= 0 and tTempPriKind[j] ~= nil and tTempPriKind[j] ~= 0 then
				if tTempSel[j] == -1 then
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				else
					tinsert(tTempDiaSel,format(tbActivity.tbHintString[12][tTempPriKind[j]],tTempSel[j],nTaskGrouId,nTaskIDSeq,nItemSeq,tTempSel[j],j))
				end
			end
		end
		tinsert(tTempDiaSel,tbActivity.tbHintString[14])
		Say(tbActivity.tbHintString[12][1],	getn(tTempDiaSel), tTempDiaSel);
	else
		print("ERROR:Vet_Activity_GetLastPrize()")
	end
	return
end

--��ȡ���ֽ���
function Vet_Activity_GetCapsValuePrize(nTaskGrouId, nTaskIDSeq, nItemSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	local nSize = getn(tbPrizeInfo)
	if nSize > 31 then
		print("UDERROR: Vet_Activity_GetCapsValuePrize nSize > 31")
		return
	end
	local tbSay = {}
	for i = 1, nSize do
		local k = tbPrizeInfo[i];
		if k then
			local nIsAward = Vet_Activity_GetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, i)
			local nCount = 0
			if k[2] == "item" then
				nCount = k[3][4]
			elseif k[2] == "function" then
				nCount = k[5]
			end
			if nCount > 0 then
				if nIsAward == 1 then
					tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]*%d", k[1], k[4], nCount).."( �� nh�n th��ng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]*%d", k[1], k[4], nCount).."( c� th� nh�n th��ng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]*%d", k[1], k[4], nCount), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			else
				if nIsAward == 1 then
					tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]",k[1], k[4]).."( �� nh�n th��ng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
				else
					if nPmAccPoint >= k[1] then
						tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]", tonumber(k[1]), k[4]).."( c� th� nh�n th��ng )", format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					else
						tinsert(tbSay, {format("�i�m t�ch l�y %d nh�n ���c [%s]", tonumber(k[1]), k[4]), format("#Vet_Activity_GetCapsValuePrize_Deal(%d, %d, %d, %d, %d)", nTaskGrouId, nTaskIDSeq, nItemSeq, i, nIsAward)})
					end
				end
			end
		end
	end
	tinsert(tbSay, {"\nK�t th�c ��i tho�i", "nothing"})
	local tempSay = {};
	tempSay.msg = format("V�t d�ng hi�n t�i <color=gold>%s<color> �i�m t�ch l�y l� <color=green>%d<color> , %s b�n mu�n nh�n ph�n th��ng n�o ?", tbActivity.tbPrizeItemInfo[nItemSeq].tbItemInfo[4], nPmAccPoint, gf_GetPlayerSexName())
	tempSay.sel = tbSay
	temp_Talk(tempSay);
end

function Vet_Activity_GetCapsValuePrize_Deal(nTG, nTS, nIS, nIdx, nIA)
	local nTaskGrouId = tonumber(nTG)
	local nTaskIDSeq  = tonumber(nTS)
	local nItemSeq    = tonumber(nIS)
	local nIndex      = tonumber(nIdx)
	local nIsAward    = tonumber(nIA)
	if nIsAward == 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng n�y r�i ")
		return
	end
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tbPrizeInfo = tbActivity.tbPrizeItemInfo[nItemSeq].tbPmPrizeInfo
	local tK = tbPrizeInfo[nIndex]
	if not tK then return end
	local nPmAccPoint = Vet_Activity_GetItemUseInfo(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmAccPoint)
	if nPmAccPoint < tK[1] then
		Talk(1,"","�i�m t�ch l�y kh�ng �� , kh�ng th� nh�n th��ng ")
		return
	end
	if "item" == tK[2] or "function" == tK[2] then
		if gf_Judge_Room_Weight(tK[6], tK[6]) ~= 1 then
			Talk(1,"",format("T�i thi�u  <color=red>%d � <color>", tK[6]))
			return 0
		end
	end
	Vet_Activity_SetItemUseInfoBit(nTaskGrouId, nTaskIDSeq, tbActivity.tbPrizeItemInfo[nItemSeq].nPmUsePrizeTag, nIndex, 1)
	if tK[2] == "item" then
		gf_AddItemEx2(tK[3], tK[4], "2XU v�t ph�m", "nh�n ph�n th��ng t�ch l�y �i�m ", tK[5] or 0, 1)
	elseif tK[2] == "exp" then
		gf_ModifyExp(tK[3])
	elseif tK[2] == "function" then
		dostring(tK[3])
	end
end

--ʹ�õ��߶һ�����
function Vet_ItemExchangePrize(nTaskGrouId,nTaskIDSeq,nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[nSeq]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[nSeq]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local tSay = {}
	for i = 1, getn(tAward) do
		local v = tAward[i];
		local msg = ""
		if v[2] == "exp" or v[2] == "rep" or v[2] == "shimen" then
			msg = v[4]..format("(ti�u hao %d c�i%s)", v[1], tItem[4])
		elseif  v[2] == "item" then
			msg = v[4]..format("*%d(ti�u hao %d c�i%s)", v[3][4], v[1], tItem[4])
		elseif v[2] == "function" then
			msg = v[4]..format("*%d(ti�u hao %d c�i%s)", v[5] or 1, v[1], tItem[4])
		end
		tinsert(tSay, {msg, "#Vet_ItemExchangePrize_Deal("..nTaskGrouId..","..nTaskIDSeq..","..i..","..nSeq..")"});
	end
	tinsert(tSay, {"\n T�i h� ch� xem qua th�i", "nothing"});
	local tempSay = {};
	tempSay.msg = format("b�n mu�n s� d�ng <color=green>%s<color> ��i c�i g� ?", tItem[4])
	tempSay.sel = tSay
	temp_Talk(tempSay);
	return
end

function Vet_ItemExchangePrize_Deal(nTaskGrouId, nTaskIDSeq, i, nSeq)
	local tbActivity = gf_VnGetActivityByGroupId(tonumber(nTaskGrouId), tonumber(nTaskIDSeq))
	if not(tbActivity) then return end
	local tItem = tbActivity.tbItemExchangePrize[tonumber(nSeq)]
	if not tItem or getn(tItem) ~= 4 then
		return
	end
	local tAward = tbActivity.tbIEPAward[tonumber(nSeq)]
	if not tAward or getn(tAward) < 1 then
		return
	end
	local v = tAward[tonumber(i)]
	if v[2] == "item" or v[2] == "function" then
		if gf_Judge_Room_Weight(v[6], v[6]) ~= 1 then
			Talk(1,"",format("t�i �� ��y %d", v[6]))
			return
		end
	end
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < v[1] then
		Talk(1,"",format("v�t ph�m %s# s� l��ng kh�ng �� <color=red>%d<color> c�i", tItem[4], v[1]))
		return
	end
	if DelItem(tItem[1], tItem[2], tItem[3], v[1]) ~= 1 then
		return
	end
	if v[2] == "exp" then
		gf_Modify("Exp", v[3])
	elseif v[2] == "rep" then
		gf_Modify("Rep", v[3])
	elseif v[2] == "shimen" then
		gf_EventGiveCustomAward(4, v[3], 1, "2XU v�t ph�m", "v�t ph�m  ��i ph�n th��ng ")
	elseif v[2] == "item" then
		gf_AddItemEx2(v[3], v[4], "2XU v�t ph�m", "v�t ph�m  ��i ph�n th��ng ", v[5], 1)
	elseif v[2] == "function" then
		dostring(v[3])
	end
end

--��ȡ�ѡ��
function get_tbJNDialog_info(tbActivityID)
	local tbSayDialog = {};
	local szSayHead = "";
	local nTag = 0;
	if not tbActivityID then
		return tbSayDialog, szSayHead, "";
	end
	--���ص�һ��ָ��ID�Ļ
	for i = 1, getn(tbActivityID) do
		local nActivityID = tbActivityID[i];
		if nActivityID > 0 and nActivityID <= GetEventCount() then
			if TB_VN_ACTIVITY_MAIN[nActivityID] then
				tbSayDialog, szSayHead, nTag = TB_VN_ACTIVITY_MAIN[nActivityID]:JinNangOpen();
				if nTag == 1 then
					return tbSayDialog, szSayHead, TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName;
				end
			end
		end
	end
	return tbSayDialog, szSayHead, "";
end

--��TaskGroupid����Ϣ��λ
function gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[1] == nTaskGrouId and TB_VN_ACTIVITY_MAIN[i].tbTaskGroup[2] == nTaskIDSeq then
			return TB_VN_ACTIVITY_MAIN[i]
		end
	end
	return nil;
end
--�ɻID��λ�
function gf_VnGetActivityByID(nID)
	return TB_VN_ACTIVITY_MAIN[nID],1
end
--����Ʒ��Ϣ��λ�
function gf_VnGetActivityByItemIndex(nItemIndex)
	local nItemId,nDetaiId,nParticularId = GetItemInfoByIndex(nItemIndex)
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
			if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
				for nItemSeq = 1,getn(TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo) do
					local tbItemInfo = TB_VN_ACTIVITY_MAIN[i].tbPrizeItemInfo[nItemSeq].tbItemInfo
					if tbItemInfo and tbItemInfo[1] == nItemId and tbItemInfo[2] == nDetaiId and tbItemInfo[3] == nParticularId then
						return TB_VN_ACTIVITY_MAIN[i],nItemSeq
					end
				end
			end
	end
	return nil, nil;
end
--��ʱ�䶨λ���Ϣ
function gf_VnGetActivityByTime()
	local tActivityId = {}
	for i,_ in ipairs(TB_VN_ACTIVITY_MAIN) do
		if TB_VN_ACTIVITY_MAIN[i]:OnlineTimeChk() == 1 then
			tinsert(tActivityId,i)
		end
	end
	return tActivityId
end

--normal task-prize api functions

--�������û����
function vaf_TianMenZhen_Award_Api(nType)
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tJoinTianMenZhen")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if nType == 1 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][5]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
					elseif nType == 2 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][6]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
					elseif nType == 3 then
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][7]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
					else
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
					end
				end
			else
				if nType == 1 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[5]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
				elseif nType == 2 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[6]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
				elseif nType == 3 then
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[7]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
				else
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[8],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "Thi�n M�n tr�n")
				end
			end
		end
	end
end

VAF_AWARD_API_TABLE = {
	["tPlantSmallTreePrize"] = "Tr�ng C�y B�t Nh� Nh�",   
	["tPlantBigTreePrize"] = "Tr�ng C�y B�t Nh� L�n", 
	["tOpenSeedBagPrize"] = "M� T�i H�t Gi�ng", 
	["tLiangShanKillBoss"] = "L��ng S�n ti�u di�t BOSS", 
	["tLiangShanDailyTask"] = "L��ng S�n v��t �i nhi�m v� h�ng ng�y", 
	["tWanJianZhong"] = "Qua �i V�n Ki�m Tr�ng", 
	["tTongTianHuanJing"] = "Qua �i Th�ng Thi�n", 
	["tPlant4LingTree"] = "Tr�ng C�y T� Linh", 
	["tPlantSeedTree"] = "Tr�ng C�y H�t Gi�ng",
	["tLiangShanJinBox"] = "L��ng S�n-R��ng V�ng",
	["tLiangShanYinBox"] = "L��ng S�n-R��ng B�c",
	["tLiangShanTongBox"] = "L��ng S�n-R��ng ��ng",
	["tWjzDailyTask"] = "Nhi�m v� V�n Ki�m Tr�ng",
	["tWjzJinBox"] = "V�n Ki�m Tr�ng-R��ng V�ng",
	["tWjzYinBox"] = "V�n Ki�m Tr�ng-R��ng B�c",
	["tWjzTongBox"] = "V�n Ki�m Tr�ng-R��ng ��ng",
	["tDXGDailyTask"] = "Nhi�m v� ��a Huy�n Cung",
	["tDXGJinBox"] = "��a Huy�n Cung-R��ng V�ng",
	["tDXGYinBox"] = "��a Huy�n Cung-R��ng B�c",
	["tDXGTongBox"] = "��a Huy�n Cung-R��ng ��ng",
	["tTYTJinBox"] = "R��ng V�ng Th�i Nh�t Th�p-Th��ng",
	["tTYTYinBox"] = "R��ng B�c Th�i Nh�t Th�p-Th��ng",
	["tTYTTongBox"] = "R��ng ��ng Th�i Nh�t Th�p-Th��ng",
	["tTYTJinBox_H"] = "Th�i Nh�t Th�p Anh H�ng_R��ng V�ng",
	["tTYTYinBox_H"] = "Th�i Nh�t Th�p Anh H�ng_R��ng B�c",
	["tTYTTongBox_H"] = "Th�i Nh�t Th�p Anh H�ng_R��ng ��ng",
}

function vaf_award_api(szKey)
	local tActivityId = gf_VnGetActivityByTime()
	if not VAF_AWARD_API_TABLE[szKey] then return end
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID), szKey)
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
				end
			else
				gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, VAF_AWARD_API_TABLE[szKey])
			end
		end
	end
end


--kill npcɱҰ�ֵ���
function vaf_kill_npc_drop()
	local tActivityId = gf_VnGetActivityByTime()
	for _,nActivityID in ipairs(tActivityId) do
		local tPrizeInfo = g_objVNAcitivityInfo:GetMixTable(tostring(TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID),"tKillNpc")
		if (tPrizeInfo) then
			if type(tPrizeInfo[1]) == "table" then
				for i = 1,getn(tPrizeInfo) do
					if random(100) <= (tPrizeInfo[i][6] or 10) then 
						gf_Add2XUAward({tPrizeInfo[i][1],tPrizeInfo[i][2],tPrizeInfo[i][3],tPrizeInfo[i][4]},tPrizeInfo[i][5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "��nh qu�i ngo�i th�nh nh�n ���c ph�n th��ng ho�t ��ng")
					end
				end
			else
				if random(100) <= (tPrizeInfo[6] or 10) then 
					gf_Add2XUAward({tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4]},tPrizeInfo[5],TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName, "��nh qu�i ngo�i th�nh nh�n ���c ph�n th��ng ho�t ��ng")
				end
			end
		end
	end
end

--��þ���
function vaf_201203_GiveJunGong()
	gf_EventGiveCustomAward(31,1000,1,"M� ti�c khao qu�n","100 l�n gi�i th��ng")
end
function vaf_201204_GiveJunGong()
	gf_EventGiveCustomAward(31,100,1,"M�a H� M�t L�nh","100 l�n gi�i th��ng")
end

function gf_VnGetPrizeRandomSeed(tbPrize)
	local nRandomSeed = 0
	if not tbPrize then return end
	for i = 1,getn(tbPrize) do
		nRandomSeed = nRandomSeed + tbPrize[i][2]
	end
	return nRandomSeed
end
--attention:all the pet-award-api are here
--add pet grow award:the param is the number of award
function gf_VnGiveActivityPetGrowAward(nPetGrowAward)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nPetGrowAward * 100)) --�i�m n�ng c�p
		WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, nPetGrowAward.." �i�m n�ng c�p")
		Msg2Player("B�n nh�n ���c "..nPetGrowAward.." �i�m N�ng C�p B�n ��ng H�nh")
end
--add pet mp award api: the param is the number of award
function gf_VnGiveActivityPetMpAward(nPetMpAward)
	Pet_AddGP(nPetMpAward)
	WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, nPetMpAward.." �i�m linh l�c")
	Msg2Player("B�n nh�n ���c "..nPetMpAward.." �i�m Linh L�c B�n ��ng H�nh")
end

function Vet_Create_Activity_By_Id(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].nActivityID = nActivityID
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityName = g_objVNAcitivityInfo:GetString(tostring(nActivityID),"sActivityName")
	TB_VN_ACTIVITY_MAIN[nActivityID].sActivityChgKey = tostring(nActivityID)
	TB_VN_ACTIVITY_MAIN[nActivityID].tbTaskGroup = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tTaskGroup")
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemChgNum = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemChgNum")
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeItemCount") or 1
	TB_VN_ACTIVITY_MAIN[nActivityID].nFlag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFlag") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nGetBothFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nGetBothFinalPrize") or 7;
	TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nFinalPrizeMode = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nFinalPrizeMode") or 0;
	TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemExcgPrizeCount") or 0;
	--���߶һ�����
	TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize = {}
	for nIep = 1, TB_VN_ACTIVITY_MAIN[nActivityID].nItemExcgPrizeCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbItemExchangePrize[nIep] = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbItemExchangePrize"..nIep)
	end
	--������Ʒ���
	for nItemPrizeNum = 1,TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount do
		TB_VN_ACTIVITY_MAIN[nActivityID].tbPrizeItemInfo[nItemPrizeNum] = {
			tbItemInfo = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeItemInfo"..nItemPrizeNum),
			nTaskIdPrizeType = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdPrizeType"..nItemPrizeNum),
			nTaskIdGetFinalPrize = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdGetFinalPrize"..nItemPrizeNum),
			nTaskIdUseItemTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nTaskIdUseItemTimes"..nItemPrizeNum),
			tbExpPrizeNum = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeNum"..nItemPrizeNum),
			tbPrizeCondition = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbPrizeCondition"..nItemPrizeNum),
			tbExpPrizeName = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbExpPrizeName"..nItemPrizeNum),
			tbNormalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbNormalPrizeRoomWeight"..nItemPrizeNum),
			},
			nPrizeAdditionalTimes = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPrizeAdditionalTimes"..nItemPrizeNum),
			tbAdditionalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbAdditionalPrizeRoomWeight"..nItemPrizeNum),
			},
			nItemUseTimesMax = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nItemUseTimesMax"..nItemPrizeNum),
			tbFinalPrize = {
				tbItemRoomWeight = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeRoomWeight"..nItemPrizeNum),
				tbFinalPrizeKind = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"tbFinalPrizeKind"..nItemPrizeNum),
			},
			--�ۼƵ���콱���
			nPmAccPoint = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmAccPoint"..nItemPrizeNum),
			nPmUsePrizeTag = g_objVNAcitivityInfo:GetNum(tostring(nActivityID),"nPmUsePrizeTag"..nItemPrizeNum),
			bHaveThings = g_objVNAcitivityInfo:GetMixTable(tostring(nActivityID),"bHaveThings"..nItemPrizeNum),
		}
	end
	return TB_VN_ACTIVITY_MAIN[nActivityID].nPrizeItemCount;
end


--============================================================================
local ActivityMaxCount = GetEventCount();
for nGlbId = 1, ActivityMaxCount do
	if gf_CheckEventDateEx(nGlbId) == 1 then
		TB_VN_ACTIVITY_MAIN[nGlbId] = gf_Inherit(CLASS_ACTIVITY);
		local nCount = Vet_Create_Activity_By_Id(nGlbId) or 1;
		if VET_ACTIVITY_AWARD_TABLE[nGlbId] ~= nil then
			for j = 1 , nCount do			
				--���ö��⽱����1
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][1]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbAdditionalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][1])
				--���õ����ս�����2,3
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.tbPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][2]
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.nRandomBase = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][2])
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbFinalPrize.sel = VET_ACTIVITY_AWARD_TABLE[nGlbId][3][j];
				if TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition and getn(TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition) == 2 then
					--ģʽ1 4
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo1 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase1 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[1]])
					--ģʽ2 5
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.tbPrizeInfo2 = VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]]
					TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbNormalPrize.nRandomBase2 = gf_VnGetPrizeRandomSeed(VET_ACTIVITY_AWARD_TABLE[nGlbId][TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPrizeCondition[2]])
				end
				--�ۼ���ȡ�Ľ���(6,7������)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmPrizeInfo = VET_ACTIVITY_AWARD_TABLE[nGlbId][5 + j]
				--ʹ�õ��ߵĽ���(8,9������)
				TB_VN_ACTIVITY_MAIN[nGlbId].tbPrizeItemInfo[j].tbPmFuncPrize = VET_ACTIVITY_AWARD_TABLE[nGlbId][7 + j]
			end
			--���߶һ����� 10 - 10+Count
			TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward = {}
			for nIep = 1, TB_VN_ACTIVITY_MAIN[nGlbId].nItemExcgPrizeCount do
				TB_VN_ACTIVITY_MAIN[nGlbId].tbIEPAward[nIep] = VET_ACTIVITY_AWARD_TABLE[nGlbId][9 + nIep]
			end
		end
		TB_VN_ACTIVITY_MAIN[nGlbId].OnGetFinalPrize = function(_,nPrizeDiff,nOrder)
				if nPrizeDiff == 1 then
					ModifyExp(25000000);
				gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i 25000000 kinh nghi�m")
				elseif nPrizeDiff == 2 then
					--TODO:Check match condition to add pet grow prize add here
					gf_VnGiveActivityPetGrowAward(20);
				elseif nPrizeDiff == 3 then
					--TODO:Check match condition to add pet mp prize add here
					gf_VnGiveActivityPetMpAward(1);
				elseif nPrizeDiff == 4 then
					--70���߼��ؼ�	
					--vaf_Give70GaojiMiji();
					local nRoute = GetPlayerRoute()
					gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], tb_golden_faction_tree[nRoute][1], "Event thang 11", "nh�n ph�n th��ng cu�i")
					Msg2Player("B�n nh�n ���c 1 cu�n m�t t�ch cao c�p 70")
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i M�t T�ch")
				elseif nPrizeDiff == 5 then
					ModifyExp(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i "..nOrder.." kinh nghi�m")
				elseif nPrizeDiff == 6 then
					--������ֵ
					gf_EventGiveCustomAward(31,nOrder,"Event thang 12","��i ph�n th��ng cu�i c�ng");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i "..nOrder.." c�ng tr�ng")
				elseif nPrizeDiff == 7 then
					gf_AddItemEx({2,1,9977,1},"Qu�n C�ng Huy Ho�ng",1);
					gf_AddItemEx({2,1,9998,1},"Qu�n C�ng ��i",1);
					gf_AddItemEx({2,1,9999,1},"Qu�n C�ng Ch��ng",1);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i  3 lo�i qu�n c�ng")
				elseif nPrizeDiff == 8 then
					gf_AddItemEx({2,1,1009,nOrder},"Thi�n Th�ch Tinh Th�ch");
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i Thi�n Th�ch")
				elseif nPrizeDiff == 9 then
					--������
					AwardGenuineQi(nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i "..nOrder.." ch�n kh�")
				elseif nPrizeDiff == 10 then
					--��������Ƭ
					AddItem(2,1,30410,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "M�nh Thi�n M�n");
				elseif nPrizeDiff == 11 then
					--�����Ž���
					AddItem(2,1,30370,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Thi�n M�n Kim L�nh");
				elseif nPrizeDiff == 12 then
					--�������Ƭ
					AddItem(2,1,30390,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "M�nh Thi�n Cang");
				elseif nPrizeDiff == 13 then
					--���ر���
					AddItem(2,1,30341,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "T�ng R��ng");
				elseif nPrizeDiff == 14 then
					--������
					Earn(nOrder*10000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "V�ng");
				elseif nPrizeDiff == 15 then
					--��ľ��+XU
					AddItem(2,1,30340,nOrder);
					AddItem(2,1,30230,66);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "M�c R��ng + XU");
				elseif nPrizeDiff == 16 then
					--������
					AddItem(2,1,30344,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Th�n T�i B�o R��ng");
				elseif nPrizeDiff == 17 then
					--������
					AddItem(2,1,30230,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Xu v�t ph�m");
				elseif nPrizeDiff == 18 then
					--��ְҵ���ɸ��߼�70���ؼ�
					ahf_GetGaojiZhenjuan(1, nOrder, 1)
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "M�t Tich 70 Cao C�p");
				elseif nPrizeDiff == 19 then
					--ȫ����
					gf_ModifyExp(2000000000);
					gf_EventGiveCustomAward(31,690000,EVENT_LOG_TITLE,"��i ph�n th��ng cu�i c�ng");
					AwardGenuineQi(690000);
					--��һֻ����
					local nRet, nIndex = AddItem(0,105,30038,1,4,-1,-1,-1,-1,-1,-1);
					if 1 == nRet then
						SetItemExpireTime(nIndex, 3600*24 * 60);
						gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", 1, "Th� Ng�c");
					end
				elseif nPrizeDiff == 20 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Di�u D��ng Y");
				elseif nPrizeDiff == 21 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Di�u D��ng M�o");
				elseif nPrizeDiff == 22 then
					ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Di�u D��ng Kh�");
				elseif nPrizeDiff == 23 then
					local nRet, nIndex = AddItem(2,1,1068,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Thi�n Th�ch linh th�ch");
				elseif nPrizeDiff == 24 then
					local nRet, nIndex = AddItem(2,1,1067,nOrder);
					SetItemExpireTime(nIndex, 15 * 24 * 3600);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "��nh H�n Thi�n Th�ch Th�n Th�ch");
				elseif nPrizeDiff == 25 then
					AddItem(2,0,1082,nOrder);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "Th�i D�ch H�n Nguy�n");
				elseif nPrizeDiff == 26 then
					VetInterface_FinishReborn1();
				elseif nPrizeDiff == 27 then
					VetInterface_FinishReborn1_6();
				elseif nPrizeDiff == 28 then
					gf_ModifyExp(2000000000);
					ModifyReputation(4700,0);
					SetTask(336, GetTask(336) + 4700);
       			 		Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 4700));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "2000000000 Kinh Nghi�m + 4700 Danh V�ng + 4700 S� M�n");
				elseif nPrizeDiff == 29 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 74000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 74000);
	    	  			end
	    	  			Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 74000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "74000 Qu�n C�ng + 1000000000 Kinh Nghi�m");
				elseif nPrizeDiff == 30 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(74000);
       	 			gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "74000 Ch�n Kh� + 1000000000 Kinh Nghi�m");
				elseif nPrizeDiff == 31 then
					gf_ModifyExp(2000000000);
					ModifyReputation(3900,0);
					SetTask(336, GetTask(336) + 3900);
       	 				Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 3900));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "2000000000 �i�m kinh nghi�m + 3900 �i�m danh v�ng + 3900 �i�m s� m�n");
				elseif nPrizeDiff == 32 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
	    	  				SetTask(701, GetTask(701) + 79000);
	    	  			else
	    	  				SetTask(701, GetTask(701) - 79000);
	    				end
	    	 			 Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 79000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "79000 �i�m qu�n c�ng + 1000000000 �i�m kinh nghi�m");
				elseif nPrizeDiff == 33 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(79000);
       	 				gf_WriteLogEx("Ho�t ��ng Vi�t Nam", "��i ph�n th��ng cu�i c�ng", nOrder, "79000 �i�m ch�n kh� + 1000000000 �i�m kinh nghi�m");
			       	elseif nPrizeDiff == 34 then
			       		gf_ModifyExp(2000000000);
					ModifyReputation(4444,0);
					SetTask(336, GetTask(336) + 4444);
			       	 	Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 4444));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "2000000000 �i�m kinh nghi�m+4444 �i�m danh v�ng +4444 �i�m s� m�n ");
			       	elseif nPrizeDiff == 35 then
			       		gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
				    		SetTask(701, GetTask(701) + 77777);
				    	  else
				    	  	SetTask(701, GetTask(701) - 77777);
				    	  end
				    	  Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 77777));
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "77777 �i�m c�ng tr�ng +1500000000 �i�m kinh nghi�m");
			       	elseif nPrizeDiff == 36 then
			       		AwardGenuineQi(77777);
			       		gf_ModifyExp(1500000000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "77777 �i�m c�ng tr�ng +1500000000 �i�m kinh nghi�m");
				elseif nPrizeDiff == 37 then
					VetInterface_Reborn()
				elseif nPrizeDiff == 38 then
					gf_ModifyExp(1500000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
       	 				Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 5000));
       	 				gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "1500000000 �i�m kinh nghi�m +5000 �i�m danh v�ng +5000 �i�m s� m�n ");								
				elseif nPrizeDiff == 39 then
					gf_ModifyExp(1500000000);
					if GetTask(701) >= 0 then
			    	  		SetTask(701, GetTask(701) + 39000);
			    		else
			    	  		SetTask(701, GetTask(701) - 39000);
			    		end
			    	 	Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 39000));
		       	 	  	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "1500000000 �i�m kinh nghi�m +39000 �i�m qu�n c�ng ");
				elseif nPrizeDiff == 40 then
					gf_ModifyExp(1500000000);
					AwardGenuineQi(39000);
			       	 	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "1500000000 �i�m kinh nghi�m +39000 �i�m ch�n kh� ");		
				elseif nPrizeDiff == 41 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi�n Th�ch linh th�ch", "Ho�t ��ng Vi�t Nam", "1000000000EXP+01 Thi�n th�ch linh th�ch (30 ng�y)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 42 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "��nh H�n Thi�n Th�ch Th�n Th�ch", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 ��nh H�n Thi�n Th�ch Th�n Th�ch (30 ng�y)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 43 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "Chuy�n Sinh ��n ", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 Chuy�n Sinh ��n", 0, 1);
				elseif nPrizeDiff == 44 then
					gf_ModifyExp(1000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 39000);
					else
						SetTask(701, GetTask(701) - 39000);
					end
					Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 39000));
					gf_WriteLogEx("Ho�t ��ng Vi�t Nam", "��i ph�n th��ng cu�i c�ng", nOrder, "1000000000 EXP + 39000 �i�m qu�n c�ng");
				elseif nPrizeDiff == 45 then
					gf_ModifyExp(1500000000);
					gf_AddItemEx2({2, 1, 1113, 1}, "��i ��nh H�n ", "Ho�t ��ng Vi�t Nam", "1500000000 EXP + 01 ��i ��nh H�n Thi�n Th�ch Th�n Th�ch (30 ng�y)", 30 * 24 * 3600, 1);
				elseif nPrizeDiff == 46 then
					gf_ModifyExp(2000000000);
				elseif nPrizeDiff == 47 then
					gf_ModifyExp(1000000000);
					ModifyReputation(5000,0);
					SetTask(336, GetTask(336) + 5000);
					Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 5000));
					gf_WriteLogEx("Ho�t ��ng Vi�t Nam", "��i ph�n th��ng cu�i c�ng", nOrder, "1000000000 EXP + 5000 �i�m danh v�ng + 5000 �i�m s� m�n");
				elseif nPrizeDiff == 48 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 30345, 1}, "Chuy�n Sinh ��n ", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 Chuy�n Sinh ��n (60 ng�y, c� th� giao d�ch)", 60 * 24 * 3600, 1);
				elseif nPrizeDiff == 49 then
					Event_PhucSinhPET()
				elseif nPrizeDiff == 50 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi�n Th�ch linh th�ch", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 Thi�n Th�ch Linh Th�ch (15 ng�y)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 51 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "��nh H�n Thi�n Th�ch Th�n Th�ch", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 ��nh H�n Thi�n Th�ch Th�n Th�ch (15 ng�y)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 52 then
					gf_ModifyExp(2000000000);
					if GetTask(701) >= 0 then
						SetTask(701, GetTask(701) + 9999);
					else
						SetTask(701, GetTask(701) - 9999);
					end
					Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 9999));
					gf_AddItemEx2({2, 1, 30344, 2}, "Th�n T�i B�o R��ng", "Ho�t ��ng Vi�t Nam", "2000000000 EXP + 9999 �i�m c�ng tr�ng + 02 Th�n T�i B�o R��ng + 01 ��i ��nh H�n Thi�n Th�ch Th�n Th�ch (15 ng�y)", 0, 1);
					gf_AddItemEx2({2, 1, 1113, 1}, "��i ��nh H�n ", EVENT_LOG_TITLE, "2000000000 EXP + 9999 �i�m c�ng tr�ng + 02 Th�n T�i B�o R��ng + 01 ��i ��nh H�n Thi�n Th�ch Th�n Th�ch (15 ng�y)", 15 * 24 * 3600, 1);
				elseif nPrizeDiff == 53 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1068, 1}, "Thi�n Th�ch linh th�ch", EVENT_LOG_TITLE, "1000000000 EXP + 01 Thi�n Th�ch Linh Th�ch (07 ng�y)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 54 then
					gf_ModifyExp(1000000000);
					gf_AddItemEx2({2, 1, 1067, 1}, "��nh H�n Thi�n Th�ch Th�n Th�ch", "Ho�t ��ng Vi�t Nam", "1000000000 EXP + 01 ��nh H�n Thi�n Th�ch Th�n Th�ch (07 ng�y)", 7 * 24 * 3600, 1);
				elseif nPrizeDiff == 55 then
					gf_VnGiveActivityPetGrowAward(300);
					gf_VnGiveActivityPetMpAward(200);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "300 �i�m n�ng c�p + 200 �i�m linh l�c");		
				elseif nPrizeDiff == 56 then
					gf_ModifyExp(1000000000);
					AwardGenuineQi(39000);
					gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", nOrder, "1000000000 EXP + 39000 �i�m ch�n kh�");		
				elseif nPrizeDiff == 57 then
					Event_PhucSinhPET()	--Vet_Complete_Revive_OnePartner_FirstStage();
				elseif nPrizeDiff == 58 then
					Vet_Complete_Revive_OnePartner_SecondStage();
				end
			end
	end
end

--============================================================================

function Vet_Activity_GetLastPrizeBoth(nTaskGrouId,nTaskIDSeq)
	local tbActivity = gf_VnGetActivityByGroupId(nTaskGrouId,nTaskIDSeq)
	if not(tbActivity) then return end
	if Vet_Activity_GetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize) == 1 then
		Talk(1,"",tbActivity.tbHintString[7]);
		return
	end
	for i = 1, tbActivity.nPrizeItemCount do
		if Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbActivity.tbPrizeItemInfo[i].nTaskIdUseItemTimes) < tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax then
			Talk(1,"",format(tbActivity.tbHintString[6],tbActivity.tbPrizeItemInfo[i].tbItemInfo[4],tbActivity.tbPrizeItemInfo[i].nItemUseTimesMax));
			return
		end
	end
	if tbActivity.nFlag == 1 then
		--70Ϊ9�»
		if tbActivity.nActivityID == 70 then
			Say("Ti�u hao <color=red>500<color> Xu v�t ph�m nh�n ���c m�t th� c��i m�i \n <color=green> Th� Ng�c  \n T�c �� di chuy�n 120%\n �� b�n 888/888\n h�n s� d�ng 60 ng�y c� th� giao d�ch b�ng C�n Kh�n Ph� <color>\n",2,"��ng �/#Vet_Activity_GetAdditionPrize("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")","T�i h� ch� xem qua th�i/nothing");
			return
		end
		--76Ϊʥ���
		if tbActivity.nActivityID == 76 then
			Say(format("Ti�u hao <color=red>%dXU<color> nh�n ���c 1 <color=green>Xe Tu�n L�c<color> (h�n s� d�ng 45 ng�y) v� <color=green>B� ngo�i trang Noel<color> (c� th� giao d�ch)", 888), 2, "��ng �/#Vet_Activity_GetAdditionPrize_76("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing");
			return
		end
		--103,11�»
		if tbActivity.nActivityID == 103 then
			Say("Nh�n t�t c� ph�n th��ng 2.000.000.000 kinh nghi�m v� 2 Tr�ng Sinh ��n ( 30 ng�y)", 2, "��ng �/#Vet_Activity_GetAdditionPrize_103("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
			return
		end
		--107,1�»
		if tbActivity.nActivityID == 107 then
			Say("Ph�n th��ng s� d�ng B�nh Ch�ng v� B�nh T�t ��t ��n gi�i h�n", 2, "��ng �/#Vet_Activity_GetAdditionPrize_107("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
			return
		end
		--112,2�»
		if tbActivity.nActivityID == 112 then
			Say("Ph�n th��ng s� d�ng Chocolare Chips Muffin v�  Dark Chocolate t�i �a ", 2, "��ng �/#Vet_Activity_GetAdditionPrize_112("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
			return
		end
		--123,5�»
		if tbActivity.nActivityID == 123 then
			Say("2000000000 �i�m kinh nghi�m +01 chuy�n sinh ��n (30 ng�y )+200�i�m linh l�c pet ", 2, "��ng �/#Vet_Activity_GetAdditionPrize_123("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
			return
		end
		--135,10�»
		if tbActivity.nActivityID == 135 then
			Say("Ch�n ph�n th��ng s� d�ng t�i �a c� 2 lo�i", 3, "Ho�n th�nh giai �o�n 2 nhi�m v� Ph�c sinh B�n ��ng H�nh (ti�u hao 2500 ti�u dao ng�c)/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "Ch�n ph�n th��ng 2 t� �i�m kinh nghi�m/#Vet_Activity_GetAdditionPrize_135a("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
--			Say("Ho�n th�nh giai �o�n 2 c�a ph�c sinh ��ng h�nh (Ti�u hao 2500 Ti�u Dao Ng�c) (Nh�n v�t c�n ho�n th�nh giai �o�n 1 c�a ph�c sinh ��ng h�nh m�i c� th� nh�n th��ng)", 2, "��ng �/#Vet_Activity_GetAdditionPrize_135("..tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")", "T�i h� ch� xem qua th�i/nothing")
			return
		end
	end
end

function Vet_Activity_GetAdditionPrize(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"",format("Xu v�t ph�m kh�ng �� <color=red>%d<color> c�i",500));
		return
	end
	if gf_Judge_Room_Weight(1,0," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,500) == 1 then
		--��������ȡ���
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		local nRet,nItemIndex = AddItem(0,105,30038,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 60 * 24 * 60 * 60);
	end
end

-- Mo rong doi event
function VNG_DoiEvent_Form1()
	AskClientForNumber("VNG_DoiEvent_Kieu1", 1, 999, "S� l��ng (1-999)")
end

function VNG_DoiEvent_Kieu1(nCount)
	local tbCheckCase = {
		[1] = {6500},
		[2] = {3500},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30741) < (6 * nCount ) or GetItemCount(2,1,30742) < (6 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0,}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30741 , 6 * nCount) == 1 and DelItem(2,1,30742 , 6 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2,1,30743, tbAwardRate[1]}, "Tranh Th� Ph�p", EVENT_LOG_TITLE , "nh�n")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2,1,30744, tbAwardRate[2]}, "Tranh Th� Ph�p ��c Bi�t", EVENT_LOG_TITLE , "nh�n")
		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30709, tbAwardRate[3]}, "Ch� H�t Sen", EVENT_LOG_TITLE , "nh�n")
--		end		
	end
end
function VNG_DoiEvent_Form2()
	AskClientForNumber("VNG_DoiEvent_Kieu2", 1, 999, "S� l��ng (1-999)")
end

function VNG_DoiEvent_Kieu2(nCount)
	local tbCheckCase = {
		[1] = {10000},
		[2] = {0},
		[3] = {0},
	}
	if gf_Judge_Room_Weight(3, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30632 ) < (5 * nCount ) or GetItemCount(2,1,30633 ) < (5 * nCount ) or GetItemCount(2,1,30230 ) < (2 * nCount ) then	--GetCash() < (100000 * nCount) 
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	local nTem = 0
	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0}
	for i=1,nCount do
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
--		local nIndex = mod(random(1,1000),2) + 1	
		tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
	end
	
	if DelItem(2,1,30632, 5 * nCount) == 1 and DelItem(2,1,30633, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then	--Pay(100000*nCount)
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 30635, tbAwardRate[1]}, "Hoa 8/3", EVENT_LOG_TITLE , "nh�n")
		end
--		if tbAwardRate[2] > 0 then
--			gf_AddItemEx2({2, 1, 30607, tbAwardRate[2]}, "Hoa �i�m 10", EVENT_LOG_TITLE , "nh�n")
--		end
--		if tbAwardRate[3] > 0 then
--			gf_AddItemEx2({2, 1, 30608, tbAwardRate[3]}, "B�ng Khen", EVENT_LOG_TITLE , "nh�n")
--		end		
	end
end

function VNG_DoiEvent_Form3()
	AskClientForNumber("VNG_DoiEvent_Kieu3", 1, 999, "S� l��ng (1-999)")
end

function VNG_DoiEvent_Kieu3(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30603) < (2 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30603, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "M�m C�y", EVENT_LOG_TITLE , "nh�n")
	end
end

function VNG_DoiEvent_Form4()
	AskClientForNumber("VNG_DoiEvent_Kieu4", 1, 999, "S� l��ng (1-999)")
end

function VNG_DoiEvent_Kieu4(nCount)
	if gf_Judge_Room_Weight(4, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30512) < (5 * nCount ) or GetItemCount(2,1,30513) < (1 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end

	if DelItem(2,1,30512, 5 * nCount) == 1 and DelItem(2,1,30513, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30514, nCount}, "M�m C�y", EVENT_LOG_TITLE , "nh�n")
	end
end

function Vet_Activity_GetAdditionPrize_76(nActivityID,nTaskGrouId,nTaskIDSeq)
	tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	local nCount = 888;
	if GetItemCount(2,1,30230) < nCount then
		Talk(1,"",format("Xu v�t ph�m kh�ng �� <color=red>%d<color> c�i",nCount));
		return
	end
	if gf_Judge_Room_Weight(4,100," ") ~= 1 then
	 return
	end
	if DelItem(2,1,30230,nCount) == 1 then
		--��������ȡ���
		Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
		--��ѱ¹��
		local nRet,nItemIndex = AddItem(0,105,30041,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(nItemIndex, 45 * 24 * 3600);
		--��ʥ����װ
		local tChrismas = {
			{{"N�n gi�ng sinh chu�n", {0,108,109,1}}, {"N�n gi�ng sinh kh�i ng�", {0,108,110,1}}, {"N�n gi�ng sinh g�i c�m", {0,108,112,1}}, {"N�n gi�ng sinh nh�", {0,108,111,1}}},
			{{"Th��ng y gi�ng sinh chu�n", {0,109,109,1}}, {"Gi�ng sinh kh�i ng�", {0,109,110,1}}, {"Th��ng y gi�ng sinh g�i c�m", {0,109,112,1}}, {"Th��ng y gi�ng sinh Ki�u n�", {0,109,111,1}}},
			{{"H� y Gi�ng sinh chu�n", {0,110,73,1}}, {"Trang ph�c gi�ng sinh kh�i ng�", {0,110,74,1}}, {"H� y gi�ng sinh n� g�i c�m", {0,110,76,1}}, {"Gi�ng sinh Ki�u n�", {0,110,75,1}}},
		};
		local nBody = GetBody();
		local nSize = getn(tChrismas);
		for i = 1, nSize do
			gf_AddItemEx2(tChrismas[i][nBody][2], tChrismas[i][nBody][1], "Ho�t ��ng Gi�ng sinh", "Ph�n th��ng cu�i", 45 * 24 * 3600, 1)
		end
	end
end

function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function Vet_Update_Pet(nPoint)
	if not nPoint or nPoint <= 0 then
		return 0;
	end
	--Interface, complete by vet!
	--do something
	if nPoint == 50 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (50 * 100)) --�i�m n�ng c�p
		WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, "50 �i�m n�ng c�p")
		Msg2Player("B�n nh�n ���c 50 �i�m N�ng C�p B�n ��ng H�nh")
	end
	if nPoint == 10 then
		Pet_AddGP(10)
		WriteLogEx(EVENT_LOG_TITLE, "nh�n th��ng s� d�ng v�t ph�m event ", 1, "10 �i�m linh l�c")
		Msg2Player("B�n nh�n ���c 10 �i�m Linh L�c B�n ��ng H�nh")
	end
end

function Vet_Activity_GetAdditionPrize_103(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
		return
	end
	--��������ȡ���
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2,1,30345,2}, "Chuy�n Sinh ��n ", EVENT_LOG_TITLE, "��i ph�n ph�n th��ng cu�i", 30*24*3600, 1);
end

--need to complete by VET-----------------------------------
function VetInterface_ConditionCheck1()
	if GetTask(TSK_CS6_TULINH) > 1 then
		Talk(1, "", "��i hi�p �� ho�n th�nh nhi�m v� giai �o�n n�y r�i, n�n kh�ng c�n l�o phu gi�p �� n�a.")
		return 0
	end
	if GetTask(TSK_CS6_TULINH) ~= 1 or GetItemCount(2,1,30490) <2 then
		Talk(1, "", "��i hi�p ch�a  nh�n nhi�m v� chuy�n sinh 6 ho�c kh�ng c� �� 2 Ho�ng Kim ��i Ng�n Phi�u")
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			Talk(1, "", "Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
			TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_ConditionCheck1_6()
	if GetTask(TSK_CS6_TULINH) ~= 1 then
		return 0
	else
		return 1
	end
end

function VetInterface_FinishReborn1_6()
	if GetTask(TSK_CS6_TULINH) == 1 then
		if DelItem(2,1,30490,2) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
			return 1
		else
			return 0
		end
	else
		return 0
	end
end

function VetInterface_Reborn_ConditionCheck()
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"",format("s� ng�c ti�u dao trong t�i kh�ng �� %d c�i ", 999))
		return 0
	end
	if DelItem(2,1,30603,999) == 1 then
		return 1
	end
	return 0
end

function VetInterface_Reborn()
	--finish Reborn 7
	--do something
--	if VetInterface_Reborn_ConditionCheck() ~= 1 then
--		return 0
--	end

	if GetTask(TSK_CS6_TULINH) == 1 then
--		if DelItem(2,1,30603,999) == 1 then
			SetTask(TSK_CS6_TULINH,2)
			TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
			return 1
--		else
--			return 0
--		end
	else
		Talk(1,"", "Ta kh�ng th� truy�n th� b� k�p n�y cho ��i hi�p !!!!")
		return 0
	end
end

function Vet_Complete_Revive_OnePartner_FirstStage_check()
	return 1;
end

function Vet_Complete_Revive_OnePartner_FirstStage()
	--complete by veit
	--finish first stage
	--
end

function Vet_Complete_Revive_OnePartner_SecondStage_check()
	--complete by veit
	--
	
	return 0;
end

function Vet_Complete_Revive_OnePartner_SecondStage()	--(nActivityID,nTaskGrouId,nTaskIDSeq)
--	local nCheck = GetTask(2788)
--	if nCheck >= 1 then
--		Talk("B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m r�i.")
--		return 0
--	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B�n ��ng h�nh �� ph�c sinh r�i n�n kh�ng th� nh�n ph�n th��ng n�y.")
		return 0
	end
--	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
--	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nCurGodPoint < 999 then
		Talk(1,"","B�n ��ng h�nh ch�a �� 999 �i�m linh l�c")
		return
	end
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Ti�u Dao Ng�c trong t�i kh�ng �� 999 c�i")
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B�n ch�a ho�n th�nh giai �o�n 1 nhi�m v� ph�c sinh b�n ��ng h�nh n�n kh�ng th� nh�n ph�n th��ng !!!!")
		return 0
	end	

--	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", 2500, "Ti�u hao Ti�u Dao Ng�c ho�n th�nh giai �o�n 2 c�a ph�c sinh ��ng h�nh");		
	--��������ȡ���
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S� ki�n Event th�ng 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." ��i hi�p h�y ch�n h��ng Ph�c Sinh cho B�n ��ng H�nh c�a m�nh."
	tinsert(tSay, format("H� tr� h� N�i C�ng/#add_buffEvent2(1)"))		
	tinsert(tSay, format("H� tr� h� Ngo�i C�ng/#add_buffEvent2(2)"))		
	--tinsert(tSay, "H� tr� h� Ngo�i C�ng/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta ch� gh� qua th�i/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

------------------------------------------------------------


function Vet_Activity_GetAdditionPrize_107(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	--��������ȡ���
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
	else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 20000));
	AwardGenuineQi(20000);
 	gf_WriteLogEx("Ho�t ��ng Vi�t Nam", "Ph�n th��ng s� d�ng B�nh Ch�ng v� B�nh T�t ��t ��n gi�i h�n", "2000000000 �i�m kinh nghi�m + 20000 �i�m ch�n kh� + 20000 �i�m qu�n c�ng");
end

function Vet_Activity_GetAdditionPrize_112(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	--��������ȡ���
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	if GetTask(701) >= 0 then
		SetTask(701, GetTask(701) + 20000);
    else
		SetTask(701, GetTask(701) - 20000);
	end
	Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 20000));
	AwardGenuineQi(20000);
	AddItem(2,1,30497,200,4);
 	gf_WriteLogEx("Ho�t ��ng Vi�t Nam", "Ph�n th��ng s� d�ng Chocolare Chips Muffin v�  Dark Chocolate t�i �a ", "2000000000 �i�m kinh nghi�m + 20000 �i�m ch�n kh� +20000 �i�m c�ng tr�ng +200 Ma Tinh");
end

function Vet_Activity_GetAdditionPrize_123(nActivityID,nTaskGrouId,nTaskIDSeq)
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nLevel = mod(TASK_VNG_PET,100)
	if nLevel < 2 then
			Msg2Player("B�n ch�a c� PET c�p 1 n�n kh�ng th� nh�n ph�n th��ng n�y")
			return
	end
	--��������ȡ���
	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({2, 1, 30345, 1}, "Chuy�n Sinh ��n ", "Ho�t ��ng Vi�t Nam", "S� d�ng  sero d�u t��i v� sero b�c h�  ��t ���c ph�n th��ng cao nh�t", 30 * 24 * 3600, 1)
	Pet_AddGP(200)
	Msg2Player("B�n nh�n ���c 200 �i�m Linh L�c B�n ��ng H�nh")
	gf_WriteLogEx(EVENT_LOG_TITLE, "Ph�n th��ng s� d�ng t�i �a", "Ph�n th��ng s� d�ng t�i �a 2 lo�i");
	--complete by vet
	--pet value
	--do something
end

function Vet_201403_UseItemAward()
	--������
	gf_Modify("Exp",600000)
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
	Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 1));
	local tItem = {
		{1, 95},
		{2, 4},
		{3, 1},
	}
	local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
	gf_AddItemEx2({2,1,30636, tItem[nIndex][1]}, "8/3 t�n v�t", "2XU", "S� d�ng item nh�n th��ng ", 0, 1)
end

function Vet_201404_UseItemAward()
	--������
	local tExp = {
		[0] = 500000,
		[1] = 650000,
		[2] = 650000,
		[3] = 650000,
		[4] = 650000,
		[5] = 650000,
		[6] = 1500000,
		[7] = 2000000,
	}
	local nReb = gf_GetPlayerRebornCount()
	if tExp[nReb] then
		gf_Modify("Exp",tExp[nReb])
	end
	gf_Modify("Rep",1);
	SetTask(336, GetTask(336) + 1);
  Msg2Player(format("Thu ���c %d �i�m c�ng hi�n s� m�n", 1));
  local tItem = {
  	{1, 85},
  	{2, 8},
  	{3, 4},
  	{4, 2},
  	{5, 1},
  }
  local nIndex = gf_GetRandItemByTable(tItem, gf_SumRandBase(tItem), 1)
  gf_AddItemEx2({2,1,30641, tItem[nIndex][1]}, "t� s�c b�o th�ch ", "2XU", "S� d�ng item nh�n th��ng ", 0, 1)
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	tRequireElement =
	{
				[1] = {0},
				[2] = {200},
				[3] = {600},
				[4] = {30000},
	}
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][1] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][1]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B�n ��ng H�nh �� ��t ���c �i�m Linh L�c t�i �a c�a c�p, kh�ng th� t�ng th�m.")
	end
end
function Event_PhucSinhPET()
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_A,160160,10,5)
	VNG_SetTaskPos(TSK_PET_PS_GIAIDOAN_B,3303030,10,3)
	Msg2Player("B�n �� ho�n th�nh giai �o�n 1 nhi�m v� ph�c sinh b�n ��ng h�nh")
end

function Vet_Activity_GetAdditionPrize_135(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m r�i.")
		return 0
	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B�n ��ng h�nh �� ph�c sinh r�i n�n kh�ng th� nh�n ph�n th��ng n�y.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	if GetItemCount(2,1,30603) < 999 then
		Say(format("Ti�u Dao Ng�c trong t�i kh�ng �� %d", 999), 0);
		return
	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
	if checka < 160160 or checkb < 3303030 then
		Talk(1, "", "B�n ch�a ho�n th�nh giai �o�n 1 nhi�m v� ph�c sinh b�n ��ng h�nh n�n kh�ng th� nh�n ph�n th��ng !!!!")
		return 0
	end	
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end

--	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", 2500, "Ti�u hao Ti�u Dao Ng�c ho�n th�nh giai �o�n 2 c�a ph�c sinh ��ng h�nh");		
	--��������ȡ���
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S� ki�n Event th�ng 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." ��i hi�p h�y ch�n h��ng Ph�c Sinh cho B�n ��ng H�nh c�a m�nh."
	tinsert(tSay, format("H� tr� h� N�i C�ng/#add_buffEvent(1,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	tinsert(tSay, format("H� tr� h� Ngo�i C�ng/#add_buffEvent(2,%s%s%s)",tbActivity.nActivityID,nTaskGrouId,nTaskIDSeq))		
	--tinsert(tSay, "H� tr� h� Ngo�i C�ng/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	tinsert(tSay, "Ta ch� gh� qua th�i/nothing")
	Say(tHeader, getn(tSay), tSay)	
end

function add_buffEvent(nWay,nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m r�i.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N�i C�ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh L�c +6000", "state_life_max_point_add", 8000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"Kh�ng t�t c� +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo�i C�ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh L�c +6000", "state_life_max_point_add", 10000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"N�i ph�ng/Ngo�i ph�ng +60", "state_i_defence_point_add", 60},
						{"Ngo�i ph�ng +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th� tr�ng",3333,24},
									[2] = {"Th� x�m",3333,25},
									[3] = {"Th� �en",3334,26},		
								}	
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2788,1)	--nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t�ng b��c nhi�m v� l�n gi� tr� 3 l� ho�n th�nh xong giai �o�n 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l� gi� tr� x�c ��nh c� Ph�c Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi� tr� x�c ��nh c� Ph�c Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi� tr� x�c ��nh s� l�n Ph�c Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h��ng Ph�c Sinh c�a PET
		-------------Set c�c ch� s� buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m�i
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch�c m�ng ��i hi�p �� chi�u m� PET th�nh c�ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th�t b�i", 1, "Add pet th�t b�i")			
		end
		-------------
		Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh cho B�n ��ng H�nh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n buff")			
	
end

function add_buffEvent2(nWay)
	local nCheck = GetTask(2812)
	if nCheck >= 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m r�i.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N�i C�ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh L�c +6000", "state_life_max_point_add", 8000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"Kh�ng t�t c� +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo�i C�ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh L�c +6000", "state_life_max_point_add", 10000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"N�i ph�ng/Ngo�i ph�ng +60", "state_i_defence_point_add", 60},
						{"Ngo�i ph�ng +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th� tr�ng",3333,24},
									[2] = {"Th� x�m",3333,25},
									[3] = {"Th� �en",3334,26},		
								}	
	if GetItemCount(2,1,30603) < 999 then
		Talk(1,"","Ti�u Dao Ng�c trong t�i kh�ng �� 999 c�i")
		return
	end								
	if DelItem(2,1,30603,999) ~= 1 then
		return 0;
	end								
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2812,1)	--nh�n ph�n th��ng cu�i 
--	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
--	self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
	---------------
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t�ng b��c nhi�m v� l�n gi� tr� 3 l� ho�n th�nh xong giai �o�n 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l� gi� tr� x�c ��nh c� Ph�c Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi� tr� x�c ��nh c� Ph�c Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi� tr� x�c ��nh s� l�n Ph�c Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h��ng Ph�c Sinh c�a PET
		-------------Set c�c ch� s� buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m�i
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch�c m�ng ��i hi�p �� chi�u m� PET th�nh c�ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th�t b�i", 1, "Add pet th�t b�i")			
		end
		-------------
		Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh cho B�n ��ng H�nh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n buff")			
	
end

function Vet_Activity_GetAdditionPrize_135a(nActivityID,nTaskGrouId,nTaskIDSeq)
	local nCheck = GetTask(2788)
	if nCheck >= 1 then
		Talk("B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m r�i.")
		return 0
	end
	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	ModifyExp(2000000000)
	SetTask(2788,1)	--nh�n ph�n th��ng cu�i khi s� d�ng t�i �a 2 v�t ph�m
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);			--task nh�n th��ng khi s� d�ng max c� 2
	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", 0, "2 t� kinh nghi�m");		

end