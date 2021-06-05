--08��������ʹ�߽ű�
--by vivi
--2007/11/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		local strtab = {
			"N�m m�i ch�c t�t/wind_action",
			"Thu th�p �� c�/guwan_collect",
			"Nh�n h�ng bao n�m m�i/about_hongbao",
			"Nh�n h��ng d�n ho�t ��ng/get_action_manual",
			"Ta ch� ��n xem th�/nothing"
			};
		Say("H� th�ng �� chu�n b� nhi�u l� h�i m�a xu�n, tham gia th� xem.",
			getn(strtab),
			strtab);
	else
		Talk(1,"","N�m m�i, ch�c m�i ng��i V�n S� Nh� �.");
	end
end

function wind_action()
	local strtab = {
		"Ta mu�n ch�c t�t m�i ng��i/battle_is_finish"
		};
	if GetTask(TASK_WIND_ID) ~= 0 then
		tinsert(strtab,"Ta �� ch�c t�t t�t c� m�i ng��i./finish_wind_task");
		tinsert(strtab,"Phi�n ph�c qu�. Ta kh�ng mu�n ch�c t�t/giveup_wind_task");
	end	
	tinsert(strtab,"Thuy�t minh v� ph�n th��ng nhi�m v�/about_wind_task");
	tinsert(strtab,"Ta mu�n tham gia h�a ��ng ��/main");
	Say("M�i khi n�m m�i ��n, c� kh�ng �t ng��i tronh th�nh s�ng ��n ��c, c�c b�n �i ch�c t�t h� s� khi�n h� c�m nh�n ���c ni�m vui t�t ��n. H� th�ng c� nhi�u qu� t�ng. Ch� �, t� 9: 00 h� th�ng b�t ��u g�i l�nh ch�c t�t nh�ng ng��i ��, n�a ti�ng g�i 1 l�n ��n 23:00 t�i! Ng��i ��n nhanh s� c� ph�n th��ng ��c bi�t. \n Ch� �: ph�n th��ng g�m c� <color=yellow>ph�n th��ng qu�n c�ng<color>, ng��i ho�n th�nh nhi�m v� n�y s� <color=yellow>kh�ng th� nh�n ph�n th��ng chi�n tr��ng<color>.",
		getn(strtab),
		strtab);
end

function battle_is_finish()
	local nWindDate = tonumber(date("%y%m%d"));
	local nState = getwindstate();
	local nLv = GetLevel();
	if nState ~= 1 then
		Talk(1,"","Ch�a h�t th�i gian, ��ng n�n n�ng!");
		return
	end
	if nLv <= 10 then
		Talk(1,"","B�n c�n ph�i h�c h�i nhi�u tr�n giang h�.");
		return
	end	
	if nWindDate > GetTask(761) then
		SetTask(760,0);
	end;
	if GetTask(760) > 0 then
		Talk(1,"","H�m nay b�n �� nh�n ph�n th��ng chi�n tr��ng, kh�ng th� nh�n th�m nhi�m v� ch�c t�t c�a ng�y h�m nay.");
		return	
	else
		get_wind_task();
	end
end

