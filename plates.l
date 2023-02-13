%{
#include <stdio.h>
const int CURRENT_YEAR = 2023;
const int PREV_MILL = 1900;
const int CURR_MILL = 2000;

int get_years(char * plate, int mill){
	char year_prefix[2];
	strncpy(year_prefix, plate, 2);
	int year = atoi(year_prefix) + mill;
	return CURRENT_YEAR - year;
}
%}

YEAR_PREV_MILL (^[90][0-9]-)|(^8[789]-)
YEAR_CURR_MILL_OLD (^1[0-2]-)|(^0[0-9]-)
YEAR_NEW ^[12][0-9][12]-
NUMBER -[0-9]{1,6}\n
COUNTY_NEW C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
COUNTY_OLD_INV T
COUNTY_OLD L|LK|TN|TS|W|WD


%%
{YEAR_PREV_MILL}{COUNTY_OLD}{NUMBER} {printf("%d\n", get_years(yytext, PREV_MILL));}
{YEAR_CURR_MILL_OLD}{COUNTY_OLD}{NUMBER} {printf("%d\n", get_years(yytext, CURR_MILL));}
{YEAR_PREV_MILL}{COUNTY_OLD_INV}{NUMBER} {printf("INVALID\n");}
{YEAR_CURR_MILL_OLD}{COUNTY_OLD_INV}{NUMBER} {printf("INVALID\n");}
{YEAR_PREV_MILL}{COUNTY_NEW}{NUMBER} {printf("%d\n", get_years(yytext, PREV_MILL));}
{YEAR_CURR_MILL_OLD}{COUNTY_NEW}{NUMBER} {printf("%d\n", get_years(yytext, CURR_MILL));} //
{YEAR_NEW}{COUNTY_NEW}{NUMBER} {printf("%d\n", get_years(yytext, CURR_MILL));} //Works
(.*\n) {printf("INVALID\n");}
%%


int main(){
	yylex();
	return 0;	
}