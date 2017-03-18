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
    res := (a2 - a4) * a1;
end;

procedure OutputSet(var res: set of char);
var
  ichar: char;
begin
  if(res = []) then Writeln('Ќет звонких согласных букв, которые вход€т в каждое нечетное слово и не вход€т хот€ бы в одно четное')
  else
    for ichar := 'а' to '€' do
      if ichar in res then write(ichar, ' ');
end;

begin
  Readln(str);
  GetResult(str, res);
  OutputSet(res);
end.
