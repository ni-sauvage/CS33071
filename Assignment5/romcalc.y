%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "romcalc.tab.h"
    int yylex();
    void yyerror(char * s);
    char * to_roman(int x);
%}

%token NUM
%token ADD SUB DIV MUL
%token EOL OTHER

%%

end:    
 | end exp EOL {printf("%s\n", to_roman($2));}
 ;

exp: factor
 | exp ADD factor {$$ = $1 + $3;}
 | exp SUB factor {$$ = $1 - $3;}
 ;

factor: prefix
 | factor MUL prefix {$$ = $1 * $3;}
 | factor DIV prefix {$$ = $1 / $3;}
 ;

prefix: number
 | SUB number {$$ = -$2;}
 ;

number: NUM
 | number NUM {$$ = $1 + $2;}
 ;

%%

int main(){
    yyparse();
    return 0;
}

char * to_roman(int x){
    char * num_out = malloc(sizeof(char) * 100); //BAD
    char numerals[] = {'I', 'V', 'X', 'L', 'C', 'D', 'M'};
    int num_values[] = {1, 5, 10, 50, 100, 500, 1000};
	int len = 0;
    int num_index = 6;
    if(x < 0){
        x = -x;
        num_out[len++] = '-';
    }
    if(!x) return "Z";
    while(x > 0){
        if(x >= num_values[num_index]){
            num_out[len++] = numerals[num_index];
            x -= num_values[num_index];
        } else if (x >= num_values[num_index] - num_values[num_index - 1] && (num_index - 1) % 2 == 0){
            num_out[len++] = numerals[num_index - 1];
            num_out[len++] = numerals[num_index];
			x -= num_values[num_index] - num_values[num_index - 1];
        } else if (x >= num_values[num_index] - num_values[num_index - 2] && (num_index - 2) % 2 == 0) {
            num_out[len++] = numerals[num_index - 2];
            num_out[len++] = numerals[num_index];
			x -= num_values[num_index] - num_values[num_index - 2];
        } else {
            num_index--;
        }
    }
	return num_out;
}

void yyerror(char * s){
    fprintf(stderr, "%s\n", s);
    exit(0);
}