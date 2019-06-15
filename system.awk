#!/usr/bin/awk

# returns full path to the current shell from SHELL env variable
function shell() {
	return ENVIRON["SHELL"];
}

# returns only the name of the current shell from SHELL env variable
function sh() {
	s = ENVIRON["SHELL"];
	n = split(s, array, "/");
	return array[n];
}

# returns 0 if an environment variable is set, 1 if not
function env(e) {
	if ( ENVIRON[e] != "" ) {
		return 0;
	} else {
		return 1;
	}
}
