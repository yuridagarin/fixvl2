Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\��ԭ����\\�ɶ�\\npc\\��ʦ.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"

function main()
	Say("<color=green>��СѾ<color>����ӭ�μӽ���2��һ��ƾٿ��Ե�һ���Ŀ��ԣ������е�����սһ����",7,
			"���ɣ���Ҫ��ս�㣡/abluemoon_go",
			"���뿴�������ڵĿƿ��ɼ�/abluemoon_jifen",
			"���ȿ�������Ŀƿ��������/abluemoon_luck",
			"��Ҫ��ȡ�ϴο��ԵĽ���/CheckHappyTimes",
			"���뿴�����ڿƿ�������/abluemoon_paihang",
			--"��Ҫ��ȡ�ƿ���װ/abluemoon_cloth",
			"���ҽ��������/abluemoon_rule",
			"���ˣ�����״̬����/end_say"
			)
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say("<color=green>��СѾ<color>��С��50���������ʱ���ܲμӿƾٿ��ԣ��Ȼ�ȥ���������ɡ�",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say("<color=green>��СѾ<color>�����ϴο��ԵĽ�������û����ȡŶ���Ȱѽ��������������԰ɣ�",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --�������μӵ��Ǹ߾��鿼��
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --����Ǵ�����С�ڲ�ȭ��
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --����ǵ�һ�ش�������ʧ��
		Say("<color=green>��СѾ<color>�����ϴ�Ժ�ԵĿ��Ժ���û�н�������Ҫ�����μ�Ժ����",2,
				"\n��Ҫ�����μӿ���/#abluemoon_cuntinue(1)",
				"\n���ٿ���һ��/end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --����ǵڶ��ش�����С�ڵ�һ����ȷ����
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --����ǵڶ��ش�������ʧ��
		Say("<color=green>��СѾ<color>�����ϴ����ԵĿ��Ժ���û�н�������Ҫ�����μ�������",2,
				"\n��Ҫ�����μӿ���/#abluemoon_cuntinue(2)",
				"\n���ٿ���һ��/end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say("<color=green>��СѾ<color>������<color=yellow>"..rest.."<color>�����Ҹ����������������Ѿ�ֹͣ���ܱ�����",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "δ֪���ȴ��׻���"  --���û�� Ĭ�ϴ���
		local nDay = tonumber(date("%y%m%d"))
		if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --�������� ��ʾ��ǰ����
			szluck = tluck[nluck]  
		end
		Say("<color=green>��СѾ<color>����ȭ���������<color=yellow>����<color>�кܴ��ϵŶ�������������������������������ô����Ҳ������кô����㵱ǰ�������ǣ�<color=yellow>"..szluck.."<color>",3,
				"\n�ðɣ�����������������/abluemoon_luck",
				"\n��Ҫ�μӿƾٿ���/abluemoon_gogo_select",
				"\n���ˣ�����״̬����/end_say"
		)
	end
end

function abluemoon_cuntinue(nRound)
	AddMSPlayer(MISSION_ID,1)  --����Ҽ���MISSION
	if nRound == 1 then
		abluemoon_1st()
	else
		abluemoon_2nd_go(2)
	end
end

function abluemoon_gogo_select()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_QUEST_DATE) == -1 and GetTask(ABLUEMOON_QUEST_DATE_PAY) == -1 then  --����ǻ������Ѵ������
			Say("<color=green>��СѾ<color>���������<color=yellow>���<color>�μӿ��ԵĻ��ᣬ������ѡ�����ֿ��Զ���ѣ���Ҫ�μ����ֿ����أ�",
					3,
					"��Ҫ��Ѳμ�һ�㿼��/#abluemoon_gogo(-1,1)",
					"��Ҫ��ѲμӸ߾��鿼��/#abluemoon_gogo(-1,2)",
					"���ٿ���һ��/end_say"
			)		
	else
		Say("<color=green>��СѾ<color>��Ŀǰ�Ŀ��Է�Ϊ���֣�һ����<color=yellow>һ�㿼��<color>������ȡ���ܲ�������һ�㣬ÿ��ÿ��1�λ��ᡣһ����<color=yellow>�߾��鿼��<color>����Ҫ��ȡ���ܲ������������Ҫ�μ����ֿ����أ�",
				3,
				"��Ҫ�μ�һ�㿼��/#abluemoon_gogo_check(1)",
				"��Ҫ�μӸ߾��鿼��/#abluemoon_gogo_check(2)",
				"���ٿ���һ��/end_say"
		)
	end
end

function abluemoon_gogo_check(nType)
	local nDay = tonumber(date("%y%m%d"))
	local nNeedItemAll = {1,2,3,5,5,10,10}  --��Ҫ�ĺ��ܲ�����
	local nNeedItemCount = 20;
	if nType == 1 then  --�����һ�㿼��
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay then  --����ǵ����һ�βμ�һ�㿼��
			Say("<color=green>��СѾ<color>������������μ�<color=yellow>һ�㿼��<color>�Ļ��ᣬ��Ҫ�μ�һ�㿼����",
					2,
					"��Ҫ�μ�һ�㿼��/#abluemoon_gogo(0,1)",
					"���ٿ���һ��/end_say"
			)	
		else
			Say("<color=green>��СѾ<color>��������Ѿ��μӹ�һ�㿼������ÿ����һ��ֻ��һ�λ���Ŷ��",0)
		end
	else                --����Ǹ߾��鿼��
		if GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay then  --����ǵ����һ�βμӸ߼�����
			SetTask(ABLUEMOON_TIMES_DAILY,1)
		end
		local nTimes = GetTask(ABLUEMOON_TIMES_DAILY) --����������
		if nTimes < 8 and nNeedItemCount ~= 0 then
			nNeedItemCount = nNeedItemAll[nTimes]
		end
		if GetItemCount(2,1,1090) >= nNeedItemCount then
			Say("<color=green>��СѾ<color>������������<color=yellow>"..nTimes.."<color>�βμӸ߾��鿼�ԣ���Ҫ����<color=yellow>"..nNeedItemCount.."<color>��<color=yellow>���ܲ�<color>����Ҫ�μӿ�����",
					2,
					"��Ҫ�μӿ���/#abluemoon_gogo("..nNeedItemCount..",2)",
					"���ٿ���һ��/end_say"
			)
		else
			Say("<color=green>��СѾ<color>������������<color=yellow>"..nTimes.."<color>�βμӸ߾��鿼�ԣ���Ҫ����<color=yellow>"..nNeedItemCount.."<color>��<color=yellow>���ܲ�<color>�������Ϻ���û����ô����ܲ�Ŷ����ȥ׼���ðɣ�",0)
		end
	end
end

function abluemoon_gogo(nNeedItemCount,nType)
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then  --���û����,Ĭ���Ǵ���
		SetTask(ABLUEMOON_LUCK,0)
	end
	if nNeedItemCount == 0 or nNeedItemCount == -1 or DelItem(2,1,1090,nNeedItemCount) == 1 then
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay and GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay and nNeedItemCount ~= -1 and GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --����ǽ����һ�βμӿ������ϴο���û���ܲ�
			local nJifen = floor(GetTask(ABLUEMOON_JIFEN)/6)  --˥���Ļ���
			if nJifen > 80 then nJifen = 80 end               --���˥��80��
			SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)-nJifen))
			Talk(1,"","���������֮ǰ�μӵ����һ�ο��Բ��Ǹ߾��鿼�ԣ����ֱ�˥����<color=yellow>"..nJifen.."<color>�֣�")
			Msg2Player("���������֮ǰ�μӵ����һ�ο��Բ��Ǹ߾��鿼�ԣ����ֱ�˥����"..nJifen.."�֣�")
		end
		if nNeedItemCount > 0 then  --������͵ĺ�һ�㿼�Բ������
			SetTask(ABLUEMOON_TIMES_DAILY,GetTask(ABLUEMOON_TIMES_DAILY)+1)
		end
		if nType == 1 then  --�����һ�㿼��
			SetTask(ABLUEMOON_QUEST_DATE, nDay)
			SetTask(ABLUEMOON_AWARD_TYPE,1)  --���ý�������1
		else
			if nNeedItemCount > 0 then --������͵Ĳ���
				SetTask(ABLUEMOON_QUEST_DATE_PAY, nDay)
			elseif nNeedItemCount == -1 then --������͵�
				SetTask(ABLUEMOON_QUEST_DATE_PAY, 0)
			end
			SetTask(ABLUEMOON_AWARD_TYPE,2)  --���ý�������2
			SetMissionV(MV_COUNT_PAY,GetMissionV(MV_COUNT_PAY)+1)  --ͳ�����Сʱ�μӸ߾��������
			SetMissionV(MV_COUNT_LUOBO,GetMissionV(MV_COUNT_LUOBO)+nNeedItemCount)
			--WriteLog("[�ƿ�ͳ��]��� "..GetName().." �μ��˸߾��鿼��,�����ܲ�"..nNeedItemCount.."��!")
		end
		SetTask(ABLUEMOON_QUEST_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, 0)
		SetTask(ABLUEMOON_CAIQUAN_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_COUNT_MAX, 0)
		AddMSPlayer(MISSION_ID,1)  --����Ҽ���MISSION
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
	else
		Say("<color=green>��СѾ<color>�������Ϻ���û����ô����ܲ�����",0)
	end
