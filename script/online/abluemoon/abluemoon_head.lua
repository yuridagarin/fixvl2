Include("\\script\\class\\ktabfile.lua");
Include("\\script\\task\\world\\task_head.lua")
QuestTab = new(KTabFile, "\\settings\\abluemoon_question.txt");
Include("\\script\\item\\yanhuo.lua")

--===========================================����������================================
ABLUEMOON_QUEST_DATE = 610; --�μ�һ�㿼�Ե�����
ABLUEMOON_QUEST_COUNT = 611; --����ش����
ABLUEMOON_QUEST_RIGHT_COUNT_1st = 612;--�����һ�ػش���ȷ����
ABLUEMOON_QUEST_COUNT_MAX = 613; --�����ܻش����������
ABLUEMOON_JIFEN = 614; --����

ABLUEMOON_STATE = 615; --��ʼ������,���ڼ�ʱ 1:��ʼ���� 2:�������� 3:���ⳬʱ
ABLUEMOON_TIMER = 616; --�����ʱ��

ABLUEMOON_LUCK_DATE = 617 --����������
ABLUEMOON_LUCK = 618; --ÿ�������ֵ 1��7��ʾ���� 
ABLUEMOON_LUCKY_COUNT = 619 --ÿ��ת�˵ļ���

ABLUEMOON_ANSWER_STAGE = 620 --��¼�콱�Ĺ���
ABLUEMOON_ANSWER_WIN   = 621 --��¼�콱����Ӯ

ABLUEMOON_ITEM_TO_EXP = 622 --��¼������ϻ����������
ABLUEMOON_COMPENSATION = 623	--��λ��¼�Ƿ���ȡ������ ʮλ��¼�Ƿ���ȡ���ƿ���װ 
ABLUEMOON_QUEST_DATE_PAY  = 624 ----�μӸ߼����Ե����� IBר��
ABLUEMOON_TIMES_DAILY = 625 --ÿ��߼����ԵĴ���
ABLUEMOON_QUEST_RIGHT_COUNT_2nd = 626;--����ڶ��ػش���ȷ����
ABLUEMOON_CAIQUAN_COUNT = 627;  --ÿ���Ѿ���ȭ�Ĵ���
ABLUEMOON_AWARD_TYPE    = 628;  --��¼�������ͣ� 1����ͨ���� 2�Ǹ߼�����
ABLUEMOON_QUEST_ROUND   = 629;  --���촳���ڼ�����
--=======================================================================================
--===========================================ȫ�ֱ������=================================
ABLUEMOON_TIME = 60; --��������,1����
 
MISSION_ID = 33; --140 MISSION ID
TIMER_ID = 61; --140
TIMER_LOOP_TIME = 18*1; --1��ѭ��һ��
MV_MISSION_STATE = 1; --MISSION״̬��1Ϊ������0Ϊ�ر�  ����û�õ�
MV_TIMER_TIME = 2; --��ʱ������ʱ��
MV_TIMER_IDEL = 3; --ֹͣ����ʱ��
MV_ABLUEMOON_NEED_ROUTE = 4; --��ȡ������Ҫ��������ɣ�һ��15��
tMS_NAME = { 1,2,3,4,5 }  --������������õ���MISSION S ��ID
tMV_JIFEN = { 5,6,7,8,9 } --������ػ����õ���MISSION V ��ID
MV_NPC_INDEX = 10;  --��СѾ������
MV_COUNT_PAY = 11;  --ÿСʱ�μӸ߾��鿼�Ե�����
MV_COUNT_LUOBO = 12;  --ÿСʱ���ĵ��ܲ�����
TIMER_TOTAL_TIME = 59*60*1 --MISSION����ʱ��59����
NEED_TEAM = 1; --�콱�費��Ҫ��� 0:����Ҫ 1:��Ҫ
--========================================================================================
--===================================================���⹫�����ֿ�ʼ============================================
-- ��ʾ���նԻ�
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

