program prog;

{¬ариант є19.
ƒана непуста€ последовательность слов из строчных русских букв, между соседними 
словами зап€та€ или пробел, за последним словом - точка. Ќапечатать в алфавитном 
пор€дке все звонкие согласные буквы, которые вход€т в каждое нечетное слово и не 
вход€т хот€ бы в одно четное}

var
  res: set of char;
  str: string;

const
  zv = ['б', 'в', 'г', 'д', 'ж', 'з', 'л', 'м', 'н', 'р', 'й'];
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
  if(res=[]) then Writeln('Ќет звонких согласных букв, которые вход€т в каждое нечетное слово и не вход€т хот€ бы в одно четное')
  else
  for ichar := 'а' to '€' do
    if ichar in res then write(ichar, ' ');
end;

begin
  Readln(str);
  GetResult(str, res);
  OutputSet(res);
end.
