Include("\\script\\lib\\get_managed_viet_string.lua")
-- �����Ƶ�����Ƿ���˵��

t_chat_consume=
{	--[nChannelType] = {item{name,g,d,p,n}, money}
	[2] = {{"Thi�n L� Truy�n �m Ph�", 2,1,3508,5},1000,},	--����
	[8] = {{"Thi�n L� Truy�n �m Ph�", 2,1,3508,1},1000,},	--����
}

function OnCheck(nChannelType)
	if nChannelType == 2 or nChannelType == 8 then	-- ���ĺ�����
		local nMapID = GetWorldPos()
		if nMapID == 701 then
			Msg2Player("Trong ��i lao kh�ng ���c d�ng k�nh chat c�ng c�ng v� k�nh m�n ph�i")
			return 0
		end
	end
	
	local t = t_chat_consume[nChannelType]
	if t then
		local g,d,p,n = t[1][2], t[1][3], t[1][4], t[1][5]
		if DelItem(g,d,p,n) == 1 then
			return 1
		end
		local money = t[2]
		local ok = Pay(money)
		if ok and ok == 1 then
			return 1
		else
			local gold = floor(money / 10000)
			Msg2Player(format(getManagedVietString(VIET_STR_ID_MONEY_NOT_ENOUGH), gold))
			return 0
		end
	end
	return 1
end