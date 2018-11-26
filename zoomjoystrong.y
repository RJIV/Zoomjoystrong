%{
	#include <stdio.h>
	#include "zoomjoystrong.h"	
	int yyerror(const char* err);

%}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT



%%

program:		list_of_expressions
       ;

list_of_expressions:	expression
	|		expression list_of_expressions
	;

expression:		command END_STATEMENT
  	|		END
	;

command:		SET_COLOR set_color
	|	        POINT point
	|		LINE line
	|		CIRCLE circle
	|		RECTANGLE rectangle
	;

set_color: INT INT INT {
	printf("SET_COLOR %d, %d, %d\n", $1, $2, $3); 
	set_color($1, $2, $3);
}

point: INT INT {
	printf("POINT %d, %d\n", $1, $2); 
	point($1, $2);
}

line: INT INT INT INT {
	printf("LINE %d, %d, %d, %d\n", $1, $2, $3, $4); 
    	
    	line($1, $2, $3, $4);
}

circle: INT INT INT {
	printf("CIRCLE %d, %d, %d\n", $1, $2, $3); 
      	circle($1, $2, $3);
}

rectangle: INT INT INT INT {
	printf("RECTANGLE %d, %d, %d, %d\n", $1, $2, $3, $4); 
	rectangle($1, $2, $3, $4);
}


%%


int main(int argc, char** argv)
{
	setup();
	yyparse();
	finish();
}

int yyerror(const char* err)
{
	printf("%s\n", err);
	exit(1);
}
