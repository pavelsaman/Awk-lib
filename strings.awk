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

# converts the first character to upper case
function capitalize(str) {
	n = split(str, array, "");
	if ( n > 0) {
		new_str = toupper(array[1]);
	}

	for ( i = 2; i <= n; i++ ) {
		new_str = new_str array[i];
	}

	return new_str;
}

# returns 0 if all characters in the string are digits; or 1 of not
function isdigit(str) {
	if ( str ~ /^[0-9]+$/ ) {
		return 0;
	} else {
		return 1;
	}
}

# returns 0 if all characters are in the alphabet
function isalpha(str) {
	if ( str ~ /^[[:alpha:]]+$/ ) {
		return 0;
	} else {
		return 1;
	}
}

# returns 0 if all characters are lower
function islower(str) {
	if ( str ~ /[[:upper:]]/ ) {
		return 1;
	} else {
		return 0;
	}
}

# returns 0 if all characters are upper
function isupper(str) {
	if ( str ~ /[[:lower:]]/ ) {
		return 1;
	} else {
		return 0;
	}
}

# returns 0 if all chacraters are alphanumeric
function isalnum(str) {
	if ( str ~ /^[[:alnum:]]+$/ ) {
		return 0;
	} else {
		return 1;
	}
}

# returns 0 if all characters are whitespace
function isspace(str) {
	if ( str ~ /^[[:space:]]+$/ ) {
		return 0;
	} else {
		return 1;
	}
}

# fills the string with a specified number of 0 at the beginning (on the left)
function zfill(str, num) {
	if ( num <= 0 ) {
		return str;
	}

	new_str = "0";
	for ( i = 1; i < num; i++ ) {
		new_str = new_str "0";
	}	

	return new_str str;
}

# returns 0 when the strings starts with a given value
function startswith(str, val) {
	if ( substr(str, 1, length(val)) == val ) {
		return 0;
	} else {
		return 1;
	}	
}

# returns 0 when the string ends with a given value
function endswith(str, val) {
	if ( substr(str, length(str) - length(val) + 1, length(str)) == val ) {
		return 0;
	} else {
		return 1;
	}
}
