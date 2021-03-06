-- 声望类物品的称号脚本

tTab =
{
--物品大类，副类，详细类别，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)
	{2,1,1037,	1000 ,	"Giang h? thi誹 hi謕",	22,	7 ,	3600 * 24 * 30},
	{2,1,1038,	2000 ,	"Giang h? h秓 h竛",	22,	8 ,	3600 * 24 * 30},
	{2,1,1039,	3000 ,	"V? l﹎ h祇 ki謙",	22,	9 ,	3600 * 24 * 30},
	{2,1,1040,	5000 ,	"V? l﹎ cao th?",	22,	10,	3600 * 24 * 30},
	{2,1,1041,	7000 ,	"M閠 th阨 i hi謕",	22,	11,	3600 * 24 * 30},
	{2,1,1042,	10000,	"C竔 th? anh h祇",	22,	12,	3600 * 24 * 30},	
	{2,1,1043,	15000,	"Nh蕋 i t玭 s?",	22,	13,	3600 * 24 * 30},	
	{2,1,1044,	24000,	"V? l﹎  nh蕋",	22,	14,	3600 * 24 * 30},	
	{2,1,1045,	35000,	"Tuy謙 th? cao nh﹏",	22,	15,	3600 * 24 * 30},	
	{2,1,1046,	50000,	"V? l﹎ th莕 tho筰",	22,	16,	3600 * 24 * 30},	
}               
                
function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi誹 hi謕"
	else
		return "N? hi謕 "
	end
end

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("N誹 danh v鋘g c馻 b筺 t n <color=yellow>"..tTab[nTabIndex][5].."<color> s? c? th玭g b竜 r閚g r穒 trong giang h?, mu鑞 s? d鬾g?", 2, "ng/#yes_say("..nTabIndex..")", "Sai/no_say")
end

function yes_say(nTabIndex)
	local nRet = GetReputation()
	local nExist = 0
	for index, value in tTab do
		if IsTitleExist(tTab[index][6], tTab[index][7]) > 0 then
			nExist = index
			break
		end
	end
	
	if nRet < tTab[nTabIndex][4] then
		Say("V? "..GetPlayerSex()..", danh v鋘g c馻 b筺 ch璦 t c蕄  n祔!", 0)
	elseif nTabIndex <= nExist then
		Say("Danh ti課g c馻 b筺  lan truy襫 kh緋 giang h?", 0)
	elseif DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- 删掉低等级的声望称号
		for index, value in tTab do
			RemoveTitle(value[6], value[7])
		end
		local nGenre = tTab[nTabIndex][6]
		local nDetail = tTab[nTabIndex][7]
		local nTime = tTab[nTabIndex][8]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("Danh ti課g c馻 b筺  lan truy襫 kh緋 giang h?")
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end