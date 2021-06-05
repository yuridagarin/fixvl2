Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

THIS_RELAY_CALLBACK_SCRIPT = "\\script\\��ԭһ��\\�꾩\\npc\\ة��.lua";
g_szInfoHeader = "<color=green>Tri�u Ph�<color>:";
g_nBuChangBeginDate = 2008080100;	--������ʼʱ��
g_nBuChangEndDate = 2008080920;	--��������ʱ�䡣���Ϊ0���ʾ�����Ų���
if IB_VERSION == 0 then
	g_nMaxBuChangTimes = 1;			--�շ������α��β���ս����������
else
	g_nMaxBuChangTimes = 1;			--��������α��β���ս����������
end;
g_nReputation = 500;		--����������
g_nContribute = 300;		--������ʦ�Ź��׶�
--=====================================================================
TSK_BATTLEBUCHANG = 815;	--��¼�Ƿ��������β�������¼��ֵӦΪg_nBuChangEndDate
TSK_BUCHANG_TIMES = 808;	--��¼������ȡ�˶��ٴ�ս������
TSK_NORMAL_BUCHANG = 809	--��¼�����Ƿ���ȡ����ͨ����

-- VNG ch�c n�ng Nguy�n So�i Ti�n C�, T��ng Qu�n Ti�n C�
TSK_NGUYENSOAI = 2541
BYTE_TIENPHONG = 1
BYTE_TUONGQUAN = 2
BYTE_WEEK = 3
BYTE_DAY = 4

-- VNG ch�c n�ng b�o v� c�ng tr�ng chuy�n server
TSK_TRANS_POINT = 2150
TSK_TRANS_DATE  = 2151

tbJUNGONGZHANG = 
{
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,2},
	[2] = {"Qu�n C�ng ��i",2,1,9998,5},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,10},
}

TB_BATTLE_EQUIP = 
{
	[1] = 
	{
		[SONG_ID] = 
				{
					{"T�ng ti�n phong hi�u k�",0,102,2261,-1},
					{"T�ng ti�n phong hi�u ph�",0,102,2265,-1},
				},                         
		[LIAO_ID] = 
				{                          
					{"Li�u ti�n phong hi�u k�",0,102,2271,-1},
					{"Li�u ti�n phong hi�u ph�",0,102,2275,-1},
				}
	},
	[2] = 
	{
		[SONG_ID] = 
				{
					{"T�ng t��ng qu�n ��u kh�i",0,103,2241,0},
					{"T�ng t��ng qu�n chi�n b�o",0,100,2241,1},
					{"T�ng t��ng qu�n chi�n ph�c",0,101,2241,3},
					{"T�ng t��ng qu�n l�nh b�i",0,102,2281,-1},
					{"T�ng l�nh ph�",0,102,2521,-1},
					{"T�ng t��ng qu�n c� l�nh",0,102,2285,-1},				
	         	},
       	[LIAO_ID] = 
	       		{                
					{"Li�u t��ng qu�n ��u kh�i",0,103,2245,0},
					{"Li�u t��ng qu�n chi�n b�o",0,100,2245,1},
					{"Li�u t��ng qu�n chi�n ph�c",0,101,2245,3},
					{"Li�u t��ng qu�n l�nh b�i",0,102,2291,-1},
					{"Li�u t��ng qu�n c� l�nh",0,102,2295,-1},
					{"Li�u l�nh ph�",0,102,2531,-1},
				}
	},
	[3] = 
	{
		[SONG_ID] = 
				{
					{"T�ng nguy�n so�i ��u kh�i",0,103,2251,0},
					{"T�ng nguy�n so�i chi�n b�o",0,100,2251,1},
					{"T�ng nguy�n so�i chi�n ph�c",0,101,2251,3},
					{"T�ng so�i k�",0,102,2505,-1},  
					{"T�ng so�i ph�",0,102,2501,-1},
					{"T�ng nguy�n so�i l�nh k�",0,102,2305,-1}, 
					{"T�ng nguy�n so�i h� ph�",0,102,2301,-1},										          
				},
		[LIAO_ID] = 
				{                          
					{"Li�u nguy�n so�i ��u kh�i",0,103,2255,0},
					{"Li�u nguy�n so�i chi�n b�o",0,100,2255,1},
					{"Li�u nguy�n so�i chi�n ph�c",0,101,2255,3},
					{"Li�u nguy�n so�i l�nh k�",0,102,2315,-1},
					{"Li�u nguy�n so�i h� ph�",0,102,2311,-1},
					{"Li�u so�i k�",0,102,2515,-1},
					{"Li�u so�i ph�",0,102,2511,-1},														
				}
	},
	[4] =
	{
		[SONG_ID] = {
					{"T�ng-V�nh Vi�n Nguy�n So�i ��u Kh�i",0,103,3000,0},
					{"T�ng-V�nh Vi�n Nguy�n So�i Chi�n Gi�p ",0,100,3000,1},
					{"T�ng-V�nh Vi�n Nguy�n So�i Chi�n ph�c",0,101,3000,3},
					{"T�ng-V�nh Vi�n Nguy�n So�i H� ph�",0,102,3000,-1},
					{"T�ng-V�nh Vi�n Nguy�n So�i L�nh k�",0,102,3004,-1},
					{"T�ng-V�nh Vi�n Nguy�n So�i Hi�u ph�",0,102,3008,-1},
					{"T�ng-V�nh Vi�n Nguy�n So�i Hi�u k�",0,102,3012,-1},
					},
		[LIAO_ID] = {
					{"Li�u-V�nh Vi�n Nguy�n So�i ��u Kh�i",0,103,3004,0},
					{"Li�u-V�nh Vi�n Nguy�n So�i Chi�n Gi�p ",0,100,3004,1},
					{"Li�u-V�nh Vi�n Nguy�n So�i Chi�n ph�c",0,101,3004,3},
					{"Li�u-V�nh Vi�n Nguy�n So�i Hi�u ph�",0,102,3024,-1},
					{"Li�u-V�nh Vi�n Nguy�n So�i Hi�u k�",0,102,3028,-1},
					{"Li�u-V�nh Vi�n Nguy�n So�i H� ph�",0,102,3016,-1},
					{"Li�u-V�nh Vi�n Nguy�n So�i L�nh k�",0,102,3020,-1},					
					},
	},
	[5] =
	{
		[SONG_ID] = {
					{"T�ng T��ng Qu�n Chi�n Kh�i",0,103,3016,0},
					{"T�ng T��ng Qu�n Chi�n B�o",0,100,3016,1},
					{"T�ng T��ng Qu�n Chi�n Trang",0,101,3016,3},
					{"Thi�n Chi T�ng T��ng Qu�n L�nh B�i",0,102,3032,-1},
					{"Thi�n Chi T�ng T��ng Qu�n L�nh K�",0,102,3036,-1},
					{"Thi�n Chi T�ng T��ng Qu�n L�nhPh�",0,102,3040,-1},
					},
		[LIAO_ID] = {
					{"Li�u T��ng Qu�n Chi�n Kh�i",0,103,3020,0},
					{"Li�u T��ng Qu�n Chi�n B�o",0,100,3020,1},
					{"Li�u T��ng Qu�n Chi�n Trang",0,101,3020,3},
					{"Thi�n Chi Li�u T��ng Qu�n L�nh B�i",0,102,3044,-1},
					{"Thi�n Chi Li�u T��ng Qu�n L�nh Ph�",0,102,3052,-1},
					{"Thi�n Chi Li�u T��ng Qu�n L�nh K�",0,102,3048,-1},		
					},
	},	
	[6] =
	{
		[SONG_ID] = {
					{"��i T�ng Nguy�n So�i Chi�n Kh�i",0,103,3024,0},
					{"��i T�ng Nguy�n So�i Chi�n B�o",0,100,3024,1},
					{"��i T�ng Nguy�n So�i Chi�n Trang",0,101,3024,3},
					{"��i T�ng Nguy�n So�i H� Ph�",0,102,3056,-1},
					{"��i T�ng Nguy�n So�i L�nh K�",0,102,3060,-1},
					{"��i T�ng Nguy�n So�i Hi�u Ph�",0,102,3064,-1},
					{"��i T�ng Nguy�n So�i Hi�u K�",0,102,3068,-1},
					},
		[LIAO_ID] = {
					{"��i Li�u Nguy�n So�i Chi�n Kh�i",0,103,3028,0},
					{"��i Li�u Nguy�n So�i Chi�n B�o",0,100,3028,1},
					{"��i Li�u Nguy�n So�i Chi�n Trang",0,101,3028,3},
					{"��i Li�u Nguy�n So�i Hi�u Ph�",0,102,3080,-1},
					{"��i Li�u Nguy�n So�i Hi�u K�",0,102,3084,-1},	
					{"��i Li�u Nguy�n So�i H� Ph�",0,102,3072,-1},
					{"��i Li�u Nguy�n So�i L�nh K�",0,102,3076,-1},
		
					},
	},
	[7] =
	{
		[SONG_ID] = {
					{"Ng� Long Nguy�n So�i Chi�n Kh�i",0,103,3008,0},
					{"Ng� Long Nguy�n So�i Chi�n Gi�p",0,100,3008,1},
					{"Ng� Long Nguy�n So�i Chi�n Trang",0,101,3008,3},
					{"Ng� Long Nguy�n So�i H� Ph�",0,102,3088,-1},
					{"Ng� Long Nguy�n So�i L�nh K�",0,102,3092,-1},
					{"Ng� Long Nguy�n So�i Hi�u Ph�",0,102,3096,-1},
					{"Ng� Long Nguy�n So�i Hi�u K�",0,102,3100,-1},
					},
		[LIAO_ID] = {
					{"Chi�u Th�nh Nguy�n So�i Kh�i",0,103,3012,0},
					{"Chi�u Th�nh Nguy�n So�i Chi�n Gi�p",0,100,3012,1},
					{"Chi�u Th�nh Nguy�n So�i Chi�nTrang",0,101,3012,3},
					{"Chi�u Th�nh Nguy�n So�i Hi�u Ph�",0,102,3112,-1},
					{"Chi�u Th�nh Nguy�n So�i Hi�u K�",0,102,3116,-1},	
					{"Chi�u Th�nh Nguy�n So�i H� Ph�",0,102,3104,-1},					
					{"Chi�u Th�nh Nguy�n So�i L�nh K�",0,102,3108,-1},
					},
	},		
}