--�����콱�ʸ�
function GetHappyTimes(nStage,bWin)
	DelMSPlayer(MISSION_ID,1)  --����Ҵ�MISSION��ɾ��
	SetTask(ABLUEMOON_ANSWER_STAGE,nStage)
	SetTask(ABLUEMOON_ANSWER_WIN,bWin)
	abluemoon_sort() --��������
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then
		Say("<color=green>��СѾ<color>�����Ѿ�������콱���ʸ񣬵��ǣ�����Ҫ�������һ����������쵽�����������ɣ���ȥ��һ��<color=yellow>"..(level-10).."����"..(level+10).."����"..tNeedRoute[route][2].."<color>���Ѻ���һ��<color=yellow>���<color>�����ң��ҾͰѽ������㡣",2,
			"���Ѿ������ˣ����ҽ�����/CheckHappyTimes","����ȥ����/end_say")
	else
		Say("<color=green>��СѾ<color>�����Ѿ�������콱���ʸ��κ�ʱ����������ȡ���С�",2,
			"���ҽ�����/CheckHappyTimes","���Ȳ���/end_say")		
	end
end

--ȷ���콱�ʸ�
function CheckHappyTimes()
	local stage = GetTask(ABLUEMOON_ANSWER_STAGE)
	local win = GetTask(ABLUEMOON_ANSWER_WIN)
	if stage == 0 then
		Say("<color=green>��СѾ<color>�����ϴο��ԵĽ����Ѿ��������",0)
		return
	end
	
	local canwin = 0; --�Ƿ�����ȡ����
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then  --��Ҫ����콱
		local nOldPlayerIndex = PlayerIndex
		local count = GetTeamSize()
		if count >= 2 then
			for i = 1,count do
				PlayerIndex = GetTeamMember(i)
				if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
						canwin = 1;
				end
			end
			PlayerIndex = nOldPlayerIndex
		end 	
	else
		canwin = 1;
	end
	
	if canwin == 0 then 
		Say("<color=green>��СѾ<color>���㻹û���ҵ�һ��<color=yellow>"..(level-10).."����"..(level+10).."����"..tNeedRoute[route][2].."<color>���Ѻ���һ��<color=yellow>���<color>�����ң����ܸ��㽱��Ŷ��",0)
	else
		--SetTask(ABLUEMOON_ANSWER_STAGE,0) --�ŵ���ȡ�ɹ�֮�������
		HappyTimes(stage,win)
	end
end

-- ����
function HappyTimes(nStage,bWin)
	local stage = nStage;
	local win = bWin;
	local bonus_1st = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st))
	local bonus_2nd = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd))
	local nLevel = GetLevel();
	local award_1st = nLevel^2*3;  --��һ��ÿ�⽱�� [����*����*3]����
	local award_2nd = nLevel^2*6;
	local nEarnExp_1st = 0;
	local nEarnExp_2nd = 0;
	local nTotalExp = 0;
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	
	if award_type == 1 then  --�����һ�㿼��
		award_1st = floor(award_1st/10)
		award_2nd = floor(award_2nd/10)
	end
	nEarnExp_1st = award_1st * bonus_1st  --��һ�ؽ���
	if nStage == 2 then --�ڶ�����ȡ
			nEarnExp_2nd = award_2nd * bonus_2nd  --�ڶ��ؽ���
	else  --�Ժ���չ
		
	end

	nTotalExp = nEarnExp_1st + nEarnExp_2nd
	if win == 0 then
		nTotalExp = floor(nTotalExp / 2);  --�����ֻ��һ�뽱��
	end
	local tPrize = { 
			"<enter>Ժ�Դ�Ե���Ŀ��<color=yellow>"..bonus_1st.."<color>��",
			"<enter>Ժ��ÿ��Ľ�����<color=yellow>"..award_1st.."<color>�㾭��",
			"<enter>���Դ�Ե���Ŀ��<color=yellow>"..bonus_2nd.."<color>��",
			"<enter>����ÿ��Ľ�����<color=yellow>"..award_2nd.."<color>�㾭��",
		}		
	if win == 0 then
		tinsert(tPrize,"<enter>���������ʧ���ˣ�ֻ�ܸ���һ��Ľ�����һ���ǣ�<color=yellow>"..nTotalExp.."<color>�㾭��")
	else
		tinsert(tPrize,"<enter>��ϲ�㣬������ܻ�õĽ���һ���ǣ�<color=yellow>"..nTotalExp.."<color>�㾭��")
	end	
	if stage == 1 then
		for i=1,2 do tremove(tPrize,3) end
	end
	local szPrize = "";
	for i=1,getn(tPrize) do 
		szPrize = szPrize..tPrize[i]
	end
	Say("<color=green>��СѾ<color>���������ϴο��Եļ�¼����������һ���ʣ���������Ľ������£�"..szPrize,1,"�����ھ���ȡ/#GetPrize("..nTotalExp..","..win..","..nStage..")")
