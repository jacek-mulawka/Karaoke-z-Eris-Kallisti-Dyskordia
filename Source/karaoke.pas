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
    procedure Napisy__Czcionka_Ustaw_N();
  public
    { public declarations }
    constructor Create( TheOwner : TComponent );
    destructor Destroy(); override;
  end;

  TTlumaczenie_Komunikaty_r = record
    anuluj_wyciszenie,
    blad,
    ciszej,
    czas_filmu_aktualny_f_x_predkosc_napisu,
    czas_trwania_napisu,
    czestotliwosc_zegara,
    glosniej,
    glosnosc,
    gora___wysokosc_odtwarzacza,
    linie_spiewu__g__s__d_,
    minimalizuj_okno,
    napis_czas_od_x_predkosc_napisu,
    napis_od___do,
    napis_tekst,
    nie_odnaleziono_pliku_tlumaczenia,
    nie_udalo_sie_otworzyc_pliku_napisow_,
    normalny_ekran,
    odstep_linii_spiewu,
    odswiez_widok,
    opcje,
    otworz_plik,
    pauza,
    pelny_ekran,
    postep,
    pozycja_filmu,
    pozycja_napisu,
    pozycja_obszaru_spiewu__okresl,
    pozycja_obszaru_spiewu,
    predkosc_napisu,
    przesuniecie_do_okna,
    przesuniecie_napisow,
    przesuniecie_napisow_x_predkosc_napisu,
    razem,
    razem_napisow,
    rozmiar_czcionki_napisow,
    roznica,
    skocz_o_1_klatke_do_przodu,
    skok_do_przodu,
    skok_do_tylu,
    skok_o_ilosc_sekund,
    stop,
    test_napisu,
    tlumaczenie__domyslne,
    tlumaczenie__jeden_plik,
    ukryj_panel_przyciskow,
    wczytaj_napisy,
    widocznosc_linii_spiewu_dolnej,
    widocznosc_linii_spiewu_gornej,
    widocznosc_linii_spiewu_srodkowej,
    widocznosc_linii_spiewu,
    wielkosc_linii_spiewu,
    wycisz,
    wyczysc_napisy,
    wznow,
    zaokraglone__razem
      : string;
  end;//---//TTlumaczenie_Komunikaty_r

  TWatek = class( TThread )
  protected
    procedure Execute(); override;
  end;

  TKaraoke_Form = class( TForm )
    Tlumaczenia_ComboBox: TComboBox;
    Dolny_Pasek_Postepu__Ukrywaj_CheckBox: TCheckBox;
    Tlumaczenia_Etykieta_Label: TLabel;
    Logo_Image: TImage;
    Nie_Odswiezaj_Widoku_CheckBox: TCheckBox;
    Korekta_Czasu__Narastajaco_Etykieta_Label: TLabel;
    Korekta_Czasu__Narastajaco_SpinEdit: TSpinEdit;
    Korekta_Czasu__Narastajaco__Automatyczna_CheckBox: TCheckBox;
    Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox: TCheckBox;
    Korekta_Czasu__Narastajaco__Prog_Etykieta_Label: TLabel;
    Korekta_Czasu__Narastajaco__Prog_SpinEdit: TSpinEdit;
    Jedno_Uruchomienie_Programu_CheckBox: TCheckBox;
    ColorDialog1: TColorDialog;
    Czcionka_Napisow_Button: TButton;
    Ustawienia__Domyslne_Button: TButton;
    Czas_Ms_Label: TLabel;
    Linie_Spiewu__Wielkosc_Etykieta_Label: TLabel;
    Linie_Spiewu__Wielkosc_SpinEdit: TSpinEdit;
    Dolny_Pasek_Postepu__Wyswietlaj_CheckBox: TCheckBox;
    O_Programie_TabSheet: TTabSheet;
    O_Programie_ScrollBox: TScrollBox;
    O_Programie__1_Label: TLabel;
    O_Programie__2_Label: TLabel;
    O_Programie__3_Label: TLabel;
    O_Programie__E_Mail_Label: TLabel;
    O_Programie__Www_Label: TLabel;
    O_Programie__Www__PasLibVlc_Label: TLabel;
    O_Programie__Www__VideoLAN_Label: TLabel;
    Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox: TCheckBox;
    Pomoc_TabSheet: TTabSheet;
    Pomoc_Memo: TMemo;
    Linie_Spiewu__Odstep_SpinEdit: TSpinEdit;
    Linie_Spiewu__Odstep_Etykieta_Label: TLabel;
    Informacja_StaticText: TStaticText;
    Czas_Dol_ProgressBar: TProgressBar;
    Test_Napisu_SpinEdit: TSpinEdit;
    Systemowy_Timer: TTimer;
    Napisy__Ukrywaj_Wedlug_RadioGroup: TRadioGroup;
    Zaslona_Panel: TPanel;
    Ustawienia__Wczytaj_Button: TButton;
    Ustawienia__Zapisz_Button: TButton;
    Tlo_Napisow_Button: TButton;
    FontDialog1: TFontDialog;
    Opcje_ScrollBox: TScrollBox;
    Ukryj_Przyciski_Panel_Button: TButton;
    Czas_Test_Label: TLabel;
    Czas_Start_Ustaw_Button: TButton;
    Napisy_EditButton: TEditButton;
    Muzyka_EditButton: TEditButton;
    OpenDialog1: TOpenDialog;
    Opcje_Button: TButton;
    Napisy__Wyswietlaj_Wedlug_RadioGroup: TRadioGroup;
    Tryb_Testowy_Napisow_CheckBox: TCheckBox;
    Skok_Sekundy_SpinEdit: TSpinEdit;
    Zegar_Czestotliwosc_Etykieta_Label: TLabel;
    Pozycja_Obszaru_Spiewu_Etykieta_Label: TLabel;
    Linia_Spiewu__Dol_CheckBox: TCheckBox;
    Linia_Spiewu__Dol_StaticText: TStaticText;
    Linia_Spiewu__Dol__Kolor_Button: TButton;
    Linia_Spiewu__Gora_CheckBox: TCheckBox;
    Linia_Spiewu__Gora_StaticText: TStaticText;
    Linia_Spiewu__Gora__Kolor_Button: TButton;
    Linia_Spiewu__Srodek_CheckBox: TCheckBox;
    Linia_Spiewu__Srodek_StaticText: TStaticText;
    Linia_Spiewu__Srodek__Kolor_Button: TButton;
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
    Skok_Do__Tylu_Button: TButton;
    Skok_Do__Przodu_Button: TButton;
    Ciszej_Button: TButton;
    Glosniej_Button: TButton;
    Test_Memo: TMemo;
    PageControl1: TPageControl;
    Opcje_TabSheet: TTabSheet;
    Splitter3: TSplitter;
    StaticText1: TStaticText;
    Test_Panel: TPanel;
    Opcje_Splitter: TSplitter;
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
    procedure Skok_Do__Przodu_ButtonClick( Sender: TObject );
    procedure Skok_Do__Tylu_ButtonClick( Sender: TObject );
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
    procedure Napisy__Wyswietlaj_Wedlug_RadioGroupClick( Sender: TObject );
    procedure Czas_Start_Ustaw_ButtonClick( Sender: TObject );
    procedure Czcionka_Napisow_ButtonClick( Sender: TObject );
    procedure Tlo_Napisow_ButtonClick( Sender: TObject );
    procedure Linia_Spiewu__KolorButtonClick( Sender: TObject );
    procedure Ustawienia__Domyslne_ButtonClick( Sender: TObject );
    procedure Ustawienia__Wczytaj_ButtonClick( Sender: TObject );
    procedure Ustawienia__Zapisz_ButtonClick( Sender: TObject );
    procedure Tlumaczenia_ComboBoxKeyDown( Sender: TObject; var Key: Word;      Shift: TShiftState );
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
    linia_spiewu__dol__widoczna,
    linia_spiewu__gora__widoczna,
    linia_spiewu__srodek__widoczna,
    mysz__przycisk_nacisniety_g,
    needStop, //???
    tlumaczenie__jeden_plik__wybrane_g, // Czy wybrano wczytywanie tłumaczenia z jednego pliku.
    zamykanie
      : boolean;

    milisekundy_filmu,
    mysz__przycisk_nacisniety__x__start_g,
    mysz__przycisk_nacisniety__y__start_g,
    okno__gora,
    okno__lewo,
    okno__przenies__na_wierzch__licznik_g,
    okno__szerokosc,
    okno__wysokosc
      : integer;

    czas_start,
    informacja_czas, // Do odliczania czasu do ukrycia etykiety z informacją o zdarzeniu.
    zegar_systemowy_stop
      : TTime;

    kursor_ruch_data_czas : TDateTime;

    karaoke_handle : THANDLE;

    tlumaczenie_komunikaty_r : TTlumaczenie_Komunikaty_r;

    watek_g : TWatek;

    napisy_t : array of TNapis;

    sekcja_krytyczna : SyncObjs.TCriticalSection; // Potrzebuje w uses SyncObjs.

    procedure Czas_Pasek_Click( const pozycja_f : integer );
    procedure FormParamStr();
    procedure Glosnosc_Pasek_Click( const pozycja_f : integer );
    procedure Informacja_Tekst_Wyswietl( const napis_f : string; const liczba_f : variant; const wyswietlaj_zawsze_f : boolean = false );
    function Linie_Spiewu__Odstep_Okresl() : integer;
    procedure Mysz__Przycisk_Nacisniety__Procent_Wylicz( const x_f, y_f : integer; const ustaw_f : boolean = false );
    procedure Napisy__Czcionka_Ustaw( var napis_f : TNapis );
    function Napis__Pozycja_Ustal( napis : TNapis; czas_filmu_aktualny_f : integer; const loguj_f : boolean = false ) : integer;
    procedure Napisy__Przelicz();
    procedure Napisy__Wczytaj( const adres_pliku_f : string );
    procedure Napisy__Zwolnij();
    procedure Okno__Przenies__Na_Wierzch();
    procedure Plik__Do_Uruchomienia__Dopisz();
    function Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz( const adres_pliku_f : string ) : boolean;
    procedure Plik__Otworz( const adres_pliku_f : string );
    function Pozycja_Obszaru_Spiewu_Okresl() : integer;
    procedure Synchronizuj_Milisekundy_Filmu();
    procedure Tlumaczenia__Domyslne();
    procedure Tlumaczenia__Lista__Wczytaj();
    procedure Tlumaczenia__Lista__Zwolnij();
    procedure Tlumaczenia__Zastosuj();
    procedure Zaslona_Przerysuj( const wymus_f : boolean = false );
  public
    { public declarations }
  end;

  TTlumaczenie_Lista_Obiekt = class
    nazwa,
    nazwa_kodowa
      : string;
  end;

const
  glosnosc__poziom__minimalny_c : integer = 1;
  glosnosc__poziom__maksymalny_c : integer = 200;
  plik__ini_nazwa_c : string = 'Karaoke.ini';
  plik__skojarzenie_nazwa_c : string = 'Karaoke_plik';
  pomoc_o_programie__plik__nazwa_c : string = 'Karaoke - pomoc, o programie.txt';
  tlumaczenia__jeden_plik__plik__nazwa_c : string = 'Karaoke tłumaczenie.txt';
  tlumaczenia__katalog__nazwa_c : string = 'Tłumaczenia';
  tlumaczenia__plik_ustawien__nazwa_c : string = 'Tłumaczenia.ini';
  tlumaczenie__ustawienie__domyslne_c : string = '<domyślne>';
  tlumaczenie__ustawienie__jeden_plik_c : string = '<jeden_plik>';

var
  Karaoke_Form: TKaraoke_Form;

implementation

uses
  DateUtils,
  IniFiles,
  LazFileUtils,
  //Rtti, // Wariant z RTTI - nie działa.
  StrUtils;
  //TypInfo; // Wariant z RTTI - nie działa.

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

//Funkcja Napisy__Czcionka_Ustaw_N().
procedure TNapis.Napisy__Czcionka_Ustaw_N();
begin

  Karaoke_Form.Wymiar_Label.Caption := Self.Caption;

  Self.Font := Karaoke_Form.Wymiar_Label.Font;

  Self.Width := Karaoke_Form.Wymiar_Label.Width;
  Self.Height := Karaoke_Form.Wymiar_Label.Height;

end;//---//Funkcja Napisy__Czcionka_Ustaw_N().

//Watek.Execute().
procedure TWatek.Execute();
var
  ztt : TTime;
begin

  FreeOnTerminate := true; // zakoncz watek_g po zaknczeniu tej procedury
  Priority := tpHigher;

  while ( not Application.Terminated )
    and ( not Terminated ) do
    begin

      // Na wszelki wypadek (warunek while jest do sprawdzenia).
      if   ( Application.Terminated )
        or ( Terminated )
        or ( Karaoke_Form.zamykanie ) then
        Break;

      if Karaoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
        begin

          ztt := Now();

          Sleep( Karaoke_Form.Zegar_Czestotliwosc_SpinEdit.Value ); // 1000 = 1 sekunda.
          //Karaoke_Form.Test_Memo.Lines.Add( 'a' );

          if Karaoke_Form.sekcja_krytyczna <> nil then
            Karaoke_Form.sekcja_krytyczna.Enter();

          if Karaoke_Form.PasLibVlcPlayer1.IsPlay() then
            Karaoke_Form.milisekundy_filmu := Karaoke_Form.milisekundy_filmu + DateUtils.MilliSecondsBetween( Now(), ztt ) + Karaoke_Form.Korekta_Czasu__Narastajaco_SpinEdit.Value;

          //if Abs( Karaoke_Form.milisekundy_filmu - Karaoke_Form.PasLibVlcPlayer1.GetVideoPosInMs() ) > 350 then;
          //  Karaoke_Form.milisekundy_filmu := Karaoke_Form.PasLibVlcPlayer1.GetVideoPosInMs();

          if Karaoke_Form.sekcja_krytyczna <> nil then
            Karaoke_Form.sekcja_krytyczna.Leave();

        end;
      //---//if Karaoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.


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

  //Test_Memo.Lines.Add(  FloatToStr( pozycja_f )  );

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


  //Test_Memo.Lines.Add(  FloatToStr( procent )  );
  //Test_Memo.Lines.Add(  FloatToStr( PasLibVlcPlayer1.GetVideoLenInMs() * procent )  );
  //Test_Memo.Lines.Add(  IntToStr( Round( PasLibVlcPlayer1.GetVideoLenInMs() * procent ) )  );


  PasLibVlcPlayer1.SetVideoPosInMs(  Round( PasLibVlcPlayer1.GetVideoLenInMs() * procent )  );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Funkcja Czas_Pasek_Click().

//FormParamStr().
procedure TKaraoke_Form.FormParamStr();
var
  i : integer;
  //zts : string;
  //search_rec : TSearchRec;
begin

  for i := 0 to ParamCount do
    begin

      //Test_Memo.Lines.Add(  ParamStr( i )  );
      //Test_Memo.Lines.Add(  IntToStr( i )  );

      if Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz(  ParamStr( i )  ) then
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
      //    if FindFirst(   ExtractFilePath(  ParamStr( i )  ) + '*.*', faAnyFile, search_rec   ) = 0 then // Application potrzebuje w uses Forms.
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
      //                Test_Memo.Lines.Add( zts );
      //
      //                Muzyka_EditButton.Text := zts;
      //                Plik__Otworz( zts );
      //
      //                Break;
      //
      //              end;
      //
      //        until FindNext( search_rec ) <> 0 //Zwraca dane kolejnego pliku zgodnego z parametrami wcześniej wywołanej funkcji FindFirst. Jeżeli można przejść do następnego znalezionego pliku zwraca 0.
      //
      //      end;
      //    //---//if FindFirst(   ExtractFilePath(  ParamStr( i )  ), faAnyFile, search_rec   ) = 0 then
      //
      //    SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().
      //
      //    //Test_Memo.Lines.Add(  IntToStr( i )  );
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

  //Test_Memo.Lines.Add(  FloatToStr( pozycja_f )  );

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

  //Test_Memo.Lines.Add(  FloatToStr( procent )  );
  //Test_Memo.Lines.Add(  FloatToStr( 200 * procent )  );
  //Test_Memo.Lines.Add(  IntToStr( zti )  );


  PasLibVlcPlayer1.SetAudioVolume( zti );

