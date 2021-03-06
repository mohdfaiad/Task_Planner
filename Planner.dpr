// ������� ������ ��������� "����������� �����".
// ����� ��� �������, �������� � ����
// Project ������� View Source.

program Planner;

uses
  Forms,
  Unit1 in 'Unit1.pas',
  SysUtils,
  Dialogs,
  DateUtils,
  DBTables,
  Graphics,
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '����������� �����';

 // C������� ��������� (Alias) ��
  { ��������� (��������� �� ���������� ��) ��� ������� � ���� ������ 
   ��������� �� ����� ������� ��������� � ���������� ������ ��
   ����� ������ ���������.
   ���� ������ ����� ���������� � ����������� Data ��������,
   � ������� ����������� ����������� ���� ���������.
   ��� ��������,� ������� ��������� ����������� ����
   ����� �������� ����������� � ������� ParamStr(0). }
  Session.ConfigMode := cmSession;
  Session.AddStandardAlias('Planner',   // ��������� ��
                      ExtractFilePath(ParamStr(0))+'Data\', // ������� ���������� ������ ������
                     'PARADOX');    //  ��� ��

  Application.CreateForm(TForm1, Form1);  // ��� �������� Form1 ��������� ������� Tasks.db
  Application.CreateForm(TForm2, Form2);  // ��� �������� Form2 ��������� ������� Phones.db
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);

  Form1.Label1.Caption := '������ �� �������';

  // ���������� ��������� ������ - ������ �� �������
  // Now - �������, ���������� ������� ���� � �����
  strFilter1 := '(���� = '''+FormatDateTime('dd/mm/yyyy',Now)+''')';
      // ���������� ������� �������� ������� �� ���� '����' � ���������� strFilter1,
      // ����������� � Unit1
  Form1.Table1.Filter := strFilter1;  // ������ ������ � �������� Filter
  Form1.Table1.Filtered := True;  // �������� ������

  // ������������� ������ (����������) �� ���� � �������
  Form1.Table1.IndexName := 'indDateTime';
      // ������ � ������ 'indDateTime' ��� ������ ��� �������� �������  � ������ Unit1

  Form1.Table1.Open;  // ��������� ������� � �������� �������� � ����������� �� ��������� �������

  // ��������� ���������� ������� (�������� RecordCound), ������� �������� ������� ������� (������ �� �������)
  if Form1.Table1.RecordCount > 0 then  // ���� ������, ��������������� �� �������
    ShowMessage('�� ������� ������������� '+IntToStr(Form1.Table1.RecordCount)+' ������')
  else  // ������ ������ 0 �����
    ShowMessage('�� ������� �� ����� ����� �� �������������.');

  Application.Run;  // ������ ����������
end.
