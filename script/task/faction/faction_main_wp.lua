
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �嶾��������ʵ�崦��ű��ļ�
-- Edited by Starry
-- 2006/02/09 PM 11:31

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\world\\task_head.lua");

--��������嶾
function task_000()

local strTalk = {
	"<sex> mu�n gia nh�p b�n gi�o ph�i ���c s� ��ng � c�a t� v� Qu� S�! H�y �i g�p Th� t�a Qu� S� C�u S�ch tr��c!"
	}

	TalkEx("",strTalk);
	TaskTip("��n T�y B�c Ng� ��c Gi�o t�m Th� t�a Qu� S� C�u S�ch");
	Msg2Player("��n T�y B�c Ng� ��c Gi�o t�m Th� t�a Qu� S� C�u S�ch");
	SetTask(FN_WP,1);
end

-- �빴��Ի�
function task_001()

local strTalk = {
		"Mu�n gia nh�p Ng� ��c gi�o? Hay l�m! Nh�ng ng��i ph�i v��t qua v�i th� th�ch, gi� h�y �i t�m Ph��ng Vi�n Qu� S�!"
	}

	TalkEx("",strTalk);
	TaskTip("Qua ph�ng b�n c�nh t�m Ph��ng Vi�n Qu� S�");
	Msg2Player("Qua ph�ng b�n c�nh t�m Ph��ng Vi�n Qu� S�");
	SetTask(FN_WP,2);

end


-- �뷽Գ�Ի���δ�ش����⣩
function task_002()

local strTalk = {
	"H�! Nh�p gi�o th� nh�p gi�o! Kh�ng bi�t Gi�o ch� ngh� g�! Duy tr� truy�n th�ng c�a b�n gi�o c� g� kh�ng t�t? C�n ��nh c�ng b�n Thi�u L�m x�ng huynh �� g� ��, th�t s� �� l�m tr�i ch� � c�a c�c gi�o ch� ��i tr��c.",
	"C�u S�ch Qu� S� n�i ��n ��y �� kh�o nghi�m th��ng th�c v� l�m, xin h�i khi n�o c� th� b�t ��u?",
	"L�o C�u c�ng th�t l�... R� r�ng ph�n ��i chuy�n thay gi�o quy nh�ng l�i kh�ng n�i, c�n gi�p Gi�o ch� s�a gi�o quy. N�i l� l�y ��i cu�c l�m tr�ng nh�ng gi�o quy ���c truy�n t� ��i T� s� Ng� ��c gi�o ��n nay ch�ng l� kh�ng quan tr�ng? Ta �� ph� tr� qua 3 ��i Gi�o ch�, ch�a th�y ai nh� B�ch gi�o ch�",
	"Xin h�i v�y c� c�n ph�i thi ki�m tra?",
	"���ng nhi�n ph�i kh�o!"
	}
	TalkEx("task_003",strTalk);
end;

-- �뷽Գ�Ի����ش��һ�������⣩
function task_003()

local strSay = {
	"D�ng ph�m n�o �� chuy�n ��i gi�a ��ng v� ng�i?",
	"1.Ph�m K./exam_fault1",
	"2.Ph�m P/exam_fault1",
	"3.Ph�m V/exam_pass1",
}
	SelectSay(strSay);
end	

--��Ե�1�������
function exam_pass1()

local strSay = {
	"Ph�m chuy�n ��i ch� �� ch�y t� ��ng l� ph�m n�o?",
	"1.Ph�m K./exam_fault1",
	"2.Ph�m L/exam_pass2",
	"3.Ph�m O/exam_fault1",
}
	SelectSay(strSay);
end	

--��Ե�2�������
function exam_pass2()

local strSay = {
	"Ph�m nh�t v�t ph�m?",
	"1.Ph�m Ctrl/exam_fault1",
	"2.Ph�m Space/exam_pass3",
	"3.Ph�m Enter/exam_fault1",
}
	SelectSay(strSay);
end

--��Ե�3�������
function exam_pass3()

