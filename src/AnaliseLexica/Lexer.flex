package AnaliseLexica;

import static AnaliseLexica.Token.*;

%%
%class Lexer
%type Token

/*L = [a-zA-Z_]
D = [0-9]
T = [^"L+"$]
X=[\n]*/
WHITE=[ \t\r]

%{
public String lexeme;
%}
%%
{WHITE} {return ESPACO;} 


/* Operador de atribuição, lógico e condicional */
("=")    {lexeme = yytext(); return ATRIBUICAO;}
("==" | ">" | "<" | "!=")    {lexeme = yytext(); return OPERADOR_CONDICIONAL;}
("and" | "or")    {lexeme = yytext(); return OPERADOR_LOGICO;}
("not")    {lexeme = yytext(); return OPERADOR_LOGICO_NOT;}


/* Operadores aritméticos*/
("+" | "-" | "**" | "/" | "//" | "*" | "%")    {lexeme = yytext(); return OPERADOR_ARITMETICO;}

/* Delimitador */
(":")    {lexeme = yytext(); return DOIS_PONTOS;}
(";")    {lexeme = yytext(); return PONTO_VIRGULA;}
(",")    {lexeme = yytext(); return VIRGULA;}

/*Separadores */
(".")      {lexeme = yytext(); return PONTO;}
("(")      {lexeme = yytext(); return ABRE_PARENTESES;}
(")")      {lexeme = yytext(); return FECHA_PARENTESES;}
("[")      {lexeme = yytext(); return ABRE_COLCHETES;}
("]")      {lexeme = yytext(); return FECHA_COLCHETES;}
("{")      {lexeme = yytext(); return ABRE_CHAVES;}
("}")      {lexeme = yytext(); return FECHA_CHAVES;}
(\n)       {lexeme = yytext(); return QUEBRA_LINHA;}


/* Palavras reservadas*/
("IfmuzMG")       {lexeme = yytext(); return IFMUZ;}
("Begin")       {lexeme = yytext(); return BEGIN;}
("End")       {lexeme = yytext(); return END;}
("if")       {lexeme = yytext(); return COND_IF;}
("elif")       {lexeme = yytext(); return COND_ELIF;}
("else")       {lexeme = yytext(); return COND_ELSE;}
("while")       {lexeme = yytext(); return WHILE;}
("for")       {lexeme = yytext(); return FOR;}
("print")       {lexeme = yytext(); return PRINT;}
("true" | "false")       {lexeme = yytext(); return BOOLEAN;}

/* Tipos primitivos */
("String" | "Integer" | "Float" | "Double" | "Long")       {lexeme = yytext(); return TIPOS_PRIMITIVOS;}

( [A-Za-z].[0-9a-zA-Z]* )       {lexeme = yytext(); return VAR;}
( "//".* )       {lexeme = yytext(); return COMENTARIO_LINHA;}

("\'"[^'].*"\'") {lexeme = yytext(); return TEXTO;}
([0-9]+) {lexeme = yytext(); return NUMERO;}

/*("\""[^\"][a-zA-Z0-9]*\.*[a-z]*"\"") {lexeme = yytext(); return parametro;}*/
/*({D}({L})+ {lexeme=yytext(); return ERRO;}*/

. {lexeme = yytext(); return ERRO;}