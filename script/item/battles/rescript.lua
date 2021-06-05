-- Ӣ���� ��������Ҵ��͵����Źش�ս������

Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");

function OnUse()
	main()
end

function main()
CleanInteractive()	--�Ͽ�����
	local W,X,Y = GetWorldPos();

	local nMapId = W;
	tbFORBIDDEN_MAP = { };	-- ���������ͼ

	if( getn(tbFORBIDDEN_MAP) ~= 0 ) then
		for j = 1, getn(tbFORBIDDEN_MAP) do
			if ( nMapId == tbFORBIDDEN_MAP[j] ) then
				Msg2Player("B�n kh�ng th� s� d�ng ��o c� n�y � ��y.");
				return 1;
			end
		end
	end
	
	if( getn(tbBATTLEMAP) ~= 0 ) then
		for i = 1, getn(tbBATTLEMAP) do 
			if ( nMapId == tbBATTLEMAP[i] ) then
				Msg2Player("B�n kh�ng th� s� d�ng ��o c� n�y � ��y.");
				return 1;
			end
		end
	end
	
	if (nMapId > 604 and nMapId ~= 806 and nMapId ~= 808) then
		Msg2Player("B�n kh�ng th� s� d�ng ��o c� n�y � ��y.");
		return 1
	end

	if( HEROCARD == 1 ) then
		Say ( "                             <color=red>��i T�ng anh h�ng l�nh<color><enter><enter><enter> Phe c� ng��i ��ng s� chi�m �u th� nh�ng �i�m chi�n c�ng nh�n ���c s� �t �i.<enter> B�n mu�n ��n b�o danh phe n�o?", 3, "                           V�o �i�m b�o danh phe T�ng/ToSong", "                           T�m hi�u Nh�n M�n quan/bt_onbattleinfo", "                           Xu�t...Ta l� ��o binh./Cancel" );
	else
		Say ( "                             <color=red>��i Li�u anh h�ng l�nh<color><enter><enter><enter> Phe c� ng��i ��ng s� chi�m �u th� nh�ng �i�m chi�n c�ng nh�n ���c s� �t �i.<enter> B�n mu�n ��n b�o danh phe n�o?", 3, "                           V�o �i�m b�o danh phe Li�u/ToLiao",  "                           T�m hi�u Nh�n M�n quan/bt_onbattleinfo", "                           Xu�t...Ta l� ��o binh./Cancel" );
	end
	-- �ո�Ҫ���ˣ�Ϊ�˾�����ʾ
	return 1;

end

function ToSong()	-- �����η�������
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng��i ch�a gia nh�p m�n ph�i n�o! Chi�n tr��ng r�t kh�c li�t! H�c xong v� ngh� h�y quay l�i tham chi�n!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi�n tr��ng r�t kh�c li�t! Gia nh�p m�n ph�i, h�c xong v� ngh� h�y quay l�i tham chi�n!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "��n �i�m b�o danh Nh�n M�n quan chi�n tr��ng s� c�p phe T�ng."
	elseif ( GetLevel() >= 60 ) then
		str = "��n �i�m b�o danh Nh�n M�n quan chi�n tr��ng cao c�p phe T�ng."
	end
	if (DelItem( 2, 0, 107, 1) == 1) then
		NewWorld( bt_getsignpos( 1 ));
		SetFightState(0);
--		UseScrollEnable(0); -- ��������ʹ�ûسǷ�
		Msg2Player( str );
	end
end

function ToLiao()	-- �����ɷ�������
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng��i ch�a gia nh�p m�n ph�i n�o! Chi�n tr��ng r�t kh�c li�t! H�c xong v� ngh� h�y quay l�i tham chi�n!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi�n tr��ng r�t kh�c li�t! Gia nh�p m�n ph�i, h�c xong v� ngh� h�y quay l�i tham chi�n!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "��n �i�m b�o danh Nh�n M�n quan chi�n tr��ng s� c�p phe Li�u."
	elseif ( GetLevel() >= 60 ) then
		str = "��n �i�m b�o danh Nh�n M�n quan chi�n tr��ng cao c�p phe Li�u."
	end
	if (DelItem( 2, 0, 108, 1 ) == 1) then
		NewWorld( bt_getsignpos( 2 ));
		SetFightState(0);
--		UseScrollEnable(0); -- ��������ʹ�ûسǷ�
		Msg2Player( str );
	end
end


function Cancel()
end