program prog;
{������� ���� ������������ �����, ����������� �������� ����� �������� ������� �������������� ��������� �����.}
var f1: file of real;
  i,n: integer;
  temp,min,sum,srar: real;

begin
  Assign(f1, 'a.dat');
  Rewrite(f1);
  Write('������� ���-�� ����: ');
  Readln(n);
  Writeln('������� ������������������ ����:');
  for i:=1 to n do
    begin
      Readln(temp);
      Write(f1,temp);
    end;
  //������� ����������� ������� � �����
  Seek(f1,0);
  Read(f1, temp);
  min:=temp;
  sum:=temp;
  repeat
    Read(f1,temp);
    if(temp<min) then min:=temp;
    sum:=sum+temp;
  until eof(f1);
  //������� ������� �������������� ���� �����
  srar:=sum/fileSize(f1);
  //�������� ����������� �������� ����� ������� ��������������
  Seek(f1,0);
  repeat
    Read(f1,temp);
    if(temp=min) then
      begin
        Seek(f1,filePos(f1)-1);
        write(f1,srar);
      end
  until eof(f1);
  Seek(f1,0);
  Writeln('������������������, ���������� � �����:');
  repeat
    Read(f1,temp);
    Write(temp:5:2, ' ');
  until eof(f1);
  Close(f1);
end.