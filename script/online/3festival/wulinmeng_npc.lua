--��������ʹ�ű�
--by vivi
--09/06/2007
--edit by 2008/08/29

Include("\\script\\online\\3festival\\3festival_head.lua")
	 
function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080911 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ho�t ��ng ch�a b�t ��u.");
		return
	end
	if nDate > 20081012 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ho�t ��ng �� k�t th�c. Ch�c c�c ��i hi�p vui v�!")
		return		
	end
	local strtab = {
		"Ta mu�n nh�n ph�n th��ng Qu�c Kh�nh h�m nay /get_today_award",
		"Ta mu�n nh�n ph�n th��ng Qu�c Kh�nh/get_yestoday_award",
		"Ch�o m�ng l� Qu�c Kh�nh, ph�n th��ng nh�n ��i kinh nghi�m/about_shuangbei",
		"Ph�n th��ng Qu�c Kh�nh c� g�?/what_award",
		"Ph�n th��ng c�c lo�i b�o h�p/how_about_box",
		"Ta ch� ��n xem th�/nothing"
		}
	Say("<color=green>��c s� V� L�m<color>: �� c�m �n c�c ��i hi�p �� c�ng hi�n cho v� l�m, trong ng�y l� Qu�c Kh�nh n�y c� m�t s� ph�n th��ng, c�c ��i hi�p d�ng b��c gh� xem. Ngo�i ra, ta c�ng r�t th�ch �n b�nh, trung thu c�ng �� ��n r�i, n�u ng��i c� th� mang ��n cho ta lo�i b�nh m� ta th�ch, ta s� �a t� ng��i b�ng b�o h�p.",
		getn(strtab),
		strtab)	
end

function get_today_award()		
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20081007 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ho�t ��ng ph�t qu� ng�y l� Qu�c Kh�nh �� k�t th�c, n�u trong th�i gian di�n ra, kh�ng nh�n �� ph�n th��ng, c� th� nh�n b� th�ng qua <color=yellow>Danh s�ch V� L�m<color>.");
		return
	end
	if GetLevel() < 30 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: ��ng c�p c�a ng��i qu� th�p, �i h�nh t�u giang h� luy�n ��n c�p <color=yellow>30<color> r�i ��n nh�n.");
		return
	end
	Say("<color=green>��c s� V� L�m<color>: Tr��c khi nh�n th��ng Qu�c Kh�nh ph�i xem <color=yellow>Thuy�t minh nh�n th��ng<color>, ��n <color=yellow>Th� Ti�u Nha<color> Th� ��i s� �o�n s� kh� hay, n�u <color=yellow>may m�n<color>, s� nh�n ���c nhi�u ph�n th��ng, kh�ng xem c�ng kh�ng sao, ph�n th��ng c�ng v�y!",
		3,
		"Ta mu�n nh�n ph�n th��ng Qu�c Kh�nh h�m nay /confirm_get_award",
		"Thuy�t minh nh�n ph�n th��ng Qu�c Kh�nh /about_this_festival",
		"Ta s� ��i nh�n ��t sau, gi� mu�n xem l�i thuy�t minh/nothing")
end                                                                                                                                                                                                                

function confirm_get_award()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_WULIN_IS_AWARD) >= nDate then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ng��i �� nh�n ph�n th��ng h�m nay r�i, mai ��n xem nh�.");
		return			
	end
	if Zgc_pub_goods_add_chk(10,50) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	local nTaskLuck = GetTask(ABLUEMOON_LUCK);
	local nLucky = 2;--δ�����Ĭ��һ��
	local nDay = tonumber(date("%y%m%d"));
	if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --�������� ���赱ǰ����
		nLucky = nTaskLuck;  
	end	
	Talk(1,"","<color=green>��c s� V� L�m<color>: ��y l� ph�n th��ng ng�y h�m nay c�a ng��i!");
	if nLucky == 1 then --���� ��ӦtWuLinAward���е�[1]
		award_detail(1);
		SetTask(TASK_WULIN_IS_AWARD,nDate);	
	elseif nLucky == 7 then --��
		award_detail(3);
		SetTask(TASK_WULIN_IS_AWARD,nDate);
		Msg2Player("H�m nay b�n th�t may m�n, nh�n ���c r�t nhi�u ph�n th��ng!");
	else
		award_detail(2);
		SetTask(TASK_WULIN_IS_AWARD,nDate);
	end	
end

