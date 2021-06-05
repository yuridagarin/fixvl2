Include("\\script\\lib\\globalfunctions.lua")

--�ɳ����������³���
TASK_VNG_PET_INFO = 1536
TASK_VNG_PET = 2560
BYTE_PET_INFO_TYPE = 3
MAX_PET_COUNT = 5
t_pet_update = 
{
	[1] =
	{
		[1] = 24,
		[2] = 25,
		[3] = 26,
	},
	[2] = {
		[3] = 1,
		[4] = 2,
		[5] = 3,
	},
	[3] =
	{
		[1] = 4,
		[2] = 5,
		[3] = 6,
		[4] = 7,
		[5] = 8,
		[6] = 9,
		[7] = 10,
		[8] = 11,
		[9] = 12,
		[10] = 13,
		[11] = 14,
		[12] = 15,
	},
	[4] =
	{
		[13] = 16,
		[14] = 17,
		[15] = 18,
		[16] = 19,
		[17] = 20,
		[18] = 21,
		[19] = 22,
		[20] = 23,
	},
}

function PetUpdateMain()
	local szTitle = "G�n ��y l�o phu �� tinh th�ng trong l�nh v�c nu�i th�, b�y gi� c� th� nu�i ���c kh�ng �t th� cao c�p. N�u ��i hi�p �� c� b�n ��ng h�nh c�, c� th� ��n t�m l�o phu �� ��i b�n ��ng h�nh  m�i, b�n ��ng h�nh m�i s� t�t h�n, m�nh h�n, tuy�t v�i h�n."
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n n�ng c�p/OnUpdatePet")
	tinsert(tbSay, "Th�i, ta kh�ng n�ng c�p n�a/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnUpdatePet()
	local nPetCount,tbPetList = GetPetList()
	if nPetCount >= MAX_PET_COUNT then
		Talk(1,"","S� b�n ��ng h�nh c�a ng��i �� v��t qu� gi�i h�n, kh�ng th� n�ng c�p!")
		return
	end
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nOldType = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
--	if 1 == nCurLevel then
--		local nFeedExp = floor(GetTask(TASK_VNG_PET) / 100)
--		if nFeedExp >= 1 and nFeedExp <= 100 then
--			nOldType = 1
--		elseif nFeedExp >= 101 and nFeedExp <= 200 then
--			nOldType = 2
--		elseif nFeedExp >= 201 and nFeedExp <= 300 then
--			nOldType = 3
--		else
--			nOldType = 0
--		end
--	end
	local tbLevelTable = t_pet_update[nCurLevel] or {}
	local nNewType = tbLevelTable[nOldType]
	if nNewType then
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("H� th�ng b�n ��ng h�nh n�ng c�p th�nh c�ng")
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 0)
			WriteLog(format("[Account:%s Role:%s] Update pet system success (Level=%d,OldType=%d NewType=%d)"
			, GetAccount(), GetName(), nCurLevel, nOldType, nNewType
			))
		else
			Msg2Player("H� th�ng b�n ��ng h�nh n�ng c�p th�t b�i")
		end
	else
		Talk(1,"","Ng��i kh�ng c� b�n ��ng h�nh n�o c�n th�ng c�p!")
	end
end

function no()
end