function get_wind_task()
	local nMapId = GetWorldPos();	
	local nState,nWindStep = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_WIND_DATE) >= nWindDate then
		Talk(1,"","H�m nay b�n �� gi�p m�i ng��i ch�c t�t.");
		return
	end		 
	if nState ~= 1 or nWindStep > nActionStep then
		Talk(1,"","Ch�a h�t th�i gian, ��ng n�n n�ng!");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --ɾ��������
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B�n ch�a ho�n th�nh nhi�m v�, c� th� ti�p nh�n l�i nhi�m v� ch�c t�t.");		
		return
	end	
	if GetTask(TASK_WIND_ID) > 0 then
		Talk(1,"","Ng��i c� ph�i �� nh�n nhi�m v� ch�c t�t?");
		return
	end
	
	local nRand = random(1,getn(tWindNpc[nMapId][2]));
	if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
		WriteLog("[Ho�t ��ng n�m m�i 08, k�t n�i npc b� l�i]: Ng��i ch�i"..GetName().."Thi�t l�p k�t n�i npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) �� th�t b�i, tr� WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". Tr� tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
		return 0;	--����ʧ��
	end;	
	SetTask(TASK_WIND_ID,nActionStep);
	SetTask(TASK_WIND_POS,nMapId);
	SetTask(TASK_WIND_STEP,1);
	SetTask(TASK_WIND_TABLE_IDX,nRand); 
	Talk(1,"","T�t, ��y l� b��c th� nh�t, <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."<color> n�m nay ��n t�t m�t m�nh trong th�nh, ng��i �i ch�c t�t huynh �y �i. Ti�n th� h�i huynh �y xem c�n ai ��n t�t m�t m�nh kh�ng, ch�ng ta c�ng �i ch�c t�t!")
	Msg2Player("B�n �� nh�n 1 nhi�m v� ch�c t�t, ch�c "..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Ch�c t�t.");
end

function finish_wind_task()
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nState = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nTianshiNum = 15; --��ʱע��������99�����
	local nWindDate = tonumber(date("%Y%m%d"));
		
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ng��i kh�ng nh�n nhi�m v� ch�c t�t t�i ��y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --ɾ��������
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B�n ch�a ho�n th�nh nhi�m v�, c� th� ti�p nh�n l�i nhi�m v� ch�c t�t.");		
		return
	end
	if nStep <= WIND_STEP_TOTAL then
		Talk(1,"","Ng��i kh�ng ph�i ��n ch�c t�t <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nIdx].."<color> sao? C� chi l�i quay v�?");
	else
		if GetTask(760) > 0 then 
			SetTask(TASK_WIND_ID,0);
			SetTask(WIND_STEP_TOTAL,0);
			SetTask(TASK_WIND_POS,0);
			SetTask(TASK_WIND_TABLE_IDX,0);
			SetTask(TASK_WIND_RAND,0);
			SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
			SetTask(TASK_WIND_FINISH,nActionStep);
			SetTask(TASK_WIND_DATE,nWindDate);			
			Talk(1,"","R�t t�t, ng��i �� ch�c t�t t�t c� m�i ng��i v� nh�n ph�n th��ng chi�n tr��ng n�n h�m nay kh�ng ���c l�nh th��ng, ng�y mai h�y l�m ti�p nh�!");
			return
		end   
    if GetTask(TASK_WIND_RAND) == 0 then
    	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);
    	SetTask(TASK_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND));    	
    end
    local nNum = GetTask(TASK_WIND_RAND);
    if nNum == 1 then	
    	nExp = nExp*2;
    	nTianshiNum = nTianshiNum*2;
			Msg2SubWorld(GetName().."Ng��i ��u ti�n ��n ch�c t�t ng��i c� ��n s� nh�n ���c ph�n th��ng g�p ��i (kh�ng bao g�m qu�n c�ng). ");    	
    elseif nNum >= 2 and nNum <= 5 then
    	nExp = floor(nExp*1.6);
    	nTianshiNum = nTianshiNum*1.5;
			Msg2SubWorld(GetName().."Ng��i l� ng��i th� "..nNum.." ch�c t�t ng��i c� ��n, ���c nh�n ph�n th��ng g�p 1.6 l�n (kh�ng bao g�m qu�n c�ng). ");    
    elseif nNum >=6 and nNum <= 10 then
    	nExp = floor(nExp*1.2);
    	nTianshiNum = nTianshiNum*1.2
    end
    if nLv == 99 then
	    Say("Ng��i �� ch�c t�t xong, ng��i l� ng��i th� <color=yellow>"..nNum.."<color> ho�n th�nh nhi�m v� n�y. Ta s� th��ng cho ng��i <color=yellow>"..nTianshiNum.."<color> quy�n Thi�n Th�i Ch� Gi�i v� <color=yellow>600 qu�n c�ng<color>. ng��i c� th� d�ng <color=yellow>qu�n c�ng ch��ng<color> �� t�ng nh�n qu�n c�ng. Ng��i h�y s�n s�ng nh�n th��ng. Ng��i c�ng c� th� h�y nhi�m v� l�n n�y v� th�c hi�n nhi�m v� n�y sau. ",
	    	2,
	    	"Ta �� s�n s�ng nh�n th��ng /is_use_jungong",
	    	"Ta ch�a s�n s�ng nh�n th��ng /nothing");    
    else
	    Say("Ng��i �� ch�c t�t xong, ng��i l� ng��i th� <color=yellow>"..nNum.."<color> ho�n th�nh nhi�m v� n�y. Ta s� th��ng cho ng��i <color=yellow>"..nExp.."<color> �i�m kinh nghi�m v� <color=yellow>600 qu�n c�ng<color>. ng��i c� th� d�ng <color=yellow>qu�n c�ng ch��ng<color> �� t�ng nh�n qu�n c�ng. Ng��i h�y s�n s�ng nh�n th��ng. Ng��i c�ng c� th� h�y nhi�m v� l�n n�y v� th�c hi�n l�i sau.",
	    	2,
	    	"Ta �� s�n s�ng nh�n th��ng /is_use_jungong",
	    	"Ta ch�a s�n s�ng nh�n th��ng /nothing");
	  end
  end
end

function is_use_jungong()
	Say("C� d�ng qu�n c�ng ch��ng �� t�ng th��ng qu�n c�ng kh�ng?",
		5,
		"Ta kh�ng d�ng qu�n c�ng ch��ng (600 qu�n c�ng)/#confirm_get_final(0)",
		"Ta d�ng 2 qu�n c�ng ch��ng (1600 qu�n c�ng)/#confirm_get_final(1)",
		"Ta d�ng 2 ��i qu�n c�ng ch��ng (4000 qu�n c�ng)/#confirm_get_final(2)",
		"Ta d�ng 2 huy ho�ng qu�n c�ng ch��ng (8000 qu�n c�ng)/#confirm_get_final(3)",
		"T�m th�i kh�ng l�nh/nothing");
end    
    
function confirm_get_final(nType)
	local nJungong = GetTask(701); --��ҵ�ǰ��������Ϊ�Σ���Ϊ��
	local nGetJungong = 600; --��õľ���
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nNum = GetTask(TASK_WIND_RAND);
	local nState = getwindstate();  
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	local nTianshiNum = 15; --��ʱע��������99�����
	
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ng��i kh�ng nh�n nhi�m v� ch�c t�t t�i ��y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","Ng��i kh�ng ��n nh�n th��ng trong th�i gian quy ��nh n�n b� h�y ph�n th��ng, ng��i c� th� nh�n nhi�m v� ch�c t�t kh�c.");		
		return
	end
	
	if nLv == 99 then
		if Zgc_pub_goods_add_chk(1,15) ~= 1 then
			return
		end
	end
	
	if nType == 1 then
		if GetItemCount(2,1,9999) < 2 then
			Talk(1,"","Ng��i kh�ng �� qu�n c�ng ch��ng. ");
			return
		else
			if DelItem(2,1,9999,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*2;
				else
					nGetJungong = -800*2;
				end
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,9998) < 2 then
			Talk(1,"","Ng��i kh�ng �� ��i qu�n c�ng ch��ng. ");
			return
		else
			if DelItem(2,1,9998,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*5;
				else
					nGetJungong = -800*5;
				end
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,9977) < 2 then
			Talk(1,"","Ng��i kh�ng �� huy ho�ng qu�n c�ng ch��ng. ");
			return
		else
			if DelItem(2,1,9977,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*10;
				else
					nGetJungong = -800*10;
				end
			end
		end
	else
		if nJungong >= 0 then
			nGetJungong = 600;
		else
			nGetJungong = -600;
		end		
	end	
 
  if nNum == 1 then	
  	nExp = nExp*2;
  	nTianshiNum = nTianshiNum*2;
  elseif nNum >= 2 and nNum <= 5 then
  	nExp = floor(nExp*1.6);
  	nTianshiNum = nTianshiNum*1.6;
  elseif nNum >=6 and nNum <= 10 then
  	nExp = floor(nExp*1.2);
  	nTianshiNum = nTianshiNum*1.2;
  end	

	SetTask(TASK_WIND_ID,0);
	SetTask(WIND_STEP_TOTAL,0);
	SetTask(TASK_WIND_POS,0);
	SetTask(TASK_WIND_TABLE_IDX,0);
	SetTask(TASK_WIND_RAND,0);
	SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
	SetTask(TASK_WIND_FINISH,nActionStep);
	SetTask(TASK_WIND_DATE,nWindDate);
--  	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);

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
	
	if nNum == 1 then		
		Talk(1,"","Ng��i l� ng��i ��u ti�n ch�c t�t t�t c� m�i ng��i, th�t ��ng khen, c� g�ng ph�t huy nh�. ");
	elseif nNum >= 2 and nNum <=5 then		
		Talk(1,"","T�t, ng��i l� ng��i th� "..nNum.." ch�c t�t t�t c� m�i ng��i, th�t ��ng khen, c� g�ng ph�t huy nh�. "); 
	elseif nNum >=6 and nNum <= 10 then
		Talk(1,"","T�t, ng��i l� ng��i th� "..nNum.." ch�c t�t t�t c� m�i ng��i, th�t ��ng khen, c� g�ng ph�t huy nh�. "); 	
	else
		Talk(1,"","Gi�i, ng��i �� ch�c t�t t�t c� m�i ng��i, ph�n th��ng c�a ng��i ��y. ");
	end	 			
end   

function giveup_wind_task()
	Talk(1,"","N�u kh�ng mu�n ti�p t�c ch�c t�t c�ng kh�ng n�n b� cu�c gi�a ch�ng, nhi�m v� ch�c t�t s� t� h�y n�u c� nhi�m v� kh�c. ");
end

--function confirm_giveup_wind()
--	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --ɾ��������
--	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
--	local nWindDate = tonumber(date("%Y%m%d"));
--	SetTask(TASK_WIND_ID,0);
--	SetTask(WIND_STEP_TOTAL,0);
--	SetTask(TASK_WIND_POS,0);
--	SetTask(TASK_WIND_TABLE_IDX,0);
--	SetTask(TASK_WIND_FINISH,nActionStep);
--	SetTask(TASK_WIND_DATE,nWindDate);
--	SetTask(TASK_WIND_RAND,0);
--	Talk(1,"","<color=green>����ʹ��<color>��������˱��εķ�ý����ϣ���Ժ����ٽ�������");	
--end

function about_wind_task()
	local strtab = {
		"H��ng d�n ho�t ��ng/about_wind_action",
		"Thuy�t minh ph�n th��ng/about_wind_award",
		"Ch� xem th�!/nothing"
		};
	Say("Ng��i mu�n bi�t v� v�n �� g�?",
		getn(strtab),
		strtab);
end

function about_wind_action()
	Talk(1,"about_wind_action2","S� gi� n�m m�i: 9:00 s�ng h�ng ng�y ta s� c�ng b� nhi�m v� ch�c t�t, ng��i ch�i c�p 10 c� th� ��n ch� ta l�nh th��ng. Ta s� ch� ��nh ng��i ph�i ��n ch�c t�t, ng��i �� s� ch� d�n ng��i ��n ch�c t�t ng��i ti�p theo, khi ch�c t�t xong t�t c� m�i ng��i, h�y quay v� ch� n�y x�c nh�n v� l�nh th��ng. ");
end	

function about_wind_action2()
	Talk(1,"about_wind_task","Ph�n th��ng: \n Sau khi ch�c t�t t�t c� m�i ng��i, h�y ��n ��y l�nh th��ng. Ch� �: ng��i ��u ti�n ho�n th�nh nhi�m v� s� ���c th��ng g�p ��i, t� ng��i th� 2 ��n th� 5 s� d��c th��ng g�p 1.6, t� ng��i th� 6 ��n ng��i th� 10 ���c th��ng g�p 1.2. \n N�u kh�ng h�i l�ng v�i x�p h�ng ch�c t�t l�n n�y, c� th� kh�ng giao n�p nhi�m v� v� tham gia l�i v�o l�n sau, nh�ng khi �� nh�n th��ng th� h�m �� kh�ng ���c tham gia n�a. \ N�u kh�ng mu�n ti�p t�c ch�c t�t n�a, c�ng kh�ng n�n b� cu�c gi�a ch�ng, nhi�m v� ch�c t�t s� t� h�y n�u c� nhi�m v� kh�c.");
end

function about_wind_award()
	Talk(1,"about_wind_task","Ph�n th��ng ch�c t�t r�t phong ph�, ta s� th��ng kinh nghi�m c� b�n v� qu�n c�ng.\n �i�u c�n ch� � l� sau khi nh�n th��ng th� <color=yellow>kh�ng th� nh�n ph�n th��ng chi�n tr��ng trong ng�y �� n�a<color>. \nT�t c� ph�n th��ng ��u c�n c� v�o ��ng c�p c�a ng��i. \nN�u kh�ng c� th�i gian ch�c t�t c� th� �i mua thi�p ch�c t�t, v� c� th� nh�n ngay ph�n th��ng, tuy nhi�n ph�n th��ng kh�ng nhi�u, nhi�m v� ch�c t�t h�m nay c� th� d�ng 1 thi�p ch�c t�t �� ho�n th�nh. Ng��i c� m�y ng�y ch�a ho�n th�nh nhi�m v� th� s� d�ng b�y nhi�u thi�p ch�c t�t. ");
end

function who_is_hero()
	local strtab = {
		"Nh�n b�a �n t�t ni�n/get_hero_drink",
		"H��ng d�n ho�t ��ng v� ph�n th��ng/about_hero_drink",
		"Ch� xem th�!/nothing"
		}
	Say("Ta �� ��t ti�c chi�u ��i ch� v� anh h�ng h�o h�n t�i �� Nh�t L�u v�o ��m giao th�a, m�i ch� v� ��n tham gia.",
		getn(strtab),
		strtab)	
end

function get_hero_drink()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_DRINK) >= nDate then
		Talk(1,"","Ta ch� chu�n b� cho m�i v� m�t ph�n, kh�ng th� nh�n th�m.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local Add_flag = AddItem(0,0,1,1); --��ҹ������
	if Add_flag == 1 then
		SetTask(TASK_GET_DRINK,nDate);
		Talk(1,"","��y l� ��n ��t ti�c c�a ng��i, h�y �i c�ng v�i nh�m b�n v� s� d�ng ��n ��t ti�c n�y.");
	end
end

function about_hero_drink()
	Talk(1,"who_is_hero","T�o th�nh t� ��i v�i b�ng h�u r�i s� d�ng ��n ��t ti�c, t� m�t ��t s� xu�t hi�n b�n ti�c do �� Nh�t L�u mang ��n, c�c v� trong bu�i ti�c s� nh�n ���c ph�n th��ng. \nNg��i trong t� ��i c�ng s� d�ng nhi�u ��n ��t ti�c th� c�ng nh�n ���c nhi�u qu�, nhi�u nh�t l� s� d�ng c�ng l�c <color=yellow>8 ��n ��t ti�c<color>, s� nh�n ���c b�a ti�c th�nh so�n. \nN�i dung ph�n th��ng: \nSau m�t kho�ng th�i gian ng�i t�i b�n ti�c s� nh�n ���c kinh nghi�m, c�ch 5 ph�t s� d�n l�n m�n s�i c�o 1 l�n. \n�n s�i c�o s� nh�n ���c kinh nghi�m. \n1 B�a ti�c c� th� k�o d�i 12 ph�t. ");
end

--������ռ�
function guwan_collect()
	local strtab = {
				"D�ng nh�ng m�nh v� gh�p l�i th�nh �� c�/suipian_cube_guwan",
				"Ta mu�n d�ng �� c� ��i ph�n th��ng v�i ng��i/guwan_change_award",
				"H��ng d�n quy t�c thu gom �� c�/about_guwan_collect",
				"Ch� xem th�!/nothing"
				};
	Say("Ta mu�n t�ng 1 m�n �� c� cho b�ng h�u ta, nh�ng v�n ch�a t�m ���c m�n �� �ng �, n�u ng��i c�, ta s� tr�ng tr�ng c� th��ng. �� c� kh�ng nh� nh�ng �� v�t kh�c, tuy ch� v�i m�nh v�n nh�ng v�n c� gi� tr� r�t cao, ng��i c� th� ��a cho ta th�nh ph�m ho�c b�n th�nh ph�m c�ng ���c.",
		getn(strtab),
		strtab); 
end

function suipian_cube_guwan()
	local strtab = {
				"Ta ph�i d�ng m�nh ��ng c�p 2 �� h�p th�nh m�nh ��ng c�p 1/cube_input_num",
				"Ta ph�i d�ng m�nh ��ng c�p 1 v� ph� ki�n Thanh ��ng ��nh c�p 4 h�p th�nh Thanh ��ng ��nh c�p 4/#ask_is_cube(2)",
				"Ta ph�i d�ng Thanh ��ng ��nh c�p 4 v� ph� ki�n Thanh ��ng ��nh c�p 3 h�p th�nh Thanh ��ng ��nh c�p 3/#ask_is_cube(3)",
				"Ta ph�i d�ng Thanh ��ng ��nh c�p 3 v� ph� ki�n Thanh ��ng ��nh c�p 2 h�p th�nh Thanh ��ng ��nh c�p 2./#ask_is_cube(4)",
				"Ta ph�i d�ng Thanh ��ng ��nh c�p 2 v� ph� ki�n Thanh ��ng ��nh c�p 1 h�p th�nh Thanh ��ng ��nh c�p 1/#ask_is_cube(5)",
				"Ch�n sai r�i, tr� l�i/guwan_collect",
				"Ta s� quay l�i l�m sau/nothing"
				};
	Say("Kh�ng bi�t ng��i ��nh d�ng m�nh n�o th� h�p th�nh!",
		getn(strtab),
		strtab);	
end

function cube_input_num()
	local nNum = floor(GetItemCount(2,1,3212)/5);
	if nNum < 1 then
		Talk(1,"","<color=yellow>5<color> m�nh ��ng h�p th�nh <color=yellow>1<color>m�nh ��ng c�p 1, ng��i kh�ng �� m�nh ��ng c�p 2. ");
		return
	else
		AskClientForNumber("confirm_cube_erjitongqi",1,tonumber(nNum)," Ng��i mu�n ��i m�nh ��ng c�p 1 v�i gi� bao nhi�u?")
	end
end

function confirm_cube_erjitongqi(nNum)
	local nDelNum = nNum*5;
	if GetItemCount(2,1,3212) < nDelNum then
		Talk(1,"","Ng��i kh�ng c� �� m�nh ��ng c�p 2. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,nNum) ~= 1 then
		return
	end
	if DelItem(2,1,3212,nDelNum) == 1 then
		AddItem(2,1,3211,nNum);
		Msg2Player("Ch�c m�ng b�n �� ��i m�nh ��ng c�p 2 th�nh c�ng!");
		Talk(1,"","Ch�c m�ng ng��i �� ��i m�nh ��ng c�p 2 th�nh c�ng. ");	
	end	
end

function ask_is_cube(nType)
	if nType == 1 then
		return
	else
		local strtab = {
			"Ta mu�n ��i 1 "..tTingTong[nType][11].."/#confirm_cube(1,"..nType..")",
			"Ta mu�n ��i 10 "..tTingTong[nType][11].."/#confirm_cube(10,"..nType..")"			
			};
		if nType ~= 5 then
			tinsert(strtab,"Ta mu�n ��i 50 "..tTingTong[nType][11].."/#confirm_cube(50,"..nType..")");
			tinsert(strtab,"Ta mu�n ��i 500 "..tTingTong[nType][11].."/#confirm_cube(500,"..nType..")");
		end
		tinsert(strtab,"Ch�n sai r�i, tr� l�i/suipian_cube_guwan");
		tinsert(strtab,"Ta s� quay l�i l�m sau/nothing");
		Say("��i quy t�c th�nh <color=yellow>"..tTingTong[nType][2].."c�i"..tTingTong[nType][1].." v�"..tTingTong[nType][7].."c�i"..tTingTong[nType][6].."<color> h�p th�nh <color=yellow>"..tTingTong[nType][12].."c�i"..tTingTong[nType][11].."<color>. M�i l�n ��i ng��i c� <color=yellow>"..tTingTong[nType][16].."%<color> x�c su�t th�nh c�ng, n�u th�t b�i, ng��i s� m�t t�t c� �� v�t. Ng��i mu�n ��i bao nhi�u?",
				getn(strtab),
				strtab);
	end
end

function confirm_cube(nNum,nType)
	local nRequestNumOne = tTingTong[nType][2]*nNum;
	local nRequestNumTwo = tTingTong[nType][7]*nNum;
	local nNeedNum = tTingTong[nType][12]*nNum;
	if GetItemCount(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5]) < nRequestNumOne then
		Talk(1,"","H�nh trang c�a ng��i ch�a �� "..tTingTong[nType][1]..". ");
		return
	end
	if nType ~= 1 then
		if GetItemCount(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10]) < nRequestNumTwo then
			Talk(1,"","H�nh trang c�a ng��i ch�a �� "..tTingTong[nType][6]..". ");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		return
	else
		if DelItem(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5],nRequestNumOne) == 1 and DelItem(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10],nRequestNumTwo) == 1 then
			local nSuccNum = 0; --�ɹ��һ�����
			for i = 1,nNeedNum do 
				local nRand = random(1,100);
				if nRand <= tTingTong[nType][16] then
					local add_flag = AddItem(tTingTong[nType][13],tTingTong[nType][14],tTingTong[nType][15],tTingTong[nType][12]);			
					if add_flag == 1 then
						nSuccNum = nSuccNum+1;
						if nType == 4 or nType == 5 then
							WriteLog("Ho�t ��ng m�a xu�n ��i Thanh ��ng ��nh: "..GetName().."��i"..tTingTong[nType][11].."Th�nh c�ng.");
						end
					else
						WriteLog("Ho�t ��ng m�a xu�n ��i Thanh ��ng ��nh: "..GetName().."��i"..tTingTong[nType][11].." th�t b�i, v� tr� th�t b�i:"..add_flag);
					end
				end
			end
			if nSuccNum ~= 0 then
				if nNeedNum ~= 1 then
					Msg2Player("Ch�c m�ng b�n �� ��i "..tTingTong[nType][11].." th�nh c�ng!");
					Talk(1,"","Ch�c m�ng ng��i nh�n ���c <color=yellow>"..(tTingTong[nType][12]*nSuccNum).."c�i"..tTingTong[nType][11].."<color>. Ng��i ��i "..tTingTong[nType][11].." th�nh c�ng <color=yellow>"..nSuccNum.."<color> l�n, th�t b�i "..(nNeedNum-nSuccNum).." l�n.");	
				else
					Msg2Player("Ch�c m�ng b�n �� ��i "..tTingTong[nType][11].." th�nh c�ng!");
					Talk(1,"","Ch�c m�ng ng��i �� ��i "..tTingTong[nType][11].."Th�nh c�ng.");					
				end
			else
				Talk(1,"","Kh�ng th�nh c�ng, th� l�i nh�!");
			end			
		else
			Talk(1,"","Trogn h�nh trang c�a ng��i kh�ng �� v�t li�u h�p th�nh.");
		end
	end
