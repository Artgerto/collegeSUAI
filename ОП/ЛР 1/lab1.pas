program result;

//Объявление переменных
var  x,x1,x2,x3,min,razn,y: real;
    {min - минимальное положительное значение функции
     razn - разность значений функции при выполнении цикла
     y - ближайшее к установленному min значение функции}
    logpoz, lograzn: boolean;
    {logpoz - индикатор наличия минимального положительного значения функции;
     lograzn - индикатор наличия отличного значения функции}
     
//Задание функции
Function f(x : real) : real;
Begin
  f:= -x;
End;

//Начало
begin
//Считывем промежуток
writeln('Введите промежуток последовательно - x1, x2, затем шаг x3');
readln(x1,x2,x3);

//Ищем минимальное положительное значение функции
logpoz:= false;
x:=x1;
Repeat
    if (f(x)>0) and (logpoz=false) then
        begin
            min:=f(x);
            logpoz:=true;
        end
        else
            if (f(x)>0) and (f(x)<min) then
                min:=f(x);
        x:=x+x3;
until x>x2;

//Ищем ближайшее значение функции
if(logpoz) then
  begin
    Writeln('Минимальное положительное значение функции: ',min:4:2);
    lograzn:=false;
    x:=x1;
    Repeat
    if (f(x)<>min) then
      begin
        if (lograzn=true) then
          begin
            if(abs(f(x)-min)<razn) then 
              begin
                razn:=abs(f(x)-min);
                y:=f(x);
              end
          end
        else
          begin
            razn:=abs(f(x)-min);
            y:=f(x);
            lograzn:=true;
          end
      end;
      x:=x+x3;
      until x>x2;
  end 
else
  Writeln('Нет положительных значений');

if(lograzn) then
  Writeln('Ближайшее значение: ', y:4:2)
else Writeln('Нет ближайших различных значений');

end.
