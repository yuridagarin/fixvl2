--��ĩ�
--created by lizhi
--2005-9-10 11:46

Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

WEEK_MATERIAL = 2160	--һ�������������

function deliver_goods_begin()
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--�꾩
	    SetTask(TASK_GQ_DELIVER, PATH_BJ2QZ);
	    --����������
	    for index, value in rect_trigger_table do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy�n ���ng chuy�n h�ng g�m Nam Bi�n Kinh, H�nh Hoa Th�n, D��ng Ch�u, Long Tuy�n Th�n, B�c Tuy�n Ch�u, Tuy�n Ch�u");
	    TaskTip("Tuy�n ���ng chuy�n h�ng g�m Nam Bi�n Kinh, H�nh Hoa Th�n, D��ng Ch�u, Long Tuy�n Th�n, B�c Tuy�n Ch�u, Tuy�n Ch�u");
	elseif nMapID == 350 then	--����
		SetTask(TASK_GQ_DELIVER, PATH_XY2YZ);
	    --����������
	    for index, value in rect_trigger_table_2 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy�n ���ng chuy�n h�ng g�m Linh B�o s�n, Thi�u L�m, T�y Bi�n Kinh, Bi�n Kinh, Nam Bi�n Kinh, H�nh Hoa Th�n, D��ng Ch�u");
	    TaskTip("Tuy�n ���ng chuy�n h�ng g�m Linh B�o s�n, Thi�u L�m, T�y Bi�n Kinh, Bi�n Kinh, Nam Bi�n Kinh, H�nh Hoa Th�n, D��ng Ch�u");
	elseif nMapID == 150 then	--����
		SetTask(TASK_GQ_DELIVER, PATH_YZ2XY);
	    --����������
	    for index, value in rect_trigger_table_3 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy�n ���ng chuy�n h�ng g�m H�nh Hoa Th�n, Nam Bi�n Kinh, Bi�n Kinh, T�y Bi�n Kinh, Thi�u L�m, Linh B�o s�n, T��ng D��ng");
	    TaskTip("Tuy�n ���ng chuy�n h�ng g�m H�nh Hoa Th�n, Nam Bi�n Kinh, Bi�n Kinh, T�y Bi�n Kinh, Thi�u L�m, Linh B�o s�n, T��ng D��ng");
	end;
end;

function deliver_goods_end()
    SetTask(TASK_GQ_DELIVER, 0);        --���Լ����ͻ���
    SetTask(TASK_GQ_KILLWK_START, 1);   --����ɱ����
    --���ɾ��һ������
    for index, value in finished_product_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            DelItem(value[1], value[2], value[3], 1);
            --����
            AddPlayerPoint(POINT_PER_ONCE_DELIVER);
            Msg2Player("N�p 1 c�i "..value[4].."nh�n ���c"..POINT_PER_ONCE_DELIVER.." �i�m c�ng lao");
            break
        end;
    end;
    --ȫ���Ƴ���������ûʱ���ˣ�ȫ��д��
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --������������ûʱ���ˣ�ֱ��д��
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    local szSay = {
        "�a t� <sex> gi�p chuy�n v�t ph�m! Nh�ng hi�n Oa Kh�u xua qu�n ti�n v�o H�i T�n, kh�ng bi�t <sex>gi�p �u�i l� gi�c �i ���c kh�ng?",
        "Qu�c gia l�m nguy sao c� th� ��ng nh�n/kill_enemy",
        "Ta �ang b�n!/end_say"
    };
    SelectSay(szSay);
end;

function check_path(nPath)   --����0��֤��ȫ���߹���1��֤��û������
    local nResult = 0;
    if nPath == PATH_BJ2QZ then
	    for index, value in path_table do
	        if GetTask(value) == 0 then     --�����û�߹��ĵ�ͼ
	            return 1
	        end;
	    end;
	elseif nPath == PATH_XY2YZ then
		for index, value in path_table_2 do
	        if GetTask(value) == 0 then     --�����û�߹��ĵ�ͼ
	            return 1
	        end;
	    end;
	elseif nPath == PATH_YZ2XY then
		for index, value in path_table_3 do
	        if GetTask(value) == 0 then     --�����û�߹��ĵ�ͼ
	            return 1
	        end;
	    end;
	end;
