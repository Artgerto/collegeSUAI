program result;

//���������� ����������
var  x,x1,x2,x3,min,razn,y: real;
    {min - ����������� ������������� �������� �������
     razn - �������� �������� ������� ��� ���������� �����
     y - ��������� � �������������� min �������� �������}
    logpoz, lograzn: boolean;
    {logpoz - ��������� ������� ������������ �������������� �������� �������;
     lograzn - ��������� ������� ��������� �������� �������}
     
//������� �������
Function f(x : real) : real;
Begin
  f:= -x;
End;

//������
begin
//�������� ����������
writeln('������� ���������� ��������������� - x1, x2, ����� ��� x3');
readln(x1,x2,x3);

//���� ����������� ������������� �������� �������
logpoz:= false;
x:=x1;
Repeat
    if (f(x)>0) and (logpoz=false) then
        begin
            min:=f(x);
            logpoz:=true;
        end
        else
            if (f(x)>0) and (f(x)<min) then
                min:=f(x);
        x:=x+x3;
until x>x2;

//���� ��������� �������� �������
if(logpoz) then
  begin
    Writeln('����������� ������������� �������� �������: ',min:4:2);
    lograzn:=false;
    x:=x1;
    Repeat
    if (f(x)<>min) then
      begin
        if (lograzn=true) then
          begin
            if(abs(f(x)-min)<razn) then 
              begin
                razn:=abs(f(x)-min);
                y:=f(x);
              end
          end
        else
          begin
            razn:=abs(f(x)-min);
            y:=f(x);
            lograzn:=true;
          end
      end;
      x:=x+x3;
      until x>x2;
  end 
else
  Writeln('��� ������������� ��������');

if(lograzn) then
  Writeln('��������� ��������: ', y:4:2)
else Writeln('��� ��������� ��������� ��������');

end.
