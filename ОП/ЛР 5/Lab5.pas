program pro;

{Заменить заданную подстроку в исходной строке на другую подстроку. Заменяемая и заменяющая подстрока задаются строками, которые могут иметь разную длину}

var s1,s2,s3: string;
    k,a,b:integer;
 
begin
Writeln('Введите исходную строку');
Readln(s1);
Writeln('Введите заменяемую подстроку');
Readln(s2);
Writeln('Введите заменяющую подстроку');
Readln(s3);
a:=1;
b:=length(s1);
while(pos(s2,copy(s1,a,b))>0) do
    begin
      k:=a-1+pos(s2,copy(s1,a,b));
      Delete(s1,k,length(s2));
      Insert(s3,s1,k);
      a:=k+length(s3);
      b:=length(s1)-a+1;
    end;
Writeln('Полученная строка:',s1);
end.
