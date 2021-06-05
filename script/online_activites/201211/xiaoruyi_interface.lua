Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

--this file will used by viet
--step1:Include("\\script\\online_activites\\201211\\xiaoruyi_interface.lua")
--step2:call function vet_add_xiaoruyi_interface(nKind) while item script exec succ
--nKind == 1:seed 2:banruo tree 3:four souls tree 4:lucky star 5:Nuwa box 

VET_XIAORUYI_USE_AWARD = {
	{24, 40, "H�t gi�ng"}, --1:seed
	{16, 20, "C�y b�t nh� nh�"}, --2:banruo tree
	{16, 60, "C�y T� Linh"}, --3:four souls tree
	{16, 140, "Ng�i sao may m�n"},--4:lucky star
	{100, 50, "N� Oa B�o H�p"},--5:Nuwa box
};

function vet_add_xiaoruyi_interface(nKind)
	--��Ƿ���
	if gf_CheckEventDateEx(78) ~= 1 then
		return
	end
	if getn(VET_XIAORUYI_USE_AWARD) > 10 then
		print("UDERROR:\\script\\online_activites\\201211\\xiaoruyi_interface.lua");
		return
	end
	if not nKind or nKind < 1 or nKind > getn(VET_XIAORUYI_USE_AWARD) then
		print("UDERROR:\\script\\online_activites\\201211\\xiaoruyi_interface.lua");
		return
	end
	local tTaskGroup = TaskManager:Create(8,4);
	if not tTaskGroup then return end
	tTaskGroup:SetTask(nKind, tTaskGroup:GetTask(nKind) + 1);
	if tTaskGroup:GetTask(nKind) >= VET_XIAORUYI_USE_AWARD[nKind][1] then
		if GetFreeItemRoom() < 1 then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			return
		end
		tTaskGroup:SetTask(nKind, 0);
		gf_AddItemEx2({2, 1, 30030, VET_XIAORUYI_USE_AWARD[nKind][2]}, "Ti�u Nh� �", "Ho�t ��ng gi�ng sinh", "Ti�u Nh� �", 0, 1);
	else
		Msg2Player(format("D�ng v�t ph�m %s%d/%d, d�ng %d l�n n�a s� nh�n ���c %d Ti�u Nh� �.", VET_XIAORUYI_USE_AWARD[nKind][3], tTaskGroup:GetTask(nKind),	VET_XIAORUYI_USE_AWARD[nKind][1], VET_XIAORUYI_USE_AWARD[nKind][1] - tTaskGroup:GetTask(nKind), VET_XIAORUYI_USE_AWARD[nKind][2]));
	end		
end