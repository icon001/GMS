unit uGridFormatSetting;

interface
uses
  AdvGrid;

procedure AccessEventCellHide(aList:TAdvStringGrid);
procedure AccessEventHeaderNameSetting(aList:TAdvStringGrid);
procedure AlarmEventCellHide(aList:TAdvStringGrid);
procedure AlarmEventHeaderNameSetting(aList:TAdvStringGrid);

implementation
uses
  uFormVariable;

procedure AccessEventCellHide(aList:TAdvStringGrid);
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if G_arrAccessEventShowTable[i] = 0 then
    begin
      aList.ColWidths[G_arrDoorIndexArray[i]] := 0;
    end else
    begin
      aList.ColWidths[G_arrDoorIndexArray[i]] := G_arrAccessEventSizeTable[G_arrDoorIndexArray[i]];
    end;
  end;
end;

procedure AccessEventHeaderNameSetting(aList:TAdvStringGrid);
var
  i : integer;
begin
  aList.ColCount := AccessHeaderNameList.Count;
  for i := LOW(G_arrDoorIndexArray) to HIGH(G_arrDoorIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (AccessHeaderNameList.Count - 1) < i then Exit;

    aList.cells[G_arrDoorIndexArray[i],0] := AccessHeaderNameList[i];
  end;

end;

procedure AlarmEventCellHide(aList:TAdvStringGrid);
var
  i : integer;
begin
  for i := 0 to aList.ColCount - 1 do
  begin
    if G_arrAlarmEventShowTable[i] = 0 then
    begin
      aList.ColWidths[G_arrAlarmIndexArray[i]] := 0;
    end else
    begin
      aList.ColWidths[G_arrAlarmIndexArray[i]] := G_arrAlarmEventSizeTable[G_arrAlarmIndexArray[i]];
    end;
  end;
end;

procedure AlarmEventHeaderNameSetting(aList:TAdvStringGrid);
var
  i : integer;
begin
  aList.ColCount := AlarmHeaderNameList.Count;
  for i := LOW(G_arrAlarmIndexArray) to HIGH(G_arrAlarmIndexArray) do
  begin
    if (aList.ColCount - 1) < i then Exit;
    if (AlarmHeaderNameList.Count - 1) < i then Exit;

    aList.cells[G_arrAlarmIndexArray[i],0] := AlarmHeaderNameList[i];
  end;
end;

end.