end

--�콱
function GetPrize(nExp,bWin,nStage) 
	local win = bWin
	ModifyExp(nExp);
	Msg2Player("������"..nExp.."�㾭��")
--	if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == 10 and GetTask(ABLUEMOON_QUEST_COUNT) == 5 and win == 1 then
--		AddItem(0,107,155,1)  --�����ؼ�
--		Say("<color=green>��СѾ<color>��������������죬�ؽ�����һ�������ؼ����´μ���Ŭ����",0)
--	end
	
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV >= 3 then 
		Msg2SubWorld("��ϲ��� "..GetName().." ��á�"..tTitle[jifenLV][3].."���ĳƺţ�")
	end
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	local book_num = 1;
	if award_type == 2 then  --����Ǹ߼�����
		book_num = 2;
	end
	local book = random(100)
	if nStage == 2 and GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then  --�ڶ��ش��5�����ϲŸ�֤��
		if jifenLV == 2 then  --��Ա
			AddItem(2,0,597,book_num)  --�����õ�������ᣭ��Ա
			Msg2Player("�����˿ƾٿ��ԵĽ�������Ա֤��"..book_num.."����")
		elseif jifenLV == 3 then  --���
			if book < 50 then
				AddItem(2,0,597,book_num)  --�����õ�������ᣭ��Ա
				Msg2Player("�����˿ƾٿ��ԵĽ�������Ա֤��"..book_num.."����")
			else
				AddItem(2,0,598,book_num)  --�����õ�������ᣭ���
				Msg2Player("�����˿ƾٿ��ԵĽ��������֤��"..book_num.."����")
			end
		elseif jifenLV == 4 then --����
			if book < 40 then
				AddItem(2,0,597,book_num)  --�����õ�������ᣭ��Ա
				Msg2Player("�����˿ƾٿ��ԵĽ�������Ա֤��"..book_num.."����")
			elseif book < 70 then
				AddItem(2,0,598,book_num)  --�����õ�������ᣭ���
				Msg2Player("�����˿ƾٿ��ԵĽ��������֤��"..book_num.."����")
			else
				AddItem(2,0,599,book_num)  --�����õ�������ᣭ����
				Msg2Player("�����˿ƾٿ��ԵĽ���������֤��"..book_num.."����")
			end
		elseif jifenLV == 5 then --��ʿ
			if book < 30 then
				AddItem(2,0,597,book_num)  --�����õ�������ᣭ��Ա
				Msg2Player("�����������õ�������ᣭ��Ա֤��"..book_num.."����")
			elseif book < 60 then
				AddItem(2,0,598,book_num)  --�����õ�������ᣭ���
				Msg2Player("�����������õ�������ᣭ���֤��"..book_num.."����")
			elseif book < 80 then
				AddItem(2,0,599,book_num)  --�����õ�������ᣭ����
				Msg2Player("�����������õ�������ᣭ����֤��"..book_num.."����")
			else
				AddItem(2,0,600,book_num)  --�����õ�������ᣭ��ʿ
				Msg2Player("�����������õ�������ᣭ��ʿ֤��"..book_num.."����")				
			end			
		elseif jifenLV >= 6 then --��ʿ����
			if book < 30 then
				AddItem(2,0,597,book_num)  --�����õ�������ᣭ��Ա
				Msg2Player("�����������õ�������ᣭ��Ա֤��"..book_num.."����")
			elseif book < 55 then
				AddItem(2,0,598,book_num)  --�����õ�������ᣭ���
				Msg2Player("�����������õ�������ᣭ���֤��"..book_num.."����")
			elseif book < 75 then
				AddItem(2,0,599,book_num)  --�����õ�������ᣭ����
				Msg2Player("�����������õ�������ᣭ����֤��"..book_num.."����")
			elseif book < 95 then
				AddItem(2,0,600,book_num)  --�����õ�������ᣭ��ʿ
				Msg2Player("�����������õ�������ᣭ��ʿ֤��"..book_num.."����")	
			else
				AddItem(2,0,601,book_num)  --�����õ�������ᣭ��ʿ
				Msg2Player("�����������õ�������ᣭ��ʿ֤��"..book_num.."����")							
			end			
		end
	end
	
	SetTask(ABLUEMOON_ANSWER_STAGE, 0) --���꽱��֮����մ�����Ϣ
	SetTask(ABLUEMOON_QUEST_ROUND, 0)  --������ڼ�������ı�־
	local level = GetLevel()
	local nOldPlayerIndex = PlayerIndex
	local count = GetTeamSize()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if count >= 2 then
		for i = 1,count do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
					local nOtherExp = GetLevel()^2*20
					ModifyExp(nOtherExp) --�����ѼӼ���^2*20����
					Msg2Player("������"..nOtherExp.."�㾭�飡")
			end
		end
		PlayerIndex = nOldPlayerIndex
	end 
