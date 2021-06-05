--file name:qiaonv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ���ŮNPC�ű�
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%y%m%d"));
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		local selTab = {
				"Ta mu�n nh�n Tinh Tinh ��a ��/get_atlas",
				"Ta mu�n v�o d�i Ng�n H�/go_to_galaxy",
				"Ta mu�n l�nh H�ng bao/get_award",
				"Ta mu�n t�m hi�u ho�t ��ng/know_detail",
				"Ta ch� ��n xem/nothing",
				}
		if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
			tremove(selTab,3);
		end;
		--Say("<color=green>��Ů<color>��ʱֵ���³���ȵ�Żᣬ�պ�һ�����ӻ�Ϊ������׹���˼䣬���������",getn(selTab),selTab);
	else	--�����ӵ�ͼ
		local selTab = {
				"Phi�n X�o N� ��a ta v�/leave_galaxy",
				"Ta ��i th�m m�t l�t/nothing",
				}
		Say("V�o ng�y 7 th�ng 7 c�u � Th��c b�c sang v�a l�c d�i Ng�n H� h�a th�nh tr�n m�a sao b�ng r�i xu�ng nh�n gian, th�t l� m�t c�nh t��ng tuy�t ��p!",getn(selTab),selTab);
	end;
end;

function get_award()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
		return 0;
	end;
	if GetTask(TASK_QIAONV_AWARD_DATE) >= nDate then
		Talk(1,"","Xin l�i! H�m nay b�n �� nh�n ph�n th��ng n�y r�i");
		return 0;
	end;
	Talk(1,"","Ch�t qu� m�n, xin h�y nh�n l�y.");
	SetTask(TASK_QIAONV_AWARD_DATE,nDate);
	ModifyGoldenExp(300000);
	Msg2Player("B�n nh�n ���c 300000 �i�m s�c kh�e");
	ModifyReputation(10,0);
end;

function know_star_count()
	local nMapID = GetWorldPos()
	Talk(1,"main","D�i Ng�n H� hi�n c� <color=yellow>"..GetMapTaskTemp(nMapID,4).."<color> ng�i sao. Ch� c�n s� l��ng ng�i sao ��t <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng�i, Ng�u Lang v� Ch�c N� c� th� g�p nhau � d�i Ng�n H�, m�i ng��i h�y c� g�ng th�p s�ng c�ng nhi�u ng�i sao!");
end;

function get_atlas()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_GOTATLAS_DATE) >= nDate then
		Talk(1,"","H�m nay b�n �� nh�n"..t7XiItem["atlas"][1].."1 l�n r�i.");
		return 0;
	end;
	SetTask(TASK_GOTATLAS_DATE,nDate);
	local nRetCode = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
	ModifyGoldenExp(100000);
	Msg2Player("B�n nh�n ���c 100000 �i�m s�c kh�e");
	ModifyReputation(5,0);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 quy�n "..t7XiItem["atlas"][1]);
	else
		WriteLog("[L�i ho�t ��ng Th�t T�ch]:"..GetName().."L�i khi nh�n Tinh Tinh ��a ��, tr� quay l�i ch� l�nh AddItem:"..nRetCode);
	end;
end;

function go_to_galaxy()
	SetLogoutRV(1);	--��Ϊ����������
	SetFightState(0);	--��ƽ״̬
	local nMapID = GetWorldPos();
	CleanInteractive();
	NewWorld(965+floor(nMapID/100),1628,3298);
end;

function know_detail()
	Talk(3,"know_detail_1","Ho�t ��ng l�n n�y chia l�m 4 ph�n. <enter><color=yellow>Ph�n 1: M�i t�i c� th� ��n Th�nh ��, Bi�n Kinh, Tuy�n Ch�u<color> t�m <color=yellow>X�o N�<color> g�n D� T�u nh�n <color=yellow>1 Tinh Tinh ��a ��<color>. S� d�ng Tinh Tinh ��i �� c� th� nh�n ���c t�a ��, ��n t�a �� ch� ��nh c�a ��a �� ch� ��nh s� d�ng Tinh Tinh ��a �� c� th� nh�n ���c ng�i <color=yellow>Sao b�ng<color>",
					"<color=yellow><enter>Ph�n 2 Th�p s�ng ng�i sao: <color><enter> Sau khi ng��i ch�i nh�n ���c Sao b�ng c� th� t�m <color=yellow>X�o N�<color> �� v�o d�i Ng�n H�, trong d�i Ng�n H� s� d�ng Sao b�ng s� xu�t hi�n 1 ng�i sao.",
					"<color=yellow><enter>Ph�n 3 Ng�u Lang, Ch�c N� t��ng ng�: Sau khi <color><enter>s� l��ng ng�i sao<color=yellow> tr�n <color>d�i Ng�n H� ��t ��n <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng�i, Ng�u Lang, Ch�c N� s� g�p nhau l�c <color=yellow>9 gi� t�i<color>, Ng�u Lang, Ch�c N� s� b�n nhau trong <color=yellow>15 ph�t<color>.");