end

function guwan_change_award()
	local strtab = {		
			"Ta c� th� ��i ph�n th��ng n�o/about_guwan_award",
			"Ta ph�i d�ng m�nh ��ng c�p 1 ��i ph�n th��ng/#ask_is_change(1)",
			"Ta ph�i d�ng Thanh ��ng ��nh c�p 4 ��i ph�n th��ng/#ask_is_change(2)",
			"Ta ph�i d�ng Thanh ��ng ��nh c�p 3 ��i ph�n th��ng/#ask_is_change(3)",
			"Ta ph�i d�ng Thanh ��ng ��nh c�p 2 ��i ph�n th��ng/#ask_is_change(4)",
			"Ta ph�i d�ng Thanh ��ng ��nh c�p 1 ��i ph�n th��ng/#ask_is_change(5)",
			"Ta ph�i d�ng 2000 m�nh ��ng ��i ph�n th��ng/#ask_is_change(6)",
			"T�m th�i kh�ng ��i ph�n th��ng	/nothing"
			};
	Say("Ng��i ��nh ��i ph�n th��ng g�?",
		getn(strtab),
		strtab);
end

function about_guwan_award()
	Talk(1,"guwan_change_award","M�nh ��ng c�p 1: c� th� ��i 1 �t kinh nghi�m, m�i ng��i c� th� nh�n t�ng c�ng 1000 l�n. \nThanh ��ng ��nh c�p 4: ��i Thi�n Th�i Ch� Gi�i, m�i ng��i c� th� nh�n t�ng c�ng 100 l�n. \nThanh ��ng ��nh c�p 3: ��i 1 Nguy�t Hoa 1 ho�c t�y � 1 quy�n sinh ho�t k� n�ng. \nThanh ��ng ��nh c�p 2: ��i 1 tinh Nguy�t Hoa? (120 linh kh� th��ng h�n v�t ph�m) ho�c t�y � 1 quy�n sinh ho�t k� n�ng ph�i ph��ng. \nThanh ��ng ��nh c�p 1: ��i trang b� Thi�n ��a Huy�n Ho�ng. \n2000 m�nh ��ng: ��i trang b� Thi�n ��a Huy�n Ho�ng. ");
