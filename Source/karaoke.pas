unit Karaoke;{05.03.2017}

  //
  // MIT License
  //
  // Copyright (c) 2017 Jacek Mulawka
  //
  // j.mulawka@interia.pl
  //
  // https://github.com/jacek-mulawka
  //


{$mode objfpc}{$H+}

interface

uses
  SyncObjs,

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, EditBtn, Spin, Windows,
  PasLibVlcPlayerUnit;

type

  { TKaraoke_Form }

  TNapis = class( TStaticText )
  private
    { private declarations }
    czas_od,
    czas_do
      : real;
    procedure Ustaw_Czcionke_Napisu_N();
  public
    { public declarations }
    constructor Create( TheOwner : TComponent );
    destructor Destroy(); override;
  end;

  TWatek = class( TThread )
  protected
    procedure Execute(); override;
  end;

  TKaraoke_Form = class( TForm )
    Dolny_Pasek_Postepu__Ukrywaj_CheckBox: TCheckBox;
    Logo_Image: TImage;
    Nie_Odswiezaj_Widoku_CheckBox: TCheckBox;
    Korekta_Czasu_Narastajaco_Prog_Etykieta_Label: TLabel;
    Korekta_Czasu_Narastajaco_Prezentuj_Roznice_CheckBox: TCheckBox;
    Jedno_Uruchomienie_Programu_CheckBox: TCheckBox;
    ColorDialog1: TColorDialog;
    Czcionka_Napisow_Button: TButton;
    Domyslne_Ustawienia_Button: TButton;
    Czas_Ms_Label: TLabel;
    Korekta_Czasu_Narastajaco_Automatyczna_CheckBox: TCheckBox;
    Korekta_Czasu_Narastajaco_Prog_SpinEdit: TSpinEdit;
    Linie_Spiewu_Wielkosc_Etykieta_Label: TLabel;
    Linie_Spiewu_Wielkosc_SpinEdit: TSpinEdit;
    Dolny_Pasek_Postepu__Wyswietlaj_CheckBox: TCheckBox;
    O_Programie__3_Label: TLabel;
    O_Programie__2_Label: TLabel;
    O_Programie__E_Mail_Label: TLabel;
    O_Programie__Www_Label: TLabel;
    O_Programie__Www__VideoLAN_Label: TLabel;
    O_Programie__Www__PasLibVlc_Label: TLabel;
    O_Programie_ScrollBox: TScrollBox;
    Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox: TCheckBox;
    Pomoc_Memo: TMemo;
    O_Programie__1_Label: TLabel;
    Linie_Spiewu_Odstep_SpinEdit: TSpinEdit;
    Linie_Spiewu_Odstep_Etykieta_Label: TLabel;
    Pomoc_TabSheet: TTabSheet;
    Informacja_StaticText: TStaticText;
    Korekta_Czasu_Narastajaco_Etykieta_Label: TLabel;
    Korekta_Czasu_Narastajaco_SpinEdit: TSpinEdit;
    Czas_Dol_ProgressBar: TProgressBar;
    Test_Napisu_SpinEdit: TSpinEdit;
    Systemowy_Timer: TTimer;
    Ukrywaj_Napisy_Wedlug_RadioGroup: TRadioGroup;
    Zaslona_Panel: TPanel;
    Wczytaj_Ustawienia_Button: TButton;
    Zapisz_Ustawienia_Button: TButton;
    Tlo_Napisow_Button: TButton;
    FontDialog1: TFontDialog;
    Opcje_ScrollBox: TScrollBox;
    Kolor_Linii_Spiewu_Gornej_Button: TButton;
    Kolor_Linii_Spiewu_Srodkowej_Button: TButton;
    Kolor_Linii_Spiewu_Dolnej_Button: TButton;
    Ukryj_Przyciski_Panel_Button: TButton;
    Czas_Test_Label: TLabel;
    Czas_Start_Ustaw_Button: TButton;
    Napisy_EditButton: TEditButton;
    Muzyka_EditButton: TEditButton;
    OpenDialog1: TOpenDialog;
    Opcje_Button: TButton;
    Wyswietlaj_Napisy_Wedlug_RadioGroup: TRadioGroup;
    Tryb_Testowy_Napisow_CheckBox: TCheckBox;
    Skok_Sekundy_SpinEdit: TSpinEdit;
    Zegar_Czestotliwosc_Etykieta_Label: TLabel;
    Pozycja_Obszaru_Spiewu_Etykieta_Label: TLabel;
    Linia_Spiewu_Dol_CheckBox: TCheckBox;
    Linia_Spiewu_Srodek_CheckBox: TCheckBox;
    Linia_Spiewu_Gora_CheckBox: TCheckBox;
    Pozycja_Obszaru_Spiewu_SpinEdit: TSpinEdit;
    Przesuniecie_Napisow_Etykieta_Label: TLabel;
    Zegar_Czestotliwosc_SpinEdit: TSpinEdit;
    Wyczysc_Napisy_Button: TButton;
    Nastepna_Klatka_Button: TButton;
    Wycisz_Button: TButton;
    Czas_ProgressBar: TProgressBar;
    Czas_Label: TLabel;
    Glosnosc_ProgressBar: TProgressBar;
    Glosnosc_Label: TLabel;
    Skok_Do_Tylu_Button: TButton;
    Skok_Do_Przodu_Button: TButton;
    Ciszej_Button: TButton;
    Glosniej_Button: TButton;
    Linia_Spiewu_Gora_StaticText: TStaticText;
    Linia_Spiewu_Srodek_StaticText: TStaticText;
    Memo1: TMemo;
    PageControl1: TPageControl;
    Opcje_TabSheet: TTabSheet;
    Splitter3: TSplitter;
    StaticText1: TStaticText;
    Linia_Spiewu_Dol_StaticText: TStaticText;
    Test_Panel: TPanel;
    Opcje_Splitter: TSplitter;
    O_Programie_TabSheet: TTabSheet;
    Otworz_Plik_Button: TButton;
    Test_TabSheet: TTabSheet;
    Timer1: TTimer;
    Wymiar_Label: TLabel;
    Wznow_Button: TButton;
    Pauza_Button: TButton;
    Stop_Button: TButton;
    Pelny_Ekran_Button: TButton;
    Wczytaj_Napisy_Button: TButton;
    Przyciski_Panel: TPanel;
    PasLibVlcPlayer1: TPasLibVlcPlayer;
    Skok_Sekundy_Etykieta_Label: TLabel;
    Przesuniecie_Napisow_SpinEdit: TSpinEdit;
    procedure FormCreate( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var CloseAction: TCloseAction );
    procedure FormDropFiles( Sender: TObject; const FileNames: array of String );
    procedure FormResize( Sender: TObject );
    procedure Timer1Timer( Sender: TObject );
    procedure Systemowy_TimerTimer( Sender: TObject );
    procedure PasLibVlcPlayer1MediaPlayerTimeChanged( Sender: TObject; time: Int64 );
    procedure PasLibVlcPlayer1MediaPlayerLengthChanged( Sender: TObject; time: Int64 );
    procedure PasLibVlcPlayer1MediaPlayerAudioVolumeChanged( Sender: TObject; volume: Single );
    procedure PasLibVlcPlayer1Resize( Sender: TObject );
    procedure Otworz_Plik_ButtonClick( Sender: TObject );
    procedure Wczytaj_Napisy_ButtonClick( Sender: TObject );
    procedure Wyczysc_Napisy_ButtonClick( Sender: TObject );
    procedure Muzyka_EditButtonButtonClick( Sender: TObject );
    procedure Napisy_EditButtonButtonClick( Sender: TObject );
    procedure Wznow_ButtonClick( Sender: TObject );
    procedure Pauza_ButtonClick( Sender: TObject );
    procedure Stop_ButtonClick( Sender: TObject );
    procedure Skok_Do_Przodu_ButtonClick( Sender: TObject );
    procedure Skok_Do_Tylu_ButtonClick( Sender: TObject );
    procedure Nastepna_Klatka_ButtonClick( Sender: TObject );
    procedure Wycisz_ButtonClick( Sender: TObject );
    procedure Ciszej_ButtonClick( Sender: TObject );
    procedure Glosniej_ButtonClick( Sender: TObject );
    procedure Czas_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Czas_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Glosnosc_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Glosnosc_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Pelny_Ekran_ButtonClick( Sender: TObject );
    procedure Ukryj_Przyciski_Panel_ButtonClick( Sender: TObject );
    procedure Opcje_ButtonClick( Sender: TObject );
    procedure Linie_CheckBoxClick( Sender: TObject );
    procedure Zegar_Czestotliwosc_SpinEditChange( Sender: TObject );
    procedure Wyswietlaj_Napisy_Wedlug_RadioGroupClick( Sender: TObject );
    procedure Czas_Start_Ustaw_ButtonClick( Sender: TObject );
    procedure Czcionka_Napisow_ButtonClick( Sender: TObject );
    procedure Tlo_Napisow_ButtonClick( Sender: TObject );
    procedure Kolor_Linii_Spiewu_ButtonClick( Sender: TObject );
    procedure Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
    procedure Zapisz_Ustawienia_ButtonClick( Sender: TObject );
    procedure Domyslne_Ustawienia_ButtonClick( Sender: TObject );
    procedure Karaoke_Click( Sender: TObject );
    procedure Test_Napisu_SpinEditKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure PasLibVlcPlayer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure PasLibVlcPlayer1MouseUp( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    procedure Karaoke_MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
    procedure Karaoke_MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
    procedure Karaoke_KeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    procedure LinkLabelLinkClick( Sender: TObject );
  private
    { private declarations }
    blokuj_form_show,
    linia_spiewu_gora_widoczna,
    linia_spiewu_srodek_widoczna,
    linia_spiewu_dol_widoczna,
    mysz__przycisk_nacisniety_g,
    needStop, //???
    zamykanie
      : boolean;

    milisekundy_filmu,
    mysz__przycisk_nacisniety__x__start_g,
    mysz__przycisk_nacisniety__y__start_g,
    okno_gora,
    okno_lewo,
    okno_szerokosc,
    okno_wysokosc
      : integer;

    czas_start,
    informacja_czas, // Do odliczania czasu do ukrycia etykiety z informacją o zdarzeniu.
    zegar_systemowy_stop
      : TTime;

    kursor_ruch_data_czas : TDateTime;

    karaoke_handle : THANDLE;

    watek : TWatek;

    napisy_t : array of TNapis;

    sekcja_krytyczna : SyncObjs.TCriticalSection; // Potrzebuje w uses SyncObjs.

    procedure Czas_Pasek_Click( const pozycja_f : integer );
    procedure Dopisz_Plik_Do_Uruchomienia();
    procedure FormParamStr();
    procedure Glosnosc_Pasek_Click( const pozycja_f : integer );
    procedure Informacja_Tekst_Wyswietl( const napis : string; const liczba : variant; const wyswietlaj_zawsze_f : boolean = false );
    function Linie_Spiewu_Odstep_Okresl() : integer;
    procedure Mysz__Przycisk_Nacisniety__Procent_Wylicz( const x_f, y_f : integer; const ustaw_f : boolean = false );
    procedure Napisy__Przelicz();
    procedure Napisy__Wczytaj( const adres_pliku : string );
    procedure Napisy__Zwolnij();
    procedure Otworz_Plik( const adres_pliku : string );
    function Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow( const adres_pliku : string ) : boolean;
    function Pozycja_Obszaru_Spiewu_Okresl() : integer;
    procedure Przerysuj_Zaslone( const wymus : boolean = false );
    procedure Synchronizuj_Milisekundy_Filmu();
    function Ustal_Pozycje( napis : TNapis; czas_filmu_aktualny_f : integer; const loguj : boolean = false ) : integer;
    procedure Ustaw_Czcionke_Napisu( var napis : TNapis );
  public
    { public declarations }
  end;

const
  glosnosc__poziom__minimalny_c : integer = 1;
  glosnosc__poziom__maksymalny_c : integer = 200;

var
  Karaoke_Form: TKaraoke_Form;

implementation

uses
  DateUtils,
  IniFiles,
  LazFileUtils,
  StrUtils;

{$R *.lfm}

//Konstruktor klasy TNapis.
constructor TNapis.Create( TheOwner : TComponent );
begin

  inherited;

  czas_od := -1;
  czas_do := -1;

  Self.Alignment := taCenter;

end;//---//Konstruktor klasy TNapis.

//Destruktor klasy TNapis.
destructor TNapis.Destroy();
begin

  inherited;

end;//---//Destruktor klasy TNapis.

//Funkcja Ustaw_Czcionke_Napisu_N().
procedure TNapis.Ustaw_Czcionke_Napisu_N();
begin

  Karaoke_Form.Wymiar_Label.Caption := Self.Caption;

  Self.Font := Karaoke_Form.Wymiar_Label.Font;

  Self.Width := Karaoke_Form.Wymiar_Label.Width;
  Self.Height := Karaoke_Form.Wymiar_Label.Height;

end;//---//Funkcja Ustaw_Czcionke_Napisu_N().

//Watek.Execute().
procedure TWatek.Execute();
var
  ztt : TTime;
begin

  FreeOnTerminate := true; // zakoncz watek po zaknczeniu tej procedury
  Priority := tpHigher;

  while ( not Application.Terminated )
    and ( not Terminated ) do
    begin

      // Na wszelki wypadek (warunek while jest do sprawdzenia).
      if   ( Application.Terminated )
        or ( Terminated )
        or ( Karaoke_Form.zamykanie ) then
        Break;

      if Karaoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
        begin

          ztt := Now();

          Sleep( Karaoke_Form.Zegar_Czestotliwosc_SpinEdit.Value ); // 1000 = 1 sekunda.
          //Karaoke_Form.Memo1.Lines.Add( 'a' );

          if Karaoke_Form.sekcja_krytyczna <> nil then
            Karaoke_Form.sekcja_krytyczna.Enter();

          if Karaoke_Form.PasLibVlcPlayer1.IsPlay() then
            Karaoke_Form.milisekundy_filmu := Karaoke_Form.milisekundy_filmu + DateUtils.MilliSecondsBetween( Now(), ztt ) + Karaoke_Form.Korekta_Czasu_Narastajaco_SpinEdit.Value;

          //if Abs( Karaoke_Form.milisekundy_filmu - Karaoke_Form.PasLibVlcPlayer1.GetVideoPosInMs() ) > 350 then;
          //  Karaoke_Form.milisekundy_filmu := Karaoke_Form.PasLibVlcPlayer1.GetVideoPosInMs();

          if Karaoke_Form.sekcja_krytyczna <> nil then
            Karaoke_Form.sekcja_krytyczna.Leave();

        end;
      //---//if Karaoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.


      // Na wszelki wypadek (warunek while jest do sprawdzenia).
      if   ( Application.Terminated )
        or ( Terminated )
        or ( Karaoke_Form.zamykanie ) then
        Break;

    end;
  //---//while ( not Application.Terminated ) (...)

end;//---//Watek.Execute().


{ TKaraoke_Form }


//      ***      Funkcje      ***      //

//Funkcja Czas_Pasek_Click().
procedure TKaraoke_Form.Czas_Pasek_Click( const pozycja_f : integer );
var
  procent : real;
  zti : integer;
begin

  //Memo1.Lines.Add(  FloatToStr( pozycja_f )  );

  if Czas_ProgressBar.Width = 0 then
    begin

      PasLibVlcPlayer1.SetVideoPosInMs( 0 );
      Exit;

    end;
  //---//if Czas_ProgressBar.Width = 0 then


  zti := Czas_ProgressBar.Width;

  if zti <= 0 then
    zti := 1;

  procent := 100 * pozycja_f / zti;


  if procent < 0 then
    procent := 0
  else
  if procent > 100 then
    procent := 100;

  procent := procent / 100;


  //Memo1.Lines.Add(  FloatToStr( procent )  );
  //Memo1.Lines.Add(  FloatToStr( PasLibVlcPlayer1.GetVideoLenInMs() * procent )  );
  //Memo1.Lines.Add(  IntToStr( Round( PasLibVlcPlayer1.GetVideoLenInMs() * procent ) )  );


  PasLibVlcPlayer1.SetVideoPosInMs(  Round( PasLibVlcPlayer1.GetVideoLenInMs() * procent )  );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Funkcja Czas_Pasek_Click().

//Funkcja Dopisz_Plik_Do_Uruchomienia().
procedure TKaraoke_Form.Dopisz_Plik_Do_Uruchomienia();
var
  search_rec : TSearchRec;
  tekst_l : TStringList;
  i : integer;
  zts,
  sciezka_do_pliku
    : string;
begin

  sciezka_do_pliku := '';


  for i := 0 to ParamCount do
    begin

      // Sprawdza czy w parametrach jest adres jakiegoś pliku do otworzenia.

      zts := AnsiLowerCase(   ExtractFileExt(  ParamStr( i )  )   );

      if Pos( '.exe', zts ) > 0 then
        Continue;

      sciezka_do_pliku := ParamStr( i );

    end;
  //---//for i := 0 to ParamCount do


  if Trim( sciezka_do_pliku ) = '' then
    Exit;

  i := 0;
  zts := ExtractFilePath( Application.ExeName ) + 'Karaoke_plik';

  while i <= 5 do
    begin

      if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          // Istnieje.
          // Jeżeli plik istnieje - jest przetwarzany przez inną instancję programu, oczekiwanie na zakończenie przetwarzania.

          inc( i );

          SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

          if i >= 5 then
            Exit;

          Sleep( 1000 );

        end
      else//if FindFirst( zts + '.esama_karaoke', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        Break; // Nie istnieje.

    end;
  //---//while i <= 5 do

  tekst_l := TStringList.Create();

  tekst_l.Add( '' );
  tekst_l.Add( sciezka_do_pliku );

  //tekst_l.SaveToFile( zts,  TEncoding.UTF8 ); //???
  tekst_l.SaveToFile( zts );

  tekst_l.Free();

end;//---//Funkcja Dopisz_Plik_Do_Uruchomienia().

//FormParamStr().
procedure TKaraoke_Form.FormParamStr();
var
  i : integer;
  //zts : string;
  //search_rec : TSearchRec;
begin

  for i := 0 to ParamCount do
    begin

      //Memo1.Lines.Add(  ParamStr( i )  );
      //Memo1.Lines.Add(  IntToStr( i )  );

      if Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow(  ParamStr( i )  ) then
        Break;

      //zts := AnsiLowerCase(   ExtractFileExt(  ParamStr( i )  )   );
      //
      //if Pos( '.exe', zts ) > 0 then
      //  Continue;
      //
      //if   (  Pos( '.srt', zts ) > 0  )
      //  or (  Pos( '.txt', zts ) > 0  )
      //  //or (  Pos( '.exe', zts ) > 0  )
      //  or (  Pos( '.esama_karaoke', zts ) > 0  ) then
      //  begin
      //
      //    if FindFirst(  ExtractFilePath(  ParamStr( i )  ) + '*.*', faAnyFile, search_rec  ) = 0 then // Application potrzebuje w uses Forms.
      //      begin
      //
      //        repeat
      //
      //          //zts := ParamStr( i );
      //          //zts := AnsiLowerCase(  ExtractFileNameOnly( search_rec.Name )  );
      //          //zts := AnsiLowerCase(   ExtractFileName(  ParamStr( i )  )   );
      //
      //          if    ( search_rec.Attr <> faDirectory )
      //            and ( search_rec.Name <> '.' )
      //            and ( search_rec.Name <> '..' )
      //            and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> zts   )
      //            and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.srt'   )
      //            and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.txt'   )
      //            and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.esama_karaoke'   )
      //            and (    AnsiLowerCase(  ExtractFileNameOnly( search_rec.Name )  ) = AnsiLowerCase(   ExtractFileNameOnly(  ParamStr( i )  )   )    ) then
      //              begin
      //
      //                zts := ExtractFilePath(  ParamStr( i )  ) + search_rec.Name;
      //                Memo1.Lines.Add( zts );
      //
      //                Muzyka_EditButton.Text := zts;
      //                Otworz_Plik( zts );
      //
      //                Break;
      //
      //              end;
      //
      //        until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wcześniej wywołanej funkcji FindFirst. Jeżeli można przejść do następnego znalezionego pliku zwraca 0.
      //
      //      end;
      //    //---//if FindFirst(  ExtractFilePath(  ParamStr( i )  ), faAnyFile, search_rec  ) = 0 then
      //
      //    SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().
      //
      //    //Memo1.Lines.Add(  IntToStr( i )  );
      //
      //    Break;
      //
      //  end;
      ////---//if   (  Pos( '.srt', zts ) > 0  ) (...)

    end;
  //---//for i := 0 to ParamCount do

end;//---//FormParamStr().

//Funkcja Glosnosc_Pasek_Click().
procedure TKaraoke_Form.Glosnosc_Pasek_Click( const pozycja_f : integer );
var
  procent : real;
  zti : integer;
begin

  // Gdy wartość wynosi 0 to zgłasza błąd dzielenia przez 0.

  //Memo1.Lines.Add(  FloatToStr( pozycja_f )  );

  if Glosnosc_ProgressBar.Width = 0 then
    begin

      PasLibVlcPlayer1.SetAudioVolume( glosnosc__poziom__minimalny_c );
      Exit;

    end;
  //---//if Glosnosc_ProgressBar.Width = 0 then


  zti := Glosnosc_ProgressBar.Width;

  if zti <= 0 then
    zti := 1;

  procent := 100 * pozycja_f / zti;


  if procent < 0 then
    procent := 0;

  if procent > 100 then
    procent := 100;

  procent := procent / 100;

  zti := Round( 200 * procent );

  if zti < glosnosc__poziom__minimalny_c then
    zti := glosnosc__poziom__minimalny_c
  else
  if zti > glosnosc__poziom__maksymalny_c then
    zti := glosnosc__poziom__maksymalny_c;

  //Memo1.Lines.Add(  FloatToStr( procent )  );
  //Memo1.Lines.Add(  FloatToStr( 200 * procent )  );
  //Memo1.Lines.Add(  IntToStr( zti )  );


  PasLibVlcPlayer1.SetAudioVolume( zti );

end;//---//Funkcja Glosnosc_Pasek_Click().

//Funkcja Informacja_Tekst_Wyswietl().
procedure TKaraoke_Form.Informacja_Tekst_Wyswietl( const napis: string; const liczba : variant; const wyswietlaj_zawsze_f : boolean = false );
begin

  if   ( wyswietlaj_zawsze_f )
    or ( Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked ) then
    begin

      if liczba <> null then
        Informacja_StaticText.Caption := napis + ' ' + Trim(  FormatFloat( '### ### ### ### ##0', liczba )  ) + '.'
      else//if liczba <> null then
        Informacja_StaticText.Caption := napis + '.';

      Informacja_StaticText.Visible := true;

      informacja_czas := Now();

      //Przerysuj_Zaslone();

    end;
  //---//if   ( wyswietlaj_zawsze_f ) (...)

end;//Funkcja Informacja_Tekst_Wyswietl().

//Funkcja Linie_Spiewu_Odstep_Okresl().
function TKaraoke_Form.Linie_Spiewu_Odstep_Okresl() : integer;
begin

  // Wyrażone procentem wysokości okna filmu.

  Result := Round( PasLibVlcPlayer1.Height * Linie_Spiewu_Odstep_SpinEdit.Value / 100 );

end;//---//Funkcja Linie_Spiewu_Odstep_Okresl().

//Funkcja Mysz__Przycisk_Nacisniety__Procent_Wylicz().
procedure TKaraoke_Form.Mysz__Przycisk_Nacisniety__Procent_Wylicz( const x_f, y_f : integer; const ustaw_f : boolean = false );

  //Funkcja Milisekundy_W_Napis() w Mysz__Przycisk_Nacisniety__Procent_Wylicz().
  function Milisekundy_W_Napis( milisekundy_f : integer ) : string;
  var
    godzin,
    minut,
    sekund
      : integer;
  begin

    Result := '';

    godzin := 0;
    minut := 0;
    sekund := 0;

    if milisekundy_f >= 1000 then
      begin

        sekund := Trunc( milisekundy_f * 0.001 );
        milisekundy_f := milisekundy_f - sekund * 1000;


        if sekund >= 60 then
          begin

            minut := Trunc( sekund / 60 );
            sekund := sekund - minut * 60;


            if minut >= 60 then
              begin

                godzin:= Trunc( sekund / 60 );
                minut:= minut - godzin * 60;

              end;
            //---//if minut >= 60 then

          end;
        //---//if sekund >= 60 then

      end;
    //---//if milisekund >= 1000 then


    if godzin > 0 then
      Result := Result + Trim(  FormatFloat( '### ### ### ### ##0', godzin )  ) + ' ';

    Result := Result +
      Trim(  FormatFloat( '00', minut )  ) +
      ':' +
      Trim(  FormatFloat( '00', sekund )  );
      // + '.' + Trim(  FormatFloat( '0000', milisekund )  );

  end;//---//Funkcja Milisekundy_W_Napis() w Mysz__Przycisk_Nacisniety__Procent_Wylicz().

var
  czy_minus,
  czy_poziom
    : boolean;

  milisekund__po_zmianie,
  milisekund__roznica,
  ruch__pion_procent
    : integer;

  ruch__poziom_procent : single;

  zts : string;
begin//Funkcja Mysz__Przycisk_Nacisniety__Procent_Wylicz().

  if   ( PasLibVlcPlayer1.Height = 0 )
    or ( PasLibVlcPlayer1.Width = 0 ) then
    Exit;


  ruch__pion_procent :=
      PasLibVlcPlayer1.GetAudioVolume()
    + Round(  100 * ( mysz__przycisk_nacisniety__y__start_g - y_f ) / PasLibVlcPlayer1.Height  );

  if ruch__pion_procent < glosnosc__poziom__minimalny_c then
    ruch__pion_procent := glosnosc__poziom__minimalny_c
  else
  if ruch__pion_procent > glosnosc__poziom__maksymalny_c then
    ruch__pion_procent := glosnosc__poziom__maksymalny_c;


  ruch__poziom_procent :=
      PasLibVlcPlayer1.GetVideoPosInPercent()
    + (  100 * ( x_f - mysz__przycisk_nacisniety__x__start_g ) / PasLibVlcPlayer1.Width  )
    * 0.5;

  if ruch__poziom_procent < 0 then
    ruch__poziom_procent := 0
  else
  if ruch__poziom_procent > 100 then
    ruch__poziom_procent := 100;


  czy_poziom := Abs( mysz__przycisk_nacisniety__x__start_g - x_f ) > Abs( mysz__przycisk_nacisniety__y__start_g - y_f );


  if ustaw_f then
    begin

      if czy_poziom then
        begin

          PasLibVlcPlayer1.SetVideoPosInPercent( ruch__poziom_procent );

          Synchronizuj_Milisekundy_Filmu();


          PasLibVlcPlayer1MediaPlayerTimeChanged( nil, 0 );

        end
      else//if czy_poziom then
        PasLibVlcPlayer1.SetAudioVolume( ruch__pion_procent );

    end;
  //---//if ustaw_f then


  if czy_poziom then
    begin

      milisekund__po_zmianie := Round( PasLibVlcPlayer1.GetVideoLenInMs() * ruch__poziom_procent * 0.01 );

      milisekund__roznica := PasLibVlcPlayer1.GetVideoPosInMs();

      milisekund__roznica := milisekund__po_zmianie - milisekund__roznica;

      czy_minus := milisekund__roznica < 0;

      milisekund__roznica := Abs( milisekund__roznica );


      zts := Milisekundy_W_Napis( milisekund__roznica );

      if czy_minus then
        zts := '-' + zts;


      zts := zts + ' (' + Milisekundy_W_Napis( milisekund__po_zmianie ) + ' / ';

      if czy_minus then
        zts := zts + '-';

      zts := zts + Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__poziom_procent )  ) + '%)';


      Informacja_Tekst_Wyswietl( 'Postęp: ' + zts, null, true );

    end
  else//if czy_poziom then
    Informacja_Tekst_Wyswietl( 'Głośność:', ruch__pion_procent, true );

  //Informacja_Tekst_Wyswietl(   'Wylicz x: ' + Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__poziom_procent )  ) + ' | y ' + Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__pion_procent )  ), null   );