end;//---//Funkcja Glosnosc_Pasek_Click().

//Funkcja Informacja_Tekst_Wyswietl().
procedure TKaraoke_Form.Informacja_Tekst_Wyswietl( const napis_f: string; const liczba_f : variant; const wyswietlaj_zawsze_f : boolean = false );
begin

  if   ( wyswietlaj_zawsze_f )
    or ( Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked ) then
    begin

      if liczba_f <> null then
        Informacja_StaticText.Caption := napis_f + ' ' + Trim(  FormatFloat( '### ### ### ### ##0', liczba_f )  ) + '.'
      else//if liczba_f <> null then
        Informacja_StaticText.Caption := napis_f + '.';

      Informacja_StaticText.Visible := true;

      informacja_czas := Now();

      //Zaslona_Przerysuj();

    end;
  //---//if   ( wyswietlaj_zawsze_f ) (...)

end;//Funkcja Informacja_Tekst_Wyswietl().

//Funkcja Linie_Spiewu__Odstep_Okresl().
function TKaraoke_Form.Linie_Spiewu__Odstep_Okresl() : integer;
begin

  // Wyrażone procentem wysokości okna filmu.

  Result := Round( PasLibVlcPlayer1.Height * Linie_Spiewu__Odstep_SpinEdit.Value / 100 );

end;//---//Funkcja Linie_Spiewu__Odstep_Okresl().

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

          if mysz__przycisk_nacisniety__x__start_g = x_f then
            Exit;


          PasLibVlcPlayer1.SetVideoPosInPercent( ruch__poziom_procent );

          Synchronizuj_Milisekundy_Filmu();


          PasLibVlcPlayer1MediaPlayerTimeChanged( nil, 0 );

        end
      else//if czy_poziom then
        begin

          if mysz__przycisk_nacisniety__y__start_g = y_f then
            Exit;


          PasLibVlcPlayer1.SetAudioVolume( ruch__pion_procent );

        end;

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


      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.postep + ': ' + zts, null, true );

    end
  else//if czy_poziom then
    Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.glosnosc + ':', ruch__pion_procent, true );

  //Informacja_Tekst_Wyswietl(   tlumaczenie_komunikaty_r.wycisz + ' x: ' + Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__poziom_procent )  ) + ' | y ' + Trim(  FormatFloat( '### ### ### ### ##0.00', ruch__pion_procent )  ), null   );


end;//---//Funkcja Mysz__Przycisk_Nacisniety__Procent_Wylicz().

//Funkcja Napisy__Czcionka_Ustaw().
procedure TKaraoke_Form.Napisy__Czcionka_Ustaw( var napis_f : TNapis );
begin

  if napis_f = nil then
    Exit;


  Wymiar_Label.Caption := napis_f.Caption;


  napis_f.Color := Wymiar_Label.Color;
  napis_f.Font := Wymiar_Label.Font;
  napis_f.Height := Wymiar_Label.Height;
  napis_f.Width := Wymiar_Label.Width;

end;//---//Funkcja Napisy__Czcionka_Ustaw().

//Funkcja Napis__Pozycja_Ustal().
function TKaraoke_Form.Napis__Pozycja_Ustal( napis : TNapis; czas_filmu_aktualny_f : integer; const loguj_f : boolean = false ) : integer;
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

  if loguj_f then
    Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.czas_trwania_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_trwania_napisu )  )   );

  if czas_trwania_napisu <= 0 then
    czas_trwania_napisu := 1;

  predkosc_napisu := Round(  ( 2 * Linie_Spiewu__Odstep_Okresl() + napis.Height + Linia_Spiewu__Dol_StaticText.Height ) / czas_trwania_napisu  );

  if loguj_f then
    Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.predkosc_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', predkosc_napisu )  )   );

  if predkosc_napisu <= 0 then
    predkosc_napisu := 1;



  if loguj_f then
    Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu__okresl + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', Pozycja_Obszaru_Spiewu_Okresl() )  )   );

  //przesuniecie_do_okna := 0;

  // G -> D.
  {
  //przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 );
  przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / Linie_Spiewu__Odstep_SpinEdit.Value );
  //Result := czas_filmu_f * 10;

  //Result := przesuniecie_do_okna + Round(  (( napis.czas_od - czas_filmu_aktualny_f ) / 1000 ) * skok_napisu );
  Result := przesuniecie_do_okna + Round(  ( czas_filmu_aktualny_f / 1000 ) * predkosc_napisu - ( napis.czas_od / 1000 ) * predkosc_napisu );
  }
  //---// G -> D.

  // D -> G.
  przesuniecie_do_okna := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 + Linie_Spiewu__Odstep_Okresl() ) - Pozycja_Obszaru_Spiewu_Okresl() + Linia_Spiewu__Dol_StaticText.Height;


  if loguj_f then
    Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.przesuniecie_do_okna + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', przesuniecie_do_okna )  )   );


  //Result := przesuniecie_do_okna - Round(  ( czas_filmu_aktualny_f / 1000 ) * predkosc_napisu - ( napis.czas_od / 1000 ) * predkosc_napisu + ( Przesuniecie_Napisow_SpinEdit.Value / 1000 ) * predkosc_napisu  );

  //Result :=
  //    przesuniecie_do_okna
  //  - Round(
  //    ( czas_filmu_aktualny_f * predkosc_napisu ) / 1000
  //  - ( napis.czas_od * predkosc_napisu ) / 1000
  //  + ( Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu / 1000
  //    );

  if loguj_f then
    begin

      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.czas_filmu_aktualny_f_x_predkosc_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_filmu_aktualny_f * predkosc_napisu )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.napis_czas_od_x_predkosc_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', napis.czas_od * predkosc_napisu )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.przesuniecie_napisow_x_predkosc_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu )  )   );

      Test_Memo.Lines.Add(  tlumaczenie_komunikaty_r.razem + ': ' + FloatToStr(
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu )  );

      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.razem + ' / 1000: ' + FloatToStr(  (
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu ) / 1000  )   );

      Test_Memo.Lines.Add(    tlumaczenie_komunikaty_r.zaokraglone__razem + ' / 1000): ' + FloatToStr(   Round(  (
          czas_filmu_aktualny_f * predkosc_napisu
        - napis.czas_od * predkosc_napisu
        + Przesuniecie_Napisow_SpinEdit.Value * predkosc_napisu ) / 1000  )   )    );

    end;
  //---//if loguj_f then


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

  //Test_Memo.Lines.Add(   Trim(  FormatFloat( '### ### ### ### ##0', Result )  )   );

  //Result := 0;

