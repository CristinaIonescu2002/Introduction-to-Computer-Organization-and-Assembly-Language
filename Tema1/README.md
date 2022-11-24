    Main:

- initializez arr cu null (a contribuit la verificarea mea, in caz ca nu introduceam elementele bine)
- aloc memorie pentru un vector "linie" in care voi pune fiecare linie citita
- vad care este primul cuvat si carui task ii apartine
- verific ce fel de task trebuie rezolvat prin cautarea in linie a sintaxei "nume_task " (voi pune un spatiu dupa pentru a imi cauta tot cuvantul nu si parti din alte cuvinte)
- am luat len ca fiind lungimea totala a lui arr

    "Insert":
- scot din fiecare linie cuvintele pe rand, iau un contor ca sa vad ce tip de cuvant am (luand in cosiderare ca sunt: tip nume numar numar nume);
- cu ajutorul acestui contor retin cuvintele din linie in niste constante denumite potrivit
            tip= primul caracter din cuvant primul "cuvat" - (ct=1)
            nume1= al doilea cuvant - (ct=2)
            suma1= prima suma de bani, al treilea cuvant - (ct=3)
            suma2= a doua suma de bani, al patrulea cuvant - (ct=4)
            nume2= ultimul cuvant - (ct=5)
- apoi calculez fiecare lungime in functie de ce tip este (la fiecare lungime se vor lua pentru cele doua nume cate un '\0' pentru a le delimita in arr, in calculul de lungime adun doar 1, deoarece al doilea cuvant a fost copiat si cu '\n')
- initializez structura, pun tipul si lungimea (campului data), asez in ordine cele 5 cuvinte" (cu mentiunea ca numerele-sumele- vor fi schimbate in int-ul cerut de tip si dua e adaugat in data)
- pentru data am grija ca lungimea sa fie contorizata pentru a stii cat trebuie siftat data-ul la adaugare
- apelez add_last

    "Insert_at":
- folosesc acelasi principiu ca si la "Insert" doar ca am grija sa mai scot un cuvant inainte de a incepe procedura de la "insert"
- cuvantul scos va fi convertit in int (asa se va lua indexul)
- apelez add_at

    "Delete_at":
- scot "cuvantul" de dupa delete
- il transform in int => asa fac rost de index
- apelez delete_at

    "Find":
- procedez ca mai sus pentru a afla indexul
- apelez find

    "Print":
-apelez print

    "Exit":
-eliberez memoria
-ies din program fortat


    "Add_last":
- daca arr este gol pur si simplu se aloca memorie de marimea structurii apoi se copiaza toate datele din structura in arr
- daca arr nu e gol la len se va adauga lungimea structurii, apoi structura se va adauga dupa ce exista deja in arr;

    "Add_at":
- daca inexul < 0 se afiseaza orice, in cazul asta 33 XD
-  pentru index==0 => se insereaza la inceput => tot ce este deja in arr se muta cu dimensiunea structurii si se copiaza structura in locul golit
- pentru orice alt index:
    -o sa am un contor care retine pozitia (ajuta la aflarea pozitiei unde trebuie sa adaug noua structura)
    -un contor pt nr de struicturi
    -un contor de ok (imi spunde ca am gasit sau nu indexul)
    -imi iau un pointer la arr si il catez la data_structure pentru a putea sa umblu prin el mai usor
    -daca indexul nu se gaseste, se va cauta dimensiunea lui data din structura respectiva, iar contorul va deveni ct=data->header->len + 5 (stiu ca tipul si lumgimea ocupa 5 bytes)
    -daca ok este 1, se va aloca mai multa memorie pt arr, apoi se va muta tot ce este de la ct in dreapta cu data->header->len+5 tor spre dreapta (asa se va face loc)
    -se copiaza structura actuala in locul facut
    -daca am trecut prin toata structura si indexul nu s-a gasit => structura va fi asezata la final=>doar se aloca memorie mai multa pentru arr si se pun la final elem structurii


    "Find":
- foloseste acelasi principiu ca mai sus doar ca:
    -la index mai < 0 sau > len nu se va afisa nimic
    -in cazul in care structura exista, ok va si = cu 1, apoi se afiseaza tipul din  structura, urmand ca data-ul sa fie luat element cu element.
    -prima data se ia pana la primul '\0' si se afiseaza fiecare character, apoi se sare peste sume (se calculeaza cu cat se sare, tipul dand cati bites ocupa fiecare), apoi se ia tot element cu element pana la al doilea '\0' si se afiseaza caracterele
    -pentru sume ma inrorc la '\0' si iau cele doua sume, convertindu-le in tipul cerut


    "Delete_at"
- daca indexul e mai mare ca nr de structuri se afiseaza 33 
- daca indexul este bun => se trece prin fiecare structura din arr, cand se gaseste indexul se va calcula lungimea "gaurii" (se retine lundimea structurii)
- se copiaza ce e dupa gaura, peste gaura si se schimba lungimea lui arr

    "Printf"
- se foloseste acelasi principiu ca si la afisarea de la find (aici a fost facuta prima daca si schimbata putin pentru a face doar unui element asta)
- totul se face din structura in strctura, mereu se sare cu 5+lung_data_curent




