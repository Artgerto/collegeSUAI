program prog;
        var  n, num_before, sum, i, num_after, s1, s2: longint;
            flag: boolean;
begin
     //����������, ��� �����, � ������� ����� ������ ���� ���� ����� ����� ��������� ���� ����, ��� 
     flag:=false; 
     Writeln('������� ���������� ����������� �������� =>');
     readln(n);
     sum:=0;
     Writeln('������� �������� �� �������=>');
     for i:=1 to n do
         begin
              //��������� ��������
              readln(num_before);
              num_after:= abs(num_before);
              //������� ��������� � ������������� �����, ����� ������� �� �����
              s1:= (num_after mod 10) + (num_after div 10 mod 10);
              //�������� ������ ��� ����� �����
              while(num_after>=100) do
                             begin
                                  num_after:=num_after div 10;
                             end;
              //������� ����� ������ ���� ���� �����
              s2:= (num_after mod 10) + (num_after div 10);
              if (s1=s2)then 
                begin
                sum:=sum + num_before;
                //����������, ��� �����, � ������� ����� ������ ���� ���� ����� ����� ��������� ���� ����, �������
                flag:=true;
                end;
         end;
     //������� ��������� ������
     if(flag) then Writeln('����� �����, � ������� ����� ������ ���� ���� ����� ����� ��������� ���� ����: ', sum)
                else
                    Writeln('��� �����, � ������� ����� ������ ���� ���� ����� ����� ��������� ���� ����')
end.
