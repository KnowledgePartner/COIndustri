reportextension 51000 GLRegisterKP extends "G/L Register"
{
    RDLCLayout = 'src/layouts/GLRegister.rdlc';
    dataset
    {
        add("G/L Entry")
        {
            column(Credit_Amount; "G/L Entry"."Credit Amount")
            {
            }

            column(Debit_Amount; "G/L Entry"."Debit Amount")
            {
            }
            column(Debit_AmountLbl; Debit_AmountLbl)
            {
            }
            column(Credit_AmountLbl; Credit_AmountLbl)
            {
            }
        }
    }
    var
        Credit_AmountLbl: label 'Kredit';
        Debit_AmountLbl: label 'Debit';
}