program lab;
var n,k,y: integer;

procedure row(num,n,k: integer; var y: integer);
  begin
    y:=y+num+k;
    if (num < n) then row(num+1,n,k,y);
  end;

begin
    Writeln('¬ведите n повторений дл€ функции y=i+k при измен€ющемс€ i от 1 до n');
    Readln(n);
    Writeln('¬ведите k');
    Readln(k);
    row(1,n,k,y);
    Writeln('—умма последовательности: ', y);
end.

