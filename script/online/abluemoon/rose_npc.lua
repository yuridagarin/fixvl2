Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
g_nWaterInterval = 10*60;	--��ˮ���

g_tbSentence = 
{
	[1] = "M�i khi ta nh� ��n ng��i, thi�n h� r�i 1 h�t c�t; m�i khi ta nh� ��n ng��i trong v��n r�ng 1 c�nh hoa, b�y gi� ng�y ng�y ta ��u d�o b��c trong bi�n hoa. ",
	[2] = "Ta cho ng��i bi�t, tr�n th� gian n�y c� 1 ng��i lu�n ��i ng��i, b�t lu�n l� ng��i �ang � ��u, trong th�i gian n�o, ng��i c� bi�t r�ng lu�n c� m�t ng��i nh� v�y.",
}

function main()
	local nPlantTime = GetTask(ABLUEMOON_PLANT_TIME);
	local nElapseTime = GetTime() - nPlantTime;
	local nNpcIdx = GetTargetNpc();
	local nMyRoseIdx = GetTask(ABLUEMOON_ROSE_INDEX);
	if nMyRoseIdx == 0 or nMyRoseIdx ~= nNpcIdx then	--���������һ��
		return 0;
	end;
	local szNpcName = GetNpcName(nNpcIdx);
	if check_team() == 0 then
		return 0;
	end;
	if get_female_name() ~= get_rose_owner_name(szNpcName) then	--���Ů�����ֺͻ������˵����ֲ�һ��
		return 0;
	end;
	local nGrow = floor(GetTask(ABLUEMOON_GROW_TYPE)/10);
	if strsub(szNpcName,strlen(szNpcName)-5,strlen(szNpcName)) == "Hoa h�ng" then	--������
		if GetSex() == 1 then
			Talk(1,"","Hoa h�ng c�a ng��i �� l�n, mau g�i ng��i y�u ��n h�i �i.");
		else
			if GetName() ~= get_rose_owner_name(szNpcName) then
				return 0;
			end;
			local selTab = {
						"���c th�i! (h�i hoa h�ng)/#get_rose("..nNpcIdx..")",
						"�� ta suy ngh� l�i/nothing",
						}
			Say("Tr�ng lo�i hoa h�ng n�y r�t kh�, �� minh ch�ng cho t�nh y�u c�a hai ng��i, ng��i c� ��ng � v� h�n m� ti�p nh�n 1 l�n th� th�ch kh�ng?",getn(selTab),selTab);
		end;
		return 0;
	end;
	if GetSex() == 2 then
		Talk(1,"","Hoa �i, h�y mau n�!");
		return 0;
	end;
	if nElapseTime <= g_nWaterInterval then
		Talk(1,"","Th�i gian t��i c�ch l�n sau c�n <color=yellow>"..tf_GetTimeString(g_nWaterInterval-nElapseTime).."<color>.");
		return 0;
	end;
	local selTab = {
			"���c, ta mu�n t��i/#water_rose("..nNpcIdx..")",
			"��i m�t l�t r�i t��i/nothing",
			}
	Say("B�y gi� ng��i mu�n t��i sao?",getn(selTab),selTab);
end;

function get_rose_owner_name(szRoseName)
	return strsub(szRoseName,3,strlen(szRoseName)-12);
end;

function get_rose(nNpcIdx)
	if check_team() == 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0;
	end;
	local nType = mod(GetTask(ABLUEMOON_GROW_TYPE),10);
	local nExpAward80,nExpAward50 = 0,0;
	if nType == 1 then
		nExpAward80 = 19999999;
		nExpAward50 = 9999999;
	else
		nExpAward80 = 9999999;
		nExpAward50 = 6999999;	
	end;
	SetNpcLifeTime(nNpcIdx,0);
	local nRetcode,nItemIdx = AddItem(2,0,1161,1);
	SetItemParam(nItemIdx,0,nType);
	Msg2Player("B�n nh�n ���c 1 r��ng hoa h�ng");
	local nOldIdx = PlayerIndex;
	local szFemaleName = GetName();
	local szMaleName = "";
	local nRandSentence = random(1,getn(g_tbSentence));
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 1 then
			Say("<color=red>"..szFemaleName.."<color> n�i v�i b�n:"..g_tbSentence[nRandSentence],0);
			if GetLevel() >= 80 then
				ModifyExp(nExpAward80);
				Msg2Player("B�n nh�n ���c "..nExpAward80.." �i�m kinh nghi�m");
			elseif GetLevel() >= 50 then
				ModifyExp(nExpAward50);
				Msg2Player("B�n nh�n ���c "..nExpAward50.." �i�m kinh nghi�m");
			end;
			szMaleName = GetName();
		end;
		SetTask(ABLUEMOON_PLANT_TIME,0);
		SetTask(ABLUEMOON_GROW_TYPE,0);
		SetTask(ABLUEMOON_ROSE_INDEX,0);
		SetTask(ABLUEMOON_ROSE_ID,0);
	end;
	PlayerIndex = nOldIdx;
	local szColor = "";
	if nType == 1 then
		szColor = "T�";
	else
		szColor = " lam";
	end;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if nType == 1 then
		nNpcIdx = CreateNpc("Mai Qu� Hoa T�",szFemaleName.." hoa h�ng t�m",nMapID,nMapX,nMapY)
	else
		nNpcIdx = CreateNpc("Mai Qu� Hoa Lam",szFemaleName.." hoa h�ng lam",nMapID,nMapX,nMapY)
	end;
	Msg2Global(szFemaleName.." h�i "..szMaleName.." tr�ng "..szColor.." hoa h�ng, v� n�i: "..g_tbSentence[nRandSentence]);
	AddGlobalCountNews("<color=red>"..szFemaleName.."<color> �� h�i <color=red>"..szMaleName.."<color> tr�ng"..szColor.." hoa h�ng, v� n�i: "..g_tbSentence[nRandSentence]);
	WriteLog("[Hoa h�ng Th� Ti�u Nha]:"..szFemaleName.." h�i "..szMaleName.." - Hoa h�ng. nType:"..nType.."��Level:"..GetLevel());
