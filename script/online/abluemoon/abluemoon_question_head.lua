-----------------------------------------
-- ������Щ��Ʒ�鲻ȫ��/ȫ���ռ�Ʒ����?	
-- ����һ�׵������?	
-- ĳ�����߲����ܵõ��ĵط���?	
-- ĳ�����ﾭ��������ʲô�ط�?	
-- ĳ���ط�����ʲô��?	
-- ���¹��еȼ���ߵ���?��͵���?	
-- ����װ���ֵȼ������͵���?	
-- ����ĳ�����ʹ�����?	
-- ǿ��+N���⹦����	
-- ĳ��NPC�϶�������ֵĵط���?	
-- ���������¼�������	
------------------------------------------

Include("\\Script\\Class\\ktabfile.lua");

--QNA_BaseClass = new( kTabFile, "BaseClass.txt");
tabOQIS = new(KTabFile, "\\settings\\abluemoon_item_sect.txt");		-- ��Ʒ&����
tabPOEM = new(KTabFile, "\\settings\\abluemoon_poem_sect.txt");   -- ʫ �Ͼ�&�¾�
tabNPC = new(KTabFile, "\\settings\\abluemoon_npcpos_sect.txt");   -- ����NPC���ֲ�����
tabWORD = new(KTabFile, "\\settings\\abluemoon_word_sect.txt");   -- ��Ƨ��
--����һ�׵������?	
tabOQOutSuit = new( KTabFile, "\\settings\\out_suit.txt");	-- ��װ


-- ͨ������ѡ����Ʒ
function OQ_Item_Sect()
	if tabOQIS == nil or tabPOEM == nil or tabNPC == nil or tabWORD == nil then
		return
	end
	local nMaxRow ;
	local tabQuest;
	local select = random(5)
	if select == 1 then
		tabQuest = tabOQIS;
	elseif select == 2 then
		tabQuest = tabPOEM;
	elseif select == 3 then
		tabQuest = tabNPC;
	elseif select == 4 or select == 5 then
		tabQuest = tabWORD
	end	
	
	nMaxRow = tabQuest:getRow();
	if nMaxRow < 3 then
		return
	end
	
	local riddle;
	local answer;
	local temp;
	if select == 1 then -- ��Ʒ&����
		riddle = "����"
		answer = "��Ʒ"
	elseif select == 2 then -- ʫ �Ͼ�&�¾�
		riddle = "�Ͼ�"
		answer = "�¾�"
	elseif select == 3 then -- ����NPC���ֲ�����
		riddle = "NPC����"
		answer = "����"
	elseif select == 4 then -- �������ֲ¶���
		riddle = "����"
		answer = "����"
	elseif select == 5 then -- �������ֲ�����
		riddle = "����"
		answer = "����"
	end
	local Quest;		-- ����
	local Sels = {};	-- ѡ��
	local nRow = random(3,nMaxRow)
	Sels[2] = nRow;
	Sels[6] = 0;
	for i=3,5 do
		Sels[i] = random(3,nMaxRow)
		for j=2,i-1 do
			if Sels[j] == Sels[i] then	-- �ظ�
				Sels[i] = random(3,nMaxRow)
				Sels[6] = Sels[6] + 1
				if Sels[6] > 10 then
					break;
				end
				j=2
			end
		end
	end
	
	for i=3,5 do
		Sels[i] = tostring(tabQuest:getCell(Sels[i], answer))
	end
	Quest = tostring(tabQuest:getCell(nRow, riddle))
	Sels[2] = tostring(tabQuest:getCell(nRow, answer))
	
	nRow = random(2,5);	-- ��ȷ��
	if nRow ~= 2 then
		temp = Sels[nRow];
		Sels[nRow] = Sels[2];
		Sels[2] = temp;
	end
	Sels[1] = "�����<color=gold>"..riddle.."<color>ѡ���Ӧ��<color=gold>"..answer.."<color>.\n<color=green>"..riddle..":"..Quest.."<color>\n��ѡ��:\n";
	Sels[6] = nRow;
	return Sels;
end

-- 1����װ
function OQ_OutSuit()	
	if tabOQOutSuit == nil then
		return
	end
	local nMaxRow = tabOQOutSuit:getRow();
	if nMaxRow < 3 then
		return
	end
	-- ͷ,��,��
	local tSels = {};
	
	local nRow = random(2, nMaxRow);
	tSels[1] = "�������ѡ����ѡ�������<color=gold>һ����װ<color>\n"
	local head = tabOQOutSuit:getCell(nRow,"ͷ");
	local cloth = tabOQOutSuit:getCell(nRow,"��");
	local shoe = tabOQOutSuit:getCell(nRow,"��")
	tSels[2] = head..","..cloth..","..shoe;
	local temp = 0;
	temp = random(2,nMaxRow)
	if nRow - temp == 0 then		-- ��ֹȡ��һ����
		temp = nMaxRow - temp/2 
	end
	tSels[3] = tabOQOutSuit:getCell(temp,"ͷ")..","..cloth..","..shoe;
	tSels[4] = head..","..tabOQOutSuit:getCell(temp,"��")..","..shoe;
	tSels[5] = head..","..cloth..","..tabOQOutSuit:getCell(temp,"��");
	--����3,4,5ѡ��
	for i=3,4 do
		temp = random(3,5)
		tSels[6] = tSels[i]
		tSels[i] = tSels[temp]
		tSels[temp] = tSels[6];
	end
	nRow = random(2,5);	-- ��ȷ��
	if nRow ~= 2 then
		temp = Sels[nRow];
		Sels[nRow] = Sels[2];
		Sels[2] = temp;
	end
	tSels[6] = nRow - 1;
	return tSels;
end

function MoonRabbit_GetAQuestion(nQuestNum)
	if nQuestNum == 1 then
		return OQ_Item_Sect();
	end
end