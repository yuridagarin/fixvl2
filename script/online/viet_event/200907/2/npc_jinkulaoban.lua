--=======================================================
--create by baiyun 2009.5.31
--describe:Խ�ϰ�7�·ݻ֮��ҹ�ݣ�����ϰ�ű�
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Ch� Ng�n Kh�: Ta chuy�n ph� tr�ch vi�c ��i Ti�u Nh� � th�nh ��ng Ti�n V�ng. Trong kho�ng th�i gian t� ng�y <color=red>19-06-2009 ��n 24:00 19-07-2009<color>, ��ng ��o d�ng Ti�u Nh� � ��i l�y ��ng Ti�n V�ng v�i gi� tr� quy ��i nh� sau: 1 Ti�u Nh� � = 1 ��ng Ti�n V�ng. L�u �: sau th�i gian n�y, Ti�u Nh� � s� kh�ng th� s� d�ng ���c n�a.",
				2,
				"Ta mu�n ��i Ti�u Nh� � th�nh ��ng Ti�n V�ng./GetTongQian",
				"T�i h� ch� gh� ngang!/end_dialog");
	else
		Say("Ho�t ��ng n�y �� k�t th�c!",0)
	end
end

--��С���⻻��ͭǮ
function GetTongQian()
	local nCount = GetItemCount(2, 1, 30030);
	if nCount == 0 then
		Talk(1, "", "Tr�n h�nh trang kh�ng c� Ti�u Nh� �");
		return
	end
	AskClientForNumber("ConfirmGetTongQian",1,nCount,"Nh�p s� l��ng c�n ��i")
end

function ConfirmGetTongQian(nCount)
	if nCount == 0 then
		return
	end
	if GetItemCount(2, 1, 30030) < nCount then
		Talk(1, "", "S� l��ng ti�u nh� � kh�ng �� �� ��i"..nCount.." ��ng ti�n v�ng!");
		return
	end
	if gf_Judge_Room_Weight(2, 10, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30030, nCount) == 1 then
		gf_SetLogCaption("Hoat dong da thao tro lai");
		gf_AddItemEx({2, 1, 30094, nCount}, "��ng Ti�n V�ng");
		WriteLogEx("Hoat dong thang 6","D� Th�o Tr� l�i	",1,"��ng Ti�n V�ng");
		gf_SetLogCaption("");
	end
end

--�����Ի�
function end_dialog()
end