local strTalk = {
	"Th��ng th�c v� l�m c�ng kh� ��y!"
	}
	TalkEx("task_004",strTalk);
	SetTask(FN_WP,3);
end;

--δ���4������ǰ
function task_004()

local strSay = {
	"C�u h�i cu�i c�ng, n�m x�a ta b� m�t t�n gian t�c Thi�u L�m ��nh m�t c�n, ��n gi� m�i khi tr�i m�a l� l�ng m�i ch�n �au, ng��i bi�t h� ph�i c�a h�n l� g�?",
	"1.Thi�u L�m t�c gia/exam_pass4",
	"2.Thi�u L�m thi�n t�ng/exam_fault2",
	"3.Thi�u L�m v� t�ng/exam_fault2",
	}
	SelectSay(strSay);
end	
	
--��Ե�4�������
function exam_pass4()

local strTalk = {
	"��ng v�y! Ch�nh l� l�o Huy�n Bi Thi�u L�m t�c gia. Th� n�y ng�y n�o ch�a tr� ta kh� m� vui ���c. Nh�ng ta �� gi� r�i cho n�n thu nh�n ng��i l�m �� t�, c� g�ng luy�n v� c�ng sau n�y thay ta tr� th�?",
	"Qu� S� y�n t�m! T�i h� gia nh�p Ng� ��c gi�o th� �� l� ng��i b�n gi�o, sau n�y s� thay Qu� S� r�a h�n.",
	"T�t l�m! Gi� h�y �i t�m V�u Dung Qu� S�. H�y men theo con ���ng nh� ��n ph�a ��ng s� g�p h�n."
	}
	TalkEx("",strTalk);
	TaskTip("T�m V�u Dung Qu� S�");
	Msg2Player("T�m V�u Dung Qu� S�");
	SetTask(FN_WP,4);
end

--���ǰ3�������
function exam_fault1()

local strTalk = {
	"Sai r�i! Nh�ng c�u n�y kh�ng ph�i ai c�ng tr� l�i ���c! Khi n�o bi�t r�i h�y ��n."
	}
	TalkEx("",strTalk);
end

--����4�������
function exam_fault2()

local strTalk = {
	"Sai r�i! H�y nh� k�! K� ��nh ta m�t c�n l� Thi�u L�m t�c gia, Thi�u L�m t�c gia!"
	}
	TalkEx("",strTalk);
end

-- �����ŵĶԻ�1
function task_005()

local strTalk = {
	"Mu�n gia nh�p b�n gi�o? Hay l�m! Ta th�y t� ch�t ng��i c�ng kh�. Ta ��ng �!",
	"Kh�ng ph�i c� v�n �� c�n h�i?",
	"Th��ng th�c v� l�m trung nguy�n? Ta khinh! Ta c�n g� ph�i h�c h�i b�n ch�ng?",
	"V�y l� ng��i ��ng � cho t�i h� nh�p gi�o?",
	"���ng nhi�n kh�ng d� d�ng nh� v�y! Ng��i ��a ta {1 l��ng b�c}! Gi�o ph�i c�n ph�i t�ng b��c ph�t tri�n."
	}
	TalkEx("task_006",strTalk);
end

-- �����ŵĶԻ�2
function task_006()

local strSay = {
	"V�y �!",
	"��a 1 l��ng b�c/pay_money",
	"Kh�ng ��a/no_pay"
	}
	SelectSay(strSay);
end

--��һ�����Ӹ����ź�
function pay_money()

local strTalk = {};
	
	if Pay(100) == 1 then	
		strTalk = {
			"H�y �i t�m {T�y �� Qu� S�} �i! �ng ta � {ph�ng b�n c�nh}."
		}
		TalkEx("",strTalk);
		TaskTip("T�m T�y �� Qu� S�");
		Msg2Player("T�m T�y �� Qu� S�");
		SetTask(FN_WP,5);
	else
		strTalk = {
			"Kh�ng �� ti�n �? H�y t�m c�ch �i! N�u kh�ng s� kh�ng ch�ng t� th�nh � mu�n nh�p gi�o c�a ng��i."
			}
		TalkEx("",strTalk);
	end
