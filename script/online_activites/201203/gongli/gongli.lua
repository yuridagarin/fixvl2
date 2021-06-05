--2012��4�¹����
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201203_KuiZheng_tbMain = "T�i h� mu�n k�ch ho�t ��ng Chung S�c/func_main"

VET_201203_KuiZheng_tbSay = {
	"��ng ��o mu�n k�ch ho�t lo�i n�o?<color=green>t� ��i t�i thi�u c� 2 th�nh vi�n v� nhi�u nh�t l� c� 5 th�nh vi�n; s� l��ng h� ph�i c�ng nhi�u gi�i th��ng c�ng t�t<color>",
	"T�i h� mu�n k�ch ho�t ho�t ��ng Chung S�c (mi�n ph�)/activate_gongli",
	"T�i h� mu�n k�ch ho�t ho�t ��ng Chung S�c (ti�u hao 50 xu/ng��i)/activate_gongli_ib",
	"T�i h� mu�n k�ch ho�t nh�n th��ng t�i �a ho�t ��ng Chung S�c ng�y h�m nay/activate_daily_final",
	"Kh�ng c�n ��u/do_nothing",
}

VET_201203_GongLi_TaskGroup = TaskManager:Create(5,2)
VET_201203_GongLi_TaskGroup.DaySeq = 1
VET_201203_GongLi_TaskGroup.Times1 = 2
VET_201203_GongLi_TaskGroup.Times2 = 3
VET_201203_GongLi_TaskGroup.Tag = 4

VET_201203_EXP_Award_Free = {
	[2] = "1000000",
	[3] = "1050000",
	[4] = "1100000",
	[5] = "1250000",
};
VET_201203_EXP_Award_IB = {
	[2] = "6250000",
	[3] = "6500000",
	[4] = "6750000",
	[5] = "7000000",
};
VET_201203_COIN_FINAL_AWARD  = {
    {3, 3434, 304000, 1},
    {3, 1400, 308000, 1},
    {3, 1200, 354000, 1},
    {3, 1200, 358000, 1},
    {3, 1000, 404000, 1},
    {3, 1000, 408000, 1},
    {3, 616, 464600, 1},
    {3, 150, 1000500, 1},
};


function func_main()
	gf_Say(VET_201203_KuiZheng_tbSay)
end

function activate_gongli()
	--�ӳ�
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t ho�t ��ng");
		return 0;
	end
	--��Ա��������
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(2,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia","Th�nh vi�n<color=green>"..sName.."<color>kh�ng �� �i�u ki�n");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--��������
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T� ��i t�i thi�u <color=green>2<color> ng��i, nhi�u nh�t <color=green>5<color> ng��i m�i ���c k�ch ho�t ho�t ��ng Chung S�c")
		return 0;
	end
	--���
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--�Ƿ�������
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) >= 1 then
			Talk(1,"","M�i ng�y nh�n ph�n th��ng ho�t ��ng Chung S�c mi�n ph� t�i �a 1 l�n");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th�nh vi�n<color=green>"..sName.."<color>s� l�n nh�n th��ng ho�t ��ng Chung S�c mi�n ph� qu� 1 l�n");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--������������
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ��i t�i thi�u ph�i c� 2 h� ph�i kh�c nhau m�i c� th� nh�n th��ng");
		return 0;
	end
	local nExp = tonumber(VET_201203_EXP_Award_Free[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_gongli_ib()
	--�ӳ�
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t ho�t ��ng");
		return 0;
	end
	--��Ա��������
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		local sName = GetName();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia","Th�nh vi�n<color=green>"..sName.."<color>kh�ng �� �i�u ki�n");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--��������
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T� ��i t�i thi�u <color=green>2<color> ng��i, nhi�u nh�t <color=green>5<color> ng��i m�i ���c k�ch ho�t ho�t ��ng Chung S�c")
		return 0;
	end
	--���
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--�Ƿ����4����
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) >= 4 then
			Talk(1,"","M�i ng�y nh�n ph�n th��ng ho�t ��ng Chung S�c thu ph� t�i �a l� 4 l�n");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th�nh vi�n<color=green>"..sName.."<color> s� l�n nh�n th��ng ho�t ��ng Chung S�c  qu� 4 l�n");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--����2������
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ��i t�i thi�u ph�i c� 2 h� ph�i kh�c nhau m�i c� th� nh�n th��ng");
		return 0;
	end	
	--xu�����ж�
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30230) < 50 then
			Talk(1,"","Trong h�nh trang kh�ng �� Xu v�t ph�m<color=green>50<color>c�i");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th�nh vi�n<color=green>"..sName.."<color>Trong h�nh trang kh�ng �� Xu v�t ph�m<color=green>50<color>c�i")
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	local nExp = tonumber(VET_201203_EXP_Award_IB[nRouteCount]);
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30230,50) ~= 1 then print("line 198 : gongli.lua error") end
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2)+1);
		gf_Modify("Exp",nExp);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function activate_daily_final()
	--�ӳ�
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t ho�t ��ng");
		return 0;
	end
	--��Ա��������
	local nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
			PlayerIndex = nOldPlayerIndex
			Talk(2,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia","Th�nh vi�n<color=green>"..sName.."<color>kh�ng �� �i�u ki�n");
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--��������
	local nTeamCount = GetTeamSize();
	if nTeamCount < 2 or nTeamCount > 5 then
		Talk(1,"","T�i ��i t�i thi�u <color=green>2<color> ng��i, nhi�u nh�t <color=green>5<color> ng��i m�i ���c k�ch ho�t ho�t ��ng Chung S�c")
		return 0;
	end
	--���
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.DaySeq,zgc_pub_day_turn());
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times1,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Times2,0);
			VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,0);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--�Ƿ����5����
	nOldPlayerIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times1) + VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Times2) ~= 5 then
			Talk(1,"","M�i ng�y nh�n th��ng ho�t ��ng Chung S�c 5 l�n m�i �� �i�u ki�n k�ch ho�t ph�n th��ng t�i �a");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th�nh vi�n<color=green>"..sName.."<color>S� l�n nh�n th��ng ho�t ��ng Chung S�c kh�ng �� 5 l�n");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	--����2������
	local nRouteCount = gf_GetRouteCount();
	if nRouteCount < 2 then 
		Talk(1,"","Trong ��i t�i thi�u ph�i c� 2 h� ph�i kh�c nhau m�i c� th� nh�n th��ng");
		return 0;
	end	
	--�Ƿ���ȡ��
	nOldPlayerIndex =PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201203_GongLi_TaskGroup:GetTask(VET_201203_GongLi_TaskGroup.Tag) ~= 0 then
			Talk(1,"","��ng ��o �� nh�n th��ng t�i �a r�i");
			local sName = GetName();
			if PlayerIndex ~= nOldPlayerIndex then
				PlayerIndex = nOldPlayerIndex
				Talk(1,"","Th�nh vi�n<color=green>"..sName.."<color>�� nh�n th��ng t�i �a r�i");
			end
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex
	nOldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201203_GongLi_TaskGroup:SetTask(VET_201203_GongLi_TaskGroup.Tag,1);
		gf_EventGiveRandAward(VET_201203_COIN_FINAL_AWARD,10000,1,"Ho�t ��ng Chung S�c","Ph�n th��ng t�i �a m�i ng�y")
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function do_nothing()
end