program ideone;

type
  mass = array[1..150, 1..150] of integer;

var
  i, j, n: integer;
  a: mass;
  t: boolean;
  x, y: integer;

procedure printSquare(n: integer; a: mass);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to n do write(a[i, j]:4, ' ');
    writeln();
  end;
end;

{���������� ������� n-�� ������� ��� n=2m + 1 ����� ��������� �� ������� �� ��������, ���� �������� ����������� � ���������. ������ ����� ����� 1 ���������� � ������� ������ ������� ������.
����������� ����� ����������� � �� ������� ������� �� ����������� ���������, ������ ������� � ����� �� ������ ������. ��� ���� ������� ����� � ����, ��� ����� ���������� ������� ������, ��������� ����� ����� �������� � ������ ������ ���, ��� ���� �� ��� ���� �������� ��� ������� �������. ��� ���������� �������� ������� ������� ��������� ����� ������������ � ������� ����� ������� ���, ��� ���� �� �� ��� ������� ��������������� ����� � ������� ������ ��������.
����� ��������� ��� ���������� ������ ��� ������ ��� ����� ���������� ������� ������ �������� ������� �������, ���������� ���������� �� ��������� �� ������ ���� � ����� ���������� ���������� �� ��������� �������}

//������� ������� � �������� �������� N
procedure createOddSquare(n: integer; var a: mass);
var
  i, j, k: integer;
  p, l: integer;
begin
  for i := 1 to n do
    for j := 1 to n do a[i, j] := 0;
  j := n div 2 + 1;p := sqr(n);i := 1;a[i, j] := 1;
  for l := 2 to p do 
  begin
    dec(i);
    inc(j);
    if (i = 0) and (j <> n + 1) then i := n;
    if (j = n + 1) and (i <> 0) then j := 1;
    if ((i = 0) and (j = n + 1)) or (a[i, j] <> 0) then
    begin
      inc(i, 2);
      dec(j);
    end;
    a[i, j] := l;
  end;
end;


{���������� ������� n-�� ������� ��� n=2(2m+1) ����� ��������� �� ���������� �������, ������� ���������� �. ������ � 1918 �. �������� ������� �� ������ ������ �������� �, �, �, D.   
 A     C  
 B     D  
�������� � ����� � �� ������� �� �������� ���������� �������. �� ����� �� 1 �� u2, ��� u = n/2. ����������� ���������� �������� �������� � ��������� �, �, D �������������� �� �����: �� u2+1 �� 2u2, �� 2u2 + 1 �� �u2 � �� �u2 + 1 �� 4u2. ����, ��� ������������ � ���������� ��������� ������� ����� ���������� �� ��������. � ������� ������ �������� � ������� m ������ �� �������� ������ � ������ ����, � � ������ �� ���������� ����� ������� m ������, ��������� � ������ ���� �������� A; ����� � ���� ������� �������� ������� � ������� � ��������������� ������� �������� �. �����, ������� ����� � ������� ������� �� m - 1 ������ ������� �������� �������� � � �������� �� ������� � ���������������� ������� �������� D. }
//n=2(2m+1), ��� m - ����� ���������, �� ������� ����� ����������� ������� ��� ����������

//���������� �������� �� �������� ������� ��������
procedure createSquareOfOrdinaryParity(n: integer; var a: mass);
var
  u, i, j, k, m, z: integer;
  b: mass;
begin
  u := n div 2;
  m := (u - 1) div 2;
        //������ � ����� ������� 1/4 ����� ������� � �������� �������� u
  createOddSquare(u, b);
  k := u * u;
  for i := 1 to n do
    for j := 1 to n do
    begin
      if (i >= 1) and (i <= u) and (j >= 1) and (j <= u) then a[i, j] := b[i, j];
      if (i >= u + 1) and (i <= n) and (j >= u + 1) and (j <= n) then a[i, j] := b[i - u, j - u] + k;
      if (i >= 1) and (i <= u) and (j >= u + 1) and (j <= n) then a[i, j] := b[i, j - u] + 2 * k;
      if (i >= u + 1) and (i <= n) and (j >= 1) and (j <= u) then a[i, j] := b[i - u, j] + 3 * k;
    end;
  for i := 1 to u do
    if i = u div 2 + 1 then 
    begin
      j := u div 2 + 1;
      for k := 1 to m do 
      begin
                        //������ �������
        z := a[i, j];a[i, j] := a[i + u, j];a[i + u, j] := z;
        dec(j);
      end;
    end
            else 
    begin
      j := 1;
      for k := 1 to m do 
      begin
                            //������ �������
        z := a[i, j];a[i, j] := a[i + u, j];a[i + u, j] := z;
        inc(j);
      end;
    end;
  j := n;
  for k := 1 to m - 1 do 
  begin
    for i := 1 to u do 
    begin
                        //������ �������
      z := a[i, j];a[i, j] := a[i + u, j];a[i + u, j] := z;
    end;
    dec(j);
  end;
