local CYK = {}

--CRIAÇÃO DA GRAMÁTICA
function CYK:new()
	local gram = {}
	gram.esq_rules = {}
	gram.dir_rules = {}
	gram.__index = self
	setmetatable(gram, gram)
	return gram
end

--CRIAÇÃO DAS REGRAS DA GRAMÁTICA
function CYK:newRule(left, right)
	self.esq_rules[left] = self.esq_rules[left] or {}
	self.dir_rules[right] = self.dir_rules[right] or {}
	table.insert(self.esq_rules[left], right)	
	table.insert(self.dir_rules[right], left)	
end

--APLICAÇÃO DAS REGRAS
function CYK:parse(word)
	local layers = {}
	
	--> Unit transformations
	layers[1] = {}
	
	for token in word:gmatch("%a") do
		if not self.dir_rules[token] then
			return false
		end
		local set = {}
		for i, rule in ipairs(self.dir_rules[token]) do
			table.insert(set, rule)
		end
		table.insert(layers[1], set)
		io.write(token..'\t')
	end
	
	io.write("\n")
	for i, set in ipairs(layers[1]) do
		for j, rule in ipairs(set) do
			io.write(rule..",")
		end
		io.write('\t')
	end
	print()
	
	for level = 2, #layers[1] do
		layers[level] = {}
		for i = 1, #layers[level-1]-1 do
			local possibilities = {}
			for l = 1, level-1 do		
				for f, first in ipairs(layers[l][i]) do
					for s, second in ipairs(layers[level-l][i+l]) do
						table.insert(possibilities, first..second)
					end
				end
			end
			layers[level][i] = {}
			for a, attempt in ipairs(possibilities) do
				if self.dir_rules[attempt] then
					for r, rule in ipairs(self.dir_rules[attempt]) do
						local put = true
						for t, test in ipairs(layers[level][i]) do
							if test == rule then
								put = false
								break
							end
						end
						if put then
							table.insert(layers[level][i], rule)
						end
					end
				end
			end
		end
		for i, set in ipairs(layers[level]) do
			for j, rule in ipairs(set) do
				io.write(rule..",")
			end
			io.write('\t')
		end
		print()
		
	end
	return #layers[#layers[1]][1] ~= 0
end

return CYK