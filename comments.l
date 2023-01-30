%{
int synerr = 0;
%}

%%
\{([^\}]|\n)*\}
\".*\" {ECHO;}
\*\*.*$
\{|\} {printf("syntax error\n"); synerr = 1;}
(.|\n) {if(!synerr){ECHO;}}
%%

int main(){
	yylex();
	return 0;	
}
