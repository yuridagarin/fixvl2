-- ��������Ʒ�ĳƺŽű�

tTab =
{
--��Ʒ���࣬���࣬��ϸ�����Ҫ�������ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬����ʱ��(��ʵʱ��)
	{2,1,1037,	1000 ,	"Giang h� thi�u hi�p",	22,	7 ,	3600 * 24 * 30},
	{2,1,1038,	2000 ,	"Giang h� h�o h�n",	22,	8 ,	3600 * 24 * 30},
	{2,1,1039,	3000 ,	"V� l�m h�o ki�t",	22,	9 ,	3600 * 24 * 30},
	{2,1,1040,	5000 ,	"V� l�m cao th�",	22,	10,	3600 * 24 * 30},
	{2,1,1041,	7000 ,	"M�t th�i ��i hi�p",	22,	11,	3600 * 24 * 30},
	{2,1,1042,	10000,	"C�i th� anh h�o",	22,	12,	3600 * 24 * 30},	
	{2,1,1043,	15000,	"Nh�t ��i t�n s�",	22,	13,	3600 * 24 * 30},	
	{2,1,1044,	24000,	"V� l�m �� nh�t",	22,	14,	3600 * 24 * 30},	
	{2,1,1045,	35000,	"Tuy�t th� cao nh�n",	22,	15,	3600 * 24 * 30},	
	{2,1,1046,	50000,	"V� l�m th�n tho�i",	22,	16,	3600 * 24 * 30},	
}               
                
function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi�u hi�p"
	else
		return "N� hi�p "
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
	
	Say("N�u danh v�ng c�a b�n ��t ��n <color=yellow>"..tTab[nTabIndex][5].."<color> s� c� th�ng b�o r�ng r�i trong giang h�, mu�n s� d�ng?", 2, "��ng/#yes_say("..nTabIndex..")", "Sai/no_say")
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
		Say("V� "..GetPlayerSex()..", danh v�ng c�a b�n ch�a ��t c�p �� n�y!", 0)
	elseif nTabIndex <= nExist then
		Say("Danh ti�ng c�a b�n �� lan truy�n kh�p giang h�", 0)
	elseif DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- ɾ���͵ȼ��������ƺ�
		for index, value in tTab do
			RemoveTitle(value[6], value[7])
		end
		local nGenre = tTab[nTabIndex][6]
		local nDetail = tTab[nTabIndex][7]
		local nTime = tTab[nTabIndex][8]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("Danh ti�ng c�a b�n �� lan truy�n kh�p giang h�")
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end