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
    Writeln('������� n ���������� ��� ������� y=i+k ��� ������������ i �� 1 �� n');
    Readln(n);
    Writeln('������� k');
    Readln(k);
    Writeln('����� ������������������: ', row(1,n,k,0));
end.
