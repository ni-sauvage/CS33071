%{
#include <stdio.h>
const int CURRENT_YEAR = 2023;
const int PREV_MILL = 1900;
const int CURR_MILL = 2000;
%}

YEAR_PREV_MILL =^[890][0-9][:space:]
YEAR_CURR_MILL_OLD =1[12][:space:]
YEAR_NEW =^[12][0-9][12][:space:]
NUMBER =[:space:][0-9]{2,6}\n
COUNTY_NEW =C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
COUNTY_OLD_INV =T
COUNTY_OLD =L|LK|TN|TS|W|WD


%%
{YEAR_PREV_MILL}{COUNTY_OLD}{NUMBER} {char a[2]; strncpy(a, yytext, 2); printf("%d\n", CURRENT_YEAR - (PREV_MILL + (int) atol(a)));}
{YEAR_CURR_MILL_OLD}{COUNTY_OLD}{NUMBER} {char a[2]; strncpy(a, yytext, 2); printf("%d\n", CURRENT_YEAR - (CURR_MILL + (int) atol(a)));}
{YEAR_PREV_MILL}{COUNTY_OLD_INV}{NUMBER} {printf("INVALID\n");}
{YEAR_CURR_MILL_OLD}{COUNTY_OLD_INV}{NUMBER} {printf("INVALID\n");}
{YEAR_PREV_MILL}{COUNTY_NEW}{NUMBER} {char a[2]; strncpy(a, yytext, 2); printf("%d\n", CURRENT_YEAR - (PREV_MILL + (int) atol(a)));}
{YEAR_CURR_MILL_OLD}{COUNTY_NEW}{NUMBER} {char a[2]; strncpy(a, yytext, 2); printf("%d\n", CURRENT_YEAR - (CURR_MILL + (int) atol(a)));}
{YEAR_NEW}{COUNTY_NEW}{NUMBER} {char a[2]; strncpy(a, yytext, 2); printf("%d\n", CURRENT_YEAR - (CURR_MILL + (int) atol(a)));}
(.|\n) {printf("INVALID\n");}
%%


int main(){
	yylex();
	return 0;	
}