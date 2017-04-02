{Создать текстовый файл.
Слова в строке разделяются любым знаком препинания.
В другой файл переписать строки с заданным кол-вом слов.}

var
  f, res: Text;
  upr, pl, st, stemp: string;
  fl, fl1: boolean;
  n, k, i, ch: integer;

const
  zn = [',', ' ', '.', ':', ';', '-', '!', '?'];

begin
  assign(f, 'Text.txt');
  Writeln('Введите "РЕД" для самостоятельного редактирования автоматически созданного файла Text.txt (папка с программой) или "ВВОД" для ручного заполнения файла построково из консоли');
  fl := true;
  while(fl) do
  begin
    Readln(upr);
    if(UpperCase(upr) = 'РЕД') then
    begin
      fl1 := true;
      Rewrite(f);
      Close(f);
      Writeln('Откройте файл Text.txt и отредактируйте, сохраните и закройте его, затем введите "+", чтобы продолжить:');
      while fl1 do 
      begin
        Readln(pl);
        if(pl = '+') then fl1 := false;
      end;
      fl := false;
    end
    else if (UpperCase(upr) = 'ВВОД') then
    begin
      fl1 := true;
      Writeln('Введите строки. После каждой строки нажимайте Enter. Для завершения введите "EOF".');
      Rewrite(f);
      while fl1 do 
      begin
        Readln(pl);
        if(pl = 'EOF') then
        begin
          fl1 := false;
        end
            //Проверяем, чтобы не записывались пустые строки
        else if(pl <> '') then
          Writeln(f, pl);
      end;
      Close(f);
      fl := false;
    end
    else 
    begin
      Writeln('Ввод некорректен. Повторите снова');
    end;
  end;
  Writeln('Введите кол-во слов для переписываемых строк');
  Readln(n);
  Assign(res, 'Res.txt');
  Rewrite(res);
  Reset(f);
    //fl показывает, есть ли подходящие строки в файле
  fl := false;
    //k - кол-во слов в строке 
  while(not eof(f)) do
  begin
    k := 0;
        //ch - кол-во букв в слове
    ch := 0;
    Readln(f, st);
    stemp := st;
    if(not (stemp[length(stemp)] in zn)) then stemp := stemp + '.';
    for i := 1 to length(stemp) do
      if((stemp[i] in zn)) then
      begin
          //Дополнительное условие для случая, если несколько знаков и пробел идут друг за другом
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
  if(fl = false) then Writeln(res, 'Нет подходящих строк');
  Close(res);
  Close(f);
    //Вывод результата
  Writeln('Содержимое файла результата:');
  Reset(res);
  while(not eof(res)) do 
  begin
    Readln(res, st);
    Writeln(st);
  end;
  Close(res);
end.