end;

function receive_goods()
    local szPathWrong = {
        "Xin l�i! Ng��i kh�ng �i ��ng tuy�n ���ng, gi�p ��i T�ng chuy�n h�ng th�t b�i."
    };
    local szNoGoods = {
        "Xin l�i! Ng��i kh�ng mang qu�n d�ng, nhi�m v� gi�p ��i T�ng chuy�n h�ng th�t b�i."
    };
    local nPath = GetTask(TASK_GQ_DELIVER);
    local nMapID = GetWorldPos();
    
    if nMapID == 100 then		--Ȫ��
    	if nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� T��ng D��ng giao cho Ch� huy s� D��ng Ch�u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� D��ng Ch�u giao cho Ch� huy s� T��ng D��ng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
    elseif nMapID == 150 then	--����
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� Bi�n Kinh giao cho Ch� huy s� Tuy�n Ch�u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� D��ng Ch�u giao cho Ch� huy s� T��ng D��ng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	elseif nMapID == 350 then	--����
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� Bi�n Kinh giao cho Ch� huy s� Tuy�n Ch�u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ng��i mau mang v�t t� t� T��ng D��ng giao cho Ch� huy s� D��ng Ch�u."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	end;

    if is_exist(finished_product_table) == 0 then   --���û�л���
        TalkEx("task_failed", szNoGoods);
        return
    end;
    
    if check_path(nPath) == 1 then   --û�������е�ͼ
        TalkEx("task_failed", szPathWrong);
        return
    end;
    
    deliver_goods_end();    --�ͻ�����
end;

function task_failed()
    SetTask(TASK_GQ_DELIVER, 0);
    --ȫ���Ƴ���������ûʱ���ˣ�ȫ��д��
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --������������ûʱ���ˣ�ֱ��д��
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    Msg2Player("Gi�p ��i T�ng chuy�n h�ng th�t b�i.");
end;

function kill_enemy()
	if GetTask(TASK_WK_ISDISCONNECT) == 0 then	--�����˳���
		local nCoolDown = GetCooldownTime(1800);
		if nCoolDown > 0 then
			local nMinCD = floor(nCoolDown / 60);
			local nSecCD = mod(nCoolDown, 60);
			local szTalk = {
				"<sex> T�n l�c cho ��t n��c c�ng kh�ng n�n l�m qu� s�c, kho�ng"..nMinCD.." Ph�t "..nSecCD.." gi�y quay l�i."
			};
			TalkEx("", szTalk);
			return
		end;
	end;
	local szSay = {
		"<sex> Sau khi v�o �i�m ��ng nh�p Oa Kh�u m�i ��n t��ng l�nh ti�n tuy�n b�o danh gi�p ��nh �u�i Oa Kh�u",
		"Ta �� chu�n b�!/kill_enemy_start",
		"Ta �ang b�n!/end_say"
	};
	SelectSay(szSay);
end;

function kill_enemy_start()
	SetTask(TASK_WK_ISDISCONNECT, 1);
	SetLaskEnterTime();
	
	local nMapid, nX, nY = GetWorldPos();
	--��¼��ǰ����
    SetTask(TASK_POSITION, nMapid);
    SetTask(TASK_POSITION + 1, nX);
    SetTask(TASK_POSITION + 2, nY);
    
    --��¼��½�����ĸ���ͼ
    SetTask(TASK_WHICH_MAP, random(0,1))
    
    --������ɱʲô���ε�����
    local szKey = "wk_";
    local nLevel = GetLevel();
    if nLevel > 0 and nLevel <= 27 then
        szKey = szKey..20;
    elseif nLevel > 27 and nLevel <= 37 then
        szKey = szKey..30;
    elseif nLevel > 37 and nLevel <= 47 then
        szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 47 and nLevel <= 57 then
        szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 57 and nLevel <= 99 then
        szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
    end;
    --����
    CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
    NewWorld(maps_table[szKey][1], maps_table[szKey][2], maps_table[szKey][3]);
