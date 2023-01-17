Attribute VB_Name = "Module2"
Sub Stock_market()

'Declare and set worksheet
Dim ws As Worksheet

'Loop through all stocks for one year
For Each ws In Worksheets


'Create the column headings
ws.Range("I1").Value = "Ticker"
ws.Range("J1").Value = "Yearly Change"
ws.Range("K1").Value = "Percent Change"
ws.Range("L1").Value = "Total Stock Volume"

'Define Ticker variable
Dim Ticker As String
Ticker = " "
Dim Ticker_volume As Double
Ticker_volume = 0

'Create variable to hold stock volume
'Dim stock_volume As Double
'stock_volume = 0

'Set initial and last row for worksheet
Dim Lastrow As Long
Dim i As Long
Dim j As Integer

'Define Lastrow of worksheet
Lastrow = ws.Cells(Rows.Count, 1).End(xlUp).Row

'Set new variables for prices and percent changes
Dim open_price As Double
open_price = 0
Dim close_price As Double
close_price = 0
Dim price_change As Double
price_change = 0
Dim price_change_percent As Double
price_change_percent = 0



'Do loop of current worksheet to Lastrow
For i = 2 To Lastrow

'Ticker symbol output
If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
Ticker = ws.Cells(i, 1).Value

'Calculate change in Price
close_price = ws.Cells(i, 6).Value
price_change_percent = close_price - open_price


'Fixing the open price equal zero problem
ElseIf open_price <> 0 Then
price_change_percent = (price_change_percent / open_price) * 100

End If

If ws.Cells(i, 10).Value >= 0 Then
ws.Cells(i, 10).Interior.Color = vbGreen
            Else
                ws.Cells(i, 10).Interior.Color = vbRed
        
End If

Next i

Next ws

End Sub


