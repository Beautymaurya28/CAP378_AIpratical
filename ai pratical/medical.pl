% Medical Diagnosis System in Prolog
go :-
    write('Welcome to the Medical Diagnosis System'), nl,
    write('Please answer the following questions with yes. or no.'), nl,
    hypothesis(Disease),
    write('Based on your symptoms, you might have: '), write(Disease), nl,
    undo.

% List of possible diseases with their related symptoms
hypothesis(flu) :- flu, !.
hypothesis(common_cold) :- cold, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(malaria) :- malaria, !.
hypothesis(covid19) :- covid, !.
hypothesis(unknown).  % If no match found

% Rule for flu diagnosis
flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache).

% Rule for common cold
cold :-
    verify(sneezing),
    verify(runny_nose),
    verify(sore_throat).

% Rule for typhoid
typhoid :-
    verify(fever),
    verify(headache),
    verify(abdominal_pain),
    verify(fatigue).

% Rule for malaria
malaria :-
    verify(fever),
    verify(chills),
    verify(sweating),
    verify(nausea).

% Rule for COVID-19 (basic version)
covid :-
    verify(fever),
    verify(dry_cough),
    verify(tiredness),
    verify(loss_of_taste_or_smell).

% Ask the user if a symptom is present
ask(Symptom) :-
    write('Do you have '), write(Symptom), write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      -> assert(yes(Symptom)) ;
         assert(no(Symptom)), fail).

% Check if the symptom has already been confirmed
verify(S) :- yes(S), !.
verify(S) :- no(S), !, fail.
verify(S) :- ask(S).

% Undo all yes/no assertions after diagnosis is done
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.

% Facts to hold dynamic yes/no responses
:- dynamic yes/1, no/1.