end;//---//Funkcja Napis__Pozycja_Ustal().

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

        //j := Napis__Pozycja_Ustal(  napisy_t[ 0 ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );
        //j := Napis__Pozycja_Ustal(  napisy_t[ 0 ], PasLibVlcPlayer1.GetVideoPosInMs()  );

        //Karaoke_Form.Caption := IntToStr( j );


        if not Tryb_Testowy_Napisow_CheckBox.Checked then
          begin

            //j := Napis__Pozycja_Ustal(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  );

            if Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex in [ 0, 1 ] then // zegara, filmu.
              j := Napis__Pozycja_Ustal(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  )
            else//if Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex in [ 0, 1 ] then // filmu.
              j := Napis__Pozycja_Ustal( napisy_t[ i ], milisekundy_filmu );

          end
        else//if not Tryb_Testowy_Napisow_CheckBox.Checked then
          j := Napis__Pozycja_Ustal(  napisy_t[ i ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );


        czy_ukryc_napis := false;

        if Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex = 0 then
          begin

            // Górnej krawędzi.

            if   ( j <= 0 )
              or ( j <= PasLibVlcPlayer1.Top ) then
              czy_ukryc_napis := true;

          end
        else//if Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex = 0 then
          begin

            // Dolnej krawędzi.
            // Ukrywaj napisy gdy dolna krawędź opuści obszar śpiewu (plus margines).

            if j + napisy_t[ i ].Height <= Linia_Spiewu__Gora_StaticText.Top - Linie_Spiewu__Odstep_Okresl() then
              czy_ukryc_napis := true;

          end;
        //---//if Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex = 0 then



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

        //napisy_t[ i ].Top := Napis__Pozycja_Ustal(  napisy_t[ i ], DateUtils.MilliSecondsBetween( Now(), czas_start )  );
        //napisy_t[ i ].Top := Napis__Pozycja_Ustal(  napisy_t[ i ], PasLibVlcPlayer1.GetVideoPosInMs()  )


      end;
    //---//if napisy_t[ i ] <> nil then

  //EndFormUpdate();

end;//---//Funkcja Napisy__Przelicz().

//Funkcja Napisy__Wczytaj().
procedure TKaraoke_Form.Napisy__Wczytaj( const adres_pliku_f: string );

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


  if Trim( adres_pliku_f ) = '' then
    Exit;


  tekst_l := TStringList.Create();

  try
    tekst_l.LoadFromFile( adres_pliku_f );
  except
    on E : Exception do
      begin

        tekst_l.Free();

        Application.MessageBox(  PChar(tlumaczenie_komunikaty_r.nie_udalo_sie_otworzyc_pliku_napisow_ + #13 + E.Message + ' ' + IntToStr( E.HelpContext )), PChar(tlumaczenie_komunikaty_r.blad), MB_OK + MB_ICONEXCLAMATION  );
        Exit;

      end;
    //---//on E: Exception do
  end;
  //---//try


  Screen.Cursor := crHourGlass;

  Napisy_EditButton.Text := adres_pliku_f;

  tekst_l.Add( '0' ); // Aby ostatni napis się dodał.

  czy_byla_liczba := false;
  czy_dodac_napis := false;
  czas_od := -1;
  czas_do := -1;

  Test_Memo.Lines.Clear();

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
        Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := 0 // Górna krawędź.
      else
      if Trim( zts ) = 'dół' then
        Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := 1; // Dolna krawędź.
      //if Trim( zts ) = 'brak' then
        //Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex; // Nie zmieni sposobu ukrywania napisów.

    end
  else//if i > 0 then
    if Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex <> 0 then
      Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := 0; // Jeżeli nie zdefiniowano ukrywania napisów ustawi ukrywanie według górnej krawędzi.
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

                Napisy__Czcionka_Ustaw( napisy_t[ zti ] );
                //napisy_t[ zti ].Napisy__Czcionka_Ustaw_N();
                //Wymiar_Label.Caption := zts_1;
                //Wymiar_Label.Font.Size := 20;
                //napisy_t[ zti ].Font.Color := clRed;
                //napisy_t[ zti ].Font.Size := 20;


                //napisy_t[ zti ].Width := Wymiar_Label.Width;
                //napisy_t[ zti ].Height := Wymiar_Label.Height;

                Test_Memo.Lines.Add(   Trim(  FormatFloat( '### ### ### ### ##0', czas_od )  ) + ' > ' + Trim(  FormatFloat( '### ### ### ### ##0', czas_do )  ) + ' ' + zts_1   ); // Test.


                czy_byla_liczba := true;
                czas_od := -1;
                czas_do := -1;

              end;
              //---//if not czy_dodac_napis then

            end;
          //---//if    ( czas_od = -1 ) (...)

        end;
      //---//if not czy_byla_liczba then


      //Test_Memo.Lines.Add( zts ); // Test.

    end;
  //---//for i := zti to tekst_l.Count - 1 do


  tekst_l.Free();

  Wymiar_Label.Visible := false;

  Test_Memo.Lines.Add(    tlumaczenie_komunikaty_r.razem_napisow + ': ' + Trim(   FormatFloat(  '### ### ### ### ##0', Length( napisy_t ) - 1  )   ) + '.'    ); // Test.

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

//Funkcja Okno__Przenies__Na_Wierzch().
procedure TKaraoke_Form.Okno__Przenies__Na_Wierzch();
begin

  if okno__przenies__na_wierzch__licznik_g <= 0 then
    Exit;


  Self.BringToFront();

  //Self.FormStyle := fsStayOnTop; // Sprawia, że znika obraz.
  //Self.FormStyle := fsNormal;


  dec( okno__przenies__na_wierzch__licznik_g );

end;//---//Funkcja Okno__Przenies__Na_Wierzch().

//Funkcja Plik__Do_Uruchomienia__Dopisz().
procedure TKaraoke_Form.Plik__Do_Uruchomienia__Dopisz();
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
  zts := ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c;

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

  //tekst_l.SaveToFile( zts, TEncoding.UTF8 ); //???
  tekst_l.SaveToFile( zts );

  tekst_l.Free();

end;//---//Funkcja Plik__Do_Uruchomienia__Dopisz().

//Funkcja Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz().
function TKaraoke_Form.Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz( const adres_pliku_f : string ) : boolean;
var
  search_rec : TSearchRec;
  zts : string;
begin

  //
  // Funkcja znajdzie plik z rozszerzeniem nie exe i nie napisowym i wywoła funkcję otworzenia tego pliku.
  //

  Result := false;


  if Trim( adres_pliku_f ) = '' then
    Exit;


  zts := AnsiLowerCase(  ExtractFileExt( adres_pliku_f )  );

  if Pos( '.exe', zts ) > 0 then
    Exit;

  if   (  Pos( '.srt', zts ) > 0  )
    or (  Pos( '.txt', zts ) > 0  )
    //or (  Pos( '.exe', zts ) > 0  )
    or (  Pos( '.esama_karaoke', zts ) > 0  ) then
    begin

      if FindFirst(  ExtractFilePath( adres_pliku_f ) + '*.*', faAnyFile, search_rec  ) = 0 then // Application potrzebuje w uses Forms.
        begin

          repeat

            if    ( search_rec.Attr <> faDirectory )
              and ( search_rec.Name <> '.' )
              and ( search_rec.Name <> '..' )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> zts   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.srt'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.txt'   )
              and (   AnsiLowerCase(  ExtractFileExt( search_rec.Name )  ) <> '.esama_karaoke'   )
              //and (    AnsiLowerCase(  ExtractFileNameOnly( search_rec.Name )  ) = AnsiLowerCase(   ExtractFileNameOnly( adres_pliku_f )   )    ) then
              //and (    AnsiLowerCase(   ExtractFileName(  FileUtil.ExtractFileNameWithoutExt( search_rec.Name )  )   ) = AnsiLowerCase(   ExtractFileName(  FileUtil.ExtractFileNameWithoutExt( adres_pliku_f )  )   )    ) then // Zmiana w lazarusie 2.0 z ExtractFileNameOnly().
              and (    AnsiLowerCase(   ExtractFileName(  LazFileUtils.ExtractFileNameWithoutExt( search_rec.Name )  )   ) = AnsiLowerCase(   ExtractFileName(  LazFileUtils.ExtractFileNameWithoutExt( adres_pliku_f )  )   )    ) then // Zmiana w lazarusie 3.0 z FileUtil.
                begin

                  Result := true;

                  zts := ExtractFilePath( adres_pliku_f ) + search_rec.Name;
                  Test_Memo.Lines.Add( zts );

                  Muzyka_EditButton.Text := zts;
                  Plik__Otworz( zts );

                  Break;

                end;

          until FindNext( search_rec ) <> 0 // Zwraca dane kolejnego pliku zgodnego z parametrami wcześniej wywołanej funkcji FindFirst. Jeżeli można przejść do następnego znalezionego pliku zwraca 0.

        end;
      //---//if FindFirst(  ExtractFilePath( adres_pliku_f ), faAnyFile, search_rec  ) = 0 then

      SysUtils.FindClose( search_rec ); // SysUtils. // Zmiana w lazarusie 2.0 z FindCloseUTF8().

    end;
  //---//if   (  Pos( '.srt', zts ) > 0  ) (...)

end;//---//Funkcja Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz().

//Funkcja Plik__Otworz().
procedure TKaraoke_Form.Plik__Otworz( const adres_pliku_f : string );
var
  search_rec : TSearchRec;
  sciezka_do_pliku,
  zts
    : string;
begin

  if Trim( adres_pliku_f ) = '' then
    Exit;


  Screen.Cursor := crHourGlass;

  PasLibVlcPlayer1.Play(  WideString( adres_pliku_f )  );


  if    ( Glosnosc_ProgressBar.Position >= glosnosc__poziom__minimalny_c )
    and ( Glosnosc_ProgressBar.Position <= glosnosc__poziom__maksymalny_c ) then
    PasLibVlcPlayer1.SetAudioVolume( Glosnosc_ProgressBar.Position ); // Jeżeli nie jest wczytany plik to nic się nie zmieni.

  //Karaoke_Form.BringToFront();


  Screen.Cursor := crDefault;

  Muzyka_EditButton.Text := adres_pliku_f;

  needStop := false;

  Czas_ProgressBar.Position := 0;
  Czas_ProgressBar.Max := PasLibVlcPlayer1.GetVideoLenInMs();

  Czas_Dol_ProgressBar.Position := 0;
  Czas_Dol_ProgressBar.Max := Czas_ProgressBar.Max;


  sciezka_do_pliku := adres_pliku_f;

  zts := ExtractFileExt( adres_pliku_f );

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

end;//---//Funkcja Plik__Otworz().

//Funkcja Pozycja_Obszaru_Spiewu_Okresl().
function TKaraoke_Form.Pozycja_Obszaru_Spiewu_Okresl() : integer;
begin

  // Wyrażone procentem wysokości okna filmu.

  Result := Round( PasLibVlcPlayer1.Height * Pozycja_Obszaru_Spiewu_SpinEdit.Value / 100 );

end;//---//Funkcja Pozycja_Obszaru_Spiewu_Okresl().

//Funkcja Synchronizuj_Milisekundy_Filmu().
procedure TKaraoke_Form.Synchronizuj_Milisekundy_Filmu();
begin

  sekcja_krytyczna.Enter();
  milisekundy_filmu := PasLibVlcPlayer1.GetVideoPosInMs();
  sekcja_krytyczna.Leave();

end;//---//Funkcja Synchronizuj_Milisekundy_Filmu().

//Funkcja Tlumaczenia__Domyslne().
procedure TKaraoke_Form.Tlumaczenia__Domyslne();
var
  zti : integer;
begin

  tlumaczenie__jeden_plik__wybrane_g := false;

  tlumaczenie_komunikaty_r.anuluj_wyciszenie := 'Anuluj wyciszenie';
  tlumaczenie_komunikaty_r.blad := 'Błąd';
  tlumaczenie_komunikaty_r.ciszej := 'Ciszej';
  tlumaczenie_komunikaty_r.czas_filmu_aktualny_f_x_predkosc_napisu := 'czas_filmu_aktualny_f * predkosc_napisu';
  tlumaczenie_komunikaty_r.czas_trwania_napisu := 'czas_trwania_napisu';
  tlumaczenie_komunikaty_r.czestotliwosc_zegara := 'Częstotliwość zegara';
  tlumaczenie_komunikaty_r.glosniej := 'Głośniej';
  tlumaczenie_komunikaty_r.glosnosc := 'Głośność';
  tlumaczenie_komunikaty_r.gora___wysokosc_odtwarzacza := 'Góra / wysokość odtwarzacza';
  tlumaczenie_komunikaty_r.linie_spiewu__g__s__d_ := 'Linie śpiewu (g, ś, d)';
  tlumaczenie_komunikaty_r.minimalizuj_okno := 'Minimalizuj okno';
  tlumaczenie_komunikaty_r.napis_czas_od_x_predkosc_napisu := '- napis.czas_od * predkosc_napisu';
  tlumaczenie_komunikaty_r.napis_od___do := 'Napis od - do';
  tlumaczenie_komunikaty_r.napis_tekst := 'Napis tekst';
  tlumaczenie_komunikaty_r.nie_odnaleziono_pliku_tlumaczenia := 'Nie odnaleziono pliku tłumaczenia';
  tlumaczenie_komunikaty_r.nie_udalo_sie_otworzyc_pliku_napisow_ := 'Nie udało się otworzyć pliku napisów.';
  tlumaczenie_komunikaty_r.normalny_ekran := 'Normalny ekran';
  tlumaczenie_komunikaty_r.odstep_linii_spiewu := 'Odstęp linii śpiewu';
  tlumaczenie_komunikaty_r.odswiez_widok := 'Odśwież widok';
  tlumaczenie_komunikaty_r.opcje := 'Opcje';
  tlumaczenie_komunikaty_r.otworz_plik := 'Otwórz plik';
  tlumaczenie_komunikaty_r.pauza := 'Pauza';
  tlumaczenie_komunikaty_r.pelny_ekran := 'Pełny ekran';
  tlumaczenie_komunikaty_r.postep := 'Postęp';
  tlumaczenie_komunikaty_r.pozycja_filmu := 'Pozycja filmu';
  tlumaczenie_komunikaty_r.pozycja_napisu := 'Pozycja napisu';
  tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu := 'Pozycja obszaru śpiewu';
  tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu__okresl := 'Pozycja_Obszaru_Spiewu';
  tlumaczenie_komunikaty_r.predkosc_napisu := 'predkosc_napisu';
  tlumaczenie_komunikaty_r.przesuniecie_do_okna := 'przesuniecie_do_okna';
  tlumaczenie_komunikaty_r.przesuniecie_napisow := 'Przesunięcie napisów';
  tlumaczenie_komunikaty_r.przesuniecie_napisow_x_predkosc_napisu := '+ Przesuniecie_Napisow * predkosc_napisu';
  tlumaczenie_komunikaty_r.razem := 'Razem';
  tlumaczenie_komunikaty_r.razem_napisow := 'Razem napisów';
  tlumaczenie_komunikaty_r.rozmiar_czcionki_napisow := 'Rozmiar czcionki napisów';
  tlumaczenie_komunikaty_r.roznica := 'Różnica';
  tlumaczenie_komunikaty_r.skocz_o_1_klatke_do_przodu := 'Skocz o 1 klatkę do przodu';
  tlumaczenie_komunikaty_r.skok_do_przodu := 'Skok do przodu';
  tlumaczenie_komunikaty_r.skok_do_tylu := 'Skok do tyłu';
  tlumaczenie_komunikaty_r.skok_o_ilosc_sekund := 'Skok o ilość sekund';
  tlumaczenie_komunikaty_r.stop := 'Stop';
  tlumaczenie_komunikaty_r.test_napisu := 'Test napisu';
  tlumaczenie_komunikaty_r.tlumaczenie__domyslne := '<domyślne>';
  tlumaczenie_komunikaty_r.tlumaczenie__jeden_plik := '<Karaoke tłumaczenie>';
  tlumaczenie_komunikaty_r.ukryj_panel_przyciskow := 'Ukryj panel przycisków';
  tlumaczenie_komunikaty_r.wczytaj_napisy := 'Wczytaj napisy';
  tlumaczenie_komunikaty_r.widocznosc_linii_spiewu := 'Widoczność linii śpiewu';
  tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_dolnej := 'Widoczność linii śpiewu dolnej';
  tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_gornej := 'Widoczność linii śpiewu górnej';
  tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_srodkowej := 'Widoczność linii śpiewu środkowej';
  tlumaczenie_komunikaty_r.wielkosc_linii_spiewu := 'Wielkość linii śpiewu';
  tlumaczenie_komunikaty_r.wycisz := 'Wycisz';
  tlumaczenie_komunikaty_r.wyczysc_napisy := 'Wyczyść napisy';
  tlumaczenie_komunikaty_r.wznow := 'Wznów';
  tlumaczenie_komunikaty_r.zaokraglone__razem := 'Zaokrąglone (Razem';


  Ciszej_Button.Caption := '-';
  Ciszej_Button.Hint := 'Ciszej [Strzałka w dół, - (numeryczna)].';
  Czas_Ms_Label.Caption := '0 / 0';
  Czas_Ms_Label.Hint := 'Postęp / czas utworu w milisekundach.';
  Czas_ProgressBar.Hint := '';
  Czas_Test_Label.Hint := '';
  Czas_Start_Ustaw_Button.Caption := 'Ustaw czas start';
  Czas_Start_Ustaw_Button.Hint := 'Ustaw czas start na aktualny (zeruj).';
  Czcionka_Napisow_Button.Caption := 'Czcionka napisów';
  Czcionka_Napisow_Button.Hint := 'Ustaw czcionkę napisów' + #13 + #10 + '[Home - zwiększ rozmiar]' + #13 + #10 + '[End - zmniejsz rozmiar]';
  Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Caption := 'Ukrywaj dolny pasek postępu';
  Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Hint := 'Automatycznie ukrywaj dolny pasek postępu (gdy kursor myszy nie znajduje się w dolnej części okna).';
  Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Caption := 'Wyświetlaj dolny pasek postępu';
  Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Hint := 'Wyświetlaj dolny pasek postępu (po umieszczeniu kursora myszy w dolnej części okna) gdy górny panel jest niewidoczny.';
  Glosniej_Button.Caption := '+';
  Glosniej_Button.Hint := 'Głośniej [Strzałka w górę, + (numeryczna)].';
  Glosnosc_Label.Hint := 'Poziom głośności.';
  Glosnosc_ProgressBar.Hint := 'Pasek głośności.';
  Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Caption := 'Wyświetlaj informację o zdarzeniu';
  Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Hint := 'Wyświetlaj na ekranie informację o zdarzeniu (np. naciśnięcie przycisku).';
  Jedno_Uruchomienie_Programu_CheckBox.Caption := 'Jedno uruchomienie programu';
  Jedno_Uruchomienie_Programu_CheckBox.Hint := '';
  Korekta_Czasu__Narastajaco_Etykieta_Label.Caption := 'Korekta czasu narastająco [ms]';
  Korekta_Czasu__Narastajaco_Etykieta_Label.Hint := '';
  Korekta_Czasu__Narastajaco_SpinEdit.Hint := '';
  Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox.Caption := '<?>';
  Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox.Hint := 'Prezentuj różnicę czasu narastająco względem czasu utworu (w setnych częściach sekundy - cs).';
  Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Caption := 'Automatyczna korekta czasu narastająco';
  Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Hint := 'Automatyczne dostosowywanie korekty czasu narastająco.';
  Korekta_Czasu__Narastajaco__Prog_Etykieta_Label.Caption := 'Próg korekty czasu narastająco [ms]';
  Korekta_Czasu__Narastajaco__Prog_Etykieta_Label.Hint := 'Po jakim bezwzględnym odchyleniu w milisekundach ma zadziałać automatyczna korekta.';
  Korekta_Czasu__Narastajaco__Prog_SpinEdit.Hint := 'Po jakim bezwzględnym odchyleniu w milisekundach ma zadziałać automatyczna korekta.';
  Linia_Spiewu__Dol_CheckBox.Caption := 'Widoczność linii śpiewu dolnej';
  Linia_Spiewu__Dol_CheckBox.Hint := '[L, 3].';
  Linia_Spiewu__Dol__Kolor_Button.Caption := 'Kolor linii śpiewu dolnej';
  Linia_Spiewu__Dol__Kolor_Button.Hint := '';
  Linia_Spiewu__Gora_CheckBox.Caption := 'Widoczność linii śpiewu górnej';
  Linia_Spiewu__Gora_CheckBox.Hint := '[L, 1].';
  Linia_Spiewu__Gora__Kolor_Button.Caption := 'Kolor linii śpiewu górnej';
  Linia_Spiewu__Gora__Kolor_Button.Hint := '';
  Linie_Spiewu__Odstep_Etykieta_Label.Caption := 'Odstęp linii śpiewu [%]';
  Linie_Spiewu__Odstep_Etykieta_Label.Hint := 'Odstęp linii śpiewu' + #13 + #10 + '[7 (numeryczna) - zwiększ]' + #13 + #10 + '[1 (numeryczna) - zmniejsz]';
  Linie_Spiewu__Odstep_SpinEdit.Hint := 'Odstęp linii śpiewu' + #13 + #10 + '[7 (numeryczna) - zwiększ]' + #13 + #10 + '[1 (numeryczna) - zmniejsz]';
  Linia_Spiewu__Srodek_CheckBox.Caption := 'Widoczność linii śpiewu środkowej';
  Linia_Spiewu__Srodek_CheckBox.Hint := '[L, 2].';
  Linia_Spiewu__Srodek__Kolor_Button.Caption := 'Kolor linii śpiewu środkowej';
  Linia_Spiewu__Srodek__Kolor_Button.Hint := '';
  Linie_Spiewu__Wielkosc_Etykieta_Label.Caption := 'Wielkość linii śpiewu';
  Linie_Spiewu__Wielkosc_Etykieta_Label.Hint := 'Wielkość linii śpiewu' + #13 + #10 + '[8 (numeryczna) - zwiększ]' + #13 + #10 + '[2 (numeryczna) - zmniejsz]';
  Linie_Spiewu__Wielkosc_SpinEdit.Hint := 'Wielkość linii śpiewu' + #13 + #10 + '[8 (numeryczna) - zwiększ]' + #13 + #10 + '[2 (numeryczna) - zmniejsz]';
  Test_Memo.Hint := '';
  Muzyka_EditButton.Hint := 'Plik multimediów (wskaż plik) [Ctrl + O].';
  Muzyka_EditButton.ButtonCaption := '...';
  Muzyka_EditButton.ButtonHint := 'Wskaż plik multimediów [Ctrl + O].';
  Napisy_EditButton.Hint := 'Plik napisów (wskaż plik) [Ctrl + N].';
  Napisy_EditButton.ButtonCaption := '...';
  Napisy_EditButton.ButtonHint := 'Wskaż plik napisów [Ctrl + N].';
  Napisy__Ukrywaj_Wedlug_RadioGroup.Caption := 'Ukrywaj napisy według krawędzi';
  Napisy__Ukrywaj_Wedlug_RadioGroup.Hint := 'Ukrywaj napisy gdy górna krawędź napisu dojdzie do krawędzi ekranu lub gdy dolna krawędź opuści obszar śpiewu.';
    zti := Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex;
    Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Clear();
    Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Add( 'górnej' );
    Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Add( 'dolnej' );

    if    ( zti >= 0 )
      and ( Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Count > 0 )
      and ( zti <Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Count )then
      Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := zti
    else//if    ( zti >= 0 ) (...)
      if Napisy__Ukrywaj_Wedlug_RadioGroup.Items.Count > 0 then
        Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := 0;

  Napisy__Wyswietlaj_Wedlug_RadioGroup.Caption := 'Wyświetlaj napisy według';
  Napisy__Wyswietlaj_Wedlug_RadioGroup.Hint := '';
    zti := Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex;
    Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Clear();
    Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Add( 'zegara' );
    Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Add( 'filmu' );
    Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Add( 'czasu narastająco' );

    if    ( zti >= 0 )
      and ( Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Count > 0 )
      and ( zti <Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Count )then
      Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex := zti
    else//if    ( zti >= 0 ) (...)
      if Napisy__Wyswietlaj_Wedlug_RadioGroup.Items.Count > 0 then
        Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex := 0;

  Nastepna_Klatka_Button.Caption := 'k+';
  Nastepna_Klatka_Button.Hint := 'Skocz 1 klatkę do przodu [>].';
  Nie_Odswiezaj_Widoku_CheckBox.Caption := 'Nie odświeżaj widoku';
  Nie_Odswiezaj_Widoku_CheckBox.Hint := 'Nie przerysowuje automatycznie okna (tylko gdy wymuszone [R]).';
  O_Programie_TabSheet.Caption := 'O programie';
  O_Programie_ScrollBox.Hint := '';
  Opcje_Button.Caption := 'O';
  Opcje_Button.Hint := 'Opcje [O].';
  Opcje_TabSheet.Caption := 'Opcje';
  Opcje_ScrollBox.Hint := '';
  Otworz_Plik_Button.Caption := 'Otwórz plik';
  Otworz_Plik_Button.Hint := 'Otwórz plik [P].';
  Pauza_Button.Caption := 'Pauza';
  Pauza_Button.Hint := 'Pauza [Spacja].';
  Pelny_Ekran_Button.Caption := 'Pełny ekran';
  Pelny_Ekran_Button.Hint := 'Pełny ekran [F, Ctrl + Enter]' + #13 + #10 + 'Normalny ekran [Esc, F, Ctrl + Enter, Shift + Enter, Ctrl + U]' + #13 + #10 + 'Maksymalizuj okno [Enter, Ctrl + U]' + #13 + #10 + 'Minimalizuj okno [, (numeryczna)]';
  Pomoc_TabSheet.Caption := 'Pomoc';
  Pomoc_Memo.Hint := '';
  Pozycja_Obszaru_Spiewu_Etykieta_Label.Caption := 'Pozycja obszaru śpiewu [%]';
  Pozycja_Obszaru_Spiewu_Etykieta_Label.Hint := 'Pozycja obszaru śpiewu w procentach' + #13 + #10 + '[Page Up - podwyższ]' + #13 + #10 + '[Page Down - obniż]';
  Pozycja_Obszaru_Spiewu_SpinEdit.Hint := 'Pozycja obszaru śpiewu w procentach' + #13 + #10 + '[Page Up - podwyższ]' + #13 + #10 + '[Page Down - obniż]';
  Przesuniecie_Napisow_Etykieta_Label.Caption := 'Przesunięcie napisów [ms]';
  Przesuniecie_Napisow_Etykieta_Label.Hint := 'Przesunięcie napisów' + #13 + #10 + '[[ - opóźnij 100 ms]' + #13 + #10 + '[] - przyśpiesz 100 ms]' + #13 + #10 + '[Ctrl + [ - opóźnij 500 ms]' + #13 + #10 + '[Ctrl + ] - przyśpiesz 500 ms]' + #13 + #10 + '['' - wyzeruj]';
  Przesuniecie_Napisow_SpinEdit.Hint := 'Przesunięcie napisów' + #13 + #10 + '[[ - opóźnij 100 ms]' + #13 + #10 + '[] - przyśpiesz 100 ms]' + #13 + #10 + '[Ctrl + [ - opóźnij 500 ms]' + #13 + #10 + '[Ctrl + ] - przyśpiesz 500 ms]' + #13 + #10 + '['' - wyzeruj]';
  Skok_Do__Przodu_Button.Caption := '>+';
  Skok_Do__Przodu_Button.Hint := 'Skocz do przodu [Strzałka w prawo, 10x : Ctrl + Strzałka w prawo, 0.1x : Shift + Strzałka w prawo].';
  Skok_Do__Tylu_Button.Caption := '-<';
  Skok_Do__Tylu_Button.Hint := 'Skocz do tyłu [Strzałka w lewo, 10x : Ctrl + Strzałka w lewo, 0.1x : Shift + Strzałka w lewo].';
  Skok_Sekundy_Etykieta_Label.Caption := 'Skok o ilość sekund';
  Skok_Sekundy_Etykieta_Label.Hint := 'Skok o ilość sekund' + #13 + #10 + '[9 (numeryczna) - zwiększ]' + #13 + #10 + '[3 (numeryczna) - zmniejsz]';
  Skok_Sekundy_SpinEdit.Hint := 'Skok o ilość sekund' + #13 + #10 + '[9 (numeryczna) - zwiększ]' + #13 + #10 + '[3 (numeryczna) - zmniejsz]';
  Stop_Button.Caption := 'Stop';
  Stop_Button.Hint := 'Stop [S].';
  Test_TabSheet.Caption := 'Test';
  Test_Memo.Hint := '';
  Test_Napisu_SpinEdit.Hint := '[Enter] - testuj napis o wskazanym numerze w aktualnym momencie muzyki.';
  Tlo_Napisow_Button.Caption := 'Tło napisów';
  Tlo_Napisow_Button.Hint := 'Ustaw tło napisów.';
  Tlumaczenia_Etykieta_Label.Caption := 'Tłumaczenie';
  Tlumaczenia_ComboBox.Hint := '[Enter] - zastosuj' + #13 + #10 + '[Ctrl + R] - wczytaj';
  Tryb_Testowy_Napisow_CheckBox.Caption := 'Tryb testowy napisów';
  Tryb_Testowy_Napisow_CheckBox.Hint := 'Przeliczaj napisy według czasu zegara a nie czasu filmu.';
  Ukryj_Przyciski_Panel_Button.Caption := '_';
  Ukryj_Przyciski_Panel_Button.Hint := 'Ukryj panel przycisków [U].';
  Ustawienia__Domyslne_Button.Caption := 'Domyślne ustawienia';
  Ustawienia__Domyslne_Button.Hint := '';
  Ustawienia__Wczytaj_Button.Caption := 'Wczytaj ustawienia';
  Ustawienia__Wczytaj_Button.Hint := '';
  Ustawienia__Zapisz_Button.Caption := 'Zapisz ustawienia';
  Ustawienia__Zapisz_Button.Hint := '';
  Wczytaj_Napisy_Button.Caption := 'Wczytaj napisy';
  Wczytaj_Napisy_Button.Hint := 'Wczytaj napisy [N].';
  Wycisz_Button.Caption := 'Wycisz';
  Wycisz_Button.Hint := 'Wycisz [W].';
  Wyczysc_Napisy_Button.Caption := 'Wyczyść napisy';
  Wyczysc_Napisy_Button.Hint := 'Wyczyść napisy [X].';
  Wznow_Button.Caption := 'Wznów';
  Wznow_Button.Hint := 'Wznów [Spacja].';
  Zegar_Czestotliwosc_Etykieta_Label.Caption := 'Częstotliwość zegara';
  Zegar_Czestotliwosc_Etykieta_Label.Hint := 'Częstotliwość zegara' + #13 + #10 + '[Ctrl + + - zwiększ]' + #13 + #10 + '[Ctrl + - - zmniejsz]' + #13 + #10 + '[Ctrl + Backspace - domyślna]';
  Zegar_Czestotliwosc_SpinEdit.Hint := 'Częstotliwość zegara' + #13 + #10 + '[Ctrl + + - zwiększ]' + #13 + #10 + '[Ctrl + - - zmniejsz]' + #13 + #10 + '[Ctrl + Backspace - domyślna]';

end;//---//Funkcja Tlumaczenia__Domyslne().

//Funkcja Tlumaczenia__Lista__Wczytaj().
procedure TKaraoke_Form.Tlumaczenia__Lista__Wczytaj();
var
  zti : integer;
  zts : string;
  search_rec : TSearchRec;

  tlumaczenie_lista_obiekt : TTlumaczenie_Lista_Obiekt;
begin

  zti := Tlumaczenia_ComboBox.ItemIndex;


  Tlumaczenia__Lista__Zwolnij();


  tlumaczenie_lista_obiekt := TTlumaczenie_Lista_Obiekt.Create();
  tlumaczenie_lista_obiekt.nazwa := tlumaczenie_komunikaty_r.tlumaczenie__domyslne;
  tlumaczenie_lista_obiekt.nazwa_kodowa := tlumaczenie__ustawienie__domyslne_c;
  Tlumaczenia_ComboBox.Items.AddObject( tlumaczenie_lista_obiekt.nazwa, tlumaczenie_lista_obiekt );


  if FileExists(  ExtractFilePath( Application.ExeName ) + tlumaczenia__jeden_plik__plik__nazwa_c  ) then
    begin

      tlumaczenie_lista_obiekt := TTlumaczenie_Lista_Obiekt.Create();
      tlumaczenie_lista_obiekt.nazwa := tlumaczenie_komunikaty_r.tlumaczenie__jeden_plik;
      tlumaczenie_lista_obiekt.nazwa_kodowa := tlumaczenie__ustawienie__jeden_plik_c;
      Tlumaczenia_ComboBox.Items.AddObject( tlumaczenie_lista_obiekt.nazwa, tlumaczenie_lista_obiekt );

    end;
  //---//if FileExists(  ExtractFilePath( Application.ExeName ) + tlumaczenia__jeden_plik__plik__nazwa_c  ) then


  if DirectoryExists(  ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c  ) then
    begin

      if FindFirst(  ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c + DirectorySeparator + '*.txt', faAnyFile, search_rec  ) = 0 then
        begin

          repeat

            zts := search_rec.Name;
            zts := ReverseString( zts );
            Delete(  zts, 1, Pos( '.', zts )  );
            zts := ReverseString( zts );

            tlumaczenie_lista_obiekt := TTlumaczenie_Lista_Obiekt.Create();
            tlumaczenie_lista_obiekt.nazwa := zts;
            tlumaczenie_lista_obiekt.nazwa_kodowa := zts;
            Tlumaczenia_ComboBox.Items.AddObject( tlumaczenie_lista_obiekt.nazwa, tlumaczenie_lista_obiekt );

          until FindNext( search_rec ) <> 0

        end;
      //---//if FindFirst(  ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c + DirectorySeparator + '*.txt', faAnyFile, search_rec  ) = 0 then

      SysUtils.FindClose( search_rec );

    end;
  //---//if DirectoryExists(  ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c  ) then


  if    ( zti >= 0 )
    and ( Tlumaczenia_ComboBox.Items.Count > 0 )
    and ( zti < Tlumaczenia_ComboBox.Items.Count ) then
    Tlumaczenia_ComboBox.ItemIndex := zti
  else//if    ( zti >= 0 ) (...)
    if Tlumaczenia_ComboBox.Items.Count > 0 then
      Tlumaczenia_ComboBox.ItemIndex := 0;

end;//---//Funkcja Tlumaczenia__Lista__Wczytaj().

//Funkcja Tlumaczenia__Lista__Zwolnij().
procedure TKaraoke_Form.Tlumaczenia__Lista__Zwolnij();
var
  i : integer;
begin

  for i := 0 to Tlumaczenia_ComboBox.Items.Count - 1 do
    TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ i ]).Free();

  Tlumaczenia_ComboBox.Clear();