end

function abluemoon_gogogo(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	if nCount == 0 then  --��һ�γ�ʼ������
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --�ʵ���
		SetTask(ABLUEMOON_QUEST_DATE, -1)
		SetTask(ABLUEMOON_QUEST_DATE_PAY, -1)
		Msg2Player("��ϲ���ý����ٴδ��صĻ��ᣡ�´ο��Խ�����ѣ�")
	end
	Say("<color=green>��СѾ<color>�����ǽ����<color=yellow>"..count.."<color>����ս�ߡ��ȸ��Ҳ�ȭ��һ��10�֣�����Ӯ���־͸��㼸�δ���Ļ��ᣬ��ô���������Ļ������û�л�����Ŷ��",2,
		"\n��ʼ��ս/WantCaiquan",                               --��ȭ
		"\n�ҷ�������Ļ���/end_say"
	)	
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say("<color=green>��СѾ<color>�������ڵĻ����ǣ�<color=yellow>"..jifen.."<color>�֡�",0)
	for i = 1,getn(tTitle) do --ɾ��ԭ�еĳƺ�
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("���á�"..tTitle[nTitleLevel][3].."���ĳƺ�");
	end;
end

--====================================================�ʸ�����ȭ��ʼ=========================================================
partner_caimei  = {"��Խ����","�ž���ħ","������"}
function WantCaiquan()
	if GetTask(ABLUEMOON_CAIQUAN_COUNT) < 10 then 
		Say("<color=green>��СѾ<color>�� ����������ʼ��ȭ�����㻹��<color=yellow>"..(10-GetTask(ABLUEMOON_CAIQUAN_COUNT)).."<color>�β�ȭ�Ļ��ᣬ���ʲô��",4,
				"\n��Խ����\n/Caiquan_shitou",
				"\n�ž���ħ\n/Caiquan_jianzi",
				"\n������\n/Caiquan_bu",
				"\n������֪������\n/Caiquan_info"
		)
	else
		Say("<color=green>��СѾ<color>���Ѿ�����10������������һ����<color=yellow>"..GetTask(ABLUEMOON_QUEST_COUNT_MAX).."<color>�δ���Ļ��ᣬ��ʼ����",1,
				"���Ѿ�׼������/abluemoon_1st"
				)
	end
end

function Caiquan_shitou()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = 1;
	if random(100) > 50 then
		i = 3;
	end
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 2 end
	if i ~= 2 then	
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ����Ӯ����������",1,
				"�ҾͲ���а��������/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ������Ӯ��������<color=yellow>����<color>������������һ�δ�����ᡣ",1,
				"̫���ˣ���������/WantCaiquan")
	end
