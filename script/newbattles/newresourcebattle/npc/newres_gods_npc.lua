-- Created by TuanNA5
-- 31/05/2010
-- T�i nguy�n chi�n

function newres_god_talk()
	Say(szNpcName.."Ch� c�n gi�i ���c c�u �� c�a "..szNextNpc..", ta s� l�m b�n v�i ng��i! Nh�ng ng��i ch� c� th� ch�n 1 trong s� b�n ta m� th�i!",2,"Ta ��ng �/say_yes","Ta bi�t r�i/nothing")
end

function say_yes()
	Talk(1,"",szNpcName.."Ng��i ch�a �� �i�u ki�n v��t qua th� th�ch n�y!")
end

function nothing()
end