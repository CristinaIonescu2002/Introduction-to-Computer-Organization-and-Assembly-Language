## Ionescu Cristina
# TASK1:
## simple.asm
- imi iau un registru pe care il fac 0 si pe care o sa il folosesc pe post de contor pentru forul care va urma (eax)
- mai iau un registru pe care il fac tot 0 si pe care il folosesc pentru a retine cate o litera din cuvant
- labelul 'forloop' care este prima parte din for
- punem in 'ebx' litera din 'plain' apoi adunap pasul la ea
- daca am trecut de litera 'Z' vom merge in labelul 'daca', daca nu mergem in 'continuare' care e a doua parte a forului
- in 'daca' scadem 26 (fiind 26 de litere in alfabet), apoi mergem in 'continuare'
- dupa ce am luat si modificat litera din cuvant, in 'continuare' punem litera in 'enc_string' la pozitia corespunzatoare si crestem contorul
- daca s-a ajuns la finalul cuvantului mergem in 'exit', daca nu reluam 'forloop'-ul

# TASK2:
## points-distance.asm
- in primul rand sunt 2 puncte, deci stim pe ce pozitii sunt in ebx
- si stim din terste ca mereu a doua valuare si la x si la y, e mai pare ca prima
- retinem in ecx si edx, x-ul de la primul punct si x-ul de la al doilea punct
- verificam daca sunt sau nu egale
- daca nu sunt, mergem in 'difx', retinem in rezultat al doilea x (stim ca e cel mai mare) si apoi scadem primul x din el; in cele din urma mergem in exit pentru ca am aflat rezultatul
- daca cei doi x sunt egali, continuam in 'dify' pentru a calcula lungimea cu y
- reluam pasii, retinm in ecx si edx, primul y si al doilea y
- pentru calculul lungimii folosim aceiasi pasi ca la x
- apoi mergem in exit prntru a sari peste 'difx' deoarece am aflat deja lungimea

## road.asm
- in principiu folosim aceeasi gandire ca si mai sus doar ca
- avem grija sa luam pe rand fiecare punct in parte (structura) si sa calculam lungime pentru cate 2 puncte consecutive
- cu un cuntor vom trece prin toate structurile
- pentru x egali, lungimea se calculeaza cu y
- pentru x diferiti, lumgimea se calculeaza cu x
- in ambele cazuri in esi si edi se vor retine valorile corespunzatoare pentru punctul curent si urmator
- aici verificam care dintre ele este mai mare (diferenta trebuie sa fie pozitiva, lungimea fiind pozitiva)
- pentru primul < al doilea se face edi-esi
- pentru primul > al doilea se intra in reverse dif ( 'difx_r' pt x si 'dify_r' pt y) si se face esi-edi
- din fiecare ne vom intoare in for ( 'continuare' partea a doua a for-ului)
- se creste contorul si se verifica daca am ajunsa sau nu la finalul puntelor
- nu este necesara verificarea separata a ultimului punct deoarece: 1. nu mai are alt punct dupa el
          2. a fost folosit la punctul anterior (a fost folosit la distanta)
- cand se ajunge la sfarsitul punctelor se iese din for

## is_square.asm
- facem un contor 0 pentru for (edx)
- luam un contor pentru a vedea daca e sau nu patrat perfect numarul din vectorul de distante, pe care il facem tot 0 (edi) (se verifica si 0, pt ca e si el patrat perfect)
- cu 'edi' se merge in 'verificare'
- in 'esi' calculam patratul lui 'edi' (practiv calculam patrate pana cand gasim patratul prfect al numarului caz in care intram in 'da' sau pana cand depasim numarul, caz in care numarul nu e patrat perfect => mergem in 'nu')
- pana cand ajungem in vreun caz din cele mai sus 'edi' va tot creste si se vor repeta operatiile si verificarile din 'verificare'
- in 'da' punem 1 in vector
- in 'nu' punem 0 in vector
- din ambele ne intoarcem in for ('continuare', la continuarea lui)
- crestem 'edx' (contorul forului)
- daca nu am terminat de parcurs vectorul reintram in 'for'
- daca am terminat va iesi singur
