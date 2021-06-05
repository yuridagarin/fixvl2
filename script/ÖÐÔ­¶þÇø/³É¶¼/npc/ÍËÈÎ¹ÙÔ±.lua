
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���ι�Ա�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\misc\\spreader\\spreader.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

nTuiGuanYuanFlag = 0;--����Ϊ1 ���ƹ�Ա����

function main()

	--���
	local tSay = {};
	--���
	local tActivityID = {120};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Tho�t/nothing")
		Say("L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m!", getn(tSay), tSay);
		return 
	end
	-------
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (IsFreeze() == 1) then  --�����WG����
     Talk(1,"","H�y ��n Bi�n Kinh g�p Quan vi�n tho�i nhi�m gi�i tr� phong t�a.");
	    return
	end;
	
	if (nState==13) then
		task_013();
		return
	else
	    if (nTuiGuanYuanFlag == 0) then
	        Talk(1,"","L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m!");
	    else
            local szOp = 
	        {
		        "H�y nh�p cd-key k�ch ho�t t�i kho�n/gsp_input_cdkey",
		        "Nh�n ph�n th��ng giai �o�n./gsp_phase_prize",
		        "Li�n quan S� gi�.../gsp_about",
		        "Ch� gh� qua th�i./gsp_cancel"
	        };

	        Say("Hoan ngh�nh b�n b��c v�o <color=green>h� th�ng S� gi�<color>, ch�ng t�i c� th� gi�p g� cho b�n?", 4, szOp[1], szOp[2], szOp[3], szOp[4]);
	    end
	end;
end;

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "T�i kho�n n�y �� k�ch ho�t, kh�ng c�n nh�p l�i cd-key."
		Talk(1, "", "<color=green>S� gi�<color>:"..szError);
		return
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Vui l�ng nh�p cd-key:");
end