end

-- ��ʾ��������
function show_question(num, caption)
	local row_start = 0;
	local row_end = 0;
	local Qnum = num;
	local Onum = Qnum;
	if num ~= 1 then
		if random(100) < 50 then 
			Qnum = 6 ;               --������������ 1/5����
		end
	end
	if Qnum == 1 then  --��һ�����
		row_start = 2;
		row_end = 278
	elseif Qnum == 2 then  --�ڶ��ص�1�����
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 3 then  --�ڶ��ص�2�����
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 4 then  --�ڶ��ص�3�����
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 5 then  --�ڶ��ص�4�����
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 6 then  --������������
		SpecialQues(Onum)
	end
	if (row_end > 1) then
		local row = random(row_start, row_end)
		local answer = QuestTab:getCell(row, 2)
		local question = format("%s%s", caption, QuestTab:getCell(row, 3))
		local options = {}
		
		for i = 1, 4 do
			options[i] = QuestTab:getCell(row, 3 + i)
			if (tbl_answer_index[answer] == i) then
				options[i] = format("%s/#answer_ok(%d,%d)", options[i], Onum, Qnum)
			else
				options[i] = format("%s/#answer_fail(%d,%d)", options[i], Onum, Qnum)
			end
		end
		ReSort(options)
		Say(question, 4, options[1], options[2], options[3], options[4])
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- �ش���ȷ
function answer_ok(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --��û��ֵȼ�
	local jifen = 1;
	if Qnum > 1 and Qnum < 7 then  --�ڶ��� 
		jifen = tJifen[1][jifenLV] --�����ֵȼ������֣�ֻ�Եڶ�����Ч
		if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --�����һ�㿼��
			jifen = floor(jifen/2)
		else
			jifen = jifen * 2
		end
	end
	if njifen >= 4999 then jifen = 0 end  --���Ʒ�������

	if GetTask(ABLUEMOON_STATE) == 3 then 
		Say("<color=green>��СѾ<color>����ش�ʱ�䳬ʱ��������Ŷ��",1,"֪����/#answer_fail("..num..","..Qnum..")")
		return
	else
		SetTask(ABLUEMOON_STATE,2) --ֹͣ����
	end
	Msg2Player("��ϲ�����ˣ�")
	use_yanhuo("�����̻�")  --���̻���ף,�ܲ���������������
	--DoFireworks(862,1)  --����Ч��
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)   --������+1
	if Qnum == 1 then  --��һ��
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+jifen)	  --����+1
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) + 1)  --��һ����ȷ����+1
		Say("<color=green>��СѾ<color>����ϲ�����ˣ��ٸ������<color=yellow>"..jifen.."��<color>��",1,"��������/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --�ڶ���
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))	  --����+2
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) + 1)  --�ڶ�����ȷ����+1
		if GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) then  --�ڶ��ؿ��Դ������������һ����ȷ������
			Say("<color=green>��СѾ<color>����ϲ�����ˣ��ٸ������<color=yellow>"..jifen.."��<color>��������Ŀǰһ�������<color=yellow>"..GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd).."<color>���⡣����Լ������أ�Ҳ����������ȡ�ۻ��Ľ�����",2,"\n��������/#abluemoon_2nd_go("..num..")","\n�����ھ���ȡ������/#GetHappyTimes(2,1)")
		elseif GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			local bonus = 10;
			if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --�����һ�㿼��
				bonus = bonus/2
			else
				bonus = bonus*2
			end
			if njifen <= 4989 then 
				SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+bonus)	  --����+1
			end
			Say("<color=green>��СѾ<color>����ϲ�����Դ����<color=yellow>5��<color>���ϣ��ٸ�����⽱��<color=yellow>"..bonus.."��<color>��",1,"�����ھ���ȡ������/#GetHappyTimes(2,1)")
		else
			Say("<color=green>��СѾ<color>���������Եı���Ƿ�ѣ�û�д��<color=yellow>5��<color>���ϡ�û�ж��⽱��Ŷ��",1,"�����ھ���ȡ������/#GetHappyTimes(2,0)")
		end
	end