function main()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nDate = tonumber(date("%Y%m%d"));
	local selTab = {}
--	tinsert("V�n b�i ��n �� nh�n l�i nh�ng m�n �� b� m�t/apply_indemnitor")
	tinsert(selTab, "V�n b�i nh� ng�i t�u v�i Ho�ng Th��ng cho gia nh�p b�n qu�c/change_nationality")
	tinsert(selTab, "V�n b�i mu�n s�p x�p m�t s� vi�c c�a nhi�m v� s� m�n/main_sub")
--	tinsert(selTab, "Ta mu�n ��i trang b� phe "..tCampNameZ[nEnemyCamp].." sang trang b� phe "..tCampNameZ[nCurCamp].."/change_battle_equip")
	tinsert(selTab, "Ta mu�n ti�n c� anh h�ng cho phe "..tCampNameZ[nCurCamp].."/introduce_rank")
	if nDate > 20131004 then --t�m ��ng �� ��ng k� thi ��u BHTA 10
		tinsert(selTab, "Ta mu�n ��i qu�n c�ng c�a ��i ph��ng/apply_jungong_change")
	end
	tinsert(selTab, "Ta mu�n b�o to�n qu�n c�ng khi chuy�n server/apply_jungong_save")	
	--tinsert(selTab, "H�y b� k�ch ho�t s� d�ng ��u Th�nh T�n, ��u Th�nh Th�, ��u Th�nh Bi�u/turn_off")

	
	--local nYear,nMonth,nDay,nHour = get_date(g_nBuChangEndDate);
	--if g_nBuChangEndDate ~= 0 and nDate >= g_nBuChangBeginDate and nDate <= g_nBuChangEndDate then
	--	tinsert(selTab,format("Ta mu�n nh�n b�i th��ng (K�t th�c: N�m %d Th�ng %d Ng�y %d %d gi�)/get_compensation",nYear,nMonth,nDay,nHour));
	--end;
	tinsert(selTab,"Kh�ng c� g�/nothing");
	Say("L�o phu l� th�a t��ng c�a tri�u ��nh, t�m ta c� vi�c g� kh�ng?",getn(selTab),selTab);
end

function turn_off()
	SetTask(2154,0)
	Say("H�y b� k�ch ho�t s� d�ng v�t ph�m th�nh c�ng.",0)
	WriteLogEx("Chuyen doi cong trang","h�y b� k�ch ho�t",tonumber(date("%Y%m%d%H%M")))
end

