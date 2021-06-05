--���ĺ��ǵ�NPC
--by vivi
--09/26/2007

Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

tDiaTab = {
	[1] = {100,"Kinh nghi�m d�i d�o, Thi�n th�ch ch�t ��y r��ng.","Kh�ng c� g� �m �p h�n t�nh b�ng h�u, huynh mu�i trong bang ph�i khi�n b�n ph�i tr�n tr�ng. ","Khi b�n b� t�n th��ng th� huynh t� mu�i l� ng��i an �i b�n, khi b�n vui �� l� ng��i c�ng chia s� ni�m vui v�i b�n.","Ch�c c�c huynh t� mu�i trong bang ph�i lu�n vui v�, b�nh an.","Ch�c c�c huynh t� mu�i trong bang ph�i lu�n kh�e m�nh, t�n t�i t�n l�c.","Bang h�i l� m�i nh� �m �p, mau ��n ��y c�ng g�p s�c x�y d�ng."},
	[2] = {100,"Ch�c huynh �� vui v�! V�n �i�u may m�n!","Ch�c h�o huynh �� t�n t�i t�n l�c; t�nh c�m nh� �; v�n v�n hanh th�ng.","Ta ch�c ng��i m�nh kh�e, ti�n v� nh� n��c.","Ta ch�c ng��i g�p nhi�u �i�u t�t, ti�n v� ��y t�i, phi�n n�o tr�i nhanh! H�y nh�n l�i ch�c th�t l�ng c�a ta.","N�u c� ti�n l� sai l�m, ch�c ng��i t� sai l�m n�y ti�p sai l�m kh�c."},
	[3] = {100,"Tho�i m�i trong 1 gi�y, vui v� trong 1 ng�y, h�nh ph�c trong 1 n�m, m�nh kh�e m�i m�i!","Ng��i ph��ng xa c� kh�e m�nh kh�ng? Trong t� t��ng, m�i kh�ng thay ��i l� t�nh y�u c�a ta d�nh cho ng��i! Th�t l�ng mu�n ng��i vui v� m�i ng�y!","H�o h�u, ch�c ng��i nh� � c�t t��ng, ng�y c�ng xinh ��p!","Ch�c ng��i lu�n vui v�, gi�c m� tr� th�nh s� th�t----v�n s� nh� �!","Th�t l�ng ch�c ng��i vui v�, v�n s� vi�n m�n, lu�n n� n� c��i."},
	[4] = {200,"Ch�c ng��i lu�n vui v�, ��c bi�t trong ng�y h�m nay, ch�c sinh nh�t vui v�!","T�ng ng��i ly n��c �p tinh ch�, trong �� c� 100cc l� v�n s� th�nh c�ng, 200cc l� ng�y ng�y vui v�, 300cc l� s�c s�ng d�i d�o, ch�c sinh nh�t vui v�.","V� s� c� m�t c�a ng��i, ng�y h�m nay tr� th�nh ng�y t��i ��p, th� gi�i n�y c� th�m nhi�u m�u s�c. Ch�c sinh nh�t vui v�!","Ch�c sinh nh�t vui v�!","T� tr��c gi� ta mu�n n�i v�i ng��i, nh�ng kh� n�i kh�ng c� c� h�i, h�m nay ta l�y h�t can ��m �� n�i...Sinh nh�t vui v�!","Ch�c ng��i h�m nay ng�ng l�n nh�n th�y th�n Cupid, ra c�a g�p ��i m� nh�n, c�i xu�ng nh�t ���c ti�n, v� nh� ��p ph�n ch�! Ha ha!","Ch�c ng��i: Ph�c nh� ��ng H�i, Th� t� Nam S�n.","H�m nay l� sinh nh�t c�a ng��i, t� ph��ng xa ta ch�c ng��i sinh nh�t vui v�!"},
	[5] = {400,"M�i ng�y t�ng ng��i 999 ��a h�ng, m�i ng�y g�i ng��i 999 l� th�, c� 999 ki�p sau ta c�ng mu�n � b�n ng��i, v� n�i 999 c�u ta y�u ng��i, ta kh�ng ngh� r�ng tr�i tim ng��i kh�ng rung ��ng.","B�t k� tr�i m�a hay tr�i n�ng, c� th� nh�n th�y m�t ng�y th� h�m �� tr�i r�t m�t m�; b�t k� h�m qua, h�m nay hay ng�y mai, c� th� c�ng � b�n nhau m�t ng�y th� h�m �� l� m�t ng�y tuy�t v�i.","Hoa h�ng l� t�nh y�u c�a ta, k�o l� h��ng v� c�a ta, sao l� m�t c�a ta, �nh tr�ng l� linh h�n c�a ta, ��u t�ng cho ng��i----b�u v�t trong l�ng ta.","G�p ���c ng��i l� m�t h��ng th�, ngh� v� ng��i c� m�t c�m nh�n, m� th�y ng��i l� m�t h�nh ph�c, s�ng tr�n ��i b�n ng��i l� m�t h�nh ph�c l�n lao.","Ch�c c�ng ch�c l� v� s� l�i ch�c, ch�c tr� ch�c l� kh�i ��u c�a ch�c, ch�c nh�n ch�c l� v� h�n l�i ch�c ��p ��, ch�c chia ch�c l� l�i ch�c s�u n�ng, kh�ng c� m�n qu� n�o qu� h�n nh�ng l�i ch�c! "},
	[6] = {300,{"Trung thu ��n r�i, ch�c ng��i t�m t�nh tho�i m�i! M�t t��i nh� hoa! Nguy�n v�ng nh� �, Trung thu vui v�!","Nguy�t L��ng Th� n�i, v�o t�i 15 th�ng 8 c� ta s� cho �nh tr�ng ��p, g�i ch�c ph�c c�a ng��i ��n c� �y, vi�t v�o tim c�a c� �y.","Gi� m�t mang ch�c ph�c c�a ta, tr�ng thanh mang ch�o h�i c�a ta, t�ng ng��i m�t l�n gi� m�t, m�t �nh tr�ng thanh, phong nguy�t v� bi�n, nh�n gian h�u t�nh, Trung thu vui v�!","Trung thu ��n r�i, t�ng ng��i b�nh. L�p th� nh�t: quan t�m! L�p th� hai: ch�m s�c! L�p th� ba: l�ng m�n! L�p th� t�: �m �p! L�p gi�a: ng�t ng�o! Ch�c ng��i ng�y ng�y vui v�!","Nghe~Ngh� ��n~Mong, N�i ���c~L�m ���c~Nh�n ���c, Th�i gian ��n~m�i l�i ch�c ph�c ta d�nh cho ng��i, Trung thu vui v�!","��m tr�ng s�ng, d��i �nh tr�ng, ta nguy�n 3 �i�u: �i�u th� nh�t m�ng ��p nh� tr�ng, �i�u th� hai ng�y ng�y ng�t ng�o h�n b�nh trung thu, �i�u th� ba khu�n m�t ��p nh� ti�n trong tr�ng.","Tr�ng thanh gi� m�t g�i t�m t�! �� �nh tr�ng mang l�i ch�c c�a ta g�i ��n ng��i; �� n�i nh� h�a th�nh l�n gi�, h�n nh� l�n m�t ng��i!"},{"S�ng l� Qu�c Kh�nh khi ng��i v�o game, c� th� nh�n th�y c�u ch�c c�a ta d�nh cho ng��i, hy v�ng ��a hoa h�ng trong l�ng �� mang l�i may m�n v� h�nh ph�c cho ng��i! Qu�c Kh�nh vui v�!","Ng��i l� socola c�a ta, nh�n th�y v� ��p c�a ng��i, ta r�t nh� ng��i, Qu�c Kh�nh vui v�, hy v�ng ���c l�m quen v�i ng��i!","V�o ng�y l� Qu�c Kh�nh ta ch�c ng��i t�i l�c d�i d�o, m�p nh� heo, m�nh kh�e, t�nh c�m ng�t ng�o, g�p nhi�u may m�n, s� nghi�p hanh th�ng, c�ng ng�y c�ng ph�t tri�n.","Trong ng�y l� Qu�c Kh�nh ta c�u h�n v�i ng��i, ng��i ��ng � kh�ng? Ta mu�n ng��i tr� th�nh ng��i h�nh ph�c th� hai tr�n to�n th� gi�i! T�i sao l�i l� th� hai? V� k�t h�n v�i ng��i, ta tr� th�nh ng��i h�nh ph�c nh�t tr�n th� gi�i!","Ch�c 7 ng�y trong l� Qu�c Kh�nh, 168 gi� vui v�, 10080 ph�t h�nh ph�c, 604800 gi�y ng�t ng�o!","Ch�c l� Qu�c Kh�nh tr�n ng�p ni�m vui, ��m n�m m�ng ng�t ng�o! Gi�c m� th�nh s� th�t, h�nh ph�c ng�p tr�n!"},
				{"�nh s�ng ��m Gi�ng Sinh chi�u tr�n n�n v�i tr�ng, ph� l�n ng��i t�m t�nh c�a ta, Gi�ng Sinh vui v�!","Tuy�t r�i, ti�ng tu�n l�c phi, ��m b�nh an ng�t ng�o �� t�i, Gi�ng Sinh vui v�!","Trong ��m t�i ��p �� n�y, ch�c ��m Gi�ng Sinh tr�n ng�p ti�ng c��i v� kh�ng kh� t�ng b�ng lu�n � b�n ng��i.","Gi� mang ti�ng chu�ng c�a ng��i say, mang h�nh ph�c �m �p ��n thi�n ���ng c�a ng��i, Gi�ng Sinh vui v�!","Trong th�i kh�c n�y ta c� m�t t�m t�, nh� m�y mang l�i ch�c c�a ta �i, Gi�ng Sinh vui v�!"},{"Mong r�ng hoa tuy�t s� mang l�i ch�c c�a ta ��n b�n ng��i, ch�c ng��i n�m m�i nh� �!!","N�m m�i ph�t t�i, v�n s� nh� �.","N�m m�i vui v�, t�n t�i t�n l�c, c� nh� �o�n vi�n.","Nh� m�y mang l�i ch�c c�a ta v�o gi�c m�ng c�a ng��i, ch�c ng��i n�m m�i h�nh ph�c!","Ch�c l� m�t t�m nguy�n, ch� kh�ng ph�i l�i ph�n bua. Ch�c ng��i n�m m�i vui v�!","Th�t l�ng ch�c ng��i n�m m�i vui v�.!"}}
	}

