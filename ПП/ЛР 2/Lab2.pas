program lab2;

var s1,s2,s3: string;

function presentLetters(s1,s2: string): string;
var s3:string;
    i:integer;
begin
  for i:=1 to Length(s2) do
    if((pos(s2[i],s1)>0) and (pos(s2[i],s3)=0)) then s3:=s3+s2[i];
  presentLetters:=s3;
end;

begin
Writeln('¬ведите s1:');
Readln(s1);
Writeln('¬ведите s2:');
Readln(s2);
s3:=presentLetters(s1,s2);
Writeln('Ћитеры, присутсвующие в обеих строках: ',s3);
end.