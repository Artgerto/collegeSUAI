program prog;
        var  n, num_before, sum, i, num_after, s1, s2: longint;
            flag: boolean;
begin
     //Обозначаем, что чисел, у которых сумма первых двух цифр равна сумме последних двух цифр, нет 
     flag:=false; 
     Writeln('Введите количество последующих значений =>');
     readln(n);
     sum:=0;
     Writeln('Введите значения по порядку=>');
     for i:=1 to n do
         begin
              //Считываем значение
              readln(num_before);
              num_after:= abs(num_before);
              //Находим последнее и предпоследнее число, затем находим их сумму
              s1:= (num_after mod 10) + (num_after div 10 mod 10);
              //Получаем первые две цифры числа
              while(num_after>=100) do
                             begin
                                  num_after:=num_after div 10;
                             end;
              //Находим сумму первых двух цифр числа
              s2:= (num_after mod 10) + (num_after div 10);
              if (s1=s2)then 
                begin
                sum:=sum + num_before;
                //Обозначаем, что числа, у которых сумма первых двух цифр равна сумме последних двух цифр, найдены
                flag:=true;
                end;
         end;
     //Выводим результат задачи
     if(flag) then Writeln('Сумма чисел, у которых сумма первых двух цифр равна сумме последних двух цифр: ', sum)
                else
                    Writeln('Нет чисел, у которых сумма первых двух цифр равна сумме последних двух цифр')
end.
