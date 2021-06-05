#�Ƚϼ򵥵��������

--author:libla
--data:2010-9-29

--�÷������ɻ���
--a = class()
--������(֧�ֶ�������)��
--c = class(a, b, ...)
--��������
--b = a.new()
--��Ҫֱ�Ӱ�class���������ı�������ʹ��


function class(...)
	local base_type = {}
	if getn(arg) > 0 then
		base_type.__super = arg
	end
	if not type_tag then
		type_tag = newtag()
		settagmethod(type_tag, "index",
		function(table, index)
			if not table.__super or type(table.__super) ~= "table" then
				return
			end
			for _,super in table.__super do
				if super[index] then
					table[index] = super[index]
					return super[index]
				end
			end
		end)
	end
	settag(base_type, type_tag)
	base_type.new = function()
		local base_type = %base_type
		local obj = {}
		local t = newtag()
		settagmethod(t, "index",
		function(table, index)
			return %base_type[index]
		end)
		settag(obj, t)
		return obj
	end
	return base_type
end