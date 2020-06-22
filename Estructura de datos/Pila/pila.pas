program pila;

// Declaración de constantes
const MaxTam = 1000;

// Declaración de tipos
type
  TipoClave = integer;
  Apuntador = integer;
  TipoItem = record
    Clave: TipoClave;
  end;
  TipoPila = record
    Item: array[1..MaxTam] of TipoItem;
    Cima: Apuntador;
  end;

// Procedimientos y funciones
procedure CreaPilaVacia(var Pila: TipoPila);
begin
  Pila.Cima := 0;
  writeln('Pila creada correctamente');
end;

function Vacia(var Pila: TipoPila): Boolean;
begin
  Vacia := Pila.Cima = 0;
end;

procedure Apila(x: TipoItem; var Pila: TipoPila);
begin
  if Pila.Cima = MaxTam then
    writeln('Error: la pila esta llena')
  else
  begin
    Pila.Cima := Pila.Cima + 1;
    Pila.Item[Pila.Cima] := x;
    writeln('Elemento ', x.Clave, ' apilado correctamente');
  end;
end;

procedure Desapila(var Pila: TipoPila; var Item: TipoItem);
begin
  if Vacia(Pila) then
    writeln('Error: la pila esta vacia')
  else
  begin
    Item := Pila.Item[Pila.Cima];
    Pila.Cima := Pila.Cima - 1;
    writeln('Elemento ', Item.Clave, ' desapilado correctamente');
  end;
end;

function Tamano(Pila: TipoPila): integer;
begin
  Tamano := Pila.Cima;
end;

procedure Muestra(Pila: TipoPila);
var i: integer;
begin
  for i := Tamano(Pila) downto 1 do
  begin
    writeln(Pila.Item[i].Clave);
  end;
end;

procedure Busca(Pila: TipoPila; x: TipoItem);
var i: integer;
var posicion: integer;
var encontrado: boolean;
begin
  posicion := 0;
  encontrado := false;
  for i := Tamano(Pila) downto 1 do
  begin
    if(Pila.Item[i].Clave = x.Clave) then
    begin
      writeln('Elemento ', x.Clave, ' encontrado en la posicion ', posicion);
      encontrado := true;
    end;
    posicion := posicion + 1;
  end;
  if(not encontrado) then
  begin
    writeln('Elemento ', x.Clave, ' no encontrado');
  end;
end;

procedure Modifica(var Pila: TipoPila; dam: TipoItem; dm: TipoItem);
var i: integer;
var posicion: integer;
var modificado: boolean;
begin
  posicion := 0;
  modificado := false;
  for i := Tamano(Pila) downto 1 do
  begin
    if(Pila.Item[i].Clave = dam.Clave) then
    begin
      Pila.Item[i].Clave := dm.Clave;
      writeln(Pila.Item[i].Clave);
      writeln('Elemento ', dam.Clave, ' modificado por ', dm.Clave, ' en la posición ', posicion);
      modificado := true;
    end;
    posicion := posicion + 1;
  end;
  if(not modificado) then
  begin
    writeln('Elemento ', dam.Clave, ' no modificado, dado que no se ha encontrado');
  end;
end;

var PilaPrueba: TipoPila;
var Item: TipoItem;
var Item2: TipoItem;
var opcionMenu: integer;
begin
  repeat
     writeln('+-------------------------------+');
     writeln('|        MENU DE LA PILA        |');
     writeln('+-------------------------------+');
     writeln('| 1. Crear pila                 |');
     writeln('| 2. Apila nodo                 |');
     writeln('| 3. Busca nodo                 |');
     writeln('| 4. Modifica nodo              |');
     writeln('| 5. Desapila nodo              |');
     writeln('| 6. Muestra pila               |');
     writeln('| 7. Salir                      |');
     writeln('+-------------------------------+');
     write('Opcion: ');
     readln(opcionMenu);
     case opcionMenu of
          1: CreaPilaVacia(PilaPrueba);
          2: begin
               writeln('Introduzca el valor de la clave del Item a apilar');
               readln(Item.Clave);
               Apila(Item, PilaPrueba);
          end;
          3: begin
               writeln('Introduzca el valor de la clave del Item a buscar');
               readln(Item.Clave);
               Busca(PilaPrueba, Item);
          end;
          4: begin
               writeln('Introduzca el valor de la clave del Item a modificar');
               readln(Item.Clave);
               writeln('Introduzca el valor de la clave del Item modificado');
               readln(Item2.Clave);
               Modifica(PilaPrueba, Item, Item2);
          end;
          5: begin
              writeln('Introduzca el valor de la clave del Item a desapilar');
              readln(Item.Clave);
              Desapila(PilaPrueba, Item);
          end;
          6: Muestra(PilaPrueba);
          7: writeln('PROGRAMA FINALIZADO');
          else
            writeln('OPCION NO VALIDA');
     end;
  until opcionMenu = 7;
  readln();
end.