function get_date(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear,nMonth,nDay,nHour;
end;

function apply_indemnitor()
	local nRet = ApplyIndemnitor()
	if (nRet == 0) then
		Talk(1, "", "L�o phu ch�ng gi� m�n �� n�o c�a ng��i c�")
	else
		Talk(1, "", "Xin nh�n l�y!")
	end
end;

function main_sub()
	local nTaskValuem = FN_GetTaskState(FN_YMM)
	if (nTaskValuem == 2) then
		task_005()
		return
	elseif (nTaskValuem == 3) then
		Say("C�a ch�nh c�a Ho�ng cung c� r�t nhi�u c�m qu�n.", 0)
		return
	elseif (nTaskValuem == 4) then
		task_009()
		return
	end

	UWorld1503 = GetTask(1503)
	if(GetLevel() > 1 and UWorld1503 < 15) then
		if(UWorld1503 == 0) then
			Say("Th�i t� b�ng h�, ho�ng �� m�i l�n ng�i, trong tri�u c�n nhi�u chuy�n ch�a gi�i quy�t. C� th� gi�p ta kh�ng?",
				2,
				"��ng �/W1503_yes",
				"Kh�ng gi�p/W1503_no")
		end
		if(UWorld1503 == 5 ) then
			Talk(1, "", "Mau ��n t�m v� binh th�nh m�n!")
      	end
		if(UWorld1503 == 10) then
			Talk(1, "", "Nhanh v�y sao? ��y c� ch�t l� v�t t�ng ng��i.")
			SetTask(1503,15)
			ModifyExp(150)
			Earn(250)
			ModifyReputation(2, 0)
			TaskTip("Ho�n th�nh nhi�m v� gi�p th�a t��ng t�m v� binh th�nh m�n.")
		end		
	else
		i = random(1, 4)
		if (i == 1) then
			Talk(1, "", "Kh� kh�n l�m m�i d�p ���c B�c H�n nay ph�i ��i ��u v�i Li�u Qu�c, xem ra ph�i ngh� c�ch kh�c �n ��nh d�n ch�ng th�i!")
		elseif (i == 2) then
			Talk(1, "", "L�c ti�n �� c�n s�ng t�ng n�i Bi�n L��ng l� n�i chi�n tranh li�n mi�n kh�ng th�ch h�p l�p n��c, xem ra c�ng ��ng!")
		elseif (i == 3) then
			Talk(1, "", "Gi� l�m th�a t��ng m�i bi�t ���c c�ch tr� qu�c kh�ng d� ch�t n�o! N�ng n�y l� h�ng h�t.")
		else
			Talk(1, "", "Nh�t th�ng thi�n h�, c�n chi�u n�p hi�n t�i!")
		end
	end
end;

function W1503_yes()
	Talk(1,"","Nha m�n kh�ng �� ng��i, mau gi�p ta t�m v� binh th�nh m�n d�n c�o th� th�ng b�o cho m�i ng��i bi�t tin th�i t� b�ng h�, ho�ng �� m�i l�n vua.")
	Talk(1,"","T�i h� �i ngay!")
	SetTask(1503,5)
	--AddNote("�ӵ����񣺰�����������ȥ�ҳ���������")
	TaskTip("Nh�n nhi�m v�: Gi�p th�a t��ng Tri�u Ph� t�m v� binh th�nh m�n.")
end;

function W1503_no()
end;

tb_introduce_rank = {
	[1] = {"Ti�n Phong", BYTE_TIENPHONG, 3, 2, 1, 0, 120000, 4},
	[2] = {"T��ng Qu�n", BYTE_TUONGQUAN, 4, 3, 1, 1, 250000, 5},
}

function introduce_rank()
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szInfoHeader.."Ch� c� <color=yellow>Nguy�n So�i<color> v� <color=yellow>T��ng Qu�n<color> m�i c� th� ti�n c� ng��i t�i!")
		return 0
	end
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local tSay = {"Ta mu�n ti�n c� "..tCampNameZ[nCurCamp].." Ti�n phong/#offer_rank(1,"..nCurCamp..")",}
	if abs(GetTask(704)) == 6 then
		tinsert(tSay, "Ta mu�n ti�n c� "..tCampNameZ[nCurCamp].." T��ng qu�n/#offer_rank(2,"..nCurCamp..")")
	end
	tinsert(tSay, "Kh�ng c� g�/nothing")	
	Say(g_szInfoHeader.."<color=yellow>Nguy�n So�i<color> c� th� ti�n c� <color=yellow>3 Ti�n Phong<color> v� <color=yellow>4 T��ng Qu�n<color> c�ng phe, <color=yellow>T��ng Qu�n<color> c� th� ti�n c� 2 Ti�n Phong c�ng phe. Ti�n Phong ti�n c� <color=yellow>c�n 120000 �i�m qu�n c�ng, 2 N� Oa Tinh Th�ch <color>. T��ng Qu�n ti�n c� <color=yellow>c�n 2500000 �i�m qu�n c�ng, 3 N� Oa Tinh Th�ch<color>. <color=red>Ch� �: qu�n h�m ti�n c� ch� c� hi�u l�c trong tu�n. ��n 21 gi� th� 7 h�ng tu�n s� x�t l�i qu�n h�m.<color>",getn(tSay),tSay);
end

function offer_rank(nType,nCurCamp)	
	if tonumber(date("%w")) ~= 0 then
		Talk(1,"",g_szInfoHeader.."Hi�n t�i ��i qu�n �� xu�t ph�t, kh�ng th� b� sung qu�n l�c! Ch� c� th� ti�n c� v�o ng�y Ch� Nh�t!")
		return 0
	end
	if GetTeamSize() < 2 then
		Talk(1,"",g_szInfoHeader.."Ta kh�ng th�y ng��i d�n theo ng��i mu�n ti�n c�. H�y t� ��i v�i ng��i �� ��n ��y g�p ta!")
		return 0
	elseif GetTeamSize() > 2 then
		Talk(1,"",g_szInfoHeader.."M�i l�n ch� c� th� ti�n c� 1 ng��i. H�y �i�u ch�nh l�i t� ��i!")
		return 0
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"",g_szInfoHeader.."H�y th�ng b�o ��i tr��ng ��n g�p ta!")
		return 0	
	end
	
	local nCurWeek = tonumber(date("%W"))
	local nCurDay = tonumber(date("%d"))
	local nTaskVal = GetTask(TSK_NGUYENSOAI)
	local nWeek =GetByte(nTaskVal,BYTE_WEEK)
	local nDay =GetByte(nTaskVal,BYTE_DAY)
	
	if nWeek ~= nCurWeek and nCurDay ~= nDay then
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[1][2],0)
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[2][2],0)
		nTaskVal = SetByte(nTaskVal,BYTE_WEEK,nCurWeek)
		nTaskVal = SetByte(nTaskVal,BYTE_DAY,nCurDay)
		SetTask(TSK_NGUYENSOAI, nTaskVal)
	end
	
	nTaskVal = GetTask(TSK_NGUYENSOAI)
	if GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= tb_introduce_rank[nType][3] then
		Talk(1,"",g_szInfoHeader.."Tu�n n�y <color=yellow>Nguy�n So�i<color> �� ti�n c�  "..tb_introduce_rank[nType][3].." "..tb_introduce_rank[nType][1].." cho tri�u ��nh r�i. Qu� l� may m�n cho tri�u ��nh!")
		return 0
	end
	if abs(GetTask(704)) == 5 and GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= 2 then
		Talk(1,"",g_szInfoHeader.."Tu�n n�y <color=yellow>T��ng Qu�n<color> �� ti�n c�  2 "..tb_introduce_rank[nType][1].." cho tri�u ��nh r�i. Qu� l� may m�n cho tri�u ��nh!")
		return 0
	end
			
	local szOfferName = ""
	local nOfferCamp = 0;
	local nOfferPoint = 0;
	local nOfferRank = 0;
	
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
				nOfferRank = GetTask(704)	
				nOfferPoint = GetTask(701)				
				if nOfferRank >= 0 then
					nOfferCamp = SONG_ID;
				else
					nOfferCamp = LIAO_ID;
				end;	
				break;
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	if nCurCamp ~= nOfferCamp then
		if abs(GetTask(704)) == 6 then
			Talk(1,"",g_szInfoHeader.."�� �� ph�ng gian t�, <color=yellow>Nguy�n So�i<color> kh�ng n�n ti�n c� ng��i c�a phe ��ch!")
		else
			Talk(1,"",g_szInfoHeader.."�� �� ph�ng gian t�, <color=yellow>T��ng Qu�n<color> kh�ng n�n ti�n c� ng��i c�a phe ��ch!")
		end
		return 0
	end
	
	if abs(nOfferRank) >= tb_introduce_rank[nType][8] then
		Talk(1,"",g_szInfoHeader.."Ng��i ���c ti�n c� �� c� qu�n h�m "..tb_introduce_rank[nType][1].."  r�i! Kh�ng c�n ti�n c� n�a!")
		return 0
	end
	
	if abs(nOfferPoint) < tb_introduce_rank[nType][7] then
		Say(g_szInfoHeader.."Hi�n nay tri�u ��nh �ang tuy�n m� nh�n t�i �� tr�n �i bi�n c��ng, b�o v� ��t n��c. Ta nh�n th�y n�ng l�c c�a <color=yellow>"..szOfferName.."<color> ch�a �� �� ti�n c�. <color=yellow>Nguy�n So�i<color> h�y t�m ng��i c� kh� n�ng h�n!",1,"Th�t ng�i qu�! Ta s� quay l�i sau!/nothing")
		return 0
	else
		if abs(GetTask(704)) == 6 then
			Say(g_szInfoHeader.."Hi�n nay tri�u ��nh �ang tuy�n m� nh�n t�i �� tr�n �i bi�n c��ng, b�o v� ��t n��c. Ta nh�n th�y <color=yellow>"..szOfferName.."<color> v�n v� song to�n. <color=yellow>Nguy�n So�i<color> mu�n ti�n c� ng��i n�y ph�i kh�ng?",2,"��ng v�y! H�y t�u v�i ho�ng th��ng gi�p ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch�a mu�n ti�n c� ng��i n�y!/nothing")
		else
			Say(g_szInfoHeader.."Hi�n nay tri�u ��nh �ang tuy�n m� nh�n t�i �� tr�n �i bi�n c��ng, b�o v� ��t n��c. Ta nh�n th�y <color=yellow>"..szOfferName.."<color> v�n v� song to�n. <color=yellow>T��ng Qu�n<color> mu�n ti�n c� ng��i n�y ph�i kh�ng?",2,"��ng v�y! H�y t�u v�i ho�ng th��ng gi�p ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch�a mu�n ti�n c� ng��i n�y!/nothing")
		end
	end
