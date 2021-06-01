:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_unix_daemon)).


%Locaciones para archivos
:- multifile http:location/3.
:- dynamic   http:location/3.

% Obtener archivos para estilos y validaciones. 
:- http_handler(styles(.), http_reply_from_files('./styles', []), [prefix]).

% Manejador de urls.
:- http_handler(root(.), index, []).
http:location(styles, root(styles), []).

% Manejador de solicitudes 
 index(_Request) :-
    reply_html_page([title('N Reinas'),
    link([rel('stylesheet'), href('/styles/index.css') ]),
    h1(class(tituloPrincipal),'Problema N reinas'),
    div([label([class(labelNumero),for('numeroMatriz')], 'Entero de matriz deseada:'),
    input([class(inputNumeroMatriz),type('number'), id('numeroMatriz'), 
    name('numeroMatriz')])])],
    [button(class(buttonAmplitud), 'Amplitud'), 
    button(class(buttonProfundidad),'Profundidad')]
    ).
 
:- initialization(http_daemon, main).

