program pro;

{� ���������� �������� ������� ����������� ����������� ����� ��������� �������, ������������� ����� ������ ������ � ��������� ������������.  ���� ��� ��������� , �� ����������� �������� �� �������� ��������}

var mass: array[1..100] of integer;
    i,j,n,firstEven,max,pozMax,sort: integer;
    isEven: boolean;
  
begin
    Writeln('������� ����������� �������');
    Readln(n);
  //��������������, ��� ������ �������� �� �������
    isEven:=false;
  //��������� ������
    Writeln('������� �������� ������� �� �������');
    for i:=1 to n do
        Readln(mass[i]);
  Writeln('�������� ������: ');
    for i:=1 to n do
        Write(mass[i], ' ');
  Writeln;
  //���� ������� ������� ��������
  for i:=1 to n do
    begin
      if(((mass[i] mod 2)=0) and (mass[i]<>0)) then
        begin
          isEven:=true;
          firstEven:= i;
          break;
         end;
    end;
   
    if(isEven=false)then Writeln('��� ������ �������� �������') else
        begin
      //�������, ��� ������ ������� ������������
      max:=mass[1];
      //���������� ������� ������������� ��������
      pozMax:=1;
      //���� ������������ ������� �������
      for i:=2 to n do
        begin
          if(mass[i]>max) then
            begin
              max:=mass[i];
              pozMax:=i;
             end;
        end;
      //���� ������� ������� ������� � ���������� ������������� ���������, �� ��������� ������ �� ��������
      if(pozMax=firstEven) then
        begin
          for i:=1 to n-1 do
            for j:=1 to n-i do
              begin
                if (mass[j] < mass[j+1]) then
                  begin
                    sort := mass[j]; 
                    mass[j] := mass[j+1];
                    mass[j+1] := sort;
                  end;
              end;
          Writeln('������� ������� ������� � ���������� ������������� ���������. ������ ������������ �� ��������:' );
        end
      //� ���� ������ ������������ ����������� ����� ��������� �������, ������������� ����� ������ ������ � ��������� ������������
        else
        begin
            if(abs(pozMax-firstEven)<=2) then Writeln('����� �� �����') 
                else
                    begin
                      //������ ���, ����� pozMax ��� ������ firstEven
                      if(pozMax<firstEven)then 
                        begin
                          sort:=pozMax;
                          pozMax:=firstEven;
                          firstEven:=sort;
                        end;
                      //������������ ����������� ����� ��������� �������
                      for i:=pozMax-2 downto firstEven+1 do
                        begin
                          sort:=mass[i+1];
                          mass[i+1]:=mass[i];
                          mass[i]:=sort;
                        end;
                      Writeln('����������� ����������� ����� ��������� �������, ������������� ����� ������ ������ � ��������� ������������. �������� ������:');
                    end;
        end;
    for i:=1 to n do Write(mass[i], ' ');
          Writeln();
    end;
end.
