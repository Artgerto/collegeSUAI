program pro;

{В одномерном числовом массиве осуществить циклический сдвиг элементов массива, расположенных между первым четным и последним максимальным.  Если они совпадают , то расположить элементы по убыванию значений}

var mass: array[1..100] of integer;
    i,j,n,firstEven,max,pozMax,sort: integer;
    isEven: boolean;
  
begin
    Writeln('Введите размерность массива');
    Readln(n);
  //Устанавлиеваем, что четное значение не найдено
    isEven:=false;
  //Считываем массив
    Writeln('Введите значения массива по порядку');
    for i:=1 to n do
        Readln(mass[i]);
  Writeln('Исходный массив: ');
    for i:=1 to n do
        Write(mass[i], ' ');
  Writeln;
  //Ищем позицию четного элемента
  for i:=1 to n do
    begin
      if(((mass[i] mod 2)=0) and (mass[i]<>0)) then
        begin
          isEven:=true;
          firstEven:= i;
          break;
         end;
    end;
   
    if(isEven=false)then Writeln('Нет четных значений функции') else
        begin
      //Считаем, что первый элемент максимальный
      max:=mass[1];
      //Запоминаем поцицию максимального элемента
      pozMax:=1;
      //Ищем максимальный элемент массива
      for i:=2 to n do
        begin
          if(mass[i]>max) then
            begin
              max:=mass[i];
              pozMax:=i;
             end;
        end;
      //Если позиции первого четного и последнего максимального совпадают, то сортируем массив по убыванию
      if(pozMax=firstEven) then
        begin
          for i:=1 to n-1 do
            for j:=1 to n-i do
              begin
                if (mass[j] < mass[j+1]) then
                  begin
                    sort := mass[j]; 
                    mass[j] := mass[j+1];
                    mass[j+1] := sort;
                  end;
              end;
          Writeln('Позиции первого четного и последнего максимального совпадают. Массив отсортирован по убыванию:' );
        end
      //В ином случае осуществляем циклический сдвиг элементов массива, расположенных между первым четным и последним максимальным
        else
        begin
            if(abs(pozMax-firstEven)<=2) then Writeln('Сдвиг не нужен') 
                else
                    begin
                      //Делаем так, чтобы pozMax был больше firstEven
                      if(pozMax<firstEven)then 
                        begin
                          sort:=pozMax;
                          pozMax:=firstEven;
                          firstEven:=sort;
                        end;
                      //Осуществляем циклический сдвиг элементов массива
                      for i:=pozMax-2 downto firstEven+1 do
                        begin
                          sort:=mass[i+1];
                          mass[i+1]:=mass[i];
                          mass[i]:=sort;
                        end;
                      Writeln('Осуществлен циклический сдвиг элементов массива, расположенных между первым четным и последним максимальным. Конечный массив:');
                    end;
        end;
    for i:=1 to n do Write(mass[i], ' ');
          Writeln();
    end;
end.
