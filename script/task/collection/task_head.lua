
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �����ռ�����ͷ�ļ�
-- Edited by peres
-- 2005/08/25 PM 20:00

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

tabNpc    = new(KTabFile, "\\settings\\task\\collection\\npc.txt");
tabGoods  = new(KTabFile, "\\settings\\task\\collection\\goods.txt");

-- ��Ʒ�ռ�ģ�棺{�����ӳ�ֵ���ȼ�1���ȼ�2...}
collMode  = {
	
	{3, 1,1},
	
	{3, 1,1,1},
	
	{3.5, 1,1,2},
	
	{3.5, 1,2,2},

	{2.5, 2,2,2},
	
	{2.5, 1,1,3},

	{3, 1,3,4},

	{2.5, 2,2,3},

	{3, 2,3,4},

	{2, 2,3,5},

	{2, 3,4,5},

}


-- ���⽱��������
speAward  = {

	{"Kim Linh th�ch", 2,13,1},
	{"M�c Linh th�ch", 2,13,2},
	{"Th�y Linh th�ch", 2,13,3},
	{"H�a Linh th�ch", 2,13,4},
	{"Th� Linh th�ch", 2,13,5},

}

-- ȫ�ֱ���ID����

ID_COLLMODE = 99     -- ��Ҫ�ռ���Ʒ��ģ��

ID_COLLNUM = 100;    -- ��Ҫ�ռ���Ʒ���͵����� 

ID_COLL1_IDS = 101;  -- �� 1 ����Ҫ�ռ���Ʒ�� ID
ID_COLL1_NUM = 102;  -- �� 1 ����Ҫ�ռ���Ʒ�� ����

ID_COLL2_IDS = 103;  -- �� 2 ����Ҫ�ռ���Ʒ�� ID
ID_COLL2_NUM = 104;  -- �� 2 ����Ҫ�ռ���Ʒ�� ����

ID_COLL3_IDS = 105;  -- �� 3 ����Ҫ�ռ���Ʒ�� ID
ID_COLL3_NUM = 106;  -- �� 3 ����Ҫ�ռ���Ʒ�� ����

ID_COLL_NPC  = 107;  -- ����ID

ID_COLL_STATE = 108; -- �����ռ������״̬�� 1 Ϊ�Ѿ���ʼ��2 Ϊ�Ѿ��ر�

ID_COLL_TIME  = 109; -- �����ռ�����ʼʱ��ʱ�䣬��ʽΪ ��/��/��/ʱ/��

ID_ABS_TIME   = 110; -- ��¼���ռ�����ʼʱ�� 1970 �� 1 �� 1 �տ�ʼ����������������

-- ��Ҹ��˱�������

PLAYER_COLLTIME = 586;  -- ����ϴ�����ʱ��
PLAYER_DONUM    = 587;  -- ����ۻ��Ѿ���ɵĴ���

-- ��NPC�б���ѡ��һ�� NPC ID
function selectNpc()

local nRow = random(3, tabNpc:getRow());

local nNpcID  = tonumber(tabNpc:getCell(nRow, "NpcID"));

	return nNpcID;

end;


-- ѡ��һ���ռ�ģ�棬�����ռ�ģ�������
function selectCollectModel()

	return random(1, getn(collMode));

end;


-- �����Ѷȵȼ���ѡ��һ����Ҫ�ռ�����Ʒ
-- ����ֵ����Ʒ ID����Ʒ������
function selectCollectItem(nLevel)

local aryLevel = getLevelArray(nLevel);
local nID      = aryLevel[random(1, getn(aryLevel))];
local nRow     = tabGoods:selectRowNum("GoodsID", nID);

local nNum     = random(tonumber(tabGoods:getCell(nRow, "Num_Min")),
						tonumber(tabGoods:getCell(nRow, "Num_Max"))
						);


	return nID, nNum;

end;


-- ���ݴ������Ʒ�ȼ�������һ������
function getLevelArray(nLevel)

local aryLevel = {};
local i=0;

	for i=3, tabGoods:getRow() do
--		print ( tonumber(tabGoods:getCell(i, "Level")) );
		if tonumber(tabGoods:getCell(i, "Level"))==nLevel then
			tinsert(aryLevel, tonumber(tabGoods:getCell(i, "GoodsID")));
		end;
	end;
	
	return aryLevel;

end;


