
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask_head.lua")
Include("\\script\\task\\world\\task_award.lua")

-- ��������ش��ڵ��߸�ѡ��
strTeachSelect = {

		"Thao t�c c� b�n/Teach_Basic",
		"T�ng c�p nh�n v�t/Teach_Level",
		"Ph�n ph�i �i�m ti�m n�ng/Teach_Point",
		"Ki�m ti�n/Teach_Earn",
		"Gia nh�p m�n ph�i/Teach_Faction",
		"Hi�n c� th� l�m /Teach_Something",
		"Ta �� hi�u r�i/Teach_002"
		

}

-- ��һ�ν�����Ϸ����ʱ�ĶԻ�
function Teach_001()
	if GetAntiEnthrallmentStatus() == 2 then
		return
	end
	local strMain = {
	
		"Hoan ngh�nh ��n v�i th� gi�i <color=yellow>V� L�m 2<color>! Ta chuy�n h��ng d�n t�n th�! Tr�ng b�n tr� th�t l� ��ng y�u!",
		"�ng th�t l� t�t qu�!/Teach_001_Okay",
		"C�i g� ta c�ng hi�u h�t r�i!/Teach_003"
		
	}
	Say(strMain[1],2,strMain[2],strMain[3]);
	return

end


function Teach_001_Okay()

	local strMain = {
	
		"T�t qu�! T�n th� nh� ta c�n nhi�u th� ph�i h�c h�i.",
	
	}
	Say(strMain[1],7,strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- ���ѡ����ȫ�����׺�ѡ��ϣ����ѧ�����ɡ�֮��
function Teach_002()
	
	if (TE_GetTeachState()==1) then -- �������ǵ�һ�ν�����Ϸ��������
		Teach_003()
	else -- ������Ժ������������
		Say("Xem ng��i t� ch�t c�ng kh�ng t�, sau n�y c� g� kh�ng r� c� ��n t�m ta. Ta c� th� gi�p ng��i �� th�ng kinh m�ch <color=red>T�y �i�m ti�m n�ng<color>.", 0);
	end
	 
	return
	
end


-- ���ѡ����û�����ㆪ��֮��
function Teach_003()
	Say("Sau n�y m�i khi t�ng  c�p nh� quay l�i g�p ta nh�n <color=yellow>Nhi�m v�<color>, h�c m�t v�i kinh nghi�m giang h�, cho ��n l�c ��t c�p 10 gia nh�p m�n ph�i. Th� n�o h�?",2,"T�t qu�! �a t� ti�n b�i!/Teach_005","Ta kh�ng h�ng th�!/Teach_004");
end


-- ����Ҿ��ú�ڵ�ʱ�򣬿�������ѡ��
function Teach_004()

--	LearnSkill("�Ṧ")
--	LearnSkill("����")
--	TE_SetTeachState(25) -- �����������Ϊ 25��ֱ����ɽ�������
--	SetTask(805,1);
--	Msg2Player("��ѧ�����Ṧ��");
--	Msg2Player("��ѧ���˴�����");
--	Msg2Player("��õ���һ�������䣡");
	Say("Tr��c khi gia nh�p m�n ph�i �i�u g� kh�ng hi�u c� ��n t�m ta, c�ng sai <color=red>�i�m ti�m n�ng<color> c� th� t�y l�i, l�o lu�n s�n s�ng h� tr�.",0);
	TE_SetTeachState(25) -- �����������Ϊ 25��ֱ����ɽ�������
	SetTask(807,0);	--�ر���������
end

function acc_task()
	i=GetTask(807)
	if i==1 then
		Say("Kh�ng ph�i ng��i �ang l�m nhi�m v� sao?",0);
	else
		TE_SetTeachState(1)  --�����������
		SetTask(807,1);		--������������	
		TE_SetTeachPro(2)	--�Ի����
		Talk(1,"TE_SetTeachAdd","Kh� �i v� bi�n, quay ��u l� b�, cu�i c�ng ng��i �� hi�u ra � t�t c�a ta. Ch� c�n h�n c�p 2 c� th� ��n t�m ta nh�n 8 nhi�m v�, nhanh ch�n l�n!");
                if GetAntiEnthrallmentStatus() == 1 then
                    ModifyExp(5)
                elseif GetAntiEnthrallmentStatus() == 2 then

                else
                    ModifyExp(10)
                end
	end
end;


function Teach_005()
 	-- TEACH_SEASONNPC_ID ӦΪ 2
 	
	Talk(3,"TE_SetTeachAdd","Ng��i b�n l�nh h�n ng��i! D��i c�p 10 m�i khi <color=yellow>t�ng c�p<color> nh� ��n t�m ta nh�n nhi�m v�.","Ngo�i ra, ta c�n gi�p ng��i <color=red>T�y �i�m ti�m n�ng<color>, gi� ng��i c� th� an t�m c�ng �i�m.","Nh�n <color=yellow><F3><color> m� trang b� nh�n v�t, d�ng <color=yellow>�i�m kinh nghi�m<color> �� t�ng c�p.");
	if GetAntiEnthrallmentStatus() == 1 then
            Earn(10)
	    ModifyExp(5)
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
            Earn(20)
            GivePlayerExp(SKeyXinShou,"yeshou1")
        end

	SetTask(807,1);	--������������
	Msg2Player("T�n th� th�n m�i khi t�ng c�p nh� t�m D� T�u nh�n nhi�m v� T�n th�!");
	TE_SetTeachPro(2)
end


-- ��ҵȼ����˵ڶ�����ʱ��ǰ���Ի�
function Teach_Level02()
local strMain =  "Ng��i l�n l��t ��i tho�i v�i <color=yellow>Ch� ti�m v� kh�<color>, <color=yellow>Ch� ti�m ph�c trang<color>, <color=yellow>Ch� ti�m t�p h�a<color> v� <color=yellow>Ch� d��c �i�m<color> trong th�nh. N�u g�p v�n �� g� c� th� nh�n <color=yellow><F11><color> t�m hi�u th�m nhi�m v�."
	Say(strMain,1,"Bi�t r�i!/TE_SetTeachAdd"); -- TEACH_SEASONNPC_ID ӦΪ 3
	Msg2Player("Nh�n nhi�m v� �i t�m ch� ti�m v� kh�!");
	TE_SetTeachPro(1)

end


-- ����ڵȼ���ʱ���������ϰ�ĶԻ�
function Teach_Level02_01()

	local strMain = {
	
		"Ng��i ch�nh l� ng��i m� D� T�u nh�c ��n �? L�n sau �i ���ng nh� nh�n <color=yellow><R><color> �� �i cho nhanh. � ��y c� m�t s� binh kh� kh�ng bi�t ng��i c� th�ch kh�ng?",
		"Thanh ki�m n�y tuy�t qu�!",
		"Nh�n <color=yellow><F4><color> m� t�i h�nh trang, <color=yellow><F3><color> m� trang b� nh�n v�t, d�ng chu�t tr�i ��t v�t ph�m v�o � t��ng �ng �� s� d�ng.",
	}
	
	TE_Talk(getn(strMain),"Teach_Level02_01_01",strMain);
end


function Teach_Level02_01_01()
	Say("C� mu�n ta gi�i thi�u ��n c�c ti�m kh�c trong th�n n�y kh�ng?",2,"C�m phi�n ti�n b�i!/acc_wuqi","Kh�ng c�n ��u!/rej_wuqi");
end

function acc_wuqi()
local strMain = {
	"N�i ��y c� <color=yellow>Ti�m v� kh�<color>, <color=yellow>Ti�m trang ph�c<color>, <color=yellow>T�p h�a<color>, <color=yellow>D��c �i�m<color>, T�u l�u, Kim ho�n, ti�n trang. <color=yellow>Ti�m v� kh�<color>, <color=yellow>ti�m trang ph�c<color> b�n trang b� c� b�n d��i c�p 4. <color=yellow>D��c �i�m<color> b�n d��c li�u d��i c�p 2. <color=yellow>T�p h�a<color> b�n c�c lo�i b�a ch�, v�t d�ng, ngo�i ra c�n tu s�a v� gi�m ��nh v�t ph�m. <color=yellow>Ti�n trang<color> c� th� ��i ng�n phi�u. Xem tr�n b�n �� nh� s� th�y d� d�ng.",
	"C�ng gi�ng nh� ti�n b�i ��y �?",
	"Trong tr� ch�i c�n m�t s� nh�n v�t cung c�p c�c ch�c n�ng ��c bi�t nh�: D� T�u, Gi�m ��nh s�, S� gi� m�n ph�i, S� gi� Bang ph�i, ng��i ��u gi�, ng��i v�n ��p�",
	}
	TE_Talk(getn(strMain),"acc_wuqi_01",strMain);
end;


function acc_wuqi_01()
local strMain = {
	"Nh�ng ng��i n�y l�m g�?",
	"<color=yellow>D� T�u<color> h��ng d�n cho T�n th�, <color=yellow>S� gi� m�n ph�i<color> gi�p ng��i ch�i d� d�ng gia nh�p m�n c�c m�n ph�i, <color=yellow>S� gi� Bang ph�i<color> gi�p ng��i ch�i ki�n l�p, gia nh�p, r�i kh�i bang ph�i, <color=yellow>Ng��i ��u gi�<color> thu m�t s� ph� nh�t ��nh gi�p ng��i ch�i b�n v�t ph�m, <color=yellow>ng��i v�n ��p<color> thu th�p tin t�c ng��i ch�i tr�n m�ng, gi�p gi�i ��p m�i th�c m�c.",
	"Ta hi�u r�i!"
	}
	TE_Talk(getn(strMain),"rej_wuqi",strMain);
end;





function rej_wuqi()
	local strMain = {
		"Ta kh�ng c�n g� �� n�i, ng��i mau t�m ch� ti�m trang ph�c �i!",
	}
	TE_Talk(getn(strMain),"Teach_Level02_02",strMain);
end

-- ������������ϰ�Ի�������ı�����������ҵõ�����
function Teach_Level02_02()
        if GetAntiEnthrallmentStatus() == 1 then
            AddItem(0,2,14,1)
	    Msg2Player("B�n nh�n ���c 1 c�y Hi�p Thi�u ki�m!");
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
	    
        end

        Msg2Player("��n g�p ch� ti�m trang ph�c!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 4
end


-- ������������ϰ�Ի����������װ���ϰ�ĶԻ�
function Teach_Level02_03()
	local strMain = {
		"Ti�m ta b�n trang ph�c t�t nh�t v�ng n�y c� th� gi�p ng��i t�ng ph�ng th� n�i ngo�i l�n s�t th��ng. L�a ch�n v�i m�n cho m�nh �i!",
		"T�t qu�, t�ng cho ta �?",
		"D�o n�y l�m �n kh�m kh�, ng��i c� th� ch�n m�t trong ba c�i, c�n l�i �� ta b�n cho ng��i kh�c.",
		"Nh�ng th� n�y c� g� kh�c bi�t kh�ng?"		
	}
	
	TE_Talk(getn(strMain), "Teach_Level02_04", strMain);

end


-- ������������ϰ�Ի����������װ���ϰ�ĶԻ�
function Teach_Level02_04()

	Say("S�c ph�ng th� c�a n�n v� gi�y th�p h�n trang ph�c. Ng��i mu�n ch�n lo�i n�o?",3,"Ta c�n n�n/Teach_Level02_04_Hat","Ta c�n trang ph�c/Teach_Level02_04_Clothing","Ta c�n gi�y/Teach_Level02_04_Shoes")

end

-- ���ѡ����ñ��
function Teach_Level02_04_Hat()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,103,1,1)
	elseif i==2 then
		AddItem(0,103,19,1)
	elseif i==3 then
		AddItem(0,103,37,1)
	else
		AddItem(0,103,55,1)
	end
    end
		TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 5
		Teach_Level02_05()
end

-- ���ѡ�����·�
function Teach_Level02_04_Clothing()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,100,1,1)
	elseif i==2 then
		AddItem(0,100,19,1)
	elseif i==3 then
		AddItem(0,100,37,1)
	else
		AddItem(0,100,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 5
	Teach_Level02_05()
end

-- ���ѡ����Ь��
function Teach_Level02_04_Shoes()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,101,1,1)
	elseif i==2 then
		AddItem(0,101,19,1)
	elseif i==3 then
		AddItem(0,101,37,1)
	else
		AddItem(0,101,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 5
	Teach_Level02_05()
end


-- ������˶���֮��������װ���ϰ�Ի�
function Teach_Level02_05()
	
	local strMain = {
		"Nh�n <color=yellow><F4><color> m� giao di�n h�nh trang, <color=yellow><F3><color> m� trang b� nh�n v�t, d�ng chu�t tr�i ��a trang ph�c (n�n, gi�y) v�o thanh trang b� �� ti�n s� d�ng.",

	}
	TE_Talk(getn(strMain), "Teach_Level02_05_01", strMain);
end

function Teach_Level02_05_01()
	Say("V�t ph�m trong game phong ph�, ng��i mu�n t�m hi�u ch�ng kh�ng?",2,"C�m phi�n ti�n b�i!/acc_fuzhuang","Gh� ch�i th�i!/rej_fuzhuang");
end

function acc_fuzhuang()
local strMain = {
		"V�t ph�m chia l�m 4 lo�i g�m: <color=yellow>trang b�<color>, <color=yellow>v�t ph�m ti�u hao<color>, <color=yellow>v�t ph�m thu th�p<color> v� <color=yellow>v�t ph�m nhi�m v�<color>.",
		"<color=yellow>Trang b�<color> g�m v� kh�, n�n, trang ph�c, gi�y, trang s�c, trong �� v� kh�, n�n, trang ph�c, gi�y ch� y�u t�ng s�c ��nh, trang s�c ch� y�u t�ng m�t s� thu�c t�nh ��c bi�t. Trang b� s� c�p c� th� mua t�i ti�m, c�n trang b� cao c�p ph�i th�ng qua thu�t ��c luy�n trong k� n�ng s�ng m�i c�. Ph�n l�n trang b� ��u ph�n bi�t gi�i t�nh, ��ng c�p, th� h�nh v� v� c�ng l�u ph�i, ngo�i ra th� c��i v� m�t t�ch c�ng c� th� trang b�.",
		"<color=yellow>v�t ph�m ti�u hao<color> ch� y�u g�m d��c li�u, th�c ph�m, v� m�t s� nguy�n li�u cho k� n�ng s�ng, ch�ng c� th� x�p ch�ng trong thanh v�t ph�m. D��c li�u c�p th�p c� th� mua t�i ti�m; nguy�n li�u cho k� n�ng s�ng th�ng qua ��nh qu�i c� ���c ho�c l�m nhi�m v�; th�c ph�m v� d��c li�u cao c�p ph�i th�ng qua b�o ch�. M�t nguy�n li�u c� th� n�ng cao ��ng c�p nh�ng c�n ph�i ch�n l�a k�.",
		}		
	TE_Talk(getn(strMain), "acc_fuzhuang_01", strMain);		
end;


function acc_fuzhuang_01()
local strMain = {
		"<color=yellow>v�t ph�m thu th�p<color> ch� nh�ng v�t ph�m ��c bi�t ��nh qu�i r�i ra. Ng��i ch�i cho c�c ti�m, Th��ng Nh�n th�n b� ho�c d�ng l�m nhi�m v�.",
		"<color=yellow>v�t ph�m nhi�m v�<color> ch� y�u ch� nh�ng v�t ph�m gi�p ng��i ch�i l�m nhi�m v�, b�n c�nh �� c�ng c� m�t s� v�t ph�m ��c bi�t, kh�ng th� v�t b� ho�c giao d�ch.",
		"V�t ph�m sau khi v�t ra b�n ngo�i, ng��i ch�i xung quanh c� th� nh�t l�y. Ngo�i ra khi r�t ch�ng t�n t�i trong th�i gian nh�t ��nh, qu� th�i gian t� ��ng bi�n m�t.",
		"Ch� � v�t ph�m c� tr�ng l��ng nh�t ��nh, n�u v��t qu� 50% s� �nh h��ng ��n t�c �� h�i ph�c m�u, qu� 95% kh�ng th� chi�n ��u.",
		}		
	TE_Talk(getn(strMain), "rej_fuzhuang", strMain);		
end;


function rej_fuzhuang()
	local strMain = {
		"Ta �� h��ng d�n xong, ng��i c� th� qua ch� ti�m t�p h�a th�nh gi�o.",
	}
	TE_Talk(getn(strMain),"",strMain);
	Msg2Player("��n g�p Ch� T�p h�a!");
end;



-- ������ӻ����ϰ�ĶԻ�
function Teach_Level02_06()
	local strMain = {
		"Kh�ch quan c�n g�? Ch� ta c� ��y �� c�c m�t h�ng, g�m <color=yellow>v�t ph�m h� tr�<color>, <color=yellow>b�a ch�<color> v� <color=yellow>v�t d�ng h�ng ng�y<color>.",
		"<color=yellow>v�t ph�m h� tr�<color> ch� nh�ng v�t ph�m d�ng cho c�c chi�u th�c v� c�ng ��c bi�t nh� M�c T� ki�m ph�p, Th�i Huy�n th�n c�ng; <color=yellow>b�a ch�<color> c� gi�m ��nh ph� v� h�i th�nh ph�; <color=yellow>v�t d�ng h�ng ng�y<color> ch� v�t ph�m nh� l� luy�n ��n, k�o...",
		"Ngo�i nh�ng v�t ph�m tr�n c�n g� n�a kh�ng?",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_01", strMain);
end


function Teach_Level02_06_01()
	Say("Ng��i �� h�i nh� v�y th� ta c�ng gi�i thi�u lu�n v� {Trang b� b�t qu�i}.",2,"Ta th�ch quan t�m chuy�n n�y!/acc_zahuo","C�i g� ta c�ng bi�t h�t r�i!/rej_zahuo");
end;

function acc_zahuo()
	local strMain = {
		"Sau n�y s� b�t th�y <color=yellow>trang b� c� 3 thu�c t�nh �n<color> v� <color=yellow>H�o th�ch<color> t�ch t� linh kh� tr�i ��t. Trang b� thu�c t�nh �n g�m v� kh�, n�n, trang ph�c v� gi�y. H�o th�ch c� �m d��ng 2 lo�i. �em 3 vi�n h�o th�ch theo th� t� �m d��ng t�m th� r�n <color=red>kh�m n�m<color> l�n trang b� �n l� c� th� h�p th�nh m�t m�t m�n trang b� mang <color=yellow>thu�c t�nh B�t qu�i<color>. M�t s� H�o th�ch mang thu�c t�nh ph� gi�p t�ng c��ng th�m cho trang b� sau khi ���c kh�m n�m.",	
		"Khi ng��i ch�i c� t� 2 trang b� b�t qu�i tr� l�n ch�ng s� t� k�ch ho�t l�n nhau t� �� s�n sinh ra thu�c t�nh ph�. V� d� Can ki�m v� Kh�n m�o k�ch ho�t xong s� hi�n ra m�t thu�c t�nh m�i tr�n m�i trang b�. N�u 4 trang b� ��u l� trang b� b�t qu�i th� c� th� k�ch ho�t 12 thu�c t�nh ph�.",
		"Hay qu�! Ngo�i ��nh qu�i ra c�n c�ch n�o nh�n ���c trang b� b�t qu�i n�a kh�ng?",
		"Ng��i c�ng c� th� h�c c�ch ��c luy�n trang b� qua <color=yellow>k� n�ng s�ng<color>, thu th�p nguy�n li�u trong l�c ch� t�o trang b� th�m h�o th�ch �m d��ng v�o n�u th�nh c�ng s� nh�n ���c trang b� b�t qu�i. ��ng th�i ch�ng c�n s�n sinh <color=yellow>thu�c t�nh ng� h�nh<color>. Nh�ng t� l� th�nh c�ng r�t th�p, �t ng��i l�m ���c trang b� n�y.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_02", strMain);
end;


function Teach_Level02_06_02()
	local strMain = {
		"Thu�c t�nh ng� h�nh c� t�c d�ng g�?",
		"<color=yellow>Thu�c t�nh ng� h�nh<color> ch� v� kh� v� trang ph�c: V� kh� ch� l�c ��nh c�a ng��i ch�i, trang ph�c ch� ph�ng th� c�a ng��i ch�i, v� kh� kh�ng mang thu�c t�nh ng� h�nh, trang ph�c ���c xem kh�ng thu�c t�nh. Thu�c t�nh ng� h�nh h�n kh�ng thu�c t�nh l� 25% cho s�c c�ng th�; Ng� h�nh d�a theo Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim th� t� t�nh th�m 50% cho c�ng th�; ngo�i ra c�ng th� n�u ��ng thu�c t�nh th� s�c ��nh gi�m 25%.",
		"Hay qu�, ta nh�t ��nh h�c k� n�ng ch� t�o trang b�.",
	}
	TE_Talk(getn(strMain), "rej_zahuo", strMain);
end;


function rej_zahuo()
	local strMain = {
		"Ch� ta ch� c� 2 t�m <color=yellow>Gi�m ��nh ph�<color> th�i. V�t ph�m ��nh qu�i r�i ra ��u ch�a qua gi�m ��nh. Nh�n <color=yellow><F4><color> m� t�i h�nh trang, d�ng chu�t ph�i nh�n v�o gi�m ��nh ph� sau �� ��a v�o trang b� l� c� th� bi�t ���c thu�c t�nh c�a ch�ng.",
		"Th�n k� v�y sao? �a t� �� ch� gi�o!"
	}
	TE_Talk(getn(strMain), "Teach_Level02_07", strMain);
end;




-- ������ӻ����ϰ�Ի�������õ���Ʒ���ı��������
function Teach_Level02_07()
    if GetAntiEnthrallmentStatus() == 0 then
	AddItem(2,5,1,2)
	Msg2Player("B�n nh�n ���c 2 t�m Gi�m ��nh ph�!")
    elseif GetAntiEnthrallmentStatus() == 1 then

    else
	AddItem(2,5,1,1)
	Msg2Player("B�n nh�n ���c 1 t�m Gi�m ��nh ph�!")
    end
    Msg2Player("��n g�p Ch� D��c �i�m !");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 6
end


-- �����ҩ���ϰ�ĶԻ�
function Teach_Level02_08()
	Say("Ng��i m�i b��c ch�n ra giang h� c�ng n�n h�c h�i m�t ch�t ki�n th�c v� y d��c.",2,"C�m phi�n ti�n b�i!/acc_yaodian","Gh� ch�i th�i!/rej_yaodian");
end


function acc_yaodian()
local strMain = {
	"D��c li�u g�m <color=yellow>ph�c h�i sinh l�c<color>, <color=yellow>ph�c h�i n�i l�c<color>, <color=yellow>tr� li�u ngo�i th��ng<color>, <color=yellow>tr� li�u n�i th��ng<color> v� <color=yellow>tr� li�u b�ng, ��c<color>; d��c li�u h�i ph�c sinh l�c c� th� mua t�i d��c �i�m, d��c li�u h�i ph�c n�i l�c r�t �t gi� l�i cao, c�n m�t s� d��c li�u tr� c�c tri�u ch�ng b�ng, ��c...th� c�ng kh� t�m.",
	"D��c li�u c� b�n c� th� mua t�i l�o phu, nh�ng d��c li�u cao c�p ph�i th�ng qua b�o ch� c�a th�n y. N�u ng��i c� h�ng th�, ��t c�p 10 c� th� t�m <color=yellow>Du Ph��ng ��i phu<color> h�c thu�t b�o ch� thu�c.",
			}
	TE_Talk(getn(strMain), "rej_yaodian", strMain);
end;


function rej_yaodian()
	local strMain = {
		"�i l�i trong giang h� nh� c�n th�n, n�u c� b� th��ng l�p t�c quay l�i t�m ta. Ta c� 2 b�nh <color=yellow>Kim S�ng t�n<color>, h�y mang theo c� l�c h�u d�ng.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_09", strMain);
end;


-- �����ҩ���ϰ�Ի�������õ���Ʒ���ı��������
function Teach_Level02_09()
    if GetAntiEnthrallmentStatus() == 0 then
        Earn(100)
	ModifyExp(30)
	AddItem(1,0,2,2)
	Msg2Player("B�n nh�n ���c 2 b�nh d��c li�u!");
    elseif GetAntiEnthrallmentStatus() == 1 then
        Earn(50)
	ModifyExp(15)
	AddItem(1,0,2,1)
	Msg2Player("B�n nh�n ���c 1 b�nh d��c li�u!");
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

    	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 7
    	Msg2Player("Ho�n th�nh nhi�m v� th�m h�i, ��n c�p 3 �i t�m D� T�u!");
	TE_SetTeachPro(2)
end


-- ��ҵȼ�������������ʱ������Ұ�ŶԻ�
function Teach_Level03()
	Say("Tr�ng ng��i v�t v�! Nh�n ph�m <color=yellow><R><color> �� �i cho nhanh. C� b� l�c ���ng kh�ng?",2,"Ta l�c ���ng r�i!/acc_milu","Kh�ng sao!/rej_milu")
end


function acc_milu()
	local strMain = {
		"<color=yellow>B�n �� nh�<color> � g�c ph�i tr�n m�n h�nh. <color=yellow>D�u ch�m v�ng<color> x�c ��nh v� tr� ng��i �ang ��ng. Nh�p v� tr� v�o 2 <color=yellow>T�a ��<color> X, Y �� x�c ��nh n�i c�n ��n.",
		"C� th� nh�n ph�m <+> tr�n b�n ph�m ho�c d�ng chu�t �� ph�ng to, thu nh� b�n ��<color>",
	}
	TE_Talk(getn(strMain), "rej_milu", strMain);
end;


function rej_milu()
	local strMain = {
		"Sau n�y c� g� kh�ng r� c� th� ��n g�p ta ho�c nh�n <color=yellow><F11><color> �� xem h��ng d�n.",
		"Hi�u r�i, �a t� �� ch� gi�o!",
		"V�i c�ng l�c c�a ng��i hi�n gi� ra ngo�i r�t nguy hi�m! N�n ��n <color=yellow>V� s�<color> h�c v�i chi�u ph�ng th�n. Tr��c khi ��n �� nh� t�m m�t mi�ng <color=yellow>Th�t th�<color> cho �ng ta.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain);  -- TEACH_SEASONNPC_ID ӦΪ 8
	Msg2Player("Nh�n nhi�m v� �i t�m m�t mi�ng th�t th� cho v� s�.");
	TE_SetTeachPro(1)
end;




-- �������ʦ�ĶԻ�
function Teach_Level03_01()
	local strMain = {
		"D� t�u b�o ta ��n t�m �ng h�c m�t v�i m�n v�.",
		"���c th�i, tr��c ti�n ta s� d�y ng��i <color=yellow>ng�i thi�n<color=>.",
		"Ng�i thi�n���� l�m g�? Ta ch� mu�n h�c v�.",
		"Ng��i ��ng xem th��ng ng�i thi�n, n� c� th� gi�p ng��i h�i ph�c sinh l�c v� n�i l�c.",
		"Ng�i b�ng c�ch n�o v�y?",
		"Nh�n ph�m <color=yellow><V><color> ng�i xu�ng kh� huy�t s� t� t� h�i ph�c.",
		"Hi�u r�i!",		
		}
	TE_Talk(getn(strMain), "Teach_Level03_01_01", strMain);
end


function Teach_Level03_01_01()

	Say("�� ta ch� ng��i m�t v�i c�ch �� chi�n ��u.",2,"T�t qu�, phi�n �ng ch� gi�o./acc_killnpc","Th�i �� ta t� t�m hi�u/rej_killnpc")
end

function acc_killnpc()
	local strMain = {
		"Chi�n ��u v�i qu�i gi�p ng��i ch�i l�m nhi�m v�t�ng <color=yellow>�i�m kinh nghi�m<color>. C� hai c�ch <color=yellow>chi�n ��u th��ng<color> v� <color=yellow>PK<color>!",
		"PK l� g�?",
		"Chi�n ��u PK ta s� n�i sau, gi� ta mu�n nh�c ��n chi�n ��u th��ng gi�a ng��i ch�i v�i NPC (qu�i), ng��i c� th� ra ngo�i th�nh nh�p chu�t v�o qu�i m� ng��i mu�n ��nh. N�u gia nh�p m�n ph�i h�c ���c c�c chi�u th�c th� uy l�c ��nh qu�i s� t�ng g�p b�i.",
	}
	TE_Talk(getn(strMain), "acc_killnpc_01", strMain);
end;


function acc_killnpc_01()
	local strMain = {
		"N�u h� ���c qu�i ng��i s� nh�n ���c �i�m kinh nghi�m ho�c v�t ph�m; c�n n�u b� qu�i h� s� b� t�n th�t 1% kinh nghi�m hi�n t�i, 5% ng�n l��ng v� m�t s� �i�m danh v�ng.",
		"N�u ��nh qu�i c�n ch� � ��n �i�u g�?",
		"Khi ��nh qu�i c�n �� � ��n thanh m�u m�u xanh tr�n ��u, nh�n <color=yellow><F8><color> �� t�t m�, khi thanh m�u xanh chuy�n qua m�u v�ng cho th�y t�nh m�nh ng��i g�p nguy hi�m. Ngo�i ra ta c�n �� ph�ng c�c qu�i � xa ngo�i th�nh hay trong c�c m� cung.",
		"�ng c� th� k� cho ta nghe c�c NPC (qu�i) m�nh kh�ng?"
	}
	TE_Talk(getn(strMain), "rej_killnpc", strMain);
end;




function rej_killnpc()
	local strMain = {
		"NPC ch� y�u c�c ��ng v�t, m�t s� cao th� m�n ph�i...Ph��ng th�c chi�n ��u c�a ch�ng ph�n bi�t <color=yellow>t�n c�ng b� ��ng<color>, <color=yellow>t�n c�ng ch� ��ng<color>, <color=yellow>t�n c�ng nh�n r�<color>, <color=yellow>bao v�y<color>, <color=yellow>��nh l�n<color>, trong �� t�n c�ng ch� ��ng l� l�i h�i nh�t.",
		"T�n c�ng b� ��ng l� ta ��nh ch�ng m�i ��nh tr�, bao v�y v� ��nh l�n c�ng d� hi�u, v�y c�n t�n c�ng nh�n r� l� sao?",
		"M�t s� cao th� n�i c�ng tr��c khi xu�t chi�u ��u ph�i qua qu� tr�nh v�n kh�, b�n c�nh �� c�c NPC nhanh nh�n quan s�t ��nh tr� ��i ph��ng tr��c.",
		"T�t c� NPC ��u c� <color=yellow>thu�c t�nh ng� h�nh<color>, hi�u ���c t�nh t��ng sinh t��ng kh�c m� ch�n v� kh� th�ch h�p s� gi�p ta d� d�ng ��nh ch�ng.",
	}
	TE_Talk(getn(strMain), "rej_killnpc_01", strMain);
end;


function rej_killnpc_01()
	local strMain = {
		"Trang b� v� v� kh� thu�c t�nh ng� h�nh quan tr�ng ��n v�y sao!",
		"C�ng kh�ng h�n l� v�y nh�ng ph�i �� ph�ng NPC <color=yellow>thu�c t�nh �m<color>, ch�ng kh�ng s� v� kh� th��ng, v� kh� ng� h�nh, v� c�ng th�ng th��ng r�t kh� h� g�c ch�ng.",
		"Sao nhi�u v�y? Ta n�n tr�nh NPC n�o ��y?",
		}
	TE_Talk(getn(strMain), "rej_killnpc_02", strMain);
end;

function rej_killnpc_02()
	local strMain = {

		"Ch� � t�n c�a NPC, n�u <color=red>m�u ��<color> l� nguy hi�m. Ngo�i ra m�t s� qu�i Boss c� <color=blue>m�u xanh<color> ho�c <color=yellow>m�u v�ng<color>.",
		"Xin cho h�i th�m, ngo�i nh�ng t�n th�t khi b� qu�i h� g�c c� �nh h��ng ��n t�nh m�ng kh�ng?",
		"S� kh�ng c� t� vong, ch� c� b� �nh h��ng ��n <color=yellow>ngo�i th��ng<color> ho�c <color=yellow>n�i th��ng<color>, N�u b� h� g�c ng��i c� th� ch�n v� th�nh ho�c ��i Nga My ph�t gia ��n c�u. N�u c�u s�ng ch� m�t ti�n v� �i�m danh v�ng.",
		"Ch� d��c �i�m c� n�i n�u b� th��ng c� th� mua m�t s� d��c li�u qu� tr�, v�y ph�i mua ch�ng � ��u?",
		"Ng��i ��n t�m ��ng ��i �� h�c qua <color=yellow>k� n�ng luy�n ��n<color> l�y <color=yellow>th�nh d��c<color>, n�u kh�ng ph�i qua m�t th�i gian d�i m�i h�i ph�c.",
		"Xin �a t� �� ch� gi�o!",
		}
	TE_Talk(getn(strMain), "Teach_Level03_02", strMain);
end;


-- �������ʦ�Ի�������ѧ�����ܲ��ı��������
function Teach_Level03_02()

	if (GetItemCount(1,3,1) >= 1) then
		DelItem(1,3,1,1)
	else
		Say("N�u c� 1 mi�ng <color=yellow>Th�t th�<color> u�ng v�i r��u ��y th� tuy�t qu�!",0);
	end
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(100)
	ModifyExp(50)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(50)
	ModifyExp(25)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

	Msg2Player("Nhi�m v� ho�n th�nh ��t c�p 4 �i t�m D� T�u!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 9
	TE_SetTeachPro(2)
end


-- ��ҵ��˵ȼ� 4 ֮������Ұ�ŵĶԻ�
function Teach_Level04()

	local strMain = {
		"M�y ng�y qua c� g� vui kh�ng?",
		"Ch� c� g� th� v�! Ngo�i ��i tho�i v� ��nh qu�i ra, n�u c� ai �� <color=yellow>t�n g�u<color> th� vui bi�t m�y!",
		}
	TE_Talk(getn(strMain), "teach_chat", strMain); 
end		
		
function teach_chat()
	Say("���c! Ta s� ch� cho ng��i c�ch t�n g�u.",2,"Hay qu�, xin ng��i ch� gi�o!/acc_chat","Gh� ch�i th�i!/rej_chat")	
end;		
		
function acc_chat()
local strMain = {
		"Nh�n ph�m <color=yellow>Enter<Enter><color> ho�c ch�n c�c n�t <color=yellow>t�n s�<color> g�c tr�i b�n d��i m�n h�nh, trong khung t�n g�u nh�p tin t�c nh�n Enter<Enter> �� g�i �i.",
		"C� nhi�u t�n s� t�n g�u. <color=yellow>Ph� c�n<color> ng��i ch�i xung quanh nh�n th�y; <color=yellow>C�ng c�ng<color> ng��i ch�i to�n m�y ch� nh�n th�y; <color=yellow>H� th�ng<color> hi�n th� tin t�c; <color=yellow>��i ng�<color> ch� trong ��i m�i th�y; <color=yellow>M�n ph�i<color> ch� thu�c c�ng m�n ph�i m�i th�y; <color=yellow>Bang ph�i<color> ch� ng��i trong bang m�i th�y.",
		"Sao c� l�c ch�n t�n s� r�i v�n kh�ng t�n g�u ���c?",
		"�� ��m b�o ch�t l��ng t�n g�u, m�i t�n s� ��u c� h�n ch�. T�n s� m�n ph�i c�n ng��i ch�i ph�i gia nh�p m�n ph�i, gi�n c�ch 1 ph�t. T�n s� c�ng c�ng ��i h�i ng��i ch�i tr�n c�p 30, gi�n c�ch 3 ph�t. T�n s� b� h�n ch� s� hi�n <color=red>m�u ��<color>.",
		"Th� ra l� nh� v�y!",
		}
	TE_Talk(getn(strMain), "rej_chat", strMain); 		
end;

function rej_chat()
	Say("Ngo�i t�n g�u, ta c�n gi�p ng��i c�ch <color=yellow>Giao h�o b�n b�<color>, c� mu�n nghe kh�ng?",2,"Xin ng��i ch� gi�o!/acc_friend","C�i g� ta c�ng hi�u h�t r�i!/rej_friend")
end;


function acc_friend()
local strMain = {
		"N�u mu�n h�o h�u v�i ai ch� c�n nh�n ph�m<color=yellow><Ctrl><color> + chu�t ph�i ch� l�n ��i ph��ng, ch�n <color=yellow>H�o h�u<color>, l�c n�y h� th�ng s� c� th�ng b�o cho ��i ph��ng. N�u ��ng � t�n ng��i �� s� hi�n trong b�ng H�o h�u c�a m�nh. Nh�n <color=yellow><F6><color> ki�m tra l�i!",
		"C�n mu�n tr� th�nh tri k� ho�c phu th� th� ph�i l�m sao?",
		"Sau khi tr� th�nh h�o h�u s� c� th�m <color=yellow>�i�m th�n thi�n<color>. Ng��i ch�i b�nh th��ng t� ��i ��nh qu�i, t�n g�u c�ng ���c t�nh �i�m th�n thi�n. M�t s� v�t ph�m ��c bi�t nh� <color=yellow>Hoa h�ng<color> c�ng gi�p t�ng th�n thi�n. N�u tr�n 1000 �i�m th�n thi�n c� th� <color=yellow>K�t Ngh�a Kim Lan<color>. Tr�n 1500 �i�m, hai ng��i kh�c gi�i c� th� ��n C� ��o t�m Nguy�t L�o k�t th�nh <color=yellow>Phu th�<color>.",
		"H�o h�u, kim lan ho�c phu th� b�nh th��ng c�ng t� ��i luy�n c�ng s� ���c t�nh th�m kinh nghi�m.",
		"Th�o n�o g�n ��y c� nhi�u ng��i xin ���c t� ��i.",
	}
	TE_Talk(getn(strMain), "rej_friend", strMain); 
end;

function rej_friend()
	local strMain = {
		"�i l�i trong giang h� ng��i c�n c� th�m nhi�u h�o h�u. L�n sau nh� c�ng ��ng ��i ��n ��y ta s� c� qu� t�ng c�c ng��i.",
		"Nh�t ��nh ta s� quay l�i.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID ӦΪ 10
	Msg2Player("Nh�n nhi�m v� ��a ��ng ��i ��n g�p D� T�u.");
	TE_SetTeachPro(1)
end;



-- ����ٴδ���������Ұ�ŶԻ�
-- ���������1 Ϊ�Ѿ����  2 Ϊ��û�����  3 Ϊѡ��֪����ô���  4 Ϊѡ��û�����
function Teach_Level04_01(nState)
	local strMain = {
		"C� m�n qu� nh� t�ng c�c ng��i, hy v�ng hai ng��i s� l� h�o h�u t�t c�a nhau.",
		"Mu�n g�t ta �? <color=yellow>h�o h�u<color> c�a ng��i ��u?",
		"Nh�n <color=yellow>t� ��i<color>, m�i ng��i kh�c gia nh�p t� ��i sau �� ��n t�m ta.",
		"Nhi�u ng��i ��n t�m ta r�i, ng��i c�n kh�ng nhanh ch�n!"
	}
	
	if (nState==1) then
		Talk(1,"Teach_Level04_02",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	end
	
	return
	
end


-- ������Ѿ����������������Ұ�ŶԻ�ʱ�����轱�����ı��������
function Teach_Level04_02()

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nBooks = {30,31,32,33,34,35,36} -- Ҫ������ҵ������������

	if (nMemCount == 0) then -- �����ҵ���һ��δ��ӣ��򷵻�
		return
	else
	    if GetAntiEnthrallmentStatus() == 0 then
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i)
			AddItem(0,15,nBooks[random(getn(nBooks))],1)
			Msg2Player("B�n nh�n ���c m�t quy�n m�t t�ch!")
		end
		
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
		Earn(100)
		ModifyExp(80)
            elseif GetAntiEnthrallmentStatus() == 1 then
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
		Earn(50)
		ModifyExp(40)
            elseif GetAntiEnthrallmentStatus() == 2 then
            end


		Msg2Player("Ho�n th�nh nhi�m v� h�o h�u ��n c�p 5 quay l�i t�m D� T�u.");
	end
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 11
	TE_SetTeachPro(2)
	return

end


-- ��ҵ��˵ȼ� 5 ʱǰ����Ұ�ŶԻ�
function Teach_Level05()

	local strMain = {	
		"Xem ng��i m�t m�i nh� v�y ch�c l� ch�a h�c qua <color=yellow>khinh c�ng<color>, l�n tr��c v� s� ch�a d�y ng��i �?",
		"Ch� h�c t�a thi�n, ch�a h�c khinh c�ng.",
		"Ra ngo�i th�nh ��nh b�i m�y t�n <color=yellow>L�u manh<color> l�y <color=yellow>5 b�nh Thi�u t�u<color> ��a cho V� s�, nh�t ��nh s� h�c ���c Khinh c�ng."	
	}
	
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID ӦΪ 12
	Msg2Player("Nh�n nhi�m v� ra ngo�i th�nh t�m 5 b�nh Thi�u t�u cho v� s�!");
	TE_SetTeachPro(1)
	
end


-- ��Ҵ����վ�ȥ����ʦʱ�ĶԻ�
function Teach_Level05_01()
	if (GetItemCount(2,1,12) >= 5) then
		DelItem(2,1,12,5)
		Say("Ch� c� D� T�u m�i hi�u l�o phu ta! Xem ra ta ph�i d�y ng��i m�n v� h�c n�y r�i! Ti�p theo ta s� n�i ng��i nghe v� PK.",2,"Phi�n �ng ch� gi�o!/acc_fight","Kh�ng c�n ��u!/rej_fight");
	else
		Say("M�t qu�! Ph�i u�ng r��u th�i! C� 5 b�nh <color=yellow>Thi�u t�u<color> m� ng��i mang c�ng kh�ng �� �?.",0);
		return -- ���������û���վƵĻ���Ȼ����
	end
end

function acc_fight()
	local strMain = {		
		"<color=red>PK<color> ch� chi�n ��u gi�a ng��i ch�i v�i nhau, ch�nh l� c�u s�t tr�n giang h�. Ng��i ch�i b�t PK trong chi�n ��u khi ch�t s� m�t nhi�u kinh nghi�m v� ng�n l��ng, �i�m PK cao khi ch�t c� th� r�i trang b� tr�n ng��i; tranh ch�p v�i nhau ng��i ch�i th��ng d�ng PK �� quy�t ��nh th�ng thua.",
		"V�y ng��i ch�i c�p th�p trong game d� g�p nguy hi�m l�m �?",
		"Ng��i c� th� an t�m, h� th�ng �� h�n ch� c�c ki�u PK, b�o ��m an to�n cho ng��i ch�i kh�c.",
		"Xin n�i r� th�m.",
		"Tr��c ti�n, l� b�o v� T�n th�, ng��i ch�i ch�a gia nh�p m�n ph�i mang ch� m�u tr�ng kh�ng th� tham gia PK c�ng kh�ng b� ng��i kh�c PK. Ch� khi gia nh�p m�n ph�i m�i c� th� ��ng m� ���c PK.",
		"N�u ng��i ch�i kh�ng b�t PK m� b� ng��i kh�c PK th� sao?"	,	
	}
	TE_Talk(getn(strMain), "acc_fight1", strMain);
end;


function acc_fight1()
	local strMain = {
		"Gia nh�p giang h� chuy�n �� s�t nhau l� kh�ng th� tr�nh kh�i. Nh�ng ng��i c� t�nh PK s� b� tr�ng ph�t.",
		"Tr�ng ph�t PK nh� th� n�o?",
		"Trong chi�n ��u ch� ��ng gi�t m�t ng��i �i�m PK s� t�ng 1;�i�m PK c�ng cao ng��i ch�i c� kh� n�ng r�t ��, m�t �i�m kinh nghi�m, ng�n l��ng c�ng nhi�u.",
		"V�y PK c� m�y lo�i?",		
		"C� 4 lo�i PK: Luy�n c�ng, bang ph�i chi�n ��u, c�u s�t v� gi�t th�.",
		"PK luy�n c�ng kh�ng g�y s�t h�i ��n ng��i ch�i kh�c; PK chi�n ��u bang ph�i kh�ng �nh h��ng nh�ng ng��i trong bang k� c� li�n minh; �� s�t ngo�i h�o h�u ra c� th� t�n c�ng b�t k� ai; gi�t th� d�ng mu�n gi�t m�t ai ��.",
	}
	TE_Talk(getn(strMain), "acc_fight2", strMain);
end;

function acc_fight2()
	local strMain = {
		"Ng��i ch�i b�t ch�c n�ng gi�t th� c� th� gi�t b�t k� ai ngo�i ng��i ch�i ch� tr�ng.",
		"Do gi�t th� mang t�nh ch�t c� nh�n �nh h��ng r�t nhi�u n�n m�c tr�ng ph�t n�ng h�n PK: Gi�t 1 ng��i, PK t�ng 2 �i�m.",
		"N�u th�y ��nh kh�ng th�ng ��i ph��ng n�n nhanh ch�ng chuy�n sang tr�ng th�i chi�n ��u b�nh th��ng, tho�t kh�i b� tr�ng ph�t.",
		"Khi ch�n m�t trong 3 h�nh th�c PK, 3 ph�t sau m�i c� th� chuy�n sang tr�ng th�i kh�c.",
		"Ng��i ch�i ��nh l�i ��i, v�n ti�u, c��p ti�u t�nh PK hay gi�t th�?",			
	}
	TE_Talk(getn(strMain), "acc_fight3", strMain);
end;




function acc_fight3()
	local strMain = {
		"L�i ��i, c��p ti�u l� h�nh th�c chi�n ��u kh�c gi�a ng��i ch�i. C� th� g�i l� nhi�m v� chi�n.",
		"Nhi�m v� chi�n, PK v� gi�t th� kh�ng gi�ng nhau. H�nh th�c nhi�m v� kh�c nhau th� quy ��nh PK c�ng kh�c nhau.",
		"Ng��i b� �i�m PK t�i �a, khi b� ��i ph��ng h� g�c ngo�i r�t �� tr�n ng��i ra c�n c� h�nh ph�t n�o kh�c n�a kh�ng? B�ng c�ch n�o �� gi�m �i�m PK?",
	}
	TE_Talk(getn(strMain), "acc_fight4", strMain);
end;


function acc_fight4()
	local strMain = {
		"Ng��i ch�i khi �i�m PK= 3 t�n s� ��i m�u ��, kh�ng th� v�o th�nh; ��i v�i nh�ng ng��i PK qu� cao ��i l�c quan ph� c�ng ph�i cao th� �i t�m n�. N�u t� vong trong giai �o�n n�y b�n s� b� nh�t v�o ��i lao.",
		"Ng��i ch�i trong ��i lao ho�c � b�n ngo�i ��u gi�m ���c PK. Trong lao m�i gi� gi�m ���c 1 �i�m PK, ngo�i lao 2 gi� online gi�m ���c 1 �i�m PK. V� h�nh ph�t c� th� h�i b� ��u � nha m�n.",
	}
	TE_Talk(getn(strMain), "rej_fight", strMain);
end;


function rej_fight()
	local strMain = {
		"B�y gi� ta d�y ng��i Khinh c�ng, xem k� nh�!",
	}
	TE_Talk(getn(strMain), "Teach_Level05_02", strMain);
end;



-- �������ʦ�Ի������Ժ�ѧ�����Ṧ���ı��������
function Teach_Level05_02()
	LearnSkill(20);
	Msg2Player("B�n h�c ���c khinh c�ng!");
	Say("Ta �� d�y h�t cho ng��i r�i, c� g�ng r�n luy�n th�m!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(120)
        elseif GetAntiEnthrallmentStatus() == 1 then
	    Earn(50)
	    ModifyExp(60)
        elseif GetAntiEnthrallmentStatus() == 2 then
        end

	Msg2Player("Ho�n th�nh nhi�m v� ��t c�p 6 t�m D� T�u!");
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 13
	TE_SetTeachPro(2)
end


-- ��ҵȼ����� 6 ��֮������Ұ�ŶԻ�
function Teach_Level06()
	local strMain = {
		"Nghe n�i 10 v�n Li�u Binh �ang ti�n v� Nh�n M�n Quan! H�y mau gi�p t�m <color=yellow>Ch� th��ng h�i<color>, ng��i ch�u tr�ch nhi�m cung c�p v�t t� cho qu�n ��i."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID ӦΪ 14
	Msg2Player("Nh�n nhi�m v� �i t�m ch� th��ng h�i!");
	TE_SetTeachPro(1)
	return
end


-- ���ȥ���̻��ϰ�Ի�
function Teach_Level06_01()
	local strMain = {
		"R�t vui khi c� ng��i gi�p s�c, qu�n ��i hi�n thi�u d��c li�u, h�y �i t�m <color=yellow>3 c�t c�nh<color> v� <color=yellow>3 X� h��ng<color> v� ��y!",
		"C�t c�nh c� th� ��nh th� x�m ngo�i r�ng, X� h��ng ��nh l�u manh r�i ra ho�c mua � ch� d��c �i�m."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID ӦΪ 15
	Msg2Player("Thu th�p 3 c�t c�nh v� 3 X� h��ng!");
end


-- ��������˽۹�������֮���������̻��ϰ�
function Teach_Level06_02()
	if (GetItemCount(1,2,2) >= 3) and (GetItemCount(1,2,4) >= 3) then
			DelItem(1,2,2,3)
			DelItem(1,2,4,3)
		Say("V�t v� cho ng��i qu�! C� ��nh qu�i luy�n c�ng th� c�ng bu�n, c� mu�n nghe nhi�m v� trong tr� ch�i kh�ng?",2,"Phi�n ti�n b�i gi�i thi�u m�t ch�t/acc_shanghui","C�i g� ta c�ng hi�u h�t r�i!/rej_shanghui");	
	else
		Say("V�n ch�a t�m �� v�t li�u �?",0);
	end
end

function acc_shanghui()
	local strMain = {
		"Hi�n ng��i �ang l�m nhi�m v� t�n th�, n�u ho�n th�nh c� th� nh�n ���c ph�n th��ng ��ng th�i hi�u ���c m�t ph�n h� th�ng nhi�m v� trong tr� ch�i.",
		"B�t c� l�c n�o c�ng c� th� ��n t�m ta nh�n nhi�m v�, t�y theo ��ng c�p m� nh�n nhi�m v� thu th�p t��ng �ng, li�n ti�p ho�n th�nh 10 nhi�m v� s� nh�n ���c ph�n th��ng ��c bi�t c�a th��ng h�i.",
		"Th� v� nh� v�y sao?",
		"��ng v�y! K� th�c tr�n giang h� c�n nhi�u nh�n v�t giang h� v�i nh�ng c�u chuy�n truy�n k� m� ta ch�a ���c bi�t, ng��i th� ��i tho�i v�i h� xem!",
		"Xin h�y n�i nh�ng nhi�m v� sau n�y ta ph�i l�m.",
		"��i ng��i ��t c�p 10, gia nh�p m�n ph�i, ��n l�c �� s� nh�n ���c nhi�m v� s� m�n, nhi�m v� bang h�i, nhi�m v� ho�ng kim, nhi�m v� chung�",
	}
	TE_Talk(getn(strMain), "rej_shanghui", strMain);
end;

function rej_shanghui()
	local strMain = {
		"T�t qu�! Nh�ng khi l�m nhi�m v� th��ng h�i qu� s�c s�c l�c th� sao?",
		"B�n ba giang h� kh�ng th� thi�u r��ng c�t gi� v�t ph�m, <color=yellow>th� m�c<color> trong th�nh chuy�n gi�p l�m r��ng, ta �� gi�p ng��i ��a <color=yellow>3 m�nh Tinh thi�t<color>, ch� c�n t�n th�m m�t �t ng�n l��ng l� c� th� s� d�ng.",
	}
	TE_Talk(getn(strMain), "Teach_Level06_03", strMain);

end;


-- ������ɾ���̻��ϰ���Ҫ����Ʒ�����轱�����ı��������
function Teach_Level06_03()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(300)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(150)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 16
	Msg2Player("T�m th� m�c l�m r��ng ch�a ��!");
	return
end


-- ��ľ���ĶԻ�
function Teach_Level06_04()

	Say("Ng��i c�n ta gi�p g�?",2,"Phi�n ti�n b�i l�m gi�p ta m�t c�i r��ng!/Teach_Level06_05","Nh�n ti�n gh� qua th�i./Teach_Exit");

end


-- �Ƿ��Ѿ�����������ļ��
function Teach_Level06_05()

	local nHaveBox = GetTask(805)
	
	if (nHaveBox==1) then -- ����Ѿ����˴�����
		Say("Ta �� gi�p ng��i l�m r��ng, qu�n r�i sao?",0);
	elseif (GetCash(500)>=1) and  (TE_GetTeachState()==17) then  --��������������������
		
			Teach_Level06_06() -- �����һ��������
	elseif (GetCash(500)>=1) and (GetItemCount(2,2,1)>=3) and (GetTask(807)==0) then   --����������������������
			open_box()  --�����һ��������
	elseif  (TE_GetTeachState() < 15) then
		if GetTask(807)==0 then  
			Say("Ng��i ch�a l�m nhi�m v� T�n th�, th�t s� mu�n l�m r��ng ch�a �� kh�ng?",2,"Ta �ang c�n m�t c�i r��ng/acc_box","�� ta suy ngh� l�i/no");
		else
			Say("Ng��i hi�n �ang l�m nhi�m v� T�n th�, r��ng ch�a �� �� sau h�y t�nh!",0);			end
		
	elseif (TE_GetTeachState()==16) then -- ����մ��̻��ϰ��������
		
			-- ˵�껰�� TEACH_SEASONNPC_ID ӦΪ 17
			Talk(1,"TE_SetTeachAdd","Ch� th��ng h�i �� ��a ta 3 mi�ng s�t nh�ng l�m r��ng c�n ph� 5 l��ng, ��i ng��i t�m �� r�i quay l�i!");
			Msg2Player("Chu�n b� 5 l��ng l�m r��ng ch�a ��");
	elseif  (TE_GetTeachState() == 25 and  GetTask(807)==0  )then
			Say("Ng��i ch�a l�m nhi�m v� T�n th�, th�t s� mu�n l�m r��ng kh�ng?",2,"Ta �ang c�n m�t c�i r��ng/acc_box","�� ta suy ngh� l�i/no");

	else
		
			Say("N�u kh�ng c� 3 mi�ng s�t v� 5 l��ng, ta kh�ng th� l�m r��ng ch�a ��.",0);
		
	end

end

--û����������ǿ��Ҫ������
function acc_box()
	Talk(1,"","Ng��i ra ngo�i th�nh ��nh s�i, t�m �� nguy�n li�u v� ��y ta s� gi�p ng��i l�m m�t c�i r��ng.");
end;

--û������������˷���������
function no()
end;

--������������������һ��������
function open_box()
	SetTask(805,1) -- ����һ����ʱ�������洢����Ƿ��Ѿ��д�����
	DelItem(2,2,1,3) -- ������ɾ�˾���
	Pay(500)
	Say("R��ng ch�a �� �� l�m xong, ta �� � c� <color=yellow>d�ch tr�m<color>, ng��i c� th� ��n �� c�t gi� v�t ph�m.",0);
end;


-- ���������������������һ��������
function Teach_Level06_06()
	SetTask(805,1) -- ����һ����ʱ�������洢����Ƿ��Ѿ��д�����
	Pay(500)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 18
	Say("R��ng ch�a �� �� l�m xong, ta �� � <color=yellow>d�ch tr�m<color>, ng��i c� th� ��n �� c�t gi� v�t ph�m. B�y gi� ta mu�n gi�i thi�u cho ng��i v� k� n�ng s�ng, c� mu�n nghe kh�ng?",2,"C�m phi�n ti�n b�i!/acc_liveskill","Kh�ng c�n ��u!/rej_liveskill");
end

function acc_liveskill()
	local strMain = {
		"K� n�ng s�ng ph�n bi�t c� k� n�ng gia truy�n, ��c binh kh� d�i, ��c binh kh� ng�n, ��c k� m�n binh kh�, ch� t�o �o gi�p, luy�n ��n, n�u n��ng v� luy�n b�a.",
		"K� n�ng gia truy�n l� b�n l�nh c�a ng��i ch�i, c� th� kh�ng d�ng nguy�n li�u tr�c ti�p m� d�ng th� l�c l�m ra {b�nh ng�} v� {B�ng}.",
		"K� n�ng ��c luy�n binh kh� d�i, ��c luy�n binh kh� ng�n, ��c luy�n k� m�n binh kh� c� th� h�c t�i th� r�n Th�nh ��.",
		"K� n�ng ch� t�o H� gi�p c� th� h�c t�i C�m N��ng Th�nh ��. Sau n�y c� th� s� d�ng c�c lo�i Ch�c c�m v� da th� �� may c�c lo�i trang v� b�o h� gi� tr�!",
	}
	TE_Talk(getn(strMain), "acc_liveskill_01", strMain);
end;

function acc_liveskill_01()
	local strMain = {
		"K� n�ng luy�n ��n h�c t�i Du Ph��ng ��i phu Th�nh ��. Sau khi h�c xong c� th� d�ng c�c lo�i th�o d��c ch� t�o ra {Linh ��n}",			"K� n�ng n�u n��ng h�c t�i ng� tr� Bi�n Kinh.",
		"K� n�ng luy�n b�a h�c t�i Du Ph��ng ��o s� Bi�n Kinh. H�c xong ta c� th� ch� t�o H�i ph�, gi�m ��nh ph�.",				
		"S� d�ng k� n�ng s�ng t�n th� l�c nh�t ��nh. Ngo�i k� n�ng gia truy�n ra nh�ng k� n�ng kh�c mu�n t�ng c�p ph�i qua luy�n t�p, m�i ng��i ch� c� th� h�c 3 k� n�ng s�ng. Mu�n x�a b� k� n�ng �� h�c ph�i th�ng qua ph��ng ph�p ��c bi�t.",
		"L�u � nh�ng k� n�ng ��u c� ��ng c�p h�n ch�, mu�n h�c k� n�ng s�ng cao c�p ta ph�i gia nh�p bang ph�i ho�c ra ngo�i th�nh t�m cao nh�n ch� gi�o."
	}
	TE_Talk(getn(strMain), "rej_liveskill", strMain);
end;



function rej_liveskill()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(150)
	ModifyExp(150)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(75)
	ModifyExp(75)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	Msg2Player("Nhi�m v� ho�n th�nh ��t c�p 7 t�m D� T�u!");
	TE_SetTeachPro(2)
	return
end;


-- ��ҵ��˵� 7 ����ʱ������Ұ�ŶԻ�
function Teach_Level07()
	Say("Ng��i mu�n h�c c�ch ki�m ti�n kh�ng?",2,"Nh� ti�n b�i ch� gi�o!/acc_getmoney","Kh�ng c�n ��u!/rej_getmoney");
end



function acc_getmoney()
	local strMain = {
		"C� nhi�u c�ch �� ki�m ng�n l��ng, nh�ng ��n gi�n nh�t l� ra ngo�i th�nh ��nh qu�i mang v�t ph�m v� b�n ho�c l�m nhi�m v�.",
		"�em v�t ph�m ��nh qu�i nh�t ���c v� th�nh, nh�n <F4>, m� giao di�n b�y b�n, ��t v�t ph�m v�o shop, ni�m y�t gi� c�sau �� nh�n *��ng �* l� c� th� b�y b�n.",
	}
	TE_Talk(getn(strMain), "acc_getmoney1", strMain);
end;


function acc_getmoney1()
	local strMain = {
		"B�y b�n l� c�ch �� ki�m ti�n nhanh nh�t nh�ng b�t ti�n l� kh�ng l�m ���c nhi�m v� kh�c.",
		"Ng��i ch�i c� th� �em v�t ph�m ��n cho <color=yellow>Ng��i ��u gi�<color> trong c�c th�nh �� b�n ��u gi�. L�c n�y v�t ph�m c�a ng��i ch�i s� do ng��i ��u gi� ��a ra. N�u nh� giao d�ch th�nh c�ng th� ti�n t� ��ng s� chuy�n v�o r��ng ng��i ch�i, c�n n�u th�t b�i th� h� th�ng s� tr� l�i v�t ph�m. T�y theo gi� tr� v�t ph�m b�n ra m� t�nh thu�. C�ch b�n n�y ch� n�n �p d�ng cho nh�ng v�t ph�m qu�, v�t ph�m th��ng n�n b�y b�n.",
		"V�t ph�m th�ng th��ng �em <color=yellow>b�y b�n<color> , v�t ph�m qu� th� <color=yellow>��u gi�<color> ��ng kh�ng?",
	}
	TE_Talk(getn(strMain), "rej_getmoney", strMain);
end

function rej_getmoney()
	local strMain = {
		"M�y h�m tr��c ta c� tr�ng m�t t�m <color=yellow>ng�n phi�u<color> nh�ng ch�a c� th�i gian �i l�nh, ng��i gi�p ta ���c kh�ng?",
	}
	TE_Talk(getn(strMain), "Teach_Level07_01", strMain);
	Msg2Player("Nh�n nhi�m v� t�m ch� ti�n trang l�nh ng�n phi�u!");
end;

-- ��Ұ�ŶԻ�������ı��������
function Teach_Level07_01()

	TE_SetTeachPro(1)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 19

end


-- ��Ǯׯ�ϰ�ĶԻ�
function Teach_Level07_02()

	local strMain = {
		"��y l� <color=yellow>Ng�n phi�u<color> c�a D� T�u, xin nh�n l�y!",
		"Sao gi�ng t�m gi�y v� b�a c�a m�y ��o s� v�y!",
		"Haha! Ng��i l�m to r�i! ��y ch�nh l� <color=red>T�m th� gi� ch�i<color>, do <color=yellow>ti�n trang Bi�n Kinh<color> ph�t h�nh. Sau khi n�p th� ng��i ch�i c� th� ch�n ��i th�nh gi� ch�i ho�c ng�n phi�u, c�n thi�t ��n ti�n trang Bi�n Kinh ��i th�nh gi� ch�i.",
		"�a t� �� ch� gi�o!",
		"Cho ta g�i l�i th�m h�i ��n D� T�u."
	
	}
	if (TE_GetTeachState()==19) then
		TE_Talk(getn(strMain), "Teach_Level07_03", strMain);
		Msg2Player("Mang ng�n phi�u v� cho D� T�u!");		
	elseif (TE_GetTeachState()==20) and (GetItemCount(2,0,1)==0) then  -- �����Ҷ�ʧ��������ߺ�Ĳ���
                AddItem(2,0,1,1)
		Say("Sao g�p v�y? Ng�n phi�u ch�a l�y �� v�i �i r�i?",0);
		Msg2Player("Mang ng�n phi�u v� cho D� T�u!");
		return
	end

end


-- ��Ǯׯ�ϰ�Ի���õ���Ʊ���ı��������
function Teach_Level07_03()
    if GetAntiEnthrallmentStatus()~= 2 then
	AddItem(2,0,1,1)
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 20
	
end


-- ������Ұ�ŶԻ�
function Teach_Level07_04()
	
	-- TEACH_SEASONNPC_ID ӦΪ 21
	TE_SetTeachPro(2)
	Talk(1,"TE_SetTeachAdd","��n c�p ti�p theo nh� quay l�i t�m ta!");
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(170)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(85)
        else
        end
	Msg2Player("Nhi�m v� ho�n th�nh ��t c�p 8 quay l�i t�m D� T�u!");

end


-- ��ҵ��� 8 ������Ұ�ŵĶԻ�
function Teach_Level08()
	local strMain = {
		"Ta c� th� gi�p g� cho ng��i?",
		"G�n ��y bu�n b�n c�ng kh�m kh�, nh�ng ti�n mang theo tr�n ng��i kh�ng ti�n. Ti�n b�i bi�t ch� n�o c�t gi� ng�n l��ng kh�ng?",
		"M� r��ng ch�n <color=yellow>G�i ti�n<color> sau �� nh�p s� ti�n c�n g�i, nh�n *��ng �*. T��ng t� cho <color=yellow>R�t ti�n<color>.",
		"Ta �� th� nh�ng ph�i nh�p ��n 3 ch� s�, v�y l� sao?",
		"H�nh th�c giao d�ch g�m <color=yellow>v�ng<color>, <color=yellow>b�c<color> v� <color=yellow>ti�n ��ng<color>, 1 l��ng v�ng = 100 l��ng b�c, 1 l��ng b�c = 100 ti�n ��ng. H� th�ng s� t� ��ng ��i s� ti�n b�n c� v� s� ��n gi�n nh�t."
	
	}
	TE_Talk(getn(strMain),"Teach_Level08_01",strMain);

end


-- Ұ�ŶԻ���ѡ��
function Teach_Level08_01()

	Say("C�n g� ch�a r� kh�ng?",2,"Hi�u r�i!/Teach_Level08_02","Ch�a hi�u!/Teach_Money");

end


-- ��������Ұ�ŵĻ���ı��������
function Teach_Level08_02()

	local strMain = {	
		"Ch�a hi�u �� ta n�i l�i.",
		"C� khi n�o ti�n b�i g�p v�n �� nan gi�i kh�ng?",
		"Nh�c t�i m�i nh�, l�n tr��c c� ng��i h�i 6 v�n �� li�n quan ��n th�p ��i <color=yellow>m�n ph�i<color>, ta �p �ng tr� l�i kh�ng ���c. Chuy�n n�y m� truy�n ra ngo�i th� m�t m�t qu�!",
		"Ti�n b�i c�n ta ��n th�p ��i m�n ph�i h�i th�m kh�ng?",
		"Ng��i �i m�t chuy�n gi�p ta h�i r� c�c th�p ��i m�n ph�i. M�i m�n ph�i ��u c� <color=yellow>S� gi� m�n ph�i<color> ��ng gi�a qu�ng tr��ng, ��n n�i chuy�n v�i l� ���c."
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID ӦΪ 22
	Msg2Player("Nh�n nhi�m v� �i t�m hi�u c�c m�n ph�i!");
	TE_SetTeachPro(1)
	

end


-- ��һ����ش�Ұ�ŵ�����
function Teach_Level08_03()

	Say("Ng��i hi�u r� ��c s�c c�a th�p ��i m�n ph�i ch�a?",2,"Hi�u r�i!/Teach_Qustion_001","Ch�a hi�u l�m!/Teach_Exit");
	return

end


-- ������ȫ���ش���ȷ���������轱�����Ҹı��������
function Teach_Level08_04()
	Say("Ng��i bi�t g� v� S�, Hi�p, �n tam ��i l�u ph�i?",2,"Phi�n ti�n b�i gi�i th�ch/acc_route","Ta bi�t r�i!/rej_route");
end


function acc_route()
	local strMain = {
	
		"S�, Hi�p, �n th�c t� ch� h��ng tu luy�n c�a nh�n v�t. Theo <color=yellow>S�<color> c� th�n th� c��ng tr�ng v� s�c m�nh h�n ng��i. Theo <color=yellow>Hi�p<color> s�c m�nh v� nhanh nh�n c�n b�ng. Theo <color=yellow>�n<color> kh�ng quan tr�ng b�n ngo�i, ch� y�u r�n luy�n tinh th�n.",
		"Ta n�n tu luy�n h��ng n�o?",
		"Ng��i ch�a gia nh�p m�n ph�i, sao ch�n ���c h��ng �i, n�n th�n tr�ng khi ��a ra quy�t ��nh.",
		"Ti�n b�i c� th� cho ta bi�t r� h�n kh�ng?",
	}
	TE_Talk(getn(strMain),"acc_route1",strMain);

end;


function acc_route1()
	local strMain = {
	        "Th�t ra theo h��ng n�o c�ng c� �u �i�m ri�ng c�a n�, c�n ph�i ch�n l�a s� ph� sau khi gia nh�p m�n ph�i.",	        
		"Nhi�u m�n ph�i v� nhi�u h��ng tu luy�n, ta ph�i l�m sao?",
	        "Tu h�nh t�y m�i ng��i th�i!",
	        "�a t� �� ch� gi�o!",	
	}
	TE_Talk(getn(strMain),"rej_route",strMain);

end;



function rej_route()
	Say("Ng��i h�y t�m hi�u k� c�c m�n ph�i v� h��ng �i cho ri�ng m�nh. Ta kh�ng c�n g� d�y ng��i, ��t c�p 9 h�y quay l�i ��y!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(200)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(100)
        else
        end
	TE_SetTeachAdd(); -- TEACH_SEASONNPC_ID ӦΪ 23
	Msg2Player("Nhi�m v� ho�n th�nh ��t c�p 9 ��n t�m D� T�u!");
	TE_SetTeachPro(2)
end


-- �����ҵ��� 9 ����ʱ��������Ұ��
function Teach_Level09()

	local strMain = {
	
		"Ng��i c� bi�t v� sao ta l�i h��ng d�n t�n t�nh nh� v�y kh�ng?",
		"Kh�ng bi�t!",
		"Chuy�n d�i d�ng l�m, ��i ng��i luy�n ��n <color=yellow>c�p 10<color> h�y t�nh",
		"�����c! Ta s� c� g�ng!"
	
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID ӦΪ 24
	Msg2Player("Nh�n nhi�m v� ��t c�p 10 ch�ng minh t� ch�t c�a m�nh!");
	
end


-- �����ҵ��� 10 ����ʱ��������Ұ��
function Teach_Level10()

	local strMain = {
	
		"Qu� nhi�n ta nh�n kh�ng l�m ng��i.",
		"30 n�m tr��c th�i t� Tri�u Khu�ng D�n �o�t ���c <color=yellow>b�n �� S�n H� X� T�c<color> t� tay S�i Vinh, b� m�t li�n l�c c�c m�n ph�i c�ng t�m b�n �� kho b�u b�n trong ��ng th�i ph�t ��ng binh bi�n Tr�n ki�u, m�u �� so�i v�. Kh�ng ai bi�t �� ch�nh l� t�m b�n �� c�a Thi�n, ��a, Nh�n <color=yellow>Tam Gi�i ch�n ph�<color>, long m�ch c�a Trung Nguy�n, b�u v�t m� S�i Vinh �em t�nh m�ng ra gi�nh l�y. Vi�c l�m c�a th�i t� d�n ��n tr�i ��t c�m ph�n, trong ng�y ��i l� t� tr�i, S�n H� X� T�c ��t nhi�n h�a th�nh tro b�i, bay �i kh�p n�i.",
		"Th�i t� bi�t m�nh �� l�m ngh�ch � tr�i, ��o l�n c�n kh�n tam gi�i, y�u ma hi�n th�, Trung Nguy�n s�p l�m v�o ��i ki�p. �� s�a sai l�m, m�t m�t ch�n ch�nh l�i c�c c�c di�n, m�t kh�c b� c�o thi�n h�, hy v�ng t�m ���c ng��i ki�m l�i nh�ng m�nh b�n �� S�n H� X� T�c.",
	}
	TE_Talk(getn(strMain),"Teach_Level10_01",strMain);

end


-- �����Ұ��˵����º��쵽�������ı��������
function Teach_Level10_01()
	local strMain = {
		"C�u chuy�n t��ng ch�ng ch�m v�o qu�n l�ng. ��t nhi�n c� tin Th�i t� b�o b�nh qua ��i, ng��i k� v� kh�ng ph�i th�i t� Tri�u ��c Ph��ng m� l� Ho�ng �� Tri�u Quang Ngh�a. Tin ��n lan truy�n ra ngo�i, 10 v�n Li�u qu�n l�p t�c ti�n s�t <color=yellow>Nh�n M�n Quan<color>. M�t s� h�o ki�t lai l�ch kh�ng r� �� chi�m c� <color=yellow>L��ng S�n B�c<color>. Xung quanh <color=yellow>Th�nh �� ph�<color> xu�t hi�n qu� qu�i�Nhi�u s� vi�c cho th�y c� li�n quan ��n t�m b�n �� S�n H� X� T�c.",
		"T��ng lai kh�ng xa, Trung Nguy�n s� ph�i ��i m�t v�i m�t c�c di�n tranh gi�nh, t�n s�t l�n nhau �� c� ���c t�m b�n �� qu� gi� �y.",
		"Ta kh�ng th� khoanh tay ��ng nh�n, ph�i t�m c�ch c�u Trung Nguy�n th�i!",
		"S� ph�n do tr�i, ng��i ��ng qu� lo l�ng! Gi� ��n c�c ��i ph�i chuy�n t�m tu luy�n, ta s� lu�n ch� d�y th�m cho ng��i.",
		"Nh� m�t �i�u ��ng ng�i gian nan ph�a tr��c m� b� gi�a ch�ng, ta tin m�t ng�y n�o �� Trung Nguy�n s� ���c gi�i nguy b�i ch�nh ng��i v� t�n tu�i ng��i s� ���c l�u danh mu�n thu�!"
	}
	TE_Talk(getn(strMain),"",strMain);
        if GetAntiEnthrallmentStatus() ~= 2 then
	    AddItem(2,4,1,1)
	    AddItem(2,4,8,1)
        end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID ӦΪ 25
	TE_SetTeachState(26)  --�������һ�ף���������ⲻ��������Ѿ������������
	Msg2Player("Nhi�m v� ho�n th�nh nh�n ���c 2 trang b�!");
	Msg2Player("Ch�c m�ng b�n ho�n th�nh nhi�m v� h��ng d�n T�n th�! Gi� c� th� gia nh�p th�p ��i m�n ph�i, m� ra h��ng �i cho ri�ng m�nh.");
end










-- �����ʴ��������
function Teach_Qustion_001()
	Say("Gi� ta s� h�i ng��i m�t v�i v�n ��, c�u h�i 1: Hi�n c� m�y ��i ph�i thu nh�n �� t�?",4,"Th�p ��i m�n ph�i/Teach_Qustion_Error","B�t ��i m�n ph�i/Teach_Qustion_Error","Ng� ��i m�n ph�i/Teach_Qustion_002","Tam ��i m�n ph�i/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr� l�i t�t l�m! C�u h�i ti�p theo: Ki�m ph�p V� �ang xu�t th�n nh�p qu� do �� t� ��o gia hay �� t� t�c gia luy�n?",3,"��o gia �� t�/Teach_Qustion_003","T�c gia �� t�/Teach_Qustion_Error","C� hai ��u ��ng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh� l�m! C�u h�i 3: ���ng M�n ���c xem l� gia t�c m�n ph�i, v�y ng��i ph� tr�ch m�n ph�i l� ai?",4,"M�n ch�/Teach_Qustion_Error","L�o l�o/Teach_Qustion_004","Ch��ng m�n/Teach_Qustion_Error","T�ng qu�n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C�u h�i ti�p theo: �� t� t�c gia Nga My s� d�ng binh kh� n�o?",4,"Th�ch/Teach_Qustion_Error","Ki�m/Teach_Qustion_Error","C�m/Teach_Qustion_005","B�t/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("��ng r�i! C�u h�i 5: V� c�ng Thi�u L�m tinh th�m kh� �o�n, 72 tuy�t k� danh ch�n thi�n h�. V�y Thi�u L�m c� m�y h��ng tu luy�n?",4,"M�t/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","B�n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C�u h�i cu�i c�ng: Nghe n�i �� t� C�i Bang c� � Y, T�nh Y, v�y �� t� T�nh Y tu luy�n v� c�ng n�o?",4,"C�n ph�p/Teach_Qustion_Error","Ch��ng ph�p/Teach_Level08_04","Thu�n d��ng/Teach_Qustion_Error","B�y/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh�ng ta nghe ng��i ta n�i kh�ng ph�i nh� v�y, ng��i th� v� xem l�i!",1,"���c! �� ta xem l�i!/Teach_Level08_03");
end






-- ���ص�����Ŀ¼
function Teach_Main()

	Say("Ng��i mu�n t�m hi�u th�m g� kh�ng?",getn(strTeachSelect),strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- ������Ϸ��������
function Teach_Basic()

	local strMain = {
	
		"D�ng chu�t ch� v�o b�t k� n�i n�o trong b�n �� �� di chuy�n nh�n v�t. N�u kh�ng x�c ��nh ���c v� tr�, m� <color=yellow>B�n �� nh�<color>, d�u ch�m <color=yellow>v�ng<color> b�n trong ch� cho v� tr� c�a ng��i ch�i.",
		"Ra ngo�i th�nh n�u kh�ng may ch� chu�t l�n qu�i, nh�n v�t s� t� ��ng ��nh qu�i li�n t�c, c�n ch� �!"
	}
	
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
	
end

-- ��������ȼ�����
function Teach_Level()

	local strMain = {
	
		"Nh�n v�t d�ng <color=yellow>�i�m kinh nghi�m<color> �� t�ng c�p. Nh�n <color=yellow><F3><color> m� Giao di�n trang b� nh�n v�t s� th�y <color=yellow>n�t t�ng c�p<color>. Khi �i�m kinh nghi�m l�n h�n kinh nghi�m �� t�ng c�p, c� th� <color=yellow>t�ng c�p nh�n v�t<color>. Sau khi t�ng c�p nh�n v�t s� c� <color=yellow>�i�m ti�m n�ng<color>. ��ng c�p c�ng cao �i�m ti�m n�ng c�ng nhi�u.",
		"C� nhi�u c�ch nh�n <color=yellow>�i�m kinh nghi�m<color>, nh� ��nh qu�i, l�m nhi�m v�, b� quan tu luy�n th�m ch� truy�n c�ng...C�n ch� � kinh nghi�m hi�n t�i �nh h��ng ��ng c�p v� k� n�ng nh�n v�t, kh�ng t� ��ng t�ng c�p, nh�n <color=yellow><F3><color> m� giao di�n trang b� nh�n v�t v� t� <color=yellow>t�ng c�p<color>. ��i tho�i v�i ta xong s� ���c �t <color=yellow>kinh nghi�m<color> ng��i c� th� d�ng ch�ng th� t�ng c�p."
	
	}
	TE_Talk(getn(strMain),"Teach_Main",strMain);
	return

end

-- ����Ǳ�ܵ����
function Teach_Point()

	local strMain = {
	
		"Nh�n v�t c� 5 ti�m n�ng: <color=yellow>S�c m�nh<color>, <color=yellow>N�i c�ng<color>, <color=yellow>G�n c�t<color>, <color=yellow>Th�n ph�p<color>, <color=yellow>Linh ho�t<color>.",
		"<color=yellow>S�c m�nh<color> quy�t ��nh ��nh ngo�i c�ng v� s�c l�c; <color=yellow>N�i c�ng<color> quy�t ��nh n�i l�c, ��nh n�i c�ng v� ph�ng th� n�i.",
		"<color=yellow>G�n c�t<color> quy�t ��nh sinh l�c v� ph�ng th� ngo�i; <color=yellow>Th�n ph�p<color> quy�t ��nh n� tr�nh, ch�nh x�c v� t�c �� ��nh; <color=yellow>nh�n r�<color> quy�t ��nh t�n c�ng ch� m�ng v� t� ��ng n� tr�nh, �nh h��ng ch�nh x�c v� t�c �� ��nh.",
		" LiT�n th� n�n t�ng nhi�u v�o <color=yellow>S�c m�nh<color> v� <color=yellow>G�n c�t<color>."
	
	}
	Talk(4,"Teach_Main",strMain[1],strMain[2],strMain[3],strMain[4]);
	return
end


-- ����׬Ǯ
function Teach_Earn()

	local strMain = {
	
		"C� th� ra ngo�i th�nh ��nh qu�i mang v�t ph�m v� b�n cho c�c ch� ti�m ho�c l�m m�t v�i nhi�m v� ��n gi�n. Tri�u ��nh c�ng c� ph�i Kh�m Sai ��i th�n ti�p t� cho T�n th�, c�n n�m b�t c� h�i hi�m c� n�y!",
		"��n <color=yellow>c�p 10<color> c� th� mua b�n, v�n ti�u, t�m ki�m kho b�u, ��nh l�i ��i..."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
end


-- ���ͼ�������
function Teach_Faction()

	local strMain = {
	
		"Hi�n c�c m�n ph�i �ang thu nh�n �� t�, ta th�y ng��i t� ch�t c�ng kh�ng t�, ch� c�n c� g�ng luy�n ��n c�p 10 ��i tho�i v�i <color=yellow>S� gi� m�n ph�i<color> l� c� th� gia nh�p.",
		"M�i m�n ph�i c� h��ng tu luy�n kh�c nhau, c�n t�m hi�u k� ��c s�c c�a n�."
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return	
	
end

-- ���͵�ǰ����������
function Teach_Something()

	local strMain = {
	
		"Ng��i m�i ra giang h� c�n <color=yellow>Giao l�u<color> nhi�u v�i ng��i trong th�nh!",
		"Ng��i c� th� ra ngo�i ��nh qu�i, nh�ng kh�ng n�n �i qu� xa v� n�i �� qu�i r�t m�nh, n�u l� b� th��ng v� t�m <color=yellow>Ch� d��c �i�m<color> trong th�nh tr� li�u.",
		"N�u �� ch�n nhi�m v� T�n th�, t� c�p 1 ��n c�p 10 c� ��n t�m ta nh�n nhi�m v� hay nh�n <color=yellow><F11><color> �� xem h��ng d�n."
	
	}
	Talk(3,"Teach_Main",strMain[1],strMain[2],strMain[3]);
	return
	
end

-- ���ͽ�ҵĶһ�����
function Teach_Money()

	local strMain = {
	
		"Ba lo�i ti�n t� g�m <color=yellow>V�ng<color>, <color=yellow>B�c<color> v� <color=yellow>��ng<color>, 1 l��ng v�ng = 100 l��ng b�c, 1 l��ng b�c = 100 ��ng.",
		"H� th�ng s� t� ��ng ��i ti�n. Khi ng��i c� 11111 ti�n ��ng  t��ng �ng 1 l��ng v�ng 11 l��ng b�c 11 ti�n ��ng.",
		"Ti�n g�i theo th� t� v�ng, b�c, ti�n ��ng."
	
	}
	TE_Talk(getn(strMain),"",strMain);

end


function Teach_Exit()

end