end

function Caiquan_jianzi()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(1,2)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 3 end
	if i ~= 3 then
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ����Ӯ����������",1,
				"�ҾͲ���а��������/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ������Ӯ��������<color=yellow>����<color>������������һ�δ�����ᡣ",1,
				"̫���ˣ���������/WantCaiquan")
	end
end

function Caiquan_bu()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(2,3)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 1 end
	if i ~= 1 then
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ����Ӯ����������",1,
				"�ҾͲ���а��������/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>��СѾ<color>���ҳ�<color=yellow>"..partner_caimei[i].."<color>,��ѽ������Ӯ��������<color=yellow>����<color>������������һ�δ�����ᡣ",1,
				"̫���ˣ���������/WantCaiquan")
	end
end

function Caiquan_info()
	Say("<color=green>��СѾ<color>�������������Σ���Խ���桢�ž���ħ���������أ���Խ����Ӯ�ž���ħ���ž���ħӮ�����ã�������Ӯ��Խ���档����û����Ӯ���Ҿ͹��أ�ûӮ�һ��ߴ��ƽ�֣���������ž���ħ��Ҳ���ž���ħ����Ҳ����Ӯ���ߺߡ�",1,"��Ҫ������һ��˵�/WantCaiquan")
end
--=====================================================�ʸ�����ȭ����===============================================================

