%{
int even = 0;
%}

%%
[02468][[:space:]|[:blank:]] {even++;}
[[:space:]|[:blank:]|\n] {}
[0-9] {}
%%

int main(){
	yylex();
	printf("%d\n", even);
	return 0;	
}
