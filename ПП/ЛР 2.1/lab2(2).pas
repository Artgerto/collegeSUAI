program lab;
var n,k,y: integer;

procedure row(num,n,k: integer; var y: integer);
  begin
    y:=y+num+k;
    if (num < n) then row(num+1,n,k,y);
  end;

begin
    Writeln('������� n ���������� ��� ������� y=i+k ��� ������������ i �� 1 �� n');
    Readln(n);
    Writeln('������� k');
    Readln(k);
    row(1,n,k,y);
    Writeln('����� ������������������: ', y);
end.

