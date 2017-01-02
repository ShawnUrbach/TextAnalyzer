user_input = ''
word_count = 0

count_characters = () ->
	char_count = 0
	char_count +=1 for x in user_input
	characters = document.getElementById('characters_info')
	characters.innerHTML = 'Characters: '+ char_count
	
count_words = () ->
	user_input = user_input.replace(/(^\s*)|(\s*$)/gi,"")
	user_input = user_input.replace(/[ ]{2,}/gi," ")
	user_input = user_input.replace(/\n /,"\n")
	word_count = user_input.split(' ').length
	words = document.getElementById('words_info')
	words.innerHTML = 'Words: '+ word_count
	
longest_word = () ->
	user_input = user_input.replace(/(^\s*)|(\s*$)/gi,"")
	user_input = user_input.replace(/[ ]{2,}/gi," ")
	user_input = user_input.replace(/\n /,"\n")
	words = user_input.split(' ')
	longest = ''
	for x in words
		x = x.replace(/[^A-Z]/gi, "")
		if x.length > longest.length
			longest = x
	longestword = document.getElementById('long_word_info')
	longestword.innerHTML = 'Longest Word: '+ longest
	
average_word = () ->
	user_input = user_input.replace(/(^\s*)|(\s*$)/gi,"")
	user_input = user_input.replace(/[ ]{2,}/gi," ")
	user_input = user_input.replace(/\n /,"\n")
	words = user_input.split(' ')
	char_total = 0
	for x in words
		x = x.replace(/[^A-Z]/gi, "")
		char_total += x.length
	averageword = document.getElementById('avg_word_info')
	averageword.innerHTML = 'Avg. Word Length: ' + "#{(char_total/word_count).toFixed(2)}"
	
replace_words = () ->	
	words_to_replace = user_input.split(' ')
	words_to_replace = String(words_to_replace)
	replaced_words = user_input
	for x, y of replacements
		if words_to_replace.indexOf(y) >= 0
			replaced_words = replaced_words.replace(y,x)
	document.getElementById('converted_textarea').value = replaced_words
	
analyze_button.onclick = ()->
	user_input = document.getElementById('user_textarea').value
	count_characters()
	count_words()
	longest_word()
	average_word()
	replace_words()
	