end

function ask_is_change(nType)
	local nLv = GetLevel();
	local nExp = nLv^2;
	if nType == 1 then
		if nLv == 99 then
			Say("D�ng m�nh ��ng c�p 1 c� th� ��i <color=yellow>50 �i�m<color> Danh v�ng, ��i kh�ng? M�i ng��i c� th� nh�n t�ng c�ng 1000 l�n. ",
				3,
				"Ta mu�n ��i 1 m�nh ��ng c�p 1/#change_yijisuipian(1)",
				"Ta mu�n ��i 50 m�nh ��ng c�p 1/#change_yijisuipian(50)",
				"Kh�ng, ta nh�m!/guwan_change_award");
		else	
			Say("D�ng m�nh ��ng c�p 1 c� th� ��i <color=yellow>"..nExp.."<color> kinh nghi�m, ��i kh�ng? M�i ng��i c� th� nh�n t�ng c�ng 1000 l�n. ",
				3,
				"Ta mu�n ��i 1 m�nh ��ng c�p 1/#change_yijisuipian(1)",
				"Ta mu�n ��i 50 m�nh ��ng c�p 1/#change_yijisuipian(50)",
				"Kh�ng, ta nh�m!/guwan_change_award");
		end
	elseif nType == 2 then
		Say("D�ng Thanh ��ng ��nh c�p 4 c� th� ��i <color=yellow>1 Thi�n Th�i Ch� Gi�i<color>, ��i kh�ng? M�i ng��i c� th� nh�n t�ng c�ng 100 l�n. ",
			2,
			"�, ta mu�n ��i./change_sijiding",
			"Kh�ng, ta nh�m!/guwan_change_award");
	elseif nType == 3 then
		Say("D�ng Thanh ��ng ��nh c�p 3 c� th� ��i <color=yellow>1 Nguy�t Hoa ho�c t�y � 1 quy�n sinh ho�t k� n�ng th��ng h�n<color>, ��i kh�ng? ",
			2,
			"�, ta mu�n ��i./change_sanjiding",
			"Kh�ng, ta nh�m!/guwan_change_award");
	elseif nType == 4 then
		Say("D�ng Thanh ��ng ��nh c�p 2 c� th� ��i <color=yellow>1 tinh Nguy�t Hoa (120 linh kh� th��ng h�n v�t ph�m) ho�c t�y � 1 quy�n sinh ho�t k� n�ng ph�i ph��ng<color>, ��i kh�ng? ",
			2,
			"�, ta mu�n ��i./#change_erjiding(0)",
			"Kh�ng, ta nh�m!/guwan_change_award");
	elseif nType == 5 then
		Say("D�ng Thanh ��ng ��nh c�p 1 c� th� ��i <color=yellow>trang b� Thi�n ��a Huy�n Ho�ng<color>, ��i kh�ng? ",
			2,
			"�, ta mu�n ��i./chang_yijiding",
			"Kh�ng, ta nh�m!/guwan_change_award");
	elseif nType == 6 then
		Say("D�ng 2000 m�nh ��ng c� th� ��i <color=yellow>trang b� Thi�n ��a Huy�n Ho�ng<color>, ��i kh�ng? ",
			2,
			"�, ta mu�n ��i./chang_tongqisuipian",
			"Kh�ng, ta nh�m!/guwan_change_award");
	end					