tDiaTab2 = {
 [1] = {"Ti�n v� nh� n��c","T�nh c�m �m �p","Huynh �� t� mu�i","Ch�c tr��ng c�u","Ch�c xinh ��p","M�i nh� bang h�i"},
 [2] = {"Ch�c vui v�","T�i l�c b�n m�a","M�i m�i c�a b�n","10 t�m 10 �","Ti�n v� nh� n��c"},
 [3] = {"Vui v� h�nh ph�c","T� t��ng xa r�ng","Duy�n ph�n tr��ng c�u","M�ng ��p th�nh s� th�t","Ch�c lu�n n� n� c��i"},
 [4] = {"M�t ng�y ��c bi�t","N��c �p sinh nh�t","V� ��p tr�i cho","Heo! Vui v� nh�","Ch�c c� ��ng","Ch�c may m�n","Ch�c h�i h��c","Ch�c d�i"},
 [5] = {"Tr��ng c�u","M�i 1 ng�y","B�o v�t trong tay","��p m�i b�n nhau","H�ng v�n l�i ch�c"},
 [6] = {{"Hoa t��i �ua n�","Th� v� �nh tr�ng","Phong nguy�t v� bi�n","B�nh ch�c ph�c","C��i ng�t ng�o","T�m nguy�n d��i tr�ng","Gi� m�t qua m�t"},{"Ng�n ng� hoa h�ng","Socola ��u","Ch�c ph�c v� bi�n","C�u h�n h�nh ph�c","Th�i kh�c","M�ng ��p th�nh s� th�t"},{"T�m t�nh vui v�","Ng�t ng�o b�nh an","Ti�ng c��i r�n r�ng","Ch�c �m �p","N�i nh� ng�p tr�n"},{"N�m m�i nh� �","V�n s� nh� �","V�n l�i ch�c","Vui v� h�nh ph�c","Ng�n l�i mu�n n�i","Ch�n th�nh ch�c ph�c"}}
 }

