program prog;

{������� �19.
���� �������� ������������������ ���� �� �������� ������� ����, ����� ��������� 
������� ������� ��� ������, �� ��������� ������ - �����. ���������� � ���������� 
������� ��� ������� ��������� �����, ������� ������ � ������ �������� ����� � �� 
������ ���� �� � ���� ������}

var
  res: set of char;
  str: string;

const
  zv = ['�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�'];
  zn = [',', ' ', '.'];

procedure GetResult(var str: string; var res: set of char);
var
  i, k: integer;
  a1, a2, m: set of char;
begin
  k:=1;
  for i := 1 to str.Length do
    if (str[i] in zn) then
      inc(k)
    else 
    if(str[i] in zv) then
      if(k mod 2 = 0) then
        include(a2, str[i])
      else
        include(a1, str[i]);
  res := a1 - a2;
end;

procedure OutputSet(var res: set of char);
var
  ichar: char;
begin
  if(res=[]) then Writeln('��� ������� ��������� ����, ������� ������ � ������ �������� ����� � �� ������ ���� �� � ���� ������')
  else
  for ichar := '�' to '�' do
    if ichar in res then write(ichar, ' ');
end;

begin
  Readln(str);
  GetResult(str, res);
  OutputSet(res);
end.
