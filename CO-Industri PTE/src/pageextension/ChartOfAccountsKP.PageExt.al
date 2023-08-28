pageextension 51000 ChartOfAccountsKP extends "Chart of Accounts"
{
    actions
    {
        addlast(reporting)
        {
            action(UltimoOnEntries)
            {
                ApplicationArea = All;
                Image = AddAction;
                ToolTip = 'Set the Ultimo on entries';
                Visible = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    UltimoOnGLEntry: Codeunit UltimoOnGLEntryKP;
                begin
                    UltimoOnGLEntry.Run();
                end;
            }
        }
    }
}