function main()
	local strtab = {"Ta mu�n g�i Ch�c ph�c bang h�i [T�n �i�m thi "..tDiaTab[1][1].." �i�m]/#fasong_zhufu(1)",
		"Ta mu�n g�i Ch�c ph�c huynh �� [T�n �i�m thi "..tDiaTab[2][1].." �i�m]/#fasong_zhufu(2)",
		"Ta mu�n g�i Ch�c ph�c b�ng h�u [T�n �i�m thi "..tDiaTab[3][1].." �i�m]/#fasong_zhufu(3)",
		"Ta mu�n g�i Ch�c m�ng sinh nh�t [T�n �i�m thi "..tDiaTab[4][1].." �i�m]/#fasong_zhufu(4)",
		"Ta mu�n g�i Ch�c ph�c ng��i y�u [T�n �i�m thi "..tDiaTab[5][1].." �i�m]/#fasong_zhufu(5)",
		"Ta mu�n g�i Ch�c m�ng l� h�i [T�n �i�m thi "..tDiaTab[6][1].." �i�m]/#fasong_zhufu(6)",
		"Ta mu�n ��i 2 ph�n Sao c�u nguy�n [T�n �i�m thi 200 �i�m]/change_star",
		"Ta mu�n xem th�nh t�ch thi/abluemoon_jifen",
		"Ta mu�n v� th�nh T��ng D��ng/back_xiangyang",
		"Kh�ng sao, ta s� ng�m c�nh/nothing"
		}
	Say("<color=green>Th� Ti�u Nha<color>: Ng��i mu�n g�i l�i ch�c lo�i n�o? Ch� �, ph�i l� ��i tr��ng m�i c� th� g�i l�i ch�c.",
		getn(strtab),
		strtab)