end;//---//Funkcja Tlumaczenia__Lista__Zwolnij().

//Funkcja Tlumaczenia__Zastosuj().
procedure TKaraoke_Form.Tlumaczenia__Zastosuj();
const
  tlumaczenie_komunikaty_r_c_l : string = 'tlumaczenie_komunikaty_r.';
  tlumaczenie__nowa_linia_c_l : string = '#13#10';
  tlumaczenie__wyroznik__elementy_c_l : string = '-->Elementy';
  tlumaczenie__wyroznik__podpowiedz_c_l : string = '-->Podpowiedź';

var
  czy_elementy, // Czy tłumaczenie dotyczy elementów komponentu (np. pozycje listy rozwijanej).
  czy_podpowiedz // Czy tłumaczenie dotyczy podpowiedzi komponentu.
    : boolean;

  i,
  zti_1,
  zti_2
    : integer;

  zts_1,
  zts_2,
  nazwa
    : string;

  //rtti_property : TRttiProperty; // Wariant z RTTI - nie działa.
  //rtti_type : TRttiType;

  tekst_l : TStringList;
  zt_component : TComponent;
begin

  Tlumaczenia__Domyslne();


  if Tlumaczenia_ComboBox.Items.Count <= 0 then
    Exit;


  zts_2 := TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ Tlumaczenia_ComboBox.ItemIndex ]).nazwa_kodowa;

  if zts_2 = tlumaczenie__ustawienie__domyslne_c then
    begin

      Exit;

    end
  else//if zts_2 = tlumaczenie__ustawienie__domyslne_c then
  if zts_2 = tlumaczenie__ustawienie__jeden_plik_c then
    begin

      //tlumaczenie__jeden_plik__wybrane_g := true; //???

      zts_2 := tlumaczenia__jeden_plik__plik__nazwa_c;

    end
  else//if zts_2 = tlumaczenie__ustawienie__jeden_plik_c then
    zts_2 := tlumaczenia__katalog__nazwa_c + DirectorySeparator + zts_2 + '.txt';

  zts_1 := ExtractFilePath( Application.ExeName ) + zts_2;


  if not FileExists( zts_1 ) then // Sprawdza czy istnieje plik.
    begin

      Application.MessageBox( PChar(tlumaczenie_komunikaty_r.nie_odnaleziono_pliku_tlumaczenia + ': ' + zts_1 + '.'), PChar(tlumaczenie_komunikaty_r.blad), MB_ICONEXCLAMATION + MB_OK );
      Exit;

    end;
  //---//if not FileExists( zts_1 ) then

  Screen.Cursor := crHourGlass;

  tekst_l := TStringList.Create();
  tekst_l.LoadFromFile( zts_1 ); // Jeżeli pliku nie ma to nie trzeba wczytywać, można od razu dodawać linie.

  //if tekst_l.Count > 0 then //??? // Wariant z RTTI - nie działa.
  //  rtti_type := TRTTIContext.Create.GetType(  TypeInfo( TTlumaczenie_Komunikaty_r )  );


  for i := 0 to tekst_l.Count - 1 do
    begin

      zts_1 := tekst_l[ i ];

      if Trim( zts_1 ) <> '' then
        begin

          zti_1 := Pos( '=', zts_1 );

          // Te pozycje nie podlegają tłumaczeniu.
          if   (  Pos( 'O_Programie__1_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__E_Mail_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__Www_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__2_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__Www__VideoLAN_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__3_Label', zts_1 ) > 0  )
            or (  Pos( 'O_Programie__Www__PasLibVlc_Label', zts_1 ) > 0  )
            or (
                     (  Pos( 'Pomoc_Memo', zts_1 ) > 0  )
                 and (  Pos( tlumaczenie__wyroznik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (
                     (  Pos( 'Test_Memo', zts_1 ) > 0  )
                 and (  Pos( tlumaczenie__wyroznik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               )
            or (
                     (  Pos( 'Tlumaczenia_ComboBox', zts_1 ) > 0  )
                 and (  Pos( tlumaczenie__wyroznik__podpowiedz_c_l + '=', zts_1 ) <= 0  )
               ) then
            zti_1 := -1;

          // Komentarze '//(...)', '    //(...)'.
          zts_2 := Trim( zts_1 );

          if    ( Length( zts_2 ) > 1 )
            and ( zts_2[ 1 ] = '*' )
            and ( zts_2[ 2 ] = '*' ) then
            zti_1 := -1;

          if zti_1 > 1 then
            begin

              if Pos( tlumaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komponenty.'}
                  if Pos( tlumaczenie__wyroznik__podpowiedz_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_podpowiedz := true;
                      zts_1 := StringReplace( zts_1, tlumaczenie__wyroznik__podpowiedz_c_l , '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( tlumaczenie__wyroznik__podpowiedz_c_l + '=', zts_1 ) > 0 then
                    czy_podpowiedz := false;

                  if Pos( tlumaczenie__wyroznik__elementy_c_l + '=', zts_1 ) > 0 then
                    begin

                      czy_elementy := true;
                      zts_1 := StringReplace( zts_1, tlumaczenie__wyroznik__elementy_c_l, '', [] );
                      zti_1 := Pos( '=', zts_1 );

                    end
                  else//if Pos( tlumaczenie__wyroznik__elementy_c_l + '=', zts_1 ) > 0 then
                    czy_elementy := false;


                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zts_2 := nazwa;

                  if Pos( '_EditButton.Button', nazwa ) > 0 then
                    zts_2 := StringReplace( zts_2, '_EditButton.Button', '_EditButton', [] );


                  zt_component := nil;

                  zt_component := Self.FindComponent( zts_2 );


                  if czy_podpowiedz then
                    begin

                      // Te podpowiedzi pozycji menu nie podlegają tłumaczeniu.
                      if   (  Pos( 'Obrazki_Kostek__Domyślne_MenuItem', nazwa ) > 0  )
                        or (  Pos( 'Obrazki_Kostek__Brak_MenuItem', nazwa ) > 0  ) then
                        zt_component := nil;

                    end;
                  //---//if czy_podpowiedz then


                  if zt_component <> nil then
                    begin

                      zts_1 := StringReplace( zts_1, tlumaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                      if Pos( '_Button', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TButton(zt_component).Hint := zts_1;

                          if    (  Trim( TButton(zt_component).Hint ) <> ''  )
                            and ( not TButton(zt_component).ShowHint ) then
                            TButton(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_CheckBox', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TCheckBox(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TCheckBox(zt_component).Hint := zts_1;

                          if    (  Trim( TCheckBox(zt_component).Hint ) <> ''  )
                            and ( not TCheckBox(zt_component).ShowHint ) then
                            TCheckBox(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_ComboBox', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TComboBox(zt_component).Hint := zts_1;

                          if    (  Trim( TComboBox(zt_component).Hint ) <> ''  )
                            and ( not TComboBox(zt_component).ShowHint ) then
                            TComboBox(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_EditButton.Button', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TEditButton(zt_component).ButtonCaption := zts_1
                          else//if not czy_podpowiedz then
                            TEditButton(zt_component).ButtonHint := zts_1;

                          if    (  Trim( TEditButton(zt_component).ButtonHint ) <> ''  )
                            and ( not TEditButton(zt_component).ShowHint ) then
                            TEditButton(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_EditButton', nazwa ) > 0 then
                        begin
                          if not czy_podpowiedz then
                            TEditButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TEditButton(zt_component).Hint := zts_1;

                          if    (  Trim( TEditButton(zt_component).Hint ) <> ''  )
                            and ( not TEditButton(zt_component).ShowHint ) then
                            TEditButton(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_Label', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TLabel(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TLabel(zt_component).Hint := zts_1;

                          if    (  Trim( TLabel(zt_component).Hint ) <> ''  )
                            and ( not TLabel(zt_component).ShowHint ) then
                            TLabel(zt_component).ShowHint := true;

                        end
                      else
                      //if Pos( '_Panel', nazwa ) > 0 then
                      //  begin
                      //
                      //    if not czy_podpowiedz then
                      //      TPanel(zt_component).Caption := zts_1
                      //    else//if not czy_podpowiedz then
                      //      TPanel(zt_component).Hint := zts_1;
                      //
                      //    if    (  Trim( TPanel(zt_component).Hint ) <> ''  )
                      //      and ( not TPanel(zt_component).ShowHint ) then
                      //      TPanel(zt_component).ShowHint := true;
                      //
                      //  end
                      //else
                      if Pos( '_ProgressBar', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TProgressBar(zt_component).Hint := zts_1;

                          if    (  Trim( TProgressBar(zt_component).Hint ) <> ''  )
                            and ( not TProgressBar(zt_component).ShowHint ) then
                            TProgressBar(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_RadioButton', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TRadioButton(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TRadioButton(zt_component).Hint := zts_1;

                          if    (  Trim( TRadioButton(zt_component).Hint ) <> ''  )
                            and ( not TRadioButton(zt_component).ShowHint ) then
                            TRadioButton(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_RadioGroup', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            begin

                              if not czy_elementy then
                                TRadioGroup(zt_component).Caption := zts_1
                              else//if not czy_elementy then
                                begin

                                  zti_2 := TRadioGroup(zt_component).ItemIndex;

                                  TRadioGroup(zt_component).Items.Clear();

                                  zti_1 := Pos( ';', zts_1 );

                                  while zti_1 > 0 do
                                    begin

                                      zts_2 := Copy( zts_1, 1, zti_1 - 1 );
                                      Delete( zts_1, 1, zti_1 );

                                      zts_2 := StringReplace( zts_2, #13, '', [ rfReplaceAll ] );

                                      TRadioGroup(zt_component).Items.Add( zts_2 );

                                      zti_1 := Pos( ';', zts_1 );

                                    end;
                                  //---//while zti_1 > 0 do

                                  if    ( zti_2 >= 0 )
                                    and ( zti_2 <= TRadioGroup(zt_component).Items.Count - 1 ) then
                                    TRadioGroup(zt_component).ItemIndex := zti_2;

                                end;
                              //---//if zti_1 <= 0 then

                            end
                          else//if not czy_elementy then
                            TRadioGroup(zt_component).Hint := zts_1;

                          if    (  Trim( TRadioGroup(zt_component).Hint ) <> ''  )
                            and ( not TRadioGroup(zt_component).ShowHint ) then
                            TRadioGroup(zt_component).ShowHint := true;

                        end
                      else
                      //if Pos( '_ScrollBox', nazwa ) > 0 then
                      //  begin
                      //
                      //    if czy_podpowiedz then
                      //      TScrollBox(zt_component).Hint := zts_1;
                      //
                      //    if    (  Trim( TScrollBox(zt_component).Hint ) <> ''  )
                      //      and ( not TScrollBox(zt_component).ShowHint ) then
                      //      TScrollBox(zt_component).ShowHint := true;
                      //
                      //  end
                      //else
                      if Pos( '_SpinEdit', nazwa ) > 0 then
                        begin

                          if czy_podpowiedz then
                            TSpinEdit(zt_component).Hint := zts_1;

                          if    (  Trim( TSpinEdit(zt_component).Hint ) <> ''  )
                            and ( not TSpinEdit(zt_component).ShowHint ) then
                            TSpinEdit(zt_component).ShowHint := true;

                        end
                      else
                      if Pos( '_TabSheet', nazwa ) > 0 then
                        begin

                          if not czy_podpowiedz then
                            TTabSheet(zt_component).Caption := zts_1
                          else//if not czy_podpowiedz then
                            TTabSheet(zt_component).Hint := zts_1;

                          if    (  Trim( TTabSheet(zt_component).Hint ) <> ''  )
                            and ( not TTabSheet(zt_component).ShowHint ) then
                            TTabSheet(zt_component).ShowHint := true;

                        end
                      else
                        ;

                    end;
                  //---//if zt_component <> nil then
                  {$endregion 'Komponenty.'}

                end
              else//if Pos( tlumaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then
                begin

                  {$region 'Komunikaty.'}
                  // Wariant bez RTTI.
                  nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  Delete( zts_1, 1, zti_1 );

                  zts_1 := StringReplace( zts_1, tlumaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );

                   // Wszystkie pola rekordu należy rozpisać w ten sposób.
                  if nazwa = 'tlumaczenie_komunikaty_r.anuluj_wyciszenie' then
                    tlumaczenie_komunikaty_r.anuluj_wyciszenie := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.blad' then
                    tlumaczenie_komunikaty_r.blad := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.ciszej' then
                    tlumaczenie_komunikaty_r.ciszej := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.czas_filmu_aktualny_f_x_predkosc_napisu' then
                    tlumaczenie_komunikaty_r.czas_filmu_aktualny_f_x_predkosc_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.czas_trwania_napisu' then
                    tlumaczenie_komunikaty_r.czas_trwania_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.czestotliwosc_zegara' then
                    tlumaczenie_komunikaty_r.czestotliwosc_zegara := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.glosniej' then
                    tlumaczenie_komunikaty_r.glosniej := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.glosnosc' then
                    tlumaczenie_komunikaty_r.glosnosc := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.gora___wysokosc_odtwarzacza' then
                    tlumaczenie_komunikaty_r.gora___wysokosc_odtwarzacza := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.linie_spiewu__g__s__d_' then
                    tlumaczenie_komunikaty_r.linie_spiewu__g__s__d_ := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.minimalizuj_okno' then
                    tlumaczenie_komunikaty_r.minimalizuj_okno := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.napis_czas_od_x_predkosc_napisu' then
                    tlumaczenie_komunikaty_r.napis_czas_od_x_predkosc_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.napis_od___do' then
                    tlumaczenie_komunikaty_r.napis_od___do := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.napis_tekst' then
                    tlumaczenie_komunikaty_r.napis_tekst := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.nie_odnaleziono_pliku_tlumaczenia' then
                    tlumaczenie_komunikaty_r.nie_odnaleziono_pliku_tlumaczenia := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.nie_udalo_sie_otworzyc_pliku_napisow_' then
                    tlumaczenie_komunikaty_r.nie_udalo_sie_otworzyc_pliku_napisow_ := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.normalny_ekran' then
                    tlumaczenie_komunikaty_r.normalny_ekran := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.odstep_linii_spiewu' then
                    tlumaczenie_komunikaty_r.odstep_linii_spiewu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.odswiez_widok' then
                    tlumaczenie_komunikaty_r.odswiez_widok := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.opcje' then
                    tlumaczenie_komunikaty_r.opcje := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.otworz_plik' then
                    tlumaczenie_komunikaty_r.otworz_plik := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pauza' then
                    tlumaczenie_komunikaty_r.pauza := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pelny_ekran' then
                    tlumaczenie_komunikaty_r.pelny_ekran := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.postep' then
                    tlumaczenie_komunikaty_r.postep := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pozycja_filmu' then
                    tlumaczenie_komunikaty_r.pozycja_filmu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pozycja_napisu' then
                    tlumaczenie_komunikaty_r.pozycja_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu' then
                    tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu__okresl' then
                    tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu__okresl := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.predkosc_napisu' then
                    tlumaczenie_komunikaty_r.predkosc_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.przesuniecie_do_okna' then
                    tlumaczenie_komunikaty_r.przesuniecie_do_okna := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.przesuniecie_napisow' then
                    tlumaczenie_komunikaty_r.przesuniecie_napisow := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.przesuniecie_napisow_x_predkosc_napisu' then
                    tlumaczenie_komunikaty_r.przesuniecie_napisow_x_predkosc_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.razem' then
                    tlumaczenie_komunikaty_r.razem := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.razem_napisow' then
                    tlumaczenie_komunikaty_r.razem_napisow := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.rozmiar_czcionki_napisow' then
                    tlumaczenie_komunikaty_r.rozmiar_czcionki_napisow := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.roznica' then
                    tlumaczenie_komunikaty_r.roznica := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.skocz_o_1_klatke_do_przodu' then
                    tlumaczenie_komunikaty_r.skocz_o_1_klatke_do_przodu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.skok_do_przodu' then
                    tlumaczenie_komunikaty_r.skok_do_przodu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.skok_do_tylu' then
                    tlumaczenie_komunikaty_r.skok_do_tylu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.skok_o_ilosc_sekund' then
                    tlumaczenie_komunikaty_r.skok_o_ilosc_sekund := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.stop' then
                    tlumaczenie_komunikaty_r.stop := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.test_napisu' then
                    tlumaczenie_komunikaty_r.test_napisu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.tlumaczenie__domyslne' then
                    tlumaczenie_komunikaty_r.tlumaczenie__domyslne := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.tlumaczenie__jeden_plik' then
                    tlumaczenie_komunikaty_r.tlumaczenie__jeden_plik := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.ukryj_panel_przyciskow' then
                    tlumaczenie_komunikaty_r.ukryj_panel_przyciskow := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.wczytaj_napisy' then
                    tlumaczenie_komunikaty_r.wczytaj_napisy := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.widocznosc_linii_spiewu' then
                    tlumaczenie_komunikaty_r.widocznosc_linii_spiewu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_dolnej' then
                    tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_dolnej := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_gornej' then
                    tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_gornej := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_srodkowej' then
                    tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_srodkowej := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.wielkosc_linii_spiewu' then
                    tlumaczenie_komunikaty_r.wielkosc_linii_spiewu := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.wycisz' then
                    tlumaczenie_komunikaty_r.wycisz := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.wyczysc_napisy' then
                    tlumaczenie_komunikaty_r.wyczysc_napisy := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.wznow' then
                    tlumaczenie_komunikaty_r.wznow := zts_1
                  else
                  if nazwa = 'tlumaczenie_komunikaty_r.zaokraglone__razem' then
                    tlumaczenie_komunikaty_r.zaokraglone__razem := zts_1;
                  //---// Wariant bez RTTI.

                  // Wariant z RTTI - nie działa.
                  //nazwa := Copy( zts_1, 1, zti_1 - 1 );
                  //Delete( zts_1, 1, zti_1 );
                  //
                  //nazwa := StringReplace( nazwa, tlumaczenie_komunikaty_r_c_l, '', [ rfReplaceAll ] );
                  //zts_1 := StringReplace( zts_1, tlumaczenie__nowa_linia_c_l, #13 + #10, [ rfReplaceAll ] );
                  //
                  //for rtti_property in rtti_type.GetProperties do
                  //  if rtti_property.Name = nazwa then
                  //    begin
                  //
                  //      if rtti_property.GetValue( @tlumaczenie_komunikaty_r ).Kind in [ TypInfo.tkUString, TypInfo.tkString, TypInfo.tkWString ] then
                  //        rtti_property.SetValue( @tlumaczenie_komunikaty_r, zts_1 );
                  //
                  //      Break;
                  //
                  //    end;
                  //  //---//if rtti_property.Name = nazwa then
                  //---// Wariant z RTTI - nie działa.
                  {$endregion 'Komunikaty.'}

                end;
              //---//if Pos( tlumaczenie_komunikaty_r_c_l, zts_1 ) <= 0 then

            end;
          //---//if zti_1 > 1 then

        end;
      //---//if Trim( zts_1 ) <> '' then

    end;
  //---//for i := 0 to tekst_l.Count - 1 do

  tekst_l.Free();

end;//---//Funkcja Tlumaczenia__Zastosuj().

//Funkcja Zaslona_Przerysuj().
procedure TKaraoke_Form.Zaslona_Przerysuj( const wymus_f : boolean = false );
begin

  // Czasami na marginesach wyświetlacza filmu zostają przerysowane fragmenty innych elementów okna.

  if    ( not wymus_f )
    and ( Nie_Odswiezaj_Widoku_CheckBox.Checked ) then
    Exit;


  PasLibVlcPlayer1.Repaint();

  Zaslona_Panel.Visible := not Zaslona_Panel.Visible;

end;//---//Funkcja Zaslona_Przerysuj().

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
  okno__przenies__na_wierzch__licznik_g := 0;
  tlumaczenie__jeden_plik__wybrane_g := false;
  zamykanie := false;
  zegar_systemowy_stop := Now();

  //Karaoke_Form.AllowDropFiles := true;

  PageControl1.ActivePage := Opcje_TabSheet;
  PasLibVlcPlayer1.Align := alClient;
  Zaslona_Panel.Align := alClient;

  Self.Position := poDesigned;

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


  PasLibVlcPlayer1.TabStop := true;
  PasLibVlcPlayer1.OnKeyDown := @Karaoke_KeyDown;

  Tlumaczenia__Domyslne();

  Karaoke_Click( Sender );

  Opcje_ButtonClick( Sender ); // Jeżeli jakiś element nie był widoczny to nie wywołują się jego zdarzenia.

  Informacja_StaticText.Visible := false;


  Tlumaczenia__Lista__Wczytaj(); // Wczytuje dostępne tłumaczenia aby w funkcji Ustawienia__Wczytaj_ButtonClick() ustawić się na odpowiednim.

  Ustawienia__Wczytaj_ButtonClick( Sender );


  Informacja_StaticText.Visible := false;


  karaoke_handle := 0;

  if Jedno_Uruchomienie_Programu_CheckBox.Checked then
    begin

      karaoke_handle := CreateSemaphore( nil, 0, 1, 'UNIKALNA_NAZWA' ); // uses Windows.

      if GetLastError = ERROR_ALREADY_EXISTS then
        begin

          Plik__Do_Uruchomienia__Dopisz();

          Halt();

        end;
      //---//if GetLastError = ERROR_ALREADY_EXISTS then

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then


  Zegar_Czestotliwosc_SpinEditChange( Sender ); // Jeżeli w pliku ini wartość będzie taka sama jak Zegar_Czestotliwosc_SpinEdit to się nie zmieni czas zegara.

  okno__gora := Karaoke_Form.Top;
  okno__lewo := Karaoke_Form.Left;
  okno__wysokosc := Karaoke_Form.Height;
  okno__szerokosc := Karaoke_Form.Width;

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


  watek_g := TWatek.Create( false );

  if not watek_g.Suspended then
    watek_g.Suspend();


  Linie_CheckBoxClick( Sender );
  PasLibVlcPlayer1Resize( Sender );
  Napisy__Wyswietlaj_Wedlug_RadioGroupClick( Sender );

  Informacja_StaticText.Visible := false;


  if FileExists(  ExtractFilePath( Application.ExeName ) + pomoc_o_programie__plik__nazwa_c  ) then
    Pomoc_Memo.Lines.LoadFromFile(  ExtractFilePath( Application.ExeName ) + pomoc_o_programie__plik__nazwa_c, TEncoding.UTF8  );

end;//---//FormShow().

//FormClose().
procedure TKaraoke_Form.FormClose( Sender: TObject; var CloseAction: TCloseAction );
begin

  zamykanie := true;

  Timer1.Enabled := false;
  Systemowy_Timer.Enabled := false;


  watek_g.Terminate();

  if watek_g.Suspended then
    watek_g.Resume();

  //if not watek_g.Suspended then
  //  watek_g.Suspend();


  Tryb_Testowy_Napisow_CheckBox.Checked := false;

  //PasLibVlcPlayer1.Pause(); // Zatrzymanie filmu blokuje odczyt wartości głośności.

  //Zapisz_Ustawienia_ButtonClick( Sender ); // Zatrzymanie filmu blokuje odczyt wartości głośności.


  Tlumaczenia__Lista__Zwolnij();


  if karaoke_handle <> 0 then
    CloseHandle( karaoke_handle );


  if PasLibVlcPlayer1.IsPlay() then
    PasLibVlcPlayer1.Stop();


  Napisy__Zwolnij();

  //watek_g.Suspend();
  //watek_g.Terminate();

  //FreeAndNil( watek_g ); // Nie bo się nie zamknie.

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
  //  Test_Memo.Lines.Add( FileNames[ i ] );

  for i := Low( FileNames ) to High( FileNames ) do
    begin

      //Test_Memo.Lines.Add( FileNames[ i ] );
      //Test_Memo.Lines.Add(  ExtractFileExt( FileNames[ i ] )  );
      //Test_Memo.Lines.Add(   AnsiLowerCase(   ExtractFileExt( FileNames[ i ] )  )   );

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
          Plik__Otworz( FileNames[ i ] );

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


  if Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex in [ 0, 2 ] then // zegara, czasu narastająco.
    begin

      Timer1.Enabled := false;

      //milisekundy_filmu := milisekundy_filmu + Timer1.Interval;
      //milisekundy_filmu := PasLibVlcPlayer1.GetVideoPosInMs();

      Napisy__Przelicz();

      if    ( Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex in [ 2 ] ) // czasu narastająco.
        and ( Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked )
        and (  Abs( milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() ) > 1000  ) then
        Synchronizuj_Milisekundy_Filmu();

      if    ( Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex in [ 2 ] ) // czasu narastająco.
        and ( Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox.Checked ) then
        Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox.Caption := FormatFloat( '### ### ### ### ##0', ( milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() ) / 100 );


      if Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked then
        if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() > Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value then
          Korekta_Czasu__Narastajaco_SpinEdit.Value := -1
        else//if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() > Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value then
          if milisekundy_filmu - PasLibVlcPlayer1.GetVideoPosInMs() < -Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value then
            Korekta_Czasu__Narastajaco_SpinEdit.Value := 1;

      Timer1.Enabled := true;

    end;
  //---//if Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex  in [ 0, 2 ] then


  if Zaslona_Panel.Visible then
    Zaslona_Panel.Visible := false;


  if    ( Karaoke_Form.WindowState = wsMaximized )
    and (  DateUtils.SecondsBetween( Now(), kursor_ruch_data_czas ) > 3  ) then
    Screen.Cursor := crNone;


  if    ( Informacja_StaticText.Visible )
    and (  DateUtils.SecondsBetween( Now(), informacja_czas ) >= 2  ) then
    begin

      Informacja_StaticText.Visible := false;
      Zaslona_Przerysuj();

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
  ztb : boolean;

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

      zts := ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c;

      if FileExistsUTF8( zts ) then // Sprawdza czy istnieje plik.
        begin

          // Istnieje.

          tekst_l := TStringList.Create();

          try
            tekst_l.LoadFromFile( zts );
          except
            on E : Exception do
              begin

                tekst_l.Free();

                //Application.MessageBox(  PChar(tlumaczenie_komunikaty_r.nie_udalo_sie_otworzyc_pliku_napisow_ + #13 + E.Message + ' ' + IntToStr( E.HelpContext )), PChar(tlumaczenie_komunikaty_r.blad), MB_OK + MB_ICONEXCLAMATION  );
                Exit;

              end;
            //---//on E: Exception do
          end;
          //---//try


          if tekst_l.Count >= 2 then
            zts := tekst_l[ 1 ]; // Druga linijka.

          tekst_l.Free();

          DeleteFile(   PChar(  ExtractFilePath( Application.ExeName ) + plik__skojarzenie_nazwa_c  )   );

          ztb := Plik__Multimedialny_Pasujacy_Do_Napisow__Otworz( zts );


          //Okno__Przenies__Na_Wierzch(); // Próbuje przesunąć okno na wierzch.

          // Jeżeli otwiera kolejny plik wideo poprzez skojarzenie programu exe z rozszerzeniem pliku to słychać dźwięk ale nie widać obrazu.
          // Najprawdopodobniej jest to spowodowane próbą przesunięcia okna na wierzch.
          // Więc albo okno jest na wierzchu ale nie widać obrazu albo widać obraz ale trzeba ręcznie przejść do okna odtwarzacza.
          if ztb then
            begin

              Plik__Otworz( Muzyka_EditButton.Text );

              okno__przenies__na_wierzch__licznik_g := 3;

            end;

        end;
      //---//if FileExistsUTF8( zts ) then

    end;
  //---//if Jedno_Uruchomienie_Programu_CheckBox.Checked then

  Systemowy_Timer.Enabled := true;


  if okno__przenies__na_wierzch__licznik_g > 0 then
    Okno__Przenies__Na_Wierzch();

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


  if Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 1 then // filmu.
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

  Linia_Spiewu__Srodek_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu__Srodek_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu__Srodek_StaticText.Top := PasLibVlcPlayer1.Top + Round( PasLibVlcPlayer1.Height / 2 ) - Pozycja_Obszaru_Spiewu_Okresl();
  Linia_Spiewu__Srodek_StaticText.Height := Linie_Spiewu__Wielkosc_SpinEdit.Value;

  Linia_Spiewu__Gora_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu__Gora_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu__Gora_StaticText.Top := Linia_Spiewu__Srodek_StaticText.Top - Linie_Spiewu__Odstep_Okresl();
  Linia_Spiewu__Gora_StaticText.Height := Linia_Spiewu__Srodek_StaticText.Height;

  Linia_Spiewu__Dol_StaticText.Left := PasLibVlcPlayer1.Left;
  Linia_Spiewu__Dol_StaticText.Width := PasLibVlcPlayer1.Width;
  Linia_Spiewu__Dol_StaticText.Top := Linia_Spiewu__Srodek_StaticText.Top + Linie_Spiewu__Odstep_Okresl();
  Linia_Spiewu__Dol_StaticText.Height := Linia_Spiewu__Srodek_StaticText.Height;


  Informacja_StaticText.Top := PasLibVlcPlayer1.Top;
  Informacja_StaticText.Left := PasLibVlcPlayer1.Left + 5;

  Zaslona_Przerysuj();

end;//---//PasLibVlcPlayer1Resize().

//Otworz_Plik_ButtonClick().
procedure TKaraoke_Form.Otworz_Plik_ButtonClick( Sender: TObject );
begin

  Plik__Otworz( Muzyka_EditButton.Text );

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.otworz_plik, null );

end;//---//Otworz_Plik_ButtonClick().

//Wczytaj_Napisy_ButtonClick().
procedure TKaraoke_Form.Wczytaj_Napisy_ButtonClick( Sender: TObject );
begin

  Napisy__Wczytaj( Napisy_EditButton.Text );

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wczytaj_napisy, null );

end;//---//Wczytaj_Napisy_ButtonClick().

//Wyczysc_Napisy_ButtonClick().
procedure TKaraoke_Form.Wyczysc_Napisy_ButtonClick( Sender: TObject );
begin

  Napisy__Zwolnij();

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wyczysc_napisy, null );

end;//---//Wyczysc_Napisy_ButtonClick().

//Muzyka_EditButtonButtonClick().
procedure TKaraoke_Form.Muzyka_EditButtonButtonClick( Sender: TObject );
begin

  OpenDialog1.Filter := 'Multimedia|*.wave; *.mp3; *.mpga; *.ogg *.avi; *.mp4; *.mpg; *.mpeg; *.wmv; *.mov; *.mid|Wszystkie|*.*';

  if OpenDialog1.Execute() then
    Plik__Otworz( OpenDialog1.FileName );

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

  if PasLibVlcPlayer1.IsPause() then
    begin

      PasLibVlcPlayer1.Resume();

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wznow, null );

      Synchronizuj_Milisekundy_Filmu();

    end
  else//if PasLibVlcPlayer1.IsPause() then
    if    ( not PasLibVlcPlayer1.IsPlay() )
      and ( not PasLibVlcPlayer1.IsPause() ) then
      Otworz_Plik_ButtonClick( Sender );

end;//---//Wznow_ButtonClick().

//Pauza_ButtonClick().
procedure TKaraoke_Form.Pauza_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.Pause();

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pauza, null );

end;//---//Pauza_ButtonClick().

//Stop_ButtonClick().
procedure TKaraoke_Form.Stop_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.Stop();

  PasLibVlcPlayer1MediaPlayerTimeChanged( Sender, 0 );

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.stop, null );

end;//---//Stop_ButtonClick().

//Skok_Do__Przodu_ButtonClick().
procedure TKaraoke_Form.Skok_Do__Przodu_ButtonClick( Sender: TObject );
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


  Informacja_Tekst_Wyswietl(  tlumaczenie_komunikaty_r.skok_do_przodu, Round( Skok_Sekundy_SpinEdit.Value * mnoznik_skoku )  );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Skok_Do__Przodu_ButtonClick().

//Skok_Do__Tylu_ButtonClick().
procedure TKaraoke_Form.Skok_Do__Tylu_ButtonClick( Sender: TObject );
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


  Informacja_Tekst_Wyswietl(  tlumaczenie_komunikaty_r.skok_do_tylu, Round( Skok_Sekundy_SpinEdit.Value * mnoznik_skoku )  );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Skok_Do__Tylu_ButtonClick().

//Nastepna_Klatka_ButtonClick().
procedure TKaraoke_Form.Nastepna_Klatka_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.NextFrame();

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.skocz_o_1_klatke_do_przodu, null );

  Synchronizuj_Milisekundy_Filmu();

end;//---//Nastepna_Klatka_ButtonClick().

//Wycisz_ButtonClick().
procedure TKaraoke_Form.Wycisz_ButtonClick( Sender: TObject );
begin

  PasLibVlcPlayer1.SetAudioMute( not PasLibVlcPlayer1.GetAudioMute() );

  if PasLibVlcPlayer1.GetAudioMute() then
    begin

      Wycisz_Button.Font.Style := Wycisz_Button.Font.Style + [ fsUnderline ];

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wycisz, null );

    end
  else//if PasLibVlcPlayer1.GetAudioMute() then
    begin

      Wycisz_Button.Font.Style := Wycisz_Button.Font.Style - [ fsUnderline ];

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.anuluj_wyciszenie, null );

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

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.ciszej, zti );

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

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.glosniej, zti );

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
  czy_odtwarzanie_l : boolean;
  glosnosc_poziom_kopia : integer; // Czasami poziom głośności sam się zmienia.
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


  glosnosc_poziom_kopia := PasLibVlcPlayer1.GetAudioVolume();


  czy_odtwarzanie_l := PasLibVlcPlayer1.IsPlay();

  if czy_odtwarzanie_l then
    Pauza_ButtonClick( Sender );


  pozycja_procent := PasLibVlcPlayer1.GetVideoPosInPercent();


  if Sender = nil then
    goto normalny_ekran_l;


  if Self.BorderStyle <> bsNone then
    begin

      okno__gora := Self.Top;
      okno__lewo := Self.Left;
      okno__wysokosc := Self.Height;
      okno__szerokosc := Self.Width;

      Self.WindowState := wsMaximized;
      Self.BorderStyle := bsNone;
      Przyciski_Panel.Visible := false;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pelny_ekran, null );

    end
  else//if Self.BorderStyle <> bsNone then
    begin

      normalny_ekran_l:

      Przyciski_Panel.Visible := true;
      Self.WindowState := wsNormal;
      Self.BorderStyle := bsSizeable;

      Self.Top := okno__gora;
      Self.Left := okno__lewo;
      Self.Height := okno__wysokosc;
      Self.Width := okno__szerokosc;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.normalny_ekran, null );

    end;
  //---//if Self.BorderStyle <> bsNone then


  zts := AnsiLowerCase(  ExtractFileExt( Muzyka_EditButton.Text )  );

  // Jeżeli plik jest bez obrazu to nie przeładowuje.
  if    ( zts <> 'wave' )
    and ( zts <> 'mp3' )
    and ( zts <> 'ogg' )
    and ( zts <> 'mid' ) then
    begin

      if not PasLibVlcPlayer1.IsPlay() then
        Wznow_ButtonClick( Sender ); // Jeżeli film jest spauzowany to po przełączeniu trybu ekranu wyświetla tylko czarne tło.


      Otworz_Plik_ButtonClick( Sender ); // Bez przeładowania pliku wyświetla tylko czarne tło. Otworzenie pliku od razu 'wyłącza pauzę'.


      if not czy_odtwarzanie_l then
        Pauza_ButtonClick( Sender );

    end;
  //---//if    ( zts <> 'wave' ) (...)


  if glosnosc_poziom_kopia < glosnosc__poziom__minimalny_c then
    glosnosc_poziom_kopia := glosnosc__poziom__minimalny_c
  else
  if glosnosc_poziom_kopia > glosnosc__poziom__maksymalny_c then
    glosnosc_poziom_kopia := glosnosc__poziom__maksymalny_c;

  if PasLibVlcPlayer1.GetAudioVolume() <> glosnosc_poziom_kopia then
    PasLibVlcPlayer1.SetAudioVolume( glosnosc_poziom_kopia );


  PasLibVlcPlayer1.SetVideoPosInPercent( pozycja_procent );


  Zaslona_Przerysuj();

end;//---//Pelny_Ekran_ButtonClick().

//Ukryj_Przyciski_Panel_ButtonClick().
procedure TKaraoke_Form.Ukryj_Przyciski_Panel_ButtonClick( Sender: TObject );
begin

  Przyciski_Panel.Visible := not Przyciski_Panel.Visible;

  Zaslona_Przerysuj();

  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.ukryj_panel_przyciskow, null );

end;//---//Ukryj_Przyciski_Panel_ButtonClick().

//Opcje_ButtonClick().
procedure TKaraoke_Form.Opcje_ButtonClick( Sender: TObject );
begin

  PageControl1.Visible := not PageControl1.Visible;

  Opcje_Splitter.Visible := PageControl1.Visible;

  if    ( PageControl1.Visible )
    and ( PageControl1.Width <= 1 ) then
    PageControl1.Width := 250;

 Zaslona_Przerysuj();

 Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.opcje, null );

end;//---//Opcje_ButtonClick().

//Linie_CheckBoxClick().
procedure TKaraoke_Form.Linie_CheckBoxClick( Sender: TObject );
begin

  Linia_Spiewu__Dol_StaticText.Visible := Linia_Spiewu__Dol_CheckBox.Checked;
  Linia_Spiewu__Gora_StaticText.Visible := Linia_Spiewu__Gora_CheckBox.Checked;
  Linia_Spiewu__Srodek_StaticText.Visible := Linia_Spiewu__Srodek_CheckBox.Checked;


  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.widocznosc_linii_spiewu, null );

end;//---//Linie_CheckBoxClick().

//Zegar_Czestotliwosc_SpinEditChange().
procedure TKaraoke_Form.Zegar_Czestotliwosc_SpinEditChange( Sender: TObject );
begin

  Timer1.Interval := Zegar_Czestotliwosc_SpinEdit.Value;

end;//---//Zegar_Czestotliwosc_SpinEditChange().

//Napisy__Wyswietlaj_Wedlug_RadioGroupClick().
procedure TKaraoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroupClick( Sender: TObject );
begin

  if watek_g <> nil then
    if Karaoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
      begin

        if watek_g.Suspended then
          watek_g.Resume();

        Synchronizuj_Milisekundy_Filmu(); // Tutaj nie działa może przez sekcję krytyczną.

      end
    else//if Karaoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.
      begin

        if not watek_g.Suspended then
          watek_g.Suspend();

      end
    //---//if Karaoke_Form.Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex = 2 then // czasu narastająco.

end;//---//Napisy__Wyswietlaj_Wedlug_RadioGroupClick().

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
          //napisy_t[ i ].Napisy__Czcionka_Ustaw_N();
          Napisy__Czcionka_Ustaw( napisy_t[ i ] );

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

//Linia_Spiewu__KolorButtonClick().
procedure TKaraoke_Form.Linia_Spiewu__KolorButtonClick( Sender: TObject );
begin

  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Linia_Spiewu__Gora__Kolor_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu__Gora_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu__Gora_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Linia_Spiewu__Srodek__Kolor_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu__Srodek_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu__Srodek_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)


  if    ( Sender <> nil )
    and ( TComponent(Sender).Name = Linia_Spiewu__Dol__Kolor_Button.Name ) then
    begin

      ColorDialog1.Color := Linia_Spiewu__Dol_StaticText.Color;

      if ColorDialog1.Execute() then
        Linia_Spiewu__Dol_StaticText.Color := ColorDialog1.Color;

    end;
  //---//if    ( Sender <> nil ) (...)

end;//---//Linia_Spiewu__KolorButtonClick().

//Ustawienia__Domyslne_ButtonClick().
procedure TKaraoke_Form.Ustawienia__Domyslne_ButtonClick( Sender: TObject );
var
  i : integer;
begin

  Screen.Cursor := crHourGlass;

  Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked := false;
  Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked := true;
  Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked := true;
  Jedno_Uruchomienie_Programu_CheckBox.Checked := true;
  Korekta_Czasu__Narastajaco_SpinEdit.Value := 1;
  Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked := true;
  Korekta_Czasu__Narastajaco__Prezentuj_Roznice_CheckBox.Checked := false;
  Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value := 100;
  Linia_Spiewu__Dol_CheckBox.Checked := true;
  Linia_Spiewu__Dol_StaticText.Color := clSkyBlue;
  Linia_Spiewu__Gora_CheckBox.Checked := true;
  Linia_Spiewu__Gora_StaticText.Color := clSkyBlue;
  Linia_Spiewu__Srodek_CheckBox.Checked := false;
  Linia_Spiewu__Srodek_StaticText.Color := clMoneyGreen;
  Linie_Spiewu__Odstep_SpinEdit.Value := 6;
  Linie_Spiewu__Wielkosc_SpinEdit.Value := 10;
  Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := 0; // górnej krawędzi.
  Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex := 2; // czasu narastająco.
  Nie_Odswiezaj_Widoku_CheckBox.Checked := false;
  Pozycja_Obszaru_Spiewu_SpinEdit.Value := 5;
  Przesuniecie_Napisow_SpinEdit.Value := 3;
  Skok_Sekundy_SpinEdit.Value := 3;
  Tryb_Testowy_Napisow_CheckBox.Checked := false;

  Wymiar_Label.Visible := true;

  Wymiar_Label.Color := $00804000; // clBlack
  Wymiar_Label.Font.Color := clWhite;
  Wymiar_Label.Font.Name := 'Georgia';
  Wymiar_Label.Font.Size := 44;
  Wymiar_Label.Font.Style := [];

  for i := 0 to Length( napisy_t ) - 1 do // Gdy pusta = 0; z jednym elementem = 1.
    if napisy_t[ i ] <> nil then
      begin

        //napisy_t[ i ].Napisy__Czcionka_Ustaw_N();
        Napisy__Czcionka_Ustaw( napisy_t[ i ] );
        //napisy_t[ i ].Color := Wymiar_Label.Color;

      end;
    //---//if napisy_t[ i ] <> nil then

  Wymiar_Label.Visible := false;

  Zegar_Czestotliwosc_SpinEdit.Value := 25;


  Screen.Cursor := crDefault;

end;//---//Ustawienia__Domyslne_ButtonClick().

//Ustawienia__Wczytaj_ButtonClick().
procedure TKaraoke_Form.Ustawienia__Wczytaj_ButtonClick( Sender: TObject );
var
  i : integer;
  zts : string;
  plik_ini : IniFiles.TIniFile;
  tekst_l : TStringList;
begin

  zts := ExtractFilePath( Application.ExeName ) + plik__ini_nazwa_c ;


  if not FileExists( zts ) then
    Ustawienia__Domyslne_ButtonClick( Sender );


  plik_ini := IniFiles.TIniFile.Create( zts ); // Application potrzebuje w uses Forms.



  if not Plik_ini.ValueExists( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj' ) then
    Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked )
  else
    Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj' ) then
    Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked )
  else
    Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Glosnosc' ) then
    begin

      i := PasLibVlcPlayer1.GetAudioVolume();

      if i < 1 then
        i := 40;

      Plik_ini.WriteInteger( 'Opcje', 'Glosnosc', i );

    end
  else
    i := Plik_ini.ReadInteger( 'Opcje', 'Glosnosc', PasLibVlcPlayer1.GetAudioVolume() ); // Jeżeli nie znajdzie to podstawia wartość PasLibVlcPlayer1.GetAudioVolume().

  if    ( i >= glosnosc__poziom__minimalny_c )
    and ( i <= glosnosc__poziom__maksymalny_c ) then
    begin

      //PasLibVlcPlayer1.SetAudioVolume( i ); // Jeżeli nie jest wczytany plik to nic się nie zmieni.
      Glosnosc_Label.Caption := Trim(  FormatFloat( '### ### ### ### ##0', i )  );
      Glosnosc_ProgressBar.Position := i;

      PasLibVlcPlayer1.SetAudioVolume( i );

    end;
  //---//if    ( i >= 1 ) (...)


  if not Plik_ini.ValueExists( 'Opcje', 'Informacje_O_Zdarzeniu_Wyswietlaj' ) then
    Plik_ini.WriteBool( 'Opcje', 'Informacje_O_Zdarzeniu_Wyswietlaj', Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked )
  else
    Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Informacje_O_Zdarzeniu_Wyswietlaj', Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Jedno_Uruchomienie_Programu' ) then
    Plik_ini.WriteBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked )
  else
    Jedno_Uruchomienie_Programu_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Jedno_Uruchomienie_Programu_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu__Narastajaco' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu__Narastajaco', Korekta_Czasu__Narastajaco_SpinEdit.Value )
  else
    Korekta_Czasu__Narastajaco_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Korekta_Czasu__Narastajaco', Korekta_Czasu__Narastajaco_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu__Narastajaco_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu__Narastajaco__Automatyczna' ) then
    Plik_ini.WriteBool( 'Opcje', 'Korekta_Czasu__Narastajaco__Automatyczna', Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked )
  else
    Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Korekta_Czasu__Narastajaco__Automatyczna', Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Korekta_Czasu__Narastajaco__Prog' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu__Narastajaco__Prog', Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value )
  else
    Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Korekta_Czasu__Narastajaco__Prog', Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Dol' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Dol', Linia_Spiewu__Dol_CheckBox.Checked )
  else
    Linia_Spiewu__Dol_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu__Dol', Linia_Spiewu__Dol_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Dol_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Dol__Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Dol__Kolor', Linia_Spiewu__Dol_StaticText.Color )
  else
    Linia_Spiewu__Dol_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu__Dol__Kolor', Linia_Spiewu__Dol_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Gora_StaticText.Color.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Gora' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Gora', Linia_Spiewu__Gora_CheckBox.Checked )
  else
    Linia_Spiewu__Gora_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu__Gora', Linia_Spiewu__Gora_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Gora_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Gora__Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Gora__Kolor', Linia_Spiewu__Gora_StaticText.Color )
  else
    Linia_Spiewu__Gora_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu__Gora__Kolor', Linia_Spiewu__Gora_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Gora_StaticText.Color.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Srodek' ) then
    Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Srodek', Linia_Spiewu__Srodek_CheckBox.Checked )
  else
    Linia_Spiewu__Srodek_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Linia_Spiewu__Srodek', Linia_Spiewu__Srodek_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Srodek_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Linia_Spiewu__Srodek__Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Srodek__Kolor', Linia_Spiewu__Srodek_StaticText.Color )
  else
    Linia_Spiewu__Srodek_StaticText.Color := Plik_ini.ReadInteger( 'Opcje', 'Linia_Spiewu__Srodek__Kolor', Linia_Spiewu__Srodek_StaticText.Color ); // Jeżeli nie znajdzie to podstawia wartość Linia_Spiewu__Srodek_StaticText.Color.


  if not Plik_ini.ValueExists( 'Opcje', 'Linie_Spiewu__Odstep' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu__Odstep', Linie_Spiewu__Odstep_SpinEdit.Value )
  else
    Linie_Spiewu__Odstep_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Linie_Spiewu__Odstep', Linie_Spiewu__Odstep_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Linie_Spiewu__Odstep_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Linie_Spiewu__Wielkosc' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu__Wielkosc', Linie_Spiewu__Wielkosc_SpinEdit.Value )
  else
    Linie_Spiewu__Wielkosc_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Linie_Spiewu__Wielkosc', Linie_Spiewu__Wielkosc_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Linie_Spiewu__Wielkosc_SpinEdit.Value.


  Wymiar_Label.Visible := true;

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Kolor' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy__Kolor', Wymiar_Label.Font.Color )
  else
    Wymiar_Label.Font.Color := Plik_ini.ReadInteger( 'Opcje', 'Napisy__Kolor', Wymiar_Label.Font.Color ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Color.


  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Kolor__Tlo' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy__Kolor__Tlo', Wymiar_Label.Color )
  else
    Wymiar_Label.Color := Plik_ini.ReadInteger( 'Opcje', 'Napisy__Kolor__Tlo', Wymiar_Label.Color ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Color.

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Nazwa' ) then
    Plik_ini.WriteString( 'Opcje', 'Napisy__Nazwa', Wymiar_Label.Font.Name )
  else
    Wymiar_Label.Font.Name := Plik_ini.ReadString( 'Opcje', 'Napisy__Nazwa', Wymiar_Label.Font.Name ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Name.


  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Rozmiar' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy__Rozmiar', Wymiar_Label.Font.Size )
  else
    Wymiar_Label.Font.Size := Plik_ini.ReadInteger( 'Opcje', 'Napisy__Rozmiar', Wymiar_Label.Font.Size ); // Jeżeli nie znajdzie to podstawia wartość Wymiar_Label.Font.Size.


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

  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Styl' ) then
    Plik_ini.WriteString( 'Opcje', 'Napisy__Styl', zts )
  else
    zts := Plik_ini.ReadString( 'Opcje', 'Napisy__Styl', zts ); // Jeżeli nie znajdzie to podstawia wartość zts.

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

        //napisy_t[ i ].Napisy__Czcionka_Ustaw_N();
        Napisy__Czcionka_Ustaw( napisy_t[ i ] );
        //napisy_t[ i ].Color := Wymiar_Label.Color;

      end;
    //---//if napisy_t[ i ] <> nil then


  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Ukrywaj_Wedlug' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy__Ukrywaj_Wedlug', Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex )
  else
    Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex := Plik_ini.ReadInteger( 'Opcje', 'Napisy__Ukrywaj_Wedlug', Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex ); // Jeżeli nie znajdzie to podstawia wartość Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex.


  if not Plik_ini.ValueExists( 'Opcje', 'Napisy__Wyswietlaj_Wedlug' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Napisy__Wyswietlaj_Wedlug', Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex )
  else
    Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex := Plik_ini.ReadInteger( 'Opcje', 'Napisy__Wyswietlaj_Wedlug', Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex ); // Jeżeli nie znajdzie to podstawia wartość Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex.


  if not Plik_ini.ValueExists( 'Opcje', 'Nie_Odswiezaj_Widoku' ) then
    Plik_ini.WriteBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked )
  else
    Nie_Odswiezaj_Widoku_CheckBox.Checked := Plik_ini.ReadBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked ); // Jeżeli nie znajdzie to podstawia wartość Nie_Odswiezaj_Widoku_CheckBox.Checked.


  if not Plik_ini.ValueExists( 'Opcje', 'Pozycja_Obszaru_Spiewu' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value )
  else
    Pozycja_Obszaru_Spiewu_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Pozycja_Obszaru_Spiewu_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Skok_Sekundy' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value )
  else
    Skok_Sekundy_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Skok_Sekundy_SpinEdit.Value.


  if not Plik_ini.ValueExists( 'Opcje', 'Tlumaczenie__Jeden_Plik__Wybrane' ) then
    Plik_ini.WriteBool( 'Opcje', 'Tlumaczenie__Jeden_Plik__Wybrane', tlumaczenie__jeden_plik__wybrane_g )
  else
    tlumaczenie__jeden_plik__wybrane_g := Plik_ini.ReadBool( 'Opcje', 'Tlumaczenie__Jeden_Plik__Wybrane', tlumaczenie__jeden_plik__wybrane_g ); // Jeżeli nie znajdzie to podstawia wartość tlumaczenie__jeden_plik__wybrane_g.


  if not Plik_ini.ValueExists( 'Opcje', 'Zegar_Czestotliwosc' ) then
    Plik_ini.WriteInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value )
  else
    Zegar_Czestotliwosc_SpinEdit.Value := Plik_ini.ReadInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value ); // Jeżeli nie znajdzie to podstawia wartość Zegar_Czestotliwosc_SpinEdit.Value.



  plik_ini.Free();



  if    ( tlumaczenie__jeden_plik__wybrane_g )
    and (   FileExists(  ExtractFilePath( Application.ExeName ) + tlumaczenia__jeden_plik__plik__nazwa_c  )   ) then
    begin

      for i := 0 to Tlumaczenia_ComboBox.Items.Count - 1 do
        if TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ i ]).nazwa_kodowa = tlumaczenie__ustawienie__jeden_plik_c then
          begin

            Tlumaczenia_ComboBox.ItemIndex := i;

            Break;

          end;
        //---//if TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ i ]).nazwa_kodowa = tlumaczenie__ustawienie__jeden_plik_c then

    end
  else//if    ( tlumaczenie__jeden_plik__wybrane_g ) (...)
    begin

      zts := ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c ;

      if DirectoryExists( zts ) then
        begin

          zts := zts + DirectorySeparator + tlumaczenia__plik_ustawien__nazwa_c;

          if FileExists( zts ) then
            begin

              tekst_l := TStringList.Create();
              tekst_l.LoadFromFile( zts, TEncoding.UTF8 );
              zts := tekst_l.Text;
              zts := StringReplace( zts, #$D#$A, '', [ rfReplaceAll ] );
              tekst_l.Free();

              for i := 0 to Tlumaczenia_ComboBox.Items.Count - 1 do
                if TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ i ]).nazwa_kodowa = zts then
                  begin

                    Tlumaczenia_ComboBox.ItemIndex := i;

                    Break;

                  end;
                //---//if TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ i ]).nazwa_kodowa = zts then

            end;
          //---//if FileExists( zts ) then

        end;
      //---//if DirectoryExists( zts ) then

    end;
  //---//if    ( tlumaczenie__jeden_plik__wybrane_g ) (...)


  Tlumaczenia__Zastosuj();


  Tlumaczenia__Lista__Wczytaj(); // Aby odświeżyć tłumaczenie słów kluczowych (np. 'domyślne').

