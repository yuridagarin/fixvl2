-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII 76�����䷽ѧϰ����head�ļ�
-- By StarryNight
-- 2006/04/27 PM 15:59

-- Ե����ʱ���Ѿܣ�ԵҪ��ʱ����׷����

-- ======================================================

-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");

--76�������䷽������䷽ѧϰ�������
TASK_76WEAPON 			= 	1600		--76�������䷽�������
TASK_76WEAPON_TALK 		= 	1601		--76�������䷽����Ի����
TASK_76WEAPON_TALK_01 	= 	1 			--���ֶԻ����
TASK_76WEAPON_TALK_02 	= 	2			--�䵱�Ի����
TASK_76WEAPON_TALK_03 	= 	3 			--���ҶԻ����
TASK_76WEAPON_TALK_04 	= 	4 			--���ŶԻ����
TASK_76WEAPON_TALK_05 	= 	5 			--ؤ��Ի����
TASK_MEDICINE_HEIWU 	= 	1602		--��ҩϵ���پ�ʯ�䷽�������
TASK_COOKING_TIESHAN	=   1603		--���ϵ���߾�ľ�䷽�������
TASK_WEAVE_SHANSHI		=   1604		--֯��ϵɽʨ��Ƥ�䷽�������
TASK_JUJU_CHIWU		  	=   1605		--�Ʒ�ϵ��������䷽�������
TASK_JUJU_TALK			= 	1601		--�Ʒ�ϵ��������䷽����Ի���� 
TASK_JUJU_TALK_01		=   1			--��һ���Ի����
TASK_JUJU_TALK_02		=	2			--���󹤶Ի����

--��ҳ�ν
PlayerFactionTitle = {	
	-- ����
	[1]={"��i s�",""},	
	-- �䵱
	[2]={"��o tr��ng","��o tr��ng"},
	-- ��ü
	[3]={"","C� n��ng"},
	-- ؤ��
	[4]={"Thi�u hi�p","C� n��ng"},	
	-- ����
	[5]={"Thi�u hi�p","C� n��ng"},	
	-- ����
	[6]={"T��ng qu�n","T��ng qu�n"},	
	-- �嶾
	[7]={"Thi�u hi�p","C� n��ng"},
	[8]={"Thi�u hi�p","C� n��ng"},
	[9]={"Thi�u hi�p","C� n��ng"},
	[10]={"C� n��ng","C� n��ng"},
}

--�����Ͻ�����
HANDIN_ITEM_DATA = {
	[1] = {},
	[2] = {{},--��������
				 {{0,5,39,1,"Thanh Long c�n"},{0,8,96,1,"Thi�n Ph�t tr��ng"},{0,6,107,1,"Ph� Thi�n k�ch"}},--������
				 {{0,0,13,1,"N� L� ��a ng�c"},{0,2,26,1,"Huy�n thi�t Tr�ng Ki�m"},{0,3,63,1,"B� V��ng"},{0,7,11,1,"�o�n Tr��ng"}},--�̱���
				 {{0,1,52,1,"Thi�n ngo�i phi ti�n"},{0,10,74,1,"Ti�u V�"},{0,9,85,1,"Thi�n C�"},{0,4,118,1,"Long Kh�u"},{0,11,11,1,"Ng� T�n"}},--���ű���
				 {{0,100,35,1,"Huy�t H� Qu� V��ng gi�p"},{0,100,17,1,"S�n Qu� huy�t y"},{0,100,36,1,"Long B� � kim y"},{0,100,18,1,"Thi�n Gi�ng b�o"}},--��װ�·�
				 {{1,0,6,10,"H�c Ng�c �o�n T�c Cao"},{1,0,11,10,"V�n V�t Quy Nguy�n ��n"},{1,0,16,10,"Sinh Sinh H�a T�n"},{1,0,21,5,"B�n Tinh Nguy�t ��n"},{1,0,26,5,"��i Nh�t D��ng T�n"}},--ҩƷ
				 {{1,1,15,5,"B�nh B�t v�ng"},{1,1,14,5,"C�m chi�n tr�ng"},{1,1,9,5,"C�i x�o t�i"},{1,1,13,5,"T�y M�ng T�u"}},--���
				 {{0,100,53,1,"Thi�n y"},{0,100,54,1,"Phi Thi�n Th�i Th��ng"},{0,100,71,1,"V� Song ��u y"},{0,100,72,1,"Ng� S�c Ngh� Th��ng"}},--Ůװ�·�
				}
}

--Npc����
WEAPON_NPC_DATA = {
	[1] = {"M�c ��i","Bi�n Kinh"},
	[2] = {"M�c Nh�","Th�nh ��"},
	[3] = {"M�c Tam","T��ng D��ng"},
	[4] = {"C�m n��ng","Th�nh ��"},
	[5] = {"Du Ph��ng ��i phu","Th�nh ��"},
	[6] = {"Ng� Tr�","Bi�n Kinh"},
	[7] = {"V�n Du ��o Nh�n","Bi�n Kinh"},
}

--�䷽��
RECIPE_DATA = {
	[1]  = 	{800,"Tr��ng","A La H�n Tr��ng"},
	[2]  = 	{795,"c�n b�ng","Li�t Di�m"},
	[3]  = 	{801,"Th��ng","��i H�o L�i Th��ng"},
	[4]  = 	{793,"H� th�","V�n Nh�n"},
	[5]  = 	{797,"�ao","C� ��nh"},
	[6]  = 	{794,"Ki�m","H�a Tinh"},
	[7]  = 	{804,"Song �ao","L�ng Phong"},
	[8]  = 	{796,"�m kh�","M�n Thi�n Hoa V�"},
	[9]  = 	{799,"B�t","Th�n H�nh"},
	[10] = 	{798,"C�m","Hi Nh�n C�m"},
	[11] = 	{803,"Tr�o","M�nh h�"},
	[12] = 	{802,"Cung","Th�n Cung"},
}

------------------------------------------76�������䷽������ʾ---------------------------------------
function weapon_76_recipe_tip(nSkill_ID)

local nNpcName = GetTargetNpcName();
	if nNpcName == nil or nNpcName == "" then
		return
	end
	nSkill_ID = nSkill_ID - 1;
	TalkEx("",{nNpcName..":nghe n�i{"..WEAPON_NPC_DATA[nSkill_ID][2].."} {"..WEAPON_NPC_DATA[nSkill_ID][1].."g�n ��y �ang t�m ng��i, mau �i xem coi c� chuy�n g�."});

end

----------------------------------------------�����䷽����-------------------------------------------

--nType 1����������2���̱�����3�����ű���
function weapon_76_001(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1])
local str = "";
local strTalk = {};
local i = 0;

	for i=1,num do
		
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

	strTalk = {
		WEAPON_NPC_DATA[nType][1]..": Ng��i �� h�c h�t k� n�ng c�a ta, ta kh�ng c�n g� �� d�y ng��i n�a.",
		"�� t� c� ng�y h�m nay c�ng l� nh� s� ph� h�t l�ng ch� b�o.",
		WEAPON_NPC_DATA[nType][1]..": B�n v� ch� t�o th�n binh n�y l� chi b�o c�a M�c gia ta nh�ng ��n gi� v�n ch�a t�m ra c�ch ch� t�o th�ch h�p. B�y gi� ��nh truy�n l�i cho ng��i, hy v�ng ng��i c� th� th�nh c�ng. Nh�ng tr��c ti�n ph�i ki�m tra n�ng l�c hi�n t�i c�a ng��i.",
		"S� ph� c� n�i!",
		WEAPON_NPC_DATA[nType][1]..": Th� n�y v�y! Ng��i h�y l�m 1 "..str.."�� vi s� xem tay ngh� c�a ng��i th� n�o.",
		"Xin S� ph� ch� ch�t.",
		}
		TalkEx("",strTalk);
		SetTask(TASK_76WEAPON,1);
		TaskTip("M�i lo�i l�m 1 "..str.."Giao cho"..WEAPON_NPC_DATA[nType][1]);

end

--�Ͻ�����
function weapon_76_002(nType)

local num = getn(HANDIN_ITEM_DATA[2][nType+1]);
local str = "";
local i = 0;
local strSay = "";

	for i=1,num do
	
		str = str..HANDIN_ITEM_DATA[2][nType+1][i][5]

		if i~=num then			
			str = str..","
		end
		
	end

  strSay = {
		WEAPON_NPC_DATA[nType][1]..": Th� n�y v�y! Ng��i h�y l�m 1 "..str.."�� vi s� xem tay ngh� c�a ng��i th� n�o.(Tr��c khi giao n�p v� khi xin h�y c�t v� kh� kh�ng mu�n n�p v�o r��ng ch�a ��)",
		"Xin s� ph� xem qua!/#weapon_76_003("..nType..")",
		"�� t� ch�a h�c qua c�ch l�m/#ReLearnRecipe("..nType..")",--��ѧ֮ǰû��ѧϰ���䷽
		"Xin s� ph� ch� ch�t!/nothing",
		}
		
	SelectSay(strSay);
end

--�Ͻ�����
function weapon_76_003(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Qu� nhi�n tay ngh� r�t kh�! B�n v� n�y ta cho ng��i m��n ��c th�!",
	"(Sau khi ��c b�n v� ch� t�o binh kh݅)",
	"V� kh� trong b�n v� n�y r�t tuy�t! V�i tay ngh� c�a s� ph� kh�ng c� l� do g� kh�ng l�m ���c.",
	WEAPON_NPC_DATA[nType][1]..": N�i th� d� l�m! V� kh� ta l�m ra c� m�t kh�ng hai nh�ng nguy�n li�u r�t kh� t�m. N�u c� t� tinh trong truy�n thuy�t th� c� th� l�m ra th�n binh trong b�n v�.",
	"T� tinh? L� nguy�n li�u g� v�y?",
	WEAPON_NPC_DATA[nType][1]..": �� l� 4 lo�i nguy�n li�u H�c � Tinh Th�ch, Thi�t Tuy�n Tinh M�c, S�n S� Tinh B� v� X�ch � Linh Ph�.",
	"�� t� quy�t r�n th�nh th�n binh c�i mong s� ph� ch� b�o.",
	WEAPON_NPC_DATA[nType][1]..": Khi x�a ta t�ng d�a theo b�n v� c�a ng� ��i Thi�u L�m ph�i, V� �ang, Nga My, ���ng M�n v� C�i Bang �� r�n 1 thanh binh kh� nh�ng kh�ng ai d�ng ���c, h�y ��n h�i h� c� th� s� c� ch�t thu ho�ch.",
	}
		--�ɹ��Ͻ���Ʒ
		if handin_item(1,nType+1) == 1 then
			TalkEx("",strTalk);
			SetTask(TASK_76WEAPON,2)
			TaskTip("��n g�p Ch��ng m�n c�c Thi�u L�m ph�i, V� �ang, Nga My, ���ng M�n v� C�i Bang h�i th�m t�nh h�nh");
		else
			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": V� kh� c�a ng��i l�m ��u? Hay l� b� qu�n ��u ��?"})
		end
end

--�ж��Ͻ���Ʒ�Ƿ����Ҫ��
function handin_item(nGenre,nDetail)

	nGenre = nGenre + 1;
	local i = 0;
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			if GetItemCount(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3]) < HANDIN_ITEM_DATA[nGenre][nDetail][i][4] then	
				return 0
			end
		end
		for i=1,getn(HANDIN_ITEM_DATA[nGenre][nDetail]) do
			DelItem(HANDIN_ITEM_DATA[nGenre][nDetail][i][1],HANDIN_ITEM_DATA[nGenre][nDetail][i][2],HANDIN_ITEM_DATA[nGenre][nDetail][i][3],HANDIN_ITEM_DATA[nGenre][nDetail][i][4])
		end
	return 1