end;

function know_detail_1()
	Talk(3,"main","<color=yellow><enter>Ph�n 4 ��i ph�n th��ng: <color><enter>Ng��i ch�i ch�a nh�n ph�n th��ng h�m �� v� th�p s�ng c�c ng�i sao c� th� ��i tho�i v�i <color=yellow>Ng�u Lang ho�c Ch�c N�<color> nh�n ph�n th��ng. Ng��i ch�i �� th�p s�ng sao c�a h�m �� c� th� ��n g�p <color=yellow>X�o N�<color> nh�n 1 ph�n th��ng nh�.",
					"Th�i gian ho�t ��ng l� t� <color=yellow>28/7 ��n 6/8 (bao g�m c� 2 ng�y n�y)<color>.",
					"Ch� �: T�m h�o h�u c�ng tham gia t� ��i s� c� �i�u b�t ng� x�y ra!");
end;

function leave_galaxy()
	local nMapID = GetWorldPos();
	SetLogoutRV(0);
	if nMapID == 966 then
		NewWorld(100,1445,2950);
	elseif nMapID == 967 then
		NewWorld(200,1412,2853);
	elseif nMapID == 968 then
		NewWorld(300,1776,3541);
	else
		--Msg2Player("ϵͳ�������ͼ����̳��ϵGM��лл���ĺ�����");
		WriteLog("[L�i ho�t ��ng Th�t T�ch]:"..GetName().."L�c r�i kh�i map d�i Ng�n H�, IP map nh�n ���c sai, tr� s� l�:"..nMapID);
		NewWorld(100,1445,2950);	--Ĭ�ϴ���Ȫ��
	end;
end;

function know_time()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." gi� "..nMin.." Ph�t "
	Talk(1,"main","Th�i gian hi�n t�i l� <color=yellow>"..sTimeLeft.."<color>. V�o kho�ng <color=yellow>21 gi�<color> m�i t�i Ng�u Lang v� Ch�c N� s� g�p nhau, m�i ng��i h�y nh� r� th�i gian.");
end;

function get_award_by_atlas()
	local nAtlasCount = GetItemCount(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4])
	if nAtlasCount <= 0 then
		Talk(1,"","B�n kh�ng c� Tinh Tinh ��a ��?");
		return 0;
	end;
	local selTab = {
				"Ta mu�n ��i ngay/#get_award_confirm(1,"..nAtlasCount..")",
				"Sau n�y h�y ��i/nothign",
				}
	Say("B�n c� t�ng c�ng <color=yellow>"..nAtlasCount.."<color> c�i"..t7XiItem["atlas"][1]..", c� th� ��i l�y <color=yellow>"..(20*nAtlasCount).."<color> v�n �i�m s�c kh�e v� <color=yellow>"..(5*nAtlasCount).."<color> �i�m danh v�ng. B�n mu�n ��i l�y ph�n th��ng?",getn(selTab),selTab)
end;

function get_award_by_star()
	local nStarCount = GetItemCount(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4])
	if nStarCount <= 0 then
		Talk(1,"","B�n kh�ng c� ng�i sao?");
		return 0;
	end;
	local selTab = {
				"Ta mu�n ��i ngay/#get_award_confirm(2,"..nStarCount..")",
				"Sau n�y h�y ��i/nothign",
				}
	Say("B�n c� t�ng c�ng <color=yellow>"..nStarCount.."<color> c�i"..t7XiItem["star"][1]..", c� th� ��i l�y <color=yellow>"..(30*nStarCount).."<color> v�n �i�m s�c kh�e v� <color=yellow>"..(5*nStarCount).."<color> �i�m danh v�ng. B�n x�c nh�n mu�n ��i ph�n th��ng?",getn(selTab),selTab)			
end;

function get_award_confirm(nType,nCount)
	if nType == 1 then
		if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],nCount) == 1 then
			ModifyGoldenExp(200000*nCount);
			Msg2Player("B�n nh�n ���c "..(20*nCount).."v�n �i�m kinh nghi�m.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."D�ng th�"..nCount.."t�m Tinh Tinh ��a �� ��i ���c ph�n th��ng.");
		end;
	else
		if DelItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],nCount) == 1 then
			ModifyGoldenExp(300000*nCount);
			Msg2Player("B�n nh�n ���c "..(30*nCount).."v�n �i�m kinh nghi�m.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."D�ng th�"..nCount.."t�m Tinh Tinh ��i ���c ph�n th��ng.");
		end;
	end;
end;