end

--������������
function no_pay()

local strTalk = {
				"Kh�ng �� ti�n �? H�y t�m c�ch �i! N�u kh�ng s� kh�ng ch�ng t� th�nh � mu�n nh�p gi�o c�a ng��i."
			}
	TalkEx("",strTalk);
end

-- �����ŵĶԻ�3
function task_007()

local strTalk = {
	"Ha ha! V�a ��ng t�i h�m qua thua s�ch tr�n, h�m nay l�i c� 1 l��ng b�c, th�ng n�y coi nh� kh�ng ph�i ��i r�i!",
	"����",
	"Sao l�i quay l�i? {T�y ��} � {ph�ng b�n c�nh}. H�y �i t�m h�n!",
	"����"
   }
  TalkEx("",strTalk);
end

--����ͼ�Ի�
function task_008()

local strTalk = {
	"3 ng��i �� �� ��ng � c�? V�y ��n l��t ta h�i ng��i, n�u tr� l�i ���c xem nh� qua �i.",
	"Xin �a t�!"
	}
	TalkEx("task_009", strTalk);
end

--�ش���ͼ����1
function task_009()

local strSay = {
	"Trong v� l�m mu�n �i v� c�c th�nh, ph��ng ph�p th��ng d�ng l�?",
	"1.T�m Xa phu/exam_pass5",
	"2.T�m Ch� t�u l�u/exam_fault3",
	"3.T�m Ch� th��ng h�i/exam_fault3",
	}
	SelectSay(strSay);
end

--�����ͼ����1
function exam_pass5()

local strSay = {
	"Giang h� h�u b�i mu�n th�ng ��ng c�p nhanh, ph��ng ph�p hi�u qu� nh�t l�?",
	"1.B�y b�n/exam_fault3",
	"2.L�m nhi�m v� Th��ng h�i/exam_pass6",
	"3.��nh c�c g�/exam_fault3",
	}
	SelectSay(strSay);
end

--�����ͼ����2
function exam_pass6()

local strSay = {
	"N�u h�nh trang c� nhi�u ng�n l��ng, mu�n g�i m�t �t, th��ng s� d�ng ph��ng ph�p n�o?",
	"1.Mua b�n h�ng h�a./exam_fault3",
	"2.G�i � r��ng ch�a ��/exam_pass7",
	"3.��a cho m�t ng��i kh�c gi� gi�m/exam_fault3",
	}
	SelectSay(strSay);
end

--�����ͼ����2
function exam_pass6()

local strSay = {
	"N�u h�nh trang c� nhi�u ng�n l��ng, mu�n g�i m�t �t, th��ng s� d�ng ph��ng ph�p n�o?",
	"1.Mua b�n h�ng h�a./exam_fault3",
	"2.G�i � r��ng ch�a ��/exam_pass7",
	"3.��a cho m�t ng��i kh�c gi� gi�m/exam_fault3",
	}
	SelectSay(strSay);
end

--�����ͼ�����
function exam_fault3()

local strTalk = {
	"Ch� c� th� c�ng kh�ng bi�t! L�m sao h�nh t�u giang h�?"
	}
	TalkEx("",strTalk);
end

-- �����ͼ����3
function exam_pass7()

local strTalk = {
	"Ng��i c�ng c� ch�t ki�n th�c! Ng� ��c gi�o c�n nh�ng ng��i c� kinh nghi�m giang h� nh� ng��i, ch�ng l�u sau Ng� ��c gi�o ta s� vang danh thi�n h�!",
	"Ngh�a l��",
	"Ng��i h�y �i t�m {C�u S�ch}! N�i l� b�n ta �� ��ng � r�i!",
	"�a t� T�y �� Qu� S�"
	}
	TalkEx("",strTalk);
	TaskTip("��n T�y B�c Ng� ��c Gi�o t�m Th� t�a Qu� S� C�u S�ch");
	Msg2Player("��n T�y B�c Ng� ��c Gi�o t�m Th� t�a Qu� S� C�u S�ch");
	SetTask(FN_WP,6);
