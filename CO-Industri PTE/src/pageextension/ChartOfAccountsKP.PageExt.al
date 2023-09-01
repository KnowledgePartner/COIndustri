pageextension 51000 ChartOfAccountsKP extends "Chart of Accounts"
{
    actions
    {
        addlast(reporting)
        {
            action("Ultimo On Entries")
            {
                CaptionML = ENU = 'Set Ultimo on Entries', DAN = 'Sæt Ultimo på Poster';
                ApplicationArea = All;
                Image = AddAction;
                ToolTipML = ENU = 'Set the Ultimo field to True on closing entries', DAN = 'Sætter feltet "Ultimo" til Ja på nulstillings poster';
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
            action("Balance/Budget KP")
            {
                ApplicationArea = Basic, Suite;
                CaptionML = ENU = 'Trial Balance/Budget CO', DAN = 'Balance/Budget CO';
                Image = "Report";
                RunObject = Report "Trial Balance/Budget CO";
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ToolTipML = DAN = 'Viser en balance, der sammenlignes med et budget. Vises uden nulstillingsposter. Du kan vælge at få vist en balance for udvalgte dimensioner. Brug denne rapport ved afslutningen af en regnskabsperiode eller ved årsafslutningen.',
                            ENU = 'Shows a trial balance in comparison to a budget. Closing entries are not taken into account. You can choose to see a trial balance for selected dimensions. Use this report at the close of an accounting period or fiscal year.';
            }
        }
    }
}