-- ��ʼ����һ���ռ������������
function createCollecEvent()

-- �õ�һ�� NPC ID
local nNpcID     = selectNpc();

-- ȡ��һ����Ʒ�ռ���ģ��
local nModel     = selectCollectModel();

-- ����Ҫ�ռ���ƷID������
local nCollNum   = getn(collMode[nModel])-1;

-- ��Ҫ�ռ���Ʒ�����飬��󲻳��� 3 ��
local aryColl    = {{0,0},{0,0},{0,0}}

local tempID, tempNum = 0,0;

local i,j=0,0;

	for i=2, getn(collMode[nModel]) do
		j = j + 1;
		tempID,tempNum = selectCollectItem(collMode[nModel][i]);
		aryColl[j][1] = tempID;
		aryColl[j][2] = tempNum;
	end;


	collectDataIncept(nNpcID,
					  nModel, 
					  nCollNum,
					  aryColl[1][1], 
					  aryColl[1][2], 
					  aryColl[2][1], 
					  aryColl[2][2],
					  aryColl[3][1],
					  aryColl[3][2]);

end;


function collectDataIncept(nNpcID, nModel, nCollNum, nItem_1, nNum_1, nItem_2, nNum_2, nItem_3, nNum_3)


-- �õ� NPC ������
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- �õ���ͼ�ı��
local nMapID     = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

-- �õ� NPC ��������
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

-- �õ���ͼ��������
local strMapName = tabNpc:getCell(nNpcRow, "NpcMap");

-- �õ���һ����Ʒ������
local nItemRow = tabGoods:selectRowNum("GoodsID", nItem_1);

-- �õ���һ����Ʒ������
local strItemName = tabGoods:getCell(nItemRow, "Text");

--	AddGlobalNews("λ��"..strMapName.."��"..strNpcName.."����������ռ�");

	--print ("λ��"..strMapName.."��"..strNpcName.."����������ռ�"..strItemName.."����Ʒ��");
	
		Msg2SubWorld("Giang h� x�n xao, "..strMapName.."-"..strNpcName.." mong c�c hi�p kh�ch gi�p thu th�p c�c lo�i "..strItemName..", n�u ho�n th�nh trong 30 ph�t s� ���c "..strNpcName.." tr�ng th��ng!");
		
--	AddGlobalNews("����Ϣ������Ϣ��λ��"..strMapName.."��"..strNpcName.."����������ռ�"..strItemName.."����Ʒ��");

	-- ����ȫ�ֱ���
	SetGlbValue(ID_COLL_NPC,   nNpcID);
	
	SetGlbValue(ID_COLLMODE,   nModel);
	
	SetGlbValue(ID_COLLNUM,    nCollNum);
	
	SetGlbValue(ID_COLL1_IDS,  nItem_1);
	SetGlbValue(ID_COLL1_NUM,  nNum_1);
	
	SetGlbValue(ID_COLL2_IDS,  nItem_2);
	SetGlbValue(ID_COLL2_NUM,  nNum_2);
	
	SetGlbValue(ID_COLL3_IDS,  nItem_3);
	SetGlbValue(ID_COLL3_NUM,  nNum_3);
	
	-- ��¼�ռ���Ŀ�ʼʱ�䣺��/��/��/ʱ/��
	SetGlbValue(ID_COLL_TIME,  tonumber(date("%y")..date("%m")..date("%d")..date("%H")..date("%M")) );
	
	-- ��¼���ռ�����ʼʱ�� 1970 �� 1 �� 1 �տ�ʼ����������������
--	SetGlbValue(ID_ABS_TIME, GetAbsTime());	
	
	-- ����ռ������Ѿ���ʼ
	SetGlbValue(ID_COLL_STATE, 1);

end;


-- ��⵱ǰ�������Ƿ�Ϊָ�����ռ�����
-- �ɹ��򷵻� 1��ʧ�ܷ��� 0
function checkCollectNpc(nMapID, strName)

local glb_NpcID = GetGlbValue(ID_COLL_NPC);

	if glb_NpcID==0 then return 0; end; -- ��� NPC ���Ϊ 0 �򷵻�ʧ��

local nNpcRow   = tabNpc:selectRowNum("NpcID", glb_NpcID);

local nNeedMapID = tonumber(tabNpc:getCell(nNpcRow, "MapID"));

