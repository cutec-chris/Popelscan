unit Image;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, QCCom32,ausgabe;

procedure image_loeschen;
procedure image_loeschen_2;
procedure zeichnen;
procedure neuzeichnen;
Procedure redraw;
procedure last_pic_malen;
procedure Linie_interpolieren;
procedure Kreis_malen;

implementation
uses lasersoftware;

// Nur Zeichenfl�che l�schen
procedure image_loeschen_2;
begin
form1.i1.canvas.Brush.color:=clbtnface;
form1.i1.Canvas.FillRect(rect(0,0,258,258));
end;

// Zeichenfl�che l�schen und Gitter zeichnen
procedure Image_loeschen;
begin
 form1.i1.canvas.Brush.color:=clbtnface;
 form1.i1.Canvas.FillRect(rect(0,0,258,258));
 form1.i1.canvas.pen.color:=10003608;
 form1.i1.canvas.pen.Width:=1;
 form1.i1.Canvas.MoveTo(0,0);form1.i1.canvas.LineTo(256,0);
 form1.i1.Canvas.MoveTo(0,32);form1.i1.canvas.LineTo(256,32);
 form1.i1.Canvas.MoveTo(0,64);form1.i1.canvas.LineTo(256,64);
 form1.i1.Canvas.MoveTo(0,96);form1.i1.canvas.LineTo(256,96);
 form1.i1.Canvas.MoveTo(0,128);form1.i1.canvas.LineTo(256,128);
 form1.i1.Canvas.MoveTo(0,160);form1.i1.canvas.LineTo(256,160);
 form1.i1.Canvas.MoveTo(0,192);form1.i1.canvas.LineTo(256,192);
 form1.i1.Canvas.MoveTo(0,224);form1.i1.canvas.LineTo(256,224);
 form1.i1.Canvas.MoveTo(0,256);form1.i1.canvas.LineTo(256,256);

 form1.i1.Canvas.MoveTo(0,0);form1.i1.canvas.LineTo(0,256);
 form1.i1.Canvas.MoveTo(32,0);form1.i1.canvas.LineTo(32,256);
 form1.i1.Canvas.MoveTo(64,0);form1.i1.canvas.LineTo(64,256);
 form1.i1.Canvas.MoveTo(96,0);form1.i1.canvas.LineTo(96,256);
 form1.i1.Canvas.MoveTo(128,0);form1.i1.canvas.LineTo(128,256);
 form1.i1.Canvas.MoveTo(160,0);form1.i1.canvas.LineTo(160,256);
 form1.i1.Canvas.MoveTo(192,0);form1.i1.canvas.LineTo(192,256);
 form1.i1.Canvas.MoveTo(224,0);form1.i1.canvas.LineTo(224,256);
 form1.i1.Canvas.MoveTo(256,0);form1.i1.canvas.LineTo(256,256);

 form1.i1.canvas.pen.color:=clred;
 form1.i1.canvas.pen.Width:=2;
end;

// Zeichnen nach Mausklick
procedure zeichnen;
begin
if form1.rb1.checked=true then form1.i1.canvas.pen.color:=clblack;
if form1.rb2.checked=true then form1.i1.canvas.pen.color:=clred;
if form1.rb3.checked=true then form1.i1.canvas.pen.color:=64592;
if form1.rb4.checked=true then form1.i1.canvas.pen.color:=clblue;
if form1.rb11.checked=true then form1.i1.canvas.pen.color:=clyellow;
if form1.rb12.checked=true then form1.i1.canvas.pen.color:=clpurple;
if form1.rb13.checked=true then form1.i1.canvas.pen.color:=claqua;
if form1.rb14.checked=true then form1.i1.canvas.pen.color:=clwhite;
// erster Punkt ? ?
   if punkte=0 then
     begin
      // Entweder Port=1 dann ist der erste Punkt geblankt oder
      // alle Punkte mit Farbe  ? ?
      // port:=1;
       form1.i1.canvas.moveto(xneu,yneu);
       xalt:=xneu;yalt:=yneu;
       if xneu>255 then xneu:=255;if yneu>255 then yneu:=255;
       // LB  eintragen
       form1.lb1.items[form1.sb1.position+20]:=
       form1.lb1.items[form1.sb1.position+20]+
       inttohex(port,2)+inttohex(xneu,2)+inttohex(yneu,2);
       punkte:=punkte+3;

     end
