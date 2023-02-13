%{
#include <stdio.h>
const int CURRENT_YEAR = 2023;
const int PREV_MILL = 1900;
const int CURR_MILL = 2000;
int synerr = 0;

int get_age(char * plate, int mill){
	char year_prefix[2];
	strncpy(year_prefix, plate, 2);
	int year = atoi(year_prefix) + mill;
	return CURRENT_YEAR - year;
}

int get_year(char * plate){
	char year_prefix[2];
	strncpy(year_prefix, plate, 2);
	return atoi(year_prefix);
}
%}
WHITESPACE [[:blank:]]*
YEAR_PREV_MILL ([90][0-9]-)|(8[789]-)
YEAR_NEW [12][0-9][12]-|1[0-2]-|0[0-9]-
NUMBER -[0-9]{1,6}{WHITESPACE}$
COUNTY_NEW C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
COUNTY_OLD_INV T
COUNTY_OLD LK|TN|TS|WD


%%
{YEAR_PREV_MILL}{COUNTY_OLD_INV}{NUMBER} {printf("INVALID\n");}
{YEAR_NEW}{COUNTY_OLD}{NUMBER} {get_year(yytext) < 14 ? printf("%d\n", get_age(yytext, CURR_MILL)) : printf("INVALID\n");}
{YEAR_NEW}{COUNTY_OLD_INV}{NUMBER} {get_year(yytext) >= 14 ? printf("%d\n", get_age(yytext, CURR_MILL)) : printf("INVALID\n");}
{YEAR_NEW}{COUNTY_NEW}{NUMBER} {printf("%d\n", get_age(yytext, CURR_MILL));}
{YEAR_PREV_MILL}{COUNTY_NEW}{NUMBER} {printf("%d\n", get_age(yytext, PREV_MILL));}
[[:blank:]]
. {synerr = 1;}
\n {if(synerr){printf("INVALID\n"); synerr = 0;}}
%%


int main(){
	yylex();
	return 0;	
}