local strNeedName = tabNpc:getCell(nNpcRow, "NpcName");

	-- ��ͼ���ϡ�������ϡ��ռ�������������״̬ȫ���ϲŷ��� 1
	if nMapID==nNeedMapID and strName==strNeedName and GetGlbValue(ID_COLL_STATE)==1 then
		return 1;
	else
		return 0;
	end;

end;


-- �����������Ƿ��Ѿ������㹻����Ʒ
-- ������ϴ�����Ӧ��Ʒ��ֱ��ɾ���������� 1�����û������Ҫ���򷵻� 0
function checkCollectItem()

local nCollNum = GetGlbValue(ID_COLLNUM);

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }

local aryColl_Code = {};
					  
local nGenre, nDetail, nParticular, nNum = 0,0,0,0;
local nRow = 0;
local nCheck = 0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		nGenre       = tonumber(tabGoods:getCell(nRow, "Genre"));
		nDetail      = tonumber(tabGoods:getCell(nRow, "Detail"));
		nParticular  = tonumber(tabGoods:getCell(nRow, "Particular"));
		nNum         = aryColl_ID[i][2];
		if GetItemCount(nGenre, nDetail, nParticular)>=nNum then
			tinsert(aryColl_Code, {nGenre, nDetail, nParticular, nNum});
			nCheck = nCheck + 1;
		end;
	end;
	
	-- ���ȫ����Ʒ������ɾ��
	if nCheck==nCollNum then
		for i=1, getn(aryColl_Code) do
			DelItem(aryColl_Code[i][1],
					aryColl_Code[i][2],
					aryColl_Code[i][3],
					aryColl_Code[i][4]);
		end;
		return 1;
	else
		return 0;
	end;

end;


-- ����ҷ��轱��
function payCollectAward()

-- �õ� NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- �õ� NPC ������
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- �õ� NPC ��������
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nModel      = GetGlbValue(ID_COLLMODE);

local nValueBasic = countCollectAward();

-- �����Ѷ�ϵ���������ӳ�
local nPayValue   = floor(nValueBasic * collMode[nModel][1] * 3.5);

local nSpe        = 0;

	Earn(nPayValue);
	
	if GetTask(PLAYER_DONUM) == 1 then
		local nAdd,nIdx = AddItem(2,1,1012,1,4);
		SetItemExpireTime(nIdx,3600*72);
		Say("<color=green>"..strNpcName.."<color>: B�ng h�u r�t gi�i! Trong nh�y m�t �� thu th�p �� th� ta c�n! ��y l� <color=yellow>"..nPayValue.."<color> ��ng! M�i ng�y, l�n ��u ti�n gi�p ta, ta s� t�ng ng��i 1 <color=yellow>B�ng Lai Ti�n Thu� (kh�ng th� giao d�ch, th�i h�n 3 ng�y)<color>. L�n sau nh�t ��nh ta s� ��n gi�p ng��i.", 0);		
	else
		Say("<color=green>"..strNpcName.."<color>: B�ng h�u r�t gi�i! Trong nh�y m�t �� thu th�p �� th� ta c�n! ��y l� <color=yellow>"..nPayValue.."<color> ti�n ��ng ph�n th��ng c�a b�ng h�u! L�n sau ta nh�t ��nh s� t�m b�ng h�u gi�p ��.", 0);
	end	
	-- 15% �ļ��ʵõ����⽱��
--	if random(1,100)<=15 then
--	
--		return
--	
--	else
--		
--		nSpe = random(1, getn(speAward));
--		AddItem(speAward[nSpe][2],
--				speAward[nSpe][3],
--				speAward[nSpe][4],
--				1);
--		
--		Say("<color=green>"..strNpcName.."<color>��̫���ˣ��ұ�Ѱ���ŵĶ������ܸ����ҵ������򵥣����򵥰������Ǵ�л��� <color=yellow>"..nPayValue.."<color> ��ͭǮ�Լ��Ҽ����Ѽ�������һ�� <color=yellow>"..speAward[nSpe][1].."<color>���´���һ�����������æ�ġ�", 0);
--		return
--		
--	end;
	
end;


-- �رյ�ǰ������ռ��
function closeCollectEvent()
	-- ����ռ������Ѿ�����
	SetGlbValue(ID_COLL_STATE, 0);
end;


-- ���㱾���ռ�һ���ɻ�ö��ٻ�������
function countCollectAward()

local nCollNum = GetGlbValue(ID_COLLNUM);