// oder doch nicht ?
   else
      begin
        form1.Button3.enabled:=true; //UNDO
        form1.i1.Canvas.LineTo(xneu,yneu);
        xalt:=xneu;yalt:=yneu;
        if form1.rb2.checked=true then port:=2;
        if form1.rb3.checked=true then port:=4;
        if form1.rb4.checked=true then port:=8;
        if form1.rb11.checked=true then port:=6;
        // LB  eintragen
        if xneu>255 then xneu:=255;if yneu>255 then yneu:=255;
        form1.lb1.items[form1.sb1.position+20]:=
        form1.lb1.items[form1.sb1.position+20]+
        inttohex(port,2)+inttohex(xneu,2)+inttohex(yneu,2);
        punkte:=punkte+3;
      end;

end;

// Neuzeichnen
procedure neuzeichnen;
begin
 form1.sb2.position:=strtoint(form1.lb1.items[0]);
 form1.panel3.caption:=inttostr(form1.sb2.position);
 form1.sb3.position:=strtoint(form1.lb1.items[1]);
 form1.panel4.caption:=inttostr(form1.sb3.position);
 form1.sb1.position:=1;
 

end;

procedure redraw;
var x,y,a:integer;
begin
if (copy((form1.lb1.items[form1.sb1.position+20]),1,1)<>'') and
    (punkte=0)
    then
    begin
     port:=strtoint
     ('$'+copy(form1.lb1.items[form1.sb1.position+20],1,2));
     x:=strtoint
     ('$'+copy(form1.lb1.items[form1.sb1.position+20],3,2));
     y:=strtoint
     ('$'+copy(form1.lb1.items[form1.sb1.position+20],5,2));
     form1.i1.Canvas.MoveTo(x,y);
     punkte:=punkte+1;
    end;

if (copy((form1.lb1.items[form1.sb1.position+20]),7,1)<>'') then
 repeat
    port:=strtoint
     ('$'+copy(form1.lb1.items[form1.sb1.position+20],(punkte*6+1),2));
    if port=1 then form1.i1.canvas.pen.color:=clblack;
    if port=2 then form1.i1.canvas.pen.color:=clred;
    if port=4 then form1.i1.canvas.pen.color:=64592;
    if port=8 then form1.i1.canvas.pen.color:=clblue;
    if port=6 then form1.i1.canvas.pen.color:=clyellow;
    if port=10 then form1.i1.canvas.pen.color:=clpurple;
    if port=12 then form1.i1.canvas.pen.color:=claqua;
    if port=14 then form1.i1.canvas.pen.color:=clwhite;
    x:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+20],(punkte*6+3),2));
    y:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+20],(punkte*6+5),2));
        form1.i1.canvas.LineTo(x,y);
    punkte:=punkte+1;
    application.ProcessMessages;
  until copy(form1.lb1.items[form1.sb1.position+20],(punkte*6+6),1)='';

  if port=1 then form1.rb1.checked:=true;
  if port=2 then form1.rb2.checked:=true;
  if port=4 then form1.rb3.checked:=true;
  if port=8 then form1.rb4.checked:=true;
  if port=6 then form1.rb11.checked:=true;
  if port=10 then form1.rb12.checked:=true;
  if port=12 then form1.rb13.checked:=true;
  if port=14 then form1.rb14.checked:=true;

  if form1.cb34.checked=true then last_pic_malen;
  a:=length(form1.lb1.items[form1.sb1.position+20]);
  form1.panel29.caption:=inttostr(round(a/6));
end;

procedure last_pic_malen;
var x,y:integer;b:String;
begin
punkte:=0;
// Alte Malfarbe sichern

