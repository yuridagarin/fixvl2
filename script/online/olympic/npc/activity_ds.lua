--���˻��ʹ
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")

tbSay_201207 = {
	"Gi�i thi�u ho�t ��ng/introduce_201207",
--	"�������˳齱/oly_lucky_star_201207",
	"R�t th��ng H�nh V�n/oly_lucky_star_201207",
	"Gh�p Ng� Th�i Th�nh H�a/combining_flame_201207",
	"�o�n s� nh�n Lam S�c Th�nh H�a /guess_flame_201207",
	"��n H�a V�c C�u Ch�u thu th�p Th�nh H�a/goto_caji_map_201207",
}

--sTitle_201207 = "��ӭ�μӰ��˻���ռ���ɫʥ���ȼʥ̳��Ӯȡ����<color=green>70<color>����������ѧ��<color=green>1<color>��<color=green>55<color>�����ܵ���ʿ���Բμӡ�";
sTitle_201207 = "Ch�c m�ng Phi�n B�n m�i, nh�n h�o l�. C�p 80 �� gia nh�p m�n ph�i h�c k� n�ng 55 ��t c�p t�i �a c� th� tham gia";

Activity_Ds_Name = "<color=green>��i S� ho�t ��ng: <color>";

sTitle_201207_1 = "T�i m�i th�nh Thuy�n Ch�u (165/192), Th�nh �� (180/179), ��i L� ( 231/222), T��ng D��ng (221/195), Ph��ng T��ng (221/195), Bi�n Kinh ( 183/173) ��u c� m�t Th�nh H�a ��n";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"Ngu�n g�c v� ch�ng lo�i Th�nh H�a/source_201207",
		"Ph�n th��ng v� s� l�n s� d�ng 5 lo�i Th�nh H�a �� th�p s�ng/danse_award_201207",
		"Ph�n th��ng v� s� l�n s� d�ng Ng� Th�i Th�nh H�a �� th�p s�ng/wucai_award_201207",
