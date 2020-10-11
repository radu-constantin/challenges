class InvalidCodonError < StandardError ;end


class Translation
	AMINOACIDS = {
		['AUG'] => 'Methionine',
		['UUU', 'UUC'] => 'Phenylalanine',
		['UUA', 'UUG'] => 'Leucine',
		['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
		['UAU', 'UAC'] => 'Tyrosine',
		['UGU', 'UGC'] => 'Cysteine',
		['UGG'] => 'Tryptophan',
		['UAA', 'UAG', 'UGA'] => 'STOP'
	}

	def self.of_codon(codon)
		AMINOACIDS[AMINOACIDS.keys.select{|key|key.include?(codon)}.flatten]
	end

	def self.of_rna(strand)
		rna_list = strand.scan(/.../)
		amino = []
		rna_list.each do |rna|
			raise InvalidCodonError if of_codon(rna) == nil
			break if of_codon(rna) == 'STOP'
				 amino << of_codon(rna)
			end
		 amino
	end
end
