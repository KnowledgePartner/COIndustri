codeunit 51000 UltimoOnGLEntryKP
{
    Permissions = tabledata 17 = rimd;
    trigger OnRun()
    var
        GLEntry: Record "G/L Entry";
        TotalEntries: Integer;
        Counter: Integer;
        ProgressDialog: Dialog;
    //ProgressLbl: Label 'Counting to #1 ------ #2', comment = '#1 is total entries, #2 is counter';
    begin
        TotalEntries := GLEntry.Count();
        Counter := 0;
        ProgressDialog.OPEN(FORMAT(TotalEntries), Counter);
        if GLEntry.findfirst() then
            repeat
                Counter += 1;
                ProgressDialog.Update();
                if not GLEntry.Ultimo then
                    if GLEntry."Posting Date" = CLOSINGDATE(GLEntry."Posting Date") then begin
                        GLEntry.Ultimo := true;
                        GLEntry.modify();
                    end;
            until GLEntry.Next() = 0
    end;
}