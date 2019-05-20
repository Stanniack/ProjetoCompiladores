package AnaliseSintatica;

import java_cup.runtime.Symbol;
import AnaliseSintatica.sym;
//import static lexico.Tokens.*;
%%
%class Yylex
%public
%unicode
%cup 
//%full
%column
%line
//%char
//%ignorecase
%eofval{
    return new Symbol(sym.EOF, new String("FIM"));
%eofval}
//%class Lexer
//%type Tokens
WHITE = [ \n|\t|\r|\f]
/*%{
public String lexeme;
/*public int ContaToken;*/
%}*/

/*tabela = [t]
atrib = [a]
letras = [a-z]
numeros = [1-9]*/

%%

{WHITE} {/*Ignore*/}


/* Operador de atribuição */

("=")    {return new Symbol (sym.ATRIBUICAO, yychar, yyline, yytext());}


/*Separadores */
("(")      {return new Symbol (sym.ABRE_PARENTESES, yychar, yyline, yytext());}
(")")      {return new Symbol (sym.FECHA_PARENTESES, yychar, yyline, yytext());}



/* Comentarios */

//*("/\*"[a-zA-Z0-9]*"\*/")      {lexeme = yytext(); return COMENTARIO_BLOCO;}*/
("//".*)      {return new Symbol (sym.COMENTARIO_LINHA, yychar, yyline, yytext());}


/* Palavras reservadas*/
("IfmuzMG") {return new Symbol (sym.IFMUZ, yychar, yyline, yytext());}
("Begin") {return new Symbol (sym.BEGIN, yychar, yyline, yytext());}
("End") {return new Symbol (sym.END, yychar, yyline, yytext());}
("+" | "-" | "**" | "/" | "//" | "*" | "%") {return new Symbol (sym.OPERADOR_ARITMETICO, yychar, yyline, yytext());}
("if") {return new Symbol (sym.COND_IF, yychar, yyline, yytext());}
("elif") {return new Symbol (sym.COND_ELIF, yychar, yyline, yytext());}
("else") {return new Symbol (sym.COND_ELSE, yychar, yyline, yytext());}
("(") {return new Symbol (sym.ABRE_PARENTESES, yychar, yyline, yytext());}
(")") {return new Symbol (sym.FECHA_PARENTESES, yychar, yyline, yytext());}
("{") {return new Symbol (sym.ABRE_CHAVES, yychar, yyline, yytext());}
("}") {return new Symbol (sym.FECHA_CHAVES, yychar, yyline, yytext());}
("[") {return new Symbol (sym.ABRE_COLCHETES, yychar, yyline, yytext());}
("]") {return new Symbol (sym.FECHA_COLCHETES, yychar, yyline, yytext());}
("while") {return new Symbol (sym.WHILE, yychar, yyline, yytext());}
("for") {return new Symbol (sym.FOR, yychar, yyline, yytext());}
("String" | "Integer" | "Float" | "Double" | "Long" | "Boolean") {return new Symbol (sym.TIPOS_PRIMITIVOS, yychar, yyline, yytext());}
(";") {return new Symbol (sym.PONTO_VIRGULA, yychar, yyline, yytext());}
(":") {return new Symbol (sym.DOIS_PONTOS, yychar, yyline, yytext());}
(",") {return new Symbol (sym.VIRGULA, yychar, yyline, yytext());}
("print") {return new Symbol (sym.PRINT, yychar, yyline, yytext());}
("and" | "or") {return new Symbol (sym.OPERADOR_LOGICO, yychar, yyline, yytext());}
("not") {return new Symbol (sym.OPERADOR_LOGICO_NOT, yychar, yyline, yytext());}
("==" | ">" | "<" | "!=") {return new Symbol (sym.OPERADOR_CONDICIONAL, yychar, yyline, yytext());}
//("\n") {return new Symbol (sym.QUEBRA_LINHA, yychar, yyline, yytext());}
("true" | "false") {return new Symbol (sym.BOOLEAN, yychar, yyline, yytext());}
([A-Za-z].[0-9a-zA-Z]*) {return new Symbol (sym.VAR, yychar, yyline, yytext());}
(".") {return new Symbol (sym.PONTO, yychar, yyline, yytext());}


//(ERRO) {return new Symbol (sym.ERRO, yychar, yyline, yytext());}
//(ESPACO) {return new Symbol (sym.ESPACO, yychar, yyline, yytext());}
//(COMENTARIO_BLOCO) {return new Symbol (sym.COMENTARIO_BLOCO, yychar, yyline, yytext());}
//(COMENTARIO_LINHA) {return new Symbol (sym.COMENTARIO_LINHA, yychar, yyline, yytext());}
//(NUMERO) {return new Symbol (sym.NUMERO, yychar, yyline, yytext());}
//(TEXTO) {return new Symbol (sym.TEXTO, yychar, yyline, yytext());}

("\'"[^'].*"\'") {return new Symbol (sym.TEXTO, yychar, yyline, yytext());}
([0-9]+) {return new Symbol (sym.NUMERO, yychar, yyline, new Integer(yytext()));}

//("\""[^\"][a-zA-Z0-9]*\.*[a-z]*"\"") {return new Symbol (sym.parametro, yychar, yyline, yytext());}

/*({D}({L})+ {lexeme=yytext(); return ERRO;}*/
. {System.err.println("Caractere Ilegal: " +yytext());}