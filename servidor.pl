:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- http_handler(root(list_modules), list_modules, []).

% URL handlers.
:- http_handler('/', handle_request, []).

% Request handlers.
handle_request(_Request) :-
    reply_html_page(
        [title('Servidor desde prolog')],
        [h1('Problema N reinas')],
        [button(class(buttonAmplitud), 'Amplitud'), button(class(buttonAmplitud),'Coso')]
    ).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- initialization(server(8000)).