end;//---//Funkcja Mysz__Przycisk_Nacisniety__Procent_Wylicz().

//Funkcja Napisy__Przelicz().
procedure TKaraoke_Form.Napisy__Przelicz();
var
  i,
  j
    : integer;
  czy_ukryc_napis : boolean;
begin

  //BeginFormUpdate();

  for i := 0 to Length( napisy_t ) - 1 do //gdy pusta = 0; z jednym elementem = 1
    if napisy_t[ i ] <> nil then
      begin

        //j := Ustal_Pozycje(  napisy_t[ 0 ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );
        //j := Ustal_Pozycje(  napisy_t[ 0 ], PasLibVlcPlayer1.GetVideoPosInMs()  );

        //Karaoke_Form.Caption := IntToStr( j );


        if not Tryb_Testowy_Napisow_CheckBox.Checked then
          begin

            //j := Ustal_Pozycje(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  );

            if Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex in [ 0, 1 ] then // zegara, filmu.
              j := Ustal_Pozycje(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  )
            else//if Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex in [ 0, 1 ] then // filmu.
              j := Ustal_Pozycje( napisy_t[ i ], milisekundy_filmu );

          end
        else//if not Tryb_Testowy_Napisow_CheckBox.Checked then
          j := Ustal_Pozycje(  napisy_t[ i ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );


        czy_ukryc_napis := false;

        if Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex = 0 then
          begin

            // Górnej krawędzi.

            if   ( j <= 0 )
              or ( j <= PasLibVlcPlayer1.Top ) then
              czy_ukryc_napis := true;

          end
        else//if Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex = 0 then
          begin

            // Dolnej krawędzi.
            // Ukrywaj napisy gdy dolna krawędź opuści obszar śpiewu (plus margines).

            if j + napisy_t[ i ].Height <= Linia_Spiewu_Gora_StaticText.Top - Linie_Spiewu_Odstep_Okresl() then
              czy_ukryc_napis := true;

          end;
        //---//if Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex = 0 then



        //if   ( j <= 0 )
        //or ( j <= PasLibVlcPlayer1.Top )
        if   ( czy_ukryc_napis )
          or ( j >= Karaoke_Form.Height )
          or ( j >= PasLibVlcPlayer1.Top + PasLibVlcPlayer1.Height ) then
          begin

            napisy_t[ i ].Visible := false;
            napisy_t[ i ].Top := -100;

          end
        else//if   ( j <= 0 ) (...)
          begin

            napisy_t[ i ].Visible := true;
            napisy_t[ i ].Top := j;

          end;
        //---//if   ( j <= 0 ) (...)



        if napisy_t[ i ].Visible then
          napisy_t[ i ].Left := Round(  ( PasLibVlcPlayer1.Width - napisy_t[ i ].Width ) / 2  );

        Application.ProcessMessages();

        //napisy_t[ i ].Top := Ustal_Pozycje(  napisy_t[ i ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );
        //napisy_t[ i ].Top := Ustal_Pozycje(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  )


      end;
    //---//if napisy_t[ i ] <> nil then

  //EndFormUpdate();

end;//---//Funkcja Napisy__Przelicz().

//Funkcja Napisy__Wczytaj().
procedure TKaraoke_Form.Napisy__Wczytaj( const adres_pliku: string );

  //Funkcja Dekoduj_Napis_Do_Znaku() w Napisy__Wczytaj().
  function Dekoduj_Napis_Do_Znaku( napis, znak : string ) : string;
  var
    i : integer;
  begin

    Result := '0';

    for i := 1 to Length( napis ) do
      if napis[ i ] = znak then
        Exit
      else//if napis[ i ] = znak then
        //if CharInSet( napis[ i ], [ 0...9 ] ) then
        if CharInSet( napis[ i ], [ '0' .. '9'] ) then
          Result := Result + napis[ i ];

  end;//---//Funkcja Dekoduj_Napis_Do_Znaku() w Napisy__Wczytaj().

var
  czy_byla_liczba,
  czy_dodac_napis
    : boolean;

  i,
  zti
    : integer;
  czas_od,
  czas_do
    : real;

  zts,
  zts_1
    : string;

  tekst_l : TStringList;
begin//Funkcja Napisy__Wczytaj().

  //
  // Format napisów:
  //
  //0
  //00:00:00,001 --> 00:00:00,002
  //przesunięcie napisów=000
  //ukrywanie napisów=dół / góra / brak
  //
  //0
  //00:00:20,000 --> 00:00:42,000
  //abc def
  //123 ghi
  //
  //0 - liczba
  //00:00:20,000 --> 00:00:42,000 - czas od do (gg:mm:ss,sss)
  //abc def - napisy
  //123 ghi - napisy
  //

  Napisy__Zwolnij();


  if Trim( adres_pliku ) = '' then
    Exit;


  tekst_l := TStringList.Create();

  try
    tekst_l.LoadFromFile( adres_pliku );
  except
    on E : Exception do
      begin

        tekst_l.Free();

        Application.MessageBox(   PChar(  'Nie udało się otworzyć pliku napisów.' + #13 + E.Message + ' ' + IntToStr( E.HelpContext )  ), 'Błąd', MB_OK + MB_ICONEXCLAMATION   );
        Exit;

      end;
    //---//on E: Exception do
  end;
  //---//try


  Screen.Cursor := crHourGlass;

  Napisy_EditButton.Text := adres_pliku;

  tekst_l.Add( '0' ); // Aby ostatni napis się dodał.

  czy_byla_liczba := false;
  czy_dodac_napis := false;
  czas_od := -1;
  czas_do := -1;

  Memo1.Lines.Clear();

  Wymiar_Label.Visible := true;

  // Ustawia przesunięcie napisów.
  zts := '';
  zti := 0;

  if tekst_l.Count >= 3 then
    zts := tekst_l[ 2 ]; // Trzecia linijka.

  i := Pos( 'przesunięcie napisów=', zts );

  if i > 0 then
    begin

      i := Pos( '=', zts );

      Delete( zts, 1, i );

      try
        Przesuniecie_Napisow_SpinEdit.Value := StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbę.
        zti := 3;
      except
      end;
      //---//try

    end
  else//if i > 0 then
    if Przesuniecie_Napisow_SpinEdit.Value <> 0 then
      Przesuniecie_Napisow_SpinEdit.Value := 0; // Jeżeli nie zdefiniowano przesunięcia napisów wyzeruje gdyby wcześniej zostało zmienione.
  //---// Ustawia przesunięcie napisów.


  // Ustawia ukrywanie napisów.
  zts := '';

  if tekst_l.Count >= 4 then
    zts := tekst_l[ 3 ]; // Czwarta linijka.

  i := Pos( 'ukrywanie napisów=', zts );

  if i > 0 then
    begin

      inc( zti ); // 4.

      i := Pos( '=', zts );

      Delete( zts, 1, i );

      if Trim( zts ) = 'góra' then
        Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := 0 // Górna krawędź.
      else
      if Trim( zts ) = 'dół' then
        Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := 1; // Dolna krawędź.
      //if Trim( zts ) = 'brak' then
        //Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex; // Nie zmieni sposobu ukrywania napisów.

    end
  ////---//if i > 0 then
  else//if i > 0 then
    if Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex <> 0 then
      Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := 0; // Jeżeli nie zdefiniowano ukrywania napisów ustawi ukrywanie według górnej krawędzi.
  //---// Ustawia ukrywanie napisów.


  //for i := 0 to tekst_l.Count - 1 do
  for i := zti to tekst_l.Count - 1 do
    begin

      // Na początku pierwszej linijki pliku utf-8 jest jakiś znaczek i lepiej dać pierwszą linijkę pustą.
      //zts := tekst_l.Text; // Jako 'abc'#$D#$A'def'#$D#$A gdy treść pliku abc + #13 + def.
      zts := tekst_l[ i ];


      if not czy_byla_liczba then
        begin

          //zts := Trim( zts );
          //zts := Trim(  StringReplace( zts, #$D#$A, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #$A, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #$D, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #187, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #191, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #$187, '', [ rfReplaceAll ] )  );
          //zts := Trim(  StringReplace( zts, #$191, '', [ rfReplaceAll ] )  );

          try
            StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbę.
            czy_byla_liczba := true;
          except
          end;
          //---//try

        end
      else//if not czy_byla_liczba then
        begin

          // Była liczba.

          if    ( czas_od = -1 )
            and ( czas_do = -1 ) then
            begin

              if Pos( ' --> ', zts ) > 0 then
                begin

                  // Wiersz czasu.

                  czas_od := 0;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_od := 60 * 60 * StrToInt( zts_1 ); // gg.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_od := czas_od + 60 * StrToInt( zts_1 ); // mm.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ',' );
                  Delete( zts, 1, Pos( ',', zts )  );

                  czas_od := czas_od + StrToInt( zts_1 ); // ss.

                  czas_od := czas_od * 1000;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ' ' );
                  Delete( zts, 1, Pos( ' ', zts )  );

                  czas_od := czas_od + StrToInt( zts_1 ); // ,sss.

                  Delete( zts, 1, Pos( '>', zts )  );
                  zts := Trim( zts );


                  czas_do := 0;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_do := 60 * 60 * StrToInt( zts_1 ); // gg.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ':' );
                  Delete( zts, 1, Pos( ':', zts )  );

                  czas_do := czas_do + 60 * StrToInt( zts_1 ); // mm.

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ',' );
                  Delete( zts, 1, Pos( ',', zts )  );

                  czas_do := czas_do + StrToInt( zts_1 ); // ss.

                  czas_do := czas_do * 1000;

                  zts_1 := Dekoduj_Napis_Do_Znaku( zts, ' ' );
                  Delete( zts, 1, Pos( ' ', zts )  );

                  czas_do := czas_do + StrToInt( zts_1 ); // ,sss.

                  zts_1 := '';

                end;
              //---//if Pos( ' --> ', zts ) > 0 then

            end
          else//if    ( czas_od = -1 ) (...)
            begin

              // Wiersze tekstu.

              try
                StrToInt( Trim( zts )  ); // Czy wiersz zawiera liczbę.
                czy_dodac_napis := true;
              except
                czy_dodac_napis := false;
              end;
              //---//try

              if not czy_dodac_napis then
                begin

                  // Jeżeli w wierszu nie ma liczby - składa napisy.

                  if zts <> '' then
                    begin

                      if zts_1 <> '' then
                        zts_1 := zts_1 + #13;

                      zts_1 := zts_1 + zts;

                    end;
                  //---//if zts <> '' then

                end
              else//if not czy_dodac_napis then
                begin

                // Jeżeli w wierszu jest liczba - tworzy kolejny napis.

                zti := Length( napisy_t );
                SetLength( napisy_t, zti + 1 );


                napisy_t[ zti ] := TNapis.Create( Application );
                napisy_t[ zti ].Parent := Karaoke_Form;
                napisy_t[ zti ].Name := 'napisy_' + IntToStr( zti ) + '_Napis';
                napisy_t[ zti ].Visible := false;

                Application.ProcessMessages();

                napisy_t[ zti ].czas_od := czas_od; // W ms.
                napisy_t[ zti ].czas_do := czas_do; // W ms.

                napisy_t[ zti ].BringToFront();

                napisy_t[ zti ].AutoSize := false;
                napisy_t[ zti ].ParentColor := false;
                napisy_t[ zti ].Transparent := false;

                napisy_t[ zti ].Caption := zts_1;
                napisy_t[ zti ].Left := Round(  ( PasLibVlcPlayer1.Width - napisy_t[ zti ].Width ) / 2  );
                napisy_t[ zti ].Top := -100;

                napisy_t[ zti ].OnMouseDown := @PasLibVlcPlayer1MouseDown;
                napisy_t[ zti ].OnMouseUp := @PasLibVlcPlayer1MouseUp;
                napisy_t[ zti ].OnMouseMove := @Karaoke_MouseMove;

                Ustaw_Czcionke_Napisu( napisy_t[ zti ] );
                //napisy_t[ zti ].Ustaw_Czcionke_Napisu_N();
                //Wymiar_Label.Caption := zts_1;
                //Wymiar_Label.Font.Size := 20;
                //napisy_t[ zti ].Font.Size := 20;
                //napisy_t[ zti ].Font.Color := clRed;

                //napisy_t[ zti ].Width := Wymiar_Label.Width;
                //napisy_t[ zti ].Height := Wymiar_Label.Height;

                Memo1.Lines.Add(   Trim(  FormatFloat( '### ### ### ### ##0', czas_od )  ) + ' > ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_do )  ) + ' ' + zts_1   ); // Test.


                czy_byla_liczba := true;
                czas_od := -1;
                czas_do := -1;

              end;
              //---//if not czy_dodac_napis then

            end;
          //---//if    ( czas_od = -1 ) (...)

        end;
      //---//if not czy_byla_liczba then


      //Memo1.Lines.Add( zts ); // Test.

    end;
  //---//for i := zti to tekst_l.Count - 1 do


  tekst_l.Free();

  Wymiar_Label.Visible := false;

  Memo1.Lines.Add(    'Razem napisów: ' + Trim(   FormatFloat(  '### ### ### ### ##0', Length( napisy_t ) - 1  )   ) + '.'    ); // Test.

  if not Timer1.Enabled then
    Timer1.Enabled := true; // Zegar czasami się nie włącza.

  Screen.Cursor := crDefault;

end;//---//Funkcja Napisy__Wczytaj().

//Funkcja Napisy__Zwolnij().
procedure TKaraoke_Form.Napisy__Zwolnij();
var
  i : integer;
begin

  Screen.Cursor := crHourGlass;

  for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
    FreeAndNil( napisy_t[ i ] );

  SetLength( napisy_t, 0 );

  Screen.Cursor := crDefault;

end;//---//Funkcja Napisy__Zwolnij().

//Funkcja Otworz_Plik().
procedure TKaraoke_Form.Otworz_Plik( const adres_pliku : string );
var
  search_rec : TSearchRec;
  sciezka_do_pliku,
  zts
    : string;
begin

  if Trim( adres_pliku ) = '' then
    Exit;


  Screen.Cursor := crHourGlass;

  PasLibVlcPlayer1.Play(  WideString( adres_pliku )  );


  if    ( Glosnosc_ProgressBar.Position >= glosnosc__poziom__minimalny_c )
    and ( Glosnosc_ProgressBar.Position <= glosnosc__poziom__maksymalny_c ) then
    PasLibVlcPlayer1.SetAudioVolume( Glosnosc_ProgressBar.Position ); // Jeżeli nie jest wczytany plik to nic się nie zmieni.

  Karaoke_Form.BringToFront();


  Screen.Cursor := crDefault;

  Muzyka_EditButton.Text := adres_pliku;

  needStop := false;

  Czas_ProgressBar.Position := 0;
  Czas_ProgressBar.Max := PasLibVlcPlayer1.GetVideoLenInMs();

  Czas_Dol_ProgressBar.Position := 0;
  Czas_Dol_ProgressBar.Max := Czas_ProgressBar.Max;


  sciezka_do_pliku := adres_pliku;

  zts := ExtractFileExt( adres_pliku );

  zts := StrUtils.ReverseString( zts );
  sciezka_do_pliku := StrUtils.ReverseString( sciezka_do_pliku );
  sciezka_do_pliku := StringReplace( sciezka_do_pliku, zts, '', [] );
  sciezka_do_pliku := StrUtils.ReverseString( sciezka_do_pliku );


  if FindFirst( sciezka_do_pliku + '.esama_karaoke', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      // Istnieje.

      SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

      Napisy__Wczytaj( sciezka_do_pliku + '.esama_karaoke' );

    end
  else//if FindFirst( sciezka_do_pliku + '.esama_karaoke', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
  if FindFirst( sciezka_do_pliku + '.srt', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      // Istnieje.

      SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

      Napisy__Wczytaj( sciezka_do_pliku + '.srt' );

    end
  else//if FindFirst( sciezka_do_pliku + '.srt', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
  if FindFirst( sciezka_do_pliku + '.txt', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    begin

      // Istnieje.

      SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

      Napisy__Wczytaj( sciezka_do_pliku + '.txt' );


    end
  else//if FindFirst( sciezka_do_pliku + '.txt', faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
    SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

  PasLibVlcPlayer1.SetVideoSubtitleById( -1 ); // Wyłączy standardowe wyświetlanie napisów w odtwarzaczu.

  Synchronizuj_Milisekundy_Filmu();

end;//---//Funkcja Otworz_Plik().

//Funkcja Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow().
function TKaraoke_Form.Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow( const adres_pliku : string ) : boolean;
var
  search_rec : TSearchRec;
  zts : string;
begin

  //
  // Funkcja znajdzie plik z rozszerzeniem nie exe i nie napisowym i wywoła funkcję otworzenia tego pliku.
  //

  Result := false;


  if Trim( adres_pliku ) = '' then
    Exit;


  zts := AnsiLowerCase(  ExtractFileExt( adres_pliku )  );

  if Pos( '.exe', zts ) > 0 then
    Exit;

  if   (  Pos( '.srt', zts ) > 0  )
    or (  Pos( '.txt', zts ) > 0  )
    //or (  Pos( '.exe', zts ) > 0  )
    or (  Pos( '.esama_karaoke', zts ) > 0  ) then
    begin

      if FindFirst(  ExtractFilePath( adres_pliku ) + '*.*', faAnyFile, search_rec  ) = 0 then // Application potrzebuje w uses Forms.
        begin

          repeat

            if    ( search_rec.Attr <> faDirectory )
              and ( search_rec.Name <> '.' )
              and ( search_rec.Name <> '..' )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> zts   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.srt'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.txt'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.esama_karaoke'   )
              //and (    AnsiLowerCase(  ExtractFileNameOnly( search_rec.Name )  ) = AnsiLowerCase(   ExtractFileNameOnly( adres_pliku )   )    ) then
              //and (    AnsiLowerCase(   ExtractFileName(  FileUtil.ExtractFileNameWithoutExt( search_rec.Name )  )   ) = AnsiLowerCase(   ExtractFileName(  FileUtil.ExtractFileNameWithoutExt( adres_pliku )  )   )    ) then // Zmiana w lazarusie 2.0 z ExtractFileNameOnly().
              and (    AnsiLowerCase(   ExtractFileName(  LazFileUtils.ExtractFileNameWithoutExt( search_rec.Name )  )   ) = AnsiLowerCase(   ExtractFileName(  LazFileUtils.ExtractFileNameWithoutExt( adres_pliku )  )   )    ) then // Zmiana w lazarusie 3.0 z FileUtil.
                begin

                  Result := true;

                  zts := ExtractFilePath( adres_pliku ) + search_rec.Name;
                  Memo1.Lines.Add( zts );

                  Muzyka_EditButton.Text := zts;
                  Otworz_Plik( zts );

                  Break;

                end;

          until FindNext( search_rec ) <> 0 // Zwraca dane kolejnego pliku zgodnego z parametrami wcześniej wywołanej funkcji FindFirst. Jeżeli można przejść do następnego znalezionego pliku zwraca 0.

        end;
      //---//if FindFirst(  ExtractFilePath( adres_pliku ), faAnyFile, search_rec  ) = 0 then

      SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

    end;
  //---//if   (  Pos( '.srt', zts ) > 0  ) (...)

end;//---//Funkcja Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow().

//Funkcja Pozycja_Obszaru_Spiewu_Okresl().
function TKaraoke_Form.Pozycja_Obszaru_Spiewu_Okresl() : integer;
begin

  // Wyrażone procentem wysokości okna filmu.

  Result := Round( PasLibVlcPlayer1.Height * Pozycja_Obszaru_Spiewu_SpinEdit.Value / 100 );

end;//---//Funkcja Pozycja_Obszaru_Spiewu_Okresl().

//Funkcja Przerysuj_Zaslone().
procedure TKaraoke_Form.Przerysuj_Zaslone( const wymus : boolean = false );
begin

  // Czasami na marginesach wyświetlacza filmu zostają przerysowane fragmenty innych elementów okna.

  if    ( not wymus )
    and ( Nie_Odswiezaj_Widoku_CheckBox.Checked ) then
    Exit;


  PasLibVlcPlayer1.Repaint();

  Zaslona_Panel.Visible := not Zaslona_Panel.Visible;

end;//---//Funkcja Przerysuj_Zaslone().

//Funkcja Synchronizuj_Milisekundy_Filmu().
procedure TKaraoke_Form.Synchronizuj_Milisekundy_Filmu();
begin

  sekcja_krytyczna.Enter();
  milisekundy_filmu := PasLibVlcPlayer1.GetVideoPosInMs();
  sekcja_krytyczna.Leave();

end;//---//Funkcja Synchronizuj_Milisekundy_Filmu().

//Funkcja Ustal_Pozycje().
function TKaraoke_Form.Ustal_Pozycje( napis : TNapis; czas_filmu_aktualny_f : integer; const loguj : boolean = false ) : integer;
var
  przesuniecie_do_okna,
  predkosc_napisu // Prędkość napisu.
    : integer;
  czas_trwania_napisu : real;
begin

  // czas * prędkosć - czas start * prędkosć + wysokość start

  if napis = nil then
    Exit;

  Result := -100;


  czas_trwania_napisu := ( napis.czas_do - napis.czas_od ) / 1000;

  if loguj then
    Memo1.Lines.Add(   'czas_trwania_napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_trwania_napisu )  )   );

  if czas_trwania_napisu <= 0 then
    czas_trwania_napisu := 1;

  //Linia_Spiewu_Dol_StaticText.Height
  predkosc_napisu := Round(  ( 2 * Linie_Spiewu_Odstep_Okresl() + napis.Height + Linia_Spiewu_Dol_StaticText.Height ) / czas_trwania_napisu  );

  if loguj then
    Memo1.Lines.Add(   'predkosc_napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', predkosc_napisu )  )   );

  if predkosc_napisu <= 0 then
    predkosc_napisu := 1;



  if loguj then
    Memo1.Lines.Add(   'Pozycja_Obszaru_Spiewu: ' + Trim(  FormatFloat( '### ### ### ### ##0', Pozycja_Obszaru_Spiewu_Okresl() )  )   );

  //przesuniecie_do_okna := 0;

  // G -> D.
  {
  //przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 );
  przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / Linie_Spiewu_Odstep_SpinEdit.Value );
  //Result := czas_filmu_f * 10;

  //Result := przesuniecie_do_okna + Round(  (( napis.czas_od - czas_filmu_aktualny_f ) / 1000 ) * skok_napisu );
  Result := przesuniecie_do_okna + Round(  ( czas_filmu_aktualny_f / 1000 ) * predkosc_napisu - ( napis.czas_od / 1000 ) * predkosc_napisu );
  }
  //---// G -> D.

  // D -> G.
  przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 + Linie_Spiewu_Odstep_Okresl() ) - Pozycja_Obszaru_Spiewu_Okresl() + Linia_Spiewu_Dol_StaticText.Height;


  if loguj then
    Memo1.Lines.Add(   'przesuniecie_do_okna: ' + Trim(  FormatFloat( '### ### ### ### ##0', przesuniecie_do_okna )  )   );


  //Result := przesuniecie_do_okna - Round(  ( czas_filmu_aktualny_f / 1000 ) * predkosc_napisu - ( napis.czas_od / 1000 ) * predkosc_napisu + ( Przesuniecie_Napisow_SpinEdit.Value / 1000 ) * predkosc_napisu  );

  //Result :=
  //    przesuniecie_do_okna
  //  - Round(
  //    ( czas_filmu_aktualny_f * predkosc_napisu ) / 1000
  //  - ( napis.czas_od * predkosc_napisu ) / 1000
  //  + ( Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu / 1000
  //    );

  if loguj then
    begin

      Memo1.Lines.Add(   'czas_filmu_aktualny_f * predkosc_napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_filmu_aktualny_f * predkosc_napisu )  )   );
      Memo1.Lines.Add(   '- napis.czas_od * predkosc_napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', napis.czas_od * predkosc_napisu )  )   );
      Memo1.Lines.Add(   '+ Przesuniecie_Napisow * predkosc_napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu )  )   );

      Memo1.Lines.Add(  'Razem: ' + FloatToStr(
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu )  );

      Memo1.Lines.Add(   'Razem / 1000: ' + FloatToStr(  (
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu ) / 1000  )   );

      Memo1.Lines.Add(    'Zaokrąglone (Razem / 1000): ' + FloatToStr(   Round(  (
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu ) / 1000  )   )    );

    end;
  //---//if loguj then


  Result :=
      przesuniecie_do_okna
    - Round(
      (
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu
      ) / 1000
      );

  //Result := Result + napis.Height;
  //---// D -> G.

  //Memo1.Lines.Add(   Trim(  FormatFloat( '### ### ### ### ##0', Result )  )   );

  //Result := 0;

end;//---//Funkcja Ustal_Pozycje().

//Funkcja Ustaw_Czcionke_Napisu().
procedure TKaraoke_Form.Ustaw_Czcionke_Napisu( var napis : TNapis );
begin

  if napis = nil then
    Exit;

  Wymiar_Label.Caption := napis.Caption;

  napis.Font := Wymiar_Label.Font;

  napis.Width := Wymiar_Label.Width;
  napis.Height := Wymiar_Label.Height;

  napis.Color := Wymiar_Label.Color;

end;//---//Funkcja Ustaw_Czcionke_Napisu().

//---//      ***      Funkcje      ***      //---//

//FormCreate().
procedure TKaraoke_Form.FormCreate( Sender: TObject );
begin

  blokuj_form_show := false;

  mysz__przycisk_nacisniety_g := false;
  mysz__przycisk_nacisniety__x__start_g := 0;
  mysz__przycisk_nacisniety__y__start_g := 0;

end;//---//FormCreate().

//FormShow().
procedure TKaraoke_Form.FormShow( Sender: TObject );
begin

  if blokuj_form_show then // Zmiana Karaoke_Form.BorderStyle wywołuje FormShow.
    Exit;

  czas_start := 0;
  informacja_czas := 0;
  kursor_ruch_data_czas := Now();
  milisekundy_filmu := 0;
  needStop := true;
  zamykanie := false;
  zegar_systemowy_stop := Now();

  //Karaoke_Form.AllowDropFiles := true;

  PageControl1.ActivePage := Opcje_TabSheet;
  PasLibVlcPlayer1.Align := alClient;
  Zaslona_Panel.Align := alClient;


  try
    if Opcje_ScrollBox.HorzScrollBar.Visible then // Jakiś problem gdy opcje są ukryte.
      Opcje_ScrollBox.HorzScrollBar.Position := 0;
  except
  end;
  //---//try

  try
    if Opcje_ScrollBox.VertScrollBar.Visible then // Jakiś problem gdy opcje są ukryte.
      Opcje_ScrollBox.VertScrollBar.Position := 0;
  except
  end;
  //---//try


  //if 1 = 1 then
  //  begin
  //
  //    Muzyka_EditButton.Text := 'C:\lazarus\Campari mv9.avi';
  //    Napisy_EditButton.Text := 'C:\lazarus\projekty\Karaoke\angela - Shangri-La() - Kopia (2).srt';
  //
  //  end
  //else
  //  begin
  //
  //    Muzyka_EditButton.Text := 'E:\MPlayer\angela - Shangri-La().mp4';
  //    Napisy_EditButton.Text := 'E:\MPlayer\angela - Shangri-La().srt';
  //
  //  end;


  PasLibVlcPlayer1.TabStop := true;
  PasLibVlcPlayer1.OnKeyDown := @Karaoke_KeyDown;

  Karaoke_Click( Sender );

  Opcje_ButtonClick( Sender ); // Jeżeli jakiś element nie był widoczny to nie wywołują się jego zdarzenia.

  Informacja_StaticText.Visible := false;

  Wczytaj_Ustawienia_ButtonClick( Sender );

  Informacja_StaticText.Visible := false;


  karaoke_handle := 0;

  if Jedno_Uruchomienie_Programu_CheckBox.Checked then
    begin

      karaoke_handle := CreateSemaphore( nil, 0, 1, 'UNIKALNA_NAZWA' ); // uses Windows.

      if GetLastError = ERROR_ALREADY_EXISTS then
        begin

          Dopisz_Plik_Do_Uruchomienia();

          Halt();

        end;
      //---//if GetLastError = ERROR_ALREADY_EXISTS then

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then


  Zegar_Czestotliwosc_SpinEditChange( Sender ); // Jeżeli w pliku ini wartość będzie taka sama jak Zegar_Czestotliwosc_SpinEdit to się nie zmieni czas zegara.

  okno_gora := Karaoke_Form.Top;
  okno_lewo := Karaoke_Form.Left;
  okno_wysokosc := Karaoke_Form.Height;
  okno_szerokosc := Karaoke_Form.Width;

  blokuj_form_show := true;

  sekcja_krytyczna := SyncObjs.TCriticalSection.Create();


  FormParamStr();


  Systemowy_Timer.Enabled := true;
  zegar_systemowy_stop := Now();


  //Button1Click( Sender );
  //Button2Click( Sender );

  //StaticText1.Caption := 'abc' + #13 + 'def' + #13 + 'ghi';
  //Wymiar_Label.Caption := StaticText1.Caption;
  //StaticText1.Width := Wymiar_Label.Width;
  //StaticText1.Height := Wymiar_Label.Height;
  ////StaticText1.AutoSize := true;

  //Napisy__Wczytaj( Napisy_EditButton.Text );


  watek := TWatek.Create( false );

  if not watek.Suspended then
    watek.Suspend();


  Linie_CheckBoxClick( Sender );
  PasLibVlcPlayer1Resize( Sender );
  Wyswietlaj_Napisy_Wedlug_RadioGroupClick( Sender );

  Informacja_StaticText.Visible := false;

end;//---//FormShow().

//FormClose().
procedure TKaraoke_Form.FormClose( Sender: TObject; var CloseAction: TCloseAction );
begin

  zamykanie := true;

  Timer1.Enabled := false;
  Systemowy_Timer.Enabled := false;


  watek.Terminate();

  if watek.Suspended then
    watek.Resume();

  //if not watek.Suspended then
  //  watek.Suspend();


  Tryb_Testowy_Napisow_CheckBox.Checked := false;

  PasLibVlcPlayer1.Pause(); // Zatrzymanie filmu blokuje odczyt wartości głośności.

  Zapisz_Ustawienia_ButtonClick( Sender ); // Zatrzymanie filmu blokuje odczyt wartości głośności.


  if karaoke_handle <> 0 then
    CloseHandle( karaoke_handle );


  PasLibVlcPlayer1.Stop();

  Napisy__Zwolnij();

  //watek.Suspend();
  //watek.Terminate();

  //FreeAndNil( watek ); // Nie bo się nie zamknie.

  FreeAndNil( sekcja_krytyczna );

end;//---//FormClose().

//FormDropFiles().
procedure TKaraoke_Form.FormDropFiles( Sender: TObject; const FileNames: array of String );
var
  i : integer;
  zts : string;
begin

  //for i := Low( FileNames ) to High( FileNames ) do
  //  //DoSomeThingWithFile(FileNames[i]);
  //  Memo1.Lines.Add( FileNames[ i ] );

  for i := Low( FileNames ) to High( FileNames ) do
    begin

      //Memo1.Lines.Add( FileNames[ i ] );
      //Memo1.Lines.Add(  ExtractFileExt( FileNames[ i ] )  );
      //Memo1.Lines.Add(   AnsiLowerCase(   ExtractFileExt( FileNames[ i ] )  )   );

      zts := AnsiLowerCase(   ExtractFileExt( FileNames[ i ] )  );

      if   (  Pos( '.srt', zts ) > 0  )
        or (  Pos( '.txt', zts ) > 0  )
        or (  Pos( '.esama_karaoke', zts ) > 0  )then
        begin

          Napisy_EditButton.Text := FileNames[ i ];
          Napisy__Wczytaj( FileNames[ i ] );

        end
      else//if   (  Pos( '.srt', zts ) > 0  ) (...)
        begin

          Muzyka_EditButton.Text := FileNames[ i ];
          Otworz_Plik( FileNames[ i ] );

        end;
      //---//if   (  Pos( '.srt', zts ) > 0  ) (...)


    end;
  //---//for i := Low( FileNames ) to High( FileNames ) do

end;//---//FormDropFiles().

//FormResize().
procedure TKaraoke_Form.FormResize( Sender: TObject );
begin

  //

end;//---//FormResize().

//Timer1Timer().
procedure TKaraoke_Form.Timer1Timer( Sender: TObject );
begin

  if zamykanie then
    begin

      Timer1.Enabled := false;
      Exit;

    end;
  //---//if zamykanie then

  //Przyciski_Panel.Caption := FloatToStr(  DateUtils.SecondsBetween( Now(), czas_start )  ) + ' ' + FloatToStr(  DateUtils.MilliSecondsBetween( Now(), czas_start )  );
  //Przyciski_Panel.Caption := PasLibVlcPlayer1.GetVideoPosStr('hh:mm:ss.ms') + ' ' + IntToStr( PasLibVlcPlayer1.GetVideoPosInMs() ); // / 1000 = s

  if Tryb_Testowy_Napisow_CheckBox.Checked then
    begin

      Czas_Test_Label.Caption := TimeToStr( Now() - czas_start ) + '; ' + Trim(   FormatFloat(  '### ### ### ### ##0', DateUtils.MilliSecondsBetween( Now(), czas_start )  )   );

    end;
  //---//if Tryb_Testowy_Napisow_CheckBox.Checked then


  if Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex in [ 0, 2 ] then // zegara, czasu narastająco.
    begin

      Timer1.Enabled := false;

      //milisekundy_filmu := milisekundy_filmu + Timer1.Interval;
      //milisekundy_filmu := PasLibVlcPlayer1.GetVideoPosInMs();

      Napisy__Przelicz();

      if    ( Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex in [ 2 ] ) // czasu narastająco.
        and ( Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked )
        and (  Abs( milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() ) > 1000  ) then
        Synchronizuj_Milisekundy_Filmu();

      if    ( Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex in [ 2 ] ) // czasu narastająco.
        and ( Korekta_Czasu_Narastajaco_Prezentuj_Roznice_CheckBox.Checked ) then
        Korekta_Czasu_Narastajaco_Prezentuj_Roznice_CheckBox.Caption := FormatFloat( '### ### ### ### ##0', ( milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() ) / 100 );


      if Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked then
        if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() > Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value then
          Korekta_Czasu_Narastajaco_SpinEdit.Value := -1
        else//if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() > Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value then
          if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() < -Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value then
            Korekta_Czasu_Narastajaco_SpinEdit.Value := 1;

      Timer1.Enabled := true;

    end;
  //---//if Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex  in [ 0, 2 ] then


  if Zaslona_Panel.Visible then
    Zaslona_Panel.Visible := false;


  if    ( Karaoke_Form.WindowState = wsMaximized )
    and (  DateUtils.SecondsBetween( Now(), kursor_ruch_data_czas ) > 3  ) then
    Screen.Cursor := crNone;


  if    ( Informacja_StaticText.Visible )
    and (  DateUtils.SecondsBetween( Now(), informacja_czas ) >= 2  ) then
    begin

      Informacja_StaticText.Visible := false;
      Przerysuj_Zaslone();

    end;
  //---//if    ( Informacja_StaticText.Visible ) (...)


  if    ( not Systemowy_Timer.Enabled )
    and (  DateUtils.SecondsBetween( Now(), zegar_systemowy_stop ) > 90 ) then
    Systemowy_Timer.Enabled := true; // Gdyby jakiś błąd spowodował nie włączenie zegara systemowego to spróbuje go włączyć tutaj.


  if    ( PasLibVlcPlayer1.GetAudioVolume() > -1 )
    and ( Glosnosc_ProgressBar.Position <> PasLibVlcPlayer1.GetAudioVolume() ) then
    PasLibVlcPlayer1MediaPlayerAudioVolumeChanged( Sender, -99 ); // Odświeża wskaźnik głośności (czasami podczas włączania utworów wskaźnik głośności ustawia się na -1).

end;//---//Timer1Timer().

//Systemowy_TimerTimer().
procedure TKaraoke_Form.Systemowy_TimerTimer( Sender: TObject );
var
  search_rec : TSearchRec;
  zts : string;
  tekst_l : TStringList;
begin

  if zamykanie then
    begin

      Systemowy_Timer.Enabled := false;
      Exit;

    end;
  //---//if zamykanie then


  Systemowy_Timer.Enabled := false;
  zegar_systemowy_stop := Now();

  if Jedno_Uruchomienie_Programu_CheckBox.Checked then
    begin

      zts := ExtractFilePath( Application.ExeName ) + 'Karaoke_plik';

      if FindFirst( zts, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.
        begin

          // Istnieje.

          SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().


          tekst_l := TStringList.Create();

          try
            tekst_l.LoadFromFile( zts );
          except
            on E : Exception do
              begin

                tekst_l.Free();

                //Application.MessageBox(   PChar(  'Nie udało się otworzyć pliku napisów.' + #13 + E.Message + ' ' + IntToStr( E.HelpContext )  ), 'Błąd', MB_OK + MB_ICONEXCLAMATION   );
                Exit;

              end;
            //---//on E: Exception do
          end;
          //---//try


          if tekst_l.Count >= 2 then
            zts := tekst_l[ 1 ]; // Druga linijka.

          tekst_l.Free();

          DeleteFile(   PChar(  ExtractFilePath( Application.ExeName ) + 'Karaoke_plik'  )   );

          Otworz_Plik_Multimedialny_Pasujacy_Do_Napisow( zts );

          Karaoke_Form.BringToFront();

          Karaoke_Form.FormStyle := fsStayOnTop;
          Karaoke_Form.FormStyle := fsNormal;

        end;
      //---//if FindFirst( sciezka_do_pliku, faAnyFile, search_rec ) = 0 then // Sprawdza czy istnieje plik.

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then

  Systemowy_Timer.Enabled := true;

end;//---//Systemowy_TimerTimer().

//PasLibVlcPlayer1MediaPlayerTimeChanged().
procedure TKaraoke_Form.PasLibVlcPlayer1MediaPlayerTimeChanged( Sender: TObject; time: Int64 );

  //Funkcja Milisekundy_Na_Trzech_Znakach() w PasLibVlcPlayer1MediaPlayerTimeChanged().
  function Milisekundy_Na_Trzech_Znakach( czas_f : string ) : string;
  var
    zti : integer;
    zts : string;
  begin

    //
    // Funkcja zamienia postać milisekund w formie nieprawidłowej na dwóch 00:00:00.12 znakach na formę na trzech znakach 00:00:00.120.
    //
    // Zwraca napis w postaci 00:00:00.012.
    //
    // Parametry:
    //   czas.
    //

    Result := czas_f;

    zti := Pos( '.', czas_f );

    if zti <= 0 then
      Exit;

    zts := Copy(  czas_f, zti + 1, Length( czas_f ) - zti  );

    if Length( zts ) > 2 then
      Exit;

    zts := '0' + zts;

    Delete(  czas_f, zti + 1, Length( czas_f ) - zti  );

    Result := czas_f + zts;

  end;//---//Funkcja Milisekundy_Na_Trzech_Znakach() w PasLibVlcPlayer1MediaPlayerTimeChanged().

begin//PasLibVlcPlayer1MediaPlayerTimeChanged().

  // Jest 00:00:00.12; 00:00:00.120 powinno być 00:00:00.012; 00:00:00.120.

  //Czas_Label.Caption := PasLibVlcPlayer1.GetVideoPosStr('hh:mm:ss.ms') + ' / ' + PasLibVlcPlayer1.GetVideoLenStr('hh:mm:ss.ms');
  Czas_Label.Caption := Milisekundy_Na_Trzech_Znakach(  PasLibVlcPlayer1.GetVideoPosStr( 'hh:mm:ss.ms' )  ) + ' / ' + Milisekundy_Na_Trzech_Znakach(  PasLibVlcPlayer1.GetVideoLenStr( 'hh:mm:ss.ms' )  );
  Czas_Ms_Label.Caption := Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.GetVideoPosInMs() )  ) + ' / ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.GetVideoLenInMs() )  );

  Czas_ProgressBar.Position := PasLibVlcPlayer1.GetVideoPosInMs();
  Czas_Dol_ProgressBar.Position := Czas_ProgressBar.Position;

  if    ( needStop )
    and ( time > 500 ) then
    begin

      needStop := false;
      PasLibVlcPlayer1.Pause();

    end;
  //---//if    ( needStop ) (...)


  if Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 1 then // filmu.
    Napisy__Przelicz();

end;//---//PasLibVlcPlayer1MediaPlayerTimeChanged().

//PasLibVlcPlayer1MediaPlayerLengthChanged().
procedure TKaraoke_Form.PasLibVlcPlayer1MediaPlayerLengthChanged( Sender: TObject; time: Int64 );
begin

  Czas_ProgressBar.Max := PasLibVlcPlayer1.GetVideoLenInMs();
  Czas_Dol_ProgressBar.Max := Czas_ProgressBar.Max;

end;//---//PasLibVlcPlayer1MediaPlayerLengthChanged().

//PasLibVlcPlayer1MediaPlayerAudioVolumeChanged().
procedure TKaraoke_Form.PasLibVlcPlayer1MediaPlayerAudioVolumeChanged( Sender: TObject; volume: Single );
begin

  //Glosnosc_Label.Caption := FloatToStr( volume );
  Glosnosc_Label.Caption := Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.GetAudioVolume() )  );

  Glosnosc_ProgressBar.Position := PasLibVlcPlayer1.GetAudioVolume();

