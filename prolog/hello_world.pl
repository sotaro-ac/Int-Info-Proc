/*
 * "Hello Prolog!" by sotaro-ac@github.com
 */

/* Compile with following predicate:
?- consult(hello_world).
true.
?- [hello_world].         % short hand
true
?- ['hello_world.pl'].    % short hand (full filename)
true
*/

% Hello World
hello_world :- write('Hello World!').

/* Expected Reult:
?- hello_world.
Hello World!
true.
*/