--		"ÿ�հ��������ǳ齱/lucky_star_201207",
		"R�t th��ng H�nh V�n Tinh m�i ng�y/lucky_star_201207",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H�c S�c Th�nh H�a��R�i ra t� Boss �i L��ng S�n, V�n Ki�m Tr�ng;  \n Ho�ng S�c Th�nh H�a��Nh�n ���c khi gi�t qu�i � Qu� M�n H�i Lang;  \n H�ng S�c Th�nh H�a��R�i ra t� Thi�n M�n Tr�n;  \n L�c S�c Th�nh H�a��Thu th�p U Minh Hoa � Qu� M�n H�i Lang (c� x�c su�t sinh ra khi gi�t ch�t qu�i v�t);   \n Lam S�c Th�nh H�a��Nh�n ���c khi tham gia �o�n s�;  \n Ng� Th�i Th�nh H�a��Gh�p � ��i S� ho�t ��ng ho�c c� th� nh�n ���c khi gi�t qu�i chi�u d� Minh H�a Qu� Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S� l�n: Th�nh H�a ��n c�a m�i th�nh, m�i ng�y c� th� ��t s�ng 1 l�n. Ph�n th��ng: \n c�ng d�n s� l�n �i�m h�a + 1; \n exp<color=green>%d<color>; \n ng�u nhi�n 1 ��o c� qu� hi�m, ph�n th��ng cao nh�t c� Tinh Kh�c, trang b� Thi�n Ngh�a, trang b� ng�u nhi�n v.v.", OLY_EXP_2);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("S� l�n: C� th� �i�m h�a t�i b�t k� Th�nh H�a ��n c�a th�nh th� v�i s� l�n b�t k�. Ph�n th��ng: \n c�ng d�n s� l�n �i�m h�a +1; \n exp<color=green>%d<color>; \n ng�u nhi�n 1 ��o c� qu� hi�m, ph�n th��ng cao nh�t c� Linh Th�ch c�p 7, Thi�n Cang L�nh, ��nh H�n Thi�n Th�ch Linh Th�ch, Thi�n Th�ch Linh Th�ch, trang b� ng�u nhi�n v.v", OLY_EXP_3);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."�ﵽ��ͬ���ۼƵ�������ý���ʱ���Ȼ�����½�����\n    50��-1��ǧ�ÿ̰壻100��-���б��䣻150��-������ʯ��\n    300��-2��ǧ�ÿ̰壨�ɻ�ȡָ����λָ�����Ե�2�����飩��\n    600��-�Ի;����£�\n    800��-7����ʯ��\n    1000��-3��ǧ�ÿ̰壨�ɻ�ȡָ����λָ�����Ե�3�����飩��\n    1200��-����\n	ע�⣺��ȡ1200�εĽ������ۼƵ����������㣬�������¿�ʼ�ۻ���\n";
	tbSay.msg = Activity_Ds_Name.."�i�m h�a c�ng d�n ��t ��n 50 l�n kh�c nhau trang b� ng�u nhi�n-1-3 sao; 100 l�n-B� Ng�n To�n; 200 l�n-B� Ng�n Ch�y; 400 l�n-Qu�n C�ng ��i; 700 l�n-Thi�n Th�ch Tinh Th�ch; 1000 l�n-Qu�n C�ng Huy Ho�ng; 1300 l�n-T�y T�m Th�ch c�p 3; 1600 l�n-Luy�n L� Thi�t c�p 3; 1800 l�n-Thi�n M�n Kim L�nh; 2000 l�n-Thi�n Cang L�nh; \n Ch� �: Sau khi nh�n ph�n th��ng 2000 l�n, s� l�n �i�m h�a t�ch l�y c�ng d�n s� ���c l�m m�i, c� th� ti�p t�c b�t ��u t�ch l�y l�i t� ��u.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"Gh�p b�ng Ng� Th�i Th�n Th�ch (b�n � Ng� C�c)/combining_1_201207",
		"Gh�p Th�nh H�a v� V�ng/combining_2_201207",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name.."C�c h� mu�n ch�n c�ch th�c n�o �� gh�p Ng� Th�i Th�nh H�a v�y?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("Gh�p %d H�ng S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d L�c S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d Ho�ng S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d Lam S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh�p %d H�c S�c Th�nh H�a+%d Ng� Th�i Th�n Th�ch/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."1 Th�nh H�a b�t k�+1 Ng� Th�i Th�n Th�ch (b�n � Ng� C�c)=1 Ng� Th�i Th�nh H�a",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("Gh�p %d H�ng S�c Th�nh H�a+%d V�ng/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d L�c S�c Th�nh H�a+%d V�ng/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d Ho�ng S�c Th�nh H�a+%d V�ng/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d Lam S�c Th�nh H�a+%d V�ng /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh�p %d H�c S�c Th�nh H�a+%d V�ng/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."9 Th�nh H�a b�t k�+30 V�ng=1 Ng� Th�i Th�nh H�a",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbBody = "T�i h� ra 1 ch� s� (t� 1-100) �� c�c h� �o�n 5 l�n, s� l�n �o�n tr�ng c�ng �t th� ph�n th��ng c�ng l�n. S� l�n tham gia tr� ch�i m�i ng�y l� t�y �, nh�ng ch� ���c nh�n th��ng 3 l�n.";
	local tbSay = {
		"H�y b�t ��u �i /oly_begin_guess",
		"Nh�n ph�n th��ng l�n tr��c/oly_get_last_guess_award",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."һ���ۼƵ������ﵽ 6 �Σ����ɲμӰ������˳齱�:\n   ��ʽ������һ��1-9999֮������֣�\n   �콱���̣�ÿ��21:00������21:00-21:30�н������Ҫ������������н��Ǽǣ�ǰ10���Ǽǵ���ҿ��Ծ��ֽ���������21:30������콱��22:00�콱��������ʱ�����콱��\n   ������ÿ��1���������������н����콱����������һֱ�ۼ�ֱ�������н���������\n   ע�⣺�������ֵ�����Ч��";
	tbSay.msg = Activity_Ds_Name.."M�i ng�y s� l�n t�ch l�y �i�m h�a ��t ��n 6 l�n, c� th� tham gia ho�t ��ng r�t th��ng H�nh V�n: \n   H�nh th�c: t� 1-9999 nh�p v�o 1 con s�; \n   L�u tr�nh ph�n th��ng: 21:00 m�i t�i s� m� th��ng, 21:00-21:30 nh�ng ai tr�ng th��ng ph�i ��n ��y �� ��ng k�, 10 ng��i ch�i ��ng k� tr��c s� c� ph�n th��ng. Sau 21:30 c� th� nh�n th��ng, 22:00 k�t th�c nh�n th��ng, qu� th�i gian kh�ng th� nh�n th��ng. \n Ph�n th��ng: M�i ng�y 1 Thi�n Cang L�nh, trong ng�y kh�ng ai tr�ng th��ng (nh�n th��ng), th� ph�n th��ng s� ���c t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c. \n Ch� �: S� H�nh V�n c� hi�u l�c trong ng�y.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
--	local tbBody = "һ���ۼƵ������ﵽ 6 �Σ����ɲμӰ������˳齱���\n    Ŀǰ�ۻ�����Ϊ��<color=green>%d�������<color>��\n    ��������������ǣ�<color=green>%s<color>��\n    ���������������ǣ�<color=green>%d<color>��\n    ������ÿ��1���������������н����콱����������һֱ�ۼ�ֱ�������н���������";
	local tbBody = "M�i ng�y s� l�n t�ch l�y �i�m h�a ��t ��n 6 l�n, c� th� tham gia ho�t ��ng r�t th��ng H�nh V�n. \n Hi�n t�i t�ch l�y r�t th��ng l�: <color=green>%d Thi�n Cang L�nh<color>; \n S� H�nh V�n h�m nay l�: <color=green>%s<color>; \n S� H�nh V�n h�m nay c�a ng��i l�: <color=green>%d<color>; \n Ph�n th��ng: M�i ng�y 1 Thi�n Cang L�nh, trong ng�y kh�ng ai tr�ng th��ng (l�nh th��ng), ph�n th��ng s� ���c t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c. ";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho�t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh�p ch� s� may m�n c�a c�c h�");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --����ʱ��
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch� s� may m�n c�a c�c h� l� %d",nNum));
	else
		Msg2Player("B�y gi� kh�ng th� nh�p ch� s� may m�n , h�y quay l�i v�o ng�y mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"��ng �/sure_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name.."C� mu�n �i thu th�p Lam S�c v� L�c S�c Th�nh H�a kh�ng?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

--�Ǽ�
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--�콱
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C�c h� ch�a ��ng k� kh�ng th� nh�n ph�n th��ng");
	end
	--�콱
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end