end

function confirm_offer_rank(nType,nCurCamp)
	local szOfferName = ""
	local szPlayerName = GetName()
	local nOK = 1
	local nForce = 1
	if nCurCamp == LIAO_ID then
		nForce = -1
	end
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
								
				if GetItemCount(2,1,504) < tb_introduce_rank[nType][4] then
					nOK = 0
					Say(g_szInfoHeader.."N� Oa Tinh Th�ch tr�n ng��i c�a c�c h� kh�ng ��!",0)
					Say2SomeOne(OldPlayer,g_szInfoHeader.."N� Oa Tinh Th�ch tr�n ng��i c�a "..szOfferName.." kh�ng ��!",0)
					PlayerIndex = OldPlayer
					return 0
				end
				
--				if GetItemCount(2,1,537) < tb_introduce_rank[nType][5] then
--					nOK = 0
--					Say(g_szInfoHeader.."C�c h� ch�a c� �� T� Kim H�ng Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."T� Kim H�ng Bao tr�n ng��i c�a "..szOfferName.." kh�ng ��!",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
--				
--				if GetItemCount(2,1,539) < tb_introduce_rank[nType][6] then
--					nOK = 0
--					Say(g_szInfoHeader.."C�c h� ch�a c� �� Ho�ng Kim ��i H�ng Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."Ho�ng Kim ��i H�ng Bao tr�n ng��i c�a "..szOfferName.." kh�ng ��!",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
				
				if DelItem(2,1,504,tb_introduce_rank[nType][4]) == 1 then	--and DelItem(2,1,537,tb_introduce_rank[nType][5]) == 1 and DelItem(2,1,539,tb_introduce_rank[nType][6]) == 1
					SetTask(704,nForce * tb_introduce_rank[nType][8])
					Say(g_szInfoHeader.."Tri�u ��nh nghe danh c�c h� �� l�u. Nay phong cho c�c h� ch�c <color=green>"..tb_introduce_rank[nType][1].."<color>! H�y d�c s�c v� tri�u ��nh!",0)				
				end				
			end
		end		
	end
	PlayerIndex = OldPlayer
	
	if nOK == 0 then
		return 0
	end
	
	local nVal = GetByte(GetTask(TSK_NGUYENSOAI),tb_introduce_rank[nType][2])
	nVal = SetByte(GetTask(TSK_NGUYENSOAI), tb_introduce_rank[nType][2], nVal +1)
	SetTask(TSK_NGUYENSOAI,nVal)
	if abs(GetTask(704)) == 6 then
		WriteLogEx("Nguyen Soai tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Ho�ng �� ban chi�u]: nh�n ���c ti�n c� c�a <color=green>"..tCampNameZ[nCurCamp].." Nguy�n So�i<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> l�m <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! Th�t l� tin m�ng cho ��i "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."Ti�n c� ho�n t�t, <color=yellow>"..szOfferName.."<color> �� tr� th�nh "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Ch�c m�ng Nguy�n So�i!",1,"Xin �a t�!/nothing")
	else
		WriteLogEx("Tuong Quan tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Ho�ng �� ban chi�u]: nh�n ���c ti�n c� c�a <color=green>"..tCampNameZ[nCurCamp].." T��ng Qu�n<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> l�m <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! Th�t l� tin m�ng cho ��i "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."Ti�n c� ho�n t�t, <color=yellow>"..szOfferName.."<color> �� tr� th�nh "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Ch�c m�ng T��ng Qu�n!",1,"Xin �a t�!/nothing")
	end
end

function change_battle_equip()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {
				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� Ti�n phong/#select_equip_type(1,"..nCurCamp..")",
				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� T��ng qu�n/#select_equip_type(2,"..nCurCamp..")",
--				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� Nguy�n so�i/#select_equip_type(3,"..nCurCamp..")",
--				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� V�nh Vi�n Nguy�n So�i /#select_equip_type(4,"..nCurCamp..")",
--				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� Thi�n Chi T��ng Qu�n/#select_equip_type(5,"..nCurCamp..")",
--				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� Thi�n Chi Nguy�n So�i/#select_equip_type(6,"..nCurCamp..")",
--				"Ta mu�n ��i "..tCampNameZ[nCurCamp].."Trang b� Thi�n Chi Nguy�n So�i v�nh vi�n/#select_equip_type(7,"..nCurCamp..")",
				"Kh�ng c� g�/nothing",
				}
	local szString = "";
	if IB_VERSION == 1 then
		szString = "v� hi�u qu� ��nh h�n";
	end;
	Say(g_szInfoHeader.."Ng��i mu�n ��i trang b�? <color=red>Ch� �: ��ng c�p c��ng h�a kh�ng thay ��i, "..szString.." bi�n m�t. Sau khi chuy�n qu�n c�ng, n�u kh�ng th� ��i, c� th� l� do qu�n h�m ch�a ���c c�p nh�t k�p th�i, vui l�ng sau khi x�p h�ng l�c 9h t�i v�o th� 7 m�i ��n t�m ta.<color>",getn(selTab),selTab);
end;

function select_equip_type(nType,nCurCamp)
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {};
	local szCurCampEquipName = "";
	local szEnemyCampEquipName = "";
	for i=1,getn(TB_BATTLE_EQUIP[nType][nEnemyCamp]) do
		szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][i][1];
		szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][i][1];
		selTab[i] = "Ta mu�n ��i "..szCurCampEquipName.." (c�n 250 v�ng v� "..szEnemyCampEquipName..")/#get_battle_equip_confirm("..nType..","..nCurCamp..","..i..")";
	end;
	tinsert(selTab,"�� ta ngh� l�i/nothing");
	local szString = "";
	if IB_VERSION == 1 then
		szString = " hi�u qu� ��nh h�n bi�n m�t";
	end;
	Say(g_szInfoHeader.."Ng��i mu�n ��i trang b� n�o trong ��y? <color=red>Ch� �: Trang b� sau khi ��i ��ng c�p c��ng h�a kh�ng thay ��i, "..szString..".<color>",getn(selTab),selTab);
end;

function get_battle_equip_confirm(nType,nCurCamp,nEquipIdx)
	local selTab = {
				"��ng �/#get_battle_equip("..nType..","..nCurCamp..","..nEquipIdx..")",
				"H�y b�/nothing",
				}
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	local szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	Say(g_szInfoHeader.."Ng��i x�c nh�n mu�n ��i <color=yellow>"..szCurCampEquipName.." (c�n 250 v�ng v� "..szEnemyCampEquipName..")<color> ch�? <color=yellow>Ch� �: N�u ��i M�o, Th��ng y, H� y th� ng��i ph�i m�c trang b� v�o ng��i.<color>",getn(selTab),selTab);
end;

function get_battle_equip(nType,nCurCamp,nEquipIdx)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return 0;
	end
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nBody = GetBody();
	local nDelID1,nDelID2,nDelID3,nTypeID = 0,0,0,-1;
	local nID1,nID2,nID3 = 0,0,0;
	local nUpgrade = 0;
	local szDelItemName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	nDelID1 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][2];
	nDelID2 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][3];
	nDelID3 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][4];
	nTypeID = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][5];
	local szItemName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	nID1 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][2];
	nID2 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][3];
	nID3 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][4];		
	if nTypeID ~= -1 then
		local nG,nD,nP = GetPlayerEquipInfo(nTypeID)
		if ((nG ~= nDelID1) or (nD ~= nDelID2) or (nP ~= nDelID3+nBody-1)) then
			Talk(1,"change_battle_equip",g_szInfoHeader.."Ph�i c� <color=yellow>"..szDelItemName.."<color> m�i c� th� ��i th�nh <color=yellow>"..szItemName.."<color>.");
			return 0;
		end		
		local nItemIdx = GetPlayerEquipIndex(nTypeID)		
		nUpgrade = GetEquipAttr(nItemIdx,2) or 0
		UnEquipAtPosition(nTypeID)
	end	
	local nDelItemCount = GetItemCount(nDelID1,nDelID2,nDelID3+nBody-1);
	if nDelItemCount > 1 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ng��i mang theo qu� nhi�u <color=yellow>"..szDelItemName.."<color>, mu�n ta ��i cho ng��i c�i n�o? Ng��i n�n s�p x�p l�i h�nh trang, <color=yellow> �em c�i ng��i mu�n ��i �� l�i ��y. <color>");
		return 0;
	end;
	if nDelItemCount <= 0 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ph�i c� <color=yellow>"..szDelItemName.."<color> m�i c� th� ��i th�nh <color=yellow>"..szItemName.."<color>.");
		return 0;
	end;
	if GetCash() < 2500000 then
		Talk(1,"",g_szInfoHeader.."V�ng tr�n ng��i ng��i kh�ng ��, �� <color=yellow>100 l��ng<color> m�i c� th� ��i trang b� n�y.");
		return 0;
	end;
	if DelItem(nDelID1,nDelID2,nDelID3+nBody-1,1) == 1 then
		Pay(2500000);
		local nRetCode = AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,nUpgrade);
		if nRetCode == 1 then
			Msg2Player("B�n �� nh�n ���c 1 "..szItemName);
			WriteLog("[Trang b� chi�n tr��ng ��i]:"..GetName().."�� ��i 1"..szDelItemName);
		else
			WriteLog("[Trang b� chi�n tr��ng ��i b� l�i]:"..GetName().."��i"..szDelItemName.."AddItem g�p l�i, nRetCode:"..nRetCode);
		end;
	end;
