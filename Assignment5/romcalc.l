%{
#include "romcalc.tab.h"
#define INT_MAX_VAL 2147483647
int to_dec(char c);
int count_digits(int a);
int max_val = 2147483647;
%}

%%
I[LCDM] 					{ return OTHER; }
V[XLCDM] 					{ return OTHER; }
X[DM] 						{ return OTHER; }
L[CDM]						{ return OTHER; }
DM							{ return OTHER; }
I{4,}|X{4,}|C{4,}			{ return OTHER; }
V{2,}|L{2,}					{ return OTHER; }
I[VXLCDM]I 					{ return OTHER; }
V[IXLCDM]V					{ return OTHER; }
L[IXLCDM]L					{ return OTHER; }
X[VLCDM]X 					{ return OTHER; }
C[IVLDM]C 					{ return OTHER; }
M[IVLD]M 					{ return OTHER; }
IIX|IIV|XXL|XXC|CCD|CCM 	{ return OTHER; }
"+"    { max_val = INT_MAX_VAL; return ADD; }
"-"    { max_val = INT_MAX_VAL; return SUB; }
"/"    { max_val = INT_MAX_VAL; return DIV; }
"*"    { max_val = INT_MAX_VAL; return MUL; }
"{" { max_val = INT_MAX_VAL; return OPPAREN; }
"}"	{ max_val = INT_MAX_VAL; return CLPAREN; }


IX|IV|XL|XC|CD|CM 			{ yylval = to_dec(yytext[1]) - to_dec(yytext[0]); if(yylval >= max_val) { return OTHER; } else {max_val = yylval; return NUM;} }

[IVXLCDM] 					{ yylval = to_dec(yytext[0]); return NUM; }
[ \t]		
\n 							{ max_val = INT_MAX_VAL; return EOL; }
. 							{ return OTHER; }
%%

int count_digits(int a){
	int n = 1;
	while ( a /= 10 ){
		n++;
	}
	return n;
}

int to_dec(char c){
	switch (c) {
		case 'I':
			return 1;
		case 'V':
			return 5;
		case 'X':
			return 10;
		case 'L':
			return 50;
		case 'C':
			return 100;
		case 'D':
			return 500;
		case 'M':
			return 1000;
	}
	return 0;
}