end;//---//PasLibVlcPlayer1MediaPlayerAudioVolumeChanged().

//PasLibVlcPlayer1Resize().
procedure TKaraoke_Form.PasLibVlcPlayer1Resize( Sender: TObject );
begin

  Linia_Spiewu_Srodek_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu_Srodek_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu_Srodek_StaticText.Top := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 ) - Pozycja_Obszaru_Spiewu_Okresl();
  Linia_Spiewu_Srodek_StaticText.Height := Linie_Spiewu_Wielkosc_SpinEdit.Value;

  Linia_Spiewu_Gora_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu_Gora_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu_Gora_StaticText.Top := Linia_Spiewu_Srodek_StaticText.Top - Linie_Spiewu_Odstep_Okresl();
  Linia_Spiewu_Gora_StaticText.Height := Linia_Spiewu_Srodek_StaticText.Height;

  Linia_Spiewu_Dol_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu_Dol_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu_Dol_StaticText.Top := Linia_Spiewu_Srodek_StaticText.Top + Linie_Spiewu_Odstep_Okresl();
  Linia_Spiewu_Dol_StaticText.Height := Linia_Spiewu_Srodek_StaticText.Height;


  Informacja_StaticText.Top := PasLibVlcPlayer1.Top;
  Informacja_StaticText.Left := PasLibVlcPlayer1.Left + 5;

  Przerysuj_Zaslone();