end

function change_yijisuipian(nNum)
	local nLv = GetLevel();
	local nExp = (nLv^2)*nNum;
	local nRep = 50*nNum;
	if GetItemCount(2,1,3211) < nNum then
		Talk(1,"","Ng��i kh�ng �� m�nh ��ng c�p 1.");
	else
		if GetTask(TASK_TONGQI_AWARD) >= 1000 then
			Talk(1,"","M�i ng��i c� th� ��i t�ng c�ng 1000 l�n, ng��i �� h�t l��t ��i. ");
			return
		end
		if GetTask(TASK_TONGQI_AWARD)+nNum > 1000 then
			Talk(1,"","M�i ng��i c� th� ��i t�ng c�ng 1000 l�n, ng��i kh�ng th� ��i "..nNum.." n�a. ");
			return
		end
		if DelItem(2,1,3211,nNum) == 1 then
			if nLv == 99 then
				ModifyReputation(nRep,0);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Ch�c m�ng ng��i �� ��i th�nh c�ng m�nh ��ng c�p 1, hi�n �� ��i <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> l�n, m�i ng��i c� th� nh�n t�ng c�ng 1000 l�n. ");
			else
				ModifyExp(nExp);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Ch�c m�ng ng��i �� ��i th�nh c�ng m�nh ��ng c�p 1, hi�n �� ��i <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> l�n, m�i ng��i c� th� nh�n t�ng c�ng 1000 l�n. ");
			end
		end
	end
