function CheckXacThuc()
	do
		return 1	
	end
	
	local tbAllUser = LoadXacThuc();
	if ( not tbAllUser[GetAccount()]  ) then	
		return 0
	end	

	return 1	
end

function LoadXacThuc()
	local tbUser = {}
	local pf = openfile("data/xacthuc/data.txt", "r");
	if not pf then 			
			return {}
	end		
	
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		tbUser[str] = 1;
	end
	closefile(pf);
		
		
	
	return tbUser;
end