end

-- �ش����
function answer_fail(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	SetTask(ABLUEMOON_STATE,2) --ֹͣ����
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --��û��ֵȼ�
	local jifen = tJifen[2][jifenLV]  --�����ֵȼ������֣�ֻ�Եڶ�����Ч
	Msg2Player("�����ˣ�")
	CastState("state_lost_life_per18",250,18*5)
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)  --������+1
	if Qnum == 1 then  --��һ��
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)-1)  --����-1
		Say("<color=green>��СѾ<color>��̫��ϧ�ˣ���������㱻����<color=yellow>1��<color>Ŷ��������",1,"��������/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --�ڶ���
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))  --����-2
		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			Say("<color=green>��СѾ<color>��̫��ϧ�ˣ���������㱻����<color=yellow>"..-jifen.."��<color>�����ܼ��������ˣ��ۻ��Ľ���Ҳֻ����ȡһ�룬�´�Ŭ���������Դ����<color=yellow>5��<color>���ϣ����ܻ���֤�齱��Ŷ��",1,"��ȡ����/#GetHappyTimes(2,0)")
		else
			Say("<color=green>��СѾ<color>��̫��ϧ�ˣ���������㱻����<color=yellow>"..-jifen.."��<color>�����ܼ��������ˣ��ۻ��Ľ���Ҳֻ����ȡһ�룬�´�Ŭ�����������Եı���Ƿ�ѣ�û�д��<color=yellow>5��<color>���ϡ�û��֤�齱��Ŷ��",1,"�����ھ���ȡ������/#GetHappyTimes(2,0)")
		end
	end
end
--==================================================���⹫�����ֽ���=================================================

