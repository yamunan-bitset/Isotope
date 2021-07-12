%{
  #include <iostream>
  extern int yylex();
%}
%option noyywrap
%%
[\t\n];
^[0-9]+\.[0-9]+  { std::cout << "Found a floating-point number:" << yytext << std::endl; }
^[0-9]+          { std::cout << "Found an integer:" << yytext << std::endl; }
^["][a-zA-Z0-9]+["]  { std::cout << "Found a string: " << yytext << std::endl; }
^\'[a-zA-Z0-9]\' { std::cout << "Found a character: " << yytext << std::endl; }
.;
%%
int main(int argc, char** argv, char** envp)
{
  // open a file handle to a particular file:
  FILE* myfile = fopen(argv[1], "r");
  // make sure it's valid:
  if (!myfile)
    {
      std::cout << "Can't open " << argv[1] << std::endl;
      return -1;
    }
  // set lex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  
  // lex through the input:
  while(yylex());
}