end;

function out_map()
    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;

    for index, value in rect_wk_table do    --�ƴ����򴥷���
        RemoveTrigger(GetTrigger(value[2]));
    end;

	RemoveTrigger(GetTrigger(log_wk_table[2]));
        --�Ƴ���ʱ��
	RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
        
    SetTask(TASK_GQ_DELIVER, 0);
	SetTask(TASK_GQ_KILLWK, 0);
	SetTask(TASK_GQ_KILLWK_START, 0);
    SetLogoutRV(0);
    SetFightState(0);
	--���ͳ�ɱ���ܵ�ͼ
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
end;

function deliver_goods()
    local szMsg = {
        "S� gi� ho�t ��ng: Tr�n ng��i b�n kh�ng c� v�t t� qu�n b� g� �� g�i �!"
    };
    local szSayQz = {
        "S� gi� ho�t ��ng: H�y theo tuy�n ���ng Bi�n Kinh-Nam Bi�n Kinh-H�nh Hoa th�n-D��ng Ch�u-Long Tuy�n th�n-B�c Tuy�n Ch�u-Tuy�n Ch�u giao h�ng cho Ch� huy s�!",
        "B�t ��u nhi�m v� chuy�n v�t t�/deliver_goods_begin",
        "Kh�ng mu�n chuy�n!/end_say"
    };
    local szSayYz = {
        "S� gi� ho�t ��ng: H�y theo tuy�n ���ng T��ng D��ng-Linh B�o S�n-Thi�u L�m-T�y Bi�n Kinh-Bi�n Kinh-Nam Bi�n Kinh-H�nh Hoa th�n-D��ng Ch�u giao h�ng cho Ch� huy s�!",
        "B�t ��u nhi�m v� chuy�n v�t t�/deliver_goods_begin",
        "Kh�ng mu�n chuy�n!/end_say"
    };
    local szSayXy = {
        "S� gi� ho�t ��ng: H�y theo tuy�t ���ng D��ng Ch�u-H�nh Hoa th�n-Nam Bi�n Kinh-Bi�n Kinh-T�y Bi�n Kinh-Thi�u L�m-Linh B�o S�n-T��ng D��ng giao h�ng cho Ch� huy s�!",
        "B�t ��u nhi�m v� chuy�n v�t t�/deliver_goods_begin",
        "Kh�ng mu�n chuy�n!/end_say"
    };
    local szNoQz = {
    	"S� gi� ho�t ��ng: Ng��i �� nh�n nhi�m v� chuy�n v�t t� t� Bi�n Kinh ��n Tuy�n Ch�u, mau �i �i!"
    };
    local szNoYz = {
    	"S� gi� ho�t ��ng: Ng��i �� nh�n nhi�m v� chuy�n v�t t� t� T��ng D��ng ��n D��ng Ch�u, mau �i �i!"
    };
    local szNoXy = {
    	"S� gi� ho�t ��ng: Ng��i �� nh�n nhi�m v� chuy�n v�t t� t� D��ng Ch�u ��n T��ng D��ng, mau �i �i!"
    };
    
    if is_exist(finished_product_table) == 0 then   --���û�л���
        TalkEx("deliver_goods_nogoods", szMsg);
        return
    end;
    
    if GetTask(TASK_GQ_DELIVER) == PATH_BJ2QZ then
    	TalkEx("", szNoQz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_XY2YZ then
    	TalkEx("", szNoYz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_YZ2XY then
    	TalkEx("", szNoXy);
    	return
    end;
    
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--�꾩
		SelectSay(szSayQz);
		return
	end;
	if nMapID == 350 then	--����
		SelectSay(szSayYz);
		return
	end;
	if nMapID == 150 then	--����
		SelectSay(szSayXy);
		return
	end;
end;

function deliver_goods_nogoods()
    SetTask(TASK_GQ_DELIVER, 0);
    --ȫ���Ƴ���������ûʱ���ˣ�ȫ��д��
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --������������ûʱ���ˣ�ֱ��д��
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
end;

function supply_armament()
    local szMsg = {
        "S� gi� ho�t ��ng: H�nh nh� ng��i kh�ng mang v�t t� cho ��i T�ng."
    };
    --û�г�Ʒ(����)Ҳû�в���
    if is_exist(material_table) == 0 then
        TalkEx("", szMsg);
        return
    end;
    
    supply_material();
end;

function supply_material()
	local selTab = {
				"Ta mu�n n�p nguy�n li�u c�a tu�n n�y/supply_week_material",
				"Ta mu�n n�p t�t c� c�c nguy�n li�u/supply_material_all",
				"Ta mu�n n�p nguy�n li�u/supply_somekind_material",
				"T�m th�i kh�ng n�p/end_say",
				}
	Say("<color=green>S� gi� ho�t ��ng<color>: Ng��i mu�n n�p nguy�n li�u n�o?",getn(selTab),selTab);
end;

function supply_week_material()
	local nTotalCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>S� gi� ho�t ��ng<color>: Ng��i kh�ng �� nguy�n li�u, x�c nh�n ch� c� <color=yellow>"..WEEK_MATERIAL.."<color>Nguy�n li�u qu�n d�ng, hi�n ng��i ch� c�<color=yellow>"..nTotalCount.."<color> ph�n Qu�n ph�m.");
		return 0;
	end;
	local selTab = {
				"��ng v�y, ta mu�n n�p nguy�n li�u c�a tu�n n�y/supply_week_material_confirm",
				"Ta suy ngh� l�i/supply_material",
				}
	Say("<color=green>S� gi� ho�t ��ng<color>: Ng��i mu�n n�p nguy�n li�u c�a tu�n n�y? S� nguy�n li�u tu�n tr��c c�a ng��i b� tr� <color=yellow><color=yellow>"..WEEK_MATERIAL.."<color>, ng��i nh�n ���c<color=yellow>"..WEEK_MATERIAL.."<color> �i�m ��nh qu�c an bang",getn(selTab),selTab);
end;

function supply_week_material_confirm()
	local nTotalCount = 0;
	local nCount = 0;
	local nDelCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>S� gi� ho�t ��ng<color>: Ng��i kh�ng �� nguy�n li�u, x�c nh�n ch� c� <color=yellow>"..WEEK_MATERIAL.."<color>Nguy�n li�u qu�n d�ng, hi�n ng��i ch� c�<color=yellow>"..nTotalCount.."<color> ph�n Qu�n ph�m.");
		return 0;
	end;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nDelCount = nDelCount + nCount;
		if nCount >= WEEK_MATERIAL then	--����Ӧ�ò������о��ÿ��Ե��ӳ���2160�ģ��������ų��Ժ��п��ܣ����Ի�����һ�´����
			DelItem(value[1], value[2], value[3], WEEK_MATERIAL);	
			break;
		elseif nDelCount < WEEK_MATERIAL then
			DelItem(value[1], value[2], value[3], nCount);
		else
			DelItem(value[1], value[2], value[3], nCount-nDelCount+WEEK_MATERIAL);
			nDelCount = WEEK_MATERIAL;	--���������˵��һ�¶��ѣ�ûʲô����
			break;
		end;
	end;
	AddPlayerPoint(nDelCount);
 	Msg2Player("B�n nh�n ���c "..nDelCount.." �i�m c�ng lao");
	Talk(1,"","<color=green>S� gi� ho�t ��ng<color>: T�ng c�ng ng��i �� n�p <color=yellow>"..WEEK_MATERIAL.."<color>, nh�n ���c<color=yellow>"..WEEK_MATERIAL.."<color> �i�m ��nh qu�c an bang");	
end;

function supply_material_all()
	local selTab = {
				"Ta mu�n giao to�n b� nguy�n li�u/supply_material_all_confirm",
				"�� ta suy ngh� l�i/supply_material",
				}
	Say("<color=green>S� gi� ho�t ��ng<color>: Ng��i mu�n n�p nguy�n li�u qu�n d�ng �? Tu�n n�y ch� d�ng nhi�u nh�t <color=yellow>"..WEEK_MATERIAL.."<color> �i�m An Bang ��nh Qu�c ��i ph�n th��ng, nh�ng n�u t�ch l�y nhi�u �i�m ng��i s� ��i ���c danh hi�u Kh�ng Oa",getn(selTab),selTab);
end;

function supply_material_all_confirm()
	local nCount = 0;
	local nPoint = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		DelItem(value[1], value[2], value[3], nCount);
		nPoint = nPoint + POINT_PER_MATERIALS * nCount;
	end;
	AddPlayerPoint(nPoint);
    Msg2Player("B�n nh�n ���c "..nPoint.." �i�m c�ng lao");
end;

function supply_somekind_material()
	local selTab = {};
    for index, value in material_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            tinsert(selTab,value[4].."/#supply_material_ok("..index..")");
        end;
    end;
    tinsert(selTab,"Ta suy ngh� l�i/supply_material");
    Say("<color=green>S� gi� ho�t ��ng<color>: Ng��i mu�n n�p nguy�n li�u n�o?",getn(selTab),selTab);	
end;

function supply_material_ok(index)
    --���轱��
    local szSay = {
    	"S� gi� ho�t ��ng: M�i nguy�n li�u ��i ���c 1 �i�m c�ng lao, ng��i mu�n n�p bao nhi�u?",
    	"1 /#once("..index..", 1)",
    	"10 /#once("..index..", 10)",
    	"50/#once("..index..", 50)",
    	"100 /#once("..index..", 100)",
    	"N�p h�t/#once_all("..index..")",
    	"Ta ch�a mu�n giao/end_say"
    };
    SelectSay(szSay);
end;

function once(index, nPoint)
	local nCount = POINT_PER_MATERIALS * nPoint;
	local szTalk = {
		"S� gi� ho�t ��ng: Ng��i kh�ng c�n nguy�n li�u �� n�p!"
	};
	if GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]) < nPoint then
		TalkEx("", szTalk);
		return
	end;
    DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nPoint);
    AddPlayerPoint(nCount);
    Msg2Player("B�n nh�n ���c "..nCount.." �i�m c�ng lao");