end;

function apply_jungong_save()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanBaoLuuCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanBaoLuuCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_szInfoHeader .. "Hi�n t�i ch�a ��n l�c m� t�nh n�ng n�y, ng��i h�y quay l�i sau nh�.")
			return 0
		end
	end
		
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ph��ng �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ng�c �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta.");
			return 0;	
		end	
	end

	local selTab = 	{
								"H�y gi�p ta b�o l�u �i�m qu�n c�ng/apply_jungong_confirm",
								"Ta mu�n nh�n l�i �i�m qu�n c�ng/receive_jungong_save",
								"�� ta suy ngh� ��/nothing",
							}
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		if GetTask(TSK_TRANS_DATE) >= tonumber(date("%Y%m%d")) then			
			tremove(selTab,1)			
		else
			SetTask(TSK_TRANS_POINT,0)
			SetTask(TSK_TRANS_DATE,0)
			tremove(selTab,2)
		end
	else
		tremove(selTab,2)
	end
	Say(g_szInfoHeader.."L�o phu c� th� gi�p ng��i b�o to�n �i�m qu�n c�ng sau khi chuy�n server. <color=yellow>Th� 5 h�ng tu�n h�y ��n g�p l�o phu b�o l�u qu�n c�ng<color>. Ph� b�o l�u l� <color=green>500 v�ng<color>. <color=yellow>Th�i gian nh�n l�i �i�m qu�n c�ng t� 10:00 - 24:00 th� 6<color>, sau th�i gian n�y ta kh�ng ch�u tr�ch nhi�m b�o l�u �i�m c�a ng��i. <color=red>L�u �: �i�m qu�n c�ng t�i �a nh�n ���c sau khi chuy�n server l� 110% c�a ng��i cao nh�t c�ng phe.<color>.",getn(selTab),selTab);
end