end

function fasong_zhufu(nType)
	if GetTeamSize() ~= 2 then
		Talk(1,"","<color=green>Th� Ti�u Nha<color>: C�n <color=yellow>2 ng��i<color> t� ��i m�i c� th� g�i l�i ch�c.");
		return
	end		
	if GetName() ~= GetCaptainName() then
		Talk(1,"","<color=green>Th� Ti�u Nha<color>: Ch� c� ��i tr��ng m�i c� th� g�i l�i ch�c!");
		return
	end
	if GetTask(ABLUEMOON_JIFEN) < tDiaTab[nType][1] then
		Talk(1,"","<color=green>Th� Ti�u Nha<color>: Kh�ng �� �i�m t�ch l�y!");
		return
	end
	if nType == 1 then --�����ж�
		local nOldPlayerIdx = PlayerIndex;  --����ӳ�������
		if GetTeamMember(0) == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);   --���ѵ�����
			if IsTongMember() == 0 then
				PlayerIndex = nOldPlayerIdx;
				Talk(1,"","<color=green>Th� Ti�u Nha<color>: ��ng ��i ch�a v�o bang.");
				return
			end
		elseif GetTeamMember(0) == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
			if IsTongMember() == 0 then
				PlayerIndex = nOldPlayerIdx;
				Talk(1,"","<color=green>Th� Ti�u Nha<color>: ��ng ��i ch�a v�o bang.");
				return
			end
		end
		PlayerIndex = nOldPlayerIdx;
	end			
	local strtab = {};
	if nType ~= 6 then
		for i=1,getn(tDiaTab2[nType]) do
			tinsert(strtab,tDiaTab2[nType][i].."/#fasong_detail("..nType..","..i..")");
		end
		tinsert(strtab,"Ta ch�n nh�m r�i./main")
		Say("<color=green>Th� Ti�u Nha<color>: Xin ch�n l�i ch�c mu�n g�i",
			getn(strtab),
			strtab)
	else
		Say("<color=green>Th� Ti�u Nha<color>: Mu�n g�i l�i ch�c l� h�i n�o?",
			5,
			"Trung thu/#choose_jieri(1)",
			"Qu�c kh�nh/#choose_jieri(2)",
			"Gi�ng sinh/#choose_jieri(3)",
			"N�m m�i/#choose_jieri(4)",
			"Ta ch�n nh�m r�i./main")
	end
end

function fasong_detail(nIndex,nType,nSix)
	if nIndex ~= 6 then
		Say("<color=green>Th� Ti�u Nha<color>: Ng��i ch�n g�i ["..tDiaTab2[nIndex][nType].."]��<color=red>"..tDiaTab[nIndex][nType+1].."<color> ��ng � kh�ng?",
			2,
			"��ng, ta mu�n g�i/#confirm_fasong("..nIndex..","..nType..")",
			"Ta mu�n ch�n l�i/#fasong_zhufu("..nIndex..")")
	else
		Say("<color=green>Th� Ti�u Nha<color>: Ng��i ch�n g�i ["..tDiaTab2[nIndex][nType][nSix].."]��<color=red>"..tDiaTab[nIndex][nType+1][nSix].."<color> ��ng � kh�ng?",
			2,
			"��ng, ta mu�n g�i/#confirm_fasong("..nIndex..","..nType..","..nSix..")",
			"Ta mu�n ch�n l�i/#fasong_zhufu("..nIndex..")")
	end		