form1.i1.canvas.pen.color:=clteal;
// Gibts ein vorheriges Bild ?
b:=copy(form1.lb1.items[form1.sb1.position+19],(punkte*6),2) ;
if (form1.sb1.position>1) and
   (copy(form1.lb1.items[form1.sb1.position+19],(punkte*6),1)<>'') then
  begin
    // MOVE zum ersten Punkt
    punkte:=0;
    x:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+3),2));
    y:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+5),2));
        form1.i1.canvas.moveTo(x,y);
    // Male den Rest
    repeat
    port:=strtoint
     ('$'+copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+1),2));
    if port=1 then form1.i1.canvas.pen.color:=clwhite else
                   form1.i1.canvas.pen.color:=clteal;
    x:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+3),2));
    y:=strtoint
    ('$'+copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+5),2));
        form1.i1.canvas.LineTo(x,y);
    punkte:=punkte+1;
    application.ProcessMessages;
  until copy(form1.lb1.items[form1.sb1.position+19],(punkte*6+6),1)='';
end; // Ende Malrouteine
punkte:=round(length(form1.lb1.items[form1.sb1.position+20])/6);

end;


procedure Linie_interpolieren;
var weg:double;
difx,dify:double;
schrittzaehler:integer;
schrittx,schritty:double;
punktnr:integer;
punkteraster:integer;
i:integer;
xlb,ylb:integer;
Begin
if form1.rb1.checked=true then form1.i1.canvas.pen.color:=clblack;
if form1.rb2.checked=true then form1.i1.canvas.pen.color:=clred;
if form1.rb3.checked=true then form1.i1.canvas.pen.color:=64592;
if form1.rb4.checked=true then form1.i1.canvas.pen.color:=clblue;
if form1.rb11.checked=true then form1.i1.canvas.pen.color:=clyellow;
if form1.rb12.checked=true then form1.i1.canvas.pen.color:=clpurple;
if form1.rb13.checked=true then form1.i1.canvas.pen.color:=claqua;
if form1.rb14.checked=true then form1.i1.canvas.pen.color:=clwhite;
// erster Punkt ? ?
   if punkte=0 then
     begin
      // Entweder Port=1 dann ist der erste Punkt geblankt oder
      // alle Punkte mit Farbe  ? ?
       
       form1.i1.canvas.moveto(xneu,yneu);
       xalt:=xneu;yalt:=yneu;
       if xneu>255 then xneu:=255;if yneu>255 then yneu:=255;
       // LB punkte eintragen
       form1.lb1.items[form1.sb1.position+20]:=
       form1.lb1.items[form1.sb1.position+20]+
       inttohex(port,2)+inttohex(xneu,2)+inttohex(yneu,2);
       punkte:=punkte+3;
       xalt:=xneu;yalt:=yneu;
     end
// oder doch nicht ?
   else
      begin
        form1.Button3.enabled:=true; //UNDO
        //form1.i1.Canvas.LineTo(xneu,yneu);
        if form1.rb2.checked=true then port:=2;
        if form1.rb3.checked=true then port:=4;
        if form1.rb4.checked=true then port:=8;
        if form1.rb11.checked=true then port:=6;
        if form1.rb12.checked=true then port:=10;
        if form1.rb13.checked=true then port:=12;
        if form1.rb14.checked=true then port:=14;
        // Berechnen
        // Differenz bilden
        if xneu>xalt then difx:=xneu-xalt else difx:=xalt-xneu;
        if yneu>yalt then dify:=yneu-yalt else dify:=yalt-yneu;

        // Wer hat den weitesten weg  difx oder divy wird weg.
        if difx>=dify then weg:=difx else weg:=dify;

        // Diese Wegl�nge in Anzahl Schritte aufteilen
        schrittzaehler:=round(weg / (raster));  // War mal raster /2

        // Stepgr�sse pro Schritt festlegen und in positiven Wert wandeln
        if weg >0 then
          begin
            schrittx:=difx / schrittzaehler;
            if xneu=xalt then schrittx:=0;
            schritty:=dify / schrittzaehler;
            if yneu=yalt then schritty:=0;
          end;

        // - - - - - Linie berechnen
        punktnr:=0;

        for i:= 1 to schrittzaehler-1  do
        begin
          if xneu<xalt then xalt:=xalt-schrittx;
          if xneu>xalt then xalt:=xalt+schrittx;
          if yneu<yalt then yalt:=yalt-schritty;
          if yneu>yalt then yalt:=yalt+schritty;

          xlb:=round(xalt);
          ylb:=round(yalt);
          //Punkt eintrage und malen
          if xneu>255 then xneu:=255;if yneu>255 then yneu:=255;
          if xneu< 0 then xneu:=0; if yneu<0 then yneu:=0;
          // Zeichnen
          form1.i1.Canvas.LineTo(round(xlb),round(ylb));

          // Eintragen
          form1.lb1.items[form1.sb1.position+20]:=
          form1.lb1.items[form1.sb1.position+20]+
          inttohex(port,2)+inttohex(xlb,2)+inttohex(ylb,2);
          punkte:=punkte+3;
         end;

        // Letzter Punkt
          for i:=1 to form1.tb3.position do
          begin
            form1.lb1.items[form1.sb1.position+20]:=
            form1.lb1.items[form1.sb1.position+20]+
            inttohex(port,2)+inttohex(xneu,2)+inttohex(yneu,2);
            form1.i1.Canvas.LineTo(round(xneu),round(yneu)) ;
            punkte:=punkte+3;
          end;
       // Alte Werte sichern
       xalt:=xneu;yalt:=yneu;


     end;