--====================================================�������ƿ�ʼ===================================================
function abluemoon_luck()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then
		SetTask(ABLUEMOON_LUCK_DATE,nDay) 
		SetTask(ABLUEMOON_LUCK,0)
		SetTask(ABLUEMOON_LUCKY_COUNT,1)
	end 
	local nluck = random(1,7)
	if GetTask(ABLUEMOON_LUCK) == 0 then
		SetTask(ABLUEMOON_LUCK,nluck)
		Say("<color=green>��СѾ<color>�������飬�����飬��û���������飬��������������������������������ָһ�㣬��λ��������������ǣ�<color=yellow>"..tluck[nluck].."<color>��",2,
				"��Ҫת��/want_lucky",
				"��л�ð���/end_say")
	else
		Say("<color=green>��СѾ<color>�����Ѿ��������һ������������ȥ��һ���������������ǣ�<color=yellow>"..tluck[GetTask(ABLUEMOON_LUCK)].."<color>��������Ȼ�����ð��ɣ��������һ��ǿ��Ը���תת�˵ġ���",2,
				"��Ҫת��/want_lucky",
				"��������/end_say"
				)
	end
end

function want_lucky()
	local nPay = 10 * GetTask(ABLUEMOON_LUCKY_COUNT) + 15
	Say("<color=green>��СѾ<color>����ת�ˣ����ÿ��������᲻��ð�æ���������ɣ�����Ҵ���һ��<color=yellow>������Ʒ<color>���ҹ�������飬�������ܲ��ܰ���ת�����ˡ�û�еĻ�Ҳû��ϵ�������<color=yellow>"..nPay.."��<color>���ѣ���������������ԡ����⣬�ܲ���ת�����˸��㣬Ҫ����ĸ����컯������������<color=yellow>���ܲ�<color>���ҿ�����Ѹ���ת��<color=yellow>��<color>Ŷ��",5,
			"�ҽ�������ת��/give_lucky_money",
			"�ҽ�������Ʒת��/give_lucky_shenmi",
			"����ֱ��ת��/want_daji",
			"���뿴����Щ������Ʒ��ת��/shenmi_info",
			"��ȥ���ҿ�/end_say"
			)
end

function give_lucky_money()  --��Ǯת�� 
	local nCount = GetTask(ABLUEMOON_LUCKY_COUNT)
	local nPay = nCount * 100000 + 150000
	local nluck = random(1,7)
	if GetCash() >= nPay then
			Pay(nPay)
			SetTask(ABLUEMOON_LUCK,nluck)
			SetTask(ABLUEMOON_LUCKY_COUNT,nCount+1)
			Say("<color=green>��СѾ<color>��̫���ˣ�������������������������Ҳ������������ˣ������ǣ�<color=yellow>"..tluck[nluck].."<color>��",0)
	else
		Say("<color=green>��СѾ<color>����Ҫ��ƭ�ң�С���Ҹ���ת�����ף�",0)
	end
end

function give_lucky_shenmi()  --�������������ʲô�����õ���Ʒ
	local num = 0;
	local index = 0;
	for i = 1, getn(tShenmi) do
		if GetItemCount(2,1,tShenmi[i][2]) > 0 then
			index = i;
			num = tShenmi[i][2];
			break
		end
	end
	if num == 0 then
		Say("<color=green>��СѾ<color>�������Ϻ���û�п���ת�˵�������ƷŶ��",0)
	else
		Say("<color=green>��СѾ<color>�������ϵ�<color=yellow>"..tShenmi[index][1].."<color>��������ת�ˣ���ȷ��Ҫ������ת�����������������ת�Ļ����Ȱ����ŵ��ֿ���߰�̯���",2,
				"�ǵģ���Ҫ������ת��/#del_lucky_shenmi("..num..")",
				"�Ҳ�ת��/end_say")
	end
end