end



--�Ѿ�����λ��ʦ�Ի��󷵻ع��ᴦ
function task_010()

local strTalk = {
	"Th� n�o? B�n h� ��ng � c� ch�a? H� c� n�i g� kh�ng?",
	"Tam v� Qu� S� ��u �� ��ng � nh�ng Ph��ng Vi�n Qu� S� h�i c� th�nh ki�n v�i Thi�u L�m ph�i.",
	"Ha ha! Tr��c ��y y c� kh�c m�c v�i Thi�u L�m. C�n V�u Dung c� ��i ti�n mi kh�ng?",
	"C�u S�ch Qu� S� ��u bi�t c� �?",
	"T�t x�u c�a h� sao ta l�i kh�ng bi�t. B�n h� v�a th� dai, c� b�c� cho n�n 3 ��i gi�o ch� c�a b�n gi�o ��u l� n� l�u. Nh�ng ng��i ��ng v� th� m� xem th��ng h�, b�n h� ai c�ng b�n l�nh n�u kh�ng �� kh�ng th� ng�i � v� tr� ��. Ch� c�n ng��i c� b�n l�nh s� c� ng�y ng��i n�i danh tr�n giang h�. H�y nh� l�y!",
	"Thu�c h� hi�u r�!",
	"Gi� ng��i h�y �i t�m B�ch gi�o ch�! H�y n�i t� v� Qu� S� �� ��ng � cho ng��i nh�p gi�o.",
	"�a t� C�u S�ch Qu� S�!"
	}
	TalkEx("",strTalk);
	SetTask(FN_WP,7);
	TaskTip("��n t�m B�ch Doanh Doanh xin gia nh�p Ng� ��c gi�o");
	Msg2Player("��n t�m B�ch Doanh Doanh xin gia nh�p Ng� ��c gi�o");
end

--���Լ����嶾����
function task_011()

local strTalk = {
	"Th� n�o? B�n h� ��ng � c� ch�a?",
	"B�n h� ��u �� ��ng �.",
	"Nh� v�y xem nh� ng��i �� gia nh�p Ng� ��c gi�o. Sau n�y h�y c� g�ng luy�n c�ng ph�t d��ng quang ��i tuy�t h�c b�n gi�o.",
	"Thu�c h� hi�u r�!",
	"Gi� ng��i �� c� th� h�c v� c�ng b�n gi�o. N�u mu�n h�c Kh�ng Thi thu�t ��n t�m Ng� Ng�n; n�u mu�n h�c Luy�n ��c thu�t t�m Li�u T�n Tr�c!"
	}
	
	TalkEx("",strTalk);
	SetTask(FN_WP,8);
	SetPlayerFaction(7);
	i=GetBody();
	if i==1 then 
		AddItem(0,109,125,1,1);
		AddItem(0,108,123,1,1);
	elseif i==2 then
		AddItem(0,109,126,1,1);
		AddItem(0,108,124,1,1);
	elseif i==3 then
		AddItem(0,109,127,1,1);
		AddItem(0,108,125,1,1);
	else
		AddItem(0,109,128,1,1);
		AddItem(0,108,126,1,1);
	end
	ModifyReputation(10,0);
	TaskTip("B�n �� gia nh�p Ng� ��c gi�o, c� th� b�i s� h�c ngh�!")
	
	-- ����������������״̬
	SetTask(FN_SL, 0);
	SetTask(FN_EM, 0);
	SetTask(FN_WD, 0);
	SetTask(FN_GB, 0);
	SetTask(FN_TM, 0);
	SetTask(FN_YM, 0);
	SetTask(FN_YMM, 0);
end

function task_exit()

end;

function fix_wp()
	SetTask(FN_WP,0);
	Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! <sex> c� th� gia nh�p m�n ph�i l�i.",0);
end;