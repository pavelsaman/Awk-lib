#!/usr/bin/awk

# deletes white characters on both sides of a string
function trim(str) {
	new_str = str;
	gsub("^\\s+", "", new_str);
	gsub("\\s+$", "", new_str);	
	return new_str;
}

# deletes white characters from the left side only
function ltrim(str) {
	new_str = str;
	gsub("^\\s+", "", new_str);
	return new_str;
}

# deletes white characters from the right side only
function rtrim(str) {
	new_str = str;
	gsub("\\s+$", "", new_str);
	return new_str;
}

# deletes left and right white spaces and all additional white spaces inside the string
# leaves only one space between words
function ftrim(str) {
	n = split(str, array, " ");
	if ( n > 0 ) {
		new_str = array[1];
	}	

	for ( i = 2; i <= n; i++ ) {
		new_str = new_str " " array[i];
	}

	return new_str;
}