function del_lucky_shenmi(num)  --��������Ʒת��
	local nluck = random(1,7)
	if DelItem(2,1,num,1) == 1 then
		SetTask(ABLUEMOON_LUCK,nluck)
		SetTask(ABLUEMOON_LUCKY_COUNT,GetTask(ABLUEMOON_LUCKY_COUNT)+1)
		Say("<color=green>��СѾ<color>��̫���ˣ����������Ʒ�����������������Ҳ������������ˣ������ǣ�<color=yellow>"..tluck[nluck].."<color>��",0)	
	else
		Say("<color=green>��СѾ<color>����Ҫ��ƭ�ң�С���Ҹ���ת�����ף�",0)
	end
end

function shenmi_info()  --��ת�˵�������Ʒ
 local shenmi = ""
 for i = 1, getn(tShenmi) do
 	shenmi = shenmi..tShenmi[i][1].." "
 end
 Talk(1,"","<color=green>��СѾ<color>������Ķ����Ϳ���ת��Ŷ��"..shenmi)
end

function want_daji()
	if GetItemCount(2,1,1091) >= 1 then
		Say("<color=green>��СѾ<color>����������<color=yellow>���ܲ�<color>���͸��ҵĻ��Ϳ��԰���ת��<color=yellow>��<color>Ŷ��Ҫ��Ҫ�͸����أ�",2,
				"���͸����/want_daji_go",
				"��������/end_say"
		)
	else
		Say("<color=green>��СѾ<color>����ת����Ҫһ��<color=yellow>���ܲ�<color>����Ŷ��",0)
	end
end

function want_daji_go()
	if DelItem(2,1,1091,1) == 1 then
		SetTask(ABLUEMOON_LUCK,7) 
		Say("<color=green>��СѾ<color>����ϲ�㣬������������<color=yellow>��<color>�ˣ�",0)
	else
		Say("<color=green>��СѾ<color>����ת����Ҫһ��<color=yellow>���ܲ�<color>����Ŷ��",0)
	end
end
--==================================================�������ƽ���=========================================

--==================================================���ػ��ֵȼ���ʼ=========================================
function jifen2level(jifen)
	local nTitleLevel = 1;
	if jifen < 0 then
			nTitleLevel = 1
	elseif jifen < 100 then
			nTitleLevel = 2
	elseif jifen < 200 then
			nTitleLevel = 3
	elseif jifen < 500 then
			nTitleLevel = 4
	elseif jifen < 1000 then
			nTitleLevel = 5
	elseif jifen < 1500 then
			nTitleLevel = 6
	elseif jifen < 3000 then
			nTitleLevel = 7
	elseif jifen < 5000 then
			nTitleLevel = 8
	elseif jifen < 10000 then
			nTitleLevel = 9
	else
			nTitleLevel = 10
	end
	return nTitleLevel
end
--===================================================���ػ��ֵȼ�����===================================================
--===================================================���а�ʼ===========================================================
function abluemoon_paihang()  --��ʾ���а�
	local tab_jifen = {};
	local tab_name = {};
	local tab_level = {};
	for i = 1,5 do  --ȡ��MISSION�е�������Ϣ
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
		tab_level[i] = jifen2level(tab_jifen[i])
	end
	Say("<color=green>��СѾ<color>�������ҽ���Ǽǵ�������������ο�������ǰ��Ŀ����ǣ�"..
			"<enter>��һ����"..tab_name[1].."�����֣�"..tab_jifen[1].."���ƺţ�"..tTitle[tab_level[1]][3]..
			"<enter>�ڶ�����"..tab_name[2].."�����֣�"..tab_jifen[2].."���ƺţ�"..tTitle[tab_level[2]][3]..
			"<enter>��������"..tab_name[3].."�����֣�"..tab_jifen[3].."���ƺţ�"..tTitle[tab_level[3]][3]..
			"<enter>��������"..tab_name[4].."�����֣�"..tab_jifen[4].."���ƺţ�"..tTitle[tab_level[4]][3]..
			"<enter>��������"..tab_name[5].."�����֣�"..tab_jifen[5].."���ƺţ�"..tTitle[tab_level[5]][3],
			0)
end

