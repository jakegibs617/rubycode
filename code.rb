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
		# assumption: this means no nonsense words

# - have a verb.
		# assumption: any valid sentence must have a verb, or 
		# more than one verb

# - have a noun or have at least two articles.
		# assumption: a noun or 2 articles

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

# def single_char_words(input)
# 	single_char_array = input.split("")
# 	return single_char_array
# end
# # p single_char_words("abcdef")
# 	# ["a", "b", "c", "d", "e", "f", "g"]

# def double_char_words(input)
# 	double_char_array = []
# 	single_char_array = single_char_words(input)
# 	single_char_array.each_with_index do |item, index|
# 		string = ""
# 	  	if single_char_array.length > index + 1
# 		  	string.concat(item)
# 	  		string.concat(single_char_array[index + 1 ]) 
# 	  	end
# 	  	double_char_array << string
# 	  	double_char_array.delete("")
# 	end
# 	return double_char_array
# end
# # print double_char_words("abcdef")
# # ["ab", "bc", "cd", "de", "ef", "fg"]

# def triple_char_words(input)
# 	triple_char_array = []
# 	single_char_array = single_char_words(input)
# 	single_char_array.each_with_index do |item, index|
# 		string = ""
# 	  	if single_char_array.length > index + 2
# 		  	string.concat(item)
# 	  		string.concat(single_char_array[index + 1 ]) 
# 	  		string.concat(single_char_array[index + 2 ]) 
# 	  	end
# 	  	triple_char_array << string
# 	  	triple_char_array.delete("")
# 	end
# 	return triple_char_array	
# end
# # print triple_char_words("abcdef")
# # ["abc", "bcd", "cde", "def", "efg"]

# def quad_char_words(input)
# 	quad_char_array = []
# 	single_char_array = single_char_words(input)
# 	single_char_array.each_with_index do |item, index|
# 		string = ""
# 	  	if single_char_array.length > index + 3
# 		  	string.concat(item)
# 	  		string.concat(single_char_array[index + 1 ]) 
# 	  		string.concat(single_char_array[index + 2 ]) 
# 	  		string.concat(single_char_array[index + 3 ]) 
# 	  	end
# 	  	quad_char_array << string
# 	  	quad_char_array.delete("")
# 	end
# 	return quad_char_array	
# end
# # print quad_char_words("abcdef")
# # ["abcd", "bcde", "cdef", "defg"]

# def find_duplicates_single_array(input)
# 	single_char_array = single_char_words(input)
	
# 	# make the hash default to 0 so that += will work correctly
# 	hash = Hash.new(0)

# 	# iterate over the array, counting duplicate entries
# 	single_char_array.each do |v|
# 	  hash[v] += 1
# 	end

# 	return hash 
# end
# # p find_duplicates_single_array("abcdefgg")
# # {"a"=>1, "b"=>1, "c"=>1, "d"=>1, "e"=>1, "f"=>1, "g"=>2}

# def all_possible_words(input)
# 	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
# 	verbs = ["bc", "fg", "g", "hij", "bcd"]
# 	articles = ["a", "ac", "e"]

# 	single_char_array = single_char_words(input)

# 	all_possible_groupings = single_char_words(input) + double_char_words(input) + triple_char_words(input) + quad_char_words(input)
# 	# print all_possible_groupings
# 	# ["a", "b", "c", "d", "e", "f", "g", "ab", "bc", "cd", "de", "ef", "fg", "abc", "bcd", "cde", "def", "efg", "abcd", "bcde", "cdef", "defg"]
	
# 	valid_nouns = all_possible_groupings & nouns
# 	# print valid_nouns
# 	# ["c", "cde", "def", "abcd"]

# 	valid_verbs = all_possible_groupings & verbs
# 	# print valid_verbs
# 	# ["g", "bc", "fg", "bcd"]
	
# 	valid_articles = all_possible_groupings & articles
# 	# print valid_articles
# 	# ["a", "e"]

# 	all_possible_words = valid_articles + valid_verbs + valid_nouns
# 	# ["a", "e", "g", "bc", "fg", "bcd", "c", "cde", "def", "abcd"]
	
# 	return all_possible_words
# end
# # p all_possible_words("abcdefg")
# # ["a", "e", "g", "bc", "fg", "bcd", "c", "cde", "def", "abcd"]