end;//---//PasLibVlcPlayer1Resize().

//Otworz_Plik_ButtonClick().
procedure TKaraoke_Form.Otworz_Plik_ButtonClick( Sender: TObject );
begin

  Otworz_Plik( Muzyka_EditButton.Text );

  Informacja_Tekst_Wyswietl( 'Otwórz plik', null );

end;//---//Otworz_Plik_ButtonClick().

//Wczytaj_Napisy_ButtonClick().
procedure TKaraoke_Form.Wczytaj_Napisy_ButtonClick( Sender: TObject );
begin

  Napisy__Wczytaj( Napisy_EditButton.Text );

  Informacja_Tekst_Wyswietl( 'Wczytaj napisy', null );

end;//---//Wczytaj_Napisy_ButtonClick().

//Wyczysc_Napisy_ButtonClick().
procedure TKaraoke_Form.Wyczysc_Napisy_ButtonClick( Sender: TObject );
begin

  Napisy__Zwolnij();

  Informacja_Tekst_Wyswietl( 'Wyczyść napisy', null );

end;//---//Wyczysc_Napisy_ButtonClick().

//Muzyka_EditButtonButtonClick().
procedure TKaraoke_Form.Muzyka_EditButtonButtonClick( Sender: TObject );
begin

  OpenDialog1.Filter := 'Multimedia|*.wave; *.mp3; *.mpga; *.ogg *.avi; *.mp4; *.mpg; *.mpeg; *.wmv; *.mov; *.mid|Wszystkie|*.*';

  if OpenDialog1.Execute() then
    Otworz_Plik( OpenDialog1.FileName );