function get_yestoday_award()
	if GetLevel() < 30 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: ��ng c�p c�a ng��i qu� th�p, �i h�nh t�u giang h� luy�n ��n c�p <color=yellow>30<color> r�i ��n nh�n.");
		return
	end
	local nDate = floor((GetTime()+28800)/86400);
	local nTime = tonumber(date("%Y%m%d"));
	if nTime > 20081008 then
		nDate = floor((MkTime(2008,10,8)+28800)/86400);
	end	
	local nStartDate = floor((MkTime(2008,9,11)+28800)/86400);
	local nDay = nDate-nStartDate;
	local nNum = nDay - GetTask(TASK_WULIN_AWARD_NUM);
	if nNum <= 0 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ph�n th��ng Qu�c Kh�nh ng��i �� nh�n �� c� r�i");
		return
	else
		Say("<color=green>��c s� V� L�m<color>: L�n ho�t ��ng n�y ng��i �� nh�n r�i<color=yellow>"..GetTask(TASK_WULIN_AWARD_NUM).."<color> l�n ph�n th��ng Qu�c Kh�nh, b�n c�n <color=yellow>"..nNum.."<color> l�n kh�ng nh�n ph�n th��ng Qu�c Kh�nh, nh�n b� <color=yellow>1 l�n<color> ph�i c� <color=yellow> 1 quy�n V� l�m minh<color>, b�n x�c nh�n kh�ng? ",
			2,
			"Ta mu�n nh�n/confirm_get_yestoday_award",
			"T�m th�i kh�ng d�ng/nothing")
	end;
end

function confirm_get_yestoday_award()
	if GetItemCount(2,0,1023) < 1 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ng��i kh�ng c� <color=yellow>Danh s�ch V� L�m<color> �, ng��i kh�ng l�a ta ch�.");
		return
	end
	if Zgc_pub_goods_add_chk(10,50) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	if DelItem(2,0,1023,1) == 1 then
		award_detail(3);
	end		
end

