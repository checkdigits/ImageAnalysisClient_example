unit sfrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, REST.Types, Vcl.ExtCtrls, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, json, Data.Cloud.CloudAPI, Data.Cloud.AzureAPI;

type
  TfrmMain = class(TForm)
    btnStart: TButton;
    memResponse: TMemo;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    edAPIURL: TLabeledEdit;
    Panel1: TPanel;
    edSubKey: TLabeledEdit;
    edImgURL: TLabeledEdit;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnStartClick(Sender: TObject);
var
  lparam : Trestrequestparameter;
  imgProcessed: bool;
  jsonObj, jsonStatus: TJSONObject;
begin
  memResponse.Lines.Clear;
  RESTClient.BaseURL := edAPIURL.Text;
  RESTRequest.Method:=rmpost;
  imgProcessed := false;
  try
    RESTRequest.Params.Clear;
    RESTResponse.RootElement := '';
    lparam := RESTRequest.Params.AddItem;
    lparam.name := 'Ocp-Apim-Subscription-Key';
    lparam.Value := edSubKey.Text;
    lparam.ContentType := ctNone;
    lparam.Kind := pkHTTPHEADER;
    //This one is Important otherwise the '==' will get url encoded
    lparam.Options := [poDoNotEncode];

    lparam := RESTRequest.Params.AddItem;
    lparam.name := 'data';
    lparam.Value := '{"url":"' + edImgURL.Text + '"}';
    lparam.ContentType := ctAPPLICATION_JSON;
    lparam.Kind := pkGETorPOST;
    RESTRequest.Execute;

    if not RESTResponse.Status.Success then
      showmessage(RESTResponse.StatusText + ' ' +
        inttostr(RESTResponse.StatusCode))
    else
    begin
      memResponse.Lines.Add(RESTResponse.JSONText);
    end;

  finally
  end;
end;

end.
