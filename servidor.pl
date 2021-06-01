:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/html_head)).	


%Locaciones para archivos
:- multifile http:location/3.
:- dynamic   http:location/3.

% Obtener archivos para estilos y validaciones. 
:- http_handler(styles('index.css'),  http_reply_file('index.css', []), []).
http:location(styles, root(styles), []).

% Manejador de urls.
:- http_handler(root(.), index, []).

% Manejador de solicitudes 
 index(_Request) :-
    \html_requires(styles('index.css')),
    reply_html_page([title('N Reinas'),
    h1(class(tituloPrincipal),'Problema N reinas'),
    div([label([for('numeroMatriz')], 'Entero de matriz deseada:'),
    input([class(inputNumeroMatriz),type('number'), id('numeroMatriz'), 
    name('numeroMatriz')])])],
    [button(class(buttonAmplitud), 'Amplitud'), 
    button(class(buttonProfundidad),'Profundidad')]
    ).
 
:- initialization(http_daemon, main).

