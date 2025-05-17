% Knowledge base of diagnosis codes and their meanings

diagnosis('A01.0', 'Typhoid Fever').
diagnosis('B02.9', 'Herpes Zoster').
diagnosis('J45', 'Asthma').
diagnosis('I10', 'Hypertension').
diagnosis('E11', 'Type 2 Diabetes').

% Rule to find diagnosis by code
find_diagnosis(Code) :-
    diagnosis(Code, Disease),
    write('Diagnosis: '), write(Disease), nl.

% Rule to find code by disease name
find_code(Disease) :-
    diagnosis(Code, Disease),
    write('Code: '), write(Code), nl.