end

function change_sijiding()
	if GetItemCount(2,1,3216) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 4. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if GetTask(TASK_QTD_AWARD) >= 100 then
			Talk(1,"","M�i ng��i c� th� nh�n t�ng c�ng 100 l�n, ng��i �� h�t l��t ��i.");
			return
		end
		if DelItem(2,1,3216,1) == 1 then
			  AddItem(2,1,3210,1);
				SetTask(TASK_QTD_AWARD,GetTask(TASK_QTD_AWARD)+1);
				Msg2Player("Ch�c m�ng ng��i nh�n ���c 1 quy�n Thi�n Th�i Ch� Gi�i.");
				Talk(1,"guwan_change_award","Ch�c m�ng ng��i �� ��i th�nh c�ng Thanh ��ng ��nh c�p 4, hi�n ng��i �� ��i <color=yellow>"..GetTask(TASK_QTD_AWARD).."<color> l�n, m�i ng��i c� th� nh�n t�ng c�ng 100 l�n. ");
		end
	end	
end

function change_sanjiding()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 3. ");
	else
		local strtab = {
			" 1 Nguy�t Hoa/#confirm_change_sanjiding(1)",
			"Thi�n � Ph� (s� d�ng c�p 79 may H� Gi�p gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(2)",
			"Ch�c N� Kinh (s� d�ng c�p 79 may n�n gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(3)",
			"Luy T� T�m Kinh (s� d�ng c�p 79 may h� y gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(4)",
			"�u D� T�y Ch� Kinh (s� d�ng c�p 79 ch� t�o v� kh� ng�n gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(5)",
			"Can T��ng Ch� Kinh (s� d�ng c�p 79 ch� t�o binh kh� d�i gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(6)",
			"Trang k�/change_sanjiding2",
			"T�m th�i kh�ng ��i. /nothing"					
					}
		Say("Xin m�i ch�n ph�n th��ng mu�n ��i. ",
			getn(strtab),
			strtab);
	end	
end

