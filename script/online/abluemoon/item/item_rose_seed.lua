Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
g_tbItem = 
{
	[1] = {2,0,1166,"��õ�廨"},
	[2] = {2,0,1165,"��õ�廨"},
}

g_tbSentece = 
{
	[1] = {
			[1] = "�����������һ��������Ը�����������������Ĵ�����Ը��һ��",
			[2] = "�Ҹ����㣺��һ���Ұ��㣬�ڶ������Ұ��㣬���������Ұ��㡭���Ұ��㡭��",
			[3] = "�����Կݣ�ʯ�����ã��Ҷ���İ����������",
		  },
	[2] = {
			[1] = "�������и�С�������벻��֪�����÷����ĸ����㣬��ϲ���㣬��ĺ�ϲ������",
			[2] = "�������֣��Ҹ���ף����������į���Ҹ����Ҹ�",
			[3] = "���������Ұ��㣬�������󰮴��ף��������ϵķ�˷�ѽ�ɣ����ǵ��ϵ�����׷ѽ׷",
		  },
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));

	if GetLevel() < 50 then
		Talk(1,"","������˼���ȼ�С��<color=yellow>50<color>���Ĳ�����õ�廨��");
		return 0;
	end;
	if GetSex() ~= 1 then
		Talk(1,"","������˼��õ�廨����ֻ����<color=yellow>�з�<color>���¡�");
		return 0;
	end;
	local nType = get_seed_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","���������Ӳ�����õ�廨�����ӡ�");
		return 0;
	end;
	local selTab = {};
	tinsert(selTab,"�ǵ�/#select_sentece("..nItemIdx..","..nType..")");
	tinsert(selTab,"���ҿ���һ��/nothing");
	Say("����ɫõ�壬�㽫����Ϊ<color=yellow>��ʿ<color>������ɫõ�壬�㽫����Ϊ<color=yellow>ѧʿ<color>����ȷ��Ϊ����İ����˵�Ը�������Լ�����ǰ��δ�еĿ�����",getn(selTab),selTab);
end;

function select_sentece(nItemIdx,nType)
	local selTab = {};
	for i=1,getn(g_tbSentece[nType]) do
		tinsert(selTab,g_tbSentece[nType][i].."/#plant("..nItemIdx..","..nType..","..i..")");
	end;
	tinsert(selTab,"���ҿ���һ��/nothing");
	Say("��ѡ���㰮�ĸ�ף�",getn(selTab),selTab);
end;

function plant(nItemIdx,nType,nIdx)
	local flag,nTime = GetAntiEnthrallmentInfo()
	if nTime >= 10800 and flag ==1 then
		Talk(1,"","���ڽ�����Ϸʱ��������õ��ɣ�")
		return 0;
	end
	if check_team() == 0 then
		return 0;
	end;
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"","�����ϲ�û����¶ˮ����¶ˮ��<color=yellow>ҩ��<color>�е�����");
		return 0
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPoint = GetTask(ABLUEMOON_JIFEN);
		DelItem(2,0,351,1);
		local szFemaleName = get_partner_name();
		local szMaleName = GetName();
		local nNpcIdx = CreateNpc("õ�廨С��","Ϊ"..szFemaleName.."�ֵ�õ�廨��",GetWorldPos())
		SetNpcScript(nNpcIdx,"\\script\\online\\abluemoon\\rose_npc.lua");
		Msg2Global(szMaleName.."Ϊ�İ���"..szFemaleName.."���������亱����"..g_tbItem[nType][4].."������"..szFemaleName.."˵��"..g_tbSentece[nType][nIdx]);
		AddGlobalCountNews("<color=red>"..szMaleName.."<color>Ϊ�İ���<color=red>"..szFemaleName.."<color>���������亱����"..g_tbItem[nType][4].."������<color=red>"..szFemaleName.."<color>˵��"..g_tbSentece[nType][nIdx],2);
		local nOldPoint = GetTask(ABLUEMOON_JIFEN);
		if nType == 1 then
			jifen_reduce(nOldPoint - 1000)
			--SetTask(ABLUEMOON_JIFEN,1000);
			Msg2Player("Ŀǰ��Ŀƿ�������1000��");
		elseif nType == 2 and nPoint > 1500 then
			jifen_reduce(nOldPoint - 1500)
			--SetTask(ABLUEMOON_JIFEN,1500);
			Msg2Player("Ŀǰ��Ŀƿ�������1500��");
		end;
		local nOldIdx = PlayerIndex;
		local nRand = random(1,10000);
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			SetTask(ABLUEMOON_ROSE_ID,UnsignedHash(szMaleName..szMaleName)..nRand);	--��Ů�����ټ�һ���������ΪID
			SetTask(ABLUEMOON_GROW_TYPE,10+nType);
			SetTask(ABLUEMOON_ROSE_INDEX,nNpcIdx);
			SetTask(ABLUEMOON_PLANT_TIME,GetTime());
			Say("��ע�⣺���Ů���ڻ�ûժȡ���õ�廨ǰ�ͱ�����������һ��õ�壬��ôŮ��������ժȡ���õ�壬ͬ���أ�����з���;�ͱ�����������һ��õ�壬��ô���õ��Ҳ������ժȡ��",0);
		end;
		PlayerIndex = nOldIdx;
		WriteLog("[��СѾõ��]:"..GetName().."Ϊ"..szFemaleName.."������õ�壬nType:"..nType.."��old point:"..nOldPoint);
	end;
end;

function get_seed_type(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;	
	end;
	return 0;
end;

function check_team()
	if check_partner_sex() == 0 then
		Talk(1,"","����<color=yellow>��Ů�������<color>�ſ�����õ�廨��");
		return 0;
	end;
	if check_partner_level() == 0 then
		Talk(1,"","��Ů˫���ȼ�����<color=yellow>���ڻ����50��<color>�ſ�����õ�廨��");
		return 0;
	end;
	return 1;
end;

function get_partner_name()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 2 then
			local szName = GetName();
			PlayerIndex = nOldIdx;
			return szName;
		end;
	end;
	return 0;
end;

function check_partner_sex()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nSex1,nSex2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nSex1 = GetSex();
	PlayerIndex = GetTeamMember(2);
	nSex2 = GetSex();
	PlayerIndex = nOldIdx;
	if nSex1 ~= nSex2 then
		return 1;
	else
		return 0;
	end;
end;

function check_partner_level()
	local nLevel1,nLevel2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nLevel1 = GetLevel();
	PlayerIndex = GetTeamMember(2);
	nLevel2 = GetLevel();
	PlayerIndex = nOldIdx;
	if nLevel1 < 50 or nLevel2 < 50 then
		return 0;
	else
		return 1;
	end;
end;

function nothing()

end;