--=====================================================��һ�ش��⿪ʼ===============================================================
function abluemoon_1st()	
	local right_count_1st = GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st);
	SetTask(ABLUEMOON_QUEST_ROUND,1)
	if GetTask(ABLUEMOON_QUEST_COUNT_MAX) > GetTask(ABLUEMOON_QUEST_COUNT) then
		SetTask(ABLUEMOON_STATE,1) --��ʼ����
		SetTask(ABLUEMOON_TIMER,GetGameTime()) --���ü�ʱ����ʼʱ��
		show_question(1, "�����<color=yellow>Ժ��<color>�ĵ�<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>���������£������⣺<enter>" )
	elseif GetTask(ABLUEMOON_QUEST_COUNT_MAX) == GetTask(ABLUEMOON_QUEST_COUNT) then  --����Ѿ��ش����
--		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == GetTask(ABLUEMOON_QUEST_COUNT_MAX) then  --���ȫ��
		if right_count_1st >= 5  then  --������5������
			Say("<color=green>��СѾ<color>������<color=yellow>Ժ��<color>�����Ѿ��ش���ϣ���һ�������<color=yellow>"..right_count_1st.."<color>���⣬��ȷ��<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>����ϲ�����<color=yellow>��������<color>��Ҳ�������ھ���ȡ����������<color=yellow>����<color>�й���<color=yellow>"..right_count_1st.."<color>�δ�����ᣬ���ͣ�",2,
					"\n�����ھ���ȡ������/#GetHappyTimes(1,1)",
					"\n��Ҫ��������/abluemoon_2nd"
					)

		elseif right_count_1st == 0 then  --ȫ��
			DelMSPlayer(MISSION_ID,1)  --����Ҵ�MISSION��ɾ��
			Say("<color=green>��СѾ<color>�����ϧѾ����һ�ⶼû�д�ԣ��´�������ս�ɣ�",0)
		else
			Say("<color=green>��СѾ<color>������<color=yellow>Ժ��<color>�����Ѿ��ش���ϣ���һ�������<color=yellow>"..right_count_1st.."<color>���⣬��ȷ��<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>������û�д��<color=yellow>5<color>�����ϣ����ܼ������������´�Ŭ����",1,
						"\n�����ھ���ȡ������/#GetHappyTimes(1,1)")
		end
	end
end
--=====================================================��һ�ش������=====================================================

--=====================================================�ڶ��ش��⿪ʼ=====================================================
function abluemoon_2nd()
	SetTask(ABLUEMOON_QUEST_COUNT, 0)
	SetTask(ABLUEMOON_QUEST_ROUND, 2)
--	Say("<color=green>��СѾ<color>����������������Ȼ�ܴ���ڶ��أ��������м�����Ŀ������ѡ�����أ�",4,
--			"\n��Ȼ��ѧ/#abluemoon_2nd_go(2)",
--			"\n������ʷ/#abluemoon_2nd_go(3)",
--			"\n������Ե/#abluemoon_2nd_go(4)",
--			"\n���߰���/#abluemoon_2nd_go(5)"
--		)
	Say("<color=green>��СѾ<color>����������������Ȼ�ܴ���<color=yellow>����<color>���������м�����Ŀ������ѡ�����أ�",4,
			"\n��/#abluemoon_2nd_go(2)",
			"\n��/#abluemoon_2nd_go(3)",
			"\n��/#abluemoon_2nd_go(4)",
			"\nԵ/#abluemoon_2nd_go(5)"
		)
end

function abluemoon_2nd_go(choice)
	SetTask(ABLUEMOON_STATE,1) --��ʼ����
	SetTask(ABLUEMOON_TIMER,GetGameTime()) --���ü�ʱ����ʼʱ��
	local num = choice;
	if num < 2 or num > 5 then --��ֹ������һ���Ƿ�ֵ
		num = random(2,5)
	end
	show_question(num, "�����<color=yellow>����<color>�ĵ�<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>���������£������⣺<enter>" )		
end
--==================================================�ڶ��ش������====================================================