end;

procedure Kreis_malen;
var i,a,crradx,crrady,crrad,crport:integer;
begin
     if crstart=false then
     begin

      // Berechnen
      if xneu < centerx then crradx:=centerx-xneu else crradx:=xneu-centerx;
      if yneu < centery then crrady:=centery-yneu else crrady:=yneu-centery;
      if crradx>crrady then crrad:=crradx else crrad:=crrady;
      if crrad=0 then crrad:=1;
      crrad:=crrad-1;
      // Kreis malen
      for i:= 0 to 40 do
        begin
         xneu:=round(sin( (i/(3.1415*2)) )*crrad)+centerx;
         yneu:=round(cos( (I/(3.1415*2)) )*crrad)+centery;
         // Begrenzen , zu gross blanken
         crport:=port;
         if xneu<0 then   begin xneu:=0;crport:=1 end;
         if xneu>255 then begin xneu:=255;crport:=1 end;
         if yneu<0 then   begin yneu:=0;crport:=1 end;
         if yneu>255 then begin yneu:=255;crport:=1;end;
         // Ab in die Listbox
         // WEnns die erste Koordinate in der Linie ist Blankpunkt
         if copy(form1.lb1.items[form1.sb1.position+20],1,1)='' then
            begin
                for a:=0 to form1.tb3.position do
                 begin
                  form1.lb1.items[form1.sb1.position+20]:=
                  inttohex(1,2)+inttohex(xneu,2)+inttohex(yneu,2);
                 end;
            end else
            begin
               if I=0 then
               begin
                 for a:=0 to form1.tb3.position do
                 begin
                  form1.lb1.items[form1.sb1.position+20]:=
                  form1.lb1.items[form1.sb1.position+20]+
                  inttohex(1,2)+inttohex(xneu,2)+inttohex(yneu,2);
                 end;
                 form1.lb1.items[form1.sb1.position+20]:=
                 form1.lb1.items[form1.sb1.position+20]+
                 inttohex(crport,2)+inttohex(xneu,2)+inttohex(yneu,2);
               end else
               begin
                 form1.lb1.items[form1.sb1.position+20]:=
                 form1.lb1.items[form1.sb1.position+20]+
                 inttohex(crport,2)+inttohex(xneu,2)+inttohex(yneu,2);
               end;
            end;

              // div
                 punkte:=round(length(form1.lb1.items[form1.sb1.position+20])/6);
                 form1.lb1.items[2]:=inttostr(punkte); form1.lb1.items[0]:=inttostr(form1.sb2.position);
                 form1.lb1.items[1]:=inttostr(form1.sb3.position);
             // end div

        end; // Ende Schleife Kreis malen
         form1.rb9.checked:=true;
         image_loeschen;
         punkte:=0;
         redraw;

       end else // Ende "crstart:=false;
       begin
         centerx:=xneu;
         centery:=yneu;
         crstart:=false;
         form1.label57.caption:='Click Radius';
       end;
end;


end.
