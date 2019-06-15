#!/usr/bin/awk

# returns 0 if a file exists, 1 if not, -1 if not possible to find out using sh or bash
function exists(filename,    c, result) {
	c = "/bin/ls " filename;
	
	# if using sh	
	if ( ENVIRON["SHELL"] == "/bin/sh" ) {
		result = system(c " >/dev/null 2>&1");
	} else if ( ENVIRON["SHELL"] == "/bin/bash" ) { # if suing bash
		result = system("/bin/bash -c \"" c "\" >/dev/null 2>&1");
	} else {
		return -1;
	}
	
	# returns 0 if a file exists
	if ( result == 0 ) {
		return result;
	} else {
		return 1;
	}
}
