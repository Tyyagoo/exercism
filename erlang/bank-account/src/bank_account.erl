-module(bank_account).

-behaviour(gen_server).

-export([balance/1, charge/2, close/1, create/0, deposit/2, withdraw/2]).
-export([init/1, handle_call/3, handle_cast/2]).

-record(account, { state = open, balance = 0}).

%%%%%%%%%%%%%%%%%
%%% Interface %%%
%%%%%%%%%%%%%%%%%

create() ->
  {ok, Pid} = gen_server:start(?MODULE, [], []),
  Pid.

balance(Pid) ->
  gen_server:call(Pid, balance).

charge(Pid, Amount) ->
  gen_server:call(Pid, {charge, Amount}).

withdraw(Pid, Amount) ->
  gen_server:call(Pid, {withdraw, Amount}).

close(Pid) ->
  gen_server:call(Pid, close).

deposit(Pid, Amount) ->
  gen_server:cast(Pid, {deposit, Amount}).

%%%%%%%%%%%%%%%%%
%%% Callbacks %%%
%%%%%%%%%%%%%%%%%

init([]) ->
    {ok, #account{}}.

handle_call(_, _, #account{state = closed} = Account) ->
    {reply, {error, account_closed}, Account};

handle_call(balance, _, #account{balance = Balance} = Account) ->
    {reply, Balance, Account};

handle_call({charge, Amount}, _, #account{balance = Balance} = Account) ->
    if
        Amount < 0 -> {reply, 0, Account};
        Amount > Balance -> {reply, 0, Account};
        true -> {reply, Amount, Account#account{balance = Balance - Amount}}
    end;

handle_call({withdraw, Amount}, _, #account{balance = Balance} = Account) ->
    if
        Amount < 0 -> {reply, 0, Account};
        Amount > Balance -> {reply, Balance, Account#account{balance = 0}};
        true -> {reply, Amount, Account#account{balance = Balance - Amount}}
    end;

handle_call(close, _, Account) ->
    {reply, Account#account.balance, Account#account{state = closed}}.

handle_cast(_, #account{state = closed} = Account) ->
    {noreply, Account};

handle_cast({deposit, Amount}, #account{balance = Balance} = Account) when Amount > 0 ->
    {noreply, Account#account{balance = Balance + Amount}};

handle_cast({deposit, _Amount}, Account) ->
    {noreply, Account}.
