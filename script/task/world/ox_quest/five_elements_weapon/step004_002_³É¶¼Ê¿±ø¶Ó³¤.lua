-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 9, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("��i tr��ng Binh s�", "green")..":"
quest_title = cf_ox_SetColor("Thu�c t�nh v� kh�", "yellow").."\n"
quest_detail = cf_ox_SetColor("��n th� r�n Bi�n Kinh h�i th�m v� c�ch gi�t qu�i", "gray").."\n\n"
--quest_description_1 = quest_giver.."������������а���ƺ��Ѿ���Ⱦ�������ط��ˣ����ǻ�����ȷ����Щ��å�Ƿ����Щ��ʬһ�����Ѿ�����ȫ��ȥ���ˣ�Ҫ������ô�࿴����������ʶ�Ĺ���϶���һ��Ļ��Ŀ����ߣ��������ڿ������ƺ�����ͷ������\n������Щ���������Ǹ��������˽���壬����Щ��ʬ��ͨ���ı���Ҳ����ɱ�������ڿ�����Ҫ�ҵ���ɱ����Щ����ķ������У��꾩������λ����ḻ��������Ҳ����Ϊ��͢�����������С�"
quest_description_1 = quest_giver.."T� kh� � Giang t�n th�n �� lan sang c�c v�ng kh�c, kh�ng bi�t m�y t�n L�u manh �� c� ch�t gi�ng nh� c�i x�c kia kh�ng. C�n ph�i c� m�t ng��i �� kh�ng ch� b�n y�u qu�i n�y. \n Nghe n�i th� r�n � Bi�n Kinh bao n�m �� ��c luy�n binh kh� cho binh l�nh c�a Tri�u ��nh, c� th� r�n ra m�t lo�i v� kh� tr� ���c b�n y�u ma. Ngo�i ra c�n ph�i �i�u tra xem ��ng sau b�n ch�ng c�n �n ch�a �i�u g� n�a."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_002()
	-- �����Ǵ������Ʋ���
	RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
	CreateTrigger(4, 12, 51)					-- ������һ��������
	SetTask(101, 14)
	
	-- ����������������
	ModifyExp(200)							-- ������Ҿ��齱��
		
	-- ������������ʾ����
	TaskTip("��n th� r�n Bi�n Kinh h�i th�m v� c�ch gi�t qu�i")
	Say(quest_title..quest_detail..quest_description_1, 0)
end