end;

function once_all(index)
	local nCount = POINT_PER_MATERIALS * GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]);
	DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nCount);
	AddPlayerPoint(nCount);
    Msg2Player("B�n nh�n ���c "..nCount.." �i�m c�ng lao");
end;

function calculate_exp()
    local nLevel = GetLevel();
    local nExpTableIndex = 0;
	local tExpTable = {5,8,10,15,30,60,90};
	if nLevel >=1 and nLevel <= 30 then
		nExpTableIndex = 1;
	elseif nLevel >=31 and nLevel <= 40 then
		nExpTableIndex = 2;
	elseif nLevel >=41 and nLevel <= 50 then
		nExpTableIndex = 3;
	elseif nLevel >=51 and nLevel <= 60 then
		nExpTableIndex = 4;
	elseif nLevel >=61 and nLevel <= 70 then
		nExpTableIndex = 5;
	elseif nLevel >=71 and nLevel <= 80 then
		nExpTableIndex = 6;
	else
		nExpTableIndex = 7;
	end;
	return nLevel^2*tExpTable[nExpTableIndex]
end;

function get_award()
	local nCurPoint = QueryPoint();
	if nCurPoint < 240 then
		local nMaxExp = calculate_exp();
		local nGetExp = floor(nMaxExp*nCurPoint/240);
		local selTab1 = {
					"Ta mu�n d�ng �i�m An Bang ��nh Qu�c �� ��i kinh nghi�m/get_cheap_exp",
					"Ta kh�ng mu�n ��i ph�n th��ng/end_say",
					}
		Say("Hi�n ng��i c� <color=yellow>"..nCurPoint.."<color> �i�m An Bang ��nh Qu�c, c� th� ��i <color=yellow>"..nGetExp.."<color> �i�m kinh nghi�m, n�u �i�m An Bang > 240 �i�m c� th� ��i ph�n th��ng",getn(selTab1),selTab1);
	else
		local selTab2 = {"D�ng 240 �i�m An Bang �� ��i kinh nghi�m v� ph�n th��ng./award_240",
						 "Ta kh�ng mu�n ��i ph�n th��ng/end_say",}
		Say("Ng��i c� mu�n d�ng �i�m An Bang ��i ph�n th��ng kh�ng? Tr��c khi ��i ph�n th��ng xin ki�m tra l�i kho�ng tr�ng trong h�nh trang.",
			getn(selTab2),
			selTab2)
	end;