function award_detail(nIndex)
	local nDate = tonumber(date("%Y%m%d"));
	local nlevel = GetLevel();
	local nExpArg = (GetLevel()^3)/(80^3)*10000; --����ϵ��		
	if nlevel ~= 99 then
		ModifyExp(floor(tWuLinAward[nIndex][1]*nExpArg));
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..floor(tWuLinAward[nIndex][1]*nExpArg).." �i�m kinh nghi�m!");
	else
		if nIndex == 3 then
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],40);
			Msg2Player("B�n nh�n ���c 40 cu�n "..tItemInfo[27][1]);
		elseif nIndex == 2 then
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],30);
			Msg2Player("B�n nh�n ���c 30 quy�n "..tItemInfo[27][1]);		
		else
			AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],20);
			Msg2Player("B�n nh�n ���c 20 cu�n"..tItemInfo[27][1]);		
		end
	end
	
	AddItem(tWuLinAward[nIndex][2][2],tWuLinAward[nIndex][2][3],tWuLinAward[nIndex][2][4],tWuLinAward[nIndex][2][5]);
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..tWuLinAward[nIndex][2][1]..tWuLinAward[nIndex][2][5].."!");
	local nRanOne = random(tWuLinAward[nIndex][3][5],tWuLinAward[nIndex][3][6]);
	AddItem(tWuLinAward[nIndex][3][2],tWuLinAward[nIndex][3][3],tWuLinAward[nIndex][3][4],nRanOne);
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..tWuLinAward[nIndex][3][1]..nRanOne.."!");

	local nRanTwo = random(1,10000);
	local nRanTotal = 0; --4-9�и��ʵĵ���
	for i = 4,9 do
		nRanTotal = nRanTotal + tWuLinAward[nIndex][i][6];
		if nRanTwo <= nRanTotal then
			AddItem(tWuLinAward[nIndex][i][2],tWuLinAward[nIndex][i][3],tWuLinAward[nIndex][i][4],tWuLinAward[nIndex][i][5],1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
			if i >= 7 then
				Msg2Global("��i hi�p"..GetName().."Nh�n ph�n th��ng k� ni�m"..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
				WriteLog("[08 Tam ti�t li�n th�ng]: Ng��i ch�i"..GetName().."Nh�n ph�n th��ng k� ni�m"..tWuLinAward[nIndex][i][1]..tWuLinAward[nIndex][i][5].."!");
			end
			break
		end
	end
	SetTask(TASK_WULIN_AWARD_NUM,GetTask(TASK_WULIN_AWARD_NUM)+1);		
end
                                                                                                                                                                                                                    
function what_award()
  Talk(1,"what_award2","<color=green>��c s� V� L�m<color>: Trong ng�y l� n�y, ch� c�n ng��i ��n ch� ta nh�n ph�n th��ng, th�\n<color=red>nh�n ���c<color>\n<color=yellow> kinh nghi�m            D�a v�o ��ng c�p kh�c nhau m� thay ��i (c�p 99 nh�n ���c Thi�n th�i ch� gi�i)\nH�p Ng�c B�i Huy Ho�ng   d�ng Ch�a Kh�a Ng�c Huy Ho�ng m� nh�n ���c ph�n th��ng\nCh�a Kh�a Ng�c Huy Ho�ng     d�ng �� m� H�p Ng�c B�i Huy Ho�ng<color>") 
end

function what_award2()
	Talk(1,"what_award3","<color=green>��c s� V� L�m<color>:<color=red> nh�n ���c <color>\n<color=yellow> H�p ��ng B�i Huy Ho�ng     d�ng Ch�a Kh�a ��ng Huy Ho�ng m� nh�n ���c ph�n th��ng\nH�p Ng�n B�i Vinh D�     d�ng Ch�a Kh�a B�c Vinh D� m� nh�n ���c ph�n th��ng\nH�p Kim B�i Vinh D�     d�ng Ch�a Kh�a V�ng Vinh D� m� nh�n ���c ph�n th��ng\nCh�a Kh�a ��ng Huy Ho�ng       d�ng �� m� H�p ��ng B�i Huy Ho�ng\nCh�a Kh�a B�c Vinh D�       d�ng �� m� H�p Ng�n B�i Vinh D�\nCh�a Kh�a V�ng Vinh D�       d�ng �� m� H�p Kim B�i Vinh D�<color>")
end

function what_award3()
	Talk(1,"main","<color=green>��c s� V� L�m<color>: N�u h�m nay ng��i ��n ch� <color=yellow>Th� Ti�u Nha<color> �o�n s� g�p <color=yellow>may m�n<color>, c� th� t�ng s� l��ng v�t ph�m nh�n ���c.")
end	 
   
function how_about_box()
  local strtab = {
  	"H�p Ng�c B�i Huy Ho�ng ��ng g�/#box_thing(1)",
  	"H�p ��ng B�i Huy Ho�ng ��ng g�/#box_thing(2)",
  	"H�p Ng�n B�i Huy Ho�ng ��ng g�/#box_thing(3)",
  	"H�p Kim B�i Huy Ho�ng ��ng g�/#box_thing(4)",
  	"C��ng h�a trang s�c Ho�ng �� Hi�n Vi�n v� Hi�n Vi�n ��u /duihuan",  	
  	"Ta ch� ��n xem th�/nothing"
  	}
  Say("<color=green>��c s� V� L�m<color>: V� L�m Minh Ch� ta kh�ng ph�i l� ng��i keo ki�t, l� n�y �� chu�n b� r�t nhi�u b�o h�p, ch� c�n ng��i may m�n, l� c� th� nh�n ���c b�o h�p v� ch�a kh�a, sau khi m� s� nh�n ���c ph�n th��ng, ng��i mu�n r��ng n�o.",
  	getn(strtab),
  	strtab)	 
end

function box_thing(nType)
	local tBoxName = {"H�p Ng�c B�i Huy Ho�ng","H�p ��ng B�i Huy Ho�ng","H�p Ng�n B�i Vinh D�","H�p Kim B�i Vinh D�"}
	local sDiaOne = "";
	local sDiaTwo = "";
	if IB_VERSION == 1 then
		for i = 1,getn(tAboutBoxIB[nType][1]) do
			sDiaOne = sDiaOne..tAboutBoxIB[nType][1][i].."\n";
		end
		for j=1,getn(tAboutBoxIB[nType][2]) do
			sDiaTwo = sDiaTwo..tAboutBoxIB[nType][2][j].."\n";
		end
	else
		for i = 1,getn(tAboutBox[nType][1]) do
			sDiaOne = sDiaOne..tAboutBox[nType][1][i].."\n";
		end
		for j=1,getn(tAboutBox[nType][2]) do
			sDiaTwo = sDiaTwo..tAboutBox[nType][2][j].."\n";
		end	
	end	
	
	Talk(2,"how_about_box","<color=green>��c s� V� L�m<color>:"..tBoxName[nType].."_m�c d� nhi�u, nh�ng kh�ng n�n xem th��ng "..tBoxName[nType].."B�n trong �n ch�a linh kh� C�n kh�n.".."<color=yellow> s� nh�n ���c v�t ph�m sau<color>\n"..sDiaOne,"<color=green>��c s� V� L�m<color>:<color=yellow> S� nh�n ���c 1 trong c�c v�t ph�m sau<color>\n"..sDiaTwo);
end
   
function about_this_festival()
	Talk(1,"get_today_award","<color=green>��c s� V� L�m<color>: Trong th�i gian ho�t ��ng m�i ng�y c� th� nh�n ph�n th��ng, nh�ng m�i ng��i m�i ng�y ch� c� th� nh�n 1 l�n.\nM�i ng�y ��n ch� <color=yellow>Th� Ti�u Nha<color> �o�n s� c�ng hay, n�u may m�n, s� nh�n ���c nhi�u ph�n th��ng!")   
end

function duihuan()
	Talk(1,"how_about_box","<color=green>��c s� V� L�m<color>: Trang s�c Ho�ng �� trong h�p vinh d� v� huy ho�ng l� <color=yellow>Hi�n Vi�n Chi�n<color> v� <color=yellow>Hi�n vi�n ��u<color>, c� th� d�ng trang s�c Ho�ng Kim ��c ��nh kh�c c��ng h�a. B�n c� th� ��n T��ng D��ng t�m �� t� c�a th� r�n L�u, d�ng Hi�n Vi�n Chi�n v� Hi�n vi�n ��u ho�c 2 R��ng v�ng Th�nh Th�, c�ng th�m trang s�c Ho�ng Kim ��c ��nh, ��i Hi�n Vi�n Chi�n v� Hi�n Vi�n ��u c� thu�c t�nh ��c bi�t sau khi c��ng h�a, h�n n�a c� th� �em ch�ng �i k�ch ho�t, thu�c t�nh k�ch ho�t s� kh�ng �nh h��ng.")   
end

function about_shuangbei()
------------------��ʼ��¶ˮЧ��------------------------
	local tItemInfo =
	{
		{2, 1, 1012, 7200, 150, "B�ng Lai Ti�n Th�y",1},
		{2, 0, 109, 7200, 200, "B�ng Lai Ti�n L�",1.5},
		{2, 1, 1013, 7200, 300, "B�ng Lai Ti�n ��n",2},
		{2, 1, 1052, 7200, 120, "B�ng Lai L� Th�y",0},
	}
	for index, value in tItemInfo do
		InitXclSpeed(index, value[5])
	end
----------------------------------------------------------	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20081001 or nDate > 20081007 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Trong th�i gian l� Qu�c Kh�nh (1/10/2008 - 7/10/2008) h�y ��n nh�n.");
		return
	end 
	local nTime = tonumber(date("%H"));
	if nTime < 8 or nTime >= 23 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: V�o l�c 8:00 s�ng - 23:00 t�i ��n nh�n.");
		return
	end
	local strtab = {
		"Ta mu�n nh�n /get_shuangbei",
		"T�m th�i kh�ng nh�n/nothing"
		}
	Say("<color=green>��c s� V� L�m<color>: Trong th�i gian l� Qu�c Kh�nh m�i ng��i m�i ng�y c� th� ��n ch� ta nh�n <color=yellow>B�ch C�u Ho�n nh�n ��i hi�u qu� trong 8h, nh�n ��i kinh nghi�m trong 4h v� nh�n ��i �� c�ng hi�n s� m�n nguy�n ng�y<color>,<color=red> ch� �, c� th� s� ��i hi�u qu� th�i gian nh�n ��i c�p cao hi�n t�i c�a ng��i.<color>",
		getn(strtab),
		strtab)
end

function get_shuangbei()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TASK_WULIN_SHUANGBEI) >= nDate then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Ng��i �� nh�n ph�n th��ng nh�n ��i ng�y h�m nay, m�i ng��i m�i ng�y ch� c� th� nh�n 1 l�n.");
		return
	end
	local nType, nTime, nSpeed = GetExistXclInfo();
	if nTime > 0 then
		if nSpeed > 200 then
			Talk(1,"","<color=green>��c s� V� L�m<color>: Hi�n gi� ng��i c� hi�u qu� kinh nghi�m m�nh, kh�ng th� nh�n.");
			return
		end
	end
	if GetTask(85) == nDate and GetTask(86) == 3 then
		Talk(1,"","<color=green>��c s� V� L�m<color>: Hi�n ng��i c� hi�u qu� �� c�ng hi�n s� m�n m�nh, kh�ng th� nh�n.");
		return
	end
	SetTask(TASK_WULIN_SHUANGBEI,nDate);
	SetTask(TASK_BAIJU_SB_TIME,480);
	Msg2Player("B�n nh�n ���c B�ch C�u Ho�n nh�n ��i hi�u qu� trong 8h, b�y gi� c� hi�u l�c.");
	local nRet = EatXcl(2,14400)
	if nRet == 1 then
		Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i kinh nghi�m");
	end	
	SetTask(85,nDate);
	SetTask(86,2);
	Msg2Player("Trong h�m nay �� c�ng hi�n s� m�n b�n nh�n ���c t�ng 2 l�n");
end