Include("\\script\\lib\\globalfunctions.lua")

--旧宠物升级到新宠物
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
	local szTitle = "G莕 y l穙 phu  tinh th玭g trong l躰h v鵦 nu玦 th?, b﹜ gi? c? th? nu玦 頲 kh玭g 輙 th? cao c蕄. N誹 i hi謕  c? b筺 ng h祅h c?, c? th? n t譵 l穙 phu  i b筺 ng h祅h  m韎, b筺 ng h祅h m韎 s? t鑤 h琻, m筺h h琻, tuy謙 v阨 h琻."
	local tbSay = {}
	tinsert(tbSay, "Ta mu鑞 n﹏g c蕄/OnUpdatePet")
	tinsert(tbSay, "Th玦, ta kh玭g n﹏g c蕄 n鱝/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnUpdatePet()
	local nPetCount,tbPetList = GetPetList()
	if nPetCount >= MAX_PET_COUNT then
		Talk(1,"","S? b筺 ng h祅h c馻 ngi  vt qu? gi韎 h筺, kh玭g th? n﹏g c蕄!")
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
			Msg2Player("H? th鑞g b筺 ng h祅h n﹏g c蕄 th祅h c玭g")
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 0)
			WriteLog(format("[Account:%s Role:%s] Update pet system success (Level=%d,OldType=%d NewType=%d)"
			, GetAccount(), GetName(), nCurLevel, nOldType, nNewType
			))
		else
			Msg2Player("H? th鑞g b筺 ng h祅h n﹏g c蕄 th蕋 b筰")
		end
	else
		Talk(1,"","Ngi kh玭g c? b筺 ng h祅h n祇 c莕 th╪g c蕄!")
	end
end

function no()
end