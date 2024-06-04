#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 6 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z możliwościami narzędzia awk.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego wywołania
# programu `awk` z odpowiednimi argumentami.
# 
#

#
# Zadanie 9.
# Przy pomocy programu awk, przeczytać zawartośc pliku `dodatkowe/nowomowa.txt`
# i wyznaczyć statystykę dotyczącą długości obecnych tam słów – czyli policzyć
# ile jest słów o długości jednego znaku, dwóch znaków, trzech znaków, itd.
# Jako wynik wyświetlić długość słów w znakach i liczbę ich wystapień,
# każdą taką parę w osobnej linii. W obliczeniach pomijamy przecinki i kropki
# – proszę zwrócić uwagę, że niektóre słowa zawierają je na końcu i odpowiednio
# uwzględnić taką sytuację.
#c#


tr -d ',.' < dodatkowe/nowomowa.txt | 
awk '{for (i = 1; i <= NF; i++) {
        len = length($i)
        if (len > 0) {
            word_length_count[len]++S
        }
    }
}
END {for (word_length in word_length_count) {
        print word_length " " word_length_count[word_length]
    }
}'

