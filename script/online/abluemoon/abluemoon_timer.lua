Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
tNpcWords = {
	"����Ӣ�۳����갡������˫ȫ������������",
	"����������ð����Ǹ�����ͷ��",
	"���뵽����һ�ߣ�����վ��ͬһ���ط�������ȥ̫���ˡ�",
	"����״Ԫ�𣿿������԰ɣ�",
	"�����㿼������",
	"С���ã����ְף���ֻ�������������ı�������ɰ���",
	"����������ʵʵ�����������ף�",
	"�ܲ���óԣ��������ݣ����Ǹ��ö�����",
	"������������Ի�����ʧ�����ǿ��Խ��ſ���Ŷ��",
	"ÿ�춼Ҫ��һ��ѵ�֤������� ���������ˡ���",
}

function OnTimer()
	SetMissionV(MV_TIMER_TIME,GetMissionV(MV_TIMER_TIME)+1) --��ʱ������ʱ��+1
	if mod(GetMissionV(MV_TIMER_TIME),30) == 0 then
		if random(2) > 1 then
			NpcChat(GetMissionV(10),tNpcWords[random(getn(tNpcWords))])
		end
	end
	if GetMissionV(MV_TIMER_TIME) == (TIMER_TOTAL_TIME - 15*60) then  --NPC��ʧ15����ǰֹͣ����
		SetMissionV(MV_TIMER_IDEL,1)
		Msg2SubWorld("��СѾ����15���Ӿ�Ҫ�����������������Ѿ�ֹͣ���ܿƿ�����������ץ���´λ��ᣡ")
	elseif GetMissionV(MV_TIMER_TIME) >= TIMER_TOTAL_TIME then
		WriteLog("[�ƿ�ͳ��]���Сʱ�ڲμӸ߾��鿼�Ե�����Ϊ"..GetMissionV(MV_COUNT_PAY).."��,���ĺ��ܲ�����Ϊ"..GetMissionV(MV_COUNT_LUOBO).."��!")
		CloseMission(MISSION_ID)
	else
		local idx = 0;
		for i = 1, 200 do
			idx, pidx = GetNextPlayer(MISSION_ID, idx, 1);
				if pidx > 0 then
					PlayerIndex = pidx;
					if GetTask(ABLUEMOON_STATE) == 1 then
						local RestTime = ABLUEMOON_TIME - (GetGameTime() - GetTask(ABLUEMOON_TIMER))
						if RestTime > 10 then
							if mod(RestTime,10) == 0 then
								Msg2Player("["..RestTime.."/60]--����ʱ")
							end
						elseif RestTime > 0 then
							Msg2Player("["..RestTime.."/60]--����ʱ")
						else
							Msg2Player("����ʱ�䵽��")
							SetTask(ABLUEMOON_STATE,3) --����ʧ��
						end
					end
				end;
			if idx == 0 then
				break;
			end;
		end
	end
end