function change_sanjiding2()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 3. ");
	else
		local strtab = {
			"M�c T� Ch� Kinh (s� d�ng c�p 79 ch� t�o binh kh� k� m�n gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(7)",
			"V�n M�c �� (s� d�ng k� n�ng ��n g� c�p 79 gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(8)",
			"V�n Th� Ph� (s� d�ng c�p 79 k� n�ng Thu�c da gi�i h�n t�ng ��n ca61p)/#confirm_change_sanjiding(9)",
			"Ng� T�ng S�n Kinh (s� d�ng c�p 79 k� n�ng ��o kho�ng gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(10)",
			"M� M�u T�m Kinh (s� d�ng c�p 79 k� n�ng k�o t� gi�i h�n t�ng ��n c�p 99)/#confirm_change_sanjiding(11)",
			"Trang tr��c/change_sanjiding",
			"T�m th�i kh�ng ��i. /nothing"					
					}
		Say("Xin m�i ch�n ph�n th��ng mu�n ��i. ",
			getn(strtab),
			strtab);
	end	
end

function confirm_change_sanjiding(nType)
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 3. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if DelItem(2,1,3215,1) == 1 then
			AddItem(tSanjiAward[nType][2],tSanjiAward[nType][3],tSanjiAward[nType][4],1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tSanjiAward[nType][1]);
			Talk(1,"guwan_change_award","Ch�c m�ng ng��i ��i th�nh c�ng Thanh ��ng ��nh c�p 3, nh�n ���c "..tSanjiAward[nType][1]..".");
		end
	end		
end

function change_erjiding(nPage)	
	local nPageNum = 7;
	local nRemaidNum = getn(tErjiAward)-nPage*nPageNum;
	local strtab = {};
	local nThisNum = 7;
	if nRemaidNum < nThisNum then
		nThisNum = nRemaidNum;
	end
	for i=1,nThisNum do
		tinsert(strtab,tErjiAward[nPage*nPageNum+i][1].."/#confirm_change_erjiding("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr��c/#change_erjiding("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum	then
		tinsert(strtab,"Trang k�/#change_erjiding("..(nPage+1)..")");
	end  
	tinsert(strtab,"T�m th�i kh�ng ��i. /nothing");
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 2. ");
	else	
		Say("Xin m�i ch�n ph�n th��ng mu�n ��i. ",
			getn(strtab),
			strtab);
	end		
end

function confirm_change_erjiding(nType)
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ng��i kh�ng �� Thanh ��ng ��nh c�p 2. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end	
		if DelItem(2,1,3214,1) == 1 then
			AddItem(tErjiAward[nType][2],tErjiAward[nType][3],tErjiAward[nType][4],1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tErjiAward[nType][1]);
			Talk(1,"guwan_change_award","Ch�c m�ng ng��i ��i th�nh c�ng Thanh ��ng ��nh c�p 2, nh�n ���c "..tErjiAward[nType][1]);
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ng��i kh�ng �� Thanh ��ng ��nh c�p 1. ");	
	else
		Say("Ng��i mu�n ��i trang b� n�o? ",
			5,
			"Thi�n ��a Huy�n Ho�ng Kh�i/#choose_tiandi_lingqi(1,0)",
			"Thi�n ��a Huy�n Ho�ng Gi�p /#choose_tiandi_lingqi(2,0)",
			"Gi�y Thi�n ��a Huy�n Ho�ng/#choose_tiandi_lingqi(3,0)",
			"V� kh� Thi�n ��a Huy�n Ho�ng/choose_tiandi_weapon",
			"T�m th�i kh�ng ��i. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ng��i mu�n ��i v� kh� n�o?",
			3,
			"Thi�n ��a Huy�n Ho�ng Dao/#choose_tiandi_lingqi(4,1)",
			"Thi�n ��a Huy�n Ho�ng C�n/#choose_tiandi_lingqi(4,2)",
			"T�m th�i kh�ng ��i. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("H�y ch�n �i�m linh kh� c�a trang b� n�y.",
		3,
		"119 linh kh� [C�n Kh�m Ch�n C�n]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh kh� [Kh�n �o�i Ly T�n]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T�m th�i kh�ng ��i. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thi�n ��a Huy�n Ho�ng Kh�i","Thi�n ��a Huy�n Ho�ng Gi�p ","Gi�y Thi�n ��a Huy�n Ho�ng","V� kh� Thi�n ��a Huy�n Ho�ng"};
	Say("X�c nh�n s� d�ng linh kh� Thanh ��ng ��nh c�p 1 ��i <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu�n ��i./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh�ng, ta nh�m!/chang_yijiding",
		"T�m th�i kh�ng ��i. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ng��i kh�ng �� Thanh ��ng ��nh c�p 1. ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Talk(1,"","Ch�c m�ng ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."D�ng Thanh ��ng ��nh �� ��i th�nh c�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."S� d�ng Thanh ��ng ��nh c�p 1 th�t b�i, log:"..add_flag);
			end	
		end
	end				
end

function chang_tongqisuipian()
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: Tr�n ng��i ng��i kh�ng �� m�nh ��ng d�ng ���c ");	
	else
		Say("Ng��i mu�n ��i trang b� n�o? ",
			5,
			"Thi�n ��a Huy�n Ho�ng Kh�i/#choose_tiandi_lingqi_suipian(1,0)",
			"Thi�n ��a Huy�n Ho�ng Gi�p /#choose_tiandi_lingqi_suipian(2,0)",
			"Gi�y Thi�n ��a Huy�n Ho�ng/#choose_tiandi_lingqi_suipian(3,0)",
			"V� kh� Thi�n ��a Huy�n Ho�ng/choose_tiandi_weapon_suipian",
			"T�m th�i kh�ng ��i. /nothing")
	end	
end

function choose_tiandi_weapon_suipian()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ng��i mu�n ��i v� kh� n�o?",
			3,
			"Thi�n ��a Huy�n Ho�ng Dao/#choose_tiandi_lingqi_suipian(4,1)",
			"Thi�n ��a Huy�n Ho�ng C�n/#choose_tiandi_lingqi_suipian(4,2)",
			"T�m th�i kh�ng ��i. /nothing")
	else
		choose_tiandi_lingqi_suipian(4,0);
	end
end

function choose_tiandi_lingqi_suipian(nType,nWp)
	Say("H�y ch�n �i�m linh kh� c�a trang b� n�y.",
		3,
		"119 linh kh� [C�n Kh�m Ch�n C�n]/#ask_is_duihuan_suipian("..nType..","..nWp..",119)",
		"120 linh kh� [Kh�n �o�i Ly T�n]/#ask_is_duihuan_suipian("..nType..","..nWp..",120)",
		"T�m th�i kh�ng ��i. /nothing")
end

function ask_is_duihuan_suipian(nType,nWp,nLingqi)
	local tTiandiName = {"Thi�n ��a Huy�n Ho�ng Kh�i","Thi�n ��a Huy�n Ho�ng Gi�p ","Gi�y Thi�n ��a Huy�n Ho�ng","V� kh� Thi�n ��a Huy�n Ho�ng"};
	Say("<color=green>S� gi� n�m m�i<color>: Mu�n s� d�ng 2000 m�nh ��ng ��i Linh Kh� th�nh<color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> ch�?",
		3,
		"�, ta mu�n ��i./#confirm_change_yijiding_suipian("..nType..","..nWp..","..nLingqi..")",
		"Kh�ng, ta nh�m!/chang_tongqisuipian",
		"T�m th�i kh�ng ��i. /nothing"
		)
end

function confirm_change_yijiding_suipian(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: Tr�n ng��i ng��i kh�ng c� 2000 m�nh ��ng d�ng ���c ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3217,2000) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i 2000 m�nh ��ng h�u d�ng th�t b�i, ti�u ch� th�t b�i: "..add_flag);
				end
			end
		else
			if DelItem(2,1,3217,2000) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i 2000 m�nh ��ng h�u d�ng th�t b�i, ti�u ch� th�t b�i: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3217,2000) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ch�c m�ng ng��i ��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i th�nh c�ng 2000 m�nh ��ng h�u d�ng, nh�n ���c "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho�t ��ng xu�n 2008: ng��i ch�i "..GetName().."��i 2000 m�nh ��ng h�u d�ng th�t b�i, ti�u ch� th�t b�i: "..add_flag);
			end	
		end
	end				
