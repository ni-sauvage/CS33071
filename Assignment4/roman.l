%{
#include "roman.tab.h"
int to_dec(char c);
int count_digits(int a);
int max_val = 0;
%}

%%
I[LCDM] 			{ return OTHER; }
V[XLCDM] 			{ return OTHER; }
X[CDM] 				{ return OTHER; }
L[CDM]				{ return OTHER; }
DM					{ return OTHER; }
[IXCM]{4,}			{ return OTHER; }
[VL]{2,}			{ return OTHER; }

I[XLCDM]I 			{ return OTHER; }
X[VLCDM]X 			{ return OTHER; }
C[IVLDM]C 			{ return OTHER; }
M[IVLDC]M 			{ return OTHER; }

IX|IV|XL|XC|CD|CM 	{ yylval = to_dec(yytext[1]) - to_dec(yytext[0]); if(!max_val) { 
																		max_val = yylval;
																		return NUM;
																	  } else {
																		if(yylval >= max_val) {
																			return OTHER;
																		} else {
																			return NUM;
																		}
																	  }
}
[IVXLCDM] 			{ yylval = to_dec(yytext[0]); return NUM; }
[ \t]
\n 					{ return EOL; }
. 					{ return OTHER; }
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