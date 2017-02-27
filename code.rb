# Imagine you have recently written a new language for Annkissam 
# and collected all words into the Annkissam Dictionary. 
# Similar to the English language, words can be categorized 
# into nouns, verbs and articles. 
# Below is the Annkissam Dictionary:

# Nouns: "abcd", "c", "def", "h", "ij", "cde"

# Verbs: "bc", "fg", "g", "hij", "bcd"

# Articles: "a", "ac", "e"

# However, the rules for creating a sentence in the Annkissam 
# Language are very different. A valid sentence in the 
# Annkissam Language should:

# - have all its words present in the Annkissam Dictionary.

# - have a verb.

# - have a noun or have at least two articles.

# Your task is to write a sentence composer which will take a 
# string as an input and return all possible valid sentences. 
# This composer keeps the characters of the string in the same 
# order, while inserting at most one space between characters 
# as necessary, to create valid words and a valid sentence.
		
		# note: important, keep order, but parse for valid words

# For your convenience, we have provided some sample inputs 
# and outputs.

# Input = "abcdefg", should return the following list:
# [
# "a bc def g",
# "a bcd e fg",
# "abcd e fg"
# ]

# Input = "abcc", should return the following list:
# ["a bc c"]

# Input = "abcd", should return the following list:
# []

# Note: Make sure to list all (if any) assumptions you make. 

# Assumptions: a sentence should either have 3 or 4 words based on the examples and no rule 

def all_possible_word_combos(input)
	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
	verbs = ["bc", "fg", "g", "hij", "bcd"]
	articles = ["a", "ac", "e"]
	all = nouns + verbs + articles
	
	temp_array_for_combo = []
	all_valid_sentences_based_on_input = []

	for word in all do 
		if input.include?(word)
			temp_array_for_combo << word
		end
	end
	# how many words can be in sentence?
	# we dont have any rules for word count in a sentence, only examples are 3 or 4 word sentences
	temp_array_test_validity = temp_array_for_combo.combination(4).to_a + temp_array_for_combo.combination(3).to_a   

	for sentence in temp_array_test_validity do 
		# sort the characters 
		combined_sentence = sentence.join.chars.sort
		combined_sentence = combined_sentence.join
		# and check to match with input
		if combined_sentence == input
			all_valid_sentences_based_on_input.push(sentence)
		end
	end

	for sentence in all_valid_sentences_based_on_input do 
		sentence = sentence.sort! { |a,b| a <=> b }
	end
	return all_valid_sentences_based_on_input
end

p all_possible_word_combos("abcdefg")
test_case_1 = all_possible_word_combos("abcdefg")
# show_all_valid_sentences("abcdefg")
# expect =>
# [
# "a bc def g",
# "a bcd e fg",
# "abcd e fg"
# ]

puts " "
p all_possible_word_combos("abcc")
test_case_2 = all_possible_word_combos("abcc")

# show_all_valid_sentences("abcc")
# expect =>
# ["a bc c"]

puts " "
p all_possible_word_combos("abcd")
test_case_3 = all_possible_word_combos("abcd")

all_possible_word_combos("abcdg")
test_case_4 = all_possible_word_combos("abcdg")

# p test_case_1 
# [["a", "bc", "def", "g"], ["a", "bcd", "e", "fg"], ["abcd", "e", "fg"]]
# p test_case_2 
# [["a", "bc", "c"]]
# p test_case_3
# []

def valid_sentence?(sentence_array)
	# input is expected to be array
	# method tests rules. Does the array have 
		# 1 verb or more
		# 1 noun or 2 articles minimum
		# are all the words in the dictionary
	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
	verbs = ["bc", "fg", "g", "hij", "bcd"]
	articles = ["a", "ac", "e"]
	sentence_counter = 0 

	if sentence_array.class == Array
		# continue
		for sentence in sentence_array do 

			# are all the words valid in the dictionary?	
			all = nouns + verbs + articles
			for word in sentence do 
				if all.include?(word)
					# p "this word is valid"
				else
					p "#{word} is not a valid word in the dictionary"
					return false
				end
			end
			# p "all words in sentence ar valid words.."
			
			# does it have a verb?
			v = (sentence & verbs)
			if v.count > 0
				# p "sentence at index #{sentence_counter} has at least 1 verb #{v}"

				# does it have 1 noun? or if not, does it have 2 articles?
				n = (sentence & nouns)

				if n.count > 0
					# p "sentence at index #{sentence_counter} has a noun #{n}"

				else
					# 2 articles?
					a = (sentence & articles)
					if a.count >= 2
						# p "sentence at index #{sentence_counter} has no noun, but 2 articles #{a}"
					else
						return false
					end
				end
			else
				p "false sentence, does not contain a verb #{sentence}"
				return false
				# this sentence does not have a verb
			end
			sentence_counter += 1
		end
		puts ""
		puts "every sentence is valid! \n #{sentence_array}"
		return true
	else
		p "the input is not valid, needs to be an array"
		return false
		# remove this from the array
		# will have to trick the system
	end
	
end
valid_sentence?(test_case_1)
valid_sentence?(test_case_2)
valid_sentence?(test_case_3)
# expect true