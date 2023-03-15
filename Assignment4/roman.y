%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char * s);
%}

%token NUM
%token OTHER
%token EOL

%%

end:
 | end part EOL {printf("%d\n", $2);}
 ;

part: NUM
 | part NUM { $$ += $2; }
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