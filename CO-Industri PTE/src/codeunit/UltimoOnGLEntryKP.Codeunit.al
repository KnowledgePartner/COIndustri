codeunit 51000 UltimoOnGLEntryKP
{
    Permissions = tabledata 17 = rimd;
    trigger OnRun()
    var
        GLEntry: Record "G/L Entry";
        TotalEntries: Text;
        Counter: Integer;
        ProgressDialog: Dialog;
        ProgressLbl: Label 'Progress from 0 to #1 - #2', Comment = '#1 is Total Entries and #2 is the Counter';
    begin
        TotalEntries := FORMAT(GLEntry.Count());
        Counter := 0;
        ProgressDialog.OPEN(ProgressLbl, TotalEntries, Counter);
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