end;//---//Muzyka_EditButtonButtonClick().

//Napisy_EditButtonButtonClick().
procedure TKaraoke_Form.Napisy_EditButtonButtonClick( Sender: TObject );
begin

  OpenDialog1.Filter := 'Eryzyjskie|*.esama_karaoke|Tekstowe|*.srt; *.txt|Wszystkie|*.*';

  if OpenDialog1.Execute() then
    Napisy__Wczytaj( OpenDialog1.FileName );

end;//---//Napisy_EditButtonButtonClick().

//Wznow_ButtonClick().
procedure TKaraoke_Form.Wznow_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.Resume();

  Informacja_Tekst_Wyswietl( 'Wznów', null );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Wznow_ButtonClick().

//Pauza_ButtonClick().
procedure TKaraoke_Form.Pauza_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.Pause();

  Informacja_Tekst_Wyswietl( 'Pauza', null );

end;//---//Pauza_ButtonClick().

//Stop_ButtonClick().
procedure TKaraoke_Form.Stop_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.Stop();

  PasLibVlcPlayer1MediaPlayerTimeChanged( Sender, 0 );

  Informacja_Tekst_Wyswietl( 'Stop', null );

end;//---//Stop_ButtonClick().

//Skok_Do_Przodu_ButtonClick().
procedure TKaraoke_Form.Skok_Do_Przodu_ButtonClick( Sender: TObject );
var
  mnoznik_skoku : real;
begin

  if Sender = nil then
    mnoznik_skoku := 10
  else//if Sender = nil then
    if Sender = Skok_Sekundy_SpinEdit then
      mnoznik_skoku := 0.1
    else//if Sender = Skok_Sekundy_SpinEdit then
      mnoznik_skoku := 1;

  if not Tryb_Testowy_Napisow_CheckBox.Checked then
    PasLibVlcPlayer1.SetVideoPosInMs(  Round( PasLibVlcPlayer1.GetVideoPosInMs() + Skok_Sekundy_SpinEdit.Value * 1000 * mnoznik_skoku )  ) // 3000
  else//if not Tryb_Testowy_Napisow_CheckBox.Checked then
    czas_start := DateUtils.IncSecond(  czas_start, Round( -Skok_Sekundy_SpinEdit.Value * mnoznik_skoku )  ); // -3


  Informacja_Tekst_Wyswietl(  'Skok do przodu', Round( Skok_Sekundy_SpinEdit.Value * mnoznik_skoku ) );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Skok_Do_Przodu_ButtonClick().

//Skok_Do_Tylu_ButtonClick().
procedure TKaraoke_Form.Skok_Do_Tylu_ButtonClick( Sender: TObject );
var
  mnoznik_skoku : real;
begin

  if Sender = nil then
    mnoznik_skoku := 10
  else//if Sender = nil then
    if Sender = Skok_Sekundy_SpinEdit then
      mnoznik_skoku := 0.1
    else//if Sender = Skok_Sekundy_SpinEdit then
      mnoznik_skoku := 1;

  if not Tryb_Testowy_Napisow_CheckBox.Checked then
    PasLibVlcPlayer1.SetVideoPosInMs(  Round( PasLibVlcPlayer1.GetVideoPosInMs() - Skok_Sekundy_SpinEdit.Value * 1000 * mnoznik_skoku )  ) // 3000
  else//if not Tryb_Testowy_Napisow_CheckBox.Checked then
    czas_start := DateUtils.IncSecond(  czas_start, Round( Skok_Sekundy_SpinEdit.Value * mnoznik_skoku )  ); // 3

  Informacja_Tekst_Wyswietl(  'Skok do tyłu', Round( Skok_Sekundy_SpinEdit.Value * mnoznik_skoku )  );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Skok_Do_Tylu_ButtonClick().

//Nastepna_Klatka_ButtonClick().
procedure TKaraoke_Form.Nastepna_Klatka_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.NextFrame();

  Informacja_Tekst_Wyswietl( 'Skocz o 1 klatkę do przodu', null );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Nastepna_Klatka_ButtonClick().

//Wycisz_ButtonClick().
procedure TKaraoke_Form.Wycisz_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.SetAudioMute( not PasLibVlcPlayer1.GetAudioMute() );

  if PasLibVlcPlayer1.GetAudioMute() then
    begin

      Wycisz_Button.Font.Style := Wycisz_Button.Font.Style + [ fsUnderline ];

      Informacja_Tekst_Wyswietl( 'Wycisz', null );

    end
  else//if PasLibVlcPlayer1.GetAudioMute() then
    begin

      Wycisz_Button.Font.Style := Wycisz_Button.Font.Style - [ fsUnderline ];

      Informacja_Tekst_Wyswietl( 'Anuluj wyciszenie', null );

    end;
  //---//if PasLibVlcPlayer1.GetAudioMute() then

end;//---//Wycisz_ButtonClick().

//Ciszej_ButtonClick().
procedure TKaraoke_Form.Ciszej_ButtonClick( Sender: TObject );
var
  zti,
  mnoznik_skoku
    : integer;
begin

  // Gdy wartość wynosi 0 to zgłasza błąd dzielenia przez 0.

  if Sender = nil then
    mnoznik_skoku := 1
  else//if Sender = nil then
    mnoznik_skoku := 10;

  zti := PasLibVlcPlayer1.GetAudioVolume() - mnoznik_skoku;

  if zti < glosnosc__poziom__minimalny_c then
    zti := glosnosc__poziom__minimalny_c
  else
  if zti > glosnosc__poziom__maksymalny_c then
    zti := glosnosc__poziom__maksymalny_c;

  PasLibVlcPlayer1.SetAudioVolume( zti );

  Informacja_Tekst_Wyswietl( 'Ciszej', zti );

end;//---//Ciszej_ButtonClick().

//Glosniej_ButtonClick().
procedure TKaraoke_Form.Glosniej_ButtonClick( Sender: TObject );
var
  zti,
  mnoznik_skoku
    : integer;