function apply_jungong_confirm()
--	if tonumber(date("%y%m%d")) >= 110105 then
--		Talk(1, "", "Ch�c n�ng n�y �ang t�m ��ng!")
--		return
--	end
	local nDay = tonumber(date("%w"))	
	local nJungGong = GetTask(701)
	local nType = 0
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Th� 5 h�ng tu�n h�y ��n ��y g�p l�o phu!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L�o phu ch� nh�n �i�m c�a cao th� ��ng c�p 80 tr� l�n!")
		return	
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."�i�m qu�n c�ng c�a ng��i nh� h�n 80000, kh�ng c�n ph�i b�o l�u!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then		
		Talk(1,"",g_szInfoHeader.."Ng��i ch�a nh�n l�i �i�m qu�n c�ng �� b�o l�u!")
		return
	end
	local strCharge =  "500 v�ng"	
	local strSay = {
							format("Ta ��ng �!/#apply_jungong_confirm_confirm(%d)",nType),
							"�� ta suy ngh� ��/nothing"	
						}	
	Say("�i�m qu�n c�ng hi�n t�i c�a ng��i l� <color=yellow>"..abs(nJungGong).."<color>, ph� b�o l�u l� <color=yellow>"..strCharge.."<color>. Sau khi b�o l�u �i�m qu�n c�ng t�m th�i c�a ng��i l� 80000. X�c nh�n mu�n b�o l�u �i�m?",getn(strSay),strSay)
end

function apply_jungong_confirm_confirm(nType)
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d"))
	local nNextDate = tf_GetResultDate(nDate,1)
	local nJungGong = GetTask(701)
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Th� 5 h�ng tu�n h�y ��n ��y g�p l�o phu!")
		return
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."�i�m qu�n c�ng c�a ng��i nh� h�n 80000, kh�ng c�n ph�i b�o l�u!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		Talk(1,"",g_szInfoHeader.."Ng��i ch�a nh�n l�i �i�m qu�n c�ng �� b�o l�u!")
		return
	end		
	if GetCash() < 5000000 then
		Talk(1,"",g_szInfoHeader.."Ng��i kh�ng mang �� 500 v�ng!")
		return
	end
	CalcBattleRank()
	UpdateBattleMaxRank()
	if Pay(5000000)  == 1 then
		SetTask(TSK_TRANS_DATE,nNextDate)
		SetTask(TSK_TRANS_POINT,GetTask(701))
		--SetTask(TSK_TRANS_POINT_ALLOW,1)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,GetGlbValue(GLB_TSK_SERVER_ID))
		if nJungGong >= 0 then		
			SetTask(701,80000)
		else
			SetTask(701,-80000)
		end
		Say(g_szInfoHeader.."L�o phu �� b�o l�u �i�m th�nh c�ng cho ng��i. Ng�y mai ��n ��y nh�n l�i nh�!",0)
		WriteLogEx("Bao luu quan cong","g�i �i�m th�nh c�ng",nJungGong,"�i�m qu�n c�ng")
	else
		WriteLogEx("Bao luu quan cong","g�i �i�m th�t b�i",nJungGong,"�i�m qu�n c�ng")
	end
end

function receive_jungong_save()
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Th� 6 h�ng tu�n t� 10:00 - 24:00 h�y ��n ��y g�p l�o phu nh�n l�i �i�m!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L�o phu ch� nh�n �i�m c�a cao th� ��ng c�p 80 tr� l�n!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) <= 0 then
		Talk(1,"",g_szInfoHeader.."L�o phu kh�ng gi� �i�m g� c�a ng��i c�!")
		return
	end
	if GetTask(TSK_TRANS_DATE) <  nDate then
		SetTask(TSK_TRANS_POINT,0)
		SetTask(TSK_TRANS_DATE,0)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
		Talk(1,"",g_szInfoHeader.."Th�t ��ng ti�c, th�i h�n nh�n l�i �i�m �� qua!")
		return
	end
	local nCurCamp = BT_GetCurCamp();	
	local nSaveJunGong = abs(GetTask(TSK_TRANS_POINT))	
	local nCurRank = abs(GetTask(704))
	local nMaxJunGong = 0;
	local nAlterantJunGong = 0;	
	if gf_GetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG) == GetGlbValue(GLB_TSK_SERVER_ID) then
		nAlterantJunGong = nSaveJunGong
	else
		if nCurCamp == SONG_ID then
			nMaxJunGong = GetRankByIndex(1,0);
		else
			nMaxJunGong = GetRankByIndex(-1,0);
		end;
		if not nMaxJunGong then
			nMaxJunGong = 1;
		end;
		nAlterantJunGong = ceil(nMaxJunGong*1.1);
		nAlterantJunGong = min(nAlterantJunGong,nSaveJunGong);
	end
	local selTab = {
				"An t�m �i, ta �� bi�t r�i/#receive_jungong_save_confirm("..nAlterantJunGong..")",
				"�� ta suy ngh� ��/nothing",
				}
	Say(g_szInfoHeader.."�i�m qu�n c�ng b�o l�u hi�n gi� c�a ng��i ("..tCampNameZ[nCurCamp]..") l� <color=yellow>"..nSaveJunGong.."<color>, c� th� nh�n nhi�u nh�t <color=yellow>"..nAlterantJunGong.."<color> �i�m qu�n c�ng. ��ng � ch�?",getn(selTab),selTab);	
end


function receive_jungong_save_confirm(nAlterantJunGong)
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Th� 6 h�ng tu�n t� 10:00 - 24:00 h�y ��n ��y g�p l�o phu nh�n l�i �i�m!")
		return
	end
	if nAlterantJunGong <= 0 then
		Talk(1,"",g_szInfoHeader.."L�o phu kh�ng gi� �i�m g� c�a ng��i c�!")
		return
	end
	if GetTask(TSK_TRANS_POINT) < 0 then
		nAlterantJunGong = - nAlterantJunGong
	end
	SetRankPoint(5, 701, 1)
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(701,nAlterantJunGong)
	SetTask(TSK_TRANS_POINT,0)
	SetTask(TSK_TRANS_DATE,0)
	gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
	CalcBattleRank()
	UpdateBattleMaxRank()
	--SetTask(TSK_TRANS_POINT_ALLOW,0)
	Say(g_szInfoHeader.."L�o phu �� ph�c h�i �i�m cho ng��i th�nh c�ng!",0)
	WriteLogEx("Bao luu quan cong","nh�n �i�m th�nh c�ng",nAlterantJunGong,"�i�m qu�n c�ng")
end

function apply_jungong_change()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Hi�n t�i ch�a cho ph�p chuy�n ��i c�ng tr�ng, ng��i h�y quay l�i sau nh�.")
			return
		end
	end
	
	local selTab = {
				"Ta �� quy�t ��nh, kh�ng c�n khuy�n n�a/jungong_change_confirm",
				"�� ta suy ngh� ��/nothing",
				}
	Say(g_szInfoHeader.."Ng��i th�t s� mu�n chuy�n ��n doanh tr�i ��i ph��ng ch�? Vi�c n�y r�t t�n k�m, hay l� suy ngh� k� r�i h�n quy�t ��nh! N�u ng��i �� ��ng k� tham gia chi�n tr��ng, <color=red>sau khi chuy�n th�nh c�ng, ph�i ��ng k� l�i<color>, Ng��i �� quy�t ��nh r�i ch�? <color=red>Ch� �: Ng��i ch�i c� qu�n c�ng th�p h�n ho�c b�ng 120000 kh�ng th� s� d�ng t�nh n�ng n�y, h�y mua ��u th�nh t�n, ��u th�nh th� ho�c ��u th�nh bi�u � Ng� C�c d�ng �� ti�n h�nh chuy�n ��i.<color>",getn(selTab),selTab);
