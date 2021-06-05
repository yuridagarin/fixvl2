Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N�n d�n T�ng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng��i ��u, b�t l�y ch�ng!");
		return 0;
	elseif sSubString == "N�n d�n Li�u" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng��i ��u, b�t l�y ch�ng!");
		return 0;
	end;
	local selTab = {
				"T�m ng��i kh�c gi�p �i/get_assistant",
				"Ta kh�ng tin/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>: C�n gi�p �� kh�ng? Ta c� th� gi�p ng��i t�m v�i tr�ng s� kh�e m�nh.",getn(selTab),selTab);
end;

function get_assistant()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	Talk(1,"","<color=green>"..sNpcName.."<color>: Xin l�i! L�nh ��nh thu� ch�a ���c tri�u t�p");
end;