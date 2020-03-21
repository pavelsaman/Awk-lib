#!/usr/bin/awk

# returns a Czech region name based on a zip code
# based on https://en.wikipedia.org/wiki/List_of_postal_codes_in_the_Czech_Republic
# zip codes in one of the following formats:
## 60000
## 600 00
# if a zip code doesn't exists, "NaN" is returned
function region(zip) {
	switch (zip) {
		# Prague region and special addresses belonging to Prague as well
		case /^1[[:digit:]]{2}[ ]?[[:digit:]]{2}$/:
		case /^21[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^22[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
			return "Prague";
			break;
		# Central Bohemian region
		case /^25(0|1|2|3|4|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^26(1|2|3|4|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^27(0|1|2|3|4|6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^28(0|1|2|4|5|6|8|9)[ ]?[[:digit:]]{2}$/:
		case /^29(0|3|4|5)[ ]?[[:digit:]]{2}$/:
			return "Central Bohemian";
			break;
		# Plzeň region
		case /^301[ ]?[[:digit:]]{2}$/:
		case /^31[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^32(0|1|2|3|4|5|6)[ ]?[[:digit:]]{2}$/:
		case /^33[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^34(0|1|2|4|5|6|7|8|9)[ ]?[[:digit:]]{2}$/:
			return "Plzeň";
			break;
		# Karlovy Vary region
		case /^35(0|1|2|3|6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^36(0|1|2|3|4)[ ]?[[:digit:]]{2}$/:
			return "Karlovy Vary";
			break;
		# South Bohemian region
		case /^37(0|1|2|3|4|5|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^38[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^39(0|1|2|7|8|9)[ ]?[[:digit:]]{2}$/:
			return "South Bohemian";
			break;
		# Ústí nad Labem region
		case /^40(0|1|2|3|5|6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^41(0|1|2|3|5|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^43(0|1|2|4|5|6|8|9)[ ]?[[:digit:]]{2}$/:
		case /^44(0|1)[ ]?[[:digit:]]{2}$/:
			return "Ústí nad Labem";
			break;
		# Liberec region
		# Semily district belongs to Liberec region despite its higher zip codes
		case /^46(0|1|2|3|4|6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^47(0|1|2|3)[ ]?[[:digit:]]{2}$/:
		case /^51(1|2|3|4)[ ]?[[:digit:]]{2}$/:
			return "Liberec";
			break;
		# Hradec Králové region
		case /^50[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^51(6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^54(1|2|3|4|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^55(0|1|2)[ ]?[[:digit:]]{2}$/:
			return "Hradec Králové";
			break;
		# Pardubice region
		case /^53(0|1|2|3|4|5|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^56(0|1|2|3|4|5|6|8|9)[ ]?[[:digit:]]{2}$/:
		case /^57(0|1|2)[ ]?[[:digit:]]{2}$/:
			return "Pardubice";
			break;
		# Vysočina region
		# Třebíč district belongs to Vysočina region despite its higher zip code
		# Pelhřimov district belongs to Vysočina region despite its lower zip code
		case /^39(3|4|5|6)[ ]?[[:digit:]]{2}$/:
		case /^58(0|1|2|3|4|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^59(1|2|3|4|5)[ ]?[[:digit:]]{2}$/:
		case /^67(4|5|6)[ ]?[[:digit:]]{2}$/:
			return "Vysočina";
			break;
		# South Moravian region
		case /^6(0|1|2|3|4)[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^66(4|5|6|7|9)[ ]?[[:digit:]]{2}$/:
		case /^67(0|1|2|8|9)[ ]?[[:digit:]]{2}$/:
		case /^68(0|2|3|4|5)[ ]?[[:digit:]]{2}$/:
		case /^69(0|1|2|3|5|6|7|8)[ ]?[[:digit:]]{2}$/:
			return "South Moravian";
			break;
		# Moravian-Silesian region
		# Bruntál district belongs to Moravian-Silesian region despite its higher zip code 
		case /^7(0|1|2)[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
		case /^73(3|4|5|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^74(1|2|3|4|6|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^79(2|3|4|5)[ ]?[[:digit:]]{2}$/:
			return "Moravian-Silesian";
			break;
		# Zlín region
		# Uherské Hradiště district belongs to Zlín region despite its lower zip code
		case /^68(6|7|8)[ ]?[[:digit:]]{2}$/:
		case /^75(0|1|2|3|5|6|7)[ ]?[[:digit:]]{2}$/:
		case /^76[[:digit:]]{1}[ ]?[[:digit:]]{2}$/:
			return "Zlín";
			break;
		# Olomouc region
		case /^779[ ]?[[:digit:]]{2}$/:
		case /^78(0|1|2|3|4|5|7|8|9)[ ]?[[:digit:]]{2}$/:
		case /^79(0|6|7|8)[ ]?[[:digit:]]{2}$/:
			return "Olomouc";
			break;
		default:
			return "NaN";
			break;
	}
}