end;

function jungong_change_confirm()
	local nCurCamp = BT_GetCurCamp();
	local nOppCamp = SONGLIAO_ID - nCurCamp;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--�Լ���ǰ�ľ���
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."�i�m qu�n c�ng hi�n gi� c�a ng��i nh� h�n ho�c b�ng 120000, kh�ng c�n ��i qu�n c�ng � ��y, h�y mua ��u th�nh t�n, ��u th�nh th� ho�c ��u th�nh bi�u � Ng� C�c �� ti�n h�nh chuy�n ��i.");
		return 0;
	end;
	local nOppMaxJunGong = 0;
	if nOppCamp == SONG_ID then
		nOppMaxJunGong = GetRankByIndex(1,0);	--��õз���һ���ľ���
	else
		nOppMaxJunGong = GetRankByIndex(-1,0);	--��õз���һ���ľ���
	end;
	if not nOppMaxJunGong then
		nOppMaxJunGong = 1;
	end;
	local nAlterantJunGong = 0;	--��ת������
	local nAlterantMaxJunGong = 360000;	--����ת������
	nAlterantJunGong = ceil(nOppMaxJunGong*0.85);	--����ת�з���������85%
	nAlterantJunGong = min(nAlterantJunGong,nCurJunGong);	--���ܳ����Լ���ǰ�ľ���
	nAlterantJunGong = min(nAlterantJunGong,nAlterantMaxJunGong)	--���ܳ���ĳ�����ֵ
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local selTab = {
				"An t�m �i, ta �� chu�n b� r�i/#jungong_change_confirm_final("..nAlterantJunGong..")",
				"�� ta suy ngh� ��/nothing",
				}
	Say(g_szInfoHeader.."�i�m qu�n c�ng hi�n gi� c�a ng��i ("..tCampNameZ[nCurCamp]..") l� <color=yellow>"..nCurJunGong.."<color>, chuy�n ��n ��i ph��ng ("..tCampNameZ[nOppCamp]..") c� th� chuy�n nhi�u nh�t <color=yellow>"..nAlterantJunGong.."<color> �i�m qu�n c�ng, c�n d�ng <color=yellow>"..nNeedItemNum.." ��u th�nh bi�u v� 1000 v�ng<color>, ng��i ch�c ch�n mu�n chuy�n ch�? <color=red>Ch� �: Chuy�n qu�n c�ng c� nh�ng quy t�c sau: 1. C� th� chuy�n nhi�u nh�t 360000 qu�n c�ng; 2. N�u 85%�i�m qu�n c�ng c�a ng��i x�p ��u trong b�ng x�p h�ng qu�n c�ng c�a ��i ph��ng nh� h�n 360000, th� ng��i ch� c� th� ��i nhi�u nh�t (85% �i�m qu�n c�ng c�a ng��i x�p ��u trong b�ng x�p h�ng qu�n c�ng ��i ph��ng).<color>",getn(selTab),selTab);
end;

function jungong_change_confirm_final(nAlterantJunGong)
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--�Լ���ǰ�ľ���
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."�i�m qu�n c�ng hi�n gi� c�a ng��i nh� h�n ho�c b�ng 120000, kh�ng c�n ��i qu�n c�ng � ��y, h�y mua ��u th�nh t�n, ��u th�nh th� ho�c ��u th�nh bi�u � Ng� C�c �� ti�n h�nh chuy�n ��i.");
		return 0;
	end;
	if  GetCash() < 10000000 then
		Talk(1,"",g_szInfoHeader.."H�nh nh� ng��i kh�ng c� �� 1000 v�ng!");
		return 0;
	end
	if DelItem(2,1,9978,nNeedItemNum) == 1 and Pay(10000000) == 1 then
		local nCurCamp = BT_GetCurCamp();
		local nOppCamp = SONGLIAO_ID - nCurCamp;
		if nOppCamp == SONG_ID then
			BT_SetData(PT_RANKPOINT,nAlterantJunGong);
		else
			BT_SetData(PT_RANKPOINT,-nAlterantJunGong);
		end;
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		Say(g_szInfoHeader.."B�n ��t th�nh c�ng "..tCampNameZ[nCurCamp].."Ph��ng "..nCurJunGong.." �i�m c�ng tr�ng ��i th�nh"..tCampNameZ[nOppCamp].."Ph��ng "..nAlterantJunGong.." �i�m qu�n c�ng.",0);
		Msg2Player("B�n ��t th�nh c�ng "..tCampNameZ[nCurCamp].."Ph��ng "..nCurJunGong.." �i�m c�ng tr�ng ��i th�nh"..tCampNameZ[nOppCamp].."Ph��ng "..nAlterantJunGong.." �i�m c�ng tr�ng");
		SetRankPoint(5,701,1);	--����������а�
		WriteLog("[Tri�u Ph� chuy�n qu�n c�ng]:"..GetName().."D�ng th�"..nNeedItemNum.." ��u th�nh bi�u th�nh c�ng �em "..tCampNameZ[nCurCamp].."Ph��ng "..nCurJunGong.." �i�m c�ng tr�ng ��i th�nh"..tCampNameZ[nOppCamp].."Ph��ng "..nAlterantJunGong.." �i�m c�ng tr�ng");
	else
		Talk(1,"",g_szInfoHeader.."��i"..nAlterantJunGong.." �i�m qu�n c�ng c�n "..nNeedItemNum.." ��u th�nh bi�u.");
	end;
end;

function get_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	if nGotBuChangDate ~= g_nBuChangEndDate then
		SetTask(TSK_BUCHANG_TIMES,0);
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local selTab = {
				--"��Ҫ��ȡ��ͨ��������Ҫ�ȼ�10����/give_added_comp",
				"Ta mu�n nh�n b�i th��ng chi�n tr��ng (y�u c�u c�p 60)/get_battle_compensation",
				"T�m th�i kh�ng nh�n/nothing",
				}
	Say(g_szInfoHeader.."Ng��i mu�n nh�n b�i th��ng n�o?",getn(selTab),selTab);
end;

