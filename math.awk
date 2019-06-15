#!/usr/bin/awk

function abs(n) {
	if ( n < 0 ) {
		return n * -1;
	}
	return n;
}