--=================================================�����������⿪ʼ===================================================
function SpecialQues(choice)
	local nchoice = choice
	local options = {}
	--randomseed(GetTime())
	local num = random(1,8)  --�Ժ�������Ŀ��ʱ��ǵ��޸ĺ��������
	if num == 1 and GetGlbValue(151) == 0 then num = random(2,8) end
	if num == 1 then  --1.�»Ի�֮ҹ
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬���ʽ���ĻԻ�֮ҹ��ʲô���",6,
					"ս��/#SpecialAnswer(1,1,"..nchoice..")",
					"�̻�/#SpecialAnswer(1,2,"..nchoice..")",
					"ʦ���������/#SpecialAnswer(1,3,"..nchoice..")",
					"ʦ���ظ�����/#SpecialAnswer(1,4,"..nchoice..")",
					"ɱ������/#SpecialAnswer(1,5,"..nchoice..")",
					"����/#SpecialAnswer(1,6,"..nchoice..")"
				)
	elseif num == 2 then  --2.���������³ƺ�
		local nShengwang = random(-500,35000)	
		for i = 2,21 do  --���Ĵ�С
			if nShengwang < tShengwang[i][1] then 
				options[1] = format("%s/#answer_ok(%d,%d)", tShengwang[i][2], nchoice, 6)
				options[2] = format("%s/#answer_fail(%d,%d)", tShengwang[i-1][2], nchoice, 6)
				options[3] = format("%s/#answer_fail(%d,%d)", tShengwang[i+1][2], nchoice, 6)
				options[4] = format("%s/#answer_fail(%d,%d)", tShengwang[i+2][2], nchoice, 6)
				break
			end
		end
		ReSort(options)
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬����������<color=yellow>"..nShengwang.."<color>ʱ�ĳƺ���ʲô��",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 3 then  --3.���������辭��
		local level = random(50,97)
		local exp = tExp:getCell((level+2),2)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-10000,10000)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬����<color=yellow>"..level.."������"..(level+1).."��<color>��Ҫ���پ��飿",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 4 then  --4.�µ�ǰ�ȼ������ռ�Ʒ�ܻ�ö���Ǯ
		local num_max = Zgc_conf_task_num_max()
		local sinup = random(10,num_max)
		local gold = task_money_prize(sinup)
		local tab_gold = {}
		for i = 1,3 do
			tab_gold[i] = random(-1000,1000)
			if tab_gold[i] == 0 then tab_gold[i] = tab_gold[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", gold, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬�����������Ͻ����߼��ռ�Ʒ<color=yellow>"..sinup.."��<color>�ܻ�ö���Ǯ����<color=yellow>ͭ<color>Ϊ��λ��",4,
				 options[1], options[2], options[3], options[4])		
	elseif num == 5 then  --5.��ĳ���ȼ��ɼ�������������
		local skillID = random(1,6)
		local level = random(9,78)
		local exp = gather_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬����<color=yellow>"..tGatherSkill[skillID].."<color>��<color=yellow>"..level.."������"..(level+1).."��<color>��Ҫ���پ��飿",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 6 then  --6.��ĳ���ȼ�����ϵ������������
		local skillID = random(1,9)
		local level = random(9,78)
		local exp = compose_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>��СѾ<color>������������ͬһ������̫�����ˣ���ͻȻ�뵽һ�����⣬����<color=yellow>"..tComposeSkill[skillID].."<color>��<color=yellow>"..level.."������"..(level+1).."��<color>��Ҫ���پ��飿",4,
				 options[1], options[2], options[3], options[4])	
	elseif num == 7 then  --����XX��XX,������쿽ű�
		options = MoonRabbit_GetAQuestion(1)
		for i = 2,5 do 
			if i == options[6] then
				options[i] = options[i].."/#answer_ok("..nchoice..",6)"
			else
				options[i] = options[i].."/#answer_fail("..nchoice..",6)"
			end
		end
		Say(options[1],4,options[2], options[3], options[4], options[5])			
	elseif num == 8 then  --��һ���򵥵�������-_-
		local A,B,C,D = random(100),random(10),random(100),random(10)
		local result = (A*B + C*D)*2*0.9  --Ϲ������Ŀ�������Ҫ1���Ӹ㶨
		local radnum = {-45,-36,-27,-18,-9,9,18,27,36,45}
		local radresult = {}
		local radtime = 0;
		for i = 1,3 do 
			radresult[i] = radnum[random(10)]
			for j = 1,i-1 do
				if radresult[j] == radresult[i] then
					radresult[i] = radnum[random(10)]
					radtime = radtime + 1;
					if radtime > 10 then
						break;
					end
					j = 1;
				end
			end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", result, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", result+radresult[1], nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", result+radresult[2], nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", result+radresult[3], nchoice, 6)
		ReSort(options)		
		Say("<color=green>��СѾ<color>����������о��žſھ�������һ�����ⲻ֪�������ܲ��ܰ��ҽ����������������<color=yellow>"..A.."<color>ֻ����ÿֻ��ÿ�춼����<color=yellow>"..B.."<color>��������������<color=yellow>"..C.."<color>ֻѼ�ӣ�ÿֻѼ��ÿ�춼����<color=yellow>"..D.."<color>������ÿ��������<color=yellow>2<color>��ͭ�壬���������뻹�ý����ٸ�<color=yellow>ʮ��֮һ<color>�Ĺ�˰��������һ����׬���ٸ�ͭ�尡��",4,
				 options[1], options[2], options[3], options[4])	
	end
