{������� ��������� ����.
����� � ������ ����������� ����� ������ ����������.
� ������ ���� ���������� ������ � �������� ���-��� ����.}

var
  f, res: Text;
  upr, pl, st, stemp: string;
  fl, fl1: boolean;
  n, k, i, ch: integer;

const
  zn = [',', ' ', '.', ':', ';', '-', '!', '?'];

begin
  assign(f, 'Text.txt');
  Writeln('������� "���" ��� ���������������� �������������� ������������� ���������� ����� Text.txt (����� � ����������) ��� "����" ��� ������� ���������� ����� ���������� �� �������');
  fl := true;
  while(fl) do
  begin
    Readln(upr);
    if(UpperCase(upr) = '���') then
    begin
      fl1 := true;
      Rewrite(f);
      Close(f);
      Writeln('�������� ���� Text.txt � ��������������, ��������� � �������� ���, ����� ������� "+", ����� ����������:');
      while fl1 do 
      begin
        Readln(pl);
        if(pl = '+') then fl1 := false;
      end;
      fl := false;
    end
    else if (UpperCase(upr) = '����') then
    begin
      fl1 := true;
      Writeln('������� ������. ����� ������ ������ ��������� Enter. ��� ���������� ������� "EOF".');
      Rewrite(f);
      while fl1 do 
      begin
        Readln(pl);
        if(pl = 'EOF') then
        begin
          fl1 := false;
        end
            //���������, ����� �� ������������ ������ ������
        else if(pl <> '') then
          Writeln(f, pl);
      end;
      Close(f);
      fl := false;
    end
    else 
    begin
      Writeln('���� �����������. ��������� �����');
    end;
  end;
  Writeln('������� ���-�� ���� ��� �������������� �����');
  Readln(n);
  Assign(res, 'Res.txt');
  Rewrite(res);
  Reset(f);
    //fl ����������, ���� �� ���������� ������ � �����
  fl := false;
    //k - ���-�� ���� � ������ 
  while(not eof(f)) do
  begin
    k := 0;
        //ch - ���-�� ���� � �����
    ch := 0;
    Readln(f, st);
    stemp := st;
    if(not (stemp[length(stemp)] in zn)) then stemp := stemp + '.';
    for i := 1 to length(stemp) do
      if((stemp[i] in zn)) then
      begin
          //�������������� ������� ��� ������, ���� ��������� ������ � ������ ���� ���� �� ������
        if(ch <> 0) then 
        begin
          ch := 0;
          inc(k);
        end
      end
      else inc(ch);
    if(k = n) then 
    begin
      Writeln(res, st);
      fl := true;
    end;
  end;
  if(fl = false) then Writeln(res, '��� ���������� �����');
  Close(res);
  Close(f);
    //����� ����������
  Writeln('���������� ����� ����������:');
  Reset(res);
  while(not eof(res)) do 
  begin
    Readln(res, st);
    Writeln(st);
  end;
  Close(res);
end.