# def return_verb(input)
# 	verbs = ["bc", "fg", "g", "hij", "bcd"]

# 	# step 1: does this sentence have a verb?
# 		# if so, where is it? and what leters are remaining?

# 	# valid_verbs is the array of the verbs in the input
# 	# for each verb what does the remainder of the input say

# 	# we should make sure to capture any duplicates (can polish later)
# 	# find_duplicates_single_array(input) 

# 	# it needs at least one verb, so if we find it in single, stop 
# 	# and move on to capture any nouns left
# 	# store the verb to bring back later
# 	has_verb = false
# 	until has_verb == true do


# 		valid_verb = single_char_words(input) & verbs
# 		if valid_verb.count > 0 
# 			return valid_verb
# 		end

# 		# assuming no single letter verbs
# 		valid_verb = double_char_words(input) & verbs
# 		if valid_verb.count > 0
# 			return valid_verb
# 		end


# 		# assuming no double letter verbs
# 		valid_verb = triple_char_words(input) & verbs
# 		if valid_verb.count > 0
# 			return valid_verb
# 		end
# 	end
# end
# # returns one verb, of either 1, 2, or 3 chars

# def return_noun(input)
# 	nouns = ["abcd", "c", "def", "h", "ij", "cde"]

# 	return_noun = false
# 	until return_noun == true do


# 		valid_noun = single_char_words(input) & nouns
# 		if valid_noun.count > 0 
# 			return valid_noun
# 		end

# 		# assuming no single letter nouns
# 		valid_noun = double_char_words(input) & nouns
# 		if valid_noun.count > 0
# 			return valid_noun
# 		end

# 		# assuming no double letter nouns
# 		valid_noun = triple_char_words(input) & nouns
# 		if valid_noun.count > 0
# 			return valid_noun
# 		end

# 		# assuming no tripple letter nouns
# 		valid_noun = quad_char_words(input) & nouns
# 		if valid_noun.count > 0
# 			return valid_noun
# 		end
# 	end
# end
# # p return_noun("abcdefgij")

# def leftover_chars(input)
# 	verbs_to_single_char = pop_verb(input).join.split("")
# 	single_char_array = single_char_words(input).reject{ |x| verbs_to_single_char.include?(x)} 
# 	return single_char_array
# end
# # p return_verb("hij")
# # p leftover_chars("acdefhij")
# # ["hij"]
# # ["a", "c", "d", "e", "f"]
# def parse_for_noun(input)
# 	# loop through list of nouns

# 	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
# 	all_options_split_with_nouns = []

# 	for n in nouns do
# 		arr_no_noun = input.split(n)
# 		noun = n
# 		array_with_noun = arr_no_noun.insert(1, noun)
# 		all_options_split_with_nouns << array_with_noun
# 	end

# 	return all_options_split_with_nouns
# end
# p parse_for_noun("abcdefg")
# [["", "abcd", "efg"], ["ab", "c", "defg"], ["abc", "def", "g"], ["abcdefg", "h"], ["abcdefg", "ij"], ["ab", "cde", "fg"]]

# def parse_for_verb(input)
# 	verbs = ["bc", "fg", "g", "hij", "bcd"]
# 	all_options_split_with_nouns = parse_for_noun(input)

# 	for array in all_options_split_with_nouns do
# 		for potential_word in array do 
# 			unless all_possible_words(input).include?(potential_word)
# 				all_options_split_with_nouns.delete(array)
# 				# [["ab", "c", "defg"], ["abcdefg", "h"], ["ab", "cde", "fg"]]
# 			end
# 		end
# 	end
# 	all_options_nouns_and_verbs = all_options_split_with_nouns

# 	return all_options_nouns_and_verbs
# end
# p parse_for_verb("abcdefg")
# ["abcdef", "g"]

def all_possible_word_combos(input)
	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
	verbs = ["bc", "fg", "g", "hij", "bcd"]
	articles = ["a", "ac", "e"]
	all = nouns + verbs + articles
	array = []
	all_options_of_input = []

	for word in all do 
		if input.include?(word)
			array << word
		end
	end
	temp = array.combination(4).to_a + array.combination(3).to_a 

	for a in temp do 
		# p a.sort 
		x = a.join.chars.sort
		x = x.join
		if x == input
			all_options_of_input.push(a)
		end
	end

	for a in all_options_of_input do 
		a = a.sort! { |x,y| x <=> y }
	end
	p all_options_of_input
	return all_options_of_input

