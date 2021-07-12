/*Tokens and their aliases*/
%token END 0
%token RETURN "return" WHILE "while" IF "if" VAR "var" IDENTIFIER NUMCONST STRINGCONST
%token OR "|" AND "&" EQ "==" NE "!=" PP "++" MM "--" PL_EQ "+=" MI_EQ "-="
%token POW "**" MUL_EQ "*=" DIV_EQ "/="
 /*TODO: Add more*/
%%

/*Functions*/
library: functions;
functions: functions IDENTIFIER paramdecls /*parameters*/ ':' stmt /*statement*/
| %empty
/*parameters*/
paramdecls: paramdecl | %empty
paramdecl: paramdecl ',' IDENTIFIER
| IDENTIFIER;

/*Statement*/
stmt: com_stmt /*Incase of more statements*/
| "if"     expr ':' stmt
| "while"  expr ':' stmt
| "return" expr
| var_defs /*Variable Definitions inside statement*/
| expr
| ';';

/*Statement Recursion*/
com_stmt: ':'
| com_stmt stmt;

/*Variable Definitions*/
var_defs: var_def1
| var_defs ',' var_def1;
var_def1: IDENTIFIER '=' expr
| IDENTIFIER;

/*Expressions*/
expr: NUMCONST      /*numbers*/
| STRINGCONST       /*strings*/
| IDENTIFIER        /*identifiers*/
| expr "[" expr "]" /*arrays*/
| expr '=' expr     /*comparing*/
| expr '+' expr     /*addition*/
| expr '-' expr     /*subtraction*/
| expr '*' expr     /*multiplication*/
| expr '/' expr     /*divition*/
| expr "+=" expr    /*plus equals*/
| expr "-=" expr    /*subtraction equals*/
| expr "*=" expr    /*multiply equals*/
| expr "/=" expr    /*divide equals*/

