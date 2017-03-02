program lab2f;
var n,k,y: integer;

function row(num,n,k,y: integer): integer;
  begin
    y:=y+num+k;
    if (num >= n) then 
      begin
        row:=y;
      end
    else
      row:=row(num+1,n,k,y);
  end;

begin
    Writeln('¬ведите n повторений дл€ функции y=i+k при измен€ющемс€ i от 1 до n');
    Readln(n);
    Writeln('¬ведите k');
    Readln(k);
    Writeln('—умма последовательности: ', row(1,n,k,0));
end.