end

all_possible_word_combos("abcdefg")
# show_all_valid_sentences("abcdefg")
# expect =>
# [
# "a bc def g",
# "a bcd e fg",
# "abcd e fg"
# ]

puts " "
all_possible_word_combos("abcc")

# show_all_valid_sentences("abcc")
# expect =>
# ["a bc c"]

puts " "
all_possible_word_combos("abcd")

# show_all_valid_sentences("abcd")
# expect =>
# []
# puts " "

# def show_all_valid_sentences(input)
# 	nouns = ["abcd", "c", "def", "h", "ij", "cde"]
# 	# nouns = nouns.sort_by {|x| x.length}.reverse
# 		# ["abcd", "cde", "def", "ij", "c", "h"]

# 	verbs = ["bc", "fg", "g", "hij", "bcd"]
# 	# verbs = verbs.sort_by {|x| x.length}.reverse
# 		# ["bcd", "hij", "fg", "bc", "g"]

# 	articles = ["a", "ac", "e"]
# 	# articles = articles.sort_by {|x| x.length}.reverse
# 		# ["ac", "e", "a"]

# 		# array = parse_for_noun(input)
# 		# [["", "abcd", "efg"], ["ab", "c", "defg"], ["abc", "def", "g"], ["abcdefg", "h"], ["abcdefg", "ij"], ["ab", "cde", "fg"]]
# 		array = all_possible_word_combos(input)

# 		index_counter = 0
# 		counter = 1
# 		count = 1
		
# 		valid_sentence = []
# 		final_output = []

# 		array.each do |x|
# 			# puts "#{index_counter}, "
# 			# puts "this is x: #{x} "
# 			# puts "processing..."

# 			x_with_nouns = []
# 			x_with_nouns << x
# 			x_with_no_nouns = []
# 			x_with_no_verbs = []
# 			x_with_no_articles = []
# 			removed_nouns = []
# 			removed_verbs = []
# 			removed_articles = []
# 			left_overs_from_verb_surgerery = []
# 			left_overs_from_article_surgerery = []
# 			saved_verbs = []
# 			saved_articles = []
# 			saved_nouns = []
# 			valid_counter = 0
# 			staging_sentence = []

# 			x.each do |i|
# 				x_with_no_nouns << i

# 				for noun in nouns do 
# 					noun_counter = 0
# 					if noun == i 
# 						removed_nouns << noun
# 						staging_sentence.insert(index_counter, noun)
# 						x_with_no_nouns.delete(noun)
# 						# puts "deleting noun: '#{noun}'"
# 						noun_counter += 1
# 					else
# 					end
# 				end	
# 			end

# 			x = x_with_no_nouns
			
# 			# puts "deleting verbs..."
# 			x.each do |i|
# 				if i == nil
# 					i = ""
# 				end
# 				for verb in verbs do 
# 					if i.include?(verb) 
# # for each variation save different arrangement of verbs
# 						# puts "does this text left-over contains the verb? '#{i}' verb: #{verb}"
# 						# puts "removing verb: #{verb}"
# 						saved_verbs << verb
# 						staging_sentence.insert(index_counter, verb)
# 						i = i.delete(verb)
# 					else
# 						staging_sentence.insert(index_counter, "")
# 					end
# 				end
# 				left_overs_from_verb_surgerery << i
# 			end
# 			# puts " "
# 			# puts "number of verbs removed #{saved_verbs.count}: #{saved_verbs}" 
# 			# puts "left overs #{left_overs_from_verb_surgerery}"
			
# 			x = left_overs_from_verb_surgerery
# 			x.each do |i|
# 				x_with_no_articles << i

# 				for article in articles do 
# 					if article == i 
# 						removed_articles << article

# 						x_with_no_articles.delete(article)
# 					else
# 					end
# 				end

# 				for article in articles do 					
# 					# p i
# 					if i.include?(article)

# 						# puts "does this text left-over contains the article? '#{i}' article: #{article}"
# 						# puts "removing article: #{article}"
# 						saved_articles << article
# 						staging_sentence.insert(index_counter, article)

