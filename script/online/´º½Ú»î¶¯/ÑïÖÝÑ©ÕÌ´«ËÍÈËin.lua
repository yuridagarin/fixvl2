--filename:����ѩ�̴�����in.lua
--create date:2006-01-12
--author:yanjun
--describe:����ѩ�̴����ˣ��������ű�

Include("\\script\\online\\���ڻ\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "Thi�u hi�p"
	elseif GetSex() == 2 then
		strSex = "C� n��ng"
	else
		strSex = "Thi�u hi�p/N� hi�p"
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060120 then
		Say("M�y h�m nay tuy�t ch�a r�i n�n khu n�m tuy�t ch�a th� m�, m�i"..strSex.."l�n sau quay l�i nh�!",0)
		return 0
	end
	if nDate > 20060205 then
		Say("Xu�n ��n hoa n�, tuy�t b�t ��u tan, e r�ng kh�ng th�c hi�n ���c k� ho�ch r�i."..strSex.."N�m t�i c�c v� nh� ��n ��y ch�i ti�p nh�!",0)
		return 0
	end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"H�y mau ��a ta ��n ��!/go",
					"T�m hi�u ho�t ��ng./know_detail",
					"Ta �� qua tu�i n�y r�i �!/nothing"
					}
		Say("V� "..strSex.."l� n�o kh�ng mu�n nh�n c� h�i ch�i ��a th�a th�ch m�t l�n hay sao?",3,selTab)
	else
		Say("M�y h�m nay tuy�t ch�a r�i n�n khu n�m tuy�t ch�a th� m�, m�i"..strSex.."l�n sau quay l�i nh�!",0)
	end
		
end

function go()
	if GetPlayerRoute() == 0 then
		Say("Xin l�i, ng��i ch�i �� gia nh�p m�n ph�i m�i c� th� tham gia ho�t ��ng N�m tuy�t �o�t b�o v�t.",0)
		return 0
	end
	--����ѩ�̵�ͼʱ�����뿪��ͼ������
	local id,idx = 0,0
	bCreateFailed = 0 
	for i=1,5 do	
		Tid = 1710 + i
		Tidx = 3100 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--�����뿪��ͼ������
				bCreateFailed = 1
			end
		end
	end
	if bCreateFailed == 1 then	--����������ʧ�ܾͲ�������
		Say("V�o b�n �� th�t b�i, xin h�y th� l�i!",0)
		WriteLog("[Ho�t ��ng m�a xu�n -K�t n�i th�t b�i]:"..GetName().."V�o b�n ��, k�t n�i m�y ch� th�t b�i (3101~3105).")
		return 0
	end

	local Entry = {
				{965,1665,3582},
				{965,1665,3497},
				{965,1665,3425},
				{965,1665,3360},
				{965,1664,3291},
				{965,1695,3228},
				{965,1730,3221},
				{965,1763,3224},
				{965,1795,3226},
				{965,1826,3226},
				{965,1854,3292},
				{965,1856,3365},
				{965,1856,3422},
				{965,1858,3498},
				{965,1856,3582}
				}
	local EntryNo = random(1,15)
	NewWorld(Entry[EntryNo][1],Entry[EntryNo][2],Entry[EntryNo][3])	--������
	if GetWorldPos() == 965 then
		for SkillID=843,851 do
		LearnSkill(SkillID)	--ѧ���ѩ�̼���
		end
		if GetTask(TASK_GOT_SNOWBALL) ~= GetCurDate() then
			SetTask(TASK_GOT_SNOWBALL,0)
		end
		if GetTask(TASK_GOT_SNOWBALL) == 0 then
			AddItem(2,3,216,20)
			AddItem(2,3,219,20)
			SetTask(TASK_GOT_SNOWBALL,GetCurDate())
			Msg2Player("B�n nh�n ���c 20 ��n Ti�u Tuy�t C�u v� 20 Ti�u Tuy�t C�u")
		end
		local BornPoint = {
						{1859,3230},
						{1664,3654},
						{1664,3229},
						{1854,3654}
						}
		SetDeathPunish(0)
		SetFightState(1)
		EntryNo = random(1,4)
		SetTempRevPos(965,BornPoint[EntryNo][1]*32,BornPoint[EntryNo][2]*32)	--���������
		SetDeathScript("\\script\\online\\���ڻ\\playerdeath.lua")
		SetPKFlag(2,1)
		UseScrollEnable(0)
		Msg2Player("Hoan ngh�nh c�c b�n v�o khu n�m tuy�t �o�t b�o.")
	end
end

function know_detail()
	Talk(6,"","V�o khu n�m tuy�t ng��i s� c� m�t s� k� n�ng trong � k� n�ng b�n ph�i (kh�ng ph�i b�ng k� n�ng F5)","K� n�ng kh�c nhau s� ti�u hao Tuy�t C�u kh�c nhau. M�i ng�y v�o khu n�m tuy�t s� ���c ph�t 20 ��n Ti�u Tuy�t C�u v� 20 Ti�u Tuy�t C�u mi�n ph�, c�ng c� th� mua t�i ti�m t�p h�a ho�c Tuy�t Gi�.","5 th�nh th� m�i th�nh ��u c� 1 Tuy�t Gi�, t��ng �ng v�i 5 khu n�m tuy�t kh�c nhau.","Khu n�m tuy�t c� r�t nhi�u b�o r��ng ch�a nhi�u �� qu� ch� ng��i ��n m�.","M�i ng�y 12h, 18h, 21h t�i 5 khu n�m tuy�t s� ph�t 100 ph�n qu� n�m m�i. M�i ng��i h�y nhanh ch�n ��n l�y!","Ch� �: Trong khu v�c n�m tuy�t kh�ng th� s� d�ng H�i Th�nh ph� hay M�t H�m c�a s� ph�.")
end

function nothing()

end