function abluemoon_sort()  --ÿ�δ���һ����ͳ��һ������
	local jifen = GetTask(ABLUEMOON_JIFEN);
	local tab_jifen = {};
	local tab_name = {};
	for i = 1,5 do  --ȡ��MISSION�е�������Ϣ
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
	end
	for i = 1,5 do  --���벢����
		if jifen > tab_jifen[i] then
			for j = 5,i+1,-1 do 
				tab_jifen[j] = tab_jifen[j-1]
				tab_name[j] = tab_name[j-1]
			end
			tab_jifen[i] = jifen
			tab_name[i] = GetName()
			break
		end
	end
	for i = 1,5 do  --��������������Ϣ
		SetMissionV(tMV_JIFEN[i],tab_jifen[i])
		SetMissionS(tMS_NAME[i],tab_name[i])
	end	
end
--===================================================���а����===========================================================
tluck = { "����", "����", "С��", "��", "С��", "�м�", "��"}
	
tShenmi = {  --ת���õ�������Ʒ(2,1,...)
	{"�ƽ���",108},
	{"��������",109},
	{"ɽ�����ͼ��Ƭ",110},
	{"õ��",111},
	{"�����ý�",112},
	{"������",113},
	{"��ˮ�ͳ�",114},
	{"���칭",115},
	{"����",116},
	{"���ɾ�",117},
	{"ʬ���߹�",118},
	{"ʬ��ƿ",119},
	{"����",120},
	{"�����",121},
	{"˫�Ǻ�",122},
	{"������",123},
	{"ͷ��",124},
	{"�ۻ궦",125},
	{"����",126},
	{"��",127},
	{"��ñ",128},
	{"��ɱ��",129},
	{"������",130},
	{"�ر�ͼ",131},
	{"����",132},
	{"ľ����",133},
	{"����",134},
	{"��ʯ��",135},
	{"ī��",136},
	{"���ɾ�",137},
	{"��������ְ�",138},
	{"��ͷ����",139},
	{"Ϫɽ����ͼ",140},
	{"����ս��",141},
	{"�ʳ�����",142},
	{"������״�",143},
	{"��ש",144},
	{"���׽�ɳ",146},
	{"�����޷�",147},
	{"������",151},
	{"����",152},
	{"����",153},
}

tNeedItem = {  --��ȡ����������Ʒ
	{"����˿", 2,2,54 },
	{"���˿", 2,2,55 },
	{"��Ƥ",   2,2,20 },
	{"�������",2,10,7 },
	{"����",   2,2,6 },
	{"����ʯ", 2,2,36 },
	{"��ľ",   2,2,9 },
	{"����ľ", 2,2,10 },
}

tNeedRoute = {  --��ȡ������Ҫ��ӵ�����
	{0,"��������"},
	{2,"�����׼�"},
	{3,"��������"}, 
	{4,"��������"}, 
	{6,"����"},
	{8,"���ҷ��"},
	{9,"�����׼�"},
	{11,"ؤ�ﾻ��"},
	{12,"ؤ������"}, 
	{14,"�䵱����"},
	{15,"�䵱�׼�"},
	{17,"����ǹ��"},
	{18,"���Ź���"},
	{20,"�嶾а��"},
	{21,"�嶾��ʦ"},
}

tJifen = {  -- ��Ӧ�ƺŵȼ�����ķ���
	[1] = {  --�ӷ֣�һ��10��
		15,10,7,6,5,5,5,5,5,5
	},
	[2] = {  --�۷�
	  -1,-1,-1,-3,-10,-20,-30,-40,-50,-100
	}
}

tTitle = {  --��Ӧ���ֶ�Ӧ�ĳƺ�
	{50,1,"��ä" },
	{50,2,"��Ա"},
	{50,3,"���"},
	{50,4,"����"},
	{50,5,"��ʿ"},
	{50,6,"��ʿ"},
	{50,7,"ѧʿ"},
	{50,8,"�����ѧʿ"},
	{50,9,"����Ժ��ѧʿ"},
	{50,10,"������"},
}


function end_say()

end