end

--��������ŶԻ�
function weapon_76_talk(nFaction,nType)

local strTalk = {
	[1] = {
		"B�i ki�n Ph��ng tr��ng! N�m x�a M�c s� ph� �� l�m cho ph��ng tr��ng m�t m�n th�n kh�, t�i sau sau �� kh�ng th�y ng��i s� d�ng?",
		"�! Th� ra th� ch� l� truy�n nh�n c�a M�c s� ph�! M�n v� kh� ���c l�m n�m x�a qu� m�m d�o kh�ng th�ch h�p v�i Thi�u L�m ta.",
		"Th� ra l� v�y! T�i h� �� hi�u r�i.",
		},
	[2] = {                                                                                        	
		"B�i ki�n Ch�n nh�n! N�m x�a M�c s� ph� �� l�m cho ch�n nh�n m�t m�n th�n kh�, t�i sau sau �� kh�ng th�y ng��i s� d�ng?",              
		"V� kh� n�m x�a tuy b�n nh�n nh�ng kh�ng m�m d�o. V� �ang ta l�y nhu ch� c��ng, lo�i v� kh� n�y kh�ng th�ch h�p l�m.",
		"Th� ra l� v�y! T�i h� �� hi�u r�i.",                                                      
    },
  [3] = {
		"B�i ki�n S� th�i! N�m x�a M�c s� ph� �� l�m cho ��o tr��ng m�t m�n th�n kh�, t�i sau sau �� kh�ng th�y ng��i s� d�ng?",
		"V� kh� n�m x�a M�c s� ph� l�m qu� nhi�n b�t ph�m. Nh�ng Nga My ta l� �� t� Ph�t m�n sao c� th� s� d�ng v� kh� nhi�u s�t kh� nh� th�?",
		"Th� ra l� v�y! T�i h� �� hi�u r�i.",
		},
	[4] = {
		"B�i ki�n L�o l�o! N�m x�a M�c s� ph� �� l�m cho ng��i m�t m�n th�n kh�, t�i sau sau �� kh�ng th�y ng��i s� d�ng?",
		"Ph�ng �m kh� y�u c�u ngo�i l�c v� ch�nh x�c. Kh�ng th� thi�u 1 trong 2. �m kh� n�m x�a M�c s� ph� l�m k�t c�u r�t t�t nh�ng kh�ng �� �� ch�nh x�c.",
		"Th� ra l� v�y! T�i h� �� hi�u r�i.",
		},
	[5] = {
		"B�i ki�n Long bang ch�! N�m x�a M�c s� ph� �� l�m cho Bang ch� ng��i m�t m�n th�n kh�, t�i sau sau �� kh�ng th�y ng��i s� d�ng?",
		"Binh kh� M�c s� ph� l�m tuy oai l�c r�t m�nh nh�ng ta d�ng c�m th�y kh�ng tho�i m�i.",
		"Th� ra l� v�y! T�i h� �� hi�u r�i.",
		}
	}
	TalkEx("",strTalk[nFaction]);
	SetTask(TASK_76WEAPON_TALK, SetBit(GetTask(TASK_76WEAPON_TALK), nFaction, 1));
	for	i=1,5 do
		if GetBit(GetTask(TASK_76WEAPON_TALK),i) ~= 1 then
			return
		end
	end
	SetTask(TASK_76WEAPON,3);
	TaskTip("Nghe xong l�i k� c�a 5 v� Ch��ng m�n, b�n c�m th�y nhi�u kh�c m�c. Quay v� g�p"..WEAPON_NPC_DATA[nType-1][1].."!");	                                                                                        
end

--δ����λ���ŶԻ�
function weapon_76_004(nType)

local strTalk = {WEAPON_NPC_DATA[nType][1]..": Khi x�a ta t�ng d�a theo b�n v� c�a ng� ��i Thi�u L�m ph�i, V� �ang, Nga My, ���ng M�n v� C�i Bang �� r�n 1 thanh binh kh� nh�ng kh�ng ai d�ng ���c, h�y ��n h�i h� c� th� s� c� ch�t thu ho�ch."}

	TalkEx("",strTalk)

end

--�Ѿ�����λ���ŶԻ�����ʦ���Ի�
function weapon_76_005(nType)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": Nghe xong l�i k� c�a 5 v� Ch��ng m�n, �� hi�u ���c ch�t �t?",
	"Ng� ��i ch��ng m�n kh�ng d�ng binh kh� nh� trong b�n v� b�i v� ch�ng kh�ng h�p v�i v� c�ng c�a h�, v� kh� t�t kh�ng nh�t thi�t ph�i b�n nh�n ch� c�n ch�ng c� th� gi�p ng��i s� d�ng ph�t huy h�t v� c�ng th� m�i l� v� kh� t�t.",
	WEAPON_NPC_DATA[nType][1]..": Hay l�m! Qu� nhi�n kh�ng l�m ta th�t v�ng! Ta c� �t T� Tinh, ng��i v� ngh� xem n�n ch�n ch� t�o lo�i th�n binh n�o, ch� c� th� ch�n ch� t�o m�t trong c�c lo�i th�n b�nh n�n ng��i suy ngh� k� r�i h�y ��n t�m ta.",
	}
	TalkEx("",strTalk);

	TaskTip("Ngh� k� mu�n h�c ch� t�o m�n v� kh� n�o r�i h�y quay l�i ��y"..WEAPON_NPC_DATA[nType][1])
	if GetTask(TASK_76WEAPON) ~= 4 then
		SetTask(TASK_76WEAPON,4);
		AddItem(2,2,66,5,1);--���پ�ʯ      
		AddItem(2,2,67,5,1);--���߾�ľ
		AddItem(2,2,68,5,1);--ɽʨ��Ƥ
		AddItem(2,2,69,5,1);--�������
	end
end

--ѡ��ѧϰ������������
function weapon_76_choice(nType)

local strSay = {
	[1] = {     
		WEAPON_NPC_DATA[nType][1]..": H�y ch�n lo�i v� kh� b�n mu�n h�c c�ch ch� t�o (ch�n xong kh�ng th� thay ��i l�a ch�n)",
		"Tr��ng/#learn_weapon_76("..nType..",1)",   
		"c�n b�ng/#learn_weapon_76("..nType..",2)",  
		"Th��ng/#learn_weapon_76("..nType..",3)",    
		"Ta suy ngh� l�i/nothing",     
		},
	[2] = {     
		WEAPON_NPC_DATA[nType][1]..": H�y ch�n lo�i v� kh� b�n mu�n h�c c�ch ch� t�o (ch�n xong kh�ng th� thay ��i l�a ch�n)",
		"H� th�/#learn_weapon_76("..nType..",4)",   
		"�ao/#learn_weapon_76("..nType..",5)",  
		"Ki�m/#learn_weapon_76("..nType..",6)",    
		"Song �ao/#learn_weapon_76("..nType..",7)",
		"Ta suy ngh� l�i/nothing",     
		},
	[3] = {     
		WEAPON_NPC_DATA[nType][1]..": H�y ch�n lo�i v� kh� b�n mu�n h�c c�ch ch� t�o (ch�n xong kh�ng th� thay ��i l�a ch�n)",
		"�m kh�/#learn_weapon_76("..nType..",8)",
		"B�t/#learn_weapon_76("..nType..",9)",
		"C�m/#learn_weapon_76("..nType..",10)",
		"Tr�o/#learn_weapon_76("..nType..",11)",
		"Cung/#learn_weapon_76("..nType..",12)",
		"Ta suy ngh� l�i/nothing",
		}
	}	
	SelectSay(strSay[nType]);

end

--������������ѧϰ�䷽
function learn_weapon_76(nType,recipe_id)

local strTalk = {
	WEAPON_NPC_DATA[nType][1]..": B�n �� ch�n "..RECIPE_DATA[recipe_id][2].." ph��ng h��ng ch� t�o v� kh� cao c�p, sau n�y ph�i c� g�ng th�m",
	"�� nhi bi�t r�i!",
	};

	AddRecipe(RECIPE_DATA[recipe_id][1])
	Msg2Player("B�n h�c ���c ph�i ch�:"..RECIPE_DATA[recipe_id][3])

	SetTask(TASK_76WEAPON,5);--76�������䷽�������
	TalkEx("",strTalk);
	
end

------------------------------------------��ҩϵ�پ�ʯ�䷽����-------------------------------------------
function medicine_heiwu_001()