end;

function get_cheap_exp()
	local nCurPoint = QueryPoint();
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	local selTab = {
				"Ta mu�n ��i/get_cheap_exp_confirm",
				"�� ta suy ngh� l�i/end_say",
				}
	Say("Hi�n ng��i c� <color=yellow>"..nCurPoint.."<color> �i�m An Bang ��nh Qu�c, c� th� ��i <color=yellow>"..nGetExp.."<color> �i�m kinh nghi�m. N�u �i�m An Bang nhi�u h�n <color=yellow>240<color> �i�m, c� th� ��i ���c ph�n th��ng gi� tr�. Nh�ng l�n ��i n�y c�ng ���c t�nh v�o s� l�n ��i qu� trong ng�y, (m�i ng�y ch� ��i ���c 3 l�n) ng��i ��ng � ch�?",getn(selTab),selTab);
end;

function get_cheap_exp_confirm()
	local nCurPoint = QueryPoint();
	if nCurPoint <= 0 then
		Talk(1,"get_award","R�t ti�c �i�m An Bang c�a ng��i ch�a ��. H�y v� ��i T�ng c�ng hi�n th�m.");
		return 0;
	end
	if Add240Times() ~= 1 then	--ʧ��
		Talk(1,"get_award","M�i ng�y ch� ��i ph�n th��ng ���c 3 l�n");
		return 0;
	end;
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	AddPlayerPoint(-nCurPoint);
	ModifyExp(nGetExp);
	Msg2Player("B�n nh�n ���c "..nGetExp.." �i�m kinh nghi�m");