begin

  if Sender = nil then
    mnoznik_skoku := 1
  else//if Sender = nil then
    mnoznik_skoku := 10;

  zti := PasLibVlcPlayer1.GetAudioVolume() + mnoznik_skoku;

  if zti < glosnosc__poziom__minimalny_c then
    zti := glosnosc__poziom__minimalny_c
  else
  if zti > glosnosc__poziom__maksymalny_c then
    zti := glosnosc__poziom__maksymalny_c;

  PasLibVlcPlayer1.SetAudioVolume( zti );

  Informacja_Tekst_Wyswietl( 'Głośniej', zti );

end;//---//Glosniej_ButtonClick().

//Czas_ProgressBarMouseDown().
procedure TKaraoke_Form.Czas_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Czas_Pasek_Click( X );

end;//---//Czas_ProgressBarMouseDown().

//Czas_ProgressBarMouseMove().
procedure TKaraoke_Form.Czas_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Czas_Pasek_Click( X );

end;//---//Czas_ProgressBarMouseMove().

//Glosnosc_ProgressBarMouseDown().
procedure TKaraoke_Form.Glosnosc_ProgressBarMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Glosnosc_Pasek_Click( X );

end;//---//Glosnosc_ProgressBarMouseDown().

//Glosnosc_ProgressBarMouseMove().
procedure TKaraoke_Form.Glosnosc_ProgressBarMouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  if ssLeft in Shift then
    Glosnosc_Pasek_Click( X );

end;//---//Glosnosc_ProgressBarMouseMove().

//Pelny_Ekran_ButtonClick().
procedure TKaraoke_Form.Pelny_Ekran_ButtonClick( Sender: TObject );
var
  pozycja_procent : single;
  zts : string;
label
  normalny_ekran_l;
begin

  // Nie działa dobrze.

  //Karaoke_Form.SetBounds( Monitor.Left, Monitor.Top, Monitor.Width, Monitor.Height );
  //Karaoke_Form.FormStyle := fsStayOnTop;
  //Karaoke_Form.WindowState := wsMaximized;
  //Karaoke_Form.BorderStyle := bsNone;

  pozycja_procent := PasLibVlcPlayer1.GetVideoPosInPercent();


  if Sender = nil then
    goto normalny_ekran_l;


  if Karaoke_Form.BorderStyle <> bsNone then
    begin

      okno_gora := Karaoke_Form.Top;
      okno_lewo := Karaoke_Form.Left;
      okno_wysokosc := Karaoke_Form.Height;
      okno_szerokosc := Karaoke_Form.Width;

      Karaoke_Form.WindowState := wsMaximized;
      Karaoke_Form.BorderStyle := bsNone;
      Przyciski_Panel.Visible := false;

      Informacja_Tekst_Wyswietl( 'Pełny ekran', null );

    end
  else//if Karaoke_Form.BorderStyle <> bsNone then
    begin

      normalny_ekran_l:

      Przyciski_Panel.Visible := true;
      Karaoke_Form.WindowState := wsNormal;
      Karaoke_Form.BorderStyle := bsSizeable;

      Karaoke_Form.Top := okno_gora;
      Karaoke_Form.Left := okno_lewo;
      Karaoke_Form.Height := okno_wysokosc;
      Karaoke_Form.Width := okno_szerokosc;

      Informacja_Tekst_Wyswietl( 'Normalny ekran', null );

    end;
  //---//if Karaoke_Form.BorderStyle <> bsNone then

  zts := AnsiLowerCase(  ExtractFileExt( Muzyka_EditButton.Text )  );

  // Jeżeli plik jest bez obrazu to nie przeładowuje.
  if    ( zts <> 'wave' )
    and ( zts <> 'mp3' )
    and ( zts <> 'ogg' )
    and ( zts <> 'mid' ) then
    Otworz_Plik_ButtonClick( Sender ); // Bez przeładowania pliku wyświetla tylko czarne tło.

  PasLibVlcPlayer1.SetVideoPosInPercent( pozycja_procent );


  Przerysuj_Zaslone();

end;//---//Pelny_Ekran_ButtonClick().

//Ukryj_Przyciski_Panel_ButtonClick().
procedure TKaraoke_Form.Ukryj_Przyciski_Panel_ButtonClick( Sender: TObject );
begin

  Przyciski_Panel.Visible := not Przyciski_Panel.Visible;

  Przerysuj_Zaslone();

  Informacja_Tekst_Wyswietl( 'Ukryj panel przycisków', null );

end;//---//Ukryj_Przyciski_Panel_ButtonClick().

//Opcje_ButtonClick().
procedure TKaraoke_Form.Opcje_ButtonClick( Sender: TObject );
begin

  PageControl1.Visible := not PageControl1.Visible;

  Opcje_Splitter.Visible := PageControl1.Visible;

  if    ( PageControl1.Visible )
    and ( PageControl1.Width <= 1 ) then
    PageControl1.Width := 250;

 Przerysuj_Zaslone();

 Informacja_Tekst_Wyswietl( 'Opcje', null );

end;//---//Opcje_ButtonClick().

//Linie_CheckBoxClick().
procedure TKaraoke_Form.Linie_CheckBoxClick( Sender: TObject );
begin

  Linia_Spiewu_Gora_StaticText.Visible := Linia_Spiewu_Gora_CheckBox.Checked;
  Linia_Spiewu_Srodek_StaticText.Visible := Linia_Spiewu_Srodek_CheckBox.Checked;
  Linia_Spiewu_Dol_StaticText.Visible := Linia_Spiewu_Dol_CheckBox.Checked;

  Informacja_Tekst_Wyswietl( 'Widoczność linii śpiewu', null );

end;//---//Linie_CheckBoxClick().

//Zegar_Czestotliwosc_SpinEditChange().
procedure TKaraoke_Form.Zegar_Czestotliwosc_SpinEditChange( Sender: TObject );
begin

  Timer1.Interval := Zegar_Czestotliwosc_SpinEdit.Value;

end;//---//Zegar_Czestotliwosc_SpinEditChange().

//Wyswietlaj_Napisy_Wedlug_RadioGroupClick().
procedure TKaraoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroupClick( Sender: TObject );
begin

  if watek <> nil then
    if Karaoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
      begin

        if watek.Suspended then
          watek.Resume();

        Synchronizuj_Milisekundy_Filmu(); // Tutaj nie działa może przez sekcję krytyczną.

      end
    else//if Karaoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
      begin

        if not watek.Suspended then
          watek.Suspend();

      end
    //---//if Karaoke_Form.Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.

end;//---//Wyswietlaj_Napisy_Wedlug_RadioGroupClick().

//Czas_Start_Ustaw_ButtonClick().
procedure TKaraoke_Form.Czas_Start_Ustaw_ButtonClick( Sender: TObject );
begin
  //PasLibVlcPlayer1.SetAudioVolume( glosnosc__poziom__minimalny_c );
  //PasLibVlcPlayer1.SetVideoPosInMs( 0 );

  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = 'Tryb_Testowy_Napisow_CheckBox' )
    and ( czas_start <> 0 ) then
    Exit;

  czas_start := Now();

end;//---//Czas_Start_Ustaw_ButtonClick().

//Czcionka_Napisow_ButtonClick().
procedure TKaraoke_Form.Czcionka_Napisow_ButtonClick( Sender: TObject );
var
  i : integer;
begin

  FontDialog1.Font := Wymiar_Label.Font;

  if FontDialog1.Execute() then
    begin

      Screen.Cursor := crHourGlass;

      Wymiar_Label.Font := FontDialog1.Font;

      Wymiar_Label.Visible := true;

      for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
        if napisy_t[ i ] <> nil then
          //napisy_t[ i ].Ustaw_Czcionke_Napisu_N();
          Ustaw_Czcionke_Napisu( napisy_t[ i ] );

      Wymiar_Label.Visible := false;

      Screen.Cursor := crDefault;

    end;
  //---//if FontDialog1.Execute() then

end;//---//Czcionka_Napisow_ButtonClick().

//Tlo_Napisow_ButtonClick().
procedure TKaraoke_Form.Tlo_Napisow_ButtonClick( Sender: TObject );
var
  i : integer;
begin

  ColorDialog1.Color := Wymiar_Label.Color;

  if ColorDialog1.Execute() then
    begin

      Screen.Cursor := crHourGlass;

      Wymiar_Label.Color := ColorDialog1.Color;

      for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
        if napisy_t[ i ] <> nil then
          napisy_t[ i ].Color := ColorDialog1.Color;

      Screen.Cursor := crDefault;

    end;
  //---//if ColorDialog1.Execute() then

end;//---//Tlo_Napisow_ButtonClick().

//Kolor_Linii_Spiewu_ButtonClick().
procedure TKaraoke_Form.Kolor_Linii_Spiewu_ButtonClick( Sender: TObject );
begin

  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Kolor_Linii_Spiewu_Gornej_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu_Gora_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu_Gora_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Kolor_Linii_Spiewu_Srodkowej_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu_Srodek_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu_Srodek_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Kolor_Linii_Spiewu_Dolnej_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu_Dol_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu_Dol_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)

end;//---//Kolor_Linii_Spiewu_ButtonClick().

//Wczytaj_Ustawienia_ButtonClick().
procedure TKaraoke_Form.Wczytaj_Ustawienia_ButtonClick( Sender: TObject );
var
  plik_ini : IniFiles.TIniFile;
  i : integer;
  zts : string;
begin

  plik_ini := IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Karaoke.ini'  ); // Application potrzebuje w uses Forms.

  if not Plik_ini.ValueExists( 'Opcje', 'Glosnosc' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Glosnosc', PasLibVlcPlayer1.GetAudioVolume() )
  else
    i := Plik_ini.ReadInteger( 'Opcje', 'Glosnosc', PasLibVlcPlayer1.GetAudioVolume() ); // Jeżeli nie znajdzie to podstawia wartość PasLibVlcPlayer1.GetAudioVolume().

  if    ( i >= glosnosc__poziom__minimalny_c )
    and ( i <= glosnosc__poziom__maksymalny_c ) then
    begin

      //PasLibVlcPlayer1.SetAudioVolume( i ); // Jeżeli nie jest wczytany plik to nic się nie zmieni.
      Glosnosc_Label.Caption := Trim(  FormatFloat( '### ### ### ### ##0', i )  );
      Glosnosc_ProgressBar.Position := i;

    end;
  //---//if    ( i >= 1 ) (...)



  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Gora' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Gora', Linia_Spiewu_Gora_CheckBox.Checked )
  else
    Linia_Spiewu_Gora_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu_Gora', Linia_Spiewu_Gora_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Gora_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Srodek' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Srodek', Linia_Spiewu_Srodek_CheckBox.Checked )
  else
    Linia_Spiewu_Srodek_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu_Srodek', Linia_Spiewu_Srodek_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Srodek_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Dol' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Dol', Linia_Spiewu_Dol_CheckBox.Checked )
  else
    Linia_Spiewu_Dol_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu_Dol', Linia_Spiewu_Dol_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Dol_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Gora_Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Gora_Kolor', Linia_Spiewu_Gora_StaticText.Color )
  else
    Linia_Spiewu_Gora_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu_Gora_Kolor', Linia_Spiewu_Gora_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Gora_StaticText.Color.

  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Srodek_Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Srodek_Kolor', Linia_Spiewu_Srodek_StaticText.Color )
  else
    Linia_Spiewu_Srodek_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu_Srodek_Kolor', Linia_Spiewu_Srodek_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Srodek_StaticText.Color.

  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu_Dol_Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Dol_Kolor', Linia_Spiewu_Dol_StaticText.Color )
  else
    Linia_Spiewu_Dol_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu_Dol_Kolor', Linia_Spiewu_Dol_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu_Gora_StaticText.Color.


  if not Plik_ini.ValueExists( 'Opcje', 'Linie_Spiewu_Odstep' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu_Odstep', Linie_Spiewu_Odstep_SpinEdit.Value )
  else
    Linie_Spiewu_Odstep_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Linie_Spiewu_Odstep', Linie_Spiewu_Odstep_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Linie_Spiewu_Odstep_SpinEdit.Value.

  if not Plik_ini.ValueExists( 'Opcje', 'Linie_Spiewu_Wielkosc' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu_Wielkosc', Linie_Spiewu_Wielkosc_SpinEdit.Value )
  else
    Linie_Spiewu_Wielkosc_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Linie_Spiewu_Wielkosc', Linie_Spiewu_Wielkosc_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Linie_Spiewu_Wielkosc_SpinEdit.Value.

  if not Plik_ini.ValueExists( 'Opcje', 'Pozycja_Obszaru_Spiewu' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value )
  else
    Pozycja_Obszaru_Spiewu_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Pozycja_Obszaru_Spiewu_SpinEdit.Value.



  if not Plik_ini.ValueExists( 'Opcje', 'Zegar_Czestotliwosc' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value )
  else
    Zegar_Czestotliwosc_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Zegar_Czestotliwosc_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Wyswietlaj_Napisy_Wedlug' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Wyswietlaj_Napisy_Wedlug', Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex )
  else
    Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex := Plik_ini.ReadInteger( 'Opcje', 'Wyswietlaj_Napisy_Wedlug', Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex ); // Jeżeli nie znajdzie to podstawia wartość Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex.

  if not Plik_ini.ValueExists( 'Opcje', 'Skok_Sekundy' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value )
  else
    Skok_Sekundy_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Skok_Sekundy_SpinEdit.Value.

  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu_Narastajaco' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu_Narastajaco', Korekta_Czasu_Narastajaco_SpinEdit.Value )
  else
    Korekta_Czasu_Narastajaco_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Korekta_Czasu_Narastajaco', Korekta_Czasu_Narastajaco_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu_Narastajaco_SpinEdit.Value.

  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu_Narastajaco_Automatyczna' ) then
    Plik_ini.WriteBool( 'Opcje', 'Korekta_Czasu_Narastajaco_Automatyczna', Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked )
  else
    Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Korekta_Czasu_Narastajaco_Automatyczna', Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu_Narastajaco_Prog' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu_Narastajaco_Prog', Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value )
  else
    Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Korekta_Czasu_Narastajaco_Prog', Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value.



  if not Plik_ini.ValueExists( 'Opcje', 'Ukrywaj_Napisy_Wedlug' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Ukrywaj_Napisy_Wedlug', Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex )
  else
    Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := Plik_ini.ReadInteger( 'Opcje', 'Ukrywaj_Napisy_Wedlug', Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex ); // Jeżeli nie znajdzie to podstawia wartość Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex.

  if not Plik_ini.ValueExists( 'Opcje', 'Nie_Odswiezaj_Widoku' ) then
    Plik_ini.WriteBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked )
  else
    Nie_Odswiezaj_Widoku_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Nie_Odswiezaj_Widoku_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Wyswietlaj_Informacje_O_Zdarzeniu' ) then
    Plik_ini.WriteBool( 'Opcje', 'Wyswietlaj_Informacje_O_Zdarzeniu', Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked )
  else
    Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Wyswietlaj_Informacje_O_Zdarzeniu', Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj' ) then
    Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked )
  else
    Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked.

  if not Plik_ini.ValueExists( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj' ) then
    Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked )
  else
    Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked.


  Wymiar_Label.Visible := true;

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy_Rozmiar' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy_Rozmiar', Wymiar_Label.Font.Size )
  else
    Wymiar_Label.Font.Size := Plik_ini.ReadInteger( 'Opcje', 'Napisy_Rozmiar', Wymiar_Label.Font.Size ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Size.

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy_Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy_Kolor', Wymiar_Label.Font.Color )
  else
    Wymiar_Label.Font.Color := Plik_ini.ReadInteger( 'Opcje', 'Napisy_Kolor', Wymiar_Label.Font.Color ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Color.

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy_Kolor_Tlo' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy_Kolor_Tlo', Wymiar_Label.Color )
  else
    Wymiar_Label.Color := Plik_ini.ReadInteger( 'Opcje', 'Napisy_Kolor_Tlo', Wymiar_Label.Color ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Color.

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy_Nazwa' ) then
    Plik_ini.WriteString( 'Opcje', 'Napisy_Nazwa', Wymiar_Label.Font.Name )
  else
    Wymiar_Label.Font.Name := Plik_ini.ReadString( 'Opcje', 'Napisy_Nazwa', Wymiar_Label.Font.Name ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Name.


  //fsBold, fsItalic, fsStrikeOut, fsUnderline
  zts := ',';

  if fsBold in Wymiar_Label.Font.Style then
    zts := zts + ', pogrubienie';

  if fsItalic in Wymiar_Label.Font.Style then
    zts := zts + ', kursywa';

  if fsStrikeOut in Wymiar_Label.Font.Style then
    zts := zts + ', przekreślenie';

  if fsUnderline in Wymiar_Label.Font.Style then
    zts := zts + ', podkreślenie';

  zts := zts + ',';

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy_Styl' ) then
    Plik_ini.WriteString( 'Opcje', 'Napisy_Styl', zts )
  else
    zts := Plik_ini.ReadString( 'Opcje', 'Napisy_Styl', zts ); // Jeżeli nie znajdzie to podstawia wartość zts.

  Wymiar_Label.Font.Style := [];

  if Pos( ', pogrubienie, ', zts ) > 0 then
    Wymiar_Label.Font.Style := Wymiar_Label.Font.Style + [ fsBold ];

  if Pos( ', kursywa, ', zts ) > 0 then
    Wymiar_Label.Font.Style := Wymiar_Label.Font.Style + [ fsItalic ];

  if Pos( ', przekreślenie, ', zts ) > 0 then
    Wymiar_Label.Font.Style := Wymiar_Label.Font.Style + [ fsStrikeOut ];

  if Pos( ', podkreślenie, ', zts ) > 0 then
    Wymiar_Label.Font.Style := Wymiar_Label.Font.Style + [ fsUnderline ];


  for i := 0 to Length( napisy_t ) - 1 do //gdy pusta = 0; z jednym elementem = 1
    if napisy_t[ i ] <> nil then
      begin

        //napisy_t[ i ].Ustaw_Czcionke_Napisu_N();
        Ustaw_Czcionke_Napisu( napisy_t[ i ] );
        //napisy_t[ i ].Color := Wymiar_Label.Color;

      end;
    //---//if napisy_t[ i ] <> nil then



  if not Plik_ini.ValueExists( 'Opcje', 'Jedno_Uruchomienie_Programu' ) then
    Plik_ini.WriteBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked )
  else
    Jedno_Uruchomienie_Programu_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Jedno_Uruchomienie_Programu_CheckBox.Checked.


  plik_ini.Free();

end;//---//Wczytaj_Ustawienia_ButtonClick().

//Zapisz_Ustawienia_ButtonClick().
procedure TKaraoke_Form.Zapisz_Ustawienia_ButtonClick( Sender: TObject );
var
  plik_ini : IniFiles.TIniFile;
  zts : string;
begin

  plik_ini := IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + 'Karaoke.ini'  ); // Application potrzebuje w uses Forms.


  if PasLibVlcPlayer1.GetAudioVolume() >= 1 then // Jeżeli nie jest wczytany plik to ma wartość -1.
    Plik_ini.WriteInteger( 'Opcje', 'Glosnosc', PasLibVlcPlayer1.GetAudioVolume() );

  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Gora', Linia_Spiewu_Gora_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Srodek', Linia_Spiewu_Srodek_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu_Dol', Linia_Spiewu_Dol_CheckBox.Checked );

  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Gora_Kolor', Linia_Spiewu_Gora_StaticText.Color );
  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Srodek_Kolor', Linia_Spiewu_Srodek_StaticText.Color );
  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu_Dol_Kolor', Linia_Spiewu_Dol_StaticText.Color );

  Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu_Odstep', Linie_Spiewu_Odstep_SpinEdit.Value );
  Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu_Wielkosc', Linie_Spiewu_Wielkosc_SpinEdit.Value );

  Plik_ini.WriteInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value );
  Plik_ini.WriteInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value );

  Plik_ini.WriteInteger( 'Opcje', 'Wyswietlaj_Napisy_Wedlug', Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex );
  Plik_ini.WriteInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value );

  Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu_Narastajaco', Korekta_Czasu_Narastajaco_SpinEdit.Value );
  Plik_ini.WriteBool( 'Opcje', 'Korekta_Czasu_Narastajaco_Automatyczna', Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu_Narastajaco_Prog', Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value );

  Plik_ini.WriteInteger( 'Opcje', 'Ukrywaj_Napisy_Wedlug', Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex );
  Plik_ini.WriteBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Wyswietlaj_Informacje_O_Zdarzeniu', Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked );

  Plik_ini.WriteInteger( 'Opcje', 'Napisy_Rozmiar', Wymiar_Label.Font.Size );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy_Kolor', Wymiar_Label.Font.Color );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy_Kolor_Tlo', Wymiar_Label.Color );
  Plik_ini.WriteString( 'Opcje', 'Napisy_Nazwa', Wymiar_Label.Font.Name );

  //fsBold, fsItalic, fsStrikeOut, fsUnderline
  zts := ',';

  if fsBold in Wymiar_Label.Font.Style then
    zts := zts + ', pogrubienie';

  if fsItalic in Wymiar_Label.Font.Style then
    zts := zts + ', kursywa';

  if fsStrikeOut in Wymiar_Label.Font.Style then
    zts := zts + ', przekreślenie';

  if fsUnderline in Wymiar_Label.Font.Style then
    zts := zts + ', podkreślenie';

  zts := zts + ',';

  Plik_ini.WriteString( 'Opcje', 'Napisy_Styl', zts );


  Plik_ini.WriteBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked );


  plik_ini.Free();