end;//---//Ustawienia__Wczytaj_ButtonClick().

//Ustawienia__Zapisz_ButtonClick().
procedure TKaraoke_Form.Ustawienia__Zapisz_ButtonClick( Sender: TObject );
var
  zts : string;
  plik_ini : IniFiles.TIniFile;
  tekst_l : TStringList;
begin

  plik_ini := IniFiles.TIniFile.Create(  ExtractFilePath( Application.ExeName ) + plik__ini_nazwa_c  ); // Application potrzebuje w uses Forms.


  Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Ukrywaj', Dolny_Pasek_Postepu__Ukrywaj_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Dolny_Pasek_Postepu__Wyswietlaj', Dolny_Pasek_Postepu__Wyswietlaj_CheckBox.Checked );

  if PasLibVlcPlayer1.GetAudioVolume() >= 1 then // Jeżeli nie jest wczytany plik to ma wartość -1.
    Plik_ini.WriteInteger( 'Opcje', 'Glosnosc', PasLibVlcPlayer1.GetAudioVolume() );

  Plik_ini.WriteBool( 'Opcje', 'Informacje_O_Zdarzeniu_Wyswietlaj', Informacje_O_Zdarzeniu_Wyswietlaj_CheckBox.Checked );
  Plik_ini.WriteBool( 'Opcje', 'Jedno_Uruchomienie_Programu', Jedno_Uruchomienie_Programu_CheckBox.Checked );

  Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu__Narastajaco', Korekta_Czasu__Narastajaco_SpinEdit.Value );
  Plik_ini.WriteBool( 'Opcje', 'Korekta_Czasu__Narastajaco__Automatyczna', Korekta_Czasu__Narastajaco__Automatyczna_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Korekta_Czasu__Narastajaco__Prog', Korekta_Czasu__Narastajaco__Prog_SpinEdit.Value );

  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Dol', Linia_Spiewu__Dol_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Dol__Kolor', Linia_Spiewu__Dol_StaticText.Color );

  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Gora', Linia_Spiewu__Gora_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Gora__Kolor', Linia_Spiewu__Gora_StaticText.Color );

  Plik_ini.WriteBool( 'Opcje', 'Linia_Spiewu__Srodek', Linia_Spiewu__Srodek_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Linia_Spiewu__Srodek__Kolor', Linia_Spiewu__Srodek_StaticText.Color );

  Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu__Odstep', Linie_Spiewu__Odstep_SpinEdit.Value );
  Plik_ini.WriteInteger( 'Opcje', 'Linie_Spiewu__Wielkosc', Linie_Spiewu__Wielkosc_SpinEdit.Value );

  Plik_ini.WriteInteger( 'Opcje', 'Napisy__Kolor', Wymiar_Label.Font.Color );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy__Kolor__Tlo', Wymiar_Label.Color );
  Plik_ini.WriteString( 'Opcje', 'Napisy__Nazwa', Wymiar_Label.Font.Name );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy__Rozmiar', Wymiar_Label.Font.Size );

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

  Plik_ini.WriteString( 'Opcje', 'Napisy__Styl', zts );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy__Ukrywaj_Wedlug', Napisy__Ukrywaj_Wedlug_RadioGroup.ItemIndex );
  Plik_ini.WriteInteger( 'Opcje', 'Napisy__Wyswietlaj_Wedlug', Napisy__Wyswietlaj_Wedlug_RadioGroup.ItemIndex );

  Plik_ini.WriteBool( 'Opcje', 'Nie_Odswiezaj_Widoku', Nie_Odswiezaj_Widoku_CheckBox.Checked );
  Plik_ini.WriteInteger( 'Opcje', 'Pozycja_Obszaru_Spiewu', Pozycja_Obszaru_Spiewu_SpinEdit.Value );
  Plik_ini.WriteInteger( 'Opcje', 'Skok_Sekundy', Skok_Sekundy_SpinEdit.Value );

  if    ( Tlumaczenia_ComboBox.Items.Count > 0 )
    and ( TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ Tlumaczenia_ComboBox.ItemIndex ]).nazwa_kodowa = tlumaczenie__ustawienie__jeden_plik_c ) then
    tlumaczenie__jeden_plik__wybrane_g := true
  else//if    ( Tlumaczenia_ComboBox.Items.Count > 0 ) (...)
    tlumaczenie__jeden_plik__wybrane_g := false;

  Plik_ini.WriteBool( 'Opcje', 'Tlumaczenie__Jeden_Plik__Wybrane', tlumaczenie__jeden_plik__wybrane_g );
  Plik_ini.WriteInteger( 'Opcje', 'Zegar_Czestotliwosc', Zegar_Czestotliwosc_SpinEdit.Value );


  plik_ini.Free();



  zts := ExtractFilePath( Application.ExeName ) + tlumaczenia__katalog__nazwa_c ;

  if DirectoryExists( zts ) then
    begin

      zts := zts + DirectorySeparator + tlumaczenia__plik_ustawien__nazwa_c;

      tekst_l := TStringList.Create();
      tekst_l.Add( TTlumaczenie_Lista_Obiekt(Tlumaczenia_ComboBox.Items.Objects[ Tlumaczenia_ComboBox.ItemIndex ]).nazwa_kodowa );
      tekst_l.SaveToFile( zts, TEncoding.UTF8 );

      tekst_l.Free();

    end;
  //---//if DirectoryExists( zts ) then