# 						i = i.delete(article)
# 					else
# 						# puts "no iscolated verbs present yet"
# 					end
# 				end
# 				# puts "saved verbs #{saved_verbs}"
# 				# puts "there were #{saved_verbs.count} saved verbs from left over strings"
# 				left_overs_from_article_surgerery << i

# 				if left_overs_from_article_surgerery.join.length < 1
# 					# puts "this is a valid sentence"
# 					# puts valid_sentence
					
# 					valid_counter += 1
# 				end
# 			end

# 			staging_sentence = staging_sentence.select! { |x| !x.nil? }
# 			# staging_sentence = staging_sentence.select! { |x| !x.empty? }

# 			# if staging_sentence
# 			# 	staging_sentence.each do 
# 			# # 		if s.length < 1

# 			# 		staging_sentence = staging_sentence.sort_by {|x, y| x <=> y}
# 			# # 			# staging_sentence.delete(s)
# 			# # 		end
# 			# 	end
# 			# end
# 			valid_sentence << staging_sentence 
# 			# valid_sentence << final_array
# 			# valid_sentence.shift
# 			# 	sentence.s
# 			# end
# 			# puts " "
# 			# puts "Summary: "
# 			# puts "this is x with all #{array[index_counter]}"

# 			# puts "i removed the noun, #{removed_nouns}"
# 			# puts ""
# 			# puts "then i take x_with_no_nouns as new input #{x_with_no_nouns} "
# 			# puts "i then removed the verbs via string parsing #{saved_verbs}"
# 			# puts "this is x with no nouns, verbs deleted in the strings left #{left_overs_from_verb_surgerery}"
# 			# puts "there were #{saved_verbs.count} saved verbs from left over strings"
# 			# puts ""
# 			# puts "x with no articles #{left_overs_from_article_surgerery}"
# 			# puts "we removed the articles #{saved_articles}"
# 			# puts ""
# 			# puts ""
# 			index_counter += 1
# 		end
# 			final_output << valid_sentence[1..valid_sentence.count] # for sentence in valid_sentence do
# 			output = final_output[0]
# 			output_2 = []
# 			for o in output do	
# 				o = o.select! { |x| !x.empty? }
# 				# does this option have a verb?
# 				if  nil || o & nouns == false
# 					output = ""
# 				end
# 				if  nil || o & verbs == false
# 					output = ""
# 				end
# 				if  nil || o & articles == false
# 					output = ""
# 				end
# 				# if it has more than 1 noun at least...
# 				if  (o & nouns) != false && (o & nouns).count > 0
# 					# if it has more than 1 verb at least...
# 					if  (o & verbs) != false && (o & verbs).count > 0
# 						# if it has more than 1 article at least...
# 						if  (o & articles) != false && (o & articles).count < 2 
# 							# output.delete(o)
# 							p o
# 							output_2 << o
# 						end
# 					end
# 				end
# 			end

# 			# if output[0].count < 3
# 				# output = ""
# 			# end
# 			puts "input : #{input}"
# 			puts "output: #{output_2}"

# 	## check for step 1
# 	# Out of the remaining letters, can words be created with the fragments without changing the order

# 	#  split the remaining sections into 4 categories, duplicates in chars 
# 	# 	but different in sizes for each 
# 	# 	if it is not a noun or verb it can only be either a, ac, or e 
# 	# 	parse for a, ac, or e, priority being ac first (if statement to handle ) and add a space

# 	##check step 2
# 	# if input contains a verb
# 	# 	make array of all possible sentences with verbs in them
# 	# end

# 	## check for step 3
# 	# if input contains noun 
# 	# 	if true...
# 	# elsif does it contain 2 articles
# 	# 	if true...
# 	# else
# 	# 	does not contain noun or articles, not valid sentenc
# 	# end


# end

# show_all_valid_sentences("abcdefg")
# abcd fg e

# show_all_valid_sentences("abcdefg")
# expect =>
# [
# "a bc def g",
# "a bcd e fg",
# "abcd e fg"
# ]

# puts " "

# # show_all_valid_sentences("abcc")
# # expect =>
# # ["a bc c"]

# puts " "

# # show_all_valid_sentences("abcd")
# # expect =>
# # []
# puts " "
