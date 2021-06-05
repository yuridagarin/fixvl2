-----------------------------------------------------------------------
-- ����Ʒģ��3
-- by windle
-- 2009-8-7 10:11
-- ˵��:
--	Clause = { subclauses }
--	subclauses = [Clause, Award]*
--	Award = [Item, {Item, nRate}]		; nRate = ����
--	Item = {name,{g,d,p,n...}, szNotice, {nExpireTime}}
--		  | { nil }
--		  | { {["Exp","Rep","SchoolRep", "Money"], nMin, nMax}, nil, szNotice, {nExpireTime}}
--
--		szNotice	��������, ��"��ϲ $n ����<xx�����>��� $i", $n�Զ��滻���������, $i�滻��"��Ʒ����x����"
--		nExpireTime	��Ʒ��������, ���ݼ�gf_SetItemExpireTime�Ĳ���, ��2����ʽ, 1��ֵ��6��ֵ
--	��ͼ:
--		Clause3 ����
--			ClauseAll		ȫ��
--			ClauseRandom	���ϸ���
--			ClauseRandomAll	��������
--	Clause3������� : Clause3:preprocess()
--	Clause3����Ʒ���� Clause3:giveClause()	������������
-----------------------------------------------------------------------
Include("\\script\\class\\mem.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\hash_callback.lua");
Include("\\script\\class\\clause2.lua");
-----------------------------------------------------------------------

Clause3 = Clause2

function Clause3:giveItem(Item)
	-- item�ṹ
	--{ name, {g,d,p,n,...}, p3, p4 }
	-- ˵��:
	--		һ�����	{��Ʒ��, {g,d,p,n,....}}
	--		����Ʒ		{ nil }
	--		����,������	{{type, nMin, nMax}}		type = 'Exp', 'Rep', 'Money'
	local nRet, nItemIdx = nil;
	local szNotice = Item[3] or "";
	local nItemIdx = nil;
	local nNum = 0;
	if Item[1] == nil then
		return
	end
	if type(Item[1]) == "table" then
		szType = Item[1][1];
		nNum = Item[1][2];
		if Item[1][3] then
			nNum = random(nNum, Item[1][3]);
		end
		gf_Modify(szType, nNum);
		if szNotice then
			local t = {Exp="Kinh nghi�m",SchoolRep="Danh v�ng s� m�n",Money="V�ng v� l�m"};
			local szItemName = t[szType];
			szNotice = gsub(szNotice,"%$i",format("[%s] x%d", szItemName,nNum));
		end
		return 0;
	elseif type(Item[2]) == "table" then
		local tExpireTime = Item[4];
		if type(tExpireTime) == "table" then
			for i = 1, Item[2][4] do
				nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1], 1);
				gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
			end
		else
			nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1]);
		end
		szNotice = gsub(szNotice,"%$i",format("[%s] x%d", Item[1], Item[2][4]));
		szNotice = gsub(szNotice,"%$n",GetName());
		if szNotice ~= "" then
			Msg2Global(szNotice);
		end
		return nItemIdx;
	elseif type(Item[2]) == "string" then
		SendScript2VM(Item[3],Item[2]);
		return 0;
	end
end
