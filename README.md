# pas2js Docker

Allow to compile a pascal file to javascript, using the [pas2js](https://wiki.freepascal.org/pas2js) compiler.



## How to execute

### Preparation

In a folder:

* Create a directory called `src` and add a script.pas with your `pas2js` Pascal Code.

* Create a directory called `dist`. The script.js will be compiled into the `dist` directory. 

### Execution

```bash
docker run --rm -it -v $PWD/src:/opt/pas2js/src -v $PWD/dist:/opt/pas2js/dist abner/pas2js:latest
```

If everything runs ok, you script.js will be read to be used.

The default target is nodejs, but you can change it to browser, passing the PAS2JS_TARGET environment variable to docker.

#### Example generating to browser

```bash
docker run --rm -it -e PAS2JS_TARGET="browser" -v $PWD/src:/opt/pas2js/src  -v $PWD/dist:/opt/pas2js/dist abner/pas2js:latest
```

> You can pass a different script name through an environment variable called PAS2JS_INPUT_NAME

## Sample Script 

```pascal
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
  private
    function cryptDecrypt(Action, Src: string): string;
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
  cryptOject: TCrypt;
  crypted: string;
  deCrypted: string;
begin
  cryptOject := TCrypt.Create;
  // Example: (Do not remove this calls bellow, otherwise the compiler will strip out the functions)
  crypted := cryptOject.crypt('LALALALALA');
  deCrypted := cryptOject.decrypt(crypted);
end.
```
## Uses:

https://wiki.freepascal.org/pas2j