end	

function confirm_fasong(nIndex,nType,nSix)
	local nJifen = tDiaTab[nIndex][1];
	local nOldPlayerIdx = PlayerIndex;
	local nOneName = "";
	local nTwoName = "";
	if GetTeamMember(0) == GetTeamMember(1) then
		nOneName = GetName(GetTeamMember(1));
		nTwoName = GetName(GetTeamMember(2));
		if nIndex == 1 then
			PlayerIndex = GetTeamMember(2);
			nTwoName = "[Bang h�i]"..GetTongName();
		end
		PlayerIndex = nOldPlayerIdx;
	elseif GetTeamMember(0) == GetTeamMember(2) then
		nOneName = GetName(GetTeamMember(2));
		nTwoName = GetName(GetTeamMember(1));
		if nIndex == 1 then
			PlayerIndex = GetTeamMember(1);
			nTwoName = "[Bang h�i]"..GetTongName();
		end
		PlayerIndex = nOldPlayerIdx;
	end		
	jifen_reduce(nJifen)
	Talk(1,"","<color=green>Th� Ti�u Nha<color>: L�i ch�c c�a ng��i �� g�i. N�u c� nhi�u ng��i c�ng g�i, xin ch� ��i.")
	if nIndex ~= 6 then
		Msg2Global(nOneName.."as-"..nTwoName.."N�i: "..tDiaTab[nIndex][nType+1]);
		AddGlobalNews("<color=red>"..nOneName.."<color> n�i v�i <color=red>"..nTwoName.."<color>:"..tDiaTab[nIndex][nType+1]);
	else
		Msg2Global(nOneName.."as-"..nTwoName.."N�i: "..tDiaTab[nIndex][nType+1][nSix]);
		AddGlobalNews("<color=red>"..nOneName.."<color> n�i v�i <color=red>"..nTwoName.."<color>:"..tDiaTab[nIndex][nType+1][nSix]);			
	end
end

function choose_jieri(nType)
	local strtab = {};
	for i=1,getn(tDiaTab2[6][nType]) do
		tinsert(strtab,tDiaTab2[6][nType][i].."/#fasong_detail(6,"..nType..","..i..")");
	end
	tinsert(strtab,"Ta ch�n nh�m r�i./main")
	Say("<color=green>Th� Ti�u Nha<color>: Xin ch�n l�i ch�c mu�n g�i",
		getn(strtab),
		strtab)	
end

--========================================================���ػ���===========================================================
function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say("<color=green>Th� Ti�u Nha<color>: �i�m t�ch l�y c�a ng��i hi�n l�: <color=yellow>"..jifen.."<color> �i�m.",0)
	for i = 1,getn(tTitle) do --ɾ��ԭ�еĳƺ�
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("B�n nh�n ���c danh hi�u"..tTitle[nTitleLevel][3].."{X�ng hi�u}");
	end;
end

function change_star()
	Say("<color=green>Th� Ti�u Nha<color>: Ng��i s� t�n <color=yellow>200<color> �i�m t�ch l�y, Nh�n ���c 2 Sao c�u nguy�n, ��ng � kh�ng?",
		2,
		"��ng �/confirm_change_star",
		"Kh�ng, ta nh�m!/nothing")
end

function confirm_change_star()
	if GetTask(ABLUEMOON_JIFEN) < 200 then
		Talk(1,"","<color=green>Th� Ti�u Nha<color>: Kh�ng �� �i�m t�ch l�y!")
		return
	end
	jifen_reduce(200)
	AddItem(2,1,1171,2,1);
	Msg2Player("Ch�c m�ng b�n nh�n ���c 2 Sao c�u nguy�n!"); 
end

function back_xiangyang()
	Say("<color=green>Th� Ti�u Nha<color>: Ng��i mu�n v� ch�a?",
		2,
		"��ng �/confirm_back",
		"Kh�ng, ta nh�m!/nothing")
end

function confirm_back()
	 CleanInteractive();
   NewWorld(350,1454,2981);
end

function nothing()

end
--���ٿƿ�����ͳһ����
function jifen_reduce(reduce_num)
	SetTask(TaskID_get_elixer_times,(GetTask(TaskID_get_elixer_times) - floor(reduce_num/50)))
	SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN) - reduce_num)
end