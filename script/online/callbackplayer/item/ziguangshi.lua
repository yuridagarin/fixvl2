--�Ϲ�װ��ǿ��ʯ
--by vivi
--2008/07/10

tZiguangDiji = {
	{0,103,2351},
	{0,100,2351},
	{0,101,2351}
};

tZiguangGaoji = {
	{{0,103,2355},{0,103,2359},{0,103,2363},{0,103,2367},{0,103,2371}},
	{{0,100,2355},{0,100,2363},{0,100,2371},{0,100,2379},{0,100,2387},{0,100,2359},{0,100,2367},{0,100,2375},{0,100,2383},{0,100,2391}},
	{{0,101,2355},{0,101,2359},{0,101,2363},{0,101,2367},{0,101,2371}}
};

tZiguangWp = {{0,3,2351},{0,5,2352},{0,8,2353},{0,0,2354},{0,1,2355},{0,2,2356},{0,10,2357},{0,0,2358},{0,5,2359},{0,2,2360},{0,9,2361},{0,6,2362},{0,4,2363},{0,7,2364},{0,11,2365}};

tZiguangshi = {{2,0,1065,"T� Quang Thi�n Th�ch","�� c��ng h�a trang b� T� Quang th�p h�n 4, th� ph�i n�ng c�p th�nh 4",4},{2,0,1066,"T� Quang ��a Th�ch","�� c��ng h�a trang b� T� Quang l� 4, th� ph�i n�ng c�p th�nh 5",5},{2,0,1067,"T� Quang Huy�n Th�ch","�� c��ng h�a trang b� T� Quang l� 5, th� ph�i n�ng c�p th�nh 6",6},{2,0,1068,"T� Quang Ho�ng Th�ch","�� c��ng h�a trang b� T� Quang l� 6, th� ph�i n�ng c�p th�nh 7",7}};

function OnUse(nIndex)
	local nId1,nId2,nId3 = GetItemInfoByIndex(nIndex);
	local nIdx = 0;
	for i=1,getn(tZiguangshi) do
		if nId3 == tZiguangshi[i][3] then
			nIdx = i;
			break
		end
	end
	Say(tZiguangshi[nIdx][4].." c� th� gi�p b�n �em  "..tZiguangshi[nIdx][5]..", b�n x�c nh�n mu�n s� d�ng ch�?",
		2,
		"���c/#choose_weizhi("..nIdx..")",
		"S� d�ng sau/nothing")
end

function nothing()

end

function choose_weizhi(nIdx)
	Say("B�n  mu�n c��ng h�a trang b� n�o?",
		5,
		"��u/#confirm_qianghua_ziguang(1,"..nIdx..")",
		"Ngo�i trang/#confirm_qianghua_ziguang(2,"..nIdx..")",
		"H� y/#confirm_qianghua_ziguang(3,"..nIdx..")",
		"V� kh�/#confirm_qianghua_ziguang(4,"..nIdx..")",
		"��i ta m�c trang b� l�n ��./nothing")	
end

function confirm_qianghua_ziguang(nWz,nIdx)
	local tWz = {0,1,3,2};
	local nIndex = GetPlayerEquipIndex(tWz[nWz]); --��ȡװ������
	local nId1,nId2,nId3 = GetPlayerEquipInfo(tWz[nWz]); --��ȡװ��id
	local nQianghua = GetEquipAttr(nIndex,2);--��ȡ��Ʒǿ���ȼ�
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --��ȡװ���Ƿ񶨻�
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --��ȡ�Ƿ�����
	local nRandSeed = GetItemRandSeed(nIndex);--�������	
	local nBody = GetBody()-1;
	
	if nIndex == 0 then
		Talk(1,"","Tr�n ng��i b�n hi�n kh�ng c� trang b�.");
		return
	end
	
	if nLock == 1 then
		Talk(1,"","Trang b�  n�y �� kh�a, kh�ng th� c��ng h�a.");
		return
	end
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then
		return
	end
	local nFlag = 0; 
	if nWz ~= 4 then
		if nId3 == (tZiguangDiji[nWz][3]+nBody) then
			nFlag = 1;
		else
			for i=1,getn(tZiguangGaoji[nWz]) do 
				if nId3 == (tZiguangGaoji[nWz][i][3]+nBody) then
					nFlag = i;
					break;
				end
			end
		end
	else
		for i=1,getn(tZiguangWp) do
			if nId1 == tZiguangWp[i][1] and nId2 == tZiguangWp[i][2] and nId3 == tZiguangWp[i][3] then
				nFlag = i;
				break
			end
		end
	end		
	if nFlag == 0 then
		Talk(1,"","Tr�n ng��i b�n hi�n gi� kh�ng ph�i l� trang b� T� Quang.");
		return
	else
		if (nIdx == 1 and nQianghua >= tZiguangshi[nIdx][6]) or (nIdx == 2 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) or (nIdx == 3 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) or (nIdx == 4 and nQianghua ~= (tZiguangshi[nIdx][6]-1)) then
			Talk(1,"","B� trang b� tr�n ng��i b�n kh�ng �� �i�u ki�n, �i�u ki�n "..tZiguangshi[nIdx][4].." s� d�ng l� <color=yellow>"..tZiguangshi[nIdx][5].."<color>");
		else
			if DelItemByIndex(nIndex,-1) == 1 and DelItem(tZiguangshi[nIdx][1],tZiguangshi[nIdx][2],tZiguangshi[nIdx][3],1) == 1 then
				AddItem(nId1,nId2,nId3,1,1,-1,-1,-1,-1,-1,-1,0,tZiguangshi[nIdx][6],0,nRandSeed);
			end
		end
	end
end

--�Ե�ǰ��ҿɷ����������Ʒ���м�� 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	else 
		return 1
	end
end