local aryColl_ID = createCollectArray();

local nValue, nTotalValue = 0,0;
local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		-- ������ֵ  = ��Ʒ�ۼ� * ����
		nValue       = tonumber(tabGoods:getCell(nRow, "Value")) * aryColl_ID[i][2];
		nTotalValue = nTotalValue + nValue;
	end;
	
	return nTotalValue;

end;


-- ����ȫ�ֱ�������һ���ռ����������
function createCollectArray()

local nItem_1  = GetGlbValue(ID_COLL1_IDS);
local nNum_1   = GetGlbValue(ID_COLL1_NUM);

local nItem_2  = GetGlbValue(ID_COLL2_IDS);
local nNum_2   = GetGlbValue(ID_COLL2_NUM);

local nItem_3  = GetGlbValue(ID_COLL3_IDS);
local nNum_3   = GetGlbValue(ID_COLL3_NUM);

local aryColl_ID = {{nItem_1, nNum_1},
				    {nItem_2, nNum_2},
				    {nItem_3, nNum_3}
				   }
				   
	return aryColl_ID;

end;


-- ����һ��������˵�ĶԻ�
function createCollectTalk(strName)

	Talk(1, "", "T�i h� kh�ng c�n g� �� cho ��i hi�p n�a r�i !!!!")
	do return end
-------------
local aryColl_ID = createCollectArray();

local nCollNum = GetGlbValue(ID_COLLNUM);

local strItem, strItemSay, strMain = "", "", "";

local i=0;

	for i=1, nCollNum do
		nRow         = tabGoods:selectRowNum("GoodsID", aryColl_ID[i][1]);
		strItem      = tabGoods:getCell(nRow, "Text");
		strItemSay   = strItemSay.."<color=yellow>"..aryColl_ID[i][2].."<color> <color=yellow>"..strItem.."<color><enter>";
	end;
	
	strMain = "<color=green>"..strName.."<color>: Ta r�t th�ch s�u t�m v�t ph�m l�! B�ng h�u c� th� gi�p ta kh�ng? Ch� c�n gi�p ta <color=yellow>3 l�n<color>, s� c� th� lao c�m t�!<enter>"..strItemSay;
	
	Say(strMain,
		2,
		"Ta �� t�m ���c th� ng��i c�n, ng��i ��nh ��n �n ta th� n�o?/_AccCollectCall",
		"�i m�t th� ng�i ngh� nh�ng vi�c �� ��i v�i ta l� kh�ng th�./Main_Exit");

end;



function _AccCollectCall()

-- �õ� NPC ID
local nNpcID      = GetGlbValue(ID_COLL_NPC);

-- �õ� NPC ������
local nNpcRow    = tabNpc:selectRowNum("NpcID", nNpcID);

-- �õ� NPC ��������
local strNpcName = tabNpc:getCell(nNpcRow, "NpcName");

local nGlobalTime = GetGlbValue(ID_COLL_TIME);

	-- ���ͬһʱ���ڳ��� 3 ���ˣ���������
	--�޸�Ϊÿ��ֻ����3�� edited by vivi
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(PLAYER_COLLTIME)>=nDate and GetTask(PLAYER_DONUM)>=3 then
		Say("<color=green>"..strNpcName.."<color>: H�m nay thi�u hi�p �� gi�p ta 3 l�n li�n ti�p, th�t kh�ng d�m l�m phi�n n�a. Xin �a t� thi�u hi�p, ta s� nh� ng��i kh�c v�y! Ng�y mai thi�u hi�p l�i ��n nh�!", 0);
		return
	end;
	
	if GetTask(PLAYER_COLLTIME) < nDate then
		SetTask(PLAYER_COLLTIME, nDate);
		SetTask(PLAYER_DONUM, 0);
	end;	
	
	if checkCollectItem()==1 then
--		SetTask(PLAYER_COLLTIME, nGlobalTime);
		SetTask(PLAYER_DONUM, GetTask(PLAYER_DONUM)+1);
		payCollectAward();
	else
		Say("<color=green>"..strNpcName.."<color>: Nh�n ng��i tr� th� m� ��nh g�t ph�n th��ng c�a ta. Ta tuy ch�n y�u nh�ng m�t ch�a hoa m�!", 0);
	end;

end;

-- ʲôҲ�����Ŀպ���
function Main_Exit()

end;
