#!/usr/bin/awk

# returns a month number or -1 if not found
# possible to use abbreviations
function month_to_num(mon) {
	months["january"] = 1;
	months["february"] = 2;
	months["march"] = 3;
	months["april"] = 4;
	months["may"] = 5;
	months["june"] = 6;
	months["july"] = 7;
	months["august"] = 8;
	months["september"] = 9;
	months["october"] = 10;
	months["november"] = 11;
	months["december"] = 12;

	# abbreviations
	for (m in months) {
	      months[substr(m, 1, 3)] = months[m];
	}

	# lowercase
	mon = tolower(mon);

	# check if month exists
	if (mon in months) {
	      return months[mon];
	} else {
	      return -1;
	}
}

# converts a number to a months, January is 1
# if not found, returns empty string
function num_to_month(n) {
	months[1] = "January";
	months[2] = "February";
	months[3] = "March";
	months[4] = "April";
	months[5] = "May";
	months[6] = "June";
	months[7] = "July";
	months[8] = "August";
	months[9] = "September";
	months[10] = "October";
	months[11] = "November";
	months[12] = "December";

	if (n in months) {
		return months[n];
	} else {
		return "";
	}	
}

# converts a name of a day to a number or return -1 if not found
# possible to use abbreviation
# Sunday is the first day of week
function day_to_num(day) {
	days["sunday"] = 1
	days["monday"] = 2;
	days["tuesday"] = 3;
	days["wednesday"] = 4;
	days["thursday"] = 5;
	days["friday"] = 6;
	days["saturday"] = 7;
	
	# abbreviations
	for (d in days) {
		days[substr(d, 1, 3)] = days[d];
	}

	# lowercase
	day = tolower(day);

	# return a number if found
	if (day in days) {
		return days[day];
	} else {
		return -1;
	}
}

# converts a number to a day
# returns empty string if not found
function num_to_day(n) {
	days[1] = "Sunday";	
	days[2] = "Monday";
	days[3] = "Tuesday";
	days[4] = "Wednesday";
	days[5] = "Thursday";
	days[6] = "Friday";
	days[7] = "Saturday";

	if (n in days) {
		return days[n];
	} else {
		return "";
	}
}

# returns current date in the ISO 8601 format
function iso_date() {
	format = "%Y-%m-%d";
	return strftime(format, systime(), 1);
}

# returns current date and time in the ISO 8601 format
function iso_datetime() {
	format = "%Y-%m-%dT%H-%M-%SZ";
	return strftime(format, systime(), 1);
}

# returns current week number according to ISO 8601
function iso_week() {
	return strftime("%Y-W%V", systime(), 1);
}

# returns current week number and date according to ISO 8601
function iso_week_date() {
	week_number = strftime("%V", systime(), 1);
	date_number = strftime("%w", systime(), 1);

	# Sunday is 0 in strftime, but not in ISO 8601 where it's 7
	if ( date_number == 0 ) {
		date_number = 7;
	}

	return strftime("%Y", systime(), 1) "-W" week_number "-" date_number;
}

# returns the full name of the current month
function full_month() {
	return strftime("%B");	
}

# returns the abbreviated name of the current month
function month() {
	return strftime("%b");
}

# returns the full name of the current day
function full_day() {
	return strftime("%A");
}

# returns the abbreviated name of the current day
function day() {
	return strftime("%a");
}

# return the abbreviated time zone name
function timezone() {
	return strftime("%Z");
}

# returns a week number
function week_num() {
	return strftime("%U");
}

