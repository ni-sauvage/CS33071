%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "romancalc.tab.h"
    int yylex();
    void yyerror(char * s);
%}

%token NUM
%token ADD SUB DIV MUL
%token EOL OTHER

%%

end:    
 | end exp EOL {printf("%d\n", $2);}
 ;

exp: factor
 | exp ADD factor {$$ = $1 + $3;}
 | exp SUB factor {$$ = $1 - $3;}
 ;

factor: number
 | factor MUL number {$$ = $1 * $3;}
 | factor DIV number {$$ = $1 / $3;}
 ;

number: NUM
 | number NUM {$$ = $1 + $2;}
 ;

%%

int main(){
    yyparse();
    return 0;
}

void yyerror(char * s){
    fprintf(stderr, "%s\n", s);
    exit(0);
}