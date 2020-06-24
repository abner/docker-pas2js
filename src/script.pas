program pas2jsweb;

{$mode objfpc}

uses
  JS,
  Classes,
  SysUtils,
  Web;

type
  TCrypt = class

  public
    function crypt(Src: string): string;
    function decrypt(Src: string): string;
  end;


  function TCrypt.crypt(Src: string): string;
  begin
    Result := 'ENCRYPTED';
  end;

  function TCrypt.decrypt(Src: string): string;
  begin
    Result := 'DECRYPTED';
  end;

var
  cryptObject: TCrypt;
  crypted: string;
  deCrypted: string;
begin
  cryptObject := TCrypt.Create;
  // Example: (Do not remove this calls bellow, otherwise the compiler will strip out the functions)
  crypted := cryptObject.crypt('LALALALALA');
  deCrypted := cryptObject.decrypt(crypted);
end.