end;

function award_240()
	if QueryPoint() < 240 then
		Talk(1,"get_award","R�t ti�c �i�m An Bang c�a ng��i ch�a ��. H�y v� ��i T�ng c�ng hi�n th�m.");
		return 0;
	end
	if Add240Times() ~= 1 then	--ʧ��
		Talk(1,"get_award","M�i ng�y ch� ��i ph�n th��ng ���c 3 l�n");
		return 0;
	end
	AddPlayerPoint(-240);	
	local nExpAward = calculate_exp()
	nExpAward = nExpAward + 100000
	ModifyReputation(random(7,15), 0)
	ModifyExp(nExpAward);
	Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
	WriteLog("[Ho�t ��ng cu�i tu�n]:"..GetName().."D�ng 240 �i�m An Bang ��i ph�n th��ng")
end;

function query_offer()
    local nOffer = QueryPoint();
    Talk(1,"","S� gi� ho�t ��ng: �i�m c�ng lao hi�n t�i l� <color=yellow>["..nOffer.."]<color>.");
end;

function introduce_detail()
    szSay = {
        "S� gi� ho�t ��ng: ��i T�ng tuy l�n m�nh th�c ch�t lo�n trong gi�c ngo�i. T� l�c S�n H� X� T�c xu�t hi�n, c�c th� l�c ng�m ng�m n�i d�y. Chi�n s� ph��ng b�c li�n mi�n, Oa Kh�u nh�n c� h�i x�m nh�p v�ng bi�n. Binh l�c ��i T�ng kh�ng �� ch�ng tr�! C� th� gi�p ��nh �u�i b�n ch�ng kh�ng?",
        "Th� 6: Trang b� qu�n l�c/introduce_5",
        "Th� 7: Anh d�ng gi�t ��ch/introduce_6",
        "Ch� Nh�t: Tinh v� kh�ng ��ch/introduce_7",
        "Ch� �/introduce_inportant",
        "Ph�n th��ng ho�t ��ng/introduce_award",
        "H� th�ng x�ng hi�u/introduce_title",
        "Hi�u r�i!/end_say"
    };
    SelectSay(szSay);