end;//---//Ustawienia__Zapisz_ButtonClick().

//Tlumaczenia_ComboBoxKeyDown().
procedure TKaraoke_Form.Tlumaczenia_ComboBoxKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  // Enter.
  if Key = VK_RETURN then
    begin

      Tlumaczenia__Zastosuj();

      Tlumaczenia__Lista__Wczytaj(); // Aby odświeżyć tłumaczenie słów kluczowych (np. 'domyślne').

    end
  else//if Key = VK_RETURN then
  // R.
  if    ( Key = VK_R )
    and ( Shift = [ ssCtrl ] ) then
    Tlumaczenia__Lista__Wczytaj();

end;//---//Tlumaczenia_ComboBoxKeyDown().

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

          Test_Memo.Lines.Add( 'nil' );
          Exit;

        end;
      //---//if napisy_t[ Test_Napisu_SpinEdit.Value ] = nil then

      Test_Memo.Lines.Add(  tlumaczenie_komunikaty_r.napis_tekst + ': ' + napisy_t[ Test_Napisu_SpinEdit.Value ].Text );
      Test_Memo.Lines.Add(    tlumaczenie_komunikaty_r.gora___wysokosc_odtwarzacza + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.Top )  ) + ' / ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.Height )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.linie_spiewu__g__s__d_ + ': ' + Trim(  FormatFloat( '### ### ### ##0', Linia_Spiewu__Gora_StaticText.Top )  ) + ', ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu__Srodek_StaticText.Top )  ) + ', ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu__Dol_StaticText.Top )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.napis_od___do + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', napisy_t[ Test_Napisu_SpinEdit.Value ].czas_od )  ) + ' - ' + Trim(  FormatFloat( '### ### ### ### ##0', napisy_t[ Test_Napisu_SpinEdit.Value ].czas_do )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.pozycja_filmu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', PasLibVlcPlayer1.GetVideoPosInMs() )  )   );

      zti := Napis__Pozycja_Ustal( napisy_t[ Test_Napisu_SpinEdit.Value ], PasLibVlcPlayer1.GetVideoPosInMs(), true );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.pozycja_napisu + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', zti )  )   );
      Test_Memo.Lines.Add(   tlumaczenie_komunikaty_r.roznica + ': ' + Trim(  FormatFloat( '### ### ### ### ##0', Linia_Spiewu__Dol_StaticText.Top - zti )  )   );

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

  //Test_Memo.Lines.Add(  IntToStr( WheelDelta )  );

  if    ( PageControl1.Visible )
    and ( MousePos.X > Self.Width - PageControl1.Width - Opcje_Splitter.Width ) then
    Exit;


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

      Linia_Spiewu__Gora_CheckBox.Checked := not Linia_Spiewu__Gora_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_gornej, null );

    end
  else//if Key = VK_1 then
  // 2.
  if Key = VK_2 then
    begin

      Key := 0;

      Linia_Spiewu__Srodek_CheckBox.Checked := not Linia_Spiewu__Srodek_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_srodkowej, null );

    end
  else//if Key = VK_2 then
  // 3.
  if Key = VK_3 then
    begin

      Key := 0;

      Linia_Spiewu__Dol_CheckBox.Checked := not Linia_Spiewu__Dol_CheckBox.Checked;
      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.widocznosc_linii_spiewu_dolnej, null );

    end
  else//if Key = VK_3 then
  // 1 (numeryczna).
  if Key = VK_NUMPAD1 then
    begin

      Key := 0;

      Linie_Spiewu__Odstep_SpinEdit.Value := Linie_Spiewu__Odstep_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.odstep_linii_spiewu, Linie_Spiewu__Odstep_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD1 then
  // 2 (numeryczna).
  if Key = VK_NUMPAD2 then
    begin

      Key := 0;

      Linie_Spiewu__Wielkosc_SpinEdit.Value := Linie_Spiewu__Wielkosc_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wielkosc_linii_spiewu, Linie_Spiewu__Wielkosc_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD2 then
  // 3 (numeryczna).
  if Key = VK_NUMPAD3 then
    begin

      Key := 0;

      Skok_Sekundy_SpinEdit.Value := Skok_Sekundy_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.skok_o_ilosc_sekund, Skok_Sekundy_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD3 then
  // 7 (numeryczna).
  if Key = VK_NUMPAD7 then
    begin

      Key := 0;

      Linie_Spiewu__Odstep_SpinEdit.Value := Linie_Spiewu__Odstep_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.odstep_linii_spiewu, Linie_Spiewu__Odstep_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD7 then
  // 8 (numeryczna).
  if Key = VK_NUMPAD8 then
    begin

      Key := 0;

      Linie_Spiewu__Wielkosc_SpinEdit.Value := Linie_Spiewu__Wielkosc_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.wielkosc_linii_spiewu, Linie_Spiewu__Wielkosc_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD8 then
  // 9 (numeryczna).
  if Key = VK_NUMPAD9 then
    begin

      Key := 0;

      Skok_Sekundy_SpinEdit.Value := Skok_Sekundy_SpinEdit.Value + 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.skok_o_ilosc_sekund, Skok_Sekundy_SpinEdit.Value );

    end
  else//if Key = VK_NUMPAD9 then
  // , (numeryczna).
  if Key = VK_DECIMAL then
    begin

      Key := 0;

      if Karaoke_Form.WindowState <> wsMinimized then
        begin

          Application.Minimize();
          Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.minimalizuj_okno, null );

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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.czestotliwosc_zegara, Zegar_Czestotliwosc_SpinEdit.Value );

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
            Napisy__Czcionka_Ustaw( napisy_t[ i ] );

      Wymiar_Label.Visible := false;

      Screen.Cursor := crDefault;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.rozmiar_czcionki_napisow, Wymiar_Label.Font.Size );

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

                Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pelny_ekran, null );

              end
            else//if Karaoke_Form.WindowState <> wsMaximized then
              begin

                Przyciski_Panel.Visible := true;
                Karaoke_Form.WindowState := wsNormal;

                Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.normalny_ekran, null );

              end;
            //---//if Karaoke_Form.WindowState <> wsMaximized then

            Zaslona_Przerysuj();

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

          if Self.BorderStyle = bsNone then
            begin

              // Wyłącza pełny ekran.

              Pelny_Ekran_ButtonClick( nil );

            end
          else//if Self.BorderStyle = bsNone then
            begin

              if Karaoke_Form.BorderStyle <> bsSizeable then
                Karaoke_Form.BorderStyle := bsSizeable;

              if Karaoke_Form.WindowState <> wsNormal then
                begin

                  Przyciski_Panel.Visible := true;
                  Karaoke_Form.WindowState := wsNormal;

                  Karaoke_Form.Top := okno__gora;
                  Karaoke_Form.Left := okno__lewo;
                  Karaoke_Form.Height := okno__wysokosc;
                  Karaoke_Form.Width := okno__szerokosc;

                  Zaslona_Przerysuj();

                  Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.normalny_ekran, null );

                end;
              //---//if Karaoke_Form.WindowState <> wsNormal then

            end;//---//if Self.BorderStyle = bsNone then

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
            Napisy__Czcionka_Ustaw( napisy_t[ i ] );

      Wymiar_Label.Visible := false;

      Screen.Cursor := crDefault;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.rozmiar_czcionki_napisow, Wymiar_Label.Font.Size );

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
        Skok_Do__Tylu_ButtonClick( nil )
      else//if ssCtrl in Shift then
        if ssShift in Shift then
          Skok_Do__Tylu_ButtonClick( Skok_Sekundy_SpinEdit )
        else//if ssShift in Shift then
          Skok_Do__Tylu_ButtonClick( Sender );

    end
  else//if Key = VK_LEFT then
  // Kursor prawo.
  if Key = VK_RIGHT then
    begin

      Key := 0;

      if ssCtrl in Shift then
        Skok_Do__Przodu_ButtonClick( nil )
      else//if ssCtrl in Shift then
        if ssShift in Shift then
          Skok_Do__Przodu_ButtonClick( Skok_Sekundy_SpinEdit )
        else//if ssShift in Shift then
          Skok_Do__Przodu_ButtonClick( Sender );

    end
  else//if Key = VK_RIGHT then
  // L.
  if Key = VK_L then
    begin

      Key := 0;

      //Linia_Spiewu__Dol_CheckBox.Checked := Linia_Spiewu__Gora_CheckBox.Checked;
      //Linia_Spiewu__Gora_CheckBox.Checked := not Linia_Spiewu__Gora_CheckBox.Checked;
      //Linia_Spiewu__Srodek_CheckBox.Checked := Linia_Spiewu__Gora_CheckBox.Checked;


      if   ( Linia_Spiewu__Dol_CheckBox.Checked )
        or ( Linia_Spiewu__Srodek_CheckBox.Checked )
        or ( Linia_Spiewu__Gora_CheckBox.Checked ) then
        begin

          linia_spiewu__dol__widoczna := Linia_Spiewu__Dol_CheckBox.Checked;
          linia_spiewu__gora__widoczna := Linia_Spiewu__Gora_CheckBox.Checked;
          linia_spiewu__srodek__widoczna := Linia_Spiewu__Srodek_CheckBox.Checked;

          Linia_Spiewu__Dol_CheckBox.Checked := false;
          Linia_Spiewu__Gora_CheckBox.Checked := false;
          Linia_Spiewu__Srodek_CheckBox.Checked := false;

        end
      else//if   ( Linia_Spiewu__Dol_CheckBox.Checked ) (...)
        begin

          if    ( not linia_spiewu__dol__widoczna )
            and ( not linia_spiewu__srodek__widoczna )
            and ( not linia_spiewu__gora__widoczna ) then
            begin

              linia_spiewu__dol__widoczna := true;
              linia_spiewu__gora__widoczna := true;
              linia_spiewu__srodek__widoczna := true;

            end;
          //---//if    ( not linia_spiewu__dol__widoczna ) (...)

          Linia_Spiewu__Dol_CheckBox.Checked := linia_spiewu__dol__widoczna;
          Linia_Spiewu__Gora_CheckBox.Checked := linia_spiewu__gora__widoczna;
          Linia_Spiewu__Srodek_CheckBox.Checked := linia_spiewu__srodek__widoczna;

        end;
      //---//if   ( Linia_Spiewu__Dol_CheckBox.Checked ) (...)


      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.widocznosc_linii_spiewu, null );

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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu, Pozycja_Obszaru_Spiewu_SpinEdit.Value );

    end
  else//if Key = VK_PRIOR then
  // Page Down.
  if Key = VK_NEXT then
    begin

      Key := 0;

      Pozycja_Obszaru_Spiewu_SpinEdit.Value := Pozycja_Obszaru_Spiewu_SpinEdit.Value - 1;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pozycja_obszaru_spiewu, Pozycja_Obszaru_Spiewu_SpinEdit.Value );

    end
  else//if Key = VK_NEXT then
  // R.
  if Key = VK_R then
    begin

      Key := 0;

      Zaslona_Przerysuj( true );

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.odswiez_widok, null );

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

      if   ( PasLibVlcPlayer1.IsPause )
        or (
                 ( not PasLibVlcPlayer1.IsPlay() )
             and ( not PasLibVlcPlayer1.IsPause() )
           ) then
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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.test_napisu, null );

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

              Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.pelny_ekran, null );

            end
          else//if Karaoke_Form.WindowState <> wsMaximized then
            begin

              Przyciski_Panel.Visible := true;
              Karaoke_Form.WindowState := wsNormal;

              Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.normalny_ekran, null );

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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.czestotliwosc_zegara, Zegar_Czestotliwosc_SpinEdit.Value );

    end
  else//if    ( Key = VK_OEM_MINUS ) (...)
  // +.
  if    ( Key = VK_OEM_PLUS )
    and ( ssCtrl in Shift ) then
    begin

      Key := 0;

      Zegar_Czestotliwosc_SpinEdit.Value := Zegar_Czestotliwosc_SpinEdit.Value + 10;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.czestotliwosc_zegara, Zegar_Czestotliwosc_SpinEdit.Value );

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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.przesuniecie_napisow, Przesuniecie_Napisow_SpinEdit.Value );

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

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.przesuniecie_napisow, Przesuniecie_Napisow_SpinEdit.Value );

    end
  else//if Key = VK_OEM_6 then
  // '.
  if Key = VK_OEM_7 then
    begin

      Key := 0;

      Przesuniecie_Napisow_SpinEdit.Value := 0;

      Informacja_Tekst_Wyswietl( tlumaczenie_komunikaty_r.przesuniecie_napisow, Przesuniecie_Napisow_SpinEdit.Value );

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
