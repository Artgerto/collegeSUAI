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
  a1, a2, a4, m: set of char;
begin
  k := 1;
  for i := 1 to str.Length do
    if (str[i] in zn) then
    begin
      if (k mod 2 = 0) then
      begin
        if(k = 2) then 
        begin
          a2 := m;
          a4 := m;
        end
        else
        begin
          a2 := a2 + m;
          a4 := a4 * m;
        end;
      end
        else
      begin
        if(k = 1) then a1 := m
        else a1 := a1 * m;
      end;
      inc(k);
      m := [];
    end
    else 
    if(str[i] in zv) then
      include(m, str[i]);
  if((a1 - (a2 - a4) = a1) and ((a2 - a4) <> []) and (((a2 - a4) * a1) = []))
    {������, ����� ��������� �������� � ���������� ����, �������� � ������ �������� �����, � �������� ���������� ����, �� �������� � ���� �� � ���� ������ �����,
    �������� � �������� ���������� ���� ����, �������� � ������ �������� �����. ��������, �������,�����,�������,����,����.}
    then
    res := a1 - (a2 - a4) 
  else 
    res := (a2 - a4) * a1;
end;

procedure OutputSet(var res: set of char);
var
  ichar: char;
begin
  if(res = []) then Writeln('��� ������� ��������� ����, ������� ������ � ������ �������� ����� � �� ������ ���� �� � ���� ������')
  else
    for ichar := '�' to '�' do
      if ichar in res then write(ichar, ' ');
end;

begin
  Readln(str);
  GetResult(str, res);
  OutputSet(res);
end.