end;

function GetCallBossItem()
	if QueryTimes() > 0 then
		Talk(1,"GiveCallBossItem","S� d�ng ch�ng ��nh b�i v� s� ngo�i t�c.");
	end;
end;

function GiveCallBossItem()
	if g_probability(19, 100) then
		AddItem(boss_item_table[1][1], boss_item_table[1][2], boss_item_table[1][3],1,1);
	elseif g_probability(39, 100) then
		AddItem(boss_item_table[2][1], boss_item_table[2][2], boss_item_table[2][3],1,1);
	elseif g_probability(59, 100) then
		AddItem(boss_item_table[3][1], boss_item_table[3][2], boss_item_table[3][3],1,1);
	elseif g_probability(74, 100) then
		AddItem(boss_item_table[4][1], boss_item_table[4][2], boss_item_table[4][3],1,1);
	elseif g_probability(84, 100) then
		AddItem(boss_item_table[5][1], boss_item_table[5][2], boss_item_table[5][3],1,1);
	elseif g_probability(89, 100) then
		AddItem(boss_item_table[6][1], boss_item_table[6][2], boss_item_table[6][3],1,1);
	elseif g_probability(94, 100) then
		AddItem(boss_item_table[7][1], boss_item_table[7][2], boss_item_table[7][3],1,1);
	elseif g_probability(97, 100) then
		AddItem(boss_item_table[8][1], boss_item_table[8][2], boss_item_table[8][3],1,1);
	else
		AddItem(boss_item_table[9][1], boss_item_table[9][2], boss_item_table[9][3],1,1);
	end;
	--��һ��
	AddKillWkTimes(-1);
	ModifyReputation(2, 0);	--2������
end;

