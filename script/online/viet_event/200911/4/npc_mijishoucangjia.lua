--=============================================
--create by baiyun 2009.10.15
--describe:Խ�ϰ�11�·ݻ �ؼ��ղؼ�NPC�ű��ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
g_szNpcName = "<color=green>Nh� S�u T�m M�t T�ch: <color>";
FILE_NAME = "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua";


function main()
	Say(g_szNpcName.."Trong th�i gian t� ng�y 06-11-2009 ��n 06-12-2009. ��ng ��o c� th� s� d�ng 3 cu�n T� Linh Chi�n � Ph� (lo�i 2 ph� l�c) �� n�ng c�p th�nh T� Linh Chi�n � Ph� (lo�i 4 ph� l�c)".."<enter><color=red>��i hi�p ph�i thi�t ��t m�t kh�u h�nh trang v� m� kh�a h�nh trang m�i c� th� n�p<color>",
			2,
			"Ta mu�n n�ng c�p m�t t�ch/get_miji",
			"T�i h� ch� ti�n gh� ngang./nothing"
	);
end


function get_miji()
	PutinItemBox("N�ng c�p m�t t�ch" ,9 , "��i hi�p ph�i b� 3 t� linh chi�n � ph� v� 6 tu ch�n y�u quy�t �� n�ng c�p th�nh t� linh chi�n � ph� (4 ph� l�c). C�c h� x�c nh�n mu�n c�p nh�t?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if (genre ~= 0 or detail ~= 107 or particular ~= 159) and (genre ~= 2 or detail ~= 0 or particular ~= 554) then
		Talk(1, "", g_szNpcName.."Ch� c� th� b� v�o t� linh chi�n � ph� ho�c tu ch�n y�u quy�t.");
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= 9 then		-- ������
		return 0;
	end
	if get_item_count(t, 0, 107, 159) ~= 3 or get_item_count(t, 2, 0, 554) ~= 6 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng�n l��ng tr�n ng��i kh�ng ��");
		return 0;
	end
	
	local nResult = 1;
	for i = 1, getn(t) do
		local nCount = 0;
		if t[i][4] == 159 then
			nCount = -1;
		else
			nCount = 1;
		end
		if DelItemByIndex(t[i][1], nCount) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 and Pay(1000000) == 1 then
		--������ؼ�
		gf_AddItemEx({0, 107, 162, 1}, "T� Linh Chi�n � Ph�");
		WriteLogEx("Hoat dong thang 11","n�ng c�p",1,"T� Linh Chi�n � Ph�")
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function nothing()

end