end;//---//Zapisz_Ustawienia_ButtonClick().

//Domyslne_Ustawienia_ButtonClick().
procedure TKaraoke_Form.Domyslne_Ustawienia_ButtonClick( Sender: TObject );
var
  i : integer;
begin

  Screen.Cursor := crHourGlass;

  Tryb_Testowy_Napisow_CheckBox.Checked := false;

  Linia_Spiewu_Gora_CheckBox.Checked := true;
  Linia_Spiewu_Srodek_CheckBox.Checked := true;
  Linia_Spiewu_Dol_CheckBox.Checked := true;

  Linia_Spiewu_Gora_StaticText.Color := clSkyBlue;
  Linia_Spiewu_Srodek_StaticText.Color := clMoneyGreen;
  Linia_Spiewu_Dol_StaticText.Color := clSkyBlue;

  Linie_Spiewu_Odstep_SpinEdit.Value := 6;
  Linie_Spiewu_Wielkosc_SpinEdit.Value := 10;

  Pozycja_Obszaru_Spiewu_SpinEdit.Value := 5;
  Zegar_Czestotliwosc_SpinEdit.Value := 25;

  Wyswietlaj_Napisy_Wedlug_RadioGroup.ItemIndex := 2; // czasu narastająco..
  Skok_Sekundy_SpinEdit.Value := 3;
  Przesuniecie_Napisow_SpinEdit.Value := 3;
  Korekta_Czasu_Narastajaco_SpinEdit.Value := 1;
  Korekta_Czasu_Narastajaco_Prezentuj_Roznice_CheckBox.Checked := false;
  Korekta_Czasu_Narastajaco_Automatyczna_CheckBox.Checked := true;
  Korekta_Czasu_Narastajaco_Prog_SpinEdit.Value := 100;

  Ukrywaj_Napisy_Wedlug_RadioGroup.ItemIndex := 0; // górnej krawędzi.
  Nie_Odswiezaj_Widoku_CheckBox.Checked := false;
  Wyswietlaj_Informacje_O_Zdarzeniu_CheckBox.Checked := true;
  Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked := true;
  Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked := true;

  Wymiar_Label.Visible := true;

  Wymiar_Label.Font.Size := 44;
  Wymiar_Label.Font.Color := clWhite;
  Wymiar_Label.Color := clBlack;
  Wymiar_Label.Font.Name := 'Georgia';
  Wymiar_Label.Font.Style := [];

  for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
    if napisy_t[ i ] <> nil then
      begin

        //napisy_t[ i ].Ustaw_Czcionke_Napisu_N();
        Ustaw_Czcionke_Napisu( napisy_t[ i ] );
        //napisy_t[ i ].Color := Wymiar_Label.Color;

      end;
    //---//if napisy_t[ i ] <> nil then

  Wymiar_Label.Visible := false;

  Jedno_Uruchomienie_Programu_CheckBox.Checked := true;

  Screen.Cursor := crDefault;

end;//---//Domyslne_Ustawienia_ButtonClick().

//Karaoke_Click().
procedure TKaraoke_Form.Karaoke_Click( Sender: TObject );
begin

  //Karaoke_Form.SetFocus();
  PasLibVlcPlayer1.SetFocus();

end;//---//Karaoke_Click().

//Test_Napisu_SpinEditKeyDown().
procedure TKaraoke_Form.Test_Napisu_SpinEditKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
var
  zti : integer;
