%{
int even = 0;
%}

%%
\"(.|\n)*\" {ECHO;}
\*\*.*\n 
\{(.|\n)*\}
\{|\} {print("syntax error\n");}
%%

int main(){
	yylex();
	printf("%d\n", even);
	return 0;	
}