end;
function water_rose(nNpcIdx)
	if check_team() == 0 then
		return 0;
	end;
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"","Ng��i kh�ng mang theo l� th�y �, l� th�y trong <color=yellow>D��c �i�m<color> c� b�n ��y.");
		return 0
	end;
	DelItem(2,0,351,1);
	local nGrow = floor(GetTask(ABLUEMOON_GROW_TYPE)/10);
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	SetNpcLifeTime(nNpcIdx,0);
	local szFemaleName = get_female_name();
	if nGrow == 1 then
		nNpcIdx = CreateNpc("M�m Hoa h�ng","��"..szFemaleName.." tr�ng hoa h�ng",nMapID,nMapX,nMapY)
	elseif nGrow == 2 then
		nNpcIdx = CreateNpc(" nh�nh hoa h�ng","��"..szFemaleName.." n� hoa",nMapID,nMapX,nMapY)
	elseif nGrow == 3 then
		if mod(GetTask(ABLUEMOON_GROW_TYPE),10) == 1 then
			nNpcIdx = CreateNpc("Mai Qu� Hoa T�","��"..szFemaleName.." - Hoa h�ng t�m",nMapID,nMapX,nMapY)
		else
			nNpcIdx = CreateNpc("Mai Qu� Hoa Lam","��"..szFemaleName.." - Hoa h�ng lam",nMapID,nMapX,nMapY)
		end;
	end;
	SetNpcScript(nNpcIdx,"\\script\\online\\abluemoon\\rose_npc.lua");	
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		SetTask(ABLUEMOON_ROSE_INDEX,nNpcIdx);
		SetTask(ABLUEMOON_GROW_TYPE,GetTask(ABLUEMOON_GROW_TYPE)+10);
		SetTask(ABLUEMOON_PLANT_TIME,GetTime());
		Say("Ch� �: N�u b�n n� ch�a h�i hoa h�ng n�y tr��c v� ng��i ch�i kh�c �� tr�ng hoa h�ng kh�c, th� b�n n� s� kh�ng th� h�i ���c hoa h�ng n�y, b�n nam c�ng gi�ng nh� v�y.",0);
	end;
	PlayerIndex = nOldIdx;
end;

function check_team()
	if check_partner_sex() == 0 then
		Talk(1,"","M�t nh�m nam n� m�i c� th� tr�ng hoa h�ng.");
		return 0;
	end;
	if check_rose_id() == 0 then
		Talk(1,"","��y kh�ng ph�i t� ��i ban ��u c�a b�n, hai ng��i ph�i chung th�y m�i tr�ng ���c hoa h�ng.");
		return 0;
	end;
	return 1;
end;

function check_rose_id()
	local nID1,nID2 = 0,0;
	local nOldIdx = PlayerIndex;
	PlayerIndex = GetTeamMember(1);
	nID1 = GetTask(ABLUEMOON_ROSE_ID);
	PlayerIndex = GetTeamMember(2);
	nID2 = GetTask(ABLUEMOON_ROSE_ID);
	PlayerIndex = nOldIdx;
	if nID1 == nID2 then
		return 1;
	else
		return 0;
	end;	
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

function get_female_name()
	if GetTeamSize() ~= 2 then
		return 0;
	end;
	local nOldIdx = PlayerIndex;
	for i=1,2 do
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 2 then
			local szName = GetName();
			PlayerIndex = nOldIdx;
			return szName,PlayerIndex;
		end;
	end;
	PlayerIndex = nOldIdx;
	return 0;
end;

function nothing()

end;