local strTalk = {
	"G�n ��y ng��i kh�ng ch� t�m luy�n thu�c? N�n bi�t linh ��n di�u d��c kh�ng ph�i m�t s�m m�t chi�u m� luy�n th�nh.",
	"G�n ��y �� t� ph�t hi�n ��n d��c luy�n ra kh�ng c� c�ng hi�u l�m. Tuy luy�n ��ng ph��ng ph�p nh�ng hi�u qu� kh�ng t�t n�n c�m th�y h�i bu�n.",
	"Th� n�y v�y! Ng��i h�y luy�n H�c Ng�c �o�n T�c Cao, V�n V�t Quy Nguy�n ��n, Sinh Sinh H�a T�n (m�i lo�i 10 vi�n), B�n Tinh Nguy�t ��n, ��i Nh�t D��ng T�n (m�i lo�i 5 vi�n) ��a cho ta xem.",
	"Xin S� ph� ch� ch�t.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,1);
	TaskTip("Ch� d��c ph�m theo y�u c�u c�a s� ph� v� giao cho s� ph�");
	
end

function medicine_heiwu_002()

local strSay = {
	"10 H�c Ng�c �o�n T�c Cao, V�n V�t Quy Nguy�n ��n, Sinh Sinh H�a T�n, 5 B�n Tinh Nguy�t ��n, ��i Nh�t D��ng T�n �� l�m xong ch�a?",
	"�� l�m xong r�i!/medicine_heiwu_003",
	"�� t� ch�a h�c qua c�ch l�m/#ReLearnRecipe(5)",--��ѧ֮ǰû��ѧϰ���䷽
	"Xin S� ph� ch� ch�t!/nothing",
	}
	
	SelectSay(strSay);

end

function medicine_heiwu_003()

local strTalk = {
	"S� ph�! ��y l� thu�c �� t� �� luy�n. Xin s� ph� xem qua!",
	"Kh� l�m!",
	"Ph�n m�u �en � b� m�t kh�ng ph�i l��",
	"Vi�c n�y...�� t� c�ng kh�ng r�! G�n ��y trong l�c luy�n d��c ph�t hi�n th� n�y, �� t� kh�ng bi�t n�n m�i h�i s� ph�.",
	"�� t� h�y �em b�t ph�n �en n�y ��n th�nh B�c t�m {��i kho�ng c�ng} h�i th�, v�i kinh nghi�m ��o kho�ng nhi�u n�m kh�ng ch�ng �ng ta bi�t th� b�t �en n�y l� g�.",
	"�� t� tu�n l�nh!",
	}
	
	if handin_item(1,6) == 1 then
		AddItem(2,0,393,1);--�õ���ɫ��ĩ
		TalkEx("",strTalk);
		SetTask(TASK_MEDICINE_HEIWU,2);
		TaskTip("��n Th�nh �� t�m ��i kho�ng c�ng h�i ngu�n g�c c�a b�t ph�n m�u �en");
	else
		TalkEx("",{"��n d��c �� t� luy�n ��u? C� ph�i �� �� qu�n ��u ��?"});
	end
	
end

function medicine_heiwu_004()

local strTalk = {
	"�� t� h�y �em b�t ph�n �en n�y ��n th�nh B�c t�m {��i kho�ng c�ng} h�i th�, v�i kinh nghi�m ��o kho�ng nhi�u n�m kh�ng ch�ng �ng ta bi�t th� b�t �en n�y l� g�.",
	"�� t� tu�n l�nh!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_005()

local strTalk = {
	"C�c h� l� �� t� c�a Du Ph��ng ��i phu? H�m nay t�m ta c� vi�c g�?",
	"T�i h� trong l�c ch� d��c v� t�nh ph�t hi�n s� b�t ph�n m�u �en n�y, s� ph� b�o t�i h� ��n h�i �ng b�t n�y l� g�?",
	"��a ta xem th� n�o?",
	"B�t ph�n n�y to�n th�n m�u �en v� s�ng, g�n gi�ng � kim th�ch nh�ng ph�m ch�t thu�n khi�t h�n, ta ch�a th�y qua th� n�y, t� ��u ng��i c�?",
	"T�i h� v� t�nh ph�t hi�n trong l� luy�n ��n.",
	"��y kh�ng ch�ng l� nguy�n li�u �� ch� t�o th�n binh th��ng ��ng. Ng��i �em n� ��n Bi�n Kinh t�m M�c ��i s� ph� h�i th� xem!",
	"�a t� ��i s� ph� ch� �i�m!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_MEDICINE_HEIWU,3);
	TaskTip("��n Bi�n Kinh t�m M�c s� ph� h�i t�c d�ng c�a b�t ph�n m�u �en");
	
end

function medicine_heiwu_006()

local strTalk = {
	"Ng��i �em s� b�t n�y ��n Bi�n Kinh t�m M�c ��i s� ph� h�i th�, kh�ng ch�ng s� c� ��p �n.",
	"�a t� ��i s� ph� ch� �i�m!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_007()

local strTalk = {
	"M�c ��i: Ha ha! Cu�i c�ng ng��i c�ng �� luy�n th�nh Li�t Di�m Th�n C�n!",
	"B�i ki�n M�c s� ph�!",
	"M�c ��i: Ng��i l� �� t� c�a Du Lang Trung? T�m ta c� vi�c g�? H�m nay l�o phu r�t vui, �� luy�n th�nh Li�t Di�m Th�n C�n. Ng��i ��n ��y xem th� �i!",
	"V�n b�i t�i th� h�c thi�n, nh�t th�i kh�ng th�y ���c s� ��c bi�t c�a binh kh� n�y.",
	"M�c ��i: Kh�ng ph�i ng��i ��n xem th�n binh ta luy�n �? V�y t�m ta c� chuy�n g�?",
	"V�n b�i trong l�c luy�n ��n ph�t hi�n s� {b�t m�u �en} n�y, Du Ph��ng s� ph� b�o t�i h� ��n h�i ��i kho�ng c�ng, �ng ta n�i ��y c� th� l� nguy�n li�u �� ch� t�o binh kh� th��ng ��ng v� b�o t�i h� ��n h�i M�c s� ph� ng��i.",
	"M�c ��i: �� ta xem n�o��",
	"M�c ��i: ��y ch�ng l� l� b�t c�a H�c � Tinh Th�ch? Ta t�n nhi�u t�m huy�t m�i luy�n th�nh Li�t Di�m Th�n C�n, m�i l�n luy�n nguy�n li�u d�ng c�ng kh�c nhau nh�ng khi l�m ngu�i ��u �� l�i m�t �t b�t c�a H�c � Tinh Th�ch. Th� n�y v�y! Ta c� m�t �t Huy�n Th�ch d�ng �� luy�n, ng��i v� t�m s� ph� nghi�n c�u xem c� l� s� c� thu ho�ch.",
	"�� t� tu�n l�nh!",
	}
	--�ջغ�ɫ��ĩ
	if GetItemCount(2,0,393,1) >= 1 then
		DelItem(2,0,393,1);
	end
	
	TalkEx("",strTalk);
	if GetTask(TASK_MEDICINE_HEIWU) ~= 4 then
		AddItem(2,8,7,5,1);--�õ�5����ʯ
		SetTask(TASK_MEDICINE_HEIWU,4);
	end
	TaskTip("��a 5 vi�n Huy�n Th�ch c�a M�c ��i cho Du Ph��ng ��i phu");
	
end

function medicine_heiwu_008()

local strTalk = {
	"M�c ��i: H�y �em Huy�n Th�ch n�y v� c�ng s� ph� nghi�n c�u xem, kh�ng ch�ng s� c� thu ho�ch.",
	"�� t� tu�n l�nh!",
	}
	TalkEx("",strTalk);
end

function medicine_heiwu_009()

local strTalk = {
	"�� v� r�i �? C� h�i ���c g� kh�ng?",
	"��i s� ph� cho r�ng ��y kh�ng ph�i tinh th�ch th��ng ��ng ��o kho�ng c� ���c, b�o �� t� �i h�i M�c ��i s� ph�. M�c ��i s� ph� n�i ��y c� th� l� nguy�n li�u �� ch� t�o th�n binh th��ng ��ng, b�i v� m�i khi �ng ta luy�n binh kh� c�ng ph�t hi�n trong l� luy�n c� th� b�t m�u �en n�y, �ng ta c�n ��a �� t� m�t �t Huy�n Th�ch, b�o �� t� �em v� cho S� ph�.",
	"��a ta xem th�!",
	"Ta hi�u r�i! Trong l�c ng��i luy�n d��c kh�ng �� � n�n n� s�n sinh s�n ph�m ph�. ��y l� ph��ng ph�p ch� H�c � Tinh Th�ch, ng��i h�y nghi�n c�u k�.",
	"V�y l�m sao �� n�ng l�c luy�n ��n c�a �� t� t�ng th�m m�t b�c?",
	"��ng h�p t�p! B�y gi� ng��i �ang � giai �o�n b�o h�a m� ta th��ng n�i. Nh�ng l�c th� n�y th� kh� m� c� ti�n tri�n m�i.",
	"Giai �o�n b�o h�a? V�y �� t� ph�i l�m sao? Xin S� ph� ch� gi�o!",
	"D�c t�c b�t ��t! Ng��i h�y nghi�n c�u ph��ng ph�p ch� H�c � Tinh Th�ch, ta c�n m�t �t Huy�n Th�ch, h�y c�m l�y!",
	"�� t� hi�u r�!",
	}

	--�۳�5����ʯ
	if DelItem(2,8,7,5) == 1 then
		TalkEx("",strTalk);
		AddRecipe(805)
		AddItem(2,8,7,100,1);
		Msg2Player("B�n h�c ���c ph�i ch�: H�c � Tinh Th�ch")
		SetTask(TASK_MEDICINE_HEIWU,5);
	else
		TalkEx("",{"{5 vi�n Huy�n Th�ch} M�c ��i s� ph� nh� t�i h� ��a cho s� ph� c� ph�i �� l�m m�t tr�n ���ng?"});
	end
end

------------------------------------------���ϵ���߾�ľ�䷽����-------------------------------------------
function cooking_tieshan_001()

local strTalk = {
	"L�n tr��c Ho�ng Th��ng u�ng canh ���ng Quy h�m r�n xong t�m t�c khen ngon, nh�ng kh�u v� c�a Ho�ng Th��ng lu�n thay ��i. N�u l�n sau ng��i l�i mu�n �n m�n l� th� ta c� 10 c�i ��u c�ng kh�ng ��.",
	"S� ph� l�i hao t�m v� b�a �n c�a Ho�ng Th��ng?",
	"Chao �i! ��ng nh�c n�a! Ng��i ��n ��ng l�c l�m! Hai s� �� ta l�u r�i kh�ng g�p nhau, mau l�m v�i m�n �� nh�m nhi �i!",
	"V�y��",
	"Ng��i th�t l�! ��n m�n {b�nh B�t v�ng}, {C�m chi�n tr�ng }, {C�i x�o t�i}, {T�y M�ng T�u} s� ph� th�ch �n c�ng qu�n, th�c �n ngon kh�ng th� thi�u r��u! Ng��i mau l�m {5 ph�n} �i!",
	"Xin s� ph� ch� ch�t! (Kh�ng ng� s�c �n c�a s� ph� c�ng kh� qu�)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,1);
	TaskTip("L�m 5 ph�n b�nh B�t v�ng, C�m chi�n tr�ng, C�i x�o t�i v� T�y M�ng T�u cho Ng� Tr�");
	
end

function cooking_tieshan_002()

local strSay = {
	"Ng��i th�t l�! ��n m�n {b�nh B�t v�ng}, {C�m chi�n tr�ng }, {C�i x�o t�i}, {T�y M�ng T�u} s� ph� th�ch �n c�ng qu�n, th�c �n ngon kh�ng th� thi�u r��u! Ng��i mau l�m {5 ph�n} �i!",
	"R��u th�t t�i ��y!/cooking_tieshan_003",
	"�� t� ch�a h�c qua c�ch l�m/#ReLearnRecipe(6)",--��ѧ֮ǰû��ѧϰ���䷽
	"Xin S� ph� ch� ch�t!/nothing",
	}
	
	SelectSay(strSay);

end

function cooking_tieshan_003()

local strTalk = {
	"S� ph�! R��u th�t c� ��y!",
	"Hay l�m! �� ta n�m th� xem!",
	"�!!",
	"Ch�ng l� kh�ng h�p kh�u v�?",
	"���ng nhi�n r�i! Ng��i d�ng nguy�n li�u g� v�y?",
	"�� t� l�m theo l�i c�a s� ph�, d�ng Di�n Tinh M�ch, H� Ti�u, Dung tr�ch c�c. M�i v� th� n�o v�y s� ph�?",
	"Th�t k� l�! Ta ch�a t�ng �n qua {C�m chi�n tr�ng} ngon nh� v�y!",
	"��",
	}
	
	if handin_item(1,7) == 1 then
		TalkEx("cooking_tieshan_003_01",strTalk);
	else
		TalkEx("",{"R��u th�t ��u? Mau �em t�i �i! S� ph� ��i l�m r�i!"});
	end	
end


function cooking_tieshan_003_01()

local strTalk = {	
	"V�n �� kh�ng ph�i l� nguy�n li�u, �� ta xem b�p v� �� n�i.",
	"��y l��?",
	"��y ch� l� lo�i c�i th��ng, kh�ng th�y c� g� ��c bi�t.",
	"Ng��i �� � xem, lo�i {c�i} n�y sau khi cho v�o l� l�a l�n v�n c� t�nh ��n h�i nh�t ��nh kh�ng nh� c�c lo�i c�i kh�c. Xem ra ��y kh�ng ph�i l� lo�i g� th��ng. Th� n�y v�y! Ng��i �em ch�ng ��n {th�nh Nam} t�m {L�u Nh�t Ph�} h�i th� xem. V�i kinh nghi�m l�u n�m c�a y kh�ng ch�ng s� bi�t ���c nhi�u �i�u v� lo�i c�i n�y. ��i v�i vi�c n�u n��ng sau n�y s� c� l�i �ch nh�t ��nh.",
	"{L�u s� ph�} � {th�nh Nam} �! �� t� xin �i ngay!",
	"Nh�ng L�u Nh�t Ph� r�t th�ch u�ng {r��u}, ng��i nh� �em theo 1 b�nh N� Nhi H�ng th��ng h�ng.",
	}

	AddItem(2,0,394,1);--�õ���Ѱ����ľ��
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,2);
	TaskTip("��n Bi�n Kinh t�m L�u Nh�t Ph� h�i ngu�n g�c c�a lo�i c�i n�y");

end

function cooking_tieshan_004()

local strTalk = {
	"Ng��i mau �em s� {c�i} n�y ��n {th�nh Nam} t�m {L�u Nh�t Ph�}. V�i kinh nghi�m l�u n�m c�a y kh�ng ch�ng s� bi�t huy�n c� c�a c�y c�i n�y, kh�ng ch�ng s� c� �ch cho k� n�ng n�u n��ng sau n�y.",
	"�� t� tu�n l�nh!",
	}
	TalkEx("",strTalk);
end

function cooking_tieshan_005()

local strTalk = {
	"L�u s� ph�!",
	"Tr�i n�ng b�c th� n�y m� c� ���c v�i h� T�y M�ng T�u th� c�n g� b�ng.",
	"L�u s� ph�! T�i h� c� m�t chuy�n mu�n th�nh gi�o ng��i!",
	"Tr�i n�ng b�c th� n�y m� c� ���c v�i h� T�y M�ng T�u th� kh�ng c�n g� b�ng.",
	"(Hay l� �i t�m {5 h�} {T�y M�ng T�u} v҅�)",
	}
	TalkEx("",strTalk);
	SetTask(TASK_COOKING_TIESHAN,3);
	TaskTip("�i t�m 5 h� T�y M�ng T�u cho L�u Nh�t Ph�.");
end

function cooking_tieshan_006()

local strTalk = {
	"L�u s� ph�! Nh�n ng��i m� h�i nh� nh�i, ��n c�y ch�c r�t v�t v�. T�i h� c� �em m�t h� T�y M�ng T�u ��n, s� ph� h�y l�m v�i ch�n l�y l�i tinh th�n.",
	"Hay l�m! Thanh ni�n nh� ng��i b�y gi� hi�m th�y l�m!",
	"S� ph� t�i h� n�i L�u s� ph� r�t th�ch u�ng r��u, l�n n�y ��n ��y t�i h� �� ��ch th�n � m�t b�nh T�y M�ng T�u, m�i S� ph� n�m th�.",
	"Nh� tu�i v�y m� �� � ���c T�y M�ng T�u! Kh� l�m!",
	}
	--�Ͻ�5ƿ��������
	if GetItemCount(1,1,13) >= 5 then
		DelItem(1,1,13,5);
		if GetItemCount(2,0,394) >= 1 then
			DelItem(2,0,394,1);--�ջز�Ѱ����ľ��
		end 
		TalkEx("cooking_tieshan_006_01",strTalk);
	else
		TalkEx("",{"Mau �i t�m {5 b�nh T�y M�ng T�u} v�."});
	end
end

function cooking_tieshan_006_01()

local strTalk = {	
	"V�n b�i trong l�c n�u �n ph�t hi�n s� c�i n�y, s� ph� n�i s� c�i n�y kh�ng nh� lo�i c�i b�nh th��ng. Kh�ng bi�t n� c� g� ��c bi�t n�n sai t�i h� ��n th�nh gi�o L�u s� ph�.",
	"�� ta xem th�.",
	"Lo�i c�i n�y g�n gi�ng Thi�t Tuy�n m�c nh�ng d�o h�n. Nh�n b� m�t xem ra �� t�ng nung trong l�a nh�ng v�n gi� ���c nguy�n tr�ng, n�u d�ng ch�ng �� luy�n binh kh� kh�ng ch�ng s� luy�n ���c th�n binh. Th� n�y v�y! Ta t�ng ng��i m�t �t Su�t Nhi�n Nguy�n B� v� Thi�t Tuy�n m�c xem nh� c�m �n b�nh r��u ngon ng��i mang ��n.",
	"�a t� L�u s� ph� ch� �i�m!",
	}
	
	TalkEx("",strTalk);
	if GetTask(TASK_COOKING_TIESHAN) ~= 4 then
		SetTask(TASK_COOKING_TIESHAN,4);
		AddItem(2,2,11,5,1);--�õ�5����ľ
		AddItem(2,10,2,5,1);--�õ�5��ȻԭƤ
	end
	TaskTip("Quay v� g�p Ng� Tr� b�o c�o t�nh h�nh");

end

function cooking_tieshan_007()

local strTalk = {
	"Hay l� ��a {Su�t Nhi�n Nguy�n B�} v� {Thi�t Tuy�n M�c} c�a L�u s� ph� cho S� ph� r�i t�nh ti�p!",
	}
	
	TalkEx("",strTalk);

end

function cooking_tieshan_008()

local strTalk = {
	"V� r�i �? C� h�i ���c g� kh�ng?",
	"L�u s� ph� n�i Thi�t Tuy�n Tinh M�c n�y l� th��ng ph�m ch� t�o binh kh�, �ng ta c�n ��a �� t� Su�t Nhi�n Nguy�n B� v� Thi�t Tuy�t �� c�m �n �� mang r��u ��n.",
	"Su�t Nhi�n Nguy�n B�? Da r�n n�y r�t hi�m th�y, 10 n�m n� m�i l�t da m�t l�n, l� m�t trong nh�ng m�n �n ngon. Ng��i ch� ch�t! ��i vi s� l�m m�t ch�n ch�o r�n h�o h�ng! ��m b�o ng��i �n xong s� th�ch ngay.",
	" 1 gi� sau��",
	"S� ph�! Canh r�n �� n�u xong?",
	"�n ch�n canh l�m t� Su�t Nhi�n B� ta th�t kh�ng ��nh l�ng! Vi s� �� ki�m tra c�i trong l� l�i c� lo�i c�i �� kh�ng nh�ng kh�ng th� c�i thi�n ch�t l��ng n�u �n m� l�a ch�y c�ng c� v�n ��, xem ra ph�i ti�p t�c lo ngh� chuy�n �n u�ng c�a Ho�ng th��ng.",
	"Su�t Nhi�n Nguy�n B� n�y ng��i h�y l�y �i!"
	}
	
	--�۳���ȻԭƤ������ľ��5��
	if GetItemCount(2,2,11) >= 5 and GetItemCount(2,10,2) >= 5 then
		DelItem(2,2,11,5);
		DelItem(2,10,2,5);
		TalkEx("",strTalk);
		SetTask(TASK_COOKING_TIESHAN,5);
		AddRecipe(806)
		AddItem(2,10,2,100,1);
		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Phi�n Tinh M�c")
	else
		TalkEx("",{"{5} ph�n {Su�t Nhi�n Nguy�n B�} v� {Thi�t Tuy�n m�c} L�u s� ph� nh� ta ��a cho S� ph� ch�ng l� l�m m�t tr�n ���ng?"});
	end
end

-------------------------------------֯��ϵɽʨ��Ƥ�䷽ѧϰ����-----------------------------
function weave_shanshi_001()

local strTalk = {
	"Ng��i ��n ��ng l�c l�m! L�n tr��c l�i bu�n � ��i L� c� �em ��n cho ta �t trang ph�c c�a d�n t�c thi�u s� � khu T�y Nam r�t ��p. Ta �ang ��nh l�m v�i b� trang ph�c m�i, kh� n�i qu� �t trang ph�c �� tham kh�o.Th� n�y v�y! Ng��i ��n ��i L� t�m Ch� ti�m N� ph�c l�y v�i b� trang ph�c v� �� ta tham kh�o.",
	"�� nhi l�p t�c �i ngay!",
	"Ch� ti�m N� ph�c l� ng��i l�m �n, kh� tr�nh t�nh to�n chi li. Ng��i h�y ��a b� ta v�i b� y ph�c n�u kh�ng b� ta s� kh�ng ch�u ��a �� cho ng��i.",
	}
  
  TalkEx("",strTalk);
	SetTask(TASK_WEAVE_SHANSHI,1);
	TaskTip("��n ��i L� t�m ch� ti�m N� ph�c mua v�i b� y ph�c c�a khu v�c T�y Nam cho C�m N��ng");
  	
end

function weave_shanshi_002()
				 
local strSay = {
	"Ch� ti�m N� ph�c l� ng��i l�m �n, kh� tr�nh t�nh to�n chi li. Ng��i h�y ��a b� ta v�i b� y ph�c n�u kh�ng b� ta s� kh�ng ch�u ��a �� cho ng��i.",
	"�� t� ch�a h�c qua c�ch l�m/#ReLearnRecipe(4)",--��ѧ֮ǰû��ѧϰ���䷽
	"Bi�t r�i!/nothing"
	}
  
  SelectSay(strSay);
  
end

function weave_shanshi_003()

local strTalk_1 = {
	"Ch�o ng��i! S� ph� sai t�i h� ��n l�y v�i b� y ph�c c�a d�n t�c thi�u s� � khu T�y Nam v� tham kh�o �� may v�i b� trang ph�c m�i.",
	"Trang ph�c � ��y c�i n�o c�ng ph�i t�n nhi�u ti�n m�i mua ���c, ng��i n�i ��a C�m N��ng l� ��a sao? �t nh�t c�ng ph�i l�y l�i ti�n v�n. N�i ��n chuy�n ti�n b�c d� m�t l�ng. Ng��i n�i xem��",
	"(Qu� ��ng nh� l�i c�a C�m n��ng, hay l� ��a b� ta {Huy�t H� Qu� V��ng Kh�i}, {S�n Qu� Huy�t Y}, {Long B� � kim Y} v� {Thi�n Gi�ng B�o}, n�u kh�ng b� ta s� kh�ng ch�u ��a y ph�c cho ta)",
	}	
local strTalk_2 = {
	"Ch�o ng��i! S� ph� sai t�i h� ��n l�y v�i b� y ph�c c�a d�n t�c thi�u s� � khu T�y Nam v� tham kh�o �� may v�i b� trang ph�c m�i.",
	"Trang ph�c � ��y c�i n�o c�ng ph�i t�n nhi�u ti�n m�i mua ���c, ng��i n�i ��a C�m N��ng l� ��a sao? �t nh�t c�ng ph�i l�y l�i ti�n v�n. N�i ��n chuy�n ti�n b�c d� m�t l�ng. Ng��i n�i xem��",
	"(Qu� ��ng nh� l�i c�a C�m n��ng, hay l� ��a b� ta {Thi�n Y}, {Phi Thi�n Th�i Th��ng}, {V� Song ��u Y}, {Ng� Th�i Ngh� Th��ng}, n�u kh�ng b� ta s� kh�ng ch�u ��a y ph�c cho ta)",
	}
  
  --�ж��·�֯���Ա�·��
  if GetTask(1935) == 1 then
  	TalkEx("",strTalk_1);
  	TaskTip("��a Huy�t H� Qu� V��ng Kh�i, S�n Qu� Huy�t Y, Long B� � kim Y v� Thi�n Gi�ng B�o cho Ch� ti�m N� ph�c");
  else
		TalkEx("",strTalk_2);
		TaskTip("��a Thi�n Y, Phi Thi�n Th�i Th��ng, V� Song ��u Y, Ng� Th�i Ngh� Th��ng cho Ch� ti�m N� ph�c");
	end
	SetTask(TASK_WEAVE_SHANSHI,2);
end

function weave_shanshi_004()

local strSay_1 = {
	"Th� n�o m�i t�t ��y?��(Tr��c khi nh�n Huy�t H� Qu� V��ng Kh�i, S�n Qu� Huy�t Y, Long B� � kim Y v� Thi�n Gi�ng B�o xin t�m th�i b� nh�ng v�t ph�m kh�ng c�n thi�t v�o r��ng ch�a �� �� tr�nh th�t tho�t)",
	"� ��y c� v�i b� trang ph�c xem nh� l� v�t t�i h� m�o mu�i ��n nh� ng��i gi�p./weave_shanshi_005",
	"Sau n�y h�y ��a./nothing"
	}
	
local strSay_2 = {
	"Th� n�o m�i t�t ��y?��((Tr��c khi nh�n Thi�n Y, Phi Thi�n Th�i Th��ng, V� Song ��u Y v� Ng� Th�i Ngh� Th��ng xin t�m th�i b� nh�ng v�t ph�m kh�ng c�n thi�t v�o r��ng ch�a �� �� tr�nh th�t tho�t)",
	"� ��y c� v�i b� trang ph�c xem nh� l� v�t t�i h� m�o mu�i ��n nh� ng��i gi�p./weave_shanshi_005",
	"Sau n�y h�y ��a./nothing"
	}
	
  --�ж��·�֯���Ա�·��
  if GetTask(1935) == 1 then
  	SelectSay(strSay_1);
  else
  	SelectSay(strSay_2);
  end

end

function weave_shanshi_005()

local strTalk_1 = {
	"��y l� trang ph�c s� ph� nh� t�i h� �em ��n!",
	"�! C�m N��ng l�c n�o c�ng v�y, m�i ng��i c�n l� g� nhau m� c�n kh�ch kh� th�! Th� n�y v�y! �� ta nh� l�i bu�n chuy�n h�ng ��n ��i T�ng ti�n ���ng s� gh� ��a cho S� ph� ng��i v�i b� trang ph�c c�a ��i L�, ng��i v� ch� tin �i!",
	"(Qu� nhi�n l� ng��i l�m �n! �� th� c�ng kh�ng c�n c�ch n�o kh�c, hay l� quay v� ph�c m�nh C�m N��ng).",
	"V�y xin l�m phi�n ng��i!",
	"��ng kh�ch s�o!",
	}
	
local strTalk_2 = {
	"Kh�ng ph�i ng��i n�i C�m N��ng ��a trang ph�c cho ta sao? Sao kh�ng th�y g� h�t v�y?",
	"(Qu� ��ng nh� l�i c�a C�m n��ng, hay l� ��a b� ta {Huy�t H� Qu� V��ng Kh�i}, {S�n Qu� Huy�t Y}, {Long B� � kim Y} v� {Thi�n Gi�ng B�o}, n�u kh�ng b� ta s� kh�ng ch�u ��a y ph�c cho ta)",
	}
	
local strTalk_3 = {
	"Kh�ng ph�i ng��i n�i C�m N��ng ��a trang ph�c cho ta sao? Sao kh�ng th�y g� h�t v�y?",
	"(Qu� ��ng nh� l�i c�a C�m n��ng, hay l� ��a b� ta {Thi�n Y}, {Phi Thi�n Th�i Th��ng}, {V� Song ��u Y}, {Ng� Th�i Ngh� Th��ng}, n�u kh�ng b� ta s� kh�ng ch�u ��a y ph�c cho ta)",
	}

  --�Ͻ��·�
  if GetTask(1935) == 1 then
  	if handin_item(1,5) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("V� Th�nh �� ph�c m�nh C�m N��ng");
  	else
  		TalkEx("",strTalk_2);
  	end
  else
  	if handin_item(1,8) == 1 then
			TalkEx("",strTalk_1);
			SetTask(TASK_WEAVE_SHANSHI,3);
			TaskTip("V� Th�nh �� ph�c m�nh C�m N��ng");
		else
  		TalkEx("",strTalk_3);
  	end
  end
end

function weave_shanshi_006()

local strTalk = {
	"Y�n t�m �i! �� ta nh� l�i bu�n chuy�n h�ng ��n ��i T�ng ti�n ���ng s� gh� ��a cho s� ph� ng��i v�i b� trang ph�c c�a ��i L�, ng��i v� ch� tin �i!",
	"(Qu� nhi�n l� ng��i l�m �n! �� th� c�ng kh�ng c�n c�ch n�o kh�c, hay l� quay v� ph�c m�nh C�m N��ng).",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_007()

local strTalk = {
	"�� t� v� r�i! Ch� ti�m n�i s� nh� l�i bu�n c�a ��i L� chuy�n h�ng ��n, c�ng kh�ng bi�t��",
	"Y�n t�m r�i! Trang ph�c s� ���c chuy�n ��n nhanh th�i! B�n h� l� d�n l�m �n lu�n l�y ch� t�n l�m ��u m�.",
	"V�y th� hay l�m! Kh�ng bi�t hi�n gi� s� ph� �� ngh� ra trang ph�c n�o m�i ch�a?",
	"� t��ng �� c�, nh�ng c�n thi�u nguy�n li�u! S�n S� B� l�n tr��c Th� s�n Tr��ng ��a cho ta v�a c�ng v�a d�o nh�ng �t qu�, trong l�c ta d�t �� th� th�m L�nh tr�ng t� v�o �� t�ng �� d�o nh�ng l�i r�t kh� nhu�m. Ng��i gi�p ta h�i th�m Ho�ng ��i Th�m l�m sao �� nhu�m v� t�ng t�nh d�o dai c�a S�n S� B�.",
	"�� t� �i ngay!",
	}

	TalkEx("",strTalk);
	if GetTask(TASK_WEAVE_SHANSHI) ~= 4 then
		AddItem(2,2,47,1,1);--�õ�ɽʨ֮Ƥ
		SetTask(TASK_WEAVE_SHANSHI,4);
	end
	TaskTip("�em S�n S� B� ��n Th�nh �� t�m Ho�ng ��i Th�m h�i c�ch nhu�m m�u");

end

function weave_shanshi_008()

local strTalk = {
	"Ng��i gi�p ta h�i th�m Ho�ng ��i Th�m l�m sao �� nhu�m v� t�ng t�nh G�n c�t c�a S�n S� B�.",
	"�� t� �i ngay!",
	}

	TalkEx("",strTalk);
	
end

function weave_shanshi_009()

local strTalk = {
	"Xin ch�o ��i th�m !",
	"Ng��i l� �� t� c�a C�m N��ng? B� ta th��ng khen mi tr��c m�t ta! H�m nay t�m ta c� vi�c g�?",
	"S� ph� t�i h� trong l�c may �o m�i g�p ch�t kh� kh�n. S� ph� mu�n c�i thi�n �� d�o c�a S�n S� B�. Ng��i �� th� th�m L�nh tr�ng t�, �� d�o th� ���c c�i thi�n nh�ng m�u s�c l�i r�t kh� nhu�m. Kh�ng bi�t Ho�ng ��i Th�m c� th� gi�p S� ph� gi�i quy�t v�n ��?",
	"M�u Tr�ng l� �u �i�m c�a � T�m Ti nh�ng v� n� qu� tr�ng n�n kh�ng th� tr�n l�n v�i m�u kh�c. Th� n�y v�y! Ta c� � T�m Ti do m�t ng��i b�n t�ng. � T�m n�y s�ng trong b�ng tuy�t l�u n�m n�n t� n� nh� ra kh�ng nh�ng ch�c m� c�n ��p. H�y nh�n l�y kh�ng ch�ng s� gi�p ���c ng��i.",
	"�a t� Ho�ng ��i Th�m!",
	"��ng kh�ch s�o! C�m N��ng c�ng th��ng t�ng ta trang ph�c, s� T� t�m n�y th� c� ��ng l� bao. H�y mau �em v� cho C�m N��ng!",
	}

	--�۵�ɽʨ֮Ƥ
	if DelItem(2,2,47,1) == 1 then
		TalkEx("",strTalk);
		if GetTask(TASK_WEAVE_SHANSHI) ~= 5 then
			AddItem(2,9,7,5,1);--�õ��ڲ�˿
			SetTask(TASK_WEAVE_SHANSHI,5);
		end
		TaskTip("�em 5 � T�m Ti c�a Ho�ng ��i Th�m v� cho C�m N��ng");
	else
		TalkEx("",{"{1} t�m {S�n S� B�} C�m N��ng nh� ta ��a cho s� ph� ch�ng l� �� l�m m�t tr�n ���ng?"});
	end

end

function weave_shanshi_010()

local strTalk = {
	"��ng kh�ch s�o! C�m N��ng c�ng th��ng t�ng ta trang ph�c, s� T� t�m n�y th� c� ��ng l� bao. H�y mau �em v� cho C�m N��ng!",
	}

	TalkEx("",strTalk);

end

function weave_shanshi_011()

local strTalk = {
	"��y l� � T�m Ti c�a Ho�ng ��i Th�m, xin s� ph� xem qua!",
	"�! �� ta th� xem��",
	" (1 gi� sau�)",
	"T� t�m n�y qu� nhi�n l� lo�i th��ng ��ng. � ��y c� �t � T�m Ti v� c�ch ch� t�o S�n S� Tinh B�, ng��i h�y t� t� nghi�n c�u.",
	"�a t� s� ph�!",
	}

	--��5���ڲ�˿
	if GetItemCount(2,9,7) >= 5 then
		DelItem(2,9,7,5);
		TalkEx("",strTalk);
		SetTask(TASK_WEAVE_SHANSHI,6);
		AddRecipe(807);
		AddItem(2,9,7,100,1);
		Msg2Player("B�n h�c ���c ph�i ch�: S�n S� Tinh B�")
	else
		TalkEx("",{"{5} ph�n {� T�m Ti} Ho�ng ��i Th�m nh� ta ��a cho s� ph� ch�ng l� �� l�m m�t d�c ���ng?"});
	end
end

-------------------------------------------�Ʒ�ϵ��������䷽ѧϰ����-----------------------------
function juju_chiwu_001()

local strTalk = {
	"Ng��i ��n ��ng l�c l�m! G�n ��y s�c m�nh c�a O�n H�n � Phong �� c�ng ng�y c�ng m�nh, g�n ��y ch�ng �� t�n c�ng Giang T�n th�n, vi s� �ang ngh� c�ch ch� t�o lo�i ph� m�i. L�n tr��c {L�u Nh�t Ph�} � {Bi�n Kinh} v� {Th� m� ��i} � {Th�nh ��} c� xin ta {Khu Ma linh ph�} nh�ng v�n ch�a ��a cho h�, ng��i h�y thay ta �i m�t chuy�n!",
	"�� t� �i ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,1);
	AddItem(2,0,395,2,1);--��������ħ���
	TaskTip("�em 2 t�m Khu Ma linh ph� ��n cho L�u Nh�t Ph� � Bi�n Kinh v� ��i kho�ng c�ng � Th�nh ��.");
end

function juju_chiwu_002()

local strTalk = {
	"L�n tr��c {L�u Nh�t Ph�} � {Bi�n Kinh} v� {��i kho�ng c�ng} � {Th�nh ��} c� xin ta {Khu Ma linh ph�} nh�ng v�n ch�a ��a cho h�, ng��i h�y thay ta �i m�t chuy�n!",
	"�� t� �i ngay!",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_003()

local strTalk = {
	"L�u s� ph�! S� ph� t�i h� g�n ��y b�n ch� t�o m�t lo�i ph� m�i, kh�ng th� �em Khu Ma linh ph� ��n cho ng��i.",
	"G�n ��y O�n H�n th��ng xu�t hi�n � Giang T�n th�n, c� linh ph� n�y sau n�y c� th� y�n t�m ��o kho�ng.",
	"S�c m�nh c�a Khu Ma ph� n�y c� h�n, s� ph� ng�y ��m suy ngh� �� ch� t�o lo�i ph� m�i nh�ng kh�ng c� k�t qu�.",
	"Ta c� B� �� m�c, nghe n�i c� th�n l�c ph� h�, kh�ng bi�t c� th� gi�p �ch g� cho s� ph� ng��i.",
	"V�y t�i h� thay m�t s� ph� �a t� L�u s� ph�!",
	"��ng kh�ch s�o!",
	}

	TalkEx("",strTalk);
	--ɾȥ��ħ���
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1) then
		AddItem(2,2,14,10,1);--�õ�10������ľ
		SetTask(TASK_JUJU_TALK,SetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01,1));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("�em B� �� m�c v� H�c � th�ch c�a L�u Nh�t Ph� v� ��i kho�ng c�ng v� cho V�n Du ��o nh�n");
	else
		TaskTip("��a 1 t�m Khu Ma Linh Ph� cho ��i kho�ng c�ng � Th�nh ��");
	end
	
end

function juju_chiwu_004()

local strTalk = {
	"G�n ��y O�n H�n th��ng xu�t hi�n � Giang T�n th�n, c� linh ph� n�y sau n�y c� th� y�n t�m ��o kho�ng.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_005()

local strTalk = {
	"��i s� ph�! S� ph� t�i h� g�n ��y b�n ch� t�o m�t lo�i ph� m�i, kh�ng th� �em Khu Ma linh ph� ��n cho ng��i.",
	"G�n ��y O�n H�n th��ng xu�t hi�n � Giang T�n th�n, c� t�m ph� n�y sau n�y ta y�n t�m ��o kho�ng h�n.",
	"S�c m�nh c�a Khu Ma ph� n�y c� h�n, s� ph� ng�y ��m suy ngh� �� ch� t�o lo�i ph� m�i nh�ng kh�ng c� k�t qu�.",
	"Ta c� ch�t H�c � th�ch. L�n tr��c s� ph� ng��i c� nh� ta t�m Thi�n thanh th�ch �� luy�n b�a, ch�t l��ng c�a H�c � th�ch n�y t�t h�n Thi�n thanh th�ch, kh�ng bi�t cho gi�p �ch g� cho S� ph� ng��i, h�y �em n� v� cho s� ph�!",
	"V�y t�i h� thay m�t s� ph� �a t� L�u s� ph�!",
	"��ng kh�ch s�o!",
	}

	TalkEx("",strTalk);	
	--ɾȥ��ħ���
	if GetItemCount(2,0,395) >= 1 then
		DelItem(2,0,395,1);
	end	
	if GetTask(TASK_JUJU_TALK) ~= SetBit(GetTask(TASK_JUJU_TALK),2,1) then
		AddItem(2,2,37,10,1);--�õ�10������ʯ
		SetTask(TASK_JUJU_TALK,(SetBit(GetTask(TASK_JUJU_TALK),2,1)));
	end
	
	if GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 then
		SetTask(TASK_JUJU_CHIWU,2);
		TaskTip("�em B� �� m�c v� H�c � th�ch c�a L�u Nh�t Ph� v� ��i kho�ng c�ng v� cho V�n Du ��o nh�n");
	else
		TaskTip("��a 1 t�m Khu Ma Linh Ph� cho L�u Nh�t Ph� � Bi�n Kinh");
	end
	
end

function juju_chiwu_006()

local strTalk = {
	"G�n ��y O�n H�n th��ng xu�t hi�n � Giang T�n th�n, c� linh ph� n�y sau n�y c� th� y�n t�m ��o kho�ng.",
	}
	TalkEx("",strTalk);
	
end

function juju_chiwu_007()

local strTalk = {
	"�� ��a linh ph� cho L�u s� ph� v� ��i s� ph�? B�n h� th��ng ��n c�y ��o kho�ng trong n�i s�u, n�i �� �m kh� t� t�, tuy kh� n�ng c�a Khu Ma Linh Ph� c� h�n nh�ng gi�p tho�t th�n th� kh�ng v�n �� g�.",
	"H� c� g�i cho s� ph� {H�c � th�ch} v� {B� �� m�c}, hy v�ng h�u �ch v� c�ng �� ��p t� l� b�a c�a ng��i.",
	"�� ta xem th�!",
	"H�c � th�ch n�y c� t� t�nh th�n k�, B� �� m�c n�y c�ng �n ch�a th�n l�c ph� h�. Ng��i c�m th� xem.",
	" (1 gi� sau�)",
	}

	--��10�ݺ���ʯ������ľ
	if DelItem(2,2,37,10) == 1 and DelItem(2,2,14,10) == 1 then
		TalkEx("juju_chiwu_007_01",strTalk);
	else
		TalkEx("",{"{10} {B� �� m�c} v� {H�c � th�ch} L�u s� ph� v� ��i s� ph� nh� ta ��a cho s� ph� ch�ng l� d�c ���ng �� l�m m�t?"});
	end
end

function juju_chiwu_007_01()

local strTalk = {
	"S� ph�! Th� n�o?",
	"2 m�n L�u s� ph� v� ��i s� ph� ��a ta ��u l� b�o b�i kh�ng nh�ng t�ng uy l�c c�a b�a ch� m� c�n c� s�c m�nh th�n k�.",
	"Vi s� s� truy�n th� cho ng��i ph��ng ph�p, ng��i h�y c� g�ng nghi�n c�u kh�ng ch�ng s� ph�t hi�n t�c d�ng kh�c c�a n�.",
	"�a t� s� ph� ch� �i�m!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_JUJU_CHIWU,3);
	AddRecipe(808);
	AddItem(2,2,14,100,1);
	Msg2Player("B�n h�c ���c ph�i ch�: X�ch � Linh Ph�");

end

--��ѧ�䷽
--nTypeΪ 1:��������2�̱�����3���ű��� 4:����֯�졡5����ҩ��6�����
function ReLearnRecipe(nType)
	if (nType == 1) then
		local nLevel = GetLifeSkillLevel(1, 2);
		if (GetLifeSkillLevel(1, 2) > 1) then
      		if (GetTask(1926) == 10 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
       		elseif (GetTask(1926) == 20 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
       		elseif (GetTask(1926) == 30 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
       		elseif (GetTask(1926) == 40 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        		AddRecipe(756)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
       		elseif (GetTask(1926) == 50 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        		AddRecipe(756)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        		AddRecipe(757)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
       		elseif (GetTask(1926) == 60 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        		AddRecipe(756)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        		AddRecipe(757)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        		AddRecipe(758)
        		Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
       		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 0) then
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        		AddRecipe(750)
        		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        		AddRecipe(756)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        		AddRecipe(757)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        		AddRecipe(758)
        		Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
        		AddRecipe(759)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
      		elseif (GetTask(1926) == 70 and HaveLearnRecipe(749) == 1 and HaveLearnRecipe(759) == 0) then
        		AddRecipe(759)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
        	elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(86)
        		Msg2Player("B�n h�c ���c ph�i ch�: Th�y H�a C�n")
    			AddRecipe(87)
    			Msg2Player("B�n h�c ���c ph�i ch�: T� B�nh C�n")
    			AddRecipe(97)
    			Msg2Player("B�n h�c ���c ph�i ch�: T�ch Tr��ng")
    			AddRecipe(98)
    			Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng Ph�p Tr��ng")
        		AddRecipe(749)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
    			AddRecipe(750)
    			Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
    			SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(88)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� �� C�n")
        		AddRecipe(89)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�c V� C�n")
        		AddRecipe(99)
        		Msg2Player("B�n h�c ���c ph�i ch�: Tam B�o Tr��ng")
        		AddRecipe(100)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph�c Ma Tr��ng")
        		AddRecipe(751)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        		AddRecipe(752)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(90)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph�n Th�y C�n")
        		AddRecipe(101)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� �� Tr��ng")
        		AddRecipe(753)
        		Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(91)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ti�m Long C�n")
        		AddRecipe(92)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� Kim L��ng")
        		AddRecipe(102)
        		Msg2Player("B�n h�c ���c ph�i ch�: Nguy�t Lu�n Tr��ng")
        		AddRecipe(103)
        		Msg2Player("B�n h�c ���c ph�i ch�: Kh�ng Minh Tr��ng")
        		AddRecipe(754)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        		AddRecipe(755)
        		Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(93)
        		Msg2Player("B�n h�c ���c ph�i ch�: �� C�u B�ng")
        		AddRecipe(94)
        		Msg2Player("B�n h�c ���c ph�i ch�: Kh�n Na La B�ng")
        		AddRecipe(104)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�o Quang Tr��ng")
        		AddRecipe(105)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i T� T�i Tr��ng")
        		AddRecipe(756)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(95)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n X� C�n")
        		AddRecipe(106)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i B�t Nh� Tr��ng")
        		AddRecipe(757)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        		SetTask(1926, 60)
    		elseif (nLevel >= 60 and GetTask(1926) == 60) then
        		AddRecipe(96)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thanh Long C�n")
        		AddRecipe(107)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ph�t Tr��ng")
        		AddRecipe(758)
        		Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
        		SetTask(1926, 70)
       		elseif (nLevel >= 70 and GetTask(1926) == 70) then
        		AddRecipe(759)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
        		SetTask(1926, 80)
       		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B�n tr�! ��ng n�ng v�i! B�n l�nh giang h� c�a ng��i c�n k�m, ch� ng��i luy�n th�m m�t th�i gian n�a h�y ��n t�m ta."})
			end
		end
	end
	
	if (nType == 2) then
		local nLevel = GetLifeSkillLevel(1, 3)
		if (GetLifeSkillLevel(1, 3) > 1) then
			if (nLevel >= 1 and GetTask(1926) == 0) then
				AddRecipe(49)
    			Msg2Player("B�n h�c ���c ph�i ch�: Phi Ng� Th�")
	   			AddRecipe(50)
	   			Msg2Player("B�n h�c ���c ph�i ch�: H�ng Ma Th�")
    			AddRecipe(62)
    			Msg2Player("B�n h�c ���c ph�i ch�: Linh X� Ki�m")
				AddRecipe(63)
				Msg2Player("B�n h�c ���c ph�i ch�: X�ch Sa Ki�m")
    			AddRecipe(73)
    			Msg2Player("B�n h�c ���c ph�i ch�: Gi�i �ao")
    			AddRecipe(74)
    			Msg2Player("B�n h�c ���c ph�i ch�: Chi�t Thi�t �ao")
    			AddRecipe(782)
    			Msg2Player("B�n h�c ���c ph�i ch�: Li�u Di�p Song �ao")
    			AddRecipe(783)
    			Msg2Player("B�n h�c ���c ph�i ch�: Nguy�t Nha Th�ch")
        		SetTask(1926, 10)
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(51)
        		Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n V�n Th�")
        		AddRecipe(52)
        		Msg2Player("B�n h�c ���c ph�i ch�: Tam D��ng Th�")
        		AddRecipe(64)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thanh Minh Ki�m")
        		AddRecipe(65)
        		Msg2Player("B�n h�c ���c ph�i ch�: Huy�t S�t Ki�m")
        		AddRecipe(75)
        		Msg2Player("B�n h�c ���c ph�i ch�: Li�t Di�m �ao")
        		AddRecipe(76)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng� H� �o�n M�n �ao")
        		AddRecipe(784)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i Phi Th�ch")
        		AddRecipe(785)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�ng �n �ao")
        		SetTask(1926, 20)
    		elseif (nLevel >= 20 and GetTask(1926) == 20) then
        		AddRecipe(53)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ng�u Th�")
        		AddRecipe(66)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�m Quang Ki�m")
        		AddRecipe(77)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�u �m �ao")
        		AddRecipe(786)
        		Msg2Player("B�n h�c ���c ph�i ch�: Bi�n B�c �ao")
        		SetTask(1926, 30)
    		elseif (nLevel >= 30 and GetTask(1926) == 30) then
        		AddRecipe(54)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�ch X� Th�")
        		AddRecipe(55)
        		Msg2Player("B�n h�c ���c ph�i ch�: Kh�ng Long Th�")
        		AddRecipe(67)
        		Msg2Player("B�n h�c ���c ph�i ch�: L�c D��ng")
        		AddRecipe(68)
        		Msg2Player("B�n h�c ���c ph�i ch�: Huy�n �i�n")
        		AddRecipe(78)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ph� S�n �ao")
        		AddRecipe(79)
        		Msg2Player("B�n h�c ���c ph�i ch�: Nh�n �� �ao")
        		AddRecipe(787)
        		Msg2Player("B�n h�c ���c ph�i ch�: N� H�ng")
        		AddRecipe(788)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�o Hoa")
        		SetTask(1926, 40)
    		elseif (nLevel >= 40 and GetTask(1926) == 40) then
        		AddRecipe(56)
        		Msg2Player("B�n h�c ���c ph�i ch�: T��ng Ph�ng")
        		AddRecipe(57)
        		Msg2Player("B�n h�c ���c ph�i ch�: N� Long")
        		AddRecipe(69)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thanh S��ng")
        		AddRecipe(70)
        		Msg2Player("B�n h�c ���c ph�i ch�: Dao Quang")
        		AddRecipe(80)
        		Msg2Player("B�n h�c ���c ph�i ch�: Long L�n")
        		AddRecipe(81)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�ch B�ch")
        		AddRecipe(789)
        		Msg2Player("B�n h�c ���c ph�i ch�: Uy�n ��ng Li�n Ho�n")
        		SetTask(1926, 50)
    		elseif (nLevel >= 50 and GetTask(1926) == 50) then
        		AddRecipe(58)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng� Ph��ng Qu� Ch�ng")
        		AddRecipe(71)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�ch Huy�t")
        		AddRecipe(82)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n S�t")
        		AddRecipe(790)
        		Msg2Player("B�n h�c ���c ph�i ch�: Huy�t Li�n Ho�n")
        		SetTask(1926, 60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(59)
        		Msg2Player("B�n h�c ���c ph�i ch�: N� L� ��a Ng�c")
        		AddRecipe(72)
        		Msg2Player("B�n h�c ���c ph�i ch�: Huy�n thi�t Tr�ng Ki�m")
        		AddRecipe(83)
        		Msg2Player("B�n h�c ���c ph�i ch�: B� V��ng")
        		AddRecipe(791)
        		Msg2Player("B�n h�c ���c ph�i ch�: T�i Nguy�t")
        		SetTask(1926, 70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
        		AddRecipe(792)
        		Msg2Player("B�n h�c ���c ph�i ch�: �o�n Tr��ng")
        		SetTask(1926, 80)
      		else
       			TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B�n tr�! ��ng n�ng v�i! B�n l�nh giang h� c�a ng��i c�n k�m, ch� ng��i luy�n th�m m�t th�i gian n�a h�y ��n t�m ta."})
      		end
    	end 
	end
	
	if (nType == 3) then
			local nLevel = GetLifeSkillLevel(1, 4)
			if (GetLifeSkillLevel(1, 4) > 1) then
				if (GetTask(1926) == 10 and HaveLearnRecipe(760) == 0) then
			  		AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
				elseif GetTask(1926)==20 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
      			elseif GetTask(1926)==30 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
      			elseif GetTask(1926)==40 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        			AddRecipe(765)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        			AddRecipe(766)
        			Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
      			elseif GetTask(1926)==50 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        			AddRecipe(765)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        			AddRecipe(766)
        			Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        			AddRecipe(767)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
      			elseif GetTask(1926)==60 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        			AddRecipe(765)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        			AddRecipe(766)
        			Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        			AddRecipe(767)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        			AddRecipe(768)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
      			elseif GetTask(1926)==70 and HaveLearnRecipe(760)==0 then
        			AddRecipe(760)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			  		AddRecipe(761)
			  		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        			AddRecipe(765)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        			AddRecipe(766)
        			Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        			AddRecipe(767)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        			AddRecipe(768)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
        			AddRecipe(769)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xi Nha")     			
        		elseif (nLevel >= 1 and GetTask(1926) == 0) then
        			AddRecipe(110)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Li�u Di�p �ao")
		    		AddRecipe(111)
		    		Msg2Player("B�n h�c ���c ph�i ch�: �o�n Tr��ng ti�u")
		    		AddRecipe(121)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Ng�c V�n c�m")
		    		AddRecipe(122)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Kinh ��o c�m")
		    		AddRecipe(132)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Ph�n Quan b�t")
		    		AddRecipe(133)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Chi�t Xung b�t")
		    		AddRecipe(760)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
		    		AddRecipe(761)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
		    		AddRecipe(771)
		    		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t tr�o")
		    		AddRecipe(772)
		    		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang tr�o")
		    		SetTask(1926, 10)
    			elseif (nLevel >= 10 and GetTask(1926) == 10) then
        			AddRecipe(112)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ph� Di�t th�n ch�m")
        			AddRecipe(113)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� M�u Ly H�n ti�n")
        			AddRecipe(123)
        			Msg2Player("B�n h�c ���c ph�i ch�: B�n L�i c�m")
        			AddRecipe(124)
        			Msg2Player("B�n h�c ���c ph�i ch�: Phi B�c Li�n ch�u")
        			AddRecipe(134)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xu�n Phong b�t")
        			AddRecipe(135)
        			Msg2Player("B�n h�c ���c ph�i ch�: Kinh L�i b�t")
        			AddRecipe(762)
        			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        			AddRecipe(763)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        			AddRecipe(773)
        			Msg2Player("B�n h�c ���c ph�i ch�: C� Quan tr�o")
        			AddRecipe(774)
        			Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng tr�o")
        			SetTask(1926, 20)
    			elseif nLevel>=20 and GetTask(1926)==20 then
        			AddRecipe(114)
        			Msg2Player("B�n h�c ���c ph�i ch�: H�c Huy�t th�n ch�m")
        			AddRecipe(125)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�i ��ng v�n v�t")
        			AddRecipe(136)
        			Msg2Player("B�n h�c ���c ph�i ch�: V� H�i b�t")
        			AddRecipe(764)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        			AddRecipe(775)
        			Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
        			SetTask(1926, 30)
    			elseif nLevel>=30 and GetTask(1926)==30 then
        			AddRecipe(115)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ng�c Phong ch�m")
        			AddRecipe(116)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� L� c�n kh�n")
        			AddRecipe(126)
        			Msg2Player("B�n h�c ���c ph�i ch�: Huy�n Nhai phi b�c")
        			AddRecipe(127)
        			Msg2Player("B�n h�c ���c ph�i ch�: H�i Nguy�t thanh huy")
        			AddRecipe(137)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t b�t")
        			AddRecipe(138)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th� H�n b�t")
        			AddRecipe(765)
        			Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        			AddRecipe(766)
        			Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        			AddRecipe(776)
        			Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
        			AddRecipe(777)
        			Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
        			SetTask(1926, 40)
    			elseif nLevel>=40 and GetTask(1926)==40 then
        			AddRecipe(117)
        			Msg2Player("B�n h�c ���c ph�i ch�: H�m Sa X� �nh")
        			AddRecipe(118)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tinh Th�u C�t ch�m")
        			AddRecipe(128)
        			Msg2Player("B�n h�c ���c ph�i ch�: C�u Ti�u Ho�n b�i")
        			AddRecipe(129)
        			Msg2Player("B�n h�c ���c ph�i ch�: Hi�u Chung")
        			AddRecipe(139)
        			Msg2Player("B�n h�c ���c ph�i ch�: Long Thi�t")
        			AddRecipe(140)
        			Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
        			AddRecipe(767)
        			Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        			AddRecipe(778)
        			Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
        			SetTask(1926, 50)
    			elseif nLevel>=50 and GetTask(1926)==50 then
        			AddRecipe(119)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th�t S�t Thi�n La")
        			AddRecipe(130)
        			Msg2Player("B�n h�c ���c ph�i ch�: L�c Kh�i")
        			AddRecipe(141)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ph� Qu�n")
        			AddRecipe(768)
        			Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
        			AddRecipe(779)
        			Msg2Player("B�n h�c ���c ph�i ch�: D��ng Qu�n")
        			SetTask(1926, 60)
    			elseif nLevel>=60 and GetTask(1926)==60 then
        			AddRecipe(120)
        			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ngo�i Phi Ti�n")
        			AddRecipe(131)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ti�u V�")
        			AddRecipe(142)
        			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C�")
        			AddRecipe(769)
        			Msg2Player("B�n h�c ���c ph�i ch�: Xi Nha")
        			AddRecipe(780)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ng�ng S��ng")
        			SetTask(1926, 70)
    			elseif nLevel>=70 and GetTask(1926)==70 then
    	  			AddRecipe(770)
        			Msg2Player("B�n h�c ���c ph�i ch�: Long Kh�u")
        			AddRecipe(781)
        			Msg2Player("B�n h�c ���c ph�i ch�: Ng� T�n")
        			SetTask(1926, 80)
      			else
       				TalkEx("",{WEAPON_NPC_DATA[nType][1]..": B�n tr�! ��ng n�ng v�i! B�n l�nh giang h� c�a ng��i c�n k�m, ch� ng��i luy�n th�m m�t th�i gian n�a h�y ��n t�m ta."})
				end
    		end
	end
	
	if (nType == 4) then
		local nLevel = GetLifeSkillLevel(1, 5)
		if (1 == GetTask(1935)) then
			if (nLevel >= 10 and GetTask(1926) == 10) then
				AddRecipe(167)
				Msg2Player("B�n h�c ���c ph�i ch�: L�c L�m trang")
				AddRecipe(168)
				Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng H� b� y")
				AddRecipe(149)
				Msg2Player("B�n h�c ���c ph�i ch�: Th�n H�nh ph�c")
				AddRecipe(150)
				Msg2Player("B�n h�c ���c ph�i ch�: Thanh S��ng b�o")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(169)
				Msg2Player("B�n h�c ���c ph�i ch�: Th�n Ng�u h� gi�p")
				AddRecipe(170)
				Msg2Player("B�n h�c ���c ph�i ch�: T� Thanh S��ng Hoa sam")
				AddRecipe(151)
				Msg2Player("B�n h�c ���c ph�i ch�: Tham Lam y")
				AddRecipe(152)
				Msg2Player("B�n h�c ���c ph�i ch�: X�ch ��ng tr�")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(171)
				Msg2Player("B�n h�c ���c ph�i ch�: C� Nhi�m kh�ch y")
				AddRecipe(172)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Nh�n b� trang")
				AddRecipe(153)
				Msg2Player("B�n h�c ���c ph�i ch�: Nhuy�n Kim y")
				AddRecipe(154)
				Msg2Player("B�n h�c ���c ph�i ch�: Th��ng Lan y")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(173)
				Msg2Player("B�n h�c ���c ph�i ch�: Th�n S�ch kim gi�p")
				AddRecipe(174)
				Msg2Player("B�n h�c ���c ph�i ch�: L�i Ng�n Gi�p")
				AddRecipe(155)
				Msg2Player("B�n h�c ���c ph�i ch�: Lam K�nh b� gi�p")
				AddRecipe(156)
				Msg2Player("B�n h�c ���c ph�i ch�: X�ch Long b�o")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(175)
				Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Huy�n kim gi�p")
				AddRecipe(176)
				Msg2Player("B�n h�c ���c ph�i ch�: H�a Th� Th�nh sam")
				AddRecipe(158)
				Msg2Player("B�n h�c ���c ph�i ch�: B�ng T�m Tr� sam")
				AddRecipe(157)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Lang y")
				SetTask(1926, 60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(177)
				Msg2Player("B�n h�c ���c ph�i ch�: Huy�t H� Qu� V��ng kh�i")
				AddRecipe(159)
				Msg2Player("B�n h�c ���c ph�i ch�: S�n Qu� Huy�t y")
				AddRecipe(178)
				Msg2Player("B�n h�c ���c ph�i ch�: Long B� � kim y")
				AddRecipe(160)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Gi�ng b�o")
				SetTask(1926, 70)
			else
				Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
			end
		else
			if nLevel>=10 and GetTask(1926)==10 then
				AddRecipe(185)
				Msg2Player("B�n h�c ���c ph�i ch�: Luy�n Gi�p th��ng")
				AddRecipe(186)
				Msg2Player("B�n h�c ���c ph�i ch�: C�n Hoa th��ng")
				AddRecipe(203)
				Msg2Player("B�n h�c ���c ph�i ch�: M�t V�n sam")
				AddRecipe(204)
				Msg2Player("B�n h�c ���c ph�i ch�: V� ��u th��ng")
				SetTask(1926,20)
			elseif nLevel>=20 and GetTask(1926)==20 then
				AddRecipe(187)
				Msg2Player("B�n h�c ���c ph�i ch�: C�m Anh th��ng")
				AddRecipe(188)
				Msg2Player("B�n h�c ���c ph�i ch�: N� Ki�t th��ng")
				AddRecipe(205)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n T�m gi�p y")
				AddRecipe(206)
				Msg2Player("B�n h�c ���c ph�i ch�: Kh�i La th��ng")
				SetTask(1926,30)
			elseif nLevel>=30 and GetTask(1926)==30 then
				AddRecipe(189)
				Msg2Player("B�n h�c ���c ph�i ch�: Thanh Linh th��ng")
				AddRecipe(190)
				Msg2Player("B�n h�c ���c ph�i ch�: H�ng Ngh� th��ng")
				AddRecipe(207)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C�ng ��u y")
				AddRecipe(208)
				Msg2Player("B�n h�c ���c ph�i ch�: Linh Lung th��ng")
				SetTask(1926,40)
			elseif nLevel>=40 and GetTask(1926)==40 then
				AddRecipe(191)
				Msg2Player("B�n h�c ���c ph�i ch�: L�n Quang gi�p y")
				AddRecipe(192)
				Msg2Player("B�n h�c ���c ph�i ch�: H� C� v� y")
				AddRecipe(209)
				Msg2Player("B�n h�c ���c ph�i ch�: Th� V��ng ��u y")
				AddRecipe(210)
				Msg2Player("B�n h�c ���c ph�i ch�: Th�i Hoa th��ng")
				SetTask(1926,50)
			elseif nLevel>=50 and GetTask(1926)==50 then
				AddRecipe(193)
				Msg2Player("B�n h�c ���c ph�i ch�: Minh Quang gi�p y")
				AddRecipe(194)
				Msg2Player("B�n h�c ���c ph�i ch�: Ngh� Th��ng v� y")
				AddRecipe(211)
				Msg2Player("B�n h�c ���c ph�i ch�: Ngh�ch V�n ��u y")
				AddRecipe(212)
				Msg2Player("B�n h�c ���c ph�i ch�: C�m V�n th��ng")
				SetTask(1926,60)
			elseif nLevel>=60 and GetTask(1926)==60 then
				AddRecipe(195)
				Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Y")
				AddRecipe(196)
				Msg2Player("B�n h�c ���c ph�i ch�: Phi Thi�n th�i th��ng")
				AddRecipe(213)
				Msg2Player("B�n h�c ���c ph�i ch�: V� Song ��u y")
				AddRecipe(214)
				Msg2Player("B�n h�c ���c ph�i ch�: Ng� Th�i ngh� th��ng")
				SetTask(1926,70)
			else
				Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
			end
		end
	end
		
	if nType == 5 then
		local nLevel = GetLifeSkillLevel(1, 6);
		if (nLevel >= 1) then
			if GetTask(1926)>=20 and HaveLearnRecipe(234)==0 then
		    	AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
         	elseif GetTask(1926)==30 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
          	elseif GetTask(1926)==40 and HaveLearnRecipe(234)==0 then
          		AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            	AddRecipe(240)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            	AddRecipe(246)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
          	elseif GetTask(1926)==50 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            	AddRecipe(240)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            	AddRecipe(246)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            	AddRecipe(236)
            	Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            	AddRecipe(241)
            	Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
          	elseif GetTask(1926)==60 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            	AddRecipe(240)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            	AddRecipe(246)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            	AddRecipe(236)
            	Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            	AddRecipe(241)
            	Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            	AddRecipe(237)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            	AddRecipe(247)
            	Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
         	elseif GetTask(1926)==70 and HaveLearnRecipe(234)==0 then
            	AddRecipe(234)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            	AddRecipe(240)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            	AddRecipe(246)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            	AddRecipe(236)
            	Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            	AddRecipe(241)
            	Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            	AddRecipe(237)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            	AddRecipe(247)
            	Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
            	AddRecipe(242)
            	Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
         	elseif GetTask(1926)==80 and HaveLearnRecipe(234)==0 then
	            AddRecipe(234)
    	        Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            	AddRecipe(239)
            	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            	AddRecipe(244)
            	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            	AddRecipe(235)
            	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            	AddRecipe(245)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            	AddRecipe(240)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            	AddRecipe(246)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            	AddRecipe(236)
            	Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            	AddRecipe(241)
            	Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            	AddRecipe(237)
            	Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            	AddRecipe(247)
            	Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
            	AddRecipe(242)
            	Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
            	AddRecipe(238)
            	Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
            	AddRecipe(243)
            	Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
            	AddRecipe(248)
            	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
            elseif (nLevel >= 1 and GetTask(1926) == 0) then
       			AddRecipe(3)
        		Msg2Player("B�n h�c ���c ph�i ch�: Kim S�ng t�n")
        		AddRecipe(8)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ti�u Ho�n ��n")
    	    	SetTask(1926, 10)  
    		elseif (nLevel >= 10 and GetTask(1926) == 10) then
        		AddRecipe(4)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ch� Huy�t t�n")
        		AddRecipe(13)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thanh T�m t�n")
        		AddRecipe(234)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
        		AddRecipe(239)
        		Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
		        AddRecipe(244)
        		Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(9)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ho�n D��ng ��n")
        		AddRecipe(14)
        		Msg2Player("B�n h�c ���c ph�i ch�: �ch Kh� t�n")
        		AddRecipe(235)
        		Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
        		AddRecipe(245)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(5)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�ch V�n t�n")
        		AddRecipe(240)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
        		AddRecipe(246)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
        		SetTask(1926,40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(10)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i Ho�n ��n")
        		AddRecipe(15)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng�c Linh t�n")
        		AddRecipe(236)
        		Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
        		AddRecipe(241)
        		Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
        		SetTask(1926,50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(6)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n H��ng C�m T�c")
        		AddRecipe(11)
        		Msg2Player("B�n h�c ���c ph�i ch�: Nh�t Nguy�n Ph�c Th�y ��n")
        		AddRecipe(237)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
        		AddRecipe(247)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
        		SetTask(1926,60)
    		elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(16)
        		Msg2Player("B�n h�c ���c ph�i ch�: Ng� Hoa Ng�c L� Ho�n")
        		AddRecipe(7)
        		Msg2Player("B�n h�c ���c ph�i ch�: H�c Ng�c �o�n T�c cao")
        		AddRecipe(12)
        		Msg2Player("B�n h�c ���c ph�i ch�: V�n V�t Quy Nguy�n ��n")
        		AddRecipe(242)
        		Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
        		SetTask(1926,70)
      		elseif nLevel>=70 and GetTask(1926)==70 then
	      		AddRecipe(17)
        		Msg2Player("B�n h�c ���c ph�i ch�: Sinh Sinh H�a T�n")
        		AddRecipe(238)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
        		AddRecipe(243)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
        		AddRecipe(248)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
        		SetTask(1926,80)
       		elseif GetTask(1926)==80 and HaveLearnRecipe(238)==0 then
         		AddRecipe(238)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
        		AddRecipe(243)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
        		AddRecipe(248)
        		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
    		else
        		Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
      		end
    	end	
	end
	
	if (nType == 6) then 
		local nLevel = GetLifeSkillLevel(1, 7);
		if (nLevel >= 1) then 
			if GetTask(1926)>=20 and HaveLearnRecipe(215)==0 then
				AddRecipe(215)
        		Msg2Player("B�n h�c ���c ph�i ch�: M�ng x�o")
			elseif (nLevel >= 1 and GetTask(1926) == 0) then
        		AddRecipe(18)
	    		Msg2Player("B�n h�c ���c ph�i ch�: C�m n�m")
	    		AddRecipe(25)
	    		Msg2Player("B�n h�c ���c ph�i ch�: Thi�u �ao t�")
	    		SetTask(1926, 10)
    		elseif nLevel>=10 and GetTask(1926)==10 then
        		AddRecipe(19)
        		Msg2Player("B�n h�c ���c ph�i ch�: M�n th�u")
        		AddRecipe(26)
        		Msg2Player("B�n h�c ���c ph�i ch�: N� Nhi h�ng")
        		AddRecipe(215)
        		Msg2Player("B�n h�c ���c ph�i ch�: M�ng x�o")
        		SetTask(1926, 20)
    		elseif nLevel>=20 and GetTask(1926)==20 then
        		AddRecipe(22)
        		Msg2Player("B�n h�c ���c ph�i ch�: T� Qu� ��u")
        		SetTask(1926, 30)
    		elseif nLevel>=30 and GetTask(1926)==30 then
        		AddRecipe(20)
        		Msg2Player("B�n h�c ���c ph��ng ph�p l�m B�nh x�p")
        		AddRecipe(27)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��o Hoa h��ng")
        		SetTask(1926, 40)
    		elseif nLevel>=40 and GetTask(1926)==40 then
        		AddRecipe(23)
        		Msg2Player("B�n h�c ���c ph�i ch�: ��u x�o")
        		SetTask(1926, 50)
    		elseif nLevel>=50 and GetTask(1926)==50 then
        		AddRecipe(21)
        		Msg2Player("B�n h�c ���c ph�i ch�: B�nh bao th�t")
        		AddRecipe(28)
        		Msg2Player("B�n h�c ���c ph�i ch�: T�y M�ng t�u")
        		SetTask(1926, 60)
        	elseif nLevel>=60 and GetTask(1926)==60 then
        		AddRecipe(24)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�i x�o t�i")
        		SetTask(1926, 70)
        	elseif nLevel>=70 and GetTask(1926)==70 then
    	  		AddRecipe(218)
        		Msg2Player("B�n h�c ���c ph�i ch�: C�m chi�n tr�ng")
        		SetTask(1926, 80)
        	else 
        		Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
    		end
    	end
	end
end;
	
--�պ���
function nothing()

end

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- ��������������ɫ
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- �����ص��ʶ��ɫ
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- �����Ա��ʶ
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- ���ڴ���һ��ѡ��ĶԻ����� Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end	


-- �Ӻ��������Ի�ȡ��ҵĳ�ν��ֱ�ӷ����ַ���
function GetPlayerSex()

local myTitel -- ������ʾ�����ν
local nFactionID = GetPlayerFaction();

	if (GetSex() == 1) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][1];
		else
			myTitel = "Thi�u hi�p";
		end;
	end;
	
	if (GetSex() == 2) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][2];
		else
			myTitel = "C� n��ng"
		end;
	end;
	
	return myTitel
	
end