end;

{���������� �������� ������� n=4m � �������� ������� ��������. ���������� ������� ���������� ������� ����� ��������� ����� ����������� ����� �� I �� 16 � �� ������� ������� � ������� ������� � ����������� ������ �����, ������� � ������������ �������, ��������������� � ��� �������, �������������� ����������� �������� ������ ������������ ������ ��������. �������������� ����� ����������� �� �������: n2-k+1, ��� k-����� � ������. ������������ ������ ������������� �� ������ � ��������� ������� �� ������. }
//n=4m

//���������� �������� �� �������� ������� ��������
procedure createSquareDoubleParity(n: integer; var a: mass);
var
  i, j, k: integer;
  p, l: integer;
  i1, j1, x, y: integer;
begin
  l := 1;p := n * n;
  for i := 1 to n do
    for j := 1 to n do 
    begin
      a[i, j] := l;
      inc(l)
    end;
  i := 2;
  while i <= n - 2 do 
  begin
    if i mod 4 = 0 then j := 4
    else j := 2;
    while j <= n - 2 do 
    begin
      for i1 := 0 to 1 do
        for j1 := 0 to 1 do 
        begin
          y := i + i1;x := j + j1;
          a[y, x] := p - a[y, x] + 1;
        end;
      inc(j, 4);
    end;
    inc(i, 2);
  end;
  k := 4;
  while k <= n - 4 do 
  begin
    a[1, k] := p - a[1, k] + 1;a[1, k + 1] := p - a[1, k + 1] + 1;
    a[n, k] := p - a[n, k] + 1;a[n, k + 1] := p - a[n, k + 1] + 1;
    a[k, 1] := p - a[k, 1] + 1;a[k + 1, 1] := p - a[k + 1, 1] + 1;
    a[k, n] := p - a[k, n] + 1;a[k + 1, n] := p - a[k + 1, n] + 1;
    inc(k, 4);
  end;
  a[1, 1] := p - a[1, 1] + 1;
  a[n, n] := p - a[n, n] + 1;
  a[1, n] := p - a[1, n] + 1;
  a[n, 1] := p - a[n, 1] + 1;
end;

//��������� ����� �� �������, �������� � ���������� ��������
function test(n: integer; a: mass): boolean;
    //������� ��� ������ ���� �� ������� � ��������
var
  s, z: array [1..150] of integer;
        //����� �� ����������
  sd, zd: integer;
  i, j, k: integer;
  sum: integer;
  t: boolean;
begin
  sum := n * (n * n + 1) div 2;
  for k := 1 to n do 
  begin
    s[k] := 0;
    z[k] := 0
  end;
  sd := 0;zd := 0;
  for i := 1 to n do
    for j := 1 to n do 
    begin
      s[i] := s[i] + a[i, j];
      z[j] := z[j] + a[i, j]
    end;
  for k := 1 to n do 
  begin
    sd := sd + a[k, k];
    zd := zd + a[k, n - k + 1];
  end;
  k := 1;t := true;
  while (k <= n) and (t) do 
  begin
                //���������� ������, �������, ������� � �������� ��������� 
    if (s[k] <> sum) or (z[k] <> sum) or (sd <> sum) or (zd <> sum) then t := false;
    inc(k);
  end;
  test := t;
end;

begin
  
  Writeln('NxN - ����������� ��������. ������� N:');
  readln(n);
  
  if odd(n) then createOddSquare(n, a)
  else 
  if n mod 4 = 0 then createSquareDoubleParity(n, a)
  else createSquareOfOrdinaryParity(n, a);
  
  //����� ����������
  if(test(n, a)) then printSquare(n, a) else Writeln('������ ��������� ���������� �������');
  
end.
