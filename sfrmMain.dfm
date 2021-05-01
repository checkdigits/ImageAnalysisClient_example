object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Image Analysis Client'
  ClientHeight = 647
  ClientWidth = 1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  StyleName = 'Sky'
  PixelsPerInch = 96
  TextHeight = 13
  object memResponse: TMemo
    Left = 377
    Top = 0
    Width = 690
    Height = 647
    Align = alClient
    BorderStyle = bsNone
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 647
    Align = alLeft
    Caption = 'Image Analysis Client'
    ShowCaption = False
    TabOrder = 1
    object btnStart: TButton
      Left = 286
      Top = 144
      Width = 75
      Height = 25
      Caption = '&Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object edAPIURL: TLabeledEdit
      Left = 15
      Top = 28
      Width = 346
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'API URL'
      TabOrder = 1
      Text = 
        'https://eastus.api.cognitive.microsoft.com/vision/v3.2/analyze?v' +
        'isualFeatures=Description'
    end
    object edSubKey: TLabeledEdit
      Left = 15
      Top = 72
      Width = 346
      Height = 21
      EditLabel.Width = 130
      EditLabel.Height = 13
      EditLabel.Caption = 'Ocp-Apim-Subscription-Key'
      TabOrder = 2
    end
    object edImgURL: TLabeledEdit
      Left = 15
      Top = 117
      Width = 346
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'Image URL'
      TabOrder = 3
      Text = 
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Atomis' +
        't_quote_from_Democritus.png/338px-Atomist_quote_from_Democritus.' +
        'png'
    end
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    ContentType = 'application/json'
    Params = <>
    Left = 920
    Top = 48
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <>
    Response = RESTResponse
    Left = 920
    Top = 112
  end
  object RESTResponse: TRESTResponse
    ContentType = 'text/plain'
    Left = 920
    Top = 176
  end
end