begin

  // Enter.
  if Key = VK_RETURN then
    begin

      Key := 0;

      zti := Length( napisy_t );
      zti := Test_Napisu_SpinEdit.Value;

      if   ( Length( napisy_t ) = 0 )
        or ( Test_Napisu_SpinEdit.Value > Length( napisy_t ) - 1  ) then
        Exit;

      if napisy_t[ Test_Napisu_SpinEdit.Value ] = nil then
        begin

          Memo1.Lines.Add( 'nil' );
          Exit;

        end;
      //---//if napisy_t[ Test_Napisu_SpinEdit.Value ] = nil then

      Memo1.Lines.Add(  'Napis tekst: ' + napisy_t[ Test_Napisu_SpinEdit.Value ].Text );
      Memo1.Lines.Add(    'Góra / wysokość odtwarzacza: ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.Top )  ) + ' / ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.Height )  )   );
      Memo1.Lines.Add(   'Linie śpiewu (g, ś, d): ' + Trim(  FormatFloat( '### ### ### ##0', Linia_Spiewu_Gora_StaticText.Top )  ) + ', ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu_Srodek_StaticText.Top )  ) + ', ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu_Dol_StaticText.Top )  )   );
      Memo1.Lines.Add(   'Napis od - do: ' + Trim(  FormatFloat( '### ### ### ### ##0', napisy_t[ Test_Napisu_SpinEdit.Value ].czas_od )  ) + ' - ' + Trim(  FormatFloat( '### ### ### ### ##0', napisy_t[ Test_Napisu_SpinEdit.Value ].czas_do )  )   );
      Memo1.Lines.Add(   'Pozycja filmu: ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.GetVideoPosInMs() )  )   );

      zti := Ustal_Pozycje( napisy_t[ Test_Napisu_SpinEdit.Value ], PasLibVlcPlayer1.GetVideoPosInMs(), true );
      Memo1.Lines.Add(   'Pozycja napisu: ' + Trim(  FormatFloat( '### ### ### ### ##0', zti )  )   );
      Memo1.Lines.Add(   'Różnica: ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu_Dol_StaticText.Top - zti )  )   );

    end;
  //---//if Key = VK_RETURN then

end;//---//Test_Napisu_SpinEditKeyDown().

//PasLibVlcPlayer1MouseDown().
procedure TKaraoke_Form.PasLibVlcPlayer1MouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  mysz__przycisk_nacisniety_g := true;
  mysz__przycisk_nacisniety__x__start_g := X;
  mysz__przycisk_nacisniety__y__start_g := Y;

end;//---//PasLibVlcPlayer1MouseDown().

//PasLibVlcPlayer1MouseUp().
procedure TKaraoke_Form.PasLibVlcPlayer1MouseUp( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
begin

  Mysz__Przycisk_Nacisniety__Procent_Wylicz( X, Y, true );

  mysz__przycisk_nacisniety_g := false;
  mysz__przycisk_nacisniety__x__start_g := 0;
  mysz__przycisk_nacisniety__y__start_g := 0;

end;//---//PasLibVlcPlayer1MouseUp().

//Karaoke_MouseMove().
procedure TKaraoke_Form.Karaoke_MouseMove( Sender: TObject; Shift: TShiftState; X, Y: Integer );
begin

  kursor_ruch_data_czas := Now();

  Screen.Cursor := crDefault;

  //Caption := IntToStr( PasLibVlcPlayer1.Height ) + ' ' + IntToStr( Y ); // Bardziej to.
  //Caption := IntToStr( Karaoke_Form.Height ) + ' ' + IntToStr( Y );


  if mysz__przycisk_nacisniety_g then
    Mysz__Przycisk_Nacisniety__Procent_Wylicz( X, Y );


  if Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked then
    begin

      if    ( Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked )
        and ( not Przyciski_Panel.Visible )
        and ( Y > PasLibVlcPlayer1.Height - 25 ) then
        Czas_Dol_ProgressBar.Visible := true
      else//if    ( Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked ) (...)
        Czas_Dol_ProgressBar.Visible := false;

    end
  else//if Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked then
    Czas_Dol_ProgressBar.Visible := not Przyciski_Panel.Visible;

end;//---//Karaoke_MouseMove().

//Karaoke_MouseWheel().
procedure TKaraoke_Form.Karaoke_MouseWheel( Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean );
begin

  //Memo1.Lines.Add(  IntToStr( WheelDelta )  );

  if WheelDelta <= 0 then
   Ciszej_ButtonClick( Sender )
  else//if WheelDelta <= 0 then
   Glosniej_ButtonClick( Sender );

end;//---//Karaoke_MouseWheel().

//Karaoke_KeyDown().
procedure TKaraoke_Form.Karaoke_KeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
var
  i : integer;
begin

  // 1.
  if Key = VK_1 then
    begin

      Key := 0;

      Linia_Spiewu_Gora_CheckBox.Checked := not Linia_Spiewu_Gora_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( 'Widoczność linii śpiewu górnej', null );

    end
  else//if Key = VK_1 then
  // 2.
  if Key = VK_2 then
    begin

      Key := 0;

      Linia_Spiewu_Srodek_CheckBox.Checked := not Linia_Spiewu_Srodek_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( 'Widoczność linii śpiewu środkowej', null );

    end
  else//if Key = VK_2 then
  // 3.
  if Key = VK_3 then
    begin

      Key := 0;

      Linia_Spiewu_Dol_CheckBox.Checked := not Linia_Spiewu_Dol_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( 'Widoczność linii śpiewu dolnej', null );

    end
  else//if Key = VK_3 then
  // 1 (numeryczna).
  if Key = VK_NUMPAD1 then
    begin

      Key := 0;

      Linie_Spiewu_Odstep_SpinEdit.Value := Linie_Spiewu_Odstep_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( 'Odstęp linii śpiewu', Linie_Spiewu_Odstep_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD1 then
  // 2 (numeryczna).
  if Key = VK_NUMPAD2 then
    begin

      Key := 0;

      Linie_Spiewu_Wielkosc_SpinEdit.Value := Linie_Spiewu_Wielkosc_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( 'Wielkość linii śpiewu', Linie_Spiewu_Wielkosc_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD2 then
  // 3 (numeryczna).
  if Key = VK_NUMPAD3 then
    begin

      Key := 0;

      Skok_Sekundy_SpinEdit.Value := Skok_Sekundy_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( 'Skok o ilość sekund', Skok_Sekundy_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD3 then
  // 7 (numeryczna).
  if Key = VK_NUMPAD7 then
    begin

      Key := 0;

      Linie_Spiewu_Odstep_SpinEdit.Value := Linie_Spiewu_Odstep_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( 'Odstęp linii śpiewu', Linie_Spiewu_Odstep_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD7 then
  // 8 (numeryczna).
  if Key = VK_NUMPAD8 then
    begin

      Key := 0;

      Linie_Spiewu_Wielkosc_SpinEdit.Value := Linie_Spiewu_Wielkosc_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( 'Wielkość linii śpiewu', Linie_Spiewu_Wielkosc_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD8 then
  // 9 (numeryczna).
  if Key = VK_NUMPAD9 then
    begin

      Key := 0;

      Skok_Sekundy_SpinEdit.Value := Skok_Sekundy_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( 'Skok o ilość sekund', Skok_Sekundy_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD9 then
  // , (numeryczna).
  if Key = VK_DECIMAL then
    begin

      Key := 0;

      if Karaoke_Form.WindowState <> wsMinimized then
        begin

          Application.Minimize();
          Informacja_Tekst_Wyswietl( 'Minimalizuj ekran', null );

        end;
      //---//if Karaoke_Form.WindowState <> wsMinimized then

    end
  else//if Key = VK_DECIMAL then
  // Backspace.
  if    ( Key = VK_BACK )
    and ( ssCtrl in Shift ) then
    begin

      Key := 0;

      Zegar_Czestotliwosc_SpinEdit.Value := 100;

      Informacja_Tekst_Wyswietl( 'Częstotliwość zegara', Zegar_Czestotliwosc_SpinEdit.Value );

    end
  else//if    ( Key = VK_BACK ) (...)
  // End.
  if Key = VK_END then
    begin

      Key := 0;

      Screen.Cursor := crHourGlass;

      Wymiar_Label.Visible := true;

      Wymiar_Label.Font.Size := Wymiar_Label.Font.Size - 1;

      for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
        if napisy_t[ i ] <> nil then
            Ustaw_Czcionke_Napisu( napisy_t[ i ] );

      Wymiar_Label.Visible := false;

      Screen.Cursor := crDefault;

      Informacja_Tekst_Wyswietl( 'Rozmiar czcionki napisów', Wymiar_Label.Font.Size );

    end
  else//if Key = VK_END then
  // Enter.
  if Key = VK_RETURN then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Pelny_Ekran_ButtonClick( Sender ) //???
      else//if ssCtrl in Shift then
        if ssShift in Shift then
          Pelny_Ekran_ButtonClick( nil ) //???
        else//if ssShift in Shift then
          begin

            if Karaoke_Form.WindowState <> wsMaximized then
              begin

                Karaoke_Form.WindowState := wsMaximized;
                Przyciski_Panel.Visible := false;

                Informacja_Tekst_Wyswietl( 'Pełny ekran', null );

              end
            else//if Karaoke_Form.WindowState <> wsMaximized then
              begin

                Przyciski_Panel.Visible := true;
                Karaoke_Form.WindowState := wsNormal;

                Informacja_Tekst_Wyswietl( 'Normalny ekran', null );

              end;
            //---//if Karaoke_Form.WindowState <> wsMaximized then

            Przerysuj_Zaslone();

          end;
        //---//if ssShift in Shift then

    end
  else//if Key = VK_RETURN then
  // Escape.
  if Key = VK_ESCAPE then
    begin

      Key := 0;

      if mysz__przycisk_nacisniety_g then
        begin

          mysz__przycisk_nacisniety_g := false;
          mysz__przycisk_nacisniety__x__start_g := 0;
          mysz__przycisk_nacisniety__y__start_g := 0;

        end
      else//if mysz__przycisk_nacisniety_g then
        begin

          //Pelny_Ekran_ButtonClick( nil ) //???

          if Karaoke_Form.BorderStyle <> bsSizeable then
            Karaoke_Form.BorderStyle := bsSizeable;

          if Karaoke_Form.WindowState <> wsNormal then
            begin

              Przyciski_Panel.Visible := true;
              Karaoke_Form.WindowState := wsNormal;

              Karaoke_Form.Top := okno_gora;
              Karaoke_Form.Left := okno_lewo;
              Karaoke_Form.Height := okno_wysokosc;
              Karaoke_Form.Width := okno_szerokosc;

              Przerysuj_Zaslone();

              Informacja_Tekst_Wyswietl( 'Normalny ekran', null );

            end;
          //---//if Karaoke_Form.WindowState <> wsNormal then

        end;
      //---//if mysz__przycisk_nacisniety_g then

    end
  else//if Key = VK_ESCAPE then
  // F.
  if Key = VK_F then
    begin

      Key := 0;

      Pelny_Ekran_ButtonClick( Sender );

    end
  else//if Key = VK_F then
  // Home.
  if Key = VK_HOME then
    begin

      Key := 0;

      Screen.Cursor := crHourGlass;

      Wymiar_Label.Visible := true;

      Wymiar_Label.Font.Size := Wymiar_Label.Font.Size + 1;

      for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
        if napisy_t[ i ] <> nil then
            Ustaw_Czcionke_Napisu( napisy_t[ i ] );

      Wymiar_Label.Visible := false;

      Screen.Cursor := crDefault;

      Informacja_Tekst_Wyswietl( 'Rozmiar czcionki napisów', Wymiar_Label.Font.Size );

    end
  else//if Key = VK_HOME then
  // Kursor dół, - (numeryczna).
  if Key in [ VK_DOWN, VK_SUBTRACT ] then
    begin

      if Key = VK_DOWN then
        i := 10
      else//if Key = VK_DOWN then
        i := 1;

      Key := 0;

      if i = 1 then
        Ciszej_ButtonClick( nil )
      else//if i = 1 then
        Ciszej_ButtonClick( Sender );

    end
  else//if Key in [ VK_DOWN, VK_SUBTRACT ] then
  // Kursor góra, + (numeryczna).
  if Key in [ VK_UP, VK_ADD ] then
    begin

      if Key = VK_UP then
        i := 10
      else//if Key = VK_UP then
        i := 1;

      Key := 0;

      if i = 1 then
        Glosniej_ButtonClick( nil )
      else//if i = 1 then
        Glosniej_ButtonClick( Sender );

    end
  else//if Key in [ VK_UP, VK_ADD ] then
  // Kursor lewo.
  if Key = VK_LEFT then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Skok_Do_Tylu_ButtonClick( nil )
      else//if ssCtrl in Shift then
        if ssShift in Shift then
          Skok_Do_Tylu_ButtonClick( Skok_Sekundy_SpinEdit )
        else//if ssShift in Shift then
          Skok_Do_Tylu_ButtonClick( Sender );

    end
  else//if Key = VK_LEFT then
  // Kursor prawo.
  if Key = VK_RIGHT then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Skok_Do_Przodu_ButtonClick( nil )
      else//if ssCtrl in Shift then
        if ssShift in Shift then
          Skok_Do_Przodu_ButtonClick( Skok_Sekundy_SpinEdit )
        else//if ssShift in Shift then
          Skok_Do_Przodu_ButtonClick( Sender );

    end
  else//if Key = VK_RIGHT then
  // L.
  if Key = VK_L then
    begin

      Key := 0;

      //Linia_Spiewu_Gora_CheckBox.Checked := not Linia_Spiewu_Gora_CheckBox.Checked;
      //Linia_Spiewu_Srodek_CheckBox.Checked := Linia_Spiewu_Gora_CheckBox.Checked;
      //Linia_Spiewu_Dol_CheckBox.Checked := Linia_Spiewu_Gora_CheckBox.Checked;


      if   ( Linia_Spiewu_Gora_CheckBox.Checked )
        or ( Linia_Spiewu_Srodek_CheckBox.Checked )
        or ( Linia_Spiewu_Dol_CheckBox.Checked ) then
        begin

          linia_spiewu_gora_widoczna := Linia_Spiewu_Gora_CheckBox.Checked;
          linia_spiewu_srodek_widoczna := Linia_Spiewu_Srodek_CheckBox.Checked;
          linia_spiewu_dol_widoczna := Linia_Spiewu_Dol_CheckBox.Checked;

          Linia_Spiewu_Gora_CheckBox.Checked := false;
          Linia_Spiewu_Srodek_CheckBox.Checked := false;
          Linia_Spiewu_Dol_CheckBox.Checked := false;

        end
      else//if   ( Linia_Spiewu_Gora_CheckBox.Checked ) (...)
        begin

          if    ( not linia_spiewu_gora_widoczna )
            and ( not linia_spiewu_srodek_widoczna )
            and ( not linia_spiewu_dol_widoczna ) then
            begin

              linia_spiewu_gora_widoczna := true;
              linia_spiewu_srodek_widoczna := true;
              linia_spiewu_dol_widoczna := true;

            end;
          //---//if    ( not linia_spiewu_gora_widoczna ) (...)

          Linia_Spiewu_Gora_CheckBox.Checked := linia_spiewu_gora_widoczna;
          Linia_Spiewu_Srodek_CheckBox.Checked := linia_spiewu_srodek_widoczna;
          Linia_Spiewu_Dol_CheckBox.Checked := linia_spiewu_dol_widoczna;

        end;
      //---//if   ( Linia_Spiewu_Gora_CheckBox.Checked ) (...)


      Informacja_Tekst_Wyswietl( 'Widoczność linii śpiewu', null );

    end
  else//if Key = VK_L then
  // N.
  if Key = VK_N then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Napisy_EditButtonButtonClick( Sender )
      else//if ssCtrl in Shift then
        Wczytaj_Napisy_ButtonClick( Sender );

    end
  else//if Key = VK_N then
  // O.
  if Key = VK_O then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Muzyka_EditButtonButtonClick( Sender )
      else//if ssCtrl in Shift then
        Opcje_ButtonClick( Sender );

    end
  else//if Key = VK_O then
  // P.
  if Key = VK_P then
    begin

      Key := 0;

      Otworz_Plik_ButtonClick( Sender );

    end
  else//if Key = VK_P then
  // Page Up.
  if Key = VK_PRIOR then
    begin

      Key := 0;

      Pozycja_Obszaru_Spiewu_SpinEdit.Value := Pozycja_Obszaru_Spiewu_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( 'Pozycja obszaru śpiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value );

    end
  else//if Key = VK_PRIOR then
  // Page Down.
  if Key = VK_NEXT then
    begin

      Key := 0;

      Pozycja_Obszaru_Spiewu_SpinEdit.Value := Pozycja_Obszaru_Spiewu_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( 'Pozycja obszaru śpiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value );

    end
  else//if Key = VK_NEXT then
  // R.
  if Key = VK_R then
    begin

      Key := 0;

      Przerysuj_Zaslone( true );

      Informacja_Tekst_Wyswietl( 'Odśwież widok', null );

      Synchronizuj_Milisekundy_Filmu();

      PasLibVlcPlayer1.SetVideoSubtitleById( -1 ); // Wyłączy standardowe wyświetlanie napisów w odtwarzaczu.

    end
  else//if Key = VK_R then
  // S.
  if Key = VK_S then
    begin

      Key := 0;

      Stop_ButtonClick( Sender );

    end
  else//if Key = VK_S then
  // Spacja.
  if Key = VK_SPACE then
    begin

      Key := 0;

      if PasLibVlcPlayer1.IsPause then
        Wznow_ButtonClick( Sender )
      else//if PasLibVlcPlayer1.IsPause then
        Pauza_ButtonClick( Sender )

    end
  else//if Key = VK_SPACE then
  // T.
  if Key = VK_T then
    begin

      Key := VK_RETURN;
      Test_Napisu_SpinEditKeyDown( Sender, Key, [] );

      Key := 0;

      Informacja_Tekst_Wyswietl( 'Test napisu', null );

    end
  else//if Key = VK_T then
  // U.
  if Key = VK_U then
    begin

      Key := 0;

      if ssCtrl in Shift then
        begin

          if Karaoke_Form.WindowState <> wsMaximized then
            begin

              Karaoke_Form.WindowState := wsMaximized;
              Przyciski_Panel.Visible := false;

              Informacja_Tekst_Wyswietl( 'Pełny ekran', null );

            end
          else//if Karaoke_Form.WindowState <> wsMaximized then
            begin

              Przyciski_Panel.Visible := true;
              Karaoke_Form.WindowState := wsNormal;

              Informacja_Tekst_Wyswietl( 'Normalny ekran', null );

            end;
          //---//if Karaoke_Form.WindowState <> wsMaximized then

        end
      else//if ssCtrl in Shift then
        Ukryj_Przyciski_Panel_ButtonClick( Sender );

    end
  else//if Key = VK_U then
  // W.
  if Key = VK_W then
    begin

      Key := 0;

      Wycisz_ButtonClick( Sender );

    end
  else//if Key = VK_W then
  // X.
  if Key = VK_X then
    begin

      Key := 0;

      Wyczysc_Napisy_ButtonClick( Sender );

    end
  else//if Key = VK_X then
  // -.
  if    ( Key = VK_OEM_MINUS )
    and ( ssCtrl in Shift ) then
    begin

      Key := 0;

      Zegar_Czestotliwosc_SpinEdit.Value := Zegar_Czestotliwosc_SpinEdit.Value - 10;

      if Zegar_Czestotliwosc_SpinEdit.Value <= 0 then
        Zegar_Czestotliwosc_SpinEdit.Value := 1;

      Informacja_Tekst_Wyswietl( 'Częstotliwość zegara', Zegar_Czestotliwosc_SpinEdit.Value );

    end
  else//if    ( Key = VK_OEM_MINUS ) (...)
  // +.
  if    ( Key = VK_OEM_PLUS )
    and ( ssCtrl in Shift ) then
    begin

      Key := 0;

      Zegar_Czestotliwosc_SpinEdit.Value := Zegar_Czestotliwosc_SpinEdit.Value + 10;

      Informacja_Tekst_Wyswietl( 'Częstotliwość zegara', Zegar_Czestotliwosc_SpinEdit.Value );

    end
  else//if    ( Key = VK_OEM_PLUS ) (...)
  // >.
  if Key = VK_OEM_PERIOD then
    begin

      Key := 0;

      Nastepna_Klatka_ButtonClick( Sender );

    end
  else//if Key = VK_OEM_PERIOD then
  // [.
  if Key = VK_OEM_4 then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Przesuniecie_Napisow_SpinEdit.Value := Przesuniecie_Napisow_SpinEdit.Value + 500
      else//if ssCtrl in Shift then
        Przesuniecie_Napisow_SpinEdit.Value := Przesuniecie_Napisow_SpinEdit.Value + 100;

      Informacja_Tekst_Wyswietl( 'Przesunięcie napisów', Przesuniecie_Napisow_SpinEdit.Value );

    end
  else//if Key = VK_OEM_4 then
  // ].
  if Key = VK_OEM_6 then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Przesuniecie_Napisow_SpinEdit.Value := Przesuniecie_Napisow_SpinEdit.Value - 500
      else//if ssCtrl in Shift then
        Przesuniecie_Napisow_SpinEdit.Value := Przesuniecie_Napisow_SpinEdit.Value - 100;

      Informacja_Tekst_Wyswietl( 'Przesunięcie napisów', Przesuniecie_Napisow_SpinEdit.Value );

    end
  else//if Key = VK_OEM_6 then
  // '.
  if Key = VK_OEM_7 then
    begin

      Key := 0;

      Przesuniecie_Napisow_SpinEdit.Value := 0;

      Informacja_Tekst_Wyswietl( 'Przesunięcie napisów', Przesuniecie_Napisow_SpinEdit.Value );

    end;
  //---//if Key = VK_OEM_7 then

end;//---//Karaoke_KeyDown().

//LinkLabelLinkClick().
procedure TKaraoke_Form.LinkLabelLinkClick( Sender: TObject );
var
  zts : string;
begin

  if    ( Sender <> nil )
    and ( Sender is TLabel ) then
    begin

      if Pos( 'E_Mail', TLabel(Sender).Name ) > 0 then
        zts := 'mailto:'
      else//if Pos( 'E_Mail', TLabel(Sender).Name ) > 0 then
        zts := '';


      ShellExecute( 0, 'Open', PChar(zts + TLabel(Sender).Caption), nil, nil, SW_SHOWDEFAULT );

    end;

end;//---//LinkLabelLinkClick().

end.
