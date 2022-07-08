unit uRotationalCipher;

interface

  type
    TCipher = class
      function rotate(AText : string; AValue : integer) : string;
    end;

  var
    RotationalCipher : TCipher;

implementation
  uses
    SysUtils;

  function TCipher.rotate(AText : string; AValue : integer) : string;
    var
      i : integer;
    begin
      while 25 < AValue do
        Dec(AValue, 26);
      while (-25) > Avalue do
        Inc(AValue, 26);
      for i := Low(AText) to High(AText) do
        begin
          if ('A' <= AText[i]) AND ('Z' >= AText[i]) then
            begin
              AText[i] := chr(ord(AText[i]) + AValue);
              if 'A' > AText[i] then
                AText[i] := chr(ord(AText[i]) + 26);
              if 'Z' < AText[i] then
                AText[i] := chr(ord(AText[i]) - 26);
            end;
          if ('a' <= AText[i]) AND ('z' >= AText[i]) then
            begin
              AText[i] := chr(ord(AText[i]) + AValue);
              if 'a' > AText[i] then
                AText[i] := chr(ord(AText[i]) + 26);
              if 'z' < AText[i] then
                AText[i] := chr(ord(AText[i]) - 26);
            end;
        end;
      Result := AText;
    end;

initialization
  begin
    RotationalCipher := TCipher.Create;
  end;

finalization
  begin
    RotationalCipher.Free;
  end;

end.