function introduce_5()
	local szTalk = {
		"S� gi� ho�t ��ng: Ho�t ��ng t� 19h-24h<enter>1) Ng��i ch�i h�c k� n�ng ch� t�o c� th� ��n s� ph� t��ng �ng h�c ph�i ch�. <enter>2) Qu� tr�nh ��nh qu�i nh�n ���c c�c lo�i nguy�n li�u qu�n d�ng �em n�p ��i �i�m c�ng lao. <enter>3) T�ch l�y �i�m c�ng lao ��n m�t m�c �� s� nh�n ���c c�c x�ng hi�u. <enter>4) ��n g�p L� quan Bi�n Kinh, Th�nh ��, Tuy�n Ch�u d�ng �i�m c�ng lao ��i ph�n th��ng*2 m�i ng�y ch� c� 3 c� h�i nh�n, c� th� l�a ch�n."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_6()
	local szTalk = {
		"S� gi� ho�t ��ng: Ho�t ��ng t� 19h- 24h <enter>1) ��nh qu�i nh�n ���c c�c lo�i nguy�n li�u qu�n d�ng. <enter>2) D�ng k� n�ng h�c ���c �em c�c lo�i nguy�n li�u qu�n d�ng l�m th�nh ph�m. <enter>3) Mang qu�n d�ng ��n ��i tho�i v�i S� gi� ho�t ��ng � Bi�n Kinh, T��ng D��ng ho�c D��ng Ch�u m� nhi�m v� chuy�n v�t t�. <enter>4) Theo tuy�n ���ng ch� ��nh mang v�t t� giao cho Ch� huy s� nh�n 25 �i�m c�ng lao v� c� h�i ra ti�n tuy�n gi�t Oa Kh�u."
	};
	TalkEx("introduce_6_next", szTalk);
end;

function introduce_6_next()
	local szTalk = {
		"5) V�o khu v�c Oa Kh�u trong 30 ph�t ti�u di�t 50 t�n. Sau �� t� ��ng tho�t kh�i khu v�c ��n Ch� huy s� nh�n b�o v�t ��i T�ng. <enter>6) D�ng b�o v�t ��i T�ng g�i v� s� ngo�i t�c, ��nh b�i c� c� h�i nh�n ���c m�nh tranh b�t qu�i. <enter>7) b�o v�t ��i T�ng kh�c nhau t��ng �ng v�i ��ng c�p v� s� ngo�i t�c. <enter>8) D�ng m�nh tranh b�t qu�i s� c� ch� d�n, theo ch� d�n t�m kho b�u."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_7()
	local szTalk = {
		"S� gi� ho�t ��ng: Ho�t ��ng t� 14h-22h <enter>1) Kh�ng r�t nguy�n li�u qu�n d�ng, c�n l�i gi�ng th� 7."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_inportant()
	local szTalk = {
		"S� gi� ho�t ��ng: Ho�t ��ng t� 19h-24h th� 6, th� 7, Ch� Nh�t t� 14h-22h. Nh�ng gi� kh�c kh�ng th� tham gia ho�t ��ng. C�c nguy�n li�u qu�n ��i c�n ch� r�i v�o t�i th� 6, th� 7. <enter>H�c ph�i ch�, ch� t�o qu�n d�ng th�nh ph�m v� d�ng �i�m c�ng lao ��i ph�n th��ng di�n ra t� th� 6 ��n Ch� Nh�t. <enter>X�ng hi�u d�a theo �i�m c�ng lao hi�n t�i. <enter> ��i �i�m c�ng lao m�i tu�n ��u x�a, kh�ng th� t�ch l�y."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_award()
	local szTalk = {
		"S� gi� ho�t ��ng: Ph�n th��ng ho�t ��ng phong ph�! M� h� th�ng ngo�i trang, c�c trang b� cao c�p, B�ng th�ch v� Thi�n th�ch, Ng� h�nh th�ch th�n b�, c�ng c� Ho�ng Kim! Ch� c�n gi�p ��i T�ng ��nh �u�i Oa Kh�u l� c� c� h�i nh�n ���c."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_title()
	local szTalk = {
		"S� gi� ho�t ��ng: M� tr��c h� th�ng x�ng hi�u! Hi�p kh�ch di�t Oa, n� hi�p di�t Oa, ti�n phong di�t Oa, d�ng s� di�t Oa, tinh anh di�t Oa, anh h�ng di�t Oa, danh t��ng di�t Oa, ch� huy s� di�t Oa, ��i t��ng qu�n di�t Oa, t�ng nguy�n so�i di�t Oa."
	};
	TalkEx("introduce_detail", szTalk);
end;

function goto_liguan()
	local szTalk = {
		"S� gi� ho�t ��ng: M�i ��n L� quan Bi�n Kinh, Th�nh �� ho�c Tuy�n Ch�u nh�n ph�n th��ng t��ng �ng."
	};
	TalkEx("", szTalk);
end;

function end_say()

end;