end

function SpecialAnswer(num,select,choice)  --һЩ��������������,û�����ñ����
	local nchoice = choice
	if num == 1 then 
		if select == GetGlbValue(151) then
				answer_ok(nchoice,6)
		else
				answer_fail(nchoice,6)
		end
	end
end

--===================================================���������������============================================

--=======================================================���ƿ���װ=========================================================
function abluemoon_cloth()
	if GetTask(ABLUEMOON_JIFEN) < 1000 then
		Say("<color=green>��СѾ<color>�� ��Ŀƿ��ɼ���û�дﵽ<color=yellow>��ʿ<color>����û���ʸ���ȡ�Ŀ������ۡ������������ȥ<color=yellow>����<color>�����������и�����ɫ�Ŀƿ���װ����",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --��λ��¼�Ƿ���ȡ������ ʮλ��¼�Ƿ���ȡ���ƿ���װ
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say("<color=green>��СѾ<color>�� ��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
			return
		end
		local player_sex = GetBody();
		SetTask(ABLUEMOON_COMPENSATION,GetTask(ABLUEMOON_COMPENSATION)+10)
		if player_sex == 1 then
			AddItem(0,109,260,1)  --�Ŀ�������(��) ��׼������
		elseif player_sex == 2 then
			AddItem(0,109,262,1)  --�Ŀ�������(��) ����������
		elseif player_sex == 3 then
			AddItem(0,109,268,1)  --�Ŀ�������(��) �Ը�Ů����
		else
			AddItem(0,109,275,1)  --�Ŀ�������(��) ��СŮ����
		end
		Say("<color=green>��СѾ<color>�� �Ŀ��������ú���������ȥ�����������������䣬���������ˣ�",0)
	else
		Say("<color=green>��СѾ<color>�� ���Ѿ���ȡ���ƿ���װ����ÿ����ֻ����ȡһ�ף��������Ҫ������ɫ����װ������ȥ<color=yellow>����<color>��ѡ��",0)
	end
end
--=====================================================�������=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>ÿ��<color=yellow>��23��00��8��00ʱ�����<color>���Ҷ�����������ڸ�������У����ܴ�ҵ���ս��ÿ��ÿ��ֻ����սһ�Σ�ÿ����Ҫ���Ҳ�ȭ�����ݲ�ȭ��ʤ�Ĵ�������",
		"Ժ����Ŀ����Ŀ��Ժ�Դ��5�����ϵĻ����Խ������ԡ����Ե�������Ժ����ȷ���������������Դ��5�����ϵĻ�����֤�鷢�š�",
		--������������Ӿ���
	}
	local szSay = "";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say("<color=green>��СѾ<color>�������������ġ���"..szSay,0)
end

tShengwang = {  --���������³ƺ�
	{-500,"��������"},
	{-100,"�����ǽ�"},
	{0,"ƽ�����"},
	{50,"����һ��"},
	{150,"��������"},
	{300,"����С��"},
	{500,"ĬĬ����"},
	{700,"���Է�â"},
	{1000,"С������"},
	{1500,"����ȵ��"},
	{2250,"��â��¶"},
	{3000,"�����Ժ�"},
	{4500,"�¸�����"},
	{6000,"�������"},
	{9000,"���׹��"},
	{12000,"�������"},
	{15000,"����Ⱥ��"},
	{18000,"һ����ʦ"},
	{22500,"Ц������"},
	{27000,"������˫"},
	{31500,"������"},
	{36500,"��ǰ����"},
	{45000,"������"},
}

tGatherSkill = { "��ľ", "��Ƥ", "�ո�", "��ҩ", "�ڿ�", "��˿", }

tComposeSkill = { "����������", "�̱�������", "���ű�������", "����֯��", "��ҩ", "���", "�Ʒ�", "��װ֯��", "ͷ��֯��",}