function get_battle_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHeader.."Ng��i ph�i gia nh�p m�n ph�i m�i c� th� nh�n b�i th��ng chi�n tr��ng.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHeader.."��ng c�p c�a ng��i qu� th�p, ph�i ��t ��n c�p 60 m�i c� th� nh�n b�i th��ng chi�n tr��ng.");
		return 0;
	end;
	if nGotBuChangTimes >= g_nMaxBuChangTimes then
		Talk(1,"",g_szInfoHeader.."Ng��i �� nh�n t�t c� b�i th��ng.");
		return 0;
	end;
	if nCurDate > g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."L�o phu kh�ng h� nh�n ���c th�ng b�o l� ng��i ch�a nh�n ��.");
		return 0;
	end;
	local selTab = {
				"Ta mu�n d�ng Qu�n C�ng Ch��ng (qu�n c�ng x2, kinh nghi�m x1.5)/#give_battle_compen_confirm(1)",
				"Ta mu�n d�ng ��i Qu�n C�ng Ch��ng (qu�n c�ng x5, kinh nghi�m x2)/#give_battle_compen_confirm(2)",
				"Ta mu�n d�ng Huy ho�ng ch��ng (qu�n c�ng x10, kinh nghi�m x2.5)/#give_battle_compen_confirm(3)",
				"Kh�ng d�ng/#give_battle_compen_confirm(0)",
				"T�m th�i ta ch�a mu�n nh�n b�i th��ng/nothing",
				}
	local tbExpX = {1,1,1.5,2,2,3};	--����ζ�Ӧ�ľ���ϵ��
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--���û�о��λ���γ���
		nCurRank = 1;	--��Ϊ1
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*����ҵȼ�ƽ��/75��*���ε���ϵ��
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "S�c kh�e ��i kinh nghi�m <color=yellow>"..nGoldenExpAward.."<color> �i�m (�i�m s�c kh�e c�a ng��i hi�n gi� l�: <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."Hi�n gi� b�n c� th� nh�n b�i th��ng chi�n tr��ng �i�m qu�n c�ng <color=yellow>"..nJunGong.."<color> �i�m, �i�m kinh nghi�m <color=yellow>"..nExpAward.." �i�m<color>,"..szGoldenExp.."M�i ng��i c� th� nh�n <color=yellow>"..g_nMaxBuChangTimes.."<color> l�n, ��y l� l�n th� <color=yellow>"..(nGotBuChangTimes+1).."<color> b�n l�nh. B�n mu�n l�nh tr�c ti�p hay d�ng Qu�n C�ng Ch��ng �� l�nh?",getn(selTab),selTab);
end;

function give_battle_compen_confirm(nType)
	if nType == 0 then
		local selTab = {
					"S� d�ng qu�n c�ng ch��ng/get_battle_compensation",
					"Kh�ng mu�n d�ng qu�n c�ng n�o h�t/#give_battle_compensation(0)",
					}
		Say(g_szInfoHeader.."Ng��i x�c nh�n kh�ng s� d�ng Qu�n C�ng Ch��ng ch�?",getn(selTab),selTab);
	else
		local selTab = {
					format("��ng �/#give_battle_compensation(%d)",nType),
					"�� ta suy ngh�/nothing",
					}
		Say(g_szInfoHeader.."Ng��i x�c nh�n mu�n s� d�ng <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> ch�?",getn(selTab),selTab);
	end;
end;

function give_battle_compensation(nType)
	local nLevel = GetLevel();
	local tbExpX = {1,1,1.5,2,2,3};	--����ζ�Ӧ�ľ���ϵ��
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--���û�о��λ���γ���
		nCurRank = 1;	--��Ϊ1
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*����ҵȼ�ƽ��/75��*���ε���ϵ��
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHeader.."L�o phu tuy gi�, nh�ng m�t v�n s�ng. Mu�n qua m�t l�o phu sao?");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("Ng��i d�ng 1 "..tbJUNGONGZHANG[nType][1]);
	end;
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	SetTask(TSK_BATTLEBUCHANG,g_nBuChangEndDate);
	SetTask(TSK_BUCHANG_TIMES,nGotBuChangTimes+1);
	nGotBuChangTimes = nGotBuChangTimes + 1;
	if nCurJunGong >= 0 then
		BT_SetData(PT_RANKPOINT,nCurJunGong+nJunGong);
		Msg2Player("Phe T�ng, b�n nh�n ���c "..nJunGong.." �i�m c�ng tr�ng");
	else
		BT_SetData(PT_RANKPOINT,nCurJunGong-nJunGong);
		Msg2Player("Phe Li�u, b�n nh�n ���c "..nJunGong.." �i�m c�ng tr�ng");
	end;
	ModifyExp(nExpAward);
	Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m b�i th��ng chi�n tr��ng");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	Msg2Player("��y l� l�n th� "..nGotBuChangTimes.." l�n b�i th��ng chi�n tr��ng");
	WriteLog("[Tri�u Ph� b�i th��ng"..g_nBuChangEndDate.."]"..GetName().."th�"..nGotBuChangTimes.." (c� th� l�nh nhi�u nh�t "..g_nMaxBuChangTimes.." l�n) l�n l�nh b�i th��ng chi�n tr��ng. ��ng c�p: "..nLevel..", lo�i Qu�n C�ng Ch��ng:"..nType..", qu�n h�m:"..nCurRank..", qu�n c�ng: "..nJunGong);
end;

function give_added_comp()
	if GetTask(TSK_NORMAL_BUCHANG) == g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."Ng��i �� nh�n b�i th��ng r�i.");
		return 0;
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local nLevel = GetLevel();
	if nLevel < 10 then
		Talk(1,"",g_szInfoHeader.."��ng c�p c�a ng��i qu� th�p, ph�i ��t ��n c�p 10 m�i c� th� nh�n b�i th��ng.");
		return 0;
	end;
	local nExpAward = 0;
	if IB_VERSION == 0 then	--������շ���
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	local nGoldenExpAward = floor((nLevel^4)/4);
	local nCurGoldenExp = GetGoldenExp();
	local selTab = {
				"Nh�n /give_added_comp_confirm",
				"T�m th�i kh�ng nh�n/nothing",
				}
	local szGoldenExp = "";
	if IB_VERSION == 0 then	--������շ���
		szGoldenExp = "Chuy�n <color=yellow>"..nGoldenExpAward.."<color> �i�m �i�m s�c kh�e (�i�m s�c kh�e hi�n gi� c�a ng��i l� <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."B�i th��ng l�n n�y ng��i c� th� nh�n <color=yellow>"..nExpAward.."<color>,"..szGoldenExp.."<color=yellow>"..g_nReputation.."<color> �i�m danh v�ng v� <color=yellow>"..g_nContribute.."<color> �i�m c�ng hi�n S� M�n (c�n v�o m�n ph�i). Ng��i mu�n nh�n b�i th��ng n�y ch�?",getn(selTab),selTab);
end;
--����Ĳ���
function give_added_comp_confirm()	
	SetTask(TSK_NORMAL_BUCHANG,g_nBuChangEndDate);
	local nRoute = GetPlayerRoute();
	local nLevel = GetLevel();
	local nExpAward = 0;
	if IB_VERSION == 0 then	--������շ���
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	ModifyExp(nExpAward);
	Msg2Player("B�n nh�n ���c "..nExpAward.."B�i th��ng �i�m kinh nghi�m");
	local nGoldenExpAward = floor((nLevel^4)/4);
	if IB_VERSION == 0 then	--������շ���
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	ModifyReputation(g_nReputation,0);
	if nRoute ~= 0 then
		SetTask(336,GetTask(336)+g_nContribute);
		Msg2Player("B�n nh�n ���c "..g_nContribute.."B�i th��ng �i�m c�ng hi�n S� M�n");
	end;
	WriteLog("[Tri�u Ph� b�i th��ng"..g_nBuChangEndDate.."]:"..GetName().."Nh�n b�i th��ng");
end;

function nothing()

end;

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	else 
		return 1
	end
end