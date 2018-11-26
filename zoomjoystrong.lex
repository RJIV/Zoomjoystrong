%option yylineno

%{

/******************************************************************************
* zoomjoystrong.lex							      *
* Language Creation Project						      *
* CIS 343								      *
* Author:								      *
*	R.J. Hamilton							      *
******************************************************************************/


#include <stdio.h>
#include "zoomjoystrong.tab.h"

%}

%%

END|end|Exit|exit		return END;
;				return END_STATEMENT;
POINT|Point|point		return POINT;
LINE|Line|line			return LINE;
CIRCLE|Circle|circle		return CIRCLE;
RECTANGLE|Rectangle|rectangle	return RECTANGLE;
SET_COLOR			return SET_COLOR;
[0-9]+				return INT;
[0-9]+\.[0-9]+			return FLOAT;
\n|\t|[ ]			;
.				{printf("Can't recognize token '%s' "
				 "on line %d\n", yytext, yylineno);}

%%

void printLexeme()
{
	printf("(%s)\n", yytext);
}

int yywrap(void)
{
	return 1;
}
