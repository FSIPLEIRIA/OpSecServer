::This simple command was made for windows server 2019, with the goal of helping FSIPLeiria team in 13/01/2023
::Prints all logins to the system, recent first in an xml format(its faster that way for the server)
::Check the arguments 
set "reversed=/rd:true"
set "format=/f:xml"
if "%1"=="-h" || "%1"=="-help" || "%1"=="--help" || "%1"=="/h" || "%1"=="-?" || "%1"== "ajuda" goto :help

if "%1"=="-r" set "reversed=/rd:%2"
if "%1"=="-f" set "format=/f:%2"
::help
:help
echo "Login Audit Scripts:\nEste comando e usado para teres uma lista de todos os logins que occoreram no sistema\n So tem dois parametros ambos estes nao sao obrigatorios: \n\n -r <flag> : que dita a ordem chronologica com que os registos sao colocados(por defeito o valor e true ou seja os mais recentes sao escritos primeiro\n -f <formato> : Este parametro permite definir o tipo de formato em que o output e mostrado(por defeito o valor e xml)\n\nNOTA IMPORTANTE: devido a natureza deste comando o valor de formato deve ser deixado a default pois e mais optimizado se mesmo assim precisares doutro formato ve a documentaçao do wevtutil"
echo "\nNOTA IMPORTANTE2: NAO EXISTE VALIDAÇAO DE PARAMETROS, ie se fuderes o comando too bad (e nao te queixes)->gerado por AI"
echo "\n\@fsipleiria 2023, (o joaoV teve aq)"
goto :end
::noarg
:noarg
wevtutil qe Security "/q:*[System [(EventID=4648)]]" %reversed% %format%

:end
echo "\n\n\t --- <Fim do audit> ---"