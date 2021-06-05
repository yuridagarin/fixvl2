function OnUse()
	local selTab = {
			"Online t�ng qu�/#spring_info(1)",
			"Ph�c Th�n ph�t h�ng bao/#spring_info(2)",
			"M�a l�n/#spring_info(3)",
			"�o�t b�o r��ng/#spring_info(4)",
			"Heo v�ng �em ��n c�t t��ng/#spring_info(5)",
			"Ch�c t�t/#spring_info(6)",
			"N�m m�i m�c �� m�i./#spring_info(7)",
			"Ni�n th� l�m th� c��i/#spring_info(8)",
			"R�i kh�i/nothing"
			}
	
	Say("N�m m�i l�i ��n, c� r�t nhi�u ho�t ��ng cho m�i ng��i tham gia. Nh�p chu�t v�o t�n ho�t ��ng �� xem chi ti�t.",getn(selTab),selTab);
end
function spring_info(nType)

local selTab = {
	{
	"    Ng��i ch�i c�p 10 tr� l�n, m�i ng�y c� th� ��n g�p L� Quan � Bi�n Kinh �� nh�n t�i Ti�u ph�c Kim Tr�. M�i ng�y ch� nh�n ���c 1 l�n.",
		},
	
	{
	"    Ng��i ch�i t� c�p 10 tr� l�n v�o l�c 10:00, 14:00, 20:00 ��n Ph�c Th�n �� nh�n Ti�u H�ng Bao. M�i ng�y Ph�c Th�n ch� ph�t 100 c�i, �u ti�n cho nh�ng ng��i ��n tr��c (m�i ng�y ch� nh�n ���c 1 l�n )",
		},
		
	{
	"    Trong kho�ng th�i gian M�a l�n, Ni�n Th� s� xu�t hi�n � 3 th�nh th� ch�nh. Ng��i ch�i ��nh b�i ti�u ni�n th�, c� th� nh�n ���c Kim Tr� ��i H�ng Bao (c�p 10 tr� l�n m�i c� th� tham gia)",
		},
		
	{
	"    M�i ng�y t� 18:00 tr�n ��nh Hoa S�n s� xu�t hi�n m�t b�o r��ng. Ng��i ch�i (�� gia nh�p m�n ph�i) ��n g�p Ph�c Th�n, s� ���c Ph�c Th�n ��a v�o Hoa S�n ho�c c� th� mua Hoa S�n Th�n ph�. Khi v�o Hoa S�n tr�n ��a, b�n s� t� ��ng chuy�n sang tr�ng th�i PK v� �� s�t. Trong th�i gian 10 ph�t b�n d�ng h�t kh� n�ng h� ��i ph��ng �� �o�t b�o r��ng.",
		},
		
	{
	"    Kim Tr� mang ��n may m�n: Trong ph�n th��ng ho�t ��ng t�n ni�n, may m�n b�n c�ng c� th� nh�n ���c Tr� b�o b�o. S� d�ng b�n s� g�i ���c m�t ch� heo xinh x�n v� m�t quy�n  B�o �i�n.",
		},
	
	{
	"    Ch�c t�t: Hai ng��i ch�i ��ng trong m�t ph�m vi nh�t ��nh. Ng��i c�p nh� cung k�nh ch�c t�t ng��i c�p cao th� s� nh�n ���c m�t trong 3 ph�n th��ng sau: �i�m s�c kh�e, �i�m kinh nghi�m ho�c t� 10 ��n 20 �i�m danh v�ng. Ph�n th��ng n�y ph� thu�c v�o ��ng c�p c�a 2 b�n. M�i ng�y ng��i ch�i c�p nh� c� th� ch�c t�t ng��i c�p cao t�i �a 3 l�n, nh�ng ng��i c�p cao th� kh�ng b� gi�i h�n b�i s� l�n ���c ch�c t�t. (Ho�t ��ng n�y ch� d�nh cho ng��i ch�i t� c�p 10 tr� l�n)",
		},
		
	{
	"    Khi m� qu� Kim Tr� ( Kim Tr� ti�u ph�c, Kim Tr� ti�u h�ng bao, Kim Tr� ��i h�ng bao), s� nh�n ���c ph�n th��ng trang ph�c Ngo�i trang t��ng �ng.",
		},
	{
	"    Khi m� qu� Kim Tr� (Kim Tr� ti�u ph�c, Kim Tr� ti�u h�ng bao, Kim Tr� ��i h�ng bao) s� c� c� may nh�n ���c ni�n th�. [Ch� �: ni�n th� ch� s� d�ng trong 1 ng�y ( k� t� khi ng�i l�n). H�t th�i gian ni�n th� s� bi�n m�t!]",
		},

	};

	Say("N�m m�i l�i ��n, c� r�t nhi�u ho�t ��ng cho m�i ng��i tham gia. Nh�p chu�t v�o t�n ho�t ��ng t��ng �ng �� xem chi ti�t!  \n"..selTab[nType][1],2,	"tr� l�i/OnUse",
	"R�i kh�i/nothing");

end
function nothing()
end