-- ��ȡ�׶ν���
function gsp_phase_prize()
    local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
    local nStage = GetTask(GSP_TASKID_ROLEREINFO);
    if (nValue ~= GSP_ACCOUNT_TYPE_CDKEY) or (GetByte(nStage, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "B�n ch�a d�ng [CD-KEY]k�ch ho�t t�i kho�n n�y, kh�ng th� l�nh ���c ph�n th��ng. Vui l�ng xem chi ti�t tr�n trang ch�.");
		return 0;
    end;

    local nLevel = GetLevel();

    if (nLevel >= 1) and GetBit(nStage, GSP_TASKID_TAG_BIT_01BONUS) == 0 then
        Say("Ng��i th�t c� duy�n v�i ta, ta c� v�i v�t ph�m mu�n t�ng ng��i, hy v�ng ch�ng s� gi�p �� ng��i khi h�nh t�u giang h�. Khi ��t ��n c�p 15, c�p 30, c�p 40 h�y quay l�i g�p ta nh�n s� tr� gi�p nh�!",2,"Nh�n l�y./OnGet1","Ta s� quay l�i sau!/OnLater");
    elseif (nLevel >= 15) and GetBit(nStage, GSP_TASKID_TAG_BIT_15BONUS) == 0 then
        Say("Ng��i th�t n� l�c, ngo�i t�p v� ngh� ra c�ng n�n ch�n m�t ngh� n�o �� l�m k� sinh nhai, ta c� m�t d�ng c� n�y mu�n t�ng cho ng��i!",2,"Nh�n l�y./OnGet2","Ta s� quay l�i sau!/OnLater");
    elseif (nLevel >= 30) and GetBit(nStage, GSP_TASKID_TAG_BIT_30BONUS) == 0 then
        Say("Ng��i �� c� ch�t hi�u bi�t v� tr� ch�i. T�ng ng��i m�nh B�ng th�ch n�y, c� th� s�a nh�ng trang b� �� h�.",2,"Nh�n l�y./OnGet3","Ta s� quay l�i sau!/OnLater");
    elseif (nLevel >= 40) and GetBit(nStage, GSP_TASKID_TAG_BIT_40BONUS) == 0 then
        Say("Th�t kh�ng l�m ta th�t v�ng! T� nay kh�ng c�n g� ch� d�n n�a, ng��i h�y nh�n l�y Thi�n th�ch v� �i�m kinh nghi�m!",2,"Nh�n l�y./OnGet4","Ta s� quay l�i sau!/OnLater");
    else
        Talk(1,"","L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m!");
    end;
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>S� gi�<color>, xem chi ti�t tr�n trang Web.");
end

function gsp_cancel()
end

function OnGet1()
    OnGet(1);
end

function OnGet2()
    OnGet(2);
end

function OnGet3()
    OnGet(3);
end

function OnGet4()
    OnGet(4);
end

function OnGet(nStage)
    local nBit = 0;

    if (nStage == 1) then
        Earn(5000);--����50��
        AddItem(0,2,14,1,1,3,131,3,45,0,0);--��ɫ���ٽ� �ӹ���10�㣬�ӷ���10��
        nBit = GSP_TASKID_TAG_BIT_01BONUS;
        Msg2Player("B�n nh�n ���c 1 thanh Hi�p Thi�u ki�m v� 50 l��ng b�c.");
    elseif (nStage == 2) then
        local index = GetLifeSkill();
        if (index > 0) then
            GetOneLifeTool(index);--�ƽ���������һ��
        else
            Say("B�n h�y ch�n cho nh�n v�t c�a m�nh 1 d�ng c� s�n xu�t b�ng v�ng",7,"��n c�y/OnGetLifeTool1()","L�m da/OnGetLifeTool2()","Canh t�c/OnGetLifeTool3()","H�i thu�c/OnGetLifeTool4()","��o kho�ng/OnGetLifeTool5()","K�o t�/OnGetLifeTool6()","Ta s� quay l�i sau!/OnLater")
        end;
    elseif (nStage == 3) then
        AddItem(2, 1, 148, 2);--С���Ϭ2��
        nBit = GSP_TASKID_TAG_BIT_30BONUS;
        Msg2Player("Nh�n ���c 2 B�ng th�ch.");
    elseif (nStage == 4) then
        AddItem(2, 2, 8, 3);--����3��
        ModifyExp(300000);--30����ֵ
        nBit = GSP_TASKID_TAG_BIT_40BONUS;
        Msg2Player("Nh�n ���c 2 Thi�n th�ch v� 300000 �i�m kinh nghi�m.");
    end;

    if (nBit ~= 0) then
        local nValue = GetTask(GSP_TASKID_ROLEREINFO);
        nValue = SetBit(nValue, nBit, 1); --������ȡ���
        SetTask(GSP_TASKID_ROLEREINFO, nValue);
    end;
end

function OnLater()
end

function GetLifeSkill()
    nGene1, nSKIllId1 = GetMainLifeSkill();
    nGene2, nSKIllId2 = GetAssistLifeSkill();
    
    if (nGene1 == 0) then
        return nSKIllId1
    end
    if (nGene2 == 0) then
        return nSKIllId2
    end
    return 0
end

function OnGetLifeTool1()
    GetOneLifeTool(1);
end

function OnGetLifeTool2()
    GetOneLifeTool(2);
end

function OnGetLifeTool3()
    GetOneLifeTool(3);
end

function OnGetLifeTool4()
    GetOneLifeTool(4);
end

function OnGetLifeTool5()
    GetOneLifeTool(5);
end

function OnGetLifeTool6()
    GetOneLifeTool(6);
end

function GetOneLifeTool(index)
    if (index<1 or index>6) then
        return
    end
    
    if (index == 1) then--��ľ
        AddItem(0, 200, 26, 1)
        Msg2Player("B�n nh�n ���c 1 thanh B�n C� Ph�!")
    elseif (index == 2) then--��Ƥ
        AddItem(0, 200, 24, 1)
        Msg2Player("B�n nh�n ���c 1 thanh L�i Th�n �ao!")
    elseif (index == 3) then--�ո�
        AddItem(0, 200, 25, 1)
        Msg2Player("B�n nh�n ���c 1 cu�c Vi�m ��!")
    elseif (index == 4) then--��ҩ
        AddItem(0, 200, 28, 1)
        Msg2Player("B�n nh�n ���c 1 cu�c Th�n N�ng!")
    elseif (index == 5) then--�ڿ�
        AddItem(0, 200, 23, 1)
        Msg2Player("B�n nh�n ���c 1 cu�c C�ng C�ng!")
    elseif (index == 6) then--��˿
        AddItem(0, 200, 27, 1)
        Msg2Player("B�n nh�n ���c 1 Ch�c N� Thoa!")
    end
    
    local nValue = GetTask(GSP_TASKID_ROLEREINFO);
    nValue = SetBit(nValue, GSP_TASKID_TAG_BIT_15BONUS, 1); --������ȡ���
    SetTask(GSP_TASKID_ROLEREINFO, nValue);
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --���
end;