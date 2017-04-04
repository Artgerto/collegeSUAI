{В файле типа char содержатся цифры и знаки '*' и '/'.
Эта последовательность представляет собой арифметическое выражение, которое необходимо вычислить.}

var
  f: file of char;
  i, num: integer;
  str: string;
  temp: char;
  mt, dv, first, err: boolean;
  res: real;

const
  numerals = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

begin
  Assign(f, 'a.dat');
  Rewrite(f);
  Write('Введите арифметическое выражение с умножением и делением:');
  Readln(str);
  for i := 1 to length(str) do
  begin
    if(str[i] in numerals) or (str[i] = '*') or (str[i] = '/') then
      Write(f, str[i]);
  end;
  Seek(f, 0);
  first:=true;
  for i := 1 to fileSize(f) + 1 do
  begin
    if(i <= fileSize(f)) then Read(f, temp) else temp := '=';
    if (temp in numerals) then
      num := num * 10 + ord(temp) - 48
     else
    begin
      if(first) then
      begin
        first := false;
        res := num;
      end;
      if(mt) then
      begin
        res := res * num;
        mt := false;
      end;
      if(dv) then
      begin
        if(num=0) then 
        begin
          err:=true;
          Writeln('Деление на 0!');
          break;
        end
        else
        begin
          res := res / num;
          dv := false;
        end;
      end;
      num := 0;
      if(temp = '*') then mt := true else dv := true;
    end;
  end;
  //for i:=48 to 57 do Writeln(i,' ',chr(i));
  Close(f);
  if(not err) then Writeln('Значение выражения: ', res:10:2);
end.