end

function about_guwan_collect()
	Talk(1,"about_guwan_collect2","<color=green>S� gi� n�m m�i<color>: \nTa nghe n�i g�n ��y v� l�m nh�n s� khai qu�t ���c nhi�u Thanh ��ng m�nh kh�, b� m�t s� d� th�, qu�i v�t v� c��ng ��o l�y �i. N�u ng��i t�m ���c m�nh Thanh ��ng kh� v�, c� th� h�p th�nh 1 Thanh ��ng ��nh giao cho ta.");
end

function about_guwan_collect2()
	Talk(1,"guwan_collect","<color=green>S� gi� n�m m�i<color>: C�n ch� �: cho d� ch�a h�p th�nh th�nh c�ng th� gi� tr� c�a Thanh ��ng ��nh h�ng c�ng kh�ng ph�i l� nh�, v�n c� th� ��i ���c ph�n th��ng ch� ta. \nNgo�i ra ��nh qu�i cao c�p ngo�i th�nh ��u c� kh� n�ng l�y ���c Thanh ��ng kh� huy�t cao c�p, \nNg� C�c c�ng c� b�n 1 s� m�nh ��ng kh�")
end

function about_hongbao()
	local nMapId = GetWorldPos();
	local nNum = GetMapTaskTemp(nMapId,MAP_HONGBAO_NUM);
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ng��i h�m nay �� nh�n 1 h�ng bao r�i, m�i ng�y ch� nh�n ���c 1 l�n th�i!");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nNum >= HONGBAO_TOTAL_NUM or (nNum < HONGBAO_TOTAL_NUM and nLv < 70)then
		Say("<color=green>S� gi� n�m m�i<color>: Ch�o ��n n�m m�i, ta �� chu�n b� r�t nhi�u h�ng bao t�ng cho nh�n s�. M�i ng�y l�c 9h00, 13h00, 19h30, 21h30 s� ph�t 50 ��i h�ng bao, ai ��n tr��c nh�n tr��c. ��i h�ng bao ch� ph�t cho ai t� c�p70. Nh�ng th�i gian c�n l�i m�i ng��i ��u c� th� t�y � ��n nh�n Ti�u h�ng bao, ai c�ng c� ph�n!",
			2,
			"���c/get_xiao_hongbao",
			"Ta s� quay l�i sau!/nothing")
	elseif nNum < HONGBAO_TOTAL_NUM and nLv >= 70 then
		AddItem(2,1,212,1);
		SetTask(TASK_HONGBAO_DATE,nDate);
		SetMapTaskTemp(nMapId,MAP_HONGBAO_NUM,nNum+1);
		Msg2Player("Ch�c m�ng Ng��i nh�n ���c 1 ��i h�ng bao");
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: N�m m�i ��n r�i, ta c� chu�n b� bao l� x� cho m�i ng��i, v�o l�c 9:00, 13:00, 19:30, 21:30 gi� m�i ng�y s� ph�t 50 ��i h�ng bao, ��n tr��c ���c tr��c, ch� �, ng��i l�nh ��i h�ng bao ph�i ��t c�p 70 tr� l�n. C� th� ��n ch� ta nh�n Ti�u h�ng bao b�t c� l�c n�o. \nC�m �i, ��i h�ng bao c�a ng��i ��y, ch�c n�m m�i v�n s� nh� �.");
	end
end

function get_xiao_hongbao()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ng��i h�m nay �� nh�n 1 h�ng bao r�i, m�i ng�y ch� nh�n ���c 1 l�n th�i!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	AddItem(2,1,213,1);
	SetTask(TASK_HONGBAO_DATE,nDate);
	Msg2Player("Ch�c m�ng Ng��i nh�n ���c 1 Ti�u h�ng bao. ");
end

function get_action_manual()
	if BigGetItemCount(2,1,3225) >= 1 then
		Talk(1,"","<color=green>S� gi� n�m m�i<color>: Ch�ng ph�i ng��i �� c� m�t ch� nam ho�t ��ng ng�y xu�n r�i sao?")
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		AddItem(2,1,3225,1);
	end		
end