--08���ڰ������ű�
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	local nDate = floor((GetTime()+28800)/86400);
	local nTime = tonumber(date("%Y%m%d"));
	if nTime > 20080218 then
		nDate = floor((MkTime(2008,2,18)+28800)/86400);
	end	
	local nStartDate = floor((MkTime(2008,1,28)+28800)/86400);
	local nDay = nDate-nStartDate;
	local nNum = nDay - GetTask(TASK_WIND_NUM);
	if nNum <= 0 then
		Talk(1,"","<color=green>Thi�p ch�c t�t<color>: D�ng thi�p ch�c t�t �� nh�n ph�n th��ng nhi�m v� ch�c t�t. B�n �� nh�n ph�n th��ng ch�c t�t hi�n t�i");
		return
	else	
		Say("<color=green>Thi�p ch�c t�t<color>: D�ng thi�p ch�c t�t �� nh�n ph�n th��ng nhi�m v� ch�c t�t. Ho�t ��ng l�n n�y b�n �� nh�n <color=yellow>"..GetTask(TASK_WIND_NUM).." <color> l�n ph�n th��ng ch�c t�t, b�n c�n <color=yellow>"..nNum.." <color> l�n ph�n th��ng ch�c t�t ch�a nh�n. B�n mu�n nh�n?",
			2,
			"Ta mu�n nh�n/buling_use_jungong",
			"T�m th�i kh�ng d�ng/nothing")
	end
end

--function confirm_buling_bainian()
--	local nLv = GetLevel();
--	local nExp = floor(6000000*nLv^2/80^2);
--	local nTianshiNum = 15; --��ʱע��������99�����
--	if nLv == 99 then
--		Say("<color=green>������<color>��ʹ�ð��������Ի��<color=yellow>"..nTianshiNum.."<color>����ʱע���Լ�<color=yellow>600<color>�������Ƿ�ʹ�þ���������߻�õľ����أ�",
--			5,
--			"�Ҳ�Ҫʹ�þ�����(600����)/#buling_use_jungong(0)",
--			"��Ҫʹ�����������£�1600������/#buling_use_jungong(1)",
--			"��Ҫʹ������������£�4000������/#buling_use_jungong(2)",
--			"��Ҫʹ�������Ի;����£�8000������/#buling_use_jungong(3)",
--			"�ݲ���ȡ����/nothing");
--	else
--		Say("<color=green>������<color>��ʹ�ð��������Ի��<color=yellow>"..nExp.."<color>�����Լ�<color=yellow>600<color>�������Ƿ�ʹ�þ���������߻�õľ����أ�",
--			5,
--			"�Ҳ�Ҫʹ�þ�����(600����)/#buling_use_jungong(0)",
--			"��Ҫʹ�����������£�1600������/#buling_use_jungong(1)",
--			"��Ҫʹ������������£�4000������/#buling_use_jungong(2)",
--			"��Ҫʹ�������Ի;����£�8000������/#buling_use_jungong(3)",
--			"�ݲ���ȡ����/nothing");
--	end			
--end

function buling_use_jungong()
	local nJungong = GetTask(701); --��ҵ�ǰ��������Ϊ�Σ���Ϊ��
	local nGetJungong = 600; --��õľ���
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nTianshiNum = 15; --��ʱע��������99�����
	
	if nLv == 99 then
		if Zgc_pub_goods_add_chk(1,15) ~= 1 then
			return
		end
	end
	
--	if nType == 1 then
--		if GetItemCount(2,1,9999) < 2 then
--			Talk(1,"","<color=green>����ʹ��<color>����û���㹻�ľ�����Ŷ��");
--			return
--		else
--			if DelItem(2,1,9999,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*2;
--				else
--					nGetJungong = -800*2;
--				end
--			end
--		end
--	elseif nType == 2 then
--		if GetItemCount(2,1,9998) < 2 then
--			Talk(1,"","<color=green>����ʹ��<color>����û���㹻�Ĵ������Ŷ��");
--			return
--		else
--			if DelItem(2,1,9998,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*5;
--				else
--					nGetJungong = -800*5;
--				end
--			end
--		end
--	elseif nType == 3 then
--		if GetItemCount(2,1,9977) < 2 then
--			Talk(1,"","<color=green>����ʹ��<color>����û���㹻�ĻԻ;�����Ŷ��");
--			return
--		else
--			if DelItem(2,1,9977,2) == 1 then
--				if nJungong >= 0 then
--					nGetJungong = 800*10;
--				else
--					nGetJungong = -800*10;
--				end
--			end
--		end
--	end	

	if nJungong >= 0 then
		nGetJungong = 600;
	else
		nGetJungong = -600;
	end

	if DelItem(2,1,3207,1) == 1 then
		SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
	
		SetTask(701,nJungong+nGetJungong);
		if nJungong >= 0 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nGetJungong.."C�ng tr�ng");
		else
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..-nGetJungong.."C�ng tr�ng");
		end
		
		if nLv == 99 then
			AddItem(2,1,3210,nTianshiNum);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nTianshiNum.."Thi�n Th�i Ch� Gi�i.");
		else